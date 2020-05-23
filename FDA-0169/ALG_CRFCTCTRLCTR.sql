CREATE OR REPLACE PROCEDURE ALG_CRFCTCTRLCTR2 (pIdtCtr          IN CTR.IdtCtr%TYPE,
                                               pIdtAcv          in AvtCtr.IdtAcv%type,
                                               pChp12           in AvtCtr.Chp12%type,
                                               pChp01           in AvtCtr.Chp01%type,
                                               pDatRsl          in CTR.DatRsl%type,
                                               pCodTypCtr       in Ctr.codtypctr%type,
                                               pCffMlp          in avtctr.cffmlp%type,
                                               pIdtDcpGgrNumOrd in varchar2,
                                               pIdtPntCpg       in PNTCPG.IdtPntCpg%TYPE,
                                               pChp02           in AVTCTR.Chp02%TYPE,
                                               pChp03           in AVTCTR.Chp03%TYPE,
                                               pIdtFacTyp       in AVTCTR.Idtfactyp%TYPE,
                                               pT5              in Ctr.T5%Type,
                                               pdatscr          in Ctr.datScr%type,
                                               pidttrf          in AVTCTR.IDTTRF%type,
                                               pT1              in Ctr.T1%type,
                                               pC1              IN VARCHAR2,
                                               pC2              IN VARCHAR2,
                                               pC3              IN VARCHAR2,
                                               pC4              IN VARCHAR2,
                                               sTypMsg          OUT VARCHAR2,
                                               sRetFctCtl       OUT VARCHAR2) IS
  --Création    : SJ
  --Date        : 23/06/2009
  --Description : Controles sur la fiche contrat:
  --1. controle usage catégorie C1- employé_seaal
  --2. Un seul contrat ayant la catégorie I et Emplyé SEAAL est autorisé pour le client.
  --3. Le nombre de locataires ne doit pas être supérieur à 1 pour les usages autres que menage collectif.
  --4. controle de la dette du client dest ou sousc en fonct où on comptabilise ces dettes de prmgnr => si positif impossible de résilier le ctr
  --5. controle de l'origine du contrat: ne doit pas être classique

  -- sTypMsg = '0' si on veux envoyer un msg d'erreur;
  -- sTypMsg = '1' si on veux envoyer un msg d'information;
  -- sTypMsg = '2' si on veux envoyer un msg "warning" - demande de confirmation;
  -- BPZ 26/02/15
  -- mantis 12414

  cMsgReturn  Sys_Msg.Msg_Code%type;
  vIdtCltSsc  CTR.IdtCltSsc%type;
  vDft        PRMGNR.Dft%type;
  vSld        OPR.sld%type;
  vNbrCtrC1ES number;
  vIdtClt     CLT.IdtClt%type;
  vIdtTypCpg  TYPCPG.IdtTypCpg%TYPE;
  vIdtPntLvr  PNTLVR.IdtPntLvr%TYPE;
  vNbr        number;
  vT5         Ctr.T5%Type;
  vForfait    AvtCtr.Chp12%type;
  NbrCpr      number;
  vC1         Ctr.C1%type;
  vC2         Ctr.C2%type;
  vC3         Ctr.C3%type;
  vC4         Ctr.C4%type;
--------------------------------------------------------------------------------
-- Procédures des contrôles unitaires --
--------------------------------------------------------------------------------
procedure Ctl_EmpSeaal(
  pIdtAcv in AvtCtr.IdtAcv%type,
  pChp12 in AvtCtr.IdtAcv%type
  sTypMsg          OUT VARCHAR2,
  sRetFctCtl       OUT VARCHAR2
) IS
begin
   -- controle usage - emplyé_seaal
  if pIdtAcv != 'C1' and pChp12 = 1 then
    sTypMsg    := '0';
    sRetFctCtl := TRTMSG01.ChercheMsg('MsgUsgES_Err001');
  end if;
  -- On sort si erreur
  if sRetFctCtl is not null then
    return;
  end if;
end Ctl_EmpSeaal;

procedure ctl_CtrUnqEmpSeaal(
  pIdtCtr in Ctr.IdtCtr%type,
  pIdtAcv in AvtCtr.IdtAcv%type,
  pChp12 in AvtCtr.IdtAcv%type
) IS
--> Un seul contrat ayant la catégorie I et Emplyé SEAAL est autorisé pour un client.
  vNbrCtrC1ES number;
  vIdtCltSsc  CTR.IdtCltSsc%type;
  vDft        PRMGNR.Dft%type;
begin
  begin
    select dft into vDft from prmgnr;

    select IdtCltSsc into vIdtCltSsc 
    from ctr where idtctr = pIdtCtr;

    vNbrCtrC1ES := 0;
    select count(*)
      into vNbrCtrC1ES
      from ctr, avtctr
      where ctr.idtctr = avtctr.idtctr
        and sqcavn = numavn
        and datrsl is null
        and decode(vDft, 0, CTR.IdtCltSsc, CTR.IdtCltDst) = vIdtCltSsc
        and IdtAcv = 'C1'
        and Chp12 = 1;

    if pIdtAcv = 'C1' and pChp12 = 1 then
      vNbrCtrC1ES := vNbrCtrC1ES + 1;
    end if;

  Exception
  when no_data_found then
    vNbrCtrC1ES := 1;
  END;

  if vNbrCtrC1ES > 1 then
    sTypMsg    := '0';
    sRetFctCtl := TRTMSG01.ChercheMsg( 'MsgUsgES_Err002');
  end if;
  -- On sort si erreur
  if sRetFctCtl is not null then
    return;
  end if;
end;

procedure Ctl_NbrLctr(
  pIdtAcv in AvtCtr.IdtAcv%type,
  pChp01 in AvtCtr.IdtAcv%type
  sTypMsg          OUT VARCHAR2,
  sRetFctCtl       OUT VARCHAR2
) IS
begin
  --> Le nombre de locataires ne doit pas être supérieur à 1 pour les usages autres que menage collectif.
  if pIdtAcv != 'C1' and pChp01 > 1 then
    sTypMsg    := '0';
    select msg_libelle
      into sRetFctCtl
      from sys_msg
     where msg_code = 'MsgNbrLoc_Err001';
  end if;
end;
--------------------------------------------------------------------------------
-- Procédure principale --
--------------------------------------------------------------------------------
BEGIN

  -- BPZ 12414
  if pIdtPntCpg is null or pIdtDcpGgrNumOrd is null then
    return;
  end if;

  --> controle usage - emplyé_seaal
  Ctl_EmpSeaal(pIdtAcv, pChp12, sTypMsg, sRetFctCtl );

  --> Un seul contrat ayant la catégorie I et Emplyé SEAAL est autorisé pour un client.
  ctl_CtrUnqEmpSeaal( pIdtCtr, pIdtAcv, pChp12, sTypMsg, sRetFctCtl );

  --> Le nombre de locataires ne doit pas être supérieur à 1 pour les usages autres que menage collectif.
  Ctl_NbrLctr(pIdtAcv, pChp01, sTypMsg, sRetFctCtl )

  -- 2nd contrôle: entre type contrat et coefficient multiplicateur
  if pCodTypCtr <> 'MENCOL' and pCffMlp <> 1 and pDatRsl is null then
    sTypMsg := '0';
    select msg_libelle
      into sRetFctCtl
      from sys_msg
     where msg_code = 'MsgUsgES_Err003';
  end if;

  -- On sort si erreur
  if sRetFctCtl is not null then
    return;
  end if;

  -- Recherche du type de comptage
  select PNTCPG.IdtPntLvr, PNTCPG.IdtTypCpg
    into vIdtPntLvr, vIdtTypCpg
    from PNTCPG, PNTLVR
   where PNTCPG.IdtPntLvr = PNTLVR.IdtPntLvr
     and PNTLVR.IdtDcpGgr = substr(pIdtDcpGgrNumOrd, 1, instr(pIdtDcpGgrNumOrd, '-', -1) - 1)
     and PNTLVR.NumOrd = substr(pIdtDcpGgrNumOrd, instr(pIdtDcpGgrNumOrd, '-', -1) + 1)
     and PNTCPG.IdtPntCpg = pIdtPntCpg;

  -- Recherche s'il existe un point de comptage general
  select count(*)
    into vNbr
    from PNTCPG
   where IdtPntLvr = vIdtPntLvr
     and IdtTypCpg = 3;

  -- Controles pour le comptage standard
  if vIdtTypCpg = 2 then
    if pCodTypCtr in ('REPEGL', 'REPPRR') then
      -- Erreur : pas possible d'avoir ce type de contrat s'il n'est pas general/divisionnaire
      sTypMsg    := '0';
      sRetFctCtl := TRTMSG01.ChercheMsg('ERR_CPGGNR0003');
      -- !!!! ERREUR, on s'arrete
      return;
    end if;
  elsif vIdtTypCpg = 3 then
    -- Controle : Le pourcentage de repartition sur le compteur general
    --            doit etre entre 0 et 100
    if pChp03 < 0 or pChp03 > 100 then
      sRetFctCtl := TRTMSG01.ChercheMsg('ERR_CPGGNR0002');
      sTypMsg    := '0';
      -- !!! ERREUR, on s'arrete
      return;
    end if;
    if pCodTypCtr not in ('REPEGL', 'REPPRR') then
      -- Erreur : Pas possible d'avoir ce type de contrat pour le compteur general
      sRetFctCtl := TRTMSG01.ChercheMsg('ERR_CPGGNR0004');
      sTypMsg    := '0';
      -- !!! ERREUR, on s'arrete
      return;
    end if;
  elsif vIdtTypCpg = 4 then
    -- Il y a un compteur general
    if vNbr > 0 then
      if pCodTypCtr not in ('REPEGL', 'REPPRR') then
        -- Alerte: Le contrat n'est pas tenu en compte pour la repartition
        sTypMsg    := '2';
        sRetFctCtl := TRTMSG01.ChercheMsg('ALR_CPGGNR0002');
      end if;
    end if;
  end if;
  -- Les points de comptage general et divisionnaire doivent avoir le meme type de
  -- contrat s'il y a une repartition a faire
  if vIdtTypCpg = 3 or
     (vIdtTypCpg = 4 and pCodTypCtr in ('REPEGL', 'REPPRR')) then
    -- On verifie s'ils existent des contrats actifs avec un type de contrat de repartition
    -- autre que celui renseigne
    select count(*)
      into vNbr
      from CTR
     where IdtPntLvr = vIdtPntLvr
       and CodTypCtr in ('REPEGL', 'REPPRR')
       and DatRsl is null
       and CodTypCtr <> pCodTypCtr
       and IdtCtr <> nvl(pIdtCtr, '0');
    if vNbr > 0 then
      -- Erreur: Pas possible d'avoir plusieurs regles de repartition
      sTypMsg    := '0';
      sRetFctCtl := TRTMSG01.ChercheMsg('ERR_CPGGNR0001');
      -- !!! ERREUR, on s'arrete
      return;
    end if;
  end if;

  /* LL: 20/12/09: SEAAL ne veut plus de ce contrôle
  --controle de la dette du client dest ou sousc en fonct où on comptabilise ces dettes de prmgnr

    if vDft=0 then
      select IdtCltSsc into vIdtClt from ctr where idtctr=pIdtCtr;
     else
      select IdtCltDst into vIdtClt from ctr where idtctr=pIdtCtr;
    end if;

    select sum(sld) into vSld from opr where sld!=0 and idtclt=vIdtClt;

    if vSld>0 and pDatRsl is not null then
     sTypMsg := '0';
     cMsgReturn :='MsgDetPos_Err001';
     select msg_libelle || to_char(vSld, '9999999.99') into sRetFctCtl from sys_msg where msg_code=cMsgReturn;
    end if;
    */
  begin
    select T5 into vT5 from Ctr where IdtCtr = pIdtCtr;
  exception
    when no_data_found then
      vT5 := null;
  end;
  if pT5 = 'OC_008' and (vT5 <> pT5 or vT5 is null) then
    sTypMsg    := 0;
    sRetFctCtl := TRTMSG01.ChercheMsg('MsgUsgES_Err004');
    return;
  end if;
-- A ajouter dans procedure ALG_CRFCTCTRLCTR
-- vérification Forfait:
  -- 54M3 pour C1 Trimestriel Forfaitaire coefficient 1
  -- 30M3 pour C1 Trimestriel Forfaitaire coefficient 1 pour 3 communes
  --
  begin
    select case
             when PntCpg.Adrstr10 in ('1635', '1637', '1656') then
              30
             else
              54
           end
      into vForfait
      from Ctr, pntcpg
     where Ctr.idtPntlvr = PntCpg.idtPntLvr
       and Ctr.idtPntCpg = PntCpg.idtPntCpg
       and Ctr.idtCtr = pIdtCtr;
  exception
    when others then
      null;
      if (vForfait <> pChp02 and pIdtFacTyp like 'TRMFRF' and pCffMlp = 1 and
         pIdtAcv = 'C1') then
        sTypMsg    := 0;
        sRetFctCtl := TRTMSG01.ChercheMsg('ERR_CTR0006');
        return;
      end if;
end;

/* Controle Champs Remontées*/
begin
    -- Récupérer les valeurs depuis la table
    begin
      Select C1, C2, C3, C4 into vC1, vC2, vC3, vC4 
      from Ctr 
      where IdtCtr = pIdtCtr;
    exception
      when no_data_found then
        /* cas d'un nouveau contrat */
        begin
          case
          /* ne pas décocher C1 et C2 et C3 et C4*/
            when (pC1 + pC2 + pC3+ pC4 = 0) then
              sTypMsg    := '0';
              sRetFctCtl := 'Vous devez choisir un type de Remonté';
              /* ne pas cocher plus d'un choix*/
            when (pC1 + pC2 + pC3+ pC4 > 1) then
              sTypMsg    := '0';
              sRetFctCtl := 'Vous ne pouvez pas choisir plus d''un type de Remonté';
              /* ne pas cocher C3*/
            when pC3 = 1 then
              sTypMsg    := '0';
              sRetFctCtl := 'Vous ne pouvez pas choisir Remontée Classique';
            else
              null;
          end case;
        end;
      when others then
        sTypMsg    := '0';
        sRetFctCtl := 'Erreur';
    end;
    case
    /* ne pas décocher C1 et C2 et C3 et C4*/
      when (pC1 + pC2 + pC3 +pC4 = 0) then
        sTypMsg    := '0';
        sRetFctCtl := 'Vous devez choisir un type de Remonté';
        /* ne pas cocher C3*/
      when (vC3 = 0 and pC3 = 1) then
        sTypMsg    := '0';
        sRetFctCtl := 'Vous ne pouvez pas choisir Remontée Classique';
        /* ne pas cocher plus d'un choix*/
      when (pC1 + pC2 + pC3 + pC4 > 1) then
        sTypMsg    := '0';
        sRetFctCtl := 'Vous ne pouvez pas choisir plus d''un type de Remonté';
      else
        sTypMsg := '0';
    end case;


    /* Interdire l'incohérence entre tarif et USAGE  et Usage détaille*/

   begin
   case
    /* tarif =CAT01 et usage <> C1*/
      when  pidttrf= 'CAT01' and pidtacv <> 'C1'  then
        sTypMsg    := '0';
        sRetFctCtl := 'Seul l''usage C1 est autorisé pour ce Tarif';
       /* tarif =CAT02 et usage <> C2 ou C3*/
      when  pidttrf= 'CAT02' and pidtacv not in ('C2','C3') then
        sTypMsg    := '0';
        sRetFctCtl := 'Seul l''usage C2 ou C3 est autorisé pour ce Tarif';
       /* tarif =CAT03 et usage <> C4*/
      when  pidttrf= 'CAT03' and pidtacv <> 'C4'  then
        sTypMsg    := '0';
        sRetFctCtl := 'Seul l''usage C4 est autorisé pour ce Tarif';

      /*  interdire l'incoherence entre usage est usage détaillé

      /* tarif =CAT01 et usage = C1 et  usage detaille <> C1_xxx  */
      when  pidttrf= 'CAT01' and pidtacv = 'C1' and substr(pT1,1,2)<> 'C1' then
        sTypMsg    := '0';
        sRetFctCtl := 'Seul l''usage détaillé qui commence par C1 est autorisé pour cet Usage';

       /* tarif =CAT02 et usage = C2 et  usage detaille <> C2_xxx  */
      when  pidttrf= 'CAT02' and pidtacv = 'C2'and substr(pT1,1,2)<>'C2'then
        sTypMsg    := '0';
        sRetFctCtl := 'Seul l''usage détaillé qui commence par C2 est autorisé pour cet Usage';
         /* tarif =CAT02 et usage = C3 et  usage detaille <> C3_xxx  */
      when  pidttrf= 'CAT02' and pidtacv = 'C3' and substr(pT1,1,2)<> 'C3' then
        sTypMsg    := '0';
        sRetFctCtl := 'Seul l''usage détaillé qui commence par  C3 est autorisé pour cet Usage';

        /* tarif =CAT03 et usage = C4 et  usage detaille <> C4_xxx  */
      when  pidttrf= 'CAT03' and pidtacv = 'C4' and substr(pT1,1,2)<> 'C4' then
        sTypMsg    := '0';
        sRetFctCtl := 'Seul l''usage détaillé qui commence par C4 est autorisé pour cet Usage';
     else
        sTypMsg := '0';
    end case;

   end;

  /* le régime de facturation et l'existence d'un compteur*/


       SELECT  nvl( count(*) , 0) into NbrCpr
       FROM cprpntcpg , pntlvr
       WHERE
        cprpntcpg.idtpntlvr=pntlvr.idtpntlvr
        And pntlvr.idtdcpggr||'-'||pntlvr.numord=pidtdcpggrnumord
        AND idtpntcpg = pidtpntcpg
        AND datdps IS NULL;


    if substr(pidtfactyp, 4,3)= 'RLV' and NbrCpr =0 then
      sTypMsg    := '0';
      sRetFctCtl := 'Facture type choisie n''est pas adéquate ';
    else
      if substr(pidtfactyp, 4,3)= 'FRF' and NbrCpr >0 then
        sTypMsg    := '0';
        sRetFctCtl := 'Facture type choisie n''est pas adéquate ';
      else
        sTypMsg := '0';
      end if;
    end if;

 end;


/*control DAF */
  begin
    -- Récupérer les valeurs depuis la table
    begin
      Select  C4, T5 into  vC4, vT5 from Ctr where IdtCtr = pIdtCtr;
        exception
      when no_data_found then
        -- cas d'un nouveau contrat
        /* ne coche pas remonté DAF  si origine client est différent du DAF*/
        begin
            case
              when pT5 <> 'OC_012' and pC4= 1 then
                sTypMsg    := '0';
                sRetFctCtl := 'L''Origine client ne correspond pas à la Remonté choisie1';
              when pT5 = 'OC_012' and pC4= 0 then
                sTypMsg    := '0';
                sRetFctCtl := 'L''Origine client ne correspond pas à la Remonté choisie2';
            else
                  null;
            end case;
        end;
      when others then
        sTypMsg    := '0';
        sRetFctCtl := 'Erreur';
    end;

    /* cas d'ancien contrat */
    if vT5 is not null then
      begin
        if  vT5 = 'OC_012' then
          /* ne pas changer l'origine client de DAF vers un autre origine client dans ancien contrat */
          if vC4 =1 and (pT5 <>'OC_012' or pC4 = 0) then
            sTypMsg    := '0';
            sRetFctCtl := 'Veuillez remettre l''Origine Client DAF et la Remontée DAF ';
            return;
          end if;
        else
          /*  pour ancien contrat non DAF  on les changera pas a DAF*/
          if pT5 ='OC_012' or pC4 =1  then
            sTypMsg    := '0';
            sRetFctCtl := 'Vous ne pourrez pas choisir l''Origine Client DAF et la Remontée DAF ';
            return;
          end if;
        end if;
      end;
    end if;

  end;
  return;
end ALG_CRFCTCTRLCTR2;
  /