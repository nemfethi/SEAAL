CREATE OR REPLACE PACKAGE BODY IMPCLT.MIGRATION is

  /****************************************************************************/
  /*                       PROGRAMA DE MIGRACION                              */
  /*                           Versi?n 3.0.0                                  */
  /*--------------------------------------------------------------------------*/
  /*  DESCRIPCION : Realiza la migraci?n desde tablas est?ndar de migraci?n   */
  /*                Las vistas deben tener la estructura dada en la           */
  /*                Documentaci?n                                             */
  /*--------------------------------------------------------------------------*/
  /*  CREADO POR  : FBE - 29 01 01                                            */
  /*--------------------------------------------------------------------------*/
  /*  MODIFICACIONES                                                          */
  /*  VERSION     : 1.2.0                                                     */
  /*  FECHA       : 15 02 01                                                  */
  /*  POR         : FBE                                                       */
  /*  DESCRIPCION : Se crea el Procedimiento ASGPRM, en el cual se asignan    */
  /*                todos los valores si no provienen del maestro de migraci?n*/
  /*--------------------------------------------------------------------------*/
  /*  MODIFICACIONES                                                          */
  /*  VERSION     : 1.3.0                                                     */
  /*  FECHA       : 20 02 01                                                  */
  /*  POR         : FBE                                                       */
  /*  DESCRIPCION : Se crea el Procedimiento INSCTRFAC, en el cual se asignan */
  /*                en inserta la informaci?n de la tabla CTRFAC              */
  /*--------------------------------------------------------------------------*/
  /*  MODIFICACIONES                                                          */
  /*  VERSION     : 1.3.1                                                     */
  /*  FECHA       : 20 02 01                                                  */
  /*  POR         : FBE                                                       */
  /*  DESCRIPCION : Se utiliza la variable global gIdtCtr para llevar la      */
  /*                secuencia de idt del contrato en lugar de la secuencia de */
  /*                la base de datos                                          */
  /*--------------------------------------------------------------------------*/
  /*  MODIFICACIONES                                                          */
  /*  VERSION     : 2.0.0                                                     */
  /*  FECHA       : 27 03 01                                                  */
  /*  POR         : FBE                                                       */
  /*  DESCRIPCION : - El procedimiento de migraci?n se llama ahora            */
  /*                  MIGRATION_ELBEUF.                                       */
  /*                - Se adecua el programa para realizar la migraci?n del    */
  /*                  hist?rico de consumos                                   */
  /*                - Adici?n de variables para iniciar a un valor secuencias */
  /*                  de SEQ_CPR, NUMFAC para migrar primero los datos        */
  /*                  vigentes del cliente y luego sus hist?ricos, quedando   */
  /*                  las secuencias de los hist?ricos anteriores a las       */
  /*                  secuencias de los datos vigentes                        */
  /*--------------------------------------------------------------------------*/
  /*  MODIFICACIONES                                                          */
  /*  VERSION     : 3.0.0                                                     */
  /*  FECHA       : 16 02 02                                                  */
  /*  POR         : FBE                                                       */
  /*  DESCRIPCION : - Estabilizaci?n de la migraci?n est?ndar. Se crean       */
  /*                  nuevos procedimientos.                                  */
  /*                - El package de migraci?n contiene solamente              */
  /*                  procedimientos est?ndar de migraci?n que no deben ser   */
  /*                  manipulados.                                            */
  /*                - Las secuencias se manejan a través de la tabla MIGR_SEQ */
  /*                  quedando el programa de migraci?n con manejo de las     */
  /*                  secuencias independiente a X7.                          */
  /*                - Las variables de error se establecen en el package      */
  /*                  especification, de manera que otros package tengan      */
  /*                  acceso a modificar su valor y la rutina de errores no   */
  /*                  genere inconvenientes con el programa de migraci?n      */
  /****************************************************************************/

  --
  ------------------------------------------------------------------------------
  --  Variables globales para manejo de sequencias                            --
  ------------------------------------------------------------------------------

  gIdtFac    number;
  gIdtCtr    number;
  gIdtClt    number;
  gIdtOpr    number;
  gIdtCpr    number;
  gIdtPntLvr number;
  gIdtPntCpg number;
  gIdtLtt    number;
  gIdtNote   number;
  gIdtLgnCss number;

  tClt       typClt;
  tCptClt    typCptClt;
  tPntLvr    typPntLvr;
  tPntCpg    typPntCpg;
  tCpr       typCpr;
  tCprPntCpg typCprPntCpg;
  tCtr       typCtr;
  tAvtCtr    typAvtCtr;

  --BPZ
  tOpr  typOpr;
  tLtt  typLtt;
  tFac  typFac;
  tLFac typTabLgnFac;

  rMIGR_PRM MIGR_PRM%ROWTYPE;

  /****************************************************************************/
  /****************************************************************************/
  /****************************************************************************/
  PROCEDURE INITMGR is
  BEGIN
    -- Effacement des tableaux en memoire
    tClt.Delete;
    tCptClt.Delete;
    tPntLvr.Delete;
    tPntCpg.delete;
    tCtr.Delete;
    tAvtCtr.Delete;
    tCpr.Delete;
    tCprPntCpg.Delete;
    tFac.Delete;
    tLFac.Delete;
    tOpr.Delete;
    tLTT.Delete;
  END INITMGR;

  /****************************************************************************/
  /****************************************************************************/
  /****************************************************************************/

  PROCEDURE INSX7 is
  BEGIN
    -- Insertion dans les tables X7
    forall i in 1 .. tClt.Count
      insert into X7.CLT values tClt (i);
    forall i in 1 .. tCptClt.Count
      insert into X7.CPTCLT values tCptClt (i);
    forall i in 1 .. tPntLvr.Count --save exceptions
      insert into X7.PNTLVR values tPntLvr (i);
    forall i in 1 .. tPntCpg.Count
      insert into X7.PNTCPG values tPntCpg (i);
    forall i in 1 .. tCtr.Count
      insert into X7.CTR values tCtr (i);
    forall i in 1 .. tAvtCtr.Count
      insert into X7.AVTCTR values tAvtCtr (i);
    forall i in 1 .. tCpr.Count
      insert into X7.CPR values tCpr (i);
    forall i in 1 .. tCprPntCpg.Count
      insert into X7.CPRPNTCPG values tCprPntCpg (i);
    forall i in 1 .. tFac.Count
      insert into X7.FAC values tFac (i);
    forall i in 1 .. tLFac.Count
      insert into X7.LGNFAC values tLFac (i);
    forall i in 1 .. tOpr.Count
      insert into X7.OPR values tOpr (i);
    forall i in 1 .. tLTT.Count
      insert into X7.LTT values tLTT (i);
    -- Effacement des tableaux en memoire
    INITMGR;
  END INSX7;

  PROCEDURE INSX7CLTONLY is
  BEGIN
    -- Insertion dans les tables X7
    forall i in 1 .. tClt.Count
      insert into X7.CLT values tClt (i);
    forall i in 1 .. tCptClt.Count
      insert into X7.CPTCLT values tCptClt (i);
    forall i in 1 .. tFac.Count
      insert into X7.FAC values tFac (i);
    forall i in 1 .. tLFac.Count
      insert into X7.LGNFAC values tLFac (i);
    forall i in 1 .. tOpr.Count
      insert into X7.OPR values tOpr (i);
    forall i in 1 .. tLTT.Count
      insert into X7.LTT values tLTT (i);
    -- Effacement des tableaux en memoire
    INITMGR;
  END INSX7CLTONLY;
  /****************************************************************************/
  /****************************************************************************/
  /****************************************************************************/

  PROCEDURE CHGPRM

    ------------------------------------------------------------------------------
    --  Procedimiento que establece los valores de par?metros por defecto       --
    ------------------------------------------------------------------------------

   is

  begin

    Stack.InsertItem(Err_TableName, 'CHGPRM');

    INITMGR;
    select * into rMIGR_PRM from MIGR_PRM;

    gMinIdtCtr    := nvl(gMinIdtCtr, 1);
    gMinIdtFac    := nvl(gMinIdtFac, 1);
    gMinIdtPntLvr := nvl(gMinIdtPntLvr, 1);
    gMinIdtCpr    := nvl(gMinIdtCpr, 1);
    gMinIdtClt    := nvl(gMinIdtClt, 1);
    gMinIdtOpr    := nvl(gMinIdtOpr, 1);
    gMinIdtLtt    := nvl(gMinIdtLtt, 1);
    gMinIdtNote   := nvl(gMinIdtNote, 1);
    gMinIdtLgnCss := nvl(gMinIdtLgnCss, 1);

    gMaxIdtCtr    := nvl(gMaxIdtCtr, 9999999999999);
    gMaxIdtFac    := nvl(gMaxIdtFac, 9999999999999);
    gMaxIdtPntLvr := nvl(gMaxIdtPntLvr, 9999999999999);
    gMaxIdtCpr    := nvl(gMaxIdtCpr, 9999999999999);
    gMaxIdtClt    := nvl(gMaxIdtClt, 9999999999999);
    gMaxIdtOpr    := nvl(gMaxIdtOpr, 9999999999999);
    gMaxIdtLtt    := nvl(gMaxIdtLtt, 9999999999999);
    gMaxIdtNote   := nvl(gMaxIdtNote, 9999999999999);
    gMaxIdtLgnCss := nvl(gMaxIdtLgnCss, 9999999999999);

    Err_Msg := 'Obtenci?n del valor de la secuencia para IdtCtr';
    select greatest(nvl(max(to_number(translate(IdtCtr,
                                                '01234567890ABCDEFGHIJKLMNOPQRSTUVWXYZ',
                                                '01234567890'))),
                        1),
                    gMinIdtCtr) + 1
      into gIdtCtr
      from X7.CTR
     where to_number(translate(IdtCtr,
                               '01234567890ABCDEFGHIJKLMNOPQRSTUVWXYZ',
                               '01234567890')) < gMaxIdtCtr;

    Err_Msg := 'Obtenci?n del valor de la secuencia para IdtFac';
    select greatest(nvl(max(IdtFac), 1), gMinIdtFac) + 1
      into gIdtFac
      from X7.CTRFAC
     where IdtFac < gMaxIdtFac;

    Err_Msg := 'Obtenci?n del valor de la secuencia para IdtPntLvr';
    select greatest(nvl(max(IdtPntLvr), 1), gMinIdtPntLvr) + 1
      into gIdtPntLvr
      from X7.PNTLVR
     where IdtPntLvr < gMaxIdtPntLvr;

    Err_Msg := 'Obtenci?n del valor de la secuencia para IdtCpr';
    select greatest(nvl(max(IdtCpr), 1), gMinIdtCpr) + 1
      into gIdtCpr
      from X7.CPR
     where IdtCpr < gMaxIdtPntLvr;

    Err_Msg := 'Obtenci?n del valor de la secuencia para IdtClt';
    /*
     TODO: owner="fethi" created="17/04/2017"
     text="remplacer par procedure incrémentation IDTCLT"

    select greatest(nvl(max(to_number(translate(IdtClt,
                                                '01234567890ABCDEFGHIJKLMNOPQRSTUVWXYZ_',
                                                '01234567890'))),
                        1),
                    gMinIdtClt) + 1
      into gIdtClt
      from X7.CLT
     where to_number(translate(IdtClt,
                               '01234567890ABCDEFGHIJKLMNOPQRSTUVWXYZ_',
                               '01234567890')) < gMaxIdtClt;

    */

    select tabseq.valtabseq
      into gIdtClt
      from X7.TabSeq
     where idttabseq = 'SEQCLT';

     gLastIdtClt:=gIdtClt;

    Err_Msg := 'Obtenci?n del valor de la secuencia para IdtOpr';
    select greatest(nvl(max(IdtOpr), 1), gMinIdtOpr) + 1
      into gIdtOpr
      from X7.OPR
     where IdtOpr < gMaxIdtOpr;

    Err_Msg := 'Obtenci?n del valor de la secuencia para IdtLtt';
    select greatest(nvl(max(IdtLtt), 1), gMinIdtLtt) + 1
      into gIdtLtt
      from X7.LTT
     where IdtLtt < gMaxIdtLtt;

    Err_Msg := 'Obtenci?n del valor de la secuencia para IdtNote';
    select greatest(nvl(max(IdtNote), 1), gMinIdtNote) + 1
      into gIdtNote
      from X7.NOTE
     where IdtNote < gMaxIdtNote;

    Err_Msg := 'Obtenci?n del valor de la secuencia para IdtLgnCss';
    select greatest(nvl(max(IdtLgnCss), 1), gMinIdtLgnCss) + 1
      into gIdtLgnCss
      from X7.LGNCSS
     where IdtLgnCss < gMaxIdtLgnCss;

    Err_Msg := 'Fin asignaci?n de secuencias';

    stack.DeleteItem(Err_TableName);

    Err_Msg := 'Fin Carga de par?metros';

  end CHGPRM;

  /****************************************************************************/
  /****************************************************************************/
  /****************************************************************************/

  Procedure ASGPRM(rMIGR_CLT IN OUT MIGR_CLT%ROWTYPE) is

  begin

    Err_Msg := 'Entrada a ASGPRM';
    Stack.InsertItem(Err_TableName, 'ASGPRM');
    --Err_IdtClt := rMIGR_CLT.IdtSqc; --FNE
    Err_IdtClt := rMIGR_CLT.Num;

    ------------------------------------------------------------------------------
    ERR_MSG := 'Asignaci?n de valores del cliente';
    ------------------------------------------------------------------------------

    rMIGR_CLT.IdtQlt    := nvl(rMIGR_CLT.IdtQlt, rMIGR_PRM.IdtQlt);
    rMIGR_CLT.IdtCtgClt := nvl(rMIGR_CLT.IdtCtgClt, rMIGR_PRM.IdtCtgClt);
    --FNE
    --**rMIGR_CLT.IdtAgtCrt := nvl(rMIGR_CLT.IdtAgtCrt,rMIGR_PRM.IdtAgtCrt);

    rMIGR_CLT.IdtCntOpr := nvl(rMIGR_CLT.IdtCntOpr, rMIGR_PRM.IdtCntOpr);
    rMIGR_CLT.IdtCodSns := nvl(rMIGR_CLT.IdtCodSns, rMIGR_PRM.IdtCodSns);
    rMIGR_CLT.NumAvn    := nvl(rMIGR_CLT.NumAvn, nvl(rMIGR_PRM.NumAvn, 1));
    rMIGR_CLT.Nom       := nvl(rMIGR_CLT.Nom,
                               rMigr_CLT.IdtClt || ' - SIN NOMBRE');
    --  rMIGR_CLT.AdrLbr := nvl(rMIGR_CLT.AdrLbr,nvl(rMIGR_CLT.AdrPntCpg,rMIGR_CLT.IdtClt || ' - SIN DIRECCION'));
    rMIGR_CLT.IdtDvs    := nvl(rMIGR_CLT.IdtDvs, rMIGR_PRM.IdtDvs);
    rMIGR_CLT.CptDvs    := nvl(rMIGR_CLT.CptDvs, rMIGR_PRM.CptDvs);
    rMIGR_CLT.IdtModRgl := nvl(rMIGR_CLT.IdtModRgl,
                               nvl(rMIGR_CLT.ModRgl, rMIGR_PRM.IdtModRgl));

    ------------------------------------------------------------------------------
    Err_Msg := 'Asignaci?n de valores del punto de suministro';
    ------------------------------------------------------------------------------

    rMIGR_CLT.IdtTypHbt := nvl(rMIGR_CLT.IdtTypHbt, rMIGR_PRM.IdtTypHbt);
    rMIGR_CLT.Occ       := nvl(rMigr_CLT.Occ, 1);
    rMIGR_CLT.AdrPntlvr := nvl(rMIGR_CLT.AdrPntLvr, rMIGR_CLT.AdrLbr);

    ------------------------------------------------------------------------------
    Err_Msg := 'Asignaci?n de valores del punto de medici?n';
    ------------------------------------------------------------------------------

    rMIGR_CLT.IdtSrv       := nvl(rMIGR_CLT.IdtSrv, rMIGR_PRM.IdtSrv);
    rMIGR_CLT.Dmt          := nvl(rMIGR_CLT.Dmt,
                                  nvl(rMIGR_CLT.DmtCpr, rMIGR_PRM.Dmt));
    rMIGR_CLT.AdrPntCpg    := nvl(rMIGR_CLT.AdrPntCpg, rMIGR_CLT.AdrPntLvr);
    rMIGR_CLT.IdtUntMsrDmt := nvl(rMIGR_CLT.IdtUntMsrDmt,
                                  rMIGR_PRM.IdtUntMsrDmt);
    rMIGR_CLT.DatCnn       := nvl(rMIGR_CLT.DatCnn,
                                  nvl(rMIGR_PRM.DatPos,
                                      nvl(rMIGR_CLT.DatScr, RMigr_Prm.DatCrt)));
    rMIGR_CLT.IdtTypCpg    := nvl(rMIGR_CLT.IdtTypCpg, 2);

    ------------------------------------------------------------------------------
    Err_Msg := 'Asignaci?n de valores del medidor';
    ------------------------------------------------------------------------------

    rMIGR_CLT.IdtTypCpr := nvl(rMIGR_CLT.IdtTypCpr, rMIGR_PRM.IdtTypCpr);
    --  rMIGR_CLT.NumCpr := nvl(rMIGR_CLT.NumCpr, 'MGR-' || nvl(rMIGR_CLT.IdtClt,rMIGR_CLT.IdtCpr));

    ------------------------------------------------------------------------------
    Err_Msg := 'Asignaci?n de valores de CPRPNTCPG';
    ------------------------------------------------------------------------------
    --FNE
    /*rMIGR_CLT.DatPos    := nvl(rMIGR_CLT.DatPos,
    nvl(rMIGR_PRM.DatPos, rMIGR_CLT.DatCnn));*/

    rMIGR_CLT.DatPos    := nvl(rMIGR_CLT.DatPos, sysdate);
    rMIGR_CLT.TypCprFac := nvl(rMIGR_CLT.TypCprFac, rMIGR_CLT.IdtTypCpr);

    ------------------------------------------------------------------------------
    Err_Msg := 'Asignaci?n de valores para el contrato';
    ------------------------------------------------------------------------------

    rMIGR_CLT.DatScr    := nvl(rMIGR_CLT.DatScr,
                               nvl(rMIGR_CLT.DatDbt, rMIGR_PRM.DatCrt));
    rMIGR_CLT.IdtCltDst := nvl(rMIGR_CLT.IdtCltDst, rMIGR_CLT.IdtClt);
    rMIGR_CLT.IdtCltSsc := nvl(rMIGR_CLT.IdtCltSsc, rMIGR_CLT.IdtClt);
    rMIGR_CLT.CodTypCtr := nvl(rMIGR_CLT.CodTypCtr, rMIGR_PRM.CodTypCtr);
    --  rMIGR_CLT.DatDrnFct := nvl(rMIGR_CLT.DatDrnFct,rMIGR_PRM.DatDrnFct);
    --**rMIGR_CLT.DebDrnPrdFct := nvl(rMIGR_CLT.DebDrnPrdFct,nvl(rMIGR_PRM.DebDrnPrdFct,rMIGR_CLT.DatLct2));
    rMIGR_CLT.FinDrnPrdFct := nvl(rMIGR_CLT.FinDrnPrdFct,
                                  nvl(rMIGR_PRM.FinDrnPrdFct,
                                      rMIGR_CLT.DatLct1));
    rMIGR_CLT.IdtRcvTyp    := nvl(rMIGR_CLT.IdtRcvTyp, rMIGR_PRM.IdtRcvTyp);
    rMIGR_CLT.AncRfrCtr    := nvl(rMIGR_CLT.AncRfrCtr,
                                  nvl(rMIGR_CLT.AncRfr, rMIGR_CLT.RfrClt));

    ------------------------------------------------------------------------------
    Err_Msg := 'Asignaci?n de valores para el acta adicional';
    ------------------------------------------------------------------------------

    rMIGR_CLT.DatDbt    := nvl(rMIGR_CLT.DatDbt, rMIGR_CLT.DatScr);
    rMIGR_CLT.ExnTva    := nvl(rMIGR_CLT.ExnTva, rMIGR_PRM.ExnTva);
    rMIGR_CLT.IdtFacTyp := nvl(rMIGR_CLT.IdtFacTyp, rMIGR_PRM.IdtFacTyp);
    rMIGR_CLT.IdtAcv    := nvl(rMIGR_CLT.IdtAcv, rMIGR_PRM.IdtAcv);
    rMIGR_CLT.IdtTrf    := nvl(rMIGR_CLT.IdtTrf, rMIGR_PRM.IdtTrf);

    Err_Msg := 'Busqueda de la fecha de inicio de ult. fact.';

    /*

      if rMIGR_CLT.DebDrnPrdFct is null then

        Err_Msg := 'Ciclo de facturacion';

    ---    dbms_output.put_line(rMIGR_CLT.IdtFacTyp);

        select IdtCycFac
          into vIdtCycFac
          from X7.FACTYP
          where IdtFacTyp = rMIGR_CLT.IdtFacTyp;

        vAnn := to_char(rMIGR_CLT.FinDrnPrdFct,'yyyy');

        Err_Msg := 'B?squeda de la fecha de inicio anterior a la fecha de fin';

        select max(to_date(lpad(PrmJou,2,'0') ||
                           lpad(PrmMoi,2,'0') ||
                           vAnn,'ddmmyyyy'))
          into rMIGR_CLT.DebDrnPrdFct
          from X7.PRDFAC
          where IdtCycFac = vIdtCycFac
           and  to_date(lpad(PrmJou,2,'0') ||
                           lpad(PrmMoi,2,'0') ||
                           vAnn,'ddmmyyyy') < rMIGR_CLT.FinDrnPrdFct;

      end if;

    */

    ------------------------------------------------------------------------------
    Err_Msg := 'Asignaci?n de valores de lectura';
    ------------------------------------------------------------------------------

    rMIGR_CLT.NumCdr := nvl(rMIGR_CLT.NumCdr, 1);
    rMIGR_CLT.Cff    := nvl(rMIGR_CLT.Cff, rMIGR_PRM.Cff);

    ------------------------------------------------------------------------------
    ERR_MSG := 'Asignaci?n de valores de la cuenta cliente';
    ------------------------------------------------------------------------------
    rMIGR_CLT.DatOvr := nvl(rMIGR_CLT.DatOvr, rMIGR_CLT.DatScr);

    stack.DeleteItem(Err_TableName);

  end ASGPRM;

  /****************************************************************************/
  /****************************************************************************/
  /****************************************************************************/

  /*Procedure ASGPRMOPR (rMIGR_OPR IN OUT MIGR_OPR%ROWTYPE,
                       rMIGR_CLT IN OUT MIGR_CLT%ROWTYPE ) is

  begin

    Err_Msg:= 'Entrada a ASGPRMOPR';
  --  Stack.InsertItem(Err_TableName,'ASGPRMOPR');


  ------------------------------------------------------------------------------
    ERR_MSG := 'Asignaci?n de valores de la factura';
  ------------------------------------------------------------------------------
    rMIGR_OPR.CodVld    := nvl(rMIGR_OPR.CodVld,rMIGR_PRM.CodVld);
    rMIGR_OPR.OprAnn    := nvl(rMIGR_OPR.OprAnn,0);
    rMIGR_OPR.Anl       := nvl(rMIGR_OPR.Anl,0);
    if rMIGR_OPR.IdtTypOpr = 2 then
      rMIGR_OPR.IdtNatRgl := nvl(rMIGR_OPR.IdtNatRgl,1);
    end if;
    rMIGR_OPR.IdtDvs    := coalesce(rMIGR_OPR.IdtDvs,rMIGR_CLT.IdtDvs,rMIGR_PRM.IdtDvs);

  ------------------------------------------------------------------------------
    ERR_MSG := 'Asignaci?n de valores generales';
  ------------------------------------------------------------------------------

  --  rMIGR_OPR.IdtModRgl := nvl(rMIGR_OPR.IdtModRgl,rMIGR_CLT.IdtModRgl);
    rMIGR_OPR.IdtAgt    := nvl(rMIGR_OPR.IdtAgt,rMIGR_PRM.MtrAgt);
    rMIGR_OPR.DatCrt    := nvl(rMIGR_OPR.DatCrt,rMIGR_OPR.DatVlr);
    rMIGR_OPR.DatVlr    := nvl(rMIGR_OPR.DatVlr,rMIGR_OPR.DatCrt);
    rMIGR_OPR.DatCnv    := nvl(rMIGR_OPR.DatCnv,rMIGR_PRM.DatCnv);

    if rMIGR_OPR.IdtTypOpr in (2,5) then
      rMIGR_OPR.MntDvs    := nvl(rMIGR_OPR.MntDvs,rMIGR_OPR.Mnt);
      rMIGR_OPR.IdtCss    := nvl(rMIGR_OPR.IdtCss,rMIGR_PRM.IdtCss);
      rMIGR_OPR.IdtModRgl := nvl(rMIGR_OPR.IdtModRgl,rMIGR_PRM.IdtModRgl);
    end if;

  --  stack.DeleteItem(Err_TableName);

  end ASGPRMOPR;*/

  /****************************************************************************/
  /****************************************************************************/
  /****************************************************************************/

  /*Procedure ASGPRMOPR2 (rMIGR_OPR IN OUT MIGR_OPR%ROWTYPE,
                        rMIGR_OPR2 IN OUT MIGR_OPR%ROWTYPE ) is

  begin

    Err_Msg:= 'Entrada a ASGPRMOPR2';
  --  Stack.InsertItem(Err_TableName,'ASGPRMOPR2');

    rMIGR_OPR2.IDTCLT    := rMIGR_OPR.IdtClt;
    rMIGR_OPR2.ECHPMT    := rMIGR_OPR.EchPmt;
    rMIGR_OPR2.IDTPRD    := rMIGR_OPR.IdtPrd;
    rMIGR_OPR2.DATCNV    := rMIGR_OPR.DatCnv;
    rMIGR_OPR2.DATPRMECH := rMIGR_OPR.DatPrmEch;
    rMIGR_OPR2.NUMCPTBNC := rMIGR_OPR.NumCptBnc;
    rMIGR_OPR2.CLERIB    := rMIGR_OPR.CleRib;
    rMIGR_OPR2.CODRGR    := rMIGR_OPR.CodRgr;
    rMIGR_OPR2.CODVLD    := rMIGR_OPR.CodVld;
    rMIGR_OPR2.RFRCLT    := rMIGR_OPR.RfrClt;
    rMIGR_OPR2.ANCRFRCLT := rMIGR_OPR.AncRfrClt;

    rMIGR_OPR2.IDTBNQ    := rMIGR_OPR.IdtBnq2;
    rMIGR_OPR2.IDTGCH    := rMIGR_OPR.IdtGch2;
    rMIGR_OPR2.IdtAgt    := rMIGR_OPR.IdtAgt2;
    rMIGR_OPR2.AncRfrOpr := rMIGR_OPR.AncRfrOpr2;
    rMIGR_OPR2.IDTOPR    := rMIGR_OPR.IdtOpr2;
    rMIGR_OPR2.IDTTYPOPR := rMIGR_OPR.IdtTypOpr2;
    rMIGR_OPR2.IDTMODRGL := rMIGR_OPR.IdtModRgl2;
    rMIGR_OPR2.DATEXG    := rMIGR_OPR.DatExg2;
    rMIGR_OPR2.DATVLR    := rMIGR_OPR.DatVlr2;
    rMIGR_OPR2.IDTLGNCSS := rMIGR_OPR.IdtLgnCss2;
    rMIGR_OPR2.RFR       := rMIGR_OPR.Rfr2;
    rMIGR_OPR2.IDTCSS    := rMIGR_OPR.IdtCss2;
    rMIGR_OPR2.IDTDVS    := rMIGR_OPR.IdtDvs2;
    rMIGR_OPR2.OPRANN    := rMIGR_OPR.OprAnn2;
    rMIGR_OPR2.SLDEXGANT := rMIGR_OPR.SldExgAnt2;
    rMIGR_OPR2.IDTRCVTYP := rMIGR_OPR.IdtRcvTyp2;
    rMIGR_OPR2.DATDBTPRD := rMIGR_OPR.DatDbtPrd2;
    rMIGR_OPR2.DATFINPRD := rMIGR_OPR.DatFinPrd2;
    rMIGR_OPR2.NUMFCT    := rMIGR_OPR.NumFct2;
    rMIGR_OPR2.MNT       := rMIGR_OPR.Mnt2;
    rMIGR_OPR2.Sld       := rMIGR_OPR.Sld2;
    rMIGR_OPR2.MntDvs    := rMIGR_OPR.MntDvs2;
    rMIGR_OPR2.DATCRT    := rMIGR_OPR.DatCrt2;
    rMIGR_OPR2.InfCpl    := rMIGR_OPR.InfCpl2;
    rMIGR_OPR2.NumChq    := rMIGR_OPR.NumChq2;
    rMIGR_OPR2.Anl       := rMIGR_OPR.Anl2;
    rMIGR_OPR2.IdtNatRgl := rMIGR_OPR.IdtNatRgl2;

  --  stack.DeleteItem(Err_TableName);

  end ASGPRMOPR2;*/

  /****************************************************************************/
  /****************************************************************************/
  /****************************************************************************/

  PROCEDURE INSNOTE(rNOTE IN OUT NOTE%ROWTYPE) is

  BEGIN

    rNote.IdtNote := gIdtNote;
    gIdtNote      := gIdtNote + 1;

    insert into X7.NOTE
      (IdtNote, IdtSqcGnr, Txt, DatCrt, IdtAgt)
    values
      (rNOTE.IdtNote,
       rNOTE.IdtSqcGnr,
       rNOTE.Txt,
       rNOTE.DatCrt,
       rNOTE.IdtAgt);
  end INSNOTE;

  /****************************************************************************/
  /****************************************************************************/
  /****************************************************************************/

  Procedure INSCLT(rMIGR_CLT IN OUT MIGR_CLT%ROWTYPE) is
    ------------------------------------------------------------------------------
    -- Procesos de inserci?n de la informaci?n en las tablas CLT y CPTCLT       --
    ------------------------------------------------------------------------------
    i      number;
    vAlpha varchar2(26) := 'ABCDEFGHIJKLMNOPQRSTUVWXYZ';
    vNbM   number(2);
    gIdtClt0 number;
  begin

    Stack.InsertItem(Err_TableName, 'INSCLT');
    Err_IdtClt := rMIGR_CLT.IdtSqc;

    Err_Msg := 'B?squeda de las secuencias si no vienen del maestro';

    if rMIGR_CLT.IdtClt is null then
      /* FNE
      rMIGR_CLT.IdtClt := gIdtClt + 1;
      gIdtClt          := gIdtClt + 1;
      */
      --x7.x7_trtseq01.x7_nxttabseqidtclt(gIdtClt);
      gIdtClt := gIdtClt + 1;
      gIdtClt0:=gIdtClt;
      if gIdtClt0 >= 1000000 then
        vNbM    := gIdtClt0 / 1000000;
        gIdtClt0 := gIdtClt0 - (vNbM * 1000000);

        rMIGR_CLT.IdtClt := substr(vAlpha, vNbM, 1);
        rMIGR_CLT.IdtClt := rMIGR_CLT.IdtClt ||
                            lpad(to_char(gIdtClt0), 5, '0');
      else
        rMIGR_CLT.IdtClt := to_char(gIdtClt);
      end if;

      --rMIGR_CLT.IdtClt:=gIdtClt;

    end if;

    Err_Msg := 'Fin Secuencias Cliente';

    i := tClt.Count + 1;

    tClt(i).IDTCLT := rMigr_CLT.IdtClt;
    tClt(i).IDTQLT := rMIGR_CLT.IdtQlt;
    tClt(i).IDTCTGCLT := rMIGR_CLT.IdtCtgClt;
    tClt(i).IDTCNTOPR := rMIGR_CLT.IdtCntOpr;
    tClt(i).IDTCODSNS := rMIGR_CLT.IdtCodSns;
    tClt(i).IDTCTR := rMIGR_CLT.IdtCtr;
    tClt(i).MTRAGT := rMIGR_PRM.MtrAgt;
    tClt(i).DATMAJ := rMIGR_PRM.DatMaj;
    tClt(i).NOM := rMIGR_CLT.Nom;
    tClt(i).PRN := rMIGR_CLT.Prn;
    tClt(i).TLB := rMIGR_CLT.Tlb;
    tClt(i).FLB := rMIGR_CLT.Flb;
    tClt(i).TLD := rMIGR_CLT.Tld;
    tClt(i).FLD := rMIGR_CLT.Fld;
    tClt(i).ANCRFR := nvl(rMIGR_CLT.AncRfr, rMIGR_CLT.RfrClt);
    tClt(i).FRD := 0;
    tClt(i).ADRLBR := rMIGR_CLT.AdrLbr;
    tClt(i).INTBNC := 0;
    tClt(i).SQCCPTCLT := 1;
    tClt(i).SQCCNT := 0;
    tClt(i).IDTPRMCTR := rMIGR_CLT.IDtCtr;
    tClt(i).CHPLIB1 := rMIGR_CLT.ChpLib1;
    tClt(i).CHPLIB2 := rMIGR_CLT.ChpLib2;
    tClt(i).CHPLIB3 := rMIGR_CLT.ChpLib3;
    tClt(i).CHPLIB4 := rMIGR_CLT.ChpLib4;
    tClt(i).ADRSTR1 := rMIGR_CLT.ADRSTR1;
    tClt(i).ADRSTR2 := rMIGR_CLT.ADRSTR2;
    tClt(i).ADRSTR3 := rMIGR_CLT.ADRSTR3;
    tClt(i).ADRSTR4 := rMIGR_CLT.ADRSTR4;
    tClt(i).ADRSTR5 := rMIGR_CLT.ADRSTR5;
    tClt(i).ADRSTR6 := rMIGR_CLT.ADRSTR6;
    tClt(i).ADRSTR7 := rMIGR_CLT.ADRSTR7;
    tClt(i).ADRSTR8 := rMIGR_CLT.ADRSTR8;
    tClt(i).ADRSTR9 := rMIGR_CLT.ADRSTR9;
    tClt(i).ADRSTR10 := rMIGR_CLT.ADRSTR10;
    --FNE
    --**tClt(i).IDTAGTCRT  := rMIGR_CLT.IDTAGTCRT;

    i := tCptClt.Count + 1;

    tCptClt(i).IDTCLT := rMIGR_CLT.IdtClt;
    tCptClt(i).IDTCPTCLT := 1;
    tCptClt(i).IDTDVS := rMIGR_CLT.IdtDvs;
    tCptClt(i).IDTBNQ := rMIGR_CLT.IdtBnq;
    tCptClt(i).IDTGCH := rMIGR_CLT.IdtGch;
    tCptClt(i).IDTMODRGL := rMIGR_CLT.IdtModRgl;
    tCptClt(i).IDTCNTOPR := rMIGR_CLT.IdtCntOpr;
    tCptClt(i).IDTCODSNS := rMIGR_CLT.IdtCodSns;
    tCptClt(i).DATOVR := nvl(nvl(rMIGR_CLT.DatOvr, rMIGR_CLT.DatScr),
                             sysdate); --FNE ** temp **
    tCptClt(i).NUMCPTBNC := rMIGR_CLT.NumCptBnc;
    tCptClt(i).CLERIB := rMIGR_CLT.CleRib;
    tCptClt(i).DRNOPRCRE := 0;
    tCptClt(i).CPTDVS := rMIGR_CLT.CptDvs;
    gLastIdtClt := gLastIdtClt + 1;

    --  if gSwInsererLgn = 1  then
    --------------------------------------------------------------------------------
    ---- Inserci?n en la tabla CLT                                                --
    --------------------------------------------------------------------------------
    --    Err_Msg := 'Inserci?n en la tabla CLT';
    --    forall j in 1..tClt.Count
    --      insert into X7.CLT values tClt(j);
    --    tClt.Delete;
    --------------------------------------------------------------------------------
    ---- Inserci?n en la tabla CPTCLT                                             --
    --------------------------------------------------------------------------------
    --    Err_Msg := 'Inserci?n en la tabla CPTCLT';
    --    forall j in 1..tCptClt.Count
    --      insert into X7.CPTCLT values tCptClt(j);
    --    tCptClt.Delete;
    --  end if;
    stack.DeleteItem(Err_TableName);
  end INSCLT;

  /****************************************************************************/
  /****************************************************************************/
  /****************************************************************************/

  Procedure INSPNTLVR(rMIGR_CLT IN OUT MIGR_CLT%ROWTYPE) is

    ------------------------------------------------------------------------------
    -- Procesos de inserci?n de la informaci?n en la tabla PNTLVR               --
    ------------------------------------------------------------------------------
    i       number;
    p1      number;
    p2      number;
    p3      number;
    p4      number;
    p5      number;
    vnumord x7.pntlvr.numord%type;
    --dml_errors EXCEPTION;
    --PRAGMA exception_init(dml_errors, -24381);
  begin
    stack.InsertItem(Err_TableName, 'INSPNTLVR');
    Err_IdtClt := rMIGR_CLT.IdtSqc;
    Err_Msg    := 'Inicio Asignaci?n de valores';

    ------------------------------------------------------------------------------
    -- Asignaci?n de valores si no provienen del maestro de migraci?n.          --
    -- Los valores son devueltos al proceso que llama al procedimiento        --
    ------------------------------------------------------------------------------
    Err_Msg := 'Punto de suministro no existe';
    if rMIGR_CLT.IdtPntLvr is null then
      rMIGR_CLT.IdtPntLvr := gIdtPntLvr;
      gIdtPntLvr          := gIdtPntLvr + 1;

      rMIGR_CLT.IdtPntCpg := nvl(rMIGR_CLT.IdtPntCpg, 1);
      gIdtPntCpg          := rMIGR_CLT.IdtPntCpg;
      i                   := tPntLvr.Count + 1;

      tPntLvr(i).IDTPNTLVR := rMIGR_CLT.IdtPntLvr;
      tPntLvr(i).IDTTYPHBT := rMIGR_CLT.IdtTypHbt;
      tPntLvr(i).IDTCNTOPR := rMIGR_CLT.IdtCntOpr;
      tPntLvr(i).IDTDCPGGR := nvl(rMIGR_CLT.IdtDcpGgr, rMIGR_PRM.Idtdcpggr); -- FNE ** TEMP **
      tPntLvr(i).SQCPNTCPG := rMIGR_CLT.IDtPntCpg;
      tPntLvr(i).MTRAGT := rMIGR_PRM.MtrAgt;
      tPntLvr(i).DATMAJ := rMIGR_PRM.DatMaj;
      tPntLvr(i).OCC := rMIGR_CLT.Occ;
      tPntLvr(i).ADRLBR := rMIGR_CLT.AdrPntLvr;
      begin
        select max(numord) + 1
          into vNumOrd
          from x7.pntlvr
         where IDTDCPGGR = nvl(rMIGR_CLT.IdtDcpGgr, rMIGR_PRM.Idtdcpggr);
      end;
      tPntLvr(i).NUMORD := nvl(rMIGR_CLT.NumOrd, vnumord);

      p1 := instr(nvl(rMIGR_CLT.IdtDcpGgr, rMIGR_PRM.Idtdcpggr), '-', 1, 1);
      p2 := instr(nvl(rMIGR_CLT.IdtDcpGgr, rMIGR_PRM.Idtdcpggr), '-', 1, 2);
      p3 := instr(nvl(rMIGR_CLT.IdtDcpGgr, rMIGR_PRM.Idtdcpggr), '-', 1, 3);
      p4 := instr(nvl(rMIGR_CLT.IdtDcpGgr, rMIGR_PRM.Idtdcpggr), '-', 1, 4);
      --p5:= instr(nvl(rMIGR_CLT.IdtDcpGgr, rMIGR_PRM.Idtdcpggr), '-', 1, 5);

      --tPntLvr(i).CODGEO6 := nvl(rMIGR_CLT.CodGeo1, substr(nvl(rMIGR_CLT.IdtDcpGgr, rMIGR_PRM.Idtdcpggr), 1, p1-1));
      --tPntLvr(i).CODGEO5 := nvl(rMIGR_CLT.CodGeo2, substr(nvl(rMIGR_CLT.IdtDcpGgr, rMIGR_PRM.Idtdcpggr), p1+1, p2-p1-1));
      tPntLvr(i).CODGEO4 := nvl(rMIGR_CLT.CodGeo4,
                                substr(nvl(rMIGR_CLT.IdtDcpGgr,
                                           rMIGR_PRM.Idtdcpggr),
                                       1,
                                       p1 - 1));
      tPntLvr(i).CODGEO3 := nvl(rMIGR_CLT.CodGeo3,
                                substr(nvl(rMIGR_CLT.IdtDcpGgr,
                                           rMIGR_PRM.Idtdcpggr),
                                       p1 + 1,
                                       p2 - p1 - 1));
      tPntLvr(i).CODGEO2 := nvl(rMIGR_CLT.CodGeo2,
                                substr(nvl(rMIGR_CLT.IdtDcpGgr,
                                           rMIGR_PRM.Idtdcpggr),
                                       p2 + 1,
                                       p3 - p2 - 1));
      tPntLvr(i).CODGEO1 := nvl(rMIGR_CLT.CodGeo1,
                                substr(nvl(rMIGR_CLT.IdtDcpGgr,
                                           rMIGR_PRM.Idtdcpggr),
                                       p3 + 1));

      tPntLvr(i).ANCRFR := rMIGR_CLT.ANCRFRCPG;

      tPntLvr(i).ADRSTR1 := rMIGR_CLT.ADRSTR1;
      tPntLvr(i).ADRSTR2 := rMIGR_CLT.ADRSTR2;
      tPntLvr(i).ADRSTR3 := rMIGR_CLT.ADRSTR3;
      tPntLvr(i).ADRSTR4 := rMIGR_CLT.ADRSTR4;
      tPntLvr(i).ADRSTR5 := rMIGR_CLT.ADRSTR5;
      tPntLvr(i).ADRSTR6 := rMIGR_CLT.ADRSTR6;
      tPntLvr(i).ADRSTR7 := rMIGR_CLT.ADRSTR7;
      tPntLvr(i).ADRSTR8 := rMIGR_CLT.ADRSTR8;
      tPntLvr(i).ADRSTR9 := rMIGR_CLT.ADRSTR9;
      tPntLvr(i).ADRSTR10 := rMIGR_CLT.ADRSTR10;
      --  tPntLvr(i).A1        := rMIGR_CLT.PntLvr_A1;

      Err_Msg := 'Inserci?n en la tabla PNTLVR';

      --  if gSwInsererLgn = 1  then
      --    forall j in 1..tPntLvr.Count --save exceptions
      --      insert into X7.PNTLVR values tPntLvr(j);
      --    tPntLvr.Delete;
      --  end if;

      stack.DeleteItem(Err_TableName);

      --  EXCEPTION
      --    when DML_ERRORS then
      --      null;
      --      stack.DeleteItem(Err_TableName);
    else
      select greatest(nvl(SqcPntCpg, 1) + 1, nvl(gIdtPntCpg, 1) + 1)
        into rMIGR_CLT.IdtPntCpg
        from X7.PNTLVR
       where IdtPntLvr = rMIGR_CLT.IdtPntlvr;
      gIdtPntCpg := rMIGR_CLT.IdtPntCpg;
    end if;

  end INSPNTLVR;

  /****************************************************************************/
  /****************************************************************************/
  /****************************************************************************/

  Procedure INSPNTCPG(rMIGR_CLT IN OUT MIGR_CLT%ROWTYPE) is

    ------------------------------------------------------------------------------
    -- Procesos de inserci?n de la informaci?n en la tabla PNTCPG               --
    ------------------------------------------------------------------------------
    i number;
  begin
    stack.InsertItem(Err_TableName, 'INSPNTCPG');
    Err_IdtClt := rMIGR_CLT.IdtSqc;

    if rMIGR_CLT.IdtPntCpg is null then
      select SqcPntCpg + 1
        into rMIGR_CLT.IdtPntCpg
        from X7.PNTLVR
       where IdtPntLvr = rMIGR_CLT.IdtPntlvr;
    end if;
    --dbms_output.put_line('IdtPntLvr: ' || rMIGR_CLT.IdtPntLvr ||
    --                     ' sqcpntcpg: ' || rMIGR_CLT.IdtPntCpg);
    i := tPntCpg.Count + 1;

    tPntCpg(i).IDTPNTLVR := rMIGR_CLT.IdtPntLvr;
    tPntCpg(i).IDTPNTCPG := rMIGR_CLT.IdtPntCpg;
    tPntCpg(i).IDTSRV := rMIGR_CLT.IdtSrv;
    tPntCpg(i).IDTTRNTYP := rMIGR_CLT.IdtTrnTyp;
    tPntCpg(i).IDTCNTOPR := rMIGR_CLT.IdtCntOpr;
    tPntCpg(i).MTRAGT := rMIGR_PRM.MtrAgt;
    tPntCpg(i).DATMAJ := rMIGR_PRM.DatMaj;
    tPntCpg(i).DMT := rMIGR_CLT.Dmt;
    tPntCpg(i).DATCNN := rMIGR_CLT.DatCnn;
    tPntCpg(i).DATDCN := rMIGR_CLT.DatDcn;
    tPntCpg(i).ADRLBR := rMIGR_CLT.AdrPntCpg;
    tPntCpg(i).DATCOU := rMIGR_CLT.DatCou;
    tPntCpg(i).RNG1 := rMIGR_CLT.Rng1;
    tPntCpg(i).IDTUNTMSRDMT := rMIGR_CLT.IdtUntMsrDmt;
    tPntCpg(i).IdtTypCpg := rMIGR_CLT.IdtTypCpg;
    tPntCpg(i).ANCRFR := rMIGR_CLT.ANCRFRCPG;
    tPntCpg(i).IdtCltPrp := rMIGR_CLT.IdtClt;

    tPntCpg(i).ADRSTR1 := rMIGR_CLT.ADRSTR1;
    tPntCpg(i).ADRSTR2 := rMIGR_CLT.ADRSTR2;
    tPntCpg(i).ADRSTR3 := rMIGR_CLT.ADRSTR3;
    tPntCpg(i).ADRSTR4 := rMIGR_CLT.ADRSTR4;
    tPntCpg(i).ADRSTR5 := rMIGR_CLT.ADRSTR5;
    tPntCpg(i).ADRSTR6 := rMIGR_CLT.ADRSTR6;
    tPntCpg(i).ADRSTR7 := rMIGR_CLT.ADRSTR7;
    tPntCpg(i).ADRSTR8 := rMIGR_CLT.ADRSTR8;
    tPntCpg(i).ADRSTR9 := rMIGR_CLT.ADRSTR9;
    tPntCpg(i).ADRSTR10 := rMIGR_CLT.ADRSTR10;

      tPntCpg(i).A3           := rMIGR_CLT.PNTCPG_A3;
    --  tPntCpg(i).T1           := rMIGR_CLT.T1;
    --  tPntCpg(i).IDTT1        := rMIGR_CLT.IdtT1;
    --  tPntCpg(i).T2           := rMIGR_CLT.T2;
    --  tPntCpg(i).IDTT2        := rMIGR_CLT.IdtT2;

    --  if gSwInsererLgn = 1  then
    --    Err_Msg := 'Inserci?n de la informaci?n en la tabla PNTCPG';
    --    forall j in 1..tPntCpg.Count
    --      insert into X7.PNTCPG values tPntCpg(j);
    --    tPntCpg.delete;
    --  end if;

    Err_Msg := 'Actualizaci?n de PNTLVR con la secuencia del punto de medici?n';

    --  update X7.PNTLVR set SqcPntCpg = rMIGR_CLT.IdtPntCpg
    --    where X7.PNTLVR.IdtPntLvr = rMIGR_CLT.IdtPntLvr;

    stack.DeleteItem(Err_TableName);

  end INSPNTCPG;

  /****************************************************************************/
  /****************************************************************************/
  /****************************************************************************/

  Procedure INSCPR(rMIGR_CLT IN OUT MIGR_CLT%ROWTYPE) is

    ------------------------------------------------------------------------------
    -- Procesos de inserci?n de la informaci?n en la tabla CPR                  --
    ------------------------------------------------------------------------------
    i number;
  begin
    stack.InsertItem(Err_TableName, 'INSCPR');
    Err_IdtClt := rMIGR_CLT.IdtSqc;
    Err_NumCpr := rMIGR_CLT.NumCpr;
    Err_Msg    := 'Inicio Asignaci?n de valores';

    ------------------------------------------------------------------------------
    -- Asignaci?n de valores si no provienen del maestro de migraci?n.          --
    -- Los valores son devueltos al proceso que llama al procedimiento        --
    ------------------------------------------------------------------------------

    if rMIGR_CLT.IdtCpr is null then
      rMIGR_CLT.IdtCpr := gIdtCpr;
      gIdtCpr          := gIdtCpr + 1;
    --end if;

    ------------------------------------------------------------------------------
    -- B?squeda del n?mero de ruedas del medidor                                --
    -- El n?mero de ruedas es utilizado para el c?lculo de lecturas anteriores  --
    -- si no no vienen en la tabla maestra.                                     --
    ------------------------------------------------------------------------------

    Err_Msg := 'B?squeda del n?mero de ruedas del medidor';
    if rMIGR_CLT.NbrRou is null then
      select NbrRou
        into rMIGR_CLT.NbrRou
        from X7.TYPCPR
       where IdtTypCpr = nvl(rMIGR_CLT.IdtTypCpr, rMigr_Prm.Idttypcpr);
    end if;

    i := tCpr.Count + 1;
    tCpr(i).IDTCODOBS := rMIGR_CLT.IdtCodObs;
    tCpr(i).IDTCPR := rMIGR_CLT.IdtCpr;
    tCpr(i).IDTTYPCPR := nvl(rMIGR_CLT.IdtTypCpr, rMigr_Prm.Idttypcpr);
    tCpr(i).IDTAGT := rMIGR_PRM.MtrAgt;
    tCpr(i).NUMCPR := rMIGR_CLT.NumCpr;
    tCpr(i).DATFBR := rMIGR_PRM.DatCrt - 1;
    tCpr(i).DATETL := rMIGR_PRM.DatCrt - 1;
    tCpr(i).DATAGR := rMIGR_PRM.DatCrt - 1;
    tCpr(i).D5 := rMIGR_CLT.CPR_D5;
    tCpr(i).SqcCns := 0;
    tCpr(i).SqcCns := 0;

    --  if gSwInsererLgn = 1  then
    --    Err_Msg := 'Insercion en la table CPR';
    --    forall j in 1..tCpr.Count
    --      insert into X7.CPR values tCpr(j);
    ----    tCpr.Delete;
    --  end if;
    end if;
    stack.DeleteItem(Err_TableName);

  end INSCPR;

  /****************************************************************************/
  /****************************************************************************/
  /****************************************************************************/

  Procedure INSCPRPNTCPG(rMIGR_CLT IN OUT MIGR_CLT%ROWTYPE) is

    ------------------------------------------------------------------------------
    -- Procesos de inserci?n de la informaci?n en la tabla CPRPNTCPG            --
    ------------------------------------------------------------------------------
    i number;
  begin
    stack.InsertItem(Err_TableName, 'INSCPRPNTCPG');
    Err_IdtClt := rMIGR_CLT.IdtSqc;
    Err_NumCpr := rMIGR_CLT.NumCpr;
    Err_IdtCpr := rMIGR_CLT.IdtCpr;

    Err_Msg := 'Inserci?n en la tabla CPRPNTCPG';

    i := tCprPntCpg.Count + 1;
    tCprPntCpg(i).IDTCPR := rMIGR_CLT.IdtCpr;
    tCprPntCpg(i).IDTPNTLVR := rMIGR_CLT.IdtPntLvr;
    tCprPntCpg(i).IDTPNTCPG := rMIGR_CLT.IdtPntCpg;
    tCprPntCpg(i).DATPOS := nvl(rMIGR_CLT.DatPos, rMigr_Prm.Datpos);
    tCprPntCpg(i).DATDPS := rMIGR_CLT.DatDps;
    tCprPntCpg(i).IDCRLV := rMIGR_CLT.IdcRlv;
    tCprPntCpg(i).TYPCPRFAC := rMIGR_CLT.TypCprFac;
    tCprPntCpg(i).CFTCOR := 0;
    tCprPntCpg(i).IDTUSGCPR := 1;

    --  if gSwInsererLgn = 1  then
    --    Err_Msg := 'Insercion en la table CPRPNTCPG';
    --    forall j in 1..tCprPntCpg.Count
    --      insert into X7.CPRPNTCPG values tCprPntCpg(j);
    --    tCprPntCpg.Delete;
    --    tCpr.Delete;
    --  end if;
    stack.DeleteItem(Err_TableName);

  end INSCPRPNTCPG;

  /****************************************************************************/
  /****************************************************************************/
  /****************************************************************************/

  Procedure INSCTR(rMIGR_CLT IN OUT MIGR_CLT%ROWTYPE) is

    ------------------------------------------------------------------------------
    -- Procesos de inserci?n de la informaci?n en la tabla CTR                  --
    ------------------------------------------------------------------------------
    i number;
  begin
    stack.InsertItem(Err_TableName, 'INSCTR');

    if rMIGR_CLT.IdtCtr is null then
      rMIGR_CLT.IdtCtr := gIdtCtr;
      gIdtCtr          := gIdtCtr + 1;
    end if;

    Err_IdtClt := rMIGR_CLT.IdtSqc;
    Err_IdtCtr := rMIGR_CLT.IdtCtr;
    Err_Msg    := 'Inicio Asignaci?n de valores';

    Err_Msg := 'Inserci?n de datos en la tabla CTR - ' || gIdtCtr;

    i := tCtr.Count + 1;
    tCtr(i).IDTCTR := rMIGR_CLT.IdtCtr;
    tCtr(i).SQCAVN := rMIGR_CLT.NumAvn;
    tCtr(i).IDTPNTLVR := rMIGR_CLT.IdtPntLvr;
    tCtr(i).IDTPNTCPG := rMIGR_CLT.IdtPntCpg;
    tCtr(i).IDTCLTDST := rMIGR_CLT.IdtCltDst;
    tCtr(i).IDTCLTSSC := rMIGR_CLT.IdtCltSsc;
    tCtr(i).IDTCNTOPR := rMIGR_CLT.IdtCntOpr;
    tCtr(i).IDTCODSNS := rMIGR_CLT.IdtCodSns;
    tCtr(i).DATSCR := nvl(rMIGR_CLT.DatScr, sysdate);
    tCtr(i).DATRSL := rMIGR_CLT.DatRsl;
    tCtr(i).DATDRNFCT := rMIGR_CLT.DatDrnFct;
    tCtr(i).DEBDRNPRDFCT := rMIGR_CLT.DebDrnPrdFct;
    tCtr(i).FINDRNPRDFCT := rMIGR_CLT.FinDrnPrdFct;
    tCtr(i).DATCRT := nvl(rMIGR_CLT.DatCrt, rMIGR_PRM.DatCrt);
    tCtr(i).IDTSRV := rMIGR_CLT.IdtSrv;
    tCtr(i).ETTCTR := 1;
    tCtr(i).ETTCTRFCT := 1;
    tCtr(i).CODTYPCTR := nvl(rMIGR_CLT.CodTypCtr, rMigr_Prm.Codtypctr);
    tCtr(i).IDTRCVTYP := rMIGR_CLT.IdtRcvTyp;
    --tCtr(i).IDTMODRGL    := rMIGR_CLT.IdtModRgl;
    tCtr(i).IDTBNQ := rMIGR_CLT.IdtBnq;
    tCtr(i).IDTGCH := rMIGR_CLT.IdtGch;
    tCtr(i).NUMCPTBNC := rMIGR_CLT.NumCptBnc;
    tCtr(i).CLERIB := rMIGR_CLT.CleRib;
    tCtr(i).AncRfr := rMIGR_CLT.AncRfrCtr;

    tCtr(i).C1 := rMIGR_CLT.CTR_C1;
    tCtr(i).C2 := rMIGR_CLT.CTR_C2;
    tCtr(i).C3 := rMIGR_CLT.CTR_C3;
    tCtr(i).C4 := rMIGR_CLT.CTR_C4;
    tCtr(i).C5 := rMIGR_CLT.CTR_C5;

    tCtr(i).IdtT1 := rMIGR_CLT.CTR_IdtT1;
    tCtr(i).T1 := rMIGR_CLT.CTR_T1;
    tCtr(i).IdtT2 := rMIGR_CLT.CTR_IdtT2;
    tCtr(i).T2 := rMIGR_CLT.CTR_T2;
    tCtr(i).IdtT3 := rMIGR_CLT.CTR_IdtT3;
    tCtr(i).T3 := rMIGR_CLT.CTR_T3;
    tCtr(i).IdtT4 := rMIGR_CLT.CTR_IdtT4;
    tCtr(i).T4 := rMIGR_CLT.CTR_T4;
    tCtr(i).IdtT5 := rMIGR_CLT.CTR_IdtT5;
    tCtr(i).T5 := rMIGR_CLT.CTR_T5;

    --  if gSwInsererLgn = 1  then
    --    Err_Msg := 'Insercion en la table CTR';
    --    forall j in 1..tCtr.Count
    --      insert into X7.CTR values tCtr(j);
    --    tCtr.Delete;
    --  end if;

    stack.DeleteItem(Err_TableName);

  end INSCTR;

  /****************************************************************************/
  /****************************************************************************/
  /****************************************************************************/

  Procedure INSAVTCTR(rMIGR_CLT IN OUT MIGR_CLT%ROWTYPE) is

    ------------------------------------------------------------------------------
    -- Procesos de inserci?n de la informaci?n en la tabla AVTCTR               --
    ------------------------------------------------------------------------------
    i number;
  begin
    stack.InsertItem(Err_TableName, 'INSAVTCTR');
    Err_IdtClt := rMIGR_CLT.IdtSqc;
    Err_IdtCtr := rMIGR_CLT.IdtCtr;
    Err_IdtCtr := rMIGR_CLT.IdtCtr;

    Err_Msg := 'Inserci?n de datos en la tabla AVTCTR';

    i := tAvtCtr.Count + 1;
    tAvtCtr(i).IDTCLT := rMIGR_CLT.IdtClt;
    tAvtCtr(i).IDTCTR := rMIGR_CLT.IdtCtr;
    tAvtCtr(i).NUMAVN := rMIGR_CLT.NumAvn;
    tAvtCtr(i).IDTTRF := rMIGR_CLT.IdtTrf;
    tAvtCtr(i).IDTFACTYP := rMIGR_CLT.IdtFacTyp;
    tAvtCtr(i).IDTACV := rMIGR_CLT.IdtAcv;
    tAvtCtr(i).MTRAGT := rMIGR_PRM.MtrAgt;
    tAvtCtr(i).DATMAJ := rMIGR_PRM.DatMaj;
    tAvtCtr(i).DATDBT := rMIGR_CLT.DatDbt;
    tAvtCtr(i).DATFIN := rMIGR_CLT.DatFin;
    tAvtCtr(i).EXNTVA := rMIGR_CLT.ExnTva;
    tAvtCtr(i).DATCRT := nvl(rMIGR_CLT.DatCrt, rMIGR_PRM.DatCrt);
    tAvtCtr(i).IDTCLTDST := rMIGR_CLT.IdtCltDst;
    tAvtCtr(i).CHP01 := rMIGR_CLT.Chp01;
    tAvtCtr(i).CHP02 := rMIGR_CLT.Chp02;
    tAvtCtr(i).CHP03 := rMIGR_CLT.Chp03;
    tAvtCtr(i).CHP04 := rMIGR_CLT.Chp04;
    tAvtCtr(i).CHP05 := rMIGR_CLT.Chp05;
    tAvtCtr(i).CHP11 := rMIGR_CLT.Chp11;
    tAvtCtr(i).CHP12 := nvl(rMIGR_CLT.Chp12, 0);
    tAvtCtr(i).CHP13 := rMIGR_CLT.Chp13;
    tAvtCtr(i).CHP14 := rMIGR_CLT.Chp14;
    tAvtCtr(i).CFFMLP := rMIGR_CLT.CFFMLP;

    Err_Msg := 'Actualizaci?n de la tabla CTR con la secuencia del acta adicional';

    --  if gSwInsererLgn = 1  then
    --    Err_Msg := 'Insercion en la table AVTCTR';
    --    forall j in 1..tAvtCtr.Count
    --      insert into X7.AVTCTR values tAvtCtr(j);
    ----    forall j in 1..tAvtCtr.Count
    ----    update X7.CTR set SqcAvn = tAvtCtr(j).NUMAVN
    ----     where X7.CTR.IDtCtr = tAvtCtr(j).IdtCtr;
    --    tAvtCtr.Delete;
    --  end if;

    stack.DeleteItem(Err_TableName);

  end INSAVTCTR;

/****************************************************************************/
/****************************************************************************/
/****************************************************************************/

/*Procedure INSCTRFAC(rCtrFac IN OUT CTRFAC%ROWTYPE) is

------------------------------------------------------------------------------
-- Procesos de inserci?n de la informaci?n en la tabla IND                  --
------------------------------------------------------------------------------

  vPrd varchar2(2);
  vAnn varchar2(4);
  vMaxPrd varchar2(2);

begin
--  stack.InsertItem(Err_TableName,'INSCTRFAC');
  Err_IdtCtr := rCTRFAC.IdtCtr;
  Err_Msg := 'Inicio Asignaci?n de valores';

  Err_Msg := 'B?squeda de la sequencia de IdtFac';

  if rCTRFAC.IdtFac is null then
    rCTRFAC.IdtFac := gIdtFac;
    gIdtFac := gIdtFac + 1;
  end if;

  if rCTRFAC.DatFinPrd is null then

    Err_Msg := 'B?squeda del m?ximo periodo de facturaci?n para el ciclo de facturaci?n';
    select max(IdtPrdFac)
      into vMaxPrd
      from X7.PRDFAC
      where IdtCycFac = rCTRFAC.IdtCycFac;

    vAnn := substr(rCTRFAC.IdtPrdFac,1,4);
    vPrd := substr(rCTRFAC.IdtPrdFac,5,2);

    Err_Msg := 'B?squeda de la fecha de inicio del periodo de facturaci?n';

    select TO_DATE(PRMJOU || '/' || PRMMOI || '/' || vAnn,'DD/MM/YYYY')
      into rCTRFAC.DatDbtPrd
      from PRDFAC
      where PRDFAC.IDTPRDFAC=vPrd
       and  PRDFAC.IDTCYCFAC=rCTRFAC.IdtCycFac;

    vPrd := lpad(vPrd + 1,2,'0');
    if vPrd > vMaxPrd then
      vPrd := '01';
      vAnn := vAnn + 1;
    end if;

    Err_Msg := 'B?squeda de la fecha de fin del periodo de facturaci?n' || vAnn || '-' || vPrd;

    select TO_DATE(PRMJOU || '/' || PRMMOI || '/' || vAnn,'DD/MM/YYYY') - 1
      into rCTRFAC.DatFinPrd
      from PRDFAC
      where PRDFAC.IDTPRDFAC=vPrd
       and  PRDFAC.IDTCYCFAC=rCTRFAC.IdtCycFac;

  end if;

  if rCTRFAC.DatDbtPrd is null then

    vAnn := to_char(rCTRFAC.DatFinPrd,'yyyy');

    Err_Msg := 'B?squeda de la fecha de inicio anterior a la fecha de fin';

    select max(to_date(lpad(PrmJou,2,'0') ||
                       lpad(PrmMoi,2,'0') ||
                       vAnn,'ddmmyyyy'))
      into rCTRFAC.DatDbtPrd
      from X7.PRDFAC
      where IdtCycFac = rCTRFAC.IdtCycFac
       and  to_date(lpad(PrmJou,2,'0') ||
                       lpad(PrmMoi,2,'0') ||
                       vAnn,'ddmmyyyy') < rCTRFAC.DatFinPrd;

  end if;

--  if rCTRFAC.IdtPrdFac is null then
--    vAnn := to_char(rCTRFAC.DatDbtPrd,'yyyy');

--    select vAnn || IdtPrd
--      into rCTRFAC.IdtPrdFac
--      from X7.PRDFAC a
--      where to_date(lpad(PrmJou,2,'0') || lpad(PrmMoi,2,'0') || vAnn,'ddmmyyyy') =
--            (select max(to_date(lpad(PrmJou,2,'0') ||
--                                lpad(PrmMoi,2,'0') ||
--                                vAnn,'ddmmyyyy'))
--               from X7.PRDFAC b
--               where a.IdtCycFac = b.IdtCycFac)
--       and  a.IdtCycFac = rCTRFAC.IdtCycFac;



  insert into X7.CTRFAC (IDTCTR,
                         NUMAVN,
                         IDTFAC,
                         IDTMSGAPL,
                         IDTCYCFAC,
                         IDTPRDFAC,
                         DATDBTPRD,
                         DATFINPRD)
                 Values (rCTRFAC.IdtCtr,
                         rCTRFAC.NumAvn,
                         rCTRFAC.IdtFac,
                         rCTRFAC.IdtMsgApl,
                         rCTRFAC.IdtCycFac,
                         rCTRFAC.IdtPrdFac,
                         rCTRFAC.DatDbtPrd,
                         rCTRFAC.DatFinPrd);

--  stack.DeleteItem(Err_TableName);

end INSCTRFAC;*/

/****************************************************************************/
/****************************************************************************/
/****************************************************************************/
/*Procedure INSIND(tMIGR_CLT IN OUT typLstMIGR_CLT, pSwCtrFac number) is
rMIGR_CLT MIGR_CLT%ROWTYPE;
vSwInsererLgn number;
BEGIN
  vSwInsererLgn := gSwInsererLgn;
  gSwInsererLgn := 0;
  for i in 1..tMIGR_CLT.Count loop
    rMIGR_CLT := tMIGR_CLT(i);
    if i = tMIGR_CLT.Count then
      gSwInsererLgn := vSwInsererLgn;
    end if;
    INSIND(rMIGR_CLT, pSwCtrFac);
  end loop;
  gSwInsererLgn := vSwInsererLgn;
end INSIND;*/

/*Procedure INSIND(rMIGR_CLT IN OUT MIGR_CLT%ROWTYPE, pSwCtrFac number) is

------------------------------------------------------------------------------
-- Procesos de inserci?n de la informaci?n en la tabla IND                  --
------------------------------------------------------------------------------

tINDCNS  typTABLE;
vMaxIdtCns number := 0;
vMaxIdtInd number := 0;
vTopMed number;
rCTRFAC CTRFAC%ROWTYPE;
vEvlCns number(1);
vFrc number(1);
vNumFct FAC.NumFct%TYPE;
vNbr number;
vLgnCns number;

cursor cMIGR_FAC is
  select IdtFac
  from MIGR_FAC
  where NumFct = vNumFct;

rMIGR_FAC cMIGR_FAC%ROWTYPE;

begin
  stack.InsertItem(Err_TableName,'INSIND');
  Err_IdtClt := rMIGR_CLT.IdtSqc;
  Err_IdtCtr := rMIGR_CLT.IdtCtr;
  Err_Msg := 'Inicio Asignaci?n de valores';

-- Tope del Medidor

  vTopMed := power(10,rMIGR_CLT.NbrRou);

  Err_Msg := 'Consumo 1';
  tINDCNS(1).Ind       := rMIGR_CLT.Lct1;
  tINDCNS(1).Cns       := rMIGR_CLT.Cns1;
  tINDCNS(1).IdtCodObs := rMIGR_CLT.IdtCodObs1;
  tINDCNS(1).DatLct    := rMIGR_CLT.DatLct1;
  tINDCNS(1).PrdFac    := rMIGR_CLT.PrdFac1;
  tINDCNS(1).IdtCodRlv := nvl(rMIGR_CLT.IdtCodRlv1,rMIGR_PRM.IdtCodRlv);
  tINDCNS(1).IdtCodOrg := nvl(rMIGR_CLT.IdtCodOrg1,rMIGR_PRM.IdtCodOrg);
  tINDCNS(1).NumFct    := rMIGR_CLT.NumFct1;
  tINDCNS(1).IdtFac    := rMIGR_CLT.IdtFac1;

  Err_Msg := 'Consumo 2';
  tINDCNS(2).Ind       := rMIGR_CLT.Lct2;
  tINDCNS(2).Cns       := rMIGR_CLT.Cns2;
  tINDCNS(2).IdtCodObs := rMIGR_CLT.IdtCodObs2;
  tINDCNS(2).DatLct    := rMIGR_CLT.DatLct2;
  tINDCNS(2).PrdFac    := rMIGR_CLT.PrdFac2;
  tINDCNS(2).IdtCodRlv := nvl(rMIGR_CLT.IdtCodRlv2,rMIGR_PRM.IdtCodRlv);
  tINDCNS(2).IdtCodOrg := nvl(rMIGR_CLT.IdtCodOrg2,rMIGR_PRM.IdtCodOrg);
  tINDCNS(2).NumFct    := rMIGR_CLT.NumFct2;
  tINDCNS(2).IdtFac    := rMIGR_CLT.IdtFac2;

  Err_Msg := 'Consumo 3';
  tINDCNS(3).Ind       := rMIGR_CLT.Lct3;
  tINDCNS(3).Cns       := rMIGR_CLT.Cns3;
  tINDCNS(3).IdtCodObs := rMIGR_CLT.IdtCodObs3;
  tINDCNS(3).DatLct    := rMIGR_CLT.DatLct3;
  tINDCNS(3).PrdFac    := rMIGR_CLT.PrdFac3;
  tINDCNS(3).IdtCodRlv := nvl(rMIGR_CLT.IdtCodRlv3,rMIGR_PRM.IdtCodRlv);
  tINDCNS(3).IdtCodOrg := nvl(rMIGR_CLT.IdtCodOrg3,rMIGR_PRM.IdtCodOrg);
  tINDCNS(3).NumFct    := rMIGR_CLT.NumFct3;
  tINDCNS(3).IdtFac    := rMIGR_CLT.IdtFac3;

  Err_Msg := 'Consumo 4';
  tINDCNS(4).Ind       := rMIGR_CLT.Lct4;
  tINDCNS(4).Cns       := rMIGR_CLT.Cns4;
  tINDCNS(4).IdtCodObs := rMIGR_CLT.IdtCodObs4;
  tINDCNS(4).DatLct    := rMIGR_CLT.DatLct4;
  tINDCNS(4).PrdFac    := rMIGR_CLT.PrdFac4;
  tINDCNS(4).IdtCodRlv := nvl(rMIGR_CLT.IdtCodRlv4,rMIGR_PRM.IdtCodRlv);
  tINDCNS(4).IdtCodOrg := nvl(rMIGR_CLT.IdtCodOrg4,rMIGR_PRM.IdtCodOrg);
  tINDCNS(4).NumFct    := rMIGR_CLT.NumFct4;
  tINDCNS(4).IdtFac    := rMIGR_CLT.IdtFac4;

  Err_Msg := 'Consumo 5';
  tINDCNS(5).Ind       := rMIGR_CLT.Lct5;
  tINDCNS(5).Cns       := rMIGR_CLT.Cns5;
  tINDCNS(5).IdtCodObs := rMIGR_CLT.IdtCodObs5;
  tINDCNS(5).DatLct    := rMIGR_CLT.DatLct5;
  tINDCNS(5).PrdFac    := rMIGR_CLT.PrdFac5;
  tINDCNS(5).IdtCodRlv := nvl(rMIGR_CLT.IdtCodRlv5,rMIGR_PRM.IdtCodRlv);
  tINDCNS(5).IdtCodOrg := nvl(rMIGR_CLT.IdtCodOrg5,rMIGR_PRM.IdtCodOrg);
  tINDCNS(5).NumFct    := rMIGR_CLT.NumFct5;
  tINDCNS(5).IdtFac    := rMIGR_CLT.IdtFac5;

  Err_Msg := 'Consumo 6';
  tINDCNS(6).Ind       := rMIGR_CLT.Lct6;
  tINDCNS(6).Cns       := rMIGR_CLT.Cns6;
  tINDCNS(6).IdtCodObs := rMIGR_CLT.IdtCodObs6;
  tINDCNS(6).DatLct    := rMIGR_CLT.DatLct6;
  tINDCNS(6).PrdFac    := rMIGR_CLT.PrdFac6;
  tINDCNS(6).IdtCodRlv := nvl(rMIGR_CLT.IdtCodRlv6,rMIGR_PRM.IdtCodRlv);
  tINDCNS(6).IdtCodOrg := nvl(rMIGR_CLT.IdtCodOrg6,rMIGR_PRM.IdtCodOrg);
  tINDCNS(6).NumFct    := rMIGR_CLT.NumFct6;
  tINDCNS(6).IdtFac    := rMIGR_CLT.IdtFac6;

  Err_Msg := 'Consumo 7';
  tINDCNS(7).Ind       := rMIGR_CLT.Lct7;
  tINDCNS(7).Cns       := rMIGR_CLT.Cns7;
  tINDCNS(7).IdtCodObs := rMIGR_CLT.IdtCodObs7;
  tINDCNS(7).DatLct    := rMIGR_CLT.DatLct7;
  tINDCNS(7).PrdFac    := rMIGR_CLT.PrdFac7;
  tINDCNS(7).IdtCodRlv := nvl(rMIGR_CLT.IdtCodRlv7,rMIGR_PRM.IdtCodRlv);
  tINDCNS(7).IdtCodOrg := nvl(rMIGR_CLT.IdtCodOrg7,rMIGR_PRM.IdtCodOrg);
  tINDCNS(7).NumFct    := rMIGR_CLT.NumFct7;
  tINDCNS(7).IdtFac    := rMIGR_CLT.IdtFac7;

  Err_Msg := 'Consumo 8';
  tINDCNS(8).Ind       := rMIGR_CLT.Lct8;
  tINDCNS(8).Cns       := rMIGR_CLT.Cns8;
  tINDCNS(8).IdtCodObs := rMIGR_CLT.IdtCodObs8;
  tINDCNS(8).DatLct    := rMIGR_CLT.DatLct8;
  tINDCNS(8).PrdFac    := rMIGR_CLT.PrdFac8;
  tINDCNS(8).IdtCodRlv := nvl(rMIGR_CLT.IdtCodRlv8,rMIGR_PRM.IdtCodRlv);
  tINDCNS(8).IdtCodOrg := nvl(rMIGR_CLT.IdtCodOrg8,rMIGR_PRM.IdtCodOrg);
  tINDCNS(8).NumFct    := rMIGR_CLT.NumFct8;
  tINDCNS(8).IdtFac    := rMIGR_CLT.IdtFac8;

  Err_Msg := 'Consumo 9';
  tINDCNS(9).Ind       := rMIGR_CLT.Lct9;
  tINDCNS(9).Cns       := rMIGR_CLT.Cns9;
  tINDCNS(9).IdtCodObs := rMIGR_CLT.IdtCodObs9;
  tINDCNS(9).DatLct    := rMIGR_CLT.DatLct9;
  tINDCNS(9).PrdFac    := rMIGR_CLT.PrdFac9;
  tINDCNS(9).IdtCodRlv := nvl(rMIGR_CLT.IdtCodRlv9,rMIGR_PRM.IdtCodRlv);
  tINDCNS(9).IdtCodOrg := nvl(rMIGR_CLT.IdtCodOrg9,rMIGR_PRM.IdtCodOrg);
  tINDCNS(9).NumFct    := rMIGR_CLT.NumFct9;
  tINDCNS(9).IdtFac    := rMIGR_CLT.IdtFac9;

  Err_Msg := 'Consumo 10';
  tINDCNS(10).Ind       := rMIGR_CLT.Lct10;
  tINDCNS(10).Cns       := rMIGR_CLT.Cns10;
  tINDCNS(10).IdtCodObs := rMIGR_CLT.IdtCodObs10;
  tINDCNS(10).DatLct    := rMIGR_CLT.DatLct10;
  tINDCNS(10).PrdFac    := rMIGR_CLT.PrdFac10;
  tINDCNS(10).IdtCodRlv := nvl(rMIGR_CLT.IdtCodRlv10,rMIGR_PRM.IdtCodRlv);
  tINDCNS(10).IdtCodOrg := nvl(rMIGR_CLT.IdtCodOrg10,rMIGR_PRM.IdtCodOrg);
  tINDCNS(10).NumFct    := rMIGR_CLT.NumFct10;
  tINDCNS(10).IdtFac    := rMIGR_CLT.IdtFac10;

  Err_Msg := 'Consumo 11';
  tINDCNS(11).Ind       := rMIGR_CLT.Lct11;
  tINDCNS(11).Cns       := rMIGR_CLT.Cns11;
  tINDCNS(11).IdtCodObs := rMIGR_CLT.IdtCodObs11;
  tINDCNS(11).DatLct    := rMIGR_CLT.DatLct11;
  tINDCNS(11).PrdFac    := rMIGR_CLT.PrdFac11;
  tINDCNS(11).IdtCodRlv := nvl(rMIGR_CLT.IdtCodRlv11,rMIGR_PRM.IdtCodRlv);
  tINDCNS(11).IdtCodOrg := nvl(rMIGR_CLT.IdtCodOrg11,rMIGR_PRM.IdtCodOrg);
  tINDCNS(11).NumFct    := rMIGR_CLT.NumFct11;
  tINDCNS(11).IdtFac    := rMIGR_CLT.IdtFac11;

  Err_Msg := 'Consumo 12';
  tINDCNS(12).Ind       := rMIGR_CLT.Lct12;
  tINDCNS(12).Cns       := rMIGR_CLT.Cns12;
  tINDCNS(12).IdtCodObs := rMIGR_CLT.IdtCodObs12;
  tINDCNS(12).DatLct    := rMIGR_CLT.DatLct12;
  tINDCNS(12).PrdFac    := rMIGR_CLT.PrdFac12;
  tINDCNS(12).IdtCodRlv := nvl(rMIGR_CLT.IdtCodRlv12,rMIGR_PRM.IdtCodRlv);
  tINDCNS(12).IdtCodOrg := nvl(rMIGR_CLT.IdtCodOrg12,rMIGR_PRM.IdtCodOrg);
  tINDCNS(12).NumFct    := rMIGR_CLT.NumFct12;
  tINDCNS(12).IdtFac    := rMIGR_CLT.IdtFac12;

  tINDCNS(13).Ind       := null;

  Err_Msg := 'C?lculo de la lectura si no viene del maestro';

------------------------------------------------------------------------------
-- Si la lectura no viene del maestro de migraci?n, se realiza el c?lculo   --
-- de la lectura a partir de la lectura m?s reciente y el consumo m?s       --
-- reciente. Es obligatorio que al menos la lectura actual y todos los      --
-- consumos que se van a migrar se encuentren en la tabla maestra de        --
-- migraci?n.                                                               --
------------------------------------------------------------------------------

  for i in 1..12 loop
    Err_Msg := 'C?lculo de la lectura si no viene del maestro. Lectura : ' || i;
    if tINDCNS(i).Ind is null then
      if tINDCNS(i).Cns is not null then
        tINDCNS(i).Ind := tINDCNS(i-1).Ind - tINDCNS(i-1).Cns;
        if tINDCNS(i).Ind < 0 then
          tINDCNS(i).Ind := tINDCNS(i).Ind + vTopMed;
        end if;
      end if;
    end if;
    if tINDCNS(i).DatLct is null and tINDCNS(i).Cns is not null  then
    Err_Msg := 'C?lculo de la fecha de lectura si no viene del maestro. Lectura : ' || i;
      if tINDCNS(i-1).Cns is not null then
        tINDCNS(i).DatLct := add_months(tINDCNS(i-1).DatLct,-12);
      end if;
    end if;
  end loop;

  Err_Msg := 'Asignaci?n de IdtInd e IdtCns e inserci?n en tablas';

  select nvl(SqcInd,0), nvl(SqcCns,0)
    into vMaxIdtInd, vMaxIdtCns
    from X7.CPR
    where IdtCpr = rMIGR_CLT.IdtCpr;

------------------------------------------------------------------------------
-- Asignaci?n del IdtInd e IdtCns e inserci?n en las tablas IND, CNS        --
------------------------------------------------------------------------------

  for i in REVERSE 1..12 loop
    Err_Msg := 'Inicio Loop ' || i || '-' || tINDCNS(i).Ind || '-' || rMIGR_CLT.Ord;
    if tINDCNS(i).Ind is not null then
      Err_Msg := 'Inicio Loop - Entra if 1 ' || i;
      vMaxIdtInd := vMaxIdtInd + 1;
      tINDCNS(i).IdtInd := vMaxIdtInd;
--      vMaxIdtInd := tINDCNS(i).IdtInd;
      tINDCNS(i).IdtCodRlv := nvl(tINDCNS(i).IdtCodRlv,rMIGR_PRM.IdtCodRlv);
      tINDCNS(i).IdtCodOrg := nvl(tINDCNS(i).IdtCodOrg,rMIGR_PRM.IdtCodOrg);
      vFrc := 0;
      vEvlCns := 0;

      if tINDCNS(i).IdtCodRlv in (3,4,5) then
        vEvlCns := 1;
        vFrc := 0;
      end if;

--      if tINDCNS(i).IdtCodObs is not null then
--        select EvlCns, Frc into vEvlCns, vFrc
--          from CODOBS
--          where IdtCodObs = tINDCNS(i).IdtCodObs;
--        if vEvlCns = 1 then
--           tINDCNS(i).IdtCodRlv := nvl(tINDCNS(i).IdtCodRlv,3);
--        end if;
--      end if;


      Err_Msg := 'Inserci?n en la tabla IND. IdtInd = ' || ltrim(to_char(tINDCNS(i).IdtInd));

      Err_Msg := 'CODRLV : ' || tINDCNS(i).IdtCodRlv || 'CODOBS : ' || tINDCNS(i).IdtCodObs;

      insert into X7.IND (IDTCPR,
                          IDTAGT,
                          NUMCDR,
                          IDTIND,
                          IDTCODORG,
                          IDTCODRLV,
                          IDTCODOBS,
                          DATLCTIND,
                          IND,
                          CFF,
                          IDXFCT,
                          CNS,
                          MTRAGT,
                          DATMAJ,
                          FRC,
                          PRVIND)
                  values (rMIGR_CLT.IdtCpr,
                          rMIGR_PRM.MtrAgt,
                          1,
                          tINDCNS(i).IdtInd,
                          tINDCNS(i).IdtCodOrg,
                          tINDCNS(i).IdtCodRlv,
                          tINDCNS(i).IdtCodObs,
                          tINDCNS(i).DatLct,
                          tINDCNS(i).Ind,
                          rMIGR_CLT.Cff,
                          1,
                          tINDCNS(i).Cns,
                          rMIGR_PRM.MtrAgt,
                          rMIGR_PRM.DatMaj,
                          vFrc,
                          1);

    end if;

    if tINDCNS(i+1).IdtInd is null and tINDCNS(i).IdtInd is not null then
      tINDCNS(i+1).IdtInd := tINDCNS(i).IdtInd - 1;
      Err_Msg := 'B?squeda de la lectura anterior en X7.IND' || '-' || tINDCNS(i+1).IdtInd || '-' || rMIGR_CLT.Ord;
      BEGIN
        select DatLctInd
          into tINDCNS(i+1).DatLct
          from X7.IND
          where IdtCpr = rMIGR_CLT.IdtCpr
           and  NumCdr = 1
           and  IdtInd = tINDCNS(i+1).IdtInd;
      EXCEPTION
        when NO_DATA_FOUND then
          tINDCNS(i+1).IdtInd := null;
      END;
    end if;

    if tINDCNS(i).Cns is not null and tINDCNS(i+1).IdtInd is not null then
      vMaxIdtCns := vMaxIdtCns + 1;
      tINDCNS(i).IdtCns := vMaxIdtCns;
--      vMaxIdtCns := tINDCNS(i).IdtCns;


      if tINDCNS(i).IdtFac is null then
        Err_Msg := 'Asignaci?n de IdtFac';
        vNumFct := tINDCNS(i).NumFct;
        open cMIGR_FAC;
          fetch cMIGR_FAC into rMIGR_FAC;
          if cMIGR_FAC%NOTFOUND then
            rCTRFAC.IdtFac    := gIdtFac;
            gIdtFac := gIdtFac + 1;
          else
              rCTRFAC.IdtFac    := rMIGR_FAC.IdtFac;
          end if;
        close cMIGR_FAC;
      else
        rCTRFAC.IdtFac := tINDCNS(i).IdtFac;
      end if;

      if pSwCtrFac = 1 then

        rCTRFAC.IdtPrdFac := tINDCNS(i).PrdFac;
        rCTRFAC.IdtCtr    := rMIGR_CLT.IdtCtr;
        rCTRFAC.NumAvn    := rMIGR_CLT.NumAvn;
        rCTRFAC.DatDbtPrd := tINDCNS(i+1).DatLct + 1;
        rCTRFAC.DatFinPrd := tINDCNS(i).DatLct;

        Err_Msg := 'B?squeda del ciclo de facturaci?n de la factura tipo';

        select count(*)
          into vNbr
          from X7.CTRFAC
          where IdtFac = rCTRFAC.IdtFac;

        if vNbr = 0 then
          if rCTRFAC.IdtCycFac is null then
            select IdtCycFac
              into rCTRFAC.IdtCycFac
              from X7.FACTYP
              where IdtFacTyp = rMIGR_CLT.IdtFacTyp;
          end if;
          INSCTRFAC(rCTRFAC);
        end if;

      end if;

      Err_Msg := 'Inserci?n en la tabla CNS. IdtCns = ' ||
                 ltrim(to_char(nvl(tINDCNS(i+1).IdtCns,0))) || '-' ||
                 ltrim(to_char(tINDCNS(i).IdtCns)) || '-' ||
                 to_char(i);

      insert into X7.CNS (IDTCPR,
                          NUMCDR,
                          IDTCNS,
                          IDTINDNVE,
                          IDTCTR,
                          NUMAVN,
                          IDTFAC,
                          IDTINDANC,
                          DATLCTPRC,
                          DATLCTDRN,
                          CNS,
                          UNTCSM,
                          IDXFCT,
                          CNSEVL)
                  values (rMIGR_CLT.IdtCpr,
                          1,
                          tINDCNS(i).IdtCns,
                          tINDCNS(i).IdtInd,
                          rMIGR_CLT.IdtCtr,
                          rMIGR_CLT.NumAvn,
                          rCTRFAC.IdtFac,
                          tINDCNS(i+1).IdtInd,
                          tINDCNS(i+1).DatLct,
                          tINDCNS(i).DatLct,
                          tINDCNS(i).Cns,
                          rMIGR_PRM.UntCsm,
                          1,
                          vEvlCns);

      if i = 1 then
        rMIGR_CLT.IdtFac1 := rCTRFAC.IdtFac;
      elsif i = 2 then
        rMIGR_CLT.IdtFac2 := rCTRFAC.IdtFac;
      elsif i = 3 then
        rMIGR_CLT.IdtFac3 := rCTRFAC.IdtFac;
      elsif i = 4 then
        rMIGR_CLT.IdtFac4 := rCTRFAC.IdtFac;
      elsif i = 5 then
        rMIGR_CLT.IdtFac5 := rCTRFAC.IdtFac;
      elsif i = 6 then
        rMIGR_CLT.IdtFac6 := rCTRFAC.IdtFac;
      elsif i = 7 then
        rMIGR_CLT.IdtFac7 := rCTRFAC.IdtFac;
      elsif i = 8 then
        rMIGR_CLT.IdtFac8 := rCTRFAC.IdtFac;
      elsif i = 9 then
        rMIGR_CLT.IdtFac9 := rCTRFAC.IdtFac;
      elsif i = 10 then
        rMIGR_CLT.IdtFac10 := rCTRFAC.IdtFac;
      elsif i = 11 then
        rMIGR_CLT.IdtFac11 := rCTRFAC.IdtFac;
      elsif i = 12 then
        rMIGR_CLT.IdtFac12 := rCTRFAC.IdtFac;
      end if;

    end if;
  end loop;

  Err_Msg := 'Actualizaci?n de la tabla CPR con los ?ltimos IdtInd, IdtCns';


  update X7.CPR set SqcCns = vMaxIdtCns, SqcInd = vMaxIdtInd
    where idtcpr = rMIGR_CLT.IdtCpr;

  stack.DeleteItem(Err_TableName);

end INSIND;*/

/****************************************************************************/
/****************************************************************************/
/****************************************************************************/

/*PROCEDURE INSLGNFAC (rMIGR_FAC IN OUT MIGR_FAC%ROWTYPE,
                     rMIGR_CLT IN OUT MIGR_CLT%ROWTYPE)

is

tLGNFAC typTABLE_LGNFAC;

z number;

y number;

BEGIN

  stack.InsertItem(Err_TableName,'INSLGNFAC');
  Err_IdtClt := rMIGR_CLT.IdtClt;
  Err_IdtFac := rMIGR_FAC.IdtFac;
  Err_NumFac := rMIGR_FAC.NumFct;
  Err_Msg := 'Inicio Asignaci?n de valores';


  Err_Msg := 'Valores concepto 1 - IdtRbq';
  tLGNFAC(1).IdtRbq := rMIGR_FAC.IdtRbq1;

  Err_Msg := 'Valores concepto 1 - IdtTax';
  tLGNFAC(1).IdtTax := rMIGR_FAC.IdtTax1;

  Err_Msg := 'Valores concepto 1 - QteFct';
  tLGNFAC(1).QteFct := rMIGR_FAC.QteFct1;

  Err_Msg := 'Valores concepto 1 - UntMsr';
  tLGNFAC(1).UntMsr := rMIGR_FAC.UntMsr1;

  Err_Msg := 'Valores concepto 1 - PrxUnt';
  tLGNFAC(1).PrxUnt := rMIGR_FAC.PrxUnt1;

  Err_Msg := 'Valores concepto 1 - MntHt';
  tLGNFAC(1).MntHt  := rMIGR_FAC.MntHtRbq1;

  Err_Msg := 'Valores concepto 1 - MntTva';
  tLGNFAC(1).MntTva := rMIGR_FAC.MntTvaRbq1;

  Err_Msg := 'Valores concepto 1 - RbqCmm';
  tLGNFAC(1).RbqCmm := rMIGR_FAC.RbqCmm1;

  Err_Msg := 'Valores concepto 1 - DatDbt';
  tLGNFAC(1).DatDbtPrd := rMIGR_FAC.DatDbtPrdRbq1;

  Err_Msg := 'Valores concepto 1 - DatFin';
  tLGNFAC(1).DatFinPrd := rMIGR_FAC.DatFinPrdRbq1;

  Err_Msg := 'Valores concepto 2';
  tLGNFAC(2).IdtRbq := rMIGR_FAC.IdtRbq2;
  tLGNFAC(2).IdtTax := rMIGR_FAC.IdtTax2;
  tLGNFAC(2).QteFct := rMIGR_FAC.QteFct2;
  tLGNFAC(2).UntMsr := rMIGR_FAC.UntMsr2;
  tLGNFAC(2).PrxUnt := rMIGR_FAC.PrxUnt2;
  tLGNFAC(2).MntHt  := rMIGR_FAC.MntHtRbq2;
  tLGNFAC(2).MntTva := rMIGR_FAC.MntTvaRbq2;
  tLGNFAC(2).RbqCmm := rMIGR_FAC.RbqCmm2;
  tLGNFAC(2).DatDbtPrd := rMIGR_FAC.DatDbtPrdRbq2;
  tLGNFAC(2).DatFinPrd := rMIGR_FAC.DatFinPrdRbq2;

  Err_Msg := 'Valores concepto 3';
  tLGNFAC(3).IdtRbq := rMIGR_FAC.IdtRbq3;
  tLGNFAC(3).IdtTax := rMIGR_FAC.IdtTax3;
  tLGNFAC(3).QteFct := rMIGR_FAC.QteFct3;
  tLGNFAC(3).UntMsr := rMIGR_FAC.UntMsr3;
  tLGNFAC(3).PrxUnt := rMIGR_FAC.PrxUnt3;
  tLGNFAC(3).MntHt  := rMIGR_FAC.MntHtRbq3;
  tLGNFAC(3).MntTva := rMIGR_FAC.MntTvaRbq3;
  tLGNFAC(3).RbqCmm := rMIGR_FAC.RbqCmm3;
  tLGNFAC(3).DatDbtPrd := rMIGR_FAC.DatDbtPrdRbq3;
  tLGNFAC(3).DatFinPrd := rMIGR_FAC.DatFinPrdRbq3;

  Err_Msg := 'Valores concepto 4';
  tLGNFAC(4).IdtRbq := rMIGR_FAC.IdtRbq4;
  tLGNFAC(4).IdtTax := rMIGR_FAC.IdtTax4;
  tLGNFAC(4).QteFct := rMIGR_FAC.QteFct4;
  tLGNFAC(4).UntMsr := rMIGR_FAC.UntMsr4;
  tLGNFAC(4).PrxUnt := rMIGR_FAC.PrxUnt4;
  tLGNFAC(4).MntHt  := rMIGR_FAC.MntHtRbq4;
  tLGNFAC(4).MntTva := rMIGR_FAC.MntTvaRbq4;
  tLGNFAC(4).RbqCmm := rMIGR_FAC.RbqCmm4;
  tLGNFAC(4).DatDbtPrd := rMIGR_FAC.DatDbtPrdRbq4;
  tLGNFAC(4).DatFinPrd := rMIGR_FAC.DatFinPrdRbq4;

  Err_Msg := 'Valores concepto 5';
  tLGNFAC(5).IdtRbq := rMIGR_FAC.IdtRbq5;
  tLGNFAC(5).IdtTax := rMIGR_FAC.IdtTax5;
  tLGNFAC(5).QteFct := rMIGR_FAC.QteFct5;
  tLGNFAC(5).UntMsr := rMIGR_FAC.UntMsr5;
  tLGNFAC(5).PrxUnt := rMIGR_FAC.PrxUnt5;
  tLGNFAC(5).MntHt  := rMIGR_FAC.MntHtRbq5;
  tLGNFAC(5).MntTva := rMIGR_FAC.MntTvaRbq5;
  tLGNFAC(5).RbqCmm := rMIGR_FAC.RbqCmm5;
  tLGNFAC(5).DatDbtPrd := rMIGR_FAC.DatDbtPrdRbq5;
  tLGNFAC(5).DatFinPrd := rMIGR_FAC.DatFinPrdRbq5;

  Err_Msg := 'Valores concepto 6';
  tLGNFAC(6).IdtRbq := rMIGR_FAC.IdtRbq6;
  tLGNFAC(6).IdtTax := rMIGR_FAC.IdtTax6;
  tLGNFAC(6).QteFct := rMIGR_FAC.QteFct6;
  tLGNFAC(6).UntMsr := rMIGR_FAC.UntMsr6;
  tLGNFAC(6).PrxUnt := rMIGR_FAC.PrxUnt6;
  tLGNFAC(6).MntHt  := rMIGR_FAC.MntHtRbq6;
  tLGNFAC(6).MntTva := rMIGR_FAC.MntTvaRbq6;
  tLGNFAC(6).RbqCmm := rMIGR_FAC.RbqCmm6;
  tLGNFAC(6).DatDbtPrd := rMIGR_FAC.DatDbtPrdRbq6;
  tLGNFAC(6).DatFinPrd := rMIGR_FAC.DatFinPrdRbq6;

  Err_Msg := 'Valores concepto 7';
  tLGNFAC(7).IdtRbq := rMIGR_FAC.IdtRbq7;
  tLGNFAC(7).IdtTax := rMIGR_FAC.IdtTax7;
  tLGNFAC(7).QteFct := rMIGR_FAC.QteFct7;
  tLGNFAC(7).UntMsr := rMIGR_FAC.UntMsr7;
  tLGNFAC(7).PrxUnt := rMIGR_FAC.PrxUnt7;
  tLGNFAC(7).MntHt  := rMIGR_FAC.MntHtRbq7;
  tLGNFAC(7).MntTva := rMIGR_FAC.MntTvaRbq7;
  tLGNFAC(7).RbqCmm := rMIGR_FAC.RbqCmm7;
  tLGNFAC(7).DatDbtPrd := rMIGR_FAC.DatDbtPrdRbq7;
  tLGNFAC(7).DatFinPrd := rMIGR_FAC.DatFinPrdRbq7;

  Err_Msg := 'Valores concepto 8';
  tLGNFAC(8).IdtRbq := rMIGR_FAC.IdtRbq8;
  tLGNFAC(8).IdtTax := rMIGR_FAC.IdtTax8;
  tLGNFAC(8).QteFct := rMIGR_FAC.QteFct8;
  tLGNFAC(8).UntMsr := rMIGR_FAC.UntMsr8;
  tLGNFAC(8).PrxUnt := rMIGR_FAC.PrxUnt8;
  tLGNFAC(8).MntHt  := rMIGR_FAC.MntHtRbq8;
  tLGNFAC(8).MntTva := rMIGR_FAC.MntTvaRbq8;
  tLGNFAC(8).RbqCmm := rMIGR_FAC.RbqCmm8;
  tLGNFAC(8).DatDbtPrd := rMIGR_FAC.DatDbtPrdRbq8;
  tLGNFAC(8).DatFinPrd := rMIGR_FAC.DatFinPrdRbq8;

  Err_Msg := 'Valores concepto 9';
  tLGNFAC(9).IdtRbq := rMIGR_FAC.IdtRbq9;
  tLGNFAC(9).IdtTax := rMIGR_FAC.IdtTax9;
  tLGNFAC(9).QteFct := rMIGR_FAC.QteFct9;
  tLGNFAC(9).UntMsr := rMIGR_FAC.UntMsr9;
  tLGNFAC(9).PrxUnt := rMIGR_FAC.PrxUnt9;
  tLGNFAC(9).MntHt  := rMIGR_FAC.MntHtRbq9;
  tLGNFAC(9).MntTva := rMIGR_FAC.MntTvaRbq9;
  tLGNFAC(9).RbqCmm := rMIGR_FAC.RbqCmm9;
  tLGNFAC(9).DatDbtPrd := rMIGR_FAC.DatDbtPrdRbq9;
  tLGNFAC(9).DatFinPrd := rMIGR_FAC.DatFinPrdRbq9;

  Err_Msg := 'Valores concepto 10';
  tLGNFAC(10).IdtRbq := rMIGR_FAC.IdtRbq10;
  tLGNFAC(10).IdtTax := rMIGR_FAC.IdtTax10;
  tLGNFAC(10).QteFct := rMIGR_FAC.QteFct10;
  tLGNFAC(10).UntMsr := rMIGR_FAC.UntMsr10;
  tLGNFAC(10).PrxUnt := rMIGR_FAC.PrxUnt10;
  tLGNFAC(10).MntHt  := rMIGR_FAC.MntHtRbq10;
  tLGNFAC(10).MntTva := rMIGR_FAC.MntTvaRbq10;
  tLGNFAC(10).RbqCmm := rMIGR_FAC.RbqCmm10;
  tLGNFAC(10).DatDbtPrd := rMIGR_FAC.DatDbtPrdRbq10;
  tLGNFAC(10).DatFinPrd := rMIGR_FAC.DatFinPrdRbq10;

  Err_Msg := 'Valores concepto 11';
  tLGNFAC(11).IdtRbq := rMIGR_FAC.IdtRbq11;
  tLGNFAC(11).IdtTax := rMIGR_FAC.IdtTax11;
  tLGNFAC(11).QteFct := rMIGR_FAC.QteFct11;
  tLGNFAC(11).UntMsr := rMIGR_FAC.UntMsr11;
  tLGNFAC(11).PrxUnt := rMIGR_FAC.PrxUnt11;
  tLGNFAC(11).MntHt  := rMIGR_FAC.MntHtRbq11;
  tLGNFAC(11).MntTva := rMIGR_FAC.MntTvaRbq11;
  tLGNFAC(11).RbqCmm := rMIGR_FAC.RbqCmm11;
  tLGNFAC(11).DatDbtPrd := rMIGR_FAC.DatDbtPrdRbq11;
  tLGNFAC(11).DatFinPrd := rMIGR_FAC.DatFinPrdRbq11;

  Err_Msg := 'Valores concepto 12';
  tLGNFAC(12).IdtRbq := rMIGR_FAC.IdtRbq12;
  tLGNFAC(12).IdtTax := rMIGR_FAC.IdtTax12;
  tLGNFAC(12).QteFct := rMIGR_FAC.QteFct12;
  tLGNFAC(12).UntMsr := rMIGR_FAC.UntMsr12;
  tLGNFAC(12).PrxUnt := rMIGR_FAC.PrxUnt12;
  tLGNFAC(12).MntHt  := rMIGR_FAC.MntHtRbq12;
  tLGNFAC(12).MntTva := rMIGR_FAC.MntTvaRbq12;
  tLGNFAC(12).RbqCmm := rMIGR_FAC.RbqCmm12;
  tLGNFAC(12).DatDbtPrd := rMIGR_FAC.DatDbtPrdRbq12;
  tLGNFAC(12).DatFinPrd := rMIGR_FAC.DatFinPrdRbq12;

  rMIGR_FAC.NumLgnFct := nvl(rMIGR_FAC.NumLgnFct,1);

  for i in 1..12 loop

    if tLGNFAC(i).IdtRbq is not null then

      Err_Msg := 'IdtRbq = ' || tLGNFAC(i).IdtRbq;

      --BPZ
      z := tLFac.Count + 1;

      tLFac(z).IDTFAC    := rMIGR_FAC.IdtFac;
      tLFac(z).NUMLGNFCT := rMIGR_FAC.NumLgnFct;
      tLFac(z).IDTCTR    := rMIGR_CLT.IdtCtr;
      tLFac(z).NUMAVN    := nvl(rMIGR_FAC.NumAvn,rMIGR_CLT.NumAvn);
      tLFac(z).IDTFACTYP := nvl(rMIGR_FAC.IdtFacTyp,rMIGR_CLT.IdtFacTyp);
      tLFac(z).IDTRBQ    := tLGNFAC(i).IdtRbq;
      tLFac(z).IDTTAX    := tLGNFAC(i).IdtTax;
      tLFac(z).QTEFCT    := tLGNFAC(i).QteFct;
      tLFac(z).QTEPRX    := tLGNFAC(i).QteFct;
      tLFac(z).PRXUNT    := tLGNFAC(i).PrxUnt;
      tLFac(z).DATDBTPRD := nvl(tLGNFAC(i).DatDbtPrd,rMIGR_FAC.DatDbtPrd);
      tLFac(z).DATFINPRD := nvl(tLGNFAC(i).DatFinPrd,rMIGR_FAC.DatFinPrd);
      tLFac(z).DATDBTRLV := nvl(tLGNFAC(i).DatDbtPrd,rMIGR_FAC.DatDbtPrd);
      tLFac(z).DATFINRLV := nvl(tLGNFAC(i).DatFinPrd,rMIGR_FAC.DatFinPrd);
      tLFac(z).DATDBTVLD := rMIGR_PRM.DatDbtVld;
      tLFac(z).MNTHT     := tLGNFAC(i).MntHt;
      tLFac(z).MNTTVA    := nvl(tLGNFAC(i).MntTva,0);
      tLFac(z).UNTMSR    := tLGNFAC(i).UntMsr;
      tLFac(z).RBQCMM    := nvl(tLGNFAC(i).RbqCmm,0);

\*
      insert into LGNFAC (IDTFAC,
                          NUMLGNFCT,
                          IDTCTR,
                          NUMAVN,
                          IDTFACTYP,
                          IDTRBQ,
                          IDTTAX,
                          QTEFCT,
                          QTEPRX,
                          PRXUNT,
                          DATDBTPRD,
                          DATFINPRD,
                          DATDBTRLV,
                          DATFINRLV,
                          DATDBTVLD,
                          MNTHT,
                          MNTTVA,
                          UNTMSR,
                          RBQCMM)
                  VALUES (rMIGR_FAC.IdtFac,
                          rMIGR_FAC.NumLgnFct,
                          rMIGR_CLT.IdtCtr,
                          nvl(rMIGR_FAC.NumAvn,rMIGR_CLT.NumAvn),
                          nvl(rMIGR_FAC.IdtFacTyp,rMIGR_CLT.IdtFacTyp),
                          tLGNFAC(i).IdtRbq,
                          tLGNFAC(i).IdtTax,
                          tLGNFAC(i).QteFct,
                          tLGNFAC(i).QteFct,
                          tLGNFAC(i).PrxUnt,
                          nvl(tLGNFAC(i).DatDbtPrd,rMIGR_FAC.DatDbtPrd),
                          nvl(tLGNFAC(i).DatFinPrd,rMIGR_FAC.DatFinPrd),
                          nvl(tLGNFAC(i).DatDbtPrd,rMIGR_FAC.DatDbtPrd),
                          nvl(tLGNFAC(i).DatFinPrd,rMIGR_FAC.DatFinPrd),
                          rMIGR_PRM.DatDbtVld,
                          tLGNFAC(i).MntHt,
                          nvl(tLGNFAC(i).MntTva,0),
                          tLGNFAC(i).UntMsr,
                          nvl(tLGNFAC(i).RbqCmm,0));
*\
        rMIGR_FAC.NumLgnFct := rMIGR_FAC.NumLgnFct + 1;

      end if;

  end loop;

--BPZ
--  if gSwInsererLgn = 1  then
--    forall y in 1..tLFac.Count
--      insert into X7.LGNFAC values tLFac(y);
--    tLFac.Delete;
--  end if;

  stack.DeleteItem(Err_TableName);

end INSLGNFAC;*/

/****************************************************************************/
/****************************************************************************/
/****************************************************************************/

/*Procedure INSLGNCSS(rMIGR_OPR IN OUT MIGR_OPR%ROWTYPE,
                    rMIGR_CLT IN MIGR_CLT%ROWTYPE) is

------------------------------------------------------------------------------
-- Procesos de inserci?n de la informaci?n en la tabla LGNCSS               --
------------------------------------------------------------------------------

begin
  stack.InsertItem(Err_TableName,'INSLGNCSS');
  Err_IdtClt := rMIGR_CLT.IdtClt;
  Err_Msg := 'Inicio Asignaci?n de valores';

  Err_Msg := 'Error while inserting data into LGNCSS';

  -- if rMIGR_OPR.IdtLgnCss is null then
  --  rMIGR_OPR.IdtLgnCss := gIdtLgnCss;
  -- end if;
  --  gIdtLgnCss := gIdtLgnCss + 1;
  -- end if;

  insert into X7.LGNCSS (IDTLGNCSS,
                         IDTMODRGL,
                         IDTCSS,
                         IDTAGT,
                         IDTBNQ,
                         IDTGCH,
                         IDTDVS,
                         IDTTYPOPR,
                         IDTCLT,
                         IDTCPTCLT,
                         IDTTYPMVM,
                         IDTCNTOPR,
                         IDTCODSNS,
                         DATCRT,
                         NUMCPTBNC,
                         CLERIB,
                         MNT,
                         RFR,
                         MNTRND,
                         MTNDVSTOT,
                         MNTDVS,
                         INFCPL,
                         DATMAJ)
                 values (gIdtLgnCss,
                         rMIGR_OPR.IdtModRgl,
                         rMIGR_PRM.IdtCss,
                         rMIGR_PRM.MtrAgt,
                         rMIGR_OPR.IdtBnq,
                         rMIGR_OPR.IdtGch,
                         rMIGR_OPR.IdtDvs,
                         rMIGR_OPR.IdtTypOpr2,
                         rMIGR_CLT.IdtClt,
                         decode(rMIGR_OPR.idttypopr,2,1,5,2),
                         decode(rMIGR_OPR.idttypopr,2,5,5,11),
                         rMIGR_CLT.IdtCntOpr,
                         rMIGR_CLT.IdtCodSns,
                         rMIGR_OPR.Datvlr,
                         rMIGR_OPR.NumCptBnc,
                         rMIGR_OPR.CleRib,
                         rMIGR_OPR.Mnt,
                         NULL,
                         0,
                         rMIGR_OPR.Mnt,
                         rMIGR_OPR.Mnt,
                         rMIGR_OPR.Rfr,
                         rMIGR_OPR.datcrt);
    -- change reference for correct insert into OPR
    rMIGR_OPR.infcpl := rMIGR_OPR.rfr;
    rMIGR_OPR.rfr := gidtlgncss;

-- increment the line number for next insert
        gIdtLgnCss := gIdtLgnCss + 1;

    stack.DeleteItem(Err_TableName);

end INSLGNCSS;*/

/****************************************************************************/
/****************************************************************************/
/****************************************************************************/

/*PROCEDURE INSOPR (rMIGR_OPR IN OUT MIGR_OPR%ROWTYPE,
                  rMIGR_CLT IN OUT MIGR_CLT%ROWTYPE)

is

i number;

j number;

BEGIN

--  stack.InsertItem(Err_TableName,'INSOPR');

  Err_IdtClt := rMIGR_CLT.IdtClt;
  Err_Msg := 'Inicio Asignaci?n de valores';

    if rMIGR_OPR.IdtOpr is null then
      rMIGR_OPR.IdtOpr := gIdtOpr;
      gIdtOpr := gIdtOpr + 1;
    end if;

    Err_IdtOprDbt := rMIGR_OPR.IdtOpr;

-- Insertion of cashdesk lines
--    if rMIGR_OPR.idttypopr in (2,5) then
--      INSLGNCSS(rMIGR_OPR,rMIGR_CLT);
--    end if;

--BPZ

    i := tOpr.Count + 1;

    tOpr(i).ECHPMT       := rMIGR_OPR.EchPmt;
    tOpr(i).IDTCLT       := rMIGR_CLT.IdtClt;
    tOpr(i).IDTCPTCLT    := 1;
    tOpr(i).IDTOPR       := rMIGR_OPR.IdtOpr;
    tOpr(i).IDTTYPOPR    := rMIGR_OPR.IdtTypOpr;
    tOpr(i).IDTDVS       := rMIGR_OPR.IdtDvs;
    tOpr(i).IDTMODRGL    := rMIGR_OPR.IdtModRgl;
    tOpr(i).IDTBNQ       := rMIGR_OPR.IdtBnq;
    tOpr(i).IDTGCH       := rMIGR_OPR.IdtGch;
    tOpr(i).IDTCSS       := rMIGR_OPR.IdtCss;
    tOpr(i).IDTAGT       := rMIGR_OPR.IdtAgt;
    tOpr(i).DATCRT       := rMIGR_OPR.DatCrt;
    tOpr(i).DATEXG       := rMIGR_OPR.DatExg;
    tOpr(i).DATVLR       := rMIGR_OPR.DatVlr;
    tOpr(i).MNT          := rMIGR_OPR.Mnt;
    tOpr(i).MNTDVS       := rMIGR_OPR.MntDvs;
    tOpr(i).SLD          := rMIGR_OPR.Sld;
    tOpr(i).DATCNV       := rMIGR_OPR.DatCnv;
    tOpr(i).NUMCHQ       := rMIGR_OPR.NumChq;
    tOpr(i).NUMCPTBNC    := rMIGR_OPR.NumCptBnc;
    tOpr(i).CLERIB       := rMIGR_OPR.CleRib;
    tOpr(i).RFR          := rMIGR_OPR.Rfr;
    tOpr(i).NOMTRR       := rMIGR_OPR.NomTrr;
    tOpr(i).NOMCPTBNC    := rMIGR_OPR.NomCptBnc;
    tOpr(i).INFCPL       := rMIGR_OPR.InfCpl;
    tOpr(i).Anl          := rMIGR_OPR.Anl;
    tOpr(i).IdtNatRgl    := rMIGR_OPR.IdtNatRgl;
    tOpr(i).IdtOprOrg    := rMIGR_OPR.IdtOprOrg;
    tOpr(i).IdtSit       := 1;
    --tOpr(i).AncRfr       := rMIGR_OPR.AncRfrOpr;
    tOpr(i).Cmp          := 0;

--    if gSwInsererLgn = 1  then
--      forall j in 1..tOpr.Count
--        insert into X7.OPR values tOpr(j);
--      tOpr.Delete;
--    end if;


 \*   insert into X7.OPR (ECHPMT,
                        IDTCLT,
                        IDTCPTCLT,
                        IDTOPR,
                        IDTTYPOPR,
                        IDTDVS,
                        IDTMODRGL,
                        IDTBNQ,
                        IDTGCH,
                        IDTCSS,
                        IDTAGT,
                        DATCRT,
                        DATEXG,
                        DATVLR,
                        MNT,
                        MNTDVS,
                        SLD,
                        DATCNV,
                        NUMCHQ,
                        NUMCPTBNC,
                        CLERIB,
                        RFR,
                        NOMTRR,
                        NOMCPTBNC,
                        INFCPL,
                        Anl,
                        IdtNatRgl,
--                        AncRfr,
                        Cmp)
                values (rMIGR_OPR.EchPmt,
                        rMIGR_CLT.IdtClt,
                        1,
                        rMIGR_OPR.IdtOpr,
                        rMIGR_OPR.IdtTypOpr,
                        rMIGR_OPR.IdtDvs,
                        rMIGR_OPR.IdtModRgl,
                        rMIGR_OPR.IdtBnq,
                        rMIGR_OPR.IdtGch,
                        rMIGR_OPR.IdtCss,
                        rMIGR_OPR.IdtAgt,
                        rMIGR_OPR.DatCrt,
                        rMIGR_OPR.DatExg,
                        rMIGR_OPR.DatVlr,
                        rMIGR_OPR.Mnt,
                        rMIGR_OPR.MntDvs,
                        rMIGR_OPR.Sld,
                        rMIGR_OPR.DatCnv,
                        rMIGR_OPR.NumChq,
                        rMIGR_OPR.NumCptBnc,
                        rMIGR_OPR.CleRib,
                        rMIGR_OPR.Rfr,
                        rMIGR_OPR.NomTrr,
                        rMIGR_OPR.NomCptBnc,
                        rMIGR_OPR.InfCpl,
                        rMIGR_OPR.Anl,
                        rMIGR_OPR.IdtNatRgl,
--                        rMIGR_OPR.AncRfrOpr,
                        0);
*\

--  stack.DeleteItem(Err_TableName);

end INSOPR;*/

/****************************************************************************/
/****************************************************************************/
/****************************************************************************/

/*PROCEDURE INSLTT (rMIGR_OPR IN OUT MIGR_OPR%ROWTYPE)

is

i number;

j number;

BEGIN

--  stack.InsertItem(Err_TableName,'INSOPR');

--  Err_IdtClt := rMIGR_CLT.IdtClt;
  Err_Msg := 'Inicio Asignaci?n de valores';

  gIdtLtt := gIdtLtt + 1;

  Err_IdtOprDbt := rMIGR_OPR.IdtOpr;

  i := tLtt.Count + 1;

  tLTT(i).IDTOPRDBT  := rMIGR_OPR.IdtOpr;
  tLTT(i).DATLTT     := rMIGR_OPR.DatLtt;
  tLTT(i).MNT        := rMIGR_OPR.MntLtt;
  tLTT(i).IDTOPRCRT  := rMIGR_OPR.IdtOpr2;
  tLTT(i).IDTSITAVT  := null;
  tLTT(i).IDTLTT     := gIdtLtt;
  tLTT(i).IDTOPRORG  := rMIGR_OPR.IdtOpr2;
  tLTT(i).IDTRGU     := null;
  tLTT(i).DATCRT     := rMIGR_OPR.DatLtt;
  tLTT(i).IDTAGT     := rMIGR_OPR.IdtAgt;
  tLTT(i).IDTLTTANL  := null;
  tLTT(i).ANL        := 0;

--  if gSwInsererLgn = 1  then
--    forall j in 1..tLTT.Count
--      insert into X7.LTT values tLTT(j);
--    tLTT.Delete;
--  end if;

--  stack.DeleteItem(Err_TableName);

end INSLTT;*/

/****************************************************************************/
/****************************************************************************/
/****************************************************************************/

/*PROCEDURE INSFAC (rMIGR_CLT IN OUT MIGR_CLT%ROWTYPE,
                  rMIGR_OPR IN OUT MIGR_OPR%ROWTYPE,
                  rMIGR_FAC IN OUT MIGR_FAC%ROWTYPE)

is

vNbr number;

cursor cR is
  select X7.AVTCTR.IdtFacTyp, X7.CTRFAC.NumAvn,
         X7.CTRFAC.DatDbtPrd, X7.CTRFAC.DatFinPrd
    from X7.AVTCTR, X7.CTRFAC
    where X7.AVTCTR.IdtCtr = X7.CTRFAC.IdtCtr
     and  X7.AVTCTR.NumAvn = X7.CTRFAC.NumAvn
     and  IdtFac = rMIGR_FAC.IdtFac;

rCTRFAC CTRFAC%ROWTYPE;
rR cR%ROWTYPE;

i number;

j number;

BEGIN

  stack.InsertItem(Err_TableName,'INSFAC');
  Err_IdtClt := rMIGR_CLT.IdtClt;
  Err_NumFac := rMIGR_OPR.NumFct;
  Err_Msg := 'Inicio Asignaci?n de valores';

  if rMIGR_FAC.IdtFac is null then
    rMIGR_FAC.IdtFac := gIdtFac;
    gIdtFac := gIdtFac + 1;
  end if;

  Err_IdtFac := rMIGR_FAC.IdtFac;

  Err_Msg := 'Inserci?n de la factura';

--BPZ
  i := tFac.Count + 1;

  tFac(i).IDTFAC      := rMIGR_FAC.IdtFac;
  tFac(i).IDTCLT      := rMIGR_CLT.IdtClt;
  tFac(i).IDTTYPFCT   := rMIGR_FAC.IdtTypFct;
  tFac(i).NUMFCT      := rMIGR_FAC.NumFct;
  tFac(i).DATCLC      := rMIGR_FAC.DatCrt;
  tFac(i).DATCNV      := rMIGR_PRM.DatCnv;
  tFac(i).DATEXG      := rMIGR_FAC.DatExg;
  tFac(i).CATCLT      := rMIGR_CLT.IdtCtgClt;
  tFac(i).CODVLD      := 1;
  tFac(i).FCTANN      := nvl(rMIGR_FAC.FctAnn,0);
  tFac(i).MNTHT       := rMIGR_FAC.MntHt;
  tFac(i).SLDEXGANT   := rMIGR_FAC.SldExgAnt;
  tFac(i).IDTCODSNS   := rMIGR_CLT.IdtCodSns;
  tFac(i).IDTCNTOPR   := rMIGR_CLT.IdtCntOpr;
  tFac(i).MNTTVA      := nvl(rMIGR_FAC.MntTva,0);
  tFac(i).IDTDVS      := rMIGR_CLT.IdtDvs;
  tFac(i).IDTAGTCLC   := rMIGR_PRM.MtrAgt;
  tFac(i).IDTRCVTYP   := nvl(rMIGR_OPR.IdtRcvTyp,nvl(rMIGR_CLT.IdtRcvTyp,rMIGR_PRM.IdtRcvTyp));
  tFac(i).IDTFCTSLD01 := rMIGR_FAC.IDTFCTSLD01;
  tFac(i).IDTFCTSLD02 := rMIGR_FAC.IDTFCTSLD02;
  tFac(i).IDTFCTSLD03 := rMIGR_FAC.IDTFCTSLD03;
  tFac(i).IDTFCTSLD04 := rMIGR_FAC.IDTFCTSLD04;
  tFac(i).IDTFCTSLD05 := rMIGR_FAC.IDTFCTSLD05;
  tFac(i).SLD01       := rMIGR_FAC.SLD01;
  tFac(i).SLD02       := rMIGR_FAC.SLD02;
  tFac(i).SLD03       := rMIGR_FAC.SLD03;
  tFac(i).SLD04       := rMIGR_FAC.SLD04;
  tFac(i).SLD05       := rMIGR_FAC.SLD05;
  tFac(i).SLD01NBR    := rMIGR_FAC.SLD01NBR;
  tFac(i).SLD02NBR    := rMIGR_FAC.SLD02NBR;
  tFac(i).SLD03NBR    := rMIGR_FAC.SLD03NBR;
  tFac(i).SLD04NBR    := rMIGR_FAC.SLD04NBR;
  tFac(i).SLD05NBR    := rMIGR_FAC.SLD05NBR;
  tFac(i).Desemp      := 1;

--  if gSwInsererLgn = 1  then
--    forall j in 1..tFac.Count
--      insert into X7.FAC values tFac(j);
--    tFac.Delete;
--  end if;

\*BPZ
  insert into X7.FAC (IDTFAC,
                      IDTCLT,
                      IDTTYPFCT,
                      NUMFCT,
                      DATCLC,
                      DATCNV,
                      DATEXG,
                      CATCLT,
                      CODVLD,
                      FCTANN,
                      MNTHT,
                      SLDEXGANT,
                      IDTCODSNS,
                      IDTCNTOPR,
                      MNTTVA,
                      IDTDVS,
                      IDTAGTCLC,
                      IDTRCVTYP,
                      IDTFCTSLD01,
                      IDTFCTSLD02,
                      IDTFCTSLD03,
                      IDTFCTSLD04,
                      IDTFCTSLD05,
                      SLD01,
                      SLD02,
                      SLD03,
                      SLD04,
                      SLD05,
                      SLD01NBR,
                      SLD02NBR,
                      SLD03NBR,
                      SLD04NBR,
                      SLD05NBR)
              values (rMIGR_FAC.IdtFac,
                      rMIGR_CLT.IdtClt,
                      rMIGR_FAC.IdtTypFct,
                      rMIGR_FAC.NumFct,
                      rMIGR_FAC.DatCrt,
                      rMIGR_PRM.DatCnv,
                      rMIGR_FAC.DatExg,
                      rMIGR_CLT.IdtCtgClt,
                      1,
                      nvl(rMIGR_FAC.FctAnn,0),
                      rMIGR_FAC.MntHt,
                      rMIGR_FAC.SldExgAnt,
                      rMIGR_CLT.IdtCodSns,
                      rMIGR_CLT.IdtCntOpr,
                      nvl(rMIGR_FAC.MntTva,0),
                      rMIGR_CLT.IdtDvs,
                      rMIGR_PRM.MtrAgt,
                      nvl(rMIGR_OPR.IdtRcvTyp,nvl(rMIGR_CLT.IdtRcvTyp,rMIGR_PRM.IdtRcvTyp)),
                      rMIGR_FAC.IDTFCTSLD01,
                      rMIGR_FAC.IDTFCTSLD02,
                      rMIGR_FAC.IDTFCTSLD03,
                      rMIGR_FAC.IDTFCTSLD04,
                      rMIGR_FAC.IDTFCTSLD05,
                      rMIGR_FAC.SLD01,
                      rMIGR_FAC.SLD02,
                      rMIGR_FAC.SLD03,
                      rMIGR_FAC.SLD04,
                      rMIGR_FAC.SLD05,
                      rMIGR_FAC.SLD01NBR,
                      rMIGR_FAC.SLD02NBR,
                      rMIGR_FAC.SLD03NBR,
                      rMIGR_FAC.SLD04NBR,
                      rMIGR_FAC.SLD05NBR);
*\

  Err_Msg := 'B?squeda de la existencia de CTRFAC';

  if rMIGR_CLT.IdtCtr is not null then

--    open cR;
--      fetch cR into rR;

--      if cR%NOTFOUND then

        Err_Msg := 'Asignaci?n de valores de CTRFAC';

        rCTRFAC.IdtFac      := rMIGR_FAC.IdtFac;
        rCTRFAC.IdtPrdFac   := rMIGR_FAC.IdtPrd;
        rCTRFAC.IdtCtr      := rMIGR_CLT.IdtCtr;
        rCTRFAC.NumAvn      := nvl(rMIGR_FAC.NumAvn,rMIGR_CLT.NumAvn);
        rCTRFAC.IdtFac      := rMIGR_FAC.IdtFac;
        rCTRFAC.DatDbtPrd   := rMIGR_FAC.DatDbtPrd;
        rCTRFAC.DatFinPrd   := rMIGR_FAC.DatFinPrd;

        Err_Msg := 'B?squeda del ciclo de facturaci?n de la factura tipo';

        BEGIN
          select IdtCycFac
            into rCTRFAC.IdtCycFac
            from X7.FACTYP
            where IdtFacTyp = nvl(rMIGR_FAC.IdtFacTyp,rMIGR_CLT.IdtFacTyp);
        EXCEPTION
          WHEN NO_DATA_FOUND then
            null;
        END;

        Err_Msg := 'Inserci?n de CTRFAC';

        if rCTRFAC.IdtCtr is not null then
          INSCTRFAC(rCTRFAC);
        end if;

--      else

--        rMIGR_CLT.NumAvn    := rR.NumAvn;
--        rMIGR_FAC.NumAvn    := rR.NumAvn;
--        rMIGR_CLT.IdtFacTyp := rR.IdtFacTyp;
--        rMIGR_FAC.DatDbtPrd := rR.DatDbtPrd;
--        rMIGR_FAC.DatFinPrd := rR.DatFinPrd;

--      end if;

--    close cR;

  end if;

  INSLGNFAC(rMIGR_FAC, rMIGR_CLT);

  stack.DeleteItem(Err_TableName);

end INSFAC;*/
PROCEDURE SET_SEQ_TO(p_name IN VARCHAR2, p_val IN NUMBER)
AS
   l_num   NUMBER;
BEGIN
   EXECUTE IMMEDIATE 'select ' || p_name || '.nextval from dual' INTO l_num;

   -- Added check for 0 to avoid "ORA-04002: INCREMENT must be a non-zero integer"
   IF (p_val - l_num - 1) != 0
   THEN
      EXECUTE IMMEDIATE 'alter sequence ' || p_name || ' increment by ' || (p_val - l_num - 1) || ' minvalue 0';
   END IF;

   EXECUTE IMMEDIATE 'select ' || p_name || '.nextval from dual' INTO l_num;
   EXECUTE IMMEDIATE 'alter sequence ' || p_name || ' increment by 1 ';
   DBMS_OUTPUT.put_line('Sequence ' || p_name || ' is now at ' || p_val);
END;

PROCEDURE SET_SEQ_TO_DATA(seq_name IN VARCHAR2, table_name IN VARCHAR2, col_name IN VARCHAR2)
AS
   nextnum   NUMBER;
BEGIN
   EXECUTE IMMEDIATE 'SELECT MAX(' || col_name || ') + 1 AS n FROM ' || table_name INTO nextnum;

   SET_SEQ_TO(seq_name, nextnum);
END;

end MIGRATION;

/
