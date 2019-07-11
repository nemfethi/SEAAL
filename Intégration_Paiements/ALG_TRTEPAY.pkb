Create or replace package body ALG_TRTEPAY is
  Err_IdtPck    VARCHAR2(40)     := 'ALG_TRTEPAY';
  Err_IdtTrt    varchar2(40)     := NULL;
  Err_Msg       VARCHAR2(255)    := NULL;
  Err_IdtClt    CLT.IdtClt%TYPE  := NULL;
  Err_IdtCtr    CTR.IdtCtr%TYPE  := NULL;
  Err_IdtCpr    CPR.IdtCpr%TYPE  := NULL;
  Err_NumCpr    CPR.NumCpr%TYPE  := NULL;
  Err_IdtFac    FAC.IdtFac%TYPE  := NULL;
  Err_NumFac    FAC.NumFct%TYPE  := NULL;
  Err_IdtOprDbt OPR.IdtOpr%TYPE  := NULL;
  Err_IdtOprCrt OPR.IdtOpr%TYPE  := NULL;
  Err_TableName TrtMsg01.TableType := TrtMsg01.MakeTable;
  vCptAno NUMBER;
  Procedure import (  idTraitement in number, 
                      nbLignesIntegrees out number,
                      pErr out Varchar2) is
  vIdtCss Css.IdtCss%type :='DC_001';
  vSqcCng Css.SqcCng%type;
  vIdtDvs Dvs.IdtDvs%type;
  vIdtModRgl ModRgl.IdtModRgl%type := 109;
  begin
  /* intégration dans CSSCNGXXX*/
  -- Recherche SqcCng
  Select Nvl(SqcCng, 1) into vSqcCng
  from Css where IdtCss=vIdtCss;
  -- insertion dans CngEnt
  insert into CngEnt( IDTCSS,
                      IDTCNG,
                      IDTAGT,
                      DATRGL,
                      TTLCNG,
                      NBRPMTCNG,
                      DATCTL,
                      SITCNG,
                      DATINT,
                      IDTDVS,
                      RFRFIC,
                      DRNNMRLGNCSSCNG,
                      DATCRT,
                      RefAddCng) 
                      Select 
                      vIdtCss,
                      vSqcCng,
                      'BATCH',
                      sysdate,
                      sum(Transaction_Montant),
                      Count(*),
                      to_date(null),
                      to_date(null),
                      to_date(null),
                      vIdtDvs,
                      to_char(idTraitement), -- RFRFIC
                      null,
                      sysdate,
                      idTraitement
                      from Alg_Epay_Dtl 
                      where IdtTrt = idTraitement;
  -- insertion CngLgnCss
  INSERT INTO CNGLGNCSS
        (IDTCSS, 
        IDTCNG, 
        IDTLGNCSSCNG, 
        REFADDLGNCSSCNG, 
        IDTCLT, 
        IDTCPTCLT, 
        NUMFCT, 
        MNTPMT, 
        MNTAVC, 
        IDTMODRGL, 
        IDTBNQ, 
        IDTGCH, 
        NUMCPTBNC, 
        CLERIB, 
        NOMTRR, 
        NUMCHQ, 
        SITCNG, 
        CODBRRRGT, 
        IDTTYPMVMCNG, 
        IDTFMTCODBRR, 
        NBRANO,
        DATRGL)
  Select vIdtCss,
        vSqcCng,
        rownum,
        null,--lpad(#Line,5,' '),
        Epayment_Code_Client,
        1,
        '$NumFct',
        Transaction_Montant,
        0,
        vIdtModRgl, 
        null, 
        null, 
        null, 
        null, 
        null, 
        null, 
        null, 
        null, 
        1, 
        null, 
        null,
        Transaction_date_payment
        from Alg_Epay_Dtl
        where IdtTrt = idTraitement;
  -- insertion CngTtx
  INSERT INTO CNGTTX (IDTCSS,
                          IDTCNG,
                          IDTMODRGL,
                          TTLENCMODRGL,
                          NBRENCMODRGL)
                  select IdtCss,
                          IdtCng,
                          IdtModRgl,
                          sum(nvl(MntPmt,0) + nvl(MntAvc,0)),
                          count(*)
                    from CNGLGNCSS
                    where IdtCss = vIdtCss
                      and  IdtCng = vSqcCng
                    group by IdtCss,
                              IdtCng,
                              IdtModRgl;

  /*Controle*/
  Select count(*) into nbLignesIntegrees from Alg_Epay_Dtl
  where IdtTrt=idTraitement;

  vSqcCng := vSqcCng + 1;
  -- Mise a jour CSS
  update Css
        set sqcCng = vSqcCng
        where IdtCss = vIdtCss;
  return;

  exception
    when others then
      pErr:='E';
end Import;
  -- *********************************
  -- N° 1. Total de la consignation = Total encaissé par mode de règlement
  -- *********************************
  PROCEDURE CtrlTotCngModRglt (pIdtCss CNGENT.IdtCss%TYPE, pIdtCng CNGENT.IdtCng%TYPE)
  IS
    vSwControl NUMBER(1);
    CURSOR cWork IS SELECT MAX(CNGENT.IDTCSS) IDTCSS,
                          MAX(CNGENT.IDTCNG) IDTCNG,
                          MAX(CNGENT.TTLCNG) TTLCNG,
                          NVL(SUM(CNGTTX1.TTLENCMODRGL),-1) TTLMODRGL
      FROM CNGENT, CNGTTX CNGTTX1
        WHERE CNGENT.IDTCSS = pIdtCss
        AND CNGENT.IDTCNG = pIdtCng
                    AND CNGTTX1.IdtCss = pIdtCss
                    AND CNGTTX1.IdtCng = pIdtCng
        AND CNGENT.TTLCNG != (SELECT NVL(SUM(TTLENCMODRGL),-1)
            FROM  CNGTTX
            WHERE CNGTTX.IDTCNG = CNGENT.IDTCNG
            AND CNGTTX.IDTCSS = CNGENT.IDTCSS)
                    GROUP BY CNGENT.IdtCss, CNGENT.IdtCng;
  BEGIN
    TrtMsg01.InsertItem(Err_TableName,'CTRLTOTCNGMODRGLT');
    SELECT Utl
      INTO vSwControl
      FROM CNGCTRL
      WHERE IdtCtrl = 1;
    IF vSwControl = 1 THEN
      FOR cCng IN cWork LOOP
        -- Message d'erreur pour la consignation
        INSERT INTO CNGANO (IDTCSS, IDTCNG, IDTCTRL, IDTLGNCSSCNG, MSG_CODE, INFCMP)
        VALUES (cCng.IdtCss, cCng.IdtCng, 1, NULL, 'MSGCNG_ERR0001', 'C: ' ||
                TO_CHAR(cCng.TtlCng,'999,999,990.99') || ' | P: ' ||
                TO_CHAR(cCng.TtlModRgl,'999,999,990.99'));
        vCptAno := 1;
      END LOOP;
    END IF;
    TrtMsg01.DeleteItem(Err_TableName);
  END CtrlTotCngModRglt;
  -- *********************************
  -- N° 2. Total de la consignation = Total des montants du paiement des lignes d'encaissement
  -- *********************************
  PROCEDURE CtrlTotPmtLgnEcss(pIdtCss CNGENT.IdtCss%TYPE, pIdtCng CNGENT.IdtCng%TYPE, nErr out number)
  IS
    vSwControl NUMBER(1);
    CURSOR cWork IS SELECT MAX(CNGENT.IDTCSS) IdtCss,
                            MAX(CNGENT.IDTCNG) IdtCng,
                            MAX(CNGENT.TTLCNG) TtlCng,
                            NVL(SUM(MNTPMT),0)+NVL(SUM(MNTAVC),0) TtlCngLgn
      FROM CNGENT, CNGLGNCSS CNGLGNCSS1
        WHERE CNGENT.IDTCSS     = pIdtCss
        AND CNGENT.IDTCNG     = pIdtCng
                    AND CNGLGNCSS1.IDTCNG = pIdtCng
        AND CNGLGNCSS1.IDTCSS = pIdtCss
        AND CNGENT.TTLCNG != (SELECT NVL(SUM(MNTPMT),0)+NVL(SUM(MNTAVC),0)
            FROM  CNGLGNCSS
            WHERE CNGENT.IDTCNG = CNGLGNCSS.IDTCNG
            AND CNGENT.IDTCSS = CNGLGNCSS.IDTCSS)
                  GROUP BY CNGENT.IdtCss, CNGENT.IdtCng;
  BEGIN
    TrtMsg01.InsertItem(Err_TableName,'CTRLTOTPMTLGNECSS');
    nErr := 0;
    SELECT Utl
      INTO vSwControl
      FROM CNGCTRL
      WHERE IdtCtrl = 2;
    IF vSwControl = 1 THEN
      FOR cCng IN cWork LOOP
        -- Message d'erreur pour la consignation
        INSERT INTO CNGANO (IDTCSS, IDTCNG, IDTCTRL, IDTLGNCSSCNG, MSG_CODE, INFCMP)
        VALUES (cCng.IDTCSS, cCng.IDTCNG, 2, NULL, 'MSGCNG_ERR0002', 'C: ' ||
                TO_CHAR(cCng.TTLCNG,'999,999,990.99') || ' | P: ' ||
                TO_CHAR(cCng.TtlCngLgn,'999,999,990.99'));
          vCptAno := 1;
          nErr := nErr + 1 ;
      END LOOP;
    END IF;
    TrtMsg01.DeleteItem(Err_TableName);
  END CtrlTotPmtLgnEcss;
  -- *********************************
  -- N° 3. Total par mode de règlement des montants du paiement des lignes d'encaissement = total
  --     encaissé par mode de règlement
  -- *********************************
  PROCEDURE CtrlTotModRglt (pIdtCss CNGENT.IdtCss%TYPE, pIdtCng CNGENT.IdtCng%TYPE)
  IS
    vSwControl NUMBER(1);
    CURSOR cWork IS SELECT MAX(CNGTTX.IDTCSS) IdtCss,
                          MAX(CNGTTX.IDTCNG) IdtCng,
                          MAX(TTLENCMODRGL)  TtlEncModRgl,
                          MAX(MODRGL.MODPMT) ModPmt,
                          NVL(SUM(MNTPMT),0)+NVL(SUM(MNTAVC),0) TtlModRglLgn
      FROM CNGTTX, MODRGL, CNGLGNCSS CNGLGNCSS1
        WHERE CNGTTX.IDTCSS = pIdtCss
        AND CNGTTX.IDTCNG = pIdtCng
        AND CNGTTX.IdtModRgl     = MODRGL.IdtModRgl
        AND CNGLGNCSS1.IDTMODRGL = CNGTTX.IdtModRgl
        AND CNGLGNCSS1.IDTCNG    = CNGTTX.IDTCNG
        AND CNGLGNCSS1.IDTCSS    = CNGTTX.IDTCSS
        AND TTLENCMODRGL        != (SELECT NVL(SUM(MNTPMT),0)+NVL(SUM(MNTAVC),0)
                    FROM  CNGLGNCSS
                  WHERE CNGTTX.IDTMODRGL = CNGLGNCSS.IDTMODRGL
                    AND CNGTTX.IDTCNG    = CNGLGNCSS.IDTCNG
                    AND CNGTTX.IDTCSS    = CNGLGNCSS.IDTCSS)
                  GROUP BY CNGTTX.IdtCss,CNGTTX.IdtCng,MODRGL.ModPmt;
  BEGIN
    TrtMsg01.InsertItem(Err_TableName,'CTRLTOTMODRGLT');
    SELECT Utl
      INTO vSwControl
      FROM CNGCTRL
      WHERE IdtCtrl = 3;
    IF vSwControl = 1 THEN
      FOR cCng IN cWork LOOP
        -- Message d'erreur pour la consignation
        INSERT INTO CNGANO (IDTCSS, IDTCNG, IDTCTRL, IDTLGNCSSCNG, MSG_CODE, INFCMP)
        VALUES (cCng.IDTCSS, cCng.IDTCNG, 3, NULL, 'MSGCNG_ERR0003',
                'C: ' || TO_CHAR(cCng.TTLENCMODRGL,'999,999,990.99') ||
                ' | P: ' || TO_CHAR(cCng.TtlModRglLgn,'999,999,990.99') || ' | ' ||
                cCng.ModPmt);
        vCptAno := 1;
      END LOOP;
    END IF;
    TrtMsg01.DeleteItem(Err_TableName);
  END CtrlTotModRglt ;
  -- *********************************
  -- N° 4. Nombre de paiements de la consignation = nombre de lignes des lignes d'encaissement
  --     pour cette consignation
  -- *********************************
  PROCEDURE CtrlNbPmtCng
  (pIdtCss CNGENT.IdtCss%TYPE,
    pIdtCng CNGENT.IdtCng%TYPE)
  IS
    vSwControl NUMBER(1);
    CURSOR cWork IS SELECT MAX(CNGENT.IDTCSS) IdtCss,
                            MAX(CNGENT.IDTCNG) IdtCng,
                            MAX(CNGENT.NBRPMTCNG) NbrPmtCng,
                            COUNT(CNGLGNCSS1.MntPmt) NbrPmtLgn
      FROM CNGENT, CNGLGNCSS CNGLGNCSS1
      WHERE CNGENT.IDTCSS     = pIdtCss
        AND CNGENT.IDTCNG     = pIdtCng
        AND CNGLGNCSS1.IDTCNG = pIdtCng
          AND CNGLGNCSS1.IDTCSS = pIdtCss
        AND CNGENT.NBRPMTCNG != (SELECT COUNT(MNTPMT)
              FROM CNGLGNCSS
              WHERE CNGLGNCSS.IDTCNG = CNGENT.IDTCNG
                AND CNGLGNCSS.IDTCSS = CNGENT.IDTCSS)
                GROUP BY CNGENT.IdtCss, CNGENT.IdtCss;
  BEGIN
    TrtMsg01.InsertItem(Err_TableName,'CTRLNBPMTCNG');
    SELECT Utl
      INTO vSwControl
      FROM CNGCTRL
      WHERE IdtCtrl = 4;
    IF vSwControl = 1 THEN
      FOR cCng IN cWork LOOP
        -- Message d'erreur pour la consignation
        INSERT INTO CNGANO (IDTCSS, IDTCNG, IDTCTRL, IDTLGNCSSCNG, MSG_CODE, INFCMP)
        VALUES (cCng.IDTCSS, cCng.IDTCNG, 4, NULL, 'MSGCNG_ERR0004',
                'C: ' || TO_CHAR(cCng.NBRPMTCNG,'99,999,999,990') || '      | P: ' ||
                TO_CHAR(cCng.NbrPmtLgn,'99,999,999,990'));
        vCptAno := 1;
      END LOOP;
    END IF;
    TrtMsg01.DeleteItem(Err_TableName);
  END CtrlNbPmtCng;
  -- *********************************
  -- N° 5. Nombre d'encaissement par mode de règlement = Nombre de lignes des lignes d'encaissement
  --     pour cette consignation pour ce mode de règlement
  -- *********************************
  PROCEDURE CtrlNbEcssModRglt
  (pIdtCss CNGENT.IdtCss%TYPE,
    pIdtCng CNGENT.IdtCng%TYPE)
  IS
    vSwControl NUMBER(1);
    CURSOR cWork IS SELECT
                      MAX(CNGENT.IDTCSS) IdtCss,
                      MAX(CNGENT.IDTCNG) IdtCng,
                      MAX(NBRENCMODRGL)  NbrEncModRgl,
                      MAX(MODPMT)        ModPmt,
                      COUNT(MNTPMT)      NbrModRglLgn
      FROM CNGENT, CNGTTX, MODRGL, CNGLGNCSS CNGLGNCSS1
        WHERE CNGENT.IDTCSS = pIdtCss
        AND CNGENT.IDTCNG = pIdtCng
        AND CNGTTX.IdtModRgl = MODRGL.IdtModRgl
        AND CNGTTX.IDTCSS =  CNGENT.IDTCSS
        AND CNGTTX.IDTCNG =  CNGENT.IDTCNG
        AND CNGLGNCSS1.IDTMODRGL = CNGTTX.IDTMODRGL
        AND CNGLGNCSS1.IDTCNG    = pIdtCng
        AND CNGLGNCSS1.IDTCSS    = pIdtCss
        AND NBRENCMODRGL != (SELECT COUNT(MNTPMT)
                              FROM  CNGLGNCSS
                              WHERE CNGTTX.IDTMODRGL = CNGLGNCSS.IDTMODRGL
                                AND CNGTTX.IDTCNG = CNGLGNCSS.IDTCNG
                                AND CNGTTX.IDTCSS = CNGLGNCSS.IDTCSS)
        GROUP BY CNGENT.IDTCSS, CNGENT.IDTCNG
      UNION
      (SELECT IdtCss, IdtCng, 0 NbrEncModRgl, TO_CHAR(IdtModRgl) ModPmt, 0 NbrModRglLgn
        FROM CNGTTX
        WHERE IdtCss = pIdtCss
        AND  IdtCng = pIdtCng
      MINUS
      SELECT IdtCss, IdtCng, 0 NbrEncModRgl, TO_CHAR(IdtModRgl) ModPmt, 0 NbrModRglLgn
        FROM CNGLGNCSS
        WHERE IdtCss = pIdtCss
        AND  IdtCng = pIdtCng)
      UNION
      (SELECT IdtCss, IdtCng, 0 NbrEncModRgl, TO_CHAR(IdtModRgl) ModPmt, 0 NbrModRglLgn
        FROM CNGLGNCSS
        WHERE IdtCss = pIdtCss
        AND  IdtCng = pIdtCng
      MINUS
      SELECT IdtCss, IdtCng, 0 NbrEncModRgl, TO_CHAR(IdtModRgl) ModPmt, 0 NbrModRglLgn
        FROM CNGTTX
        WHERE IdtCss = pIdtCss
        AND  IdtCng = pIdtCng);
  BEGIN
    TrtMsg01.InsertItem(Err_TableName,'CTRLNBECSSMODRGLT');
    SELECT Utl
      INTO vSwControl
      FROM CNGCTRL
      WHERE IdtCtrl = 5;
    IF vSwControl = 1 THEN
      FOR cCng IN cWork LOOP
        -- Message d'erreur pour la consignation
        INSERT INTO CNGANO (IDTCSS, IDTCNG, IDTCTRL, IDTLGNCSSCNG, MSG_CODE, INFCMP)
        VALUES (cCng.IDTCSS, cCng.IDTCNG, 5, NULL, 'MSGCNG_ERR0005',
                'C: ' || TO_CHAR(cCng.NbrEncModRgl,'99,999,999,999') || '      | P: ' ||
                TO_CHAR(cCng.NbrModRglLgn,'99,999,999,999') || '      | ' || cCng.ModPmt);
        vCptAno := 1;
      END LOOP;
    END IF;
    TrtMsg01.DeleteItem(Err_TableName);
  END CtrlNbEcssModRglt ;
  -- *********************************
  -- N° 6. Une seule consignation par caisse et par jour (date de règlement)
  -- *********************************
  PROCEDURE CtrlUneCngCssJour
  (pIdtCss CNGENT.IdtCss%TYPE,
    pIdtCng CNGENT.IdtCng%TYPE)
  IS
    vSwControl NUMBER(1);
    CURSOR cWork IS
      SELECT IDTCSS, IDTCNG, DATRGL
      FROM CNGENT
        WHERE IDTCSS = pIdtCss
        AND IDTCNG = pIdtCng;
    nLigne NUMBER;
  BEGIN
    TrtMsg01.InsertItem(Err_TableName,'CTRLUNECNGCSSJOUR');
    SELECT Utl
      INTO vSwControl
      FROM CNGCTRL
      WHERE IdtCtrl = 6;
    IF vSwControl = 1 THEN
      FOR cCng IN cWork LOOP
        SELECT COUNT(*)
        INTO nLigne
        FROM CNGENT
        WHERE IDTCSS = cCng.IDTCSS
          AND TRUNC(DATRGL) = TRUNC(cCng.DATRGL);
        IF nLigne > 1 THEN
          -- Message d'erreur pour la consignation
          INSERT INTO CNGANO (IDTCSS, IDTCNG, IDTCTRL, IDTLGNCSSCNG, MSG_CODE, INFCMP)
          VALUES (cCng.IDTCSS, cCng.IDTCNG, 6, NULL, 'MSGCNG_ERR0006', TO_CHAR(cCng.DATRGL));
                  vCptAno := 1;
        END IF;
      END LOOP;
    END IF;
    TrtMsg01.DeleteItem(Err_TableName);
  END CtrlUneCngCssJour;
  -- *********************************
  -- N° 8. Date de règlement de la consignation <= Date du jour
  -- *********************************
  PROCEDURE CtrlDatRgltCng
  (pIdtCss CNGENT.IdtCss%TYPE,
    pIdtCng CNGENT.IdtCng%TYPE)
  IS
    vSwControl NUMBER(1);
    CURSOR cWork IS SELECT IDTCSS,IDTCNG, DATRGL
      FROM CNGENT
        WHERE IDTCSS = pIdtCss
        AND IDTCNG = pIdtCng
        AND TRUNC(DATRGL) > (SELECT TRUNC(SYSDATE) FROM dual);
  BEGIN
    TrtMsg01.InsertItem(Err_TableName,'CTRLDATRGLTCNG');
    SELECT Utl
      INTO vSwControl
      FROM CNGCTRL
      WHERE IdtCtrl = 8;
    IF vSwControl = 1 THEN
      FOR cCng IN cWork LOOP
        -- Message d'erreur pour la consignation
        INSERT INTO CNGANO (IDTCSS, IDTCNG, IDTCTRL, IDTLGNCSSCNG, MSG_CODE, INFCMP)
        VALUES (cCng.IDTCSS, cCng.IDTCNG, 8, NULL, 'MSGCNG_ERR0008', TO_CHAR(cCng.DATRGL));
        vCptAno := 1;
      END LOOP;
    END IF;
    TrtMsg01.DeleteItem(Err_TableName);
  END CtrlDatRgltCng;
  -- *********************************
  -- N° 16. Cliente existe
  -- *********************************
  PROCEDURE CtrlExistClt
  (pIdtCss CNGENT.IdtCss%TYPE,
    pIdtCng CNGENT.IdtCng%TYPE)
  IS
    vSwControl NUMBER(1);
    CURSOR cWork IS SELECT IDTCSS, IDTCNG,
                            IDTLGNCSSCNG, IDTCLT
      FROM CNGLGNCSS
        WHERE CNGLGNCSS.IDTCSS = pIdtCss
                    AND CNGLGNCSS.IDTCNG = pIdtCng
        AND 0 = (SELECT COUNT(*)
                  FROM CLT
                  WHERE CNGLGNCSS.IdtClt = CLT.IdtClt);
  BEGIN
    TrtMsg01.InsertItem(Err_TableName,'CTRLEXISTCLT');
    SELECT Utl
      INTO vSwControl
      FROM CNGCTRL
      WHERE IdtCtrl = 16;
    IF vSwControl = 1 THEN
      FOR cCng IN cWork LOOP
        -- Message d'erreur pour la ligne de consignation
        INSERT INTO CNGANO (IDTCSS, IDTCNG, IDTCTRL, IDTLGNCSSCNG, MSG_CODE, INFCMP)
        VALUES (cCng.IDTCSS, cCng.IDTCNG, 16, cCng.IDTLGNCSSCNG, 'MSGCNG_ERR0016', cCng.IDTCLT);
        vCptAno := 1;
        -- *FNE: vExistFct := 0;
      END LOOP;
    END IF;
    TrtMsg01.DeleteItem(Err_TableName);
  END CtrlExistClt;
  -- *********************************
  -- N° 17. Pas deux fois le même numéro de Client dans une même consignation
  -- *********************************
  PROCEDURE CtrlPasDeuxNbCltCng
  (pIdtCss CNGENT.IdtCss%TYPE,
    pIdtCng CNGENT.IdtCng%TYPE)
  IS
    vSwControl NUMBER(1);
    CURSOR cWork IS
                  SELECT IDTCSS, IDTCNG,  IDTCLT, IDTLGNCSSCNG
      FROM CNGLGNCSS
        WHERE CNGLGNCSS.IDTCSS = pIdtCss
                    AND CNGLGNCSS.IDTCNG = pIdtCng
        AND 0 != (SELECT COUNT(ROWID)
            FROM  CNGLGNCSS CNGLGNCSS1
              WHERE IDTCSS = pIdtCss
            AND  IDTCNG = pIdtCng
            AND CNGLGNCSS1.IDTCLT = CNGLGNCSS.IDTCLT
            AND CNGLGNCSS1.ROWID != CNGLGNCSS.ROWID
                        AND CNGLGNCSS.IdtTypMvmCng = 3
                        AND CNGLGNCSS1.IdtTypMvmCng = 3);
  BEGIN
    TrtMsg01.InsertItem(Err_TableName,'CTRLPASDEUXNBCLTCNG');
    SELECT Utl
      INTO vSwControl
      FROM CNGCTRL
      WHERE IdtCtrl = 17;
    IF vSwControl = 1 THEN
      FOR cCng IN cWork LOOP
        -- Message d'erreur pour la consignation
        INSERT INTO CNGANO (IDTCSS, IDTCNG, IDTCTRL, IDTLGNCSSCNG, MSG_CODE, INFCMP)
        VALUES (cCng.IDTCSS, cCng.IDTCNG, 17, cCng.IDTLGNCSSCNG, 'MSGCNG_ERR0017', cCng.IDTCLT);
        vCptAno := 1;
      END LOOP;
    END IF;
    TrtMsg01.DeleteItem(Err_TableName);
  END CtrlPasDeuxNbCltCng;
  -- *********************************
  -- N° 25. Une seule consignation par référence externe
  -- *********************************
  PROCEDURE CtrlUneCngRfrExt
  (pIdtCss CNGENT.IdtCss%TYPE,
    pIdtCng CNGENT.IdtCng%TYPE)
  IS
    vSwControl NUMBER(1);
    CURSOR cWork IS
      SELECT IDTCSS, IDTCNG, DATRGL, RefAddCng
      FROM CNGENT
        WHERE IDTCSS = pIdtCss
        AND IDTCNG = pIdtCng
        AND 0 <> (SELECT COUNT(*) FROM CNGENT CNGENT2
                    WHERE CNGENT2.RefAddCng = CNGENT.RefAddCng
                    AND  CNGENT2.IdtCss   <> pIdtCss
                    AND  CNGENT2.IdtCng   <> pIdtCng)
        AND RefAddCng IS NOT NULL;
    nLigne NUMBER;
  BEGIN
    TrtMsg01.InsertItem(Err_TableName,'CTRLUNECNGRFREXT');
    SELECT Utl
      INTO vSwControl
      FROM CNGCTRL
      WHERE IdtCtrl = 25;
    IF vSwControl = 1 THEN
      FOR cCng IN cWork LOOP
        -- Message d'erreur pour la consignation
        INSERT INTO CNGANO (IDTCSS, IDTCNG, IDTCTRL, IDTLGNCSSCNG, MSG_CODE, INFCMP)
        VALUES (cCng.IDTCSS, cCng.IDTCNG, 25, NULL, 'MSGCNG_ERR0025', cCng.RefAddCng);
        vCptAno := 1;
      END LOOP;
    END IF;
    TrtMsg01.DeleteItem(Err_TableName);
  END CtrlUneCngRfrExt;
  -- *********************************
  -- N° 27. Cliente con un solo pago en la consiganci?n
  -- *********************************
  PROCEDURE CtrlCltDeuxRglCng
  (pIdtCss CNGENT.IdtCss%TYPE,
    pIdtCng CNGENT.IdtCng%TYPE)
  IS
    vSwControl NUMBER(1);
    CURSOR cWork IS
      SELECT IDTCSS, IDTCNG,  IDTCLT, IDTLGNCSSCNG
        FROM CNGLGNCSS
        WHERE CNGLGNCSS.IDTCSS = pIdtCss
          AND CNGLGNCSS.IDTCNG = pIdtCng
          AND 0 != (SELECT COUNT(ROWID)
                      FROM  CNGLGNCSS CNGLGNCSS1
                      WHERE IDTCSS = pIdtCss
                        AND  IDTCNG = pIdtCng
                        AND CNGLGNCSS1.IDTCLT = CNGLGNCSS.IDTCLT
                        AND CNGLGNCSS1.ROWID != CNGLGNCSS.ROWID);
  BEGIN
    TrtMsg01.InsertItem(Err_TableName,'CTRLCLTDEUXRGLCNG');
    SELECT Utl
      INTO vSwControl
      FROM CNGCTRL
      WHERE IdtCtrl = 27;
    IF vSwControl = 1 THEN
      FOR cCng IN cWork LOOP
        -- Message d'erreur pour la consignation
        INSERT INTO CNGANO (IDTCSS, IDTCNG, IDTCTRL, IDTLGNCSSCNG, MSG_CODE, INFCMP)
        VALUES (cCng.IDTCSS, cCng.IDTCNG, 27, cCng.IDTLGNCSSCNG, 'MSGCNG_ERR0027', cCng.IDTCLT);
        vCptAno := 1;
      END LOOP;
    END IF;
    TrtMsg01.DeleteItem(Err_TableName);
  END CtrlCltDeuxRglCng;
  -- *********************************
  -- N° 28. Cliente con un solo pago en la consiganci?n por el mismo valor
  -- *********************************
  PROCEDURE CtrlCltMntDeuxRglCng
  (pIdtCss CNGENT.IdtCss%TYPE,
    pIdtCng CNGENT.IdtCng%TYPE)
  IS
    vSwControl NUMBER(1);
    CURSOR cWork IS
      SELECT IDTCSS, IDTCNG,  IDTCLT, IDTLGNCSSCNG
        FROM CNGLGNCSS
        WHERE CNGLGNCSS.IDTCSS = pIdtCss
          AND CNGLGNCSS.IDTCNG = pIdtCng
          AND 0 != (SELECT COUNT(ROWID)
                      FROM  CNGLGNCSS CNGLGNCSS1
                      WHERE IDTCSS = pIdtCss
                        AND  IDTCNG = pIdtCng
                        AND CNGLGNCSS1.IDTCLT = CNGLGNCSS.IDTCLT
                        AND NVL(CNGLGNCSS1.MntPmt,0) + NVL(CNGLGNCSS1.MntAvc,0) =
                            NVL(CNGLGNCSS.MntPmt,0) + NVL(CNGLGNCSS.MntAvc,0)
                        AND CNGLGNCSS1.ROWID != CNGLGNCSS.ROWID);
  BEGIN
    TrtMsg01.InsertItem(Err_TableName,'CTRLCLTMNTDEUXRGLCNG');
    SELECT Utl
      INTO vSwControl
      FROM CNGCTRL
      WHERE IdtCtrl = 28;
    IF vSwControl = 1 THEN
      FOR cCng IN cWork LOOP
        -- Message d'erreur pour la consignation
        INSERT INTO CNGANO (IDTCSS, IDTCNG, IDTCTRL, IDTLGNCSSCNG, MSG_CODE, INFCMP)
        VALUES (cCng.IDTCSS, cCng.IDTCNG, 28, cCng.IDTLGNCSSCNG, 'MSGCNG_ERR0028', cCng.IDTCLT);
        vCptAno := 1;
      END LOOP;
    END IF;
    TrtMsg01.DeleteItem(Err_TableName);
  END CtrlCltMntDeuxRglCng;
  -- *********************************
  -- N° 13. Si le mode de règlement est prélèvement, le nom du tireur, le code banque,
  --    le numéro de compte bancaire, la clé RIB et le code guichet sont obligatoires
  -- *********************************
  PROCEDURE CtrlModRgltChq
  (pIdtCss CNGENT.IdtCss%TYPE,
    pIdtCng CNGENT.IdtCng%TYPE)
  IS
    vSwControl NUMBER(1);
    CURSOR cWork IS SELECT IDTCSS, IDTCNG, NUMFCT, IDTLGNCSSCNG
      FROM CNGLGNCSS
        WHERE IDTCSS = pIdtCss
        AND IDTCNG = pIdtCng
        AND IDTMODRGL = 3
        AND (NUMCPTBNC IS NULL
        OR  IDTGCH IS NULL
        OR  IDTBNQ IS NULL
        --OR  CLERIB IS NULL
        );
  BEGIN
    TrtMsg01.InsertItem(Err_TableName,'CTRLMODRGLTCHQ');
    SELECT Utl
      INTO vSwControl
      FROM CNGCTRL
      WHERE IdtCtrl = 13;
    IF vSwControl = 1 THEN
      FOR cCng IN cWork LOOP
        -- Message d'erreur pour la consignation
        INSERT INTO CNGANO (IDTCSS, IDTCNG, IDTCTRL, IDTLGNCSSCNG, MSG_CODE, INFCMP)
        VALUES (cCng.IDTCSS, cCng.IDTCNG, 13, cCng.IDTLGNCSSCNG, 'MSGCNG_ERR0013', NULL);
        vcptano := 1;
      END LOOP;
    END IF;
    TrtMsg01.DeleteItem(Err_TableName);
    END CtrlModRgltChq;
  
  
  -- *********************************
  -- N° 31. Paiement date is valid (SEAAL)
  -- *********************************
  PROCEDURE CtrlDatRglVld_SEAAL
  (pIdtCss CNGENT.IdtCss%TYPE,
    pIdtCng CNGENT.IdtCng%TYPE)
  IS
    vSwControl NUMBER(1);
    vNbrJouDec number := 2; -- Jours de decalage avec la semaine en algerie, la semaine demarre le samedi, pas le lundi
    CURSOR cWork IS
      SELECT CNGENT.IDTCSS, CNGENT.IDTCNG, nvl(CNGLGNCSS.DatRgl,CNGENT.DatRgl),
              CNGLGNCSS.IDTLGNCSSCNG, CNGLGNCSS.NUMFCT
        FROM CNGLGNCSS, CNGENT, SSS
        WHERE CNGENT.IdtCss        = pIdtCss
          AND CNGENT.IdtCng    = pIdtCng
          AND CNGLGNCSS.IDTCSS = pIdtCss
          AND CNGLGNCSS.IDTCNG = pIdtCng
          and (   trunc(nvl(CNGLGNCSS.DatRgl,CNGENT.DatRgl)) < trunc(SSS.SSS_DatJou+vNbrJouDec,'IW')-vNbrJouDec-2 -- Avec -2 on obtient le jeudi de la semaine precedente selon la semaine algerienne
                or to_char(nvl(CNGLGNCSS.DatRgl,CNGENT.DatRgl),'DY','NLS_DATE_LANGUAGE = American') = 'FRI'); -- Pas de règlements le vendredi
  --         and ((        to_number(to_char(SSS.SSS_DatJou + vNbrJouDec, 'IW','NLS_DATE_LANGUAGE = American')) <> to_number(to_char(nvl(CNGLGNCSS.DatRgl,CNGENT.DatRgl) + vNbrJouDec, 'IW','NLS_DATE_LANGUAGE = American'))
  --                   and to_char(SSS.SSS_DatJou, 'DY','NLS_DATE_LANGUAGE = American') in ('WED','THU'))
  --                or
  --              (        to_number(to_char(SSS.SSS_DatJou + vNbrJouDec, 'IW','NLS_DATE_LANGUAGE = American')) -1 <> to_number(to_char(nvl(CNGLGNCSS.DatRgl,CNGENT.DatRgl) + vNbrJouDec, 'IW','NLS_DATE_LANGUAGE = American'))
  --                   and to_char(SSS.SSS_DatJou, 'DY','NLS_DATE_LANGUAGE = American') not in ('WED','THU'))
  --             );
    nLigne NUMBER;
  BEGIN
    TrtMsg01.InsertItem(Err_TableName,'CtrlDatRglVld_SEAAL');
    SELECT Utl
      INTO vSwControl
      FROM CNGCTRL
      WHERE IdtCtrl = 31;
    IF vSwControl = 1 THEN
      FOR cCng IN cWork LOOP
        -- Message d'erreur pour la consignation
        INSERT INTO CNGANO (IDTCSS, IDTCNG, IDTCTRL, IDTLGNCSSCNG, MSG_CODE, INFCMP)
        VALUES (cCng.IDTCSS, cCng.IDTCNG, 31, cCng.IDTLGNCSSCNG, 'MSGCNG_ERR0031', null);
        vCptAno := 1;
      END LOOP;
    END IF;
    TrtMsg01.DeleteItem(Err_TableName);
  END CtrlDatRglVld_SEAAL;
  -- *********************************
  -- N° 32. Le client a ete exporte (SEAAL)
  -- *********************************
  PROCEDURE CltUneFois_SEAAL
  (pIdtCss CNGENT.IdtCss%TYPE,
    pIdtCng CNGENT.IdtCng%TYPE)
  IS
    vSwControl NUMBER(1);
    CURSOR cWork IS
      SELECT CNGENT.IDTCSS, CNGENT.IDTCNG, nvl(CNGLGNCSS.DatRgl,CNGENT.DatRgl),
              CNGLGNCSS.IDTLGNCSSCNG, CNGLGNCSS.NUMFCT
        FROM CNGLGNCSS, CNGENT, SSS
        WHERE CNGENT.IdtCss        = pIdtCss
          AND CNGENT.IdtCng    = pIdtCng
          AND CNGLGNCSS.IDTCSS = pIdtCss
          AND CNGLGNCSS.IDTCNG = pIdtCng
          and NOT EXISTS (select b.IdtClt
                            from ALG_EAP_VIEW1 b
                            where b.IdtClt = CNGLGNCSS.IdtClt
                              and  trunc(CNGLGNCSS.DatRgl) between nvl(trunc(b.DatTrt),CNGLGNCSS.DatRgl-1) and nvl(trunc(b.DatTrtSvn),sysdate+1));

    nLigne NUMBER;
  BEGIN
    TrtMsg01.InsertItem(Err_TableName,'CltUneFois_SEAAL');
    SELECT Utl
      INTO vSwControl
      FROM CNGCTRL
      WHERE IdtCtrl = 32;
    IF vSwControl = 1 THEN
      FOR cCng IN cWork LOOP
        -- Message d'erreur pour la consignation
        INSERT INTO CNGANO (IDTCSS, IDTCNG, IDTCTRL, IDTLGNCSSCNG, MSG_CODE, INFCMP)
        VALUES (cCng.IDTCSS, cCng.IDTCNG, 32, cCng.IDTLGNCSSCNG, 'MSGCNG_ERR0032', null);
        vCptAno := 1;
      END LOOP;
    END IF;
    TrtMsg01.DeleteItem(Err_TableName);
  END CltUneFois_SEAAL;
  -- *********************************
  -- N° 33. Date de reglement inferieure a la date du jour (SEAAL)
  -- *********************************
  PROCEDURE DatRglFut_SEAAL
  (pIdtCss CNGENT.IdtCss%TYPE,
    pIdtCng CNGENT.IdtCng%TYPE)
  IS
    vSwControl NUMBER(1);
    CURSOR cWork IS
      SELECT CNGENT.IDTCSS, CNGENT.IDTCNG, nvl(CNGLGNCSS.DatRgl,CNGENT.DatRgl),
              CNGLGNCSS.IDTLGNCSSCNG, CNGLGNCSS.NUMFCT
        FROM CNGLGNCSS, CNGENT, SSS
        WHERE CNGENT.IdtCss        = pIdtCss
          AND CNGENT.IdtCng    = pIdtCng
          AND CNGLGNCSS.IDTCSS = pIdtCss
          AND CNGLGNCSS.IDTCNG = pIdtCng
          and trunc(CNGLGNCSS.DatRgl) >= trunc(SSS.sss_DatJou);
    nLigne NUMBER;
  BEGIN
    TrtMsg01.InsertItem(Err_TableName,'DatRglFut_SEAAL');
    SELECT Utl
      INTO vSwControl
      FROM CNGCTRL
      WHERE IdtCtrl = 33;
    IF vSwControl = 1 THEN
      FOR cCng IN cWork LOOP
        -- Message d'erreur pour la consignation
        INSERT INTO CNGANO (IDTCSS, IDTCNG, IDTCTRL, IDTLGNCSSCNG, MSG_CODE, INFCMP)
        VALUES (cCng.IDTCSS, cCng.IDTCNG, 33, cCng.IDTLGNCSSCNG, 'MSGCNG_ERR0008', null);
        vCptAno := 1;
      END LOOP;
    END IF;
    TrtMsg01.DeleteItem(Err_TableName);
  END DatRglFut_SEAAL;
  -- *********************************
  -- N° 34. Le client n'a pas deja ete importe dans un autre fichier (SEAAL)
  -- *********************************
  PROCEDURE CltImp_SEAAL
  (pIdtCss CNGENT.IdtCss%TYPE,
    pIdtCng CNGENT.IdtCng%TYPE)
  IS
    vSwControl NUMBER(1);
    CURSOR cWork IS
      SELECT CNGENT.IDTCSS, CNGENT.IDTCNG, nvl(CNGLGNCSS.DatRgl,CNGENT.DatRgl),
              CNGLGNCSS.IDTLGNCSSCNG, CNGLGNCSS.NUMFCT
        FROM CNGLGNCSS, CNGENT, SSS
        WHERE CNGENT.IdtCss        = pIdtCss
          AND CNGENT.IdtCng    = pIdtCng
          and CNGLGNCSS.IdtCss = CNGENT.IdtCss
          and CNGLGNCSS.IdtCng = CNGENT.IdtCng
          AND (CNGLGNCSS.IdtClt, CNGLGNCSS.DatRgl) in (select b.IdtClt, b.DatRgl
                                                          from CNGENT a, CNGLGNCSS b
                                                          where a.IdtCss = b.IdtCss
                                                          and  a.IdtCng = b.IdtCng
                                                          and  a.IdtCng < CNGENT.IdtCng
                                                          and  a.DatInt is null);
    nLigne NUMBER;
  BEGIN
    TrtMsg01.InsertItem(Err_TableName,'CltImp_SEAAL');
    SELECT Utl
      INTO vSwControl
      FROM CNGCTRL
      WHERE IdtCtrl = 34;
    IF vSwControl = 1 THEN
      FOR cCng IN cWork LOOP
        -- Message d'erreur pour la consignation
        INSERT INTO CNGANO (IDTCSS, IDTCNG, IDTCTRL, IDTLGNCSSCNG, MSG_CODE, INFCMP)
        VALUES (cCng.IDTCSS, cCng.IDTCNG, 34, cCng.IDTLGNCSSCNG, 'MSGCNG_ERR0034', null);
        vCptAno := 1;
      END LOOP;
    END IF;
    TrtMsg01.DeleteItem(Err_TableName);
  END CltImp_SEAAL;
  -- *********************************
  -- N° 35. L'encaissement n'a pas deja ete INTEGRE auparavant
  -- *********************************
  PROCEDURE RglInt_SEAAL
  (pIdtCss CNGENT.IdtCss%TYPE,
    pIdtCng CNGENT.IdtCng%TYPE)
  IS
    vSwControl NUMBER(1);
  -- FBE: 10 06 2010   CURSOR cWork IS
  -- FBE: 10 06 2010     SELECT distinct CNGENT.IDTCSS, CNGENT.IDTCNG, nvl(CNGLGNCSS.DatRgl,CNGENT.DatRgl),
  -- FBE: 10 06 2010            CNGLGNCSS.IDTLGNCSSCNG, CNGLGNCSS.NUMFCT
  -- FBE: 10 06 2010       FROM CNGLGNCSS, CNGENT, SSS, ALG_EAP_VIEW1
  -- FBE: 10 06 2010       WHERE CNGENT.IdtCss        = pIdtCss
  -- FBE: 10 06 2010         AND CNGENT.IdtCng    = pIdtCng
  -- FBE: 10 06 2010         AND CNGLGNCSS.IDTCSS = pIdtCss
  -- FBE: 10 06 2010         AND CNGLGNCSS.IDTCNG = pIdtCng
  -- FBE: 10 06 2010         and ALG_EAP_VIEW1.IdtClt = CNGLGNCSS.IdtClt
  -- FBE: 10 06 2010         and trunc(CNGLGNCSS.DatRgl) between nvl(trunc(ALG_EAP_VIEW1.DatTrt),CNGLGNCSS.DatRgl-1) and nvl(trunc(ALG_EAP_VIEW1.DatTrtSvn),sysdate+1)
  -- FBE: 10 06 2010         and ALG_EAP_VIEW1.Ett = 1
    CURSOR cWork IS
      SELECT distinct CNGENT.IDTCSS, CNGENT.IDTCNG, nvl(CNGLGNCSS.DatRgl,CNGENT.DatRgl),
            CNGLGNCSS.IDTLGNCSSCNG, CNGLGNCSS.NUMFCT
        FROM CNGLGNCSS, CNGENT, SSS, OPR
        WHERE CNGENT.IdtCss        = pIdtCss
          AND CNGENT.IdtCng    = pIdtCng
          AND CNGLGNCSS.IDTCSS = pIdtCss
          AND CNGLGNCSS.IDTCNG = pIdtCng
          and OPR.IdtClt(+) = CNGLGNCSS.IdtClt
          and trunc(OPR.DatVlr(+)) = trunc(CNGLGNCSS.DatRgl)
          and OPR.IdtOpr is not null
          and OPR.IdtTypOpr = 2;
    nLigne NUMBER;
  BEGIN
    TrtMsg01.InsertItem(Err_TableName,'RglInt_SEAAL');
    SELECT Utl
      INTO vSwControl
      FROM CNGCTRL
      WHERE IdtCtrl = 35;
    IF vSwControl = 1 THEN
      FOR cCng IN cWork LOOP
        -- Message d'erreur pour la consignation
        INSERT INTO CNGANO (IDTCSS, IDTCNG, IDTCTRL, IDTLGNCSSCNG, MSG_CODE, INFCMP)
        VALUES (cCng.IDTCSS, cCng.IDTCNG, 35, cCng.IDTLGNCSSCNG, 'MSGCNG_ERR0035', null);
        vCptAno := 1;
      END LOOP;
    END IF;
    TrtMsg01.DeleteItem(Err_TableName);
  END RglInt_SEAAL;
PROCEDURE Controles(  idTraitement in number, 
                      nbLignesIntegrees out number,
                      pErr out Varchar2)
IS
pIdtCss CngEnt.IdtCss%type;
pIdtCng CngEnt.IdtCng%type;
nbAno number := 0;
BEGIN
  TrtMsg01.InsertItem(Err_TableName,'CONTROLES');
  nbLignesIntegrees :=0;
  /*Recherche de : pIdtCss et pIdtCng depui IdTraitement*/
  Select IdtCss, IdtCng into pIdtCss, pIdtCng from CngEnt where RefAddCng=idTraitement;
  -- Total de la consignation = Total encaissé par mode de règlement
  -- CtrlTotCngModRglt (pIdtCss, pIdtCng) ;
  -- Total de la consignation = Total des montants du paiement des lignes d'encaissement
  CtrlTotPmtLgnEcss (pIdtCss, pIdtCng, nbAno)  ;
  nbLignesIntegrees := nbLignesIntegrees + nbAno;
  -- Total par mode de règlement des montants du paiement des lignes d'encaissement = total
  --     encaissé par mode de règlement
  CtrlTotModRglt (pIdtCss, pIdtCng);
  -- Nombre de paiements de la consignation = nombre de lignes des lignes d'encaissement
  --     pour cette consignation
  CtrlNbPmtCng (pIdtCss, pIdtCng);
  -- Nombre d'encaissement par mode de règlement = Nombre de lignes des lignes d'encaissement
  --     pour cette consignation pour ce mode de règlement
  CtrlNbEcssModRglt (pIdtCss, pIdtCng);
  -- *********************************
  -- Contrôle des données de la table consignation en-tête
  -- Date cohérente
  -- *********************************
  --     Une seule consignation par caisse et par jour (date de règlement)
  CtrlUneCngCssJour (pIdtCss, pIdtCng);
  -- Control una sola consignaci?n por referencia externa
  CtrlUneCngRfrExt (pIdtCss, pIdtCng);
  -- Control una sola consignaci?n por archivo importado

  CtrlDatRgltCng (pIdtCss, pIdtCng);
  -- *********************************
  -- Contrôle des données de la table consignation lignes d'encaissement
  -- *********************************
  -- Cliente existe
  CtrlExistClt (pIdtCss, pIdtCng);
    -- Pas deux fois le même numéro de client dans une même consignation
    CtrlPasDeuxNbCltCng (pIdtCss, pIdtCng);
    -- Pas deux fois le même numéro de facture dans une même consignation
  --   end if;
  -- Control un solo pago por cliente en la consignaci?n
  CtrlCltDeuxRglCng (pIdtCss, pIdtCng);
  -- Control un solo cliente por consignaci?n con el mismo valor
  CtrlCltMntDeuxRglCng (pIdtCss, pIdtCng);
  -- Si le mode de règlement est chèques, le nom du tireur, le numéro de chèque, le code banque
  --     et le code guichet sont obligatoires
  CtrlModRgltChq (pIdtCss, pIdtCng);
  --------------------------------------------------------------
  -- Control de coherencia entre el valor reportado en el c?digo
  -- de barras y el valor del pago, para el caso que es introducido
  -- el valor (Interfase COMFAUNION). Este control aplica solamente
  -- cuando el c?digo de barras est? completo.
  --------------------------------------------------------------
  -- CtrlCodBrrMntPmt (pIdtCss, pIdtCng);
  -- CtrlUneCngFicDatRgl(pIdtCss, pIdtCng);
  -- CtrlUneCltOprxFic_SEAAL(pIdtCss, pIdtCng);
  CtrlDatRglVld_SEAAL(pIdtCss, pIdtCng);
  CltUneFois_SEAAL(pIdtCss,pIdtCng);
  DatRglFut_SEAAL(pIdtCss,pIdtCng);
  CltImp_SEAAL(pIdtCss,pIdtCng);
  RglInt_SEAAL(pIdtCss,pIdtCng);
  TrtMsg01.DeleteItem(Err_TableName);
  return;
end Controles;
end;
/