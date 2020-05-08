CREATE OR REPLACE PACKAGE BODY IMPCLT.ALG_IMPCLT is

  Procedure Load_File is
    v_maxImp number;
  begin
    /*
    Charge la table intermédiaire IMPCLT.depuis
    la table externe IMPDATA
    */
    select nvl(max(idtimpent), 0) + 1 into v_maxImp from impent;
    Nettoyage;
    insert into impclt.impclt
      (idtimpclt,
       num,
       idtcntopr,
       idtqlt,
       nom,
       --idtctgclt,
       --adrlbr,
       num_rue,
       bister,
       codcmn,
       RUE,
       TYPRUE,
       BT,
       ESC,
       ETG,
       APP,
       COMPl,
       idttrntyp,
       pntlvr,
       rng1,
       idtfactyp,
       idtacv,
       code_usage,
       forfait,
       DatDbt,
       numcpr,
       idttypcpr,
       indpos,
       datpos,
       datscr,
       --codtypctr,
       remontee,
       oc,
       secdist)
      select v_maxImp,
             numero,
             codeco,
             codqlt,
             nom,
             --categorie,
             --adresse_libre,
             num_rue,
             bister,
             codecommune,
             RUE,
             TYPRUE,
             BT,
             ESC,
             ETG,
             APP,
             COMPl,
             tournee,
             pntlvr,
             rang,
             facture_type,
             activite,
             code_usage,
             forfait,
             to_date(DatDbt, 'DD/MM/YYYY'),
             numcpr,
             type_cpr,
             indpos,
             to_date(datpos, 'DD/MM/YYYY'),
             to_date(datscr, 'DD/MM/YYYY'),
             --typecontrat,
             remontee,
             oc,
             secdist
        from impdata;
  
    insert into impent (idtimpent, datimp) values (v_maxImp, sysdate);
  
    insert into migr_clt
      (idtsqc,
       idtcntopr,
       idtqlt,
       nom,
       --idtctgclt,
       --adrlbr,
       Adrstr1,
       adrstr2,
       adrstr10,
       AdrStr4,
       Adrstr3,
       AdrStr5,
       AdrStr6,
       AdrStr7,
       AdrStr8,
       AdrStr9,
       idttrntyp,
       idtdcpggr,
       numord,
       IdtPntLvr,
       rng1,
       idtfactyp,
       idtacv,
       chp02,
       datscr,
       DatDbt,
       numcpr,
       idttypcpr,
       Ctr_c1,
       Ctr_c2,
       Ctr_c3,
       Ctr_c4,
       Ctr_IdtT1,
       Ctr_T1,
       Ctr_IdtT5,
       Ctr_T5,
       indpos,
       datpos,
       pntcpg_a3,
       swmgr)
      select num,
             ImpClt.idtcntopr,
             idtqlt,
             nom,
             --idtctgclt,
             --adrlbr,
             num_rue,
             bister,
             codcmn,
             RUE,
             TYPRUE,
             BT,
             ESC,
             ETG,
             APP,
             COMPl,
             idttrntyp,
             substr(pntlvr, 1, instr(pntlvr, '-', -1) - 1) idtdcpggr,
             substr(pntlvr, instr(pntlvr, '-', -1) + 1) numord,
             IdtPntLvr,
             rng1,
             idtfactyp,
             idtacv,
             forfait,
             datscr,
             DatDbt,
             numcpr,
             idttypcpr,
             case
               when remontee = 'C1' then
                1
               else
                0
             end CTR_C1,
             case
               when remontee = 'C2' then
                1
               else
                0
             end CTR_C2,
             case
               when remontee = 'C3' then
                1
               else
                0
             end CTR_C3,
             case
               when remontee = 'C4' then
                1
               else
                0
             end CTR_C4,
             'UD',
             code_usage,
             'OC',
             OC,
             indpos,
             datpos,
             secdist,
             0
        from IMPCLT, x7.pntlvr p
       where p.IDTDCPGGR(+) = substr(pntlvr, 1, instr(pntlvr, '-', -1) - 1)
         and p.numord(+) = substr(pntlvr, instr(pntlvr, '-', -1) + 1);
  
    insert into migr_clt3
      (idtsqc,
       idtcntopr,
       idtqlt,
       nom,
       --idtctgclt,
       --adrlbr,
       adrstr10,
       AdrStr4,
       Adrstr3,
       AdrStr5,
       AdrStr6,
       AdrStr7,
       AdrStr8,
       AdrStr9,
       idttrntyp,
       idtdcpggr,
       numord,
       rng1,
       idtfactyp,
       idtacv,
       DatDbt,
       numavn,
       cffmlp,
       numcpr,
       idttypcpr,
       Chp02,
       Chp11,
       chp13,
       swmgr)
      select num,
             idtcntopr,
             idtqlt,
             nom,
             --idtctgclt,
             --adrlbr,
             codcmn,
             RUE,
             TYPRUE,
             BT,
             ESC,
             ETG,
             APP,
             COMPl,
             idttrntyp,
             substr(pntlvr, 1, instr(pntlvr, '-', -1) - 1) idtdcpggr,
             substr(pntlvr, instr(pntlvr, '-', -1) + 1) numord,
             rng1,
             idtfactyp,
             idtacv,
             DatDbt,
             1,
             1,
             numcpr,
             idttypcpr,
             forfait,
             1,
             case
               when idtacv in ('C2', 'C4') then
                1
               else
                0
             end,
             0
        from IMPCLT;
  
    commit;
    -- Fne ne pas renuméroter NumOrd sur PntLvr
    -- FNE renum pour IdtPntLvr is null
    RenumOrd;
  
    commit;
  
    update MIGR_Clt
       set IdtCpr =
           (select Cpr.IdtCpr
              from X7.Cpr, X7.CPRPNTCPG
             where numcpr = Migr_Clt.Numcpr
               and Cpr.IdtCpr = CprPntCpg.IdtCpr(+)
               and CprPntCpg.IdtCpr is null);
  
    commit;
  exception
    when others then
      raise;
  end Load_File;

  Procedure Renumord is
    i             number;
    vOldIdtDcpGgr varchar2(50) := 'zzz';
    vNumOrd       number;
    cursor cCur is
      select nvl(migr_Clt.IdtDcpGgr, migr_prm.idtdcpggr) idtdcpggr
        from MIGR_CLT, migr_prm
       where migr_clt.idtpntlvr is null
       order by nvl(migr_Clt.IdtDcpGgr, migr_prm.idtdcpggr)
         for update of NumOrd;
  BEGIN
  
    for rCur in cCur loop
      begin
        select nvl(max(numord), 0)
          into vNumOrd
          from x7.pntlvr
         where IDTDCPGGR = rCUR.IdtDcpGgr;
      end;
      if rCur.IdtDcpGgr <> vOldIdtDcpGgr then
        i             := 1;
        vOldIdtDcpGgr := rCUR.IdtDcpGgr;
      end if;
      update MIGR_CLT set NumOrd = i + vNumOrd where current of cCur;
      i := i + 1;
    end loop;
    commit;
  END RenumOrd;

  Procedure Ctrl_Data is
    vrgldft number(1);
  begin
    /* Controles des données avant import*/
    -- 1. Nom de l'abonné non renseigné
    update MIGR_CLT
       set SwMgr = 1
     where nom is null
       and EXISTS (select IdtCtrl
              from PRMCONTROL
             where IdtCtrl = 1
               and Utl = 1);
  
    insert into IMPCLT_ctrl
      (IdtCtrl, IdtSqc)
      select SwMgr, IdtSqc from MIGR_CLT where SwMgr = 1;
    commit;
    select rgldft
      into vrgldft
      from PRMCONTROL
     where idtctrl = 1
       and utl = 1;
    if vrgldft = 1 then
      update migr_clt set swmgr = 0 where swmgr = 1;
      commit;
    end if;
    -- 2. Longueur du nom de l'abonné n'est pa correcte
    update MIGR_CLT
       set SwMgr = 2
     where (length(nom) > 40 or length(nom) < 2)
       and EXISTS (select IdtCtrl
              from PRMCONTROL
             where IdtCtrl = 2
               and Utl = 1);
    insert into IMPCLT_ctrl
      (IdtCtrl, IdtSqc)
      select SwMgr, IdtSqc from MIGR_CLT where SwMgr = 2;
    commit;
  
    select rgldft
      into vrgldft
      from PRMCONTROL
     where idtctrl = 2
       and utl = 1;
    if vrgldft = 1 then
      update migr_clt set swmgr = 0 where swmgr = 2;
      commit;
    end if;
    -- 3. La sensibilité du client n’est pas renseignée / est erronée
    update MIGR_CLT
       set SwMgr = 3
     where (idtCodSns is null or
           idtcodsns not in (select idtcodsns from x7.codsns))
       and EXISTS (select IdtCtrl
              from PRMCONTROL
             where IdtCtrl = 3
               and Utl = 1);
    insert into IMPCLT_ctrl
      (IdtCtrl, IdtSqc)
      select SwMgr, IdtSqc from MIGR_CLT where SwMgr = 3;
    commit;
  
    select rgldft
      into vrgldft
      from PRMCONTROL
     where idtctrl = 3
       and utl = 1;
    if vrgldft = 1 then
      update migr_clt set swmgr = 0 where swmgr = 3;
      commit;
    end if;
    -- 4. La catégorie du client n’est pas renseignée / est erronée
    update MIGR_CLT
       set SwMgr = 4
     where (IdtCtgClt is null or
           IdtCtgClt not in (select IdtCtgClt from x7.CtgClt))
       and EXISTS (select IdtCtrl
              from PRMCONTROL
             where IdtCtrl = 4
               and Utl = 1);
    insert into IMPCLT_ctrl
      (IdtCtrl, IdtSqc)
      select SwMgr, IdtSqc from MIGR_CLT where SwMgr = 4;
    commit;
  
    select rgldft
      into vrgldft
      from PRMCONTROL
     where idtctrl = 4
       and utl = 1;
    if vrgldft = 1 then
      update migr_clt set swmgr = 0 where swmgr = 4;
      commit;
    end if;
    -- 5. Le centre opérationnel du client n’est pas renseigné / est erroné
    update MIGR_CLT
       set SwMgr = 5
     where (IdtCntopr is null or
           IdtCntOpr not in (select IdtCntOpr from x7.CntOpr))
       and EXISTS (select IdtCtrl
              from PRMCONTROL
             where IdtCtrl = 5
               and Utl = 1);
    insert into IMPCLT_ctrl
      (IdtCtrl, IdtSqc)
      select SwMgr, IdtSqc from MIGR_CLT where SwMgr = 5;
    commit;
  
    select rgldft
      into vrgldft
      from PRMCONTROL
     where idtctrl = 5
       and utl = 1;
    if vrgldft = 1 then
      update migr_clt set swmgr = 0 where swmgr = 5;
      commit;
    end if;
    -- 6. La codification géographique n’est pas correcte
    update MIGR_CLT
       set SwMgr = 6
     where (IdtDcpGgr is null or
           IdtDcpGgr not in (select IdtDcpGgr from x7.DcpGgr))
       and EXISTS (select IdtCtrl
              from PRMCONTROL
             where IdtCtrl = 6
               and Utl = 1);
    insert into IMPCLT_ctrl
      (IdtCtrl, IdtSqc)
      select SwMgr, IdtSqc from MIGR_CLT where SwMgr = 6;
    commit;
  
    select rgldft
      into vrgldft
      from PRMCONTROL
     where idtctrl = 6
       and utl = 1;
    if vrgldft = 1 then
      update migr_clt set swmgr = 0 where swmgr = 6;
      commit;
    end if;
    -- 7. La date de souscription du contrat n’est pas renseignée / est erronée
    update MIGR_CLT
       set SwMgr = 7
     where DatScr is null
       and EXISTS (select IdtCtrl
              from PRMCONTROL
             where IdtCtrl = 7
               and Utl = 1);
    insert into IMPCLT_ctrl
      (IdtCtrl, IdtSqc)
      select SwMgr, IdtSqc from MIGR_CLT where SwMgr = 7;
    commit;
  
    select rgldft
      into vrgldft
      from PRMCONTROL
     where idtctrl = 7
       and utl = 1;
    if vrgldft = 1 then
      update migr_clt set swmgr = 0 where swmgr = 7;
      commit;
    end if;
    -- 8. La facture type du contrat n’est pas renseignée / est erronée
    update MIGR_CLT
       set SwMgr = 8
     where (IdtFacTyp is null or
           IdtFacTyp not in (select IdtFacTyp from x7.FacTyp))
       and EXISTS (select IdtCtrl
              from PRMCONTROL
             where IdtCtrl = 8
               and Utl = 1);
    insert into IMPCLT_ctrl
      (IdtCtrl, IdtSqc)
      select SwMgr, IdtSqc from MIGR_CLT where SwMgr = 8;
    commit;
  
    select rgldft
      into vrgldft
      from PRMCONTROL
     where idtctrl = 8
       and utl = 1;
    if vrgldft = 1 then
      update migr_clt set swmgr = 0 where swmgr = 8;
      commit;
    end if;
    -- 9. Le Type du compteur est inconnu
    update MIGR_CLT
       set SwMgr = 9
     where (IdtTypCpr is null or
           IdtTypCpr not in (select IdtTypCpr from x7.TypCpr))
       and EXISTS (select IdtCtrl
              from PRMCONTROL
             where IdtCtrl = 9
               and Utl = 1);
    insert into IMPCLT_ctrl
      (IdtCtrl, IdtSqc)
      select SwMgr, IdtSqc from MIGR_CLT where SwMgr = 9;
    commit;
  
    select rgldft
      into vrgldft
      from PRMCONTROL
     where idtctrl = 9
       and utl = 1;
    if vrgldft = 1 then
      update migr_clt set swmgr = 0 where swmgr = 9;
      commit;
    end if;
    -- 10. Tournée Type inconnue
    update MIGR_CLT
       set SwMgr = 10
     where (IdtTrnTyp is null or
           IdtTrnTyp not in (select idttrntyp from x7.trntyp))
       and EXISTS (select IdtCtrl
              from PRMCONTROL
             where IdtCtrl = 10
               and Utl = 1);
    update MIGR_CLT
       set SwMgr = 10
     where (IdtTrnTyp is null or
           IdtTrnTyp not in (select idttrntyp from x7.trntyp))
       and EXISTS (select IdtCtrl
              from PRMCONTROL
             where IdtCtrl = 10
               and Utl = 1);
    insert into IMPCLT_ctrl
      (IdtCtrl, IdtSqc)
      select SwMgr, IdtSqc from MIGR_CLT where SwMgr = 10;
    commit;
    -- 11. Compteurs en Double
    update MIGR_CLT
       set SwMgr = 11
     where numcpr in (select numcpr
                        from impclt.migr_clt
                       group by numcpr
                      having count(*) > 1)
       and EXISTS (select IdtCtrl
              from PRMCONTROL
             where IdtCtrl = 11
               and Utl = 1);
    update MIGR_CLT
       set SwMgr = 11
     where numcpr in (select numcpr
                        from impclt.migr_clt
                       group by numcpr
                      having count(*) > 1)
       and EXISTS (select IdtCtrl
              from PRMCONTROL
             where IdtCtrl = 11
               and Utl = 1);
    insert into IMPCLT_ctrl
      (IdtCtrl, IdtSqc)
      select SwMgr, IdtSqc from MIGR_CLT where SwMgr = 11;
    -- 12. Compteurs deja posé avec historique
    update MIGR_CLT
       set SwMgr = 12
     where numcpr in (select numcpr
                        from impclt
                      intersect
                      select numcpr
                        from X7.CPR, X7.CPRPNTCPG
                       where Cpr.IdtCpr = CprPntCpg.IdtCpr)
       and EXISTS (select IdtCtrl
              from PRMCONTROL
             where IdtCtrl = 12
               and Utl = 1);
    insert into IMPCLT_ctrl
      (IdtCtrl, IdtSqc)
      select SwMgr, IdtSqc from MIGR_CLT where SwMgr = 12;

    -- 13. Compteurs deja posé avec historique de relève
    update MIGR_CLT
       set SwMgr = 13
     where numcpr in (select numcpr
                        from impclt
                      intersect
                      select numcpr
                        from X7.CPR, X7.IND
                       where Cpr.IdtCpr = Ind.IdtCpr)
       and EXISTS (select IdtCtrl
              from PRMCONTROL
             where IdtCtrl = 13
               and Utl = 1);
    insert into IMPCLT_ctrl
      (IdtCtrl, IdtSqc)
      select SwMgr, IdtSqc from MIGR_CLT where SwMgr = 13;
  
    /* on refait un passage pour les controles bloquants*/
    -- 2. Longueur du nom de l'abonné n'est pa correcte
    update MIGR_CLT
       set SwMgr = 2
     where (length(nom) > 40 or length(nom) < 2)
       and EXISTS (select IdtCtrl
              from PRMCONTROL
             where IdtCtrl = 2
               and Utl = 1);
    /*Temporaire FNE: Renumerotaion NUMCPR déjà existants*/
    -- update migr_clt
    --    set numcpr = 'IMP' || to_char(rownum) || '-' || numcpr
    --  where numcpr in
    --        (select numcpr from migr_clt intersect select numcpr from X7.Cpr);
    -- commit;
  end;

  procedure Nettoyage is
  begin
    /*Vide la table intermédiaire IMPCLT.*/
    execute immediate 'truncate table IMPCLT.IMPCLT';
    execute immediate 'truncate table IMPCLT.Migr_Clt';
    execute immediate 'truncate table IMPCLT.Migr_Clt3';
    execute immediate 'truncate table IMPCLT.IMPCLT_Ctrl';
  
  end;

  procedure rapport_post_import is
  begin
    null;
  end;

  PROCEDURE Import is
    vRfrClt       MIGR_CLT.RfrClt%TYPE;
    vNumAvn       X7.AVTCTR.NumAvn%TYPE := 1;
    vDatFin       date;
    tcur_MIGR_CLT MIGRATION.typLstMIGR_CLT;
    rMIGR_CLT     MIGR_CLT%ROWTYPE;
    vseq          number;
    vIdtPntLvr    x7.PntLvr.IDTPNTLVR%type;
    --NCpr Number;
    cursor cMIGR_CLT is
      select * from MIGR_CLT where SwMgr = 0 order by idtsqc;
    cursor cMIGR_CLT3 is
      select * from MIGR_CLT3 where idtsqc = vRfrClt order by NumAvn;
    cursor cMigr_PntCpg is
      select * from migr_clt where IdtPntLvr = vIdtPntLvr;
  BEGIN
    MIGRATION.Err_TableName := STACK.MakeTable;
    MIGRATION.Err_IdtPck    := 'IMPORTABONNE';
    MIGRATION.Err_Msg       := 'import Startup';
    STACK.InsertItem(MIGRATION.Err_TableName, 'MIGRATIONCLT');
  
    -----------------------------------------------------------------------
    MIGRATION.Err_Msg := 'Migration''s sequences values definition';
    -- NOTE : Sequences initialized with default value (null)
    -----------------------------------------------------------------------
  
    MIGRATION.gMinIdtCtr    := null;
    MIGRATION.gMinIdtFac    := null;
    MIGRATION.gMinIdtPntLvr := null;
    MIGRATION.gMinIdtCpr    := null;
    MIGRATION.gMinIdtClt    := null;
    MIGRATION.gMinIdtOpr    := null;
    MIGRATION.gMinIdtLtt    := null;
    MIGRATION.gMinIdtNote   := null;
    MIGRATION.gMinIdtLgnCss := null;
  
    MIGRATION.gMaxIdtCtr    := null;
    MIGRATION.gMaxIdtFac    := null;
    MIGRATION.gMaxIdtPntLvr := null;
    MIGRATION.gMaxIdtCpr    := null;
    MIGRATION.gMaxIdtClt    := null;
    MIGRATION.gMaxIdtOpr    := null;
    MIGRATION.gMaxIdtLtt    := null;
    MIGRATION.gMaxIdtNote   := null;
    MIGRATION.gMaxIdtLgnCss := null;
  
    -----------------------------------------------------------------------
    MIGRATION.Err_Msg := 'Charge of default parameters for migration processes';
    -----------------------------------------------------------------------
    MIGRATION.CHGPRM;
    open cMIGR_CLT;
    loop
      fetch cMIGR_CLT bulk collect Save Exceptions
        into tcur_MIGR_CLT limit 1000;
      ---------------------------------------------------------------------
      MIGRATION.Err_Msg := 'Startup of client Creation';
      ---------------------------------------------------------------------
      for i1 in 1 .. tcur_MIGR_CLT.count loop
        MIGRATION.ASGPRM(tcur_MIGR_CLT(i1));
        ---------------------------------------------------------------------
        MIGRATION.Err_Msg := 'Creation of customer';
        ---------------------------------------------------------------------
        MIGRATION.INSCLT(tcur_MIGR_CLT(i1));
      
        -- FNE ** if nvl(tcur_MIGR_CLT(i1).NOT2MIGR, 'N') <> 'O' then
        ---------------------------------------------------------------------
        MIGRATION.Err_Msg := 'Creation of delivery point';
        ---------------------------------------------------------------------
        MIGRATION.ASGPRM(tcur_MIGR_CLT(i1));
        MIGRATION.INSPNTLVR(tcur_MIGR_CLT(i1));
      
        vIdtPntLvr := tcur_MIGR_CLT(i1).IdtPntLvr;
        for rMIGR_PntCpg in cMIGR_PntCpg loop
          null;
        end loop;
        ---------------------------------------------------------------------
        MIGRATION.Err_Msg := 'Creation of meter point';
        ---------------------------------------------------------------------
        -- une boucle pour créer les PntCpg du PL
        MIGRATION.ASGPRM(tcur_MIGR_CLT(i1));
        MIGRATION.INSPNTCPG(tcur_MIGR_CLT(i1));
      
        if tcur_MIGR_CLT(i1).EtatCpt <> '41' then
          ---------------------------------------------------------------------
          MIGRATION.Err_Msg := 'Migration of contract';
          ---------------------------------------------------------------------
          MIGRATION.ASGPRM(tcur_MIGR_CLT(i1));
          MIGRATION.INSCTR(tcur_MIGR_CLT(i1));
        
          ---------------------------------------------------------------------
          MIGRATION.Err_Msg := 'Migration of AVTCTR';
          ---------------------------------------------------------------------
        
          MIGRATION.ASGPRM(tcur_MIGR_CLT(i1));
          tcur_MIGR_CLT(i1).NumAvn := 0;
          vNumAvn := 1;
          vRfrClt := tcur_MIGR_CLT(i1).IdtSqc;
          rMIGR_CLT := tcur_MIGR_CLT(i1);
          for rMIGR_CLT3 in cMIGR_CLT3 loop
            rMIGR_CLT.NumAvn    := rMIGR_CLT3.NumAvn;
            rMIGR_CLT.IdtFacTyp := rMIGR_CLT3.IdtFacTyp;
            rMIGR_CLT.IdtAcv    := rMIGR_CLT3.IdtAcv;
            rMIGR_CLT.IdtTrf := case
                                  when rMIGR_CLT3.IdtAcv = 'C1' then
                                   'CAT01'
                                  when rMIGR_CLT3.IdtAcv in ('C2', 'C3') then
                                   'CAT02'
                                  when rMIGR_CLT3.IdtAcv = 'C4' then
                                   'CAT03'
                                  else
                                   'CAT01'
                                end;
            rMIGR_CLT.DatDbt    := rMIGR_CLT3.DatDbt;
            rMIGR_CLT.DatFin    := rMIGR_CLT3.DatFin;
            rMIGR_CLT.Chp01     := rMIGR_CLT3.Chp01;
            rMIGR_CLT.Chp02     := rMIGR_CLT3.Chp02;
            rMIGR_CLT.Chp11     := rMIGR_CLT3.Chp11;
            rMIGR_CLT.Chp13     := rMIGR_CLT3.Chp13;
            rMIGR_CLT.Cffmlp    := rMIGR_CLT3.Cffmlp;
            MIGRATION.INSAVTCTR(rMIGR_CLT);
            vNumAvn := rMIGR_CLT.NumAvn;
            vDatFin := rMIGR_CLT.DatFin;
          end loop;
        end if;
      
        if tcur_MIGR_CLT(i1).NumCpr is not null and tcur_MIGR_CLT(i1).idttypcpr is not null then
          ---------------------------------------------------------------------
          MIGRATION.Err_Msg := 'Creation of meter';
          ---------------------------------------------------------------------
        
          if tcur_MIGR_CLT(i1).NumCpr is not null then
            MIGRATION.ASGPRM(tcur_MIGR_CLT(i1));
            /**/
            -- ! voir si le compteur existe et est pos?
            begin
              Select Cpr.IdtCpr
                into tcur_MIGR_CLT(i1).IdtCpr
                from X7.CPR, X7.CprPntCpg
               where numCpr = tcur_MIGR_CLT(i1).NumCpr
                 and Cpr.IdtCpr = CprPntCpg.IdtCpr
                 and Datdps is null;
              /*if tcur_MIGR_CLT(i1).IdtCpr is not null then 
                tcur_MIGR_CLT(i1).NumCpr := tcur_MIGR_CLT(i1).NumCpr ||'-IMP';
              END IF;*/
            exception
              when no_data_found then
                null;
            end;
          
            if tcur_MIGR_CLT(i1).IdtCpr is null then
              MIGRATION.INSCPR(tcur_MIGR_CLT(i1));
            ELSE
              dbms_output.put_line('Compteur: ' || tcur_MIGR_CLT(i1).NumCpr ||
                                   ' existe:' || tcur_MIGR_CLT(i1).IdtCpr);
              --tcur_MIGR_CLT(i1).NumCpr := tcur_MIGR_CLT(i1).NumCpr ||'-IMP';
              --tcur_MIGR_CLT(i1).IdtCpr := null;
              --MIGRATION.INSCPR(tcur_MIGR_CLT(i1));
            end if;
          
            ---------------------------------------------------------------------
            MIGRATION.Err_Msg := 'Migration of meter - meter point relationship';
            ---------------------------------------------------------------------
          
            MIGRATION.ASGPRM(tcur_MIGR_CLT(i1));
            MIGRATION.INSCPRPNTCPG(tcur_MIGR_CLT(i1));
          end if;
        end if;
        --end if; -- nvl(tcur_MIGR_CLT(i1).NOT2MIGR,'N') <> 'O'
        if i1 = tcur_MIGR_CLT.count then
          begin
            MIGRATION.INSX7;
            commit;
          exception
            when others then
              dbms_output.put_line('Erreur : Sqc -->' || tcur_MIGR_CLT(i1).Idtsqc || ' ' || tcur_MIGR_CLT(i1).NumCpr || ' '||
                                   Sqlerrm);
              raise;
          end;
        end if;
      end loop;
      ---------------------------------------------------------------------
      MIGRATION.Err_Msg := 'End of client Creation - Update of MIGR_CLT';
      ---------------------------------------------------------------------
    
      for i1 in 1 .. tcur_MIGR_CLT.count loop
        update MIGR_CLT
           set SwMgr     = 999,
               IdtCpr    = tcur_MIGR_CLT(i1).IdtCpr,
               IdtPntLvr = tcur_MIGR_CLT(i1).IdtPntLvr,
               IdtCtr    = tcur_MIGR_CLT(i1).IdtCtr,
               IdtClt    = tcur_MIGR_CLT(i1).IdtClt
         where idtsqc = tcur_MIGR_CLT(i1).idtsqc;
        -- FNE: pour gérer les séquences
        select x7.seq_pntlvr.nextval into vseq from dual;
        select x7.seq_cpr.nextval into vseq from dual;
      
        update x7.Clt
           set AdrLbr = x7.adrstr_to_adrlbr(AdrStr1,
                                            AdrStr2,
                                            AdrStr3,
                                            AdrStr4,
                                            AdrStr5,
                                            AdrStr6,
                                            AdrStr7,
                                            AdrStr8,
                                            AdrStr9,
                                            AdrStr10)
         where IdtClt = tcur_MIGR_CLT(i1).IdtClt;
      
        update x7.PntLvr
           set AdrLbr = x7.adrstr_to_adrlbr(AdrStr1,
                                            AdrStr2,
                                            AdrStr3,
                                            AdrStr4,
                                            AdrStr5,
                                            AdrStr6,
                                            AdrStr7,
                                            AdrStr8,
                                            AdrStr9,
                                            AdrStr10)
         where IdtPntLvr = tcur_MIGR_CLT(i1).IdtPntLvr;
      
        update x7.PntCpg
           set AdrLbr = x7.adrstr_to_adrlbr(AdrStr1,
                                            AdrStr2,
                                            AdrStr3,
                                            AdrStr4,
                                            AdrStr5,
                                            AdrStr6,
                                            AdrStr7,
                                            AdrStr8,
                                            AdrStr9,
                                            AdrStr10)
         where IdtPntLvr = tcur_MIGR_CLT(i1).IdtPntLvr
           and IdtPntCpg = tcur_MIGR_CLT(i1).IdtPntCpg;
        commit;
        -- facturation Abonnement
        x7.InsFacAbo(tcur_MIGR_CLT(i1).IdtClt, tcur_MIGR_CLT(i1).IdtCtr);
      
        -- insertion index
        if tcur_MIGR_CLT(i1).IdtCpr is not null then
          insert into x7.ind
            (idtcpr,
             numcdr,
             idtind,
             idtcodorg,
             idtcodrlv,
             idtcodobsint,
             DatLctInd,
             idxfct,
             Ind,
             cns,
             prvind,
             frc,
             mtragt)
          values
            (tcur_MIGR_CLT(i1).IdtCpr,
             1,
             1,
             6,
             1,
             0,
             tcur_MIGR_CLT(i1).datpos,
             1,
             tcur_MIGR_CLT(i1).indpos,
             null,
             1,
             0,
             'IMPCLT');
        end if;
      
        update x7.cpr
           set SqcInd = 1, sqccns = 1
         where IdtCpr = tcur_MIGR_CLT(i1).IdtCpr;
        commit;
      
      end loop;
      exit when cMIGR_CLT%NOTFOUND;
    end loop;
  
    commit;
  
    -- Mise a jour Contrat
    update X7.CTR
       set SqcAvn =
           (select nvl(max(NumAvn), 1)
              from X7.AVTCTR
             where AVTCTR.IdtCtr = CTR.IdtCtr)
     where IdtCtr in (select IdtCtr from MIGR_CLT where SwMgr = 999);
  
    update X7.CTR
       set ctr.FINDRNPRDFCT =
           (select avtctr.datdbt - 1
              from X7.AVTCTR
             where AVTCTR.IdtCtr = CTR.IdtCtr
               and avtctr.datfin is null)
     where IdtCtr in (select IdtCtr from MIGR_CLT where SwMgr = 999);
  
    commit;
  
    -----------------------------------------------------------------------
    MIGRATION.Err_Msg := 'Update of DCPGGR';
    -----------------------------------------------------------------------
  
    update X7.DCPGGR
       set SqcPntLvr =
           (select max(numord)
              from X7.PNTLVR
             where X7.DCPGGR.IdtDcpGgr = X7.PNTLVR.IdtDcpGgr
               and IdtNivDcp = 1)
     where IdtDcpGgr in (select IdtDcpGgr from MIGR_CLT where SwMgr = 999);
  
    -----------------------------------------------------------------------
    MIGRATION.Err_Msg := 'Update of all delivery point sequence';
    -----------------------------------------------------------------------
  
    update X7.PNTLVR
       set SqcPntCpg =
           (select max(IdtPntCpg)
              from X7.PNTCPG
             where X7.PNTLVR.IdtPntLvr = X7.PNTCPG.IdtPntLvr)
     where IdtPntLvr in (select IdtPntLvr from MIGR_CLT where SwMgr = 999);
  
    commit;
    -----------------------------------------------------------------------
    MIGRATION.Err_Msg := 'Update of TABSEQ';
    -----------------------------------------------------------------------
  
    /* update x7.tabseq
      set tabseq.valtabseq =
          (select max(to_number(translate(IdtCLT,
                                          '01234567890ABCDEFGHIJKLMNOPQRSTUVWXYZ',
                                          '01234567890')))
             from x7.cLT)
    where idttabseq = 'SEQCLT';*/
    --migration.gLastIdtClt;
    Dbms_Output.put_line(migration.gLastIdtClt);
    update x7.tabseq
       set tabseq.valtabseq = migration.gLastIdtClt
     where idttabseq = 'SEQCLT';
  
    update x7.tabseq
       set tabseq.valtabseq =
           (select max(to_number(translate(IdtCtr,
                                           '01234567890ABCDEFGHIJKLMNOPQRSTUVWXYZ',
                                           '01234567890')))
              from x7.ctr)
     where idttabseq = 'SEQCTR';
    Migration.SET_SEQ_TO_DATA('X7.SEQ_CPR', 'X7.CPR', 'IDTCPR');
    commit;
  END Import;

begin
  null;
end ALG_IMPCLT;

/
