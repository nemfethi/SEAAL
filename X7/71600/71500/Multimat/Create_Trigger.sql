DROP TRIGGER X7.MMT_TRAID_TRSJNT;

CREATE OR REPLACE TRIGGER X7.MMT_TRAID_TRSJNT
  for insert or delete ON X7.TRSJNT
compound trigger

-- FBE: 26/09/2014: Gestion de la synchronisation des tiers proprietaire/locataire entre le PDL et le PDC
-- SJ : 13/02/2016: traitement de la fiche 14721 
  type typTABNUMBER is table of number index by binary_integer;
  type typTABVARHAR2_20 is table of varchar2(20) index by binary_integer;
  tIdtPntLvr typTABNUMBER;
  tIdtTrs typTABVARHAR2_20;
  i binary_integer := 0;
--
   table_in_use exception;
   pragma exception_init (table_in_use , -04091); 

  AFTER EACH ROW is 

 BEGIN
    -- Remplissage des points de livraison traites
    i := i + 1;
    if inserting then
      tIdtPntLvr(i) := :NEW.IdtPntLvr;
      tIdtTrs(i) := :NEW.IdtTrs;
    elsif deleting then
      tIdtPntLvr(i) := :OLD.IdtPntLvr;
      tIdtTrs(i) := :OLD.IdtTrs;
    end if;
 END AFTER EACH ROW;
--
  AFTER STATEMENT is 
  BEGIN
    if inserting then
      -- Insertion des tiers sur le PDL s'il n'existe pas
      forall i in 1..tIdtPntLvr.Count
	   
        insert into TRSJNT (IdtTrs, IdtPntLvr)
          select distinct TRSCPG.IdtTrs, 
                 TRSCPG.IdtPntLvr
            from TRSJNT TRSCPG,
                 (select TRSJNT.IdtPntLvr,
                         TRSJNT.IdtTrs
                    from TRSJNT
                    where IdtPntLvr = tIdtPntLvr(i)
                     and  IdtPntCpg is null) TRSLVR,
                 TRS_VIEW1 TRS
            where TRSCPG.IdtPntLvr = tIdtPntLvr(i)
             and  TRSCPG.IdtPntCpg is not null
             and  TRSLVR.IdtTrs(+) = TRSCPG.IdtTrs
             and  TRSLVR.IdtPntLvr(+) = TRSCPG.IdtPntLvr
             and  TRSLVR.IdtTrs is null -- Tiers non existant
             and  TRSCPG.IdtTrs = TRS.IdtTrs
             and  TRS.IdtTypTrs in (3,4);
	

      -- Insertion des tiers sur les PDCs s'ils n'existent pas
      forall i in 1..tIdtPntLvr.Count
	  
        insert into TRSJNT (IdtTrs, IdtPntLvr, IdtPntCpg)
          select distinct TRSLVR.IdtTrs, 
                 TRSLVR.IdtPntLvr,
                 PNTCPG.IdtPntCpg
            from TRSJNT TRSLVR,
                 PNTCPG,
                 TRS_VIEW1 TRS
            where TRSLVR.IdtPntLvr = tIdtPntLvr(i)
             and  TRSLVR.IdtPntCpg is null
             and  PNTCPG.IdtPntLvr = TRSLVR.IdtPntLvr
             and  TRSLVR.IdtTrs = TRS.IdtTrs
             and  TRS.IdtTypTrs in (3,4)
             and  (TRSLVR.IdtTrs,
                   TRSLVR.IdtPntLvr,
                   PNTCPG.IdtPntCpg) not in (select IdtTrs,
                                                    IdtPntLvr,
                                                    IdtPntCpg
                                               from TRSJNT
                                               where IdtPntLvr = tIdtPntLvr(i)
                                                and  IdtPntCpg is not null);
		
    elsif deleting then
      forall i in 1..tIdtPntLvr.Count
        delete TRSJNT
          where IdtPntLvr = tIdtPntLvr(i)
           and  IdtTrs = tIdtTrs(i)
           and  IdtTrs in (select IdtTrs
                             from TRS_VIEW1 TRS
                             where TRS.IdtTypTrs in (3,4));
    end if;
  EXCEPTION when table_in_use then RAISE_APPLICATION_ERROR(x7util.erreur_x7() ,'Table TRSJNT utilisée. Essayez plus tard!');  
  END AFTER STATEMENT;

END;
/
