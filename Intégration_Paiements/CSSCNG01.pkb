CREATE OR REPLACE PACKAGE BODY X7."CSSCNG01" IS
-------------------------------------------------------------------------------------------------
-- Description : Integration process from off-line cash-desk temporary tables.
-------------------------------------------------------------------------------------------------
-- Version     : 3.0.0
-- Created by  : C.Bonhome
-- Date        : 25 08 98
-------------------------------------------------------------------------------------------------
-- Version     : 3.1.0
-- Modified by : FBE
-- Date        : 24 10 02
-- Description : This package is modified from WAJ version in order to be used in Tanzhou
--               Water Company (China). This version is simplified and can't be used in WAJ.
--               All specific code was deleted and now it's needed to have the specific package
--               CSSCNG01_Spc. This process calls the procedure TRTLGNCSSCNG from specific package
--               each time after one CNGLGNCSS record is inserted into X7's tables.
-------------------------------------------------------------------------------------------------
-- Version     : 6.04.00
-- Modified by : FBE/LL
-- Date        : 19 01 09
-- Description : une seule ligne de caisse par client (et non plus par opération réglée)
--               utilisation des nouvelles procédures du package cltbtc01
-------------------------------------------------------------------------------------------------
-- Version     : 6.04.01
-- Modified by : FBE
-- Date        : 26 01 09
-- Description : - Ajout de l'appel a la procedure CSSCNG01_SPC.TrtCng avant le traitement de
--                 l'integration, ce qui permet traiter les cas specifiques (SEAAL)
--               - Ajout des controles 30 au 32 specifiques SEAAL
--               - Ajout et gestion de la colonne IdtCtrl dans CNGANO pour garder le controle
--                 effectue.
--               - Modification de TRTCNG pour forcer l'integration en cas d'erreur
-------------------------------------------------------------------------------------------------
-- Version     : 6.13.01
-- Modified by : FBE
-- Date        : 10 06 10
-- Description : - Changement du control 35 pour chercher des encaissements deja integres
--                 directement sur OPR
-------------------------------------------------------------------------------------------------
-- Version     : 6.13.02
-- Modified by : FBE
-- Date        : 17 01 11
-- Description : - Correction du controle 35: Encaissement deja integre.
--                 Il manque le IdtTypOpr = 2 dans la requete, donc s'il trouve une operation
--                 autre qu'un encaissement, a la date de reglement, il reporte qu'il avait un encaissement
-------------------------------------------------------------------------------------------------
-- Version     : 7.09.02
-- Modified by : SJ
-- Date        : 02 mars 2015
-- Description : - Traitement de la fiche 12439 : ajouter le paramétre pIdtAgt lors de l'appel de la prcedure CLTBTC01.X7_CRTOPR
-------------------------------------------------------------------------------------------------
--Variables globales para el manejo de errores
--Se genera una excepci?n "when others" que llama al
--Procedimiento MsgErr.
--Los parametros de entrada son:
  Err_IdtPck    VARCHAR2(40)     := 'CSSCNG01';
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
--           --------
  gvIdtTrt_Controle_Consignation TYPTCHE.IdtTypTche%TYPE := 'TRT2040';
--
-- *********************************
-- Purge des éventuelles anomalies avec le même numéro de caisse
-- *********************************
   vCptAno NUMBER;
   vModaffpmt NUMBER;
   vExistFct  NUMBER := 0;

FUNCTION VersionPkg
--        --------- Version du package utilisé
  RETURN NUMBER
IS
BEGIN
  RETURN 70902;
END;


PROCEDURE PURGE
 (pIdtCss CNGENT.IdtCss%TYPE,
  pIdtCng CNGENT.IdtCng%TYPE)
IS
BEGIN
 TrtMsg01.InsertItem(Err_TableName,'PURGE');
   DELETE CNGANO
   WHERE IDTCSS = pIdtCss
     AND IDTCNG = pIdtCng;
   UPDATE CNGLGNCSS
     SET NbrAno = 0
     WHERE IdtCss = pIdtCss
       AND IdtCng = pIdtCng;
 TrtMsg01.DeleteItem(Err_TableName);
END PURGE;
-- *********************************
-- Maj des lignes consignations valides
-- *********************************
PROCEDURE MajCngValid
 (pIdtCss CNGENT.IdtCss%TYPE,
  pIdtCng CNGENT.IdtCng%TYPE)
IS
  vSss date;
BEGIN
   TrtMsg01.InsertItem(Err_TableName,'MAJCNGVALID');
   select sss_DatJou
     into vSss
     from SSS;
   -- Maj des lignes valides
   UPDATE CNGENT SET SITCNG = 1,
    DATCTL = TRUNC (vSss)
   WHERE IDTCSS = pIdtCss
     AND IDTCNG = pIdtCng;
  TrtMsg01.DeleteItem(Err_TableName);
END MajCngValid;
-- *********************************
-- Maj des lignes consignations non valides
-- *********************************
PROCEDURE MajCngNonValid
 (pIdtCss CNGENT.IdtCss%TYPE,
  pIdtCng CNGENT.IdtCng%TYPE)
IS
  vSss date;
BEGIN
  TrtMsg01.InsertItem(Err_TableName,'MAJCNGNONVALID');
   select sss_DatJou
     into vSss
     from SSS;
   -- Maj des lignes non valides
   UPDATE CNGENT SET SITCNG = 0,
    DATCTL = TRUNC (vSss)
   WHERE IDTCSS = pIdtCss
     AND IDTCNG = pIdtCng;
   MajCngLgnNbrAno(pIdtCss, pIdtCng);
  TrtMsg01.DeleteItem(Err_TableName);
END MajCngNonValid;
-- *********************************
-- Maj des lignes consignations avec le nombre de anomalies
-- *********************************
PROCEDURE MajCngLgnNbrAno
 (pIdtCss CNGENT.IdtCss%TYPE,
  pIdtCng CNGENT.IdtCng%TYPE)
IS
  CURSOR cCNGLGN IS
    SELECT IdtCss, IdtCng, IdtLgnCssCng, COUNT(*) NbrAno
      FROM CNGANO
      WHERE IdtCss = pIdtCss
       AND  IdtCng = pIdtCng
       AND  IdtLgnCssCng IS NOT NULL
      GROUP BY IdtCss, IdtCng, IdtLgnCssCng;
BEGIN
  TrtMsg01.InsertItem(Err_TableName,'MAJCNGNONVALID');
  FOR rCNGLGN IN cCNGLGN LOOP
    UPDATE CNGLGNCSS
      SET NbrAno = rCNGLGN.NbrAno
      WHERE IdtCss       = rCNGLGN.IdtCss
       AND  IdtCng       = rCNGLGN.IdtCng
       AND  IdtLgnCssCng = rCNGLGN.IdtLgnCssCng;
  END LOOP;
  TrtMsg01.DeleteItem(Err_TableName);
END MajCngLgnNbrAno;
-- *********************************
-- Function que devuelve el n?mero de factura sin caracteres alfabéticos
-- *********************************
FUNCTION fNumFct
 (pNumFct FAC.NUMFCT%TYPE)
RETURN VARCHAR2
IS
  vNumFct FAC.NUMFCT%TYPE;
BEGIN
  vNumFct := TRANSLATE(pNumFct,
                       '1234567890ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz./-',
                       '1234567890');
  RETURN SUBSTR(vNumFct,-8,8);
END fNumFct;
-- *********************************
-- N° 1. Total de la consignation = Total encaissé par mode de règlement
-- *********************************
PROCEDURE CtrlTotCngModRglt
 (pIdtCss CNGENT.IdtCss%TYPE,
  pIdtCng CNGENT.IdtCng%TYPE)
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
PROCEDURE CtrlTotPmtLgnEcss
 (pIdtCss CNGENT.IdtCss%TYPE,
  pIdtCng CNGENT.IdtCng%TYPE)
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
    END LOOP;
  END IF;
  TrtMsg01.DeleteItem(Err_TableName);
END CtrlTotPmtLgnEcss;
-- *********************************
-- N° 3. Total par mode de règlement des montants du paiement des lignes d'encaissement = total
--     encaissé par mode de règlement
-- *********************************
PROCEDURE CtrlTotModRglt
 (pIdtCss CNGENT.IdtCss%TYPE,
  pIdtCng CNGENT.IdtCng%TYPE)
IS
  vSwControl NUMBER(1);
   CURSOR cWork IS SELECT MAX(CNGTTX.IDTCSS) IdtCss,
                          MAX(CNGTTX.IDTCNG) IdtCng,
                          MAX(TTLENCMODRGL)  TtlEncModRgl,
                          MAX(MODRGL.MODPMT) ModPmt,
                          NVL(SUM(MNTPMT),0)+NVL(SUM(MNTAVC),0) TtlModRglLgn
    FROM CNGTTX, MODRGL, CNGLGNCSS CNGLGNCSS1
      WHERE CNGTTX.IDTCSS        = pIdtCss
      AND CNGTTX.IDTCNG        = pIdtCng
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
/*
-- *********************************
-- N° 7. Date de règlement de la consignation tombe dans une période comptable ouverte (date
--          de début à max (date de fin ou date de fermeture) incluses)
-- *********************************
PROCEDURE CtrlDatRgltCngPeriode
 (pIdtCss CngEnt.IdtCss%TYPE,
  pIdtCng CngEnt.IdtCng%TYPE)
IS
  vSwControl number(1);
   cursor cWork is SELECT IDTCSS, IDTCNG, DATRGL
    FROM CNGENT
    WHERE IDTCSS = pIdtCss
      AND IDTCNG = pIdtCng
      AND 0 = ( SELECT count(*) from PRDCMP
        WHERE datrgl >= DATDEBPRDCMP
        AND   datrgl <= DATFINPRDCMP
        AND sttprdcmp = 1);
BEGIN
  TrtMsg01.InsertItem(Err_TableName,'CTRLDATRGLTCNGPERIODE');
  select Utl
    into vSwControl
    from CNGCTRL
    where IdtCtrl = 7;
  if vSwControl = 1 then
    for cCng in cWork loop
      -- Message d'erreur pour la consignation
      INSERT INTO CNGANO (IDTCSS, IDTCNG, IDTCTRL, IDTLGNCSSCNG, MSG_CODE, INFCMP)
      VALUES (cCng.IDTCSS, cCng.IDTCNG, 7, null, 'MSGCNG_ERR0007', to_char(cCng.DATRGL));
      vCptAno := 1;
    end loop;
  end if;
  TrtMsg01.DeleteItem(Err_TableName);
END CtrlDatRgltCngPeriode;
*/
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
END CtrlDatRgltCng ;
-- *********************************
-- N° 9. Numéro de facture appartient bien au client
-- *********************************
PROCEDURE CtrlNbFactClt
 (pIdtCss CNGENT.IdtCss%TYPE,
  pIdtCng CNGENT.IdtCng%TYPE)
IS
  -- On élimine toutes les consignations pour lesquelles le numéro de client ne correspond pas
  -- au client destinataire du contrat pour une facture non annulée.
  vSwControl NUMBER(1);
   vNbrFctAno NUMBER;
   CURSOR cWork IS
                SELECT IDTCSS,IDTCNG,
                       IDTLGNCSSCNG, NUMFCT
    FROM CNGLGNCSS
      WHERE CNGLGNCSS.IDTCSS = pIdtCss
      AND CNGLGNCSS.IDTCNG = pIdtCng
      AND IDTCLT NOT IN (SELECT IDTCLT
                           FROM OPR
                           WHERE OPR.RFR = CNGLGNCSS.NUMFCT
                            AND  idttypopr IN (1,7))
      AND CNGLGNCSS.IdtTypMvmCng <> 3
      AND IdtClt IS NOT NULL
      AND NUMFCT IS NOT NULL;
BEGIN
  TrtMsg01.InsertItem(Err_TableName,'CTRLNBFACTCLT');
  SELECT Utl
    INTO vSwControl
    FROM CNGCTRL
    WHERE IdtCtrl = 9;
  IF vSwControl = 1 THEN
    FOR cCng IN cWork LOOP
      SELECT COUNT(NUMFCT)
        INTO vNbrFctAno
        FROM CNGLGNCSS, CNGANO
        WHERE CNGANO.IdtLgnCssCng = CNGLGNCSS.IdtLgnCssCng
         AND  CNGANO.IdtCng       = CNGLGNCSS.IdtCng
         AND  CNGANO.IdtCss       = CNGLGNCSS.IdtCss
         AND  CNGANO.IdtCss       = cCng.IdtCss
         AND  CNGANO.IdtCng       = cCng.IdtCng
         AND  CNGLGNCSS.NUMFCT    = cCng.NUMFCT
         AND  CNGANO.Msg_Code    IN ('MSGCNG_ERR0014','MSGCNG_ERR0015');
      IF vNbrFctAno = 0 THEN
        -- Message d'erreur pour la ligne de consignation
        INSERT INTO CNGANO (IDTCSS, IDTCNG, IDTCTRL, IDTLGNCSSCNG, MSG_CODE, INFCMP)
        VALUES (cCng.IDTCSS, cCng.IDTCNG, 9, cCng.IDTLGNCSSCNG, 'MSGCNG_ERR0009', cCng.NUMFCT);
        vCptAno := 1;
      END IF;
    END LOOP;
  END IF;
  TrtMsg01.DeleteItem(Err_TableName);
END CtrlNbFactClt;
-- *********************************
-- N° 10. Pas deux fois le même numéro de facture dans une même consignation
-- *********************************
PROCEDURE CtrlPasDeuxNbFactCng
 (pIdtCss CNGENT.IdtCss%TYPE,
  pIdtCng CNGENT.IdtCng%TYPE)
IS
  vSwControl NUMBER(1);
   CURSOR cWork IS
                SELECT IDTCSS, IDTCNG,  NUMFCT, IDTLGNCSSCNG
    FROM CNGLGNCSS
      WHERE CNGLGNCSS.IDTCSS = pIdtCss
                  AND CNGLGNCSS.IDTCNG = pIdtCng
      AND 0 != (SELECT COUNT(ROWID)
          FROM  CNGLGNCSS CNGLGNCSS1
            WHERE IDTCSS = pIdtCss
           AND  IDTCNG = pIdtCng
           AND CNGLGNCSS1.NUMFCT = CNGLGNCSS.NUMFCT
           AND CNGLGNCSS1.ROWID != CNGLGNCSS.ROWID
                       AND CNGLGNCSS.IdtTypMvmCng <> 3
                       AND CNGLGNCSS1.IdtTypMvmCng <> 3)
      AND NUMFCT IS NOT NULL;
BEGIN
  TrtMsg01.InsertItem(Err_TableName,'CTRLPASDEUXNBFACTCNG');
  SELECT Utl
    INTO vSwControl
    FROM CNGCTRL
    WHERE IdtCtrl = 10;
  IF vSwControl = 1 THEN
    FOR cCng IN cWork LOOP
      -- Message d'erreur pour la consignation
      INSERT INTO CNGANO (IDTCSS, IDTCNG, IDTCTRL, IDTLGNCSSCNG, MSG_CODE, INFCMP)
      VALUES (cCng.IDTCSS, cCng.IDTCNG, 10, cCng.IDTLGNCSSCNG, 'MSGCNG_ERR0010', cCng.NUMFCT);
      vCptAno := 1;
    END LOOP;
  END IF;
  TrtMsg01.DeleteItem(Err_TableName);
END CtrlPasDeuxNbFactCng;
-- *********************************
-- N° 11. Montant du paiement <= au solde de la facture
-- *********************************
PROCEDURE CtrlMtPmtInfSldFact
 (pIdtCss CNGENT.IdtCss%TYPE,
  pIdtCng CNGENT.IdtCng%TYPE)
IS
  vSwControl NUMBER(1);
   vNbrFctAno NUMBER;
   CURSOR cWork IS SELECT IDTCSS, IDTCNG, IDTLGNCSSCNG, MNTPMT, NUMFCT
    FROM CNGLGNCSS
      WHERE CNGLGNCSS.IDTCSS = pIdtCss
                  AND CNGLGNCSS.IDTCNG = pIdtCng
      AND MNTPMT <= (SELECT SLD
                       FROM OPR
                       WHERE OPR.IDTCLT    = CNGLGNCSS.IDTCLT
                         AND OPR.IDTCPTCLT = CNGLGNCSS.IDTCPTCLT
                         AND IDTTYPOPR IN (1,7)
                         AND RFR= CNGLGNCSS.NUMFCT)
      AND CNGLGNCSS.IdtTypMvmCng <> 3
      AND CNGLGNCSS.NUMFCT IS NOT NULL;
BEGIN
  TrtMsg01.InsertItem(Err_TableName,'CTRLMTPMTINFSLDFACT');
  SELECT Utl
    INTO vSwControl
    FROM CNGCTRL
    WHERE IdtCtrl = 11;
  IF vSwControl = 1 THEN
    FOR cCng IN cWork LOOP
      SELECT COUNT(NUMFCT)
        INTO vNbrFctAno
        FROM CNGLGNCSS, CNGANO
        WHERE CNGANO.IdtLgnCssCng = CNGLGNCSS.IdtLgnCssCng
         AND  CNGANO.IdtCng       = CNGLGNCSS.IdtCng
         AND  CNGANO.IdtCss       = CNGLGNCSS.IdtCss
         AND  CNGANO.IdtCss       = cCng.IdtCss
         AND  CNGANO.IdtCng       = cCng.IdtCng
         AND  CNGLGNCSS.NUMFCT    = cCng.NUMFCT
         AND  CNGANO.Msg_Code    IN ('MSGCNG_ERR0014','MSGCNG_ERR0015');
      IF vNbrFctAno = 0 THEN
        -- Message d'erreur pour la ligne de consignation
        INSERT INTO CNGANO (IDTCSS, IDTCNG, IDTCTRL, IDTLGNCSSCNG, MSG_CODE, INFCMP)
        VALUES (cCng.IDTCSS, cCng.IDTCNG, 11, cCng.IDTLGNCSSCNG, 'MSGCNG_ERR0011', cCng.NUMFCT);
        vCptAno := 1;
      END IF;
    END LOOP;
  END IF;
  TrtMsg01.DeleteItem(Err_TableName);
END CtrlMtPmtInfSldFact;
-- *********************************
-- N° 12. Montant du paiement <= au solde de toutes les opérations intégrées dans le total à payer
--     de la facture (solde exigible hors échéances)
-- *********************************
PROCEDURE CtrlMtPmtInfSldOpeInt
 (pIdtCss CNGENT.IdtCss%TYPE,
  pIdtCng CNGENT.IdtCng%TYPE)
IS
  vSwControl NUMBER(1);
   vNbrFctAno NUMBER;
   CURSOR cWork IS
     SELECT IDTCSS, IDTCNG, IDTLGNCSSCNG, MNTPMT, NUMFCT, IDTCLT, IDTCPTCLT
       FROM CNGLGNCSS
       WHERE CNGLGNCSS.IDTCSS = pIdtCss
         AND CNGLGNCSS.IDTCNG = pIdtCng
         AND CNGLGNCSS.NUMFCT IS NOT NULL;
   vSolde NUMBER;
BEGIN
  TrtMsg01.InsertItem(Err_TableName,'CTRLMTPMTINFSLDOPEINT');
  SELECT Utl
    INTO vSwControl
    FROM CNGCTRL
    WHERE IdtCtrl = 12;
  IF vSwControl = 1 THEN
    FOR cCng IN cWork LOOP
      SELECT COUNT(NUMFCT)
        INTO vNbrFctAno
        FROM CNGLGNCSS, CNGANO
        WHERE CNGANO.IdtLgnCssCng = CNGLGNCSS.IdtLgnCssCng
         AND  CNGANO.IdtCng       = CNGLGNCSS.IdtCng
         AND  CNGANO.IdtCss       = CNGLGNCSS.IdtCss
         AND  CNGANO.IdtCss       = cCng.IdtCss
         AND  CNGANO.IdtCng       = cCng.IdtCng
         AND  CNGLGNCSS.NUMFCT    = cCng.NUMFCT
         AND  CNGANO.Msg_Code    IN ('MSGCNG_ERR0014','MSGCNG_ERR0015');
      IF vNbrFctAno = 0 THEN
        SELECT SUM(SLD) SOLDE
          INTO vSolde
          FROM OPR,FAC
          WHERE OPR.IDTCLT    = cCng.IDTCLT
            AND OPR.IDTCPTCLT = cCng.IDTCPTCLT
            AND OPR.RFR       = FAC.NUMFCT
            AND OPR.IDTOPR    <=
                (SELECT idtopr
                  FROM OPR
                  WHERE RFR = cCng.NUMFCT
                   AND  OPR.idttypopr = 1)
--            AND (IDTTYPOPR,IDTTYPFCT)
--              IN
--              (SELECT IDTTYPOPR,IDTTYPFCT
--               from PRMSLD
--               where IDTFCTSLD in (3,9));
;
        IF vSolde < cCng.MNTPMT THEN
          -- Message d'erreur pour la ligne de consignation
          INSERT INTO CNGANO (IDTCSS, IDTCNG, IDTCTRL, IDTLGNCSSCNG, MSG_CODE, INFCMP)
          VALUES (cCng.IDTCSS, cCng.IDTCNG, 12, cCng.IDTLGNCSSCNG, 'MSGCNG_ERR0012',
                  'F:' ||cCng.NUMFCT||
                  ' | S:'||TO_CHAR(vsolde,'999,999,990.99') ||
                  ' | P:'||TO_CHAR(cCng.MNTPMT,'999,999,990.99'));
          vCptAno := 1;
        END IF;
      END IF;
    END LOOP;
  END IF;
  TrtMsg01.DeleteItem(Err_TableName);
END CtrlMtPmtInfSldOpeInt;
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
-- N° 14. Numéro de facture existe
-- *********************************
PROCEDURE CtrlNbExistFact
 (pIdtCss CNGENT.IdtCss%TYPE,
  pIdtCng CNGENT.IdtCng%TYPE)
IS
  vSwControl NUMBER(1);
   CURSOR cWork IS SELECT IDTCSS, IDTCNG,
                          IDTLGNCSSCNG, NUMFCT
    FROM CNGLGNCSS
      WHERE CNGLGNCSS.IDTCSS = pIdtCss
                  AND CNGLGNCSS.IDTCNG = pIdtCng
      AND 0 = (SELECT COUNT(*)
                 FROM OPR
                 WHERE CNGLGNCSS.NUMFCT = OPR.RFR
                  AND  idttypopr IN (1,7))
      AND CNGLGNCSS.IdtTypMvmCng <> 3
      AND CNGLGNCSS.NUMFCT IS NOT NULL;
BEGIN
  TrtMsg01.InsertItem(Err_TableName,'CTRLNBEXISTFACT');
  SELECT Utl
    INTO vSwControl
    FROM CNGCTRL
    WHERE IdtCtrl = 14;
  IF vSwControl = 1 THEN
    FOR cCng IN cWork LOOP
      -- Message d'erreur pour la ligne de consignation
      INSERT INTO CNGANO (IDTCSS, IDTCNG, IDTCTRL, IDTLGNCSSCNG, MSG_CODE, INFCMP)
      VALUES (cCng.IDTCSS, cCng.IDTCNG, 14, cCng.IDTLGNCSSCNG, 'MSGCNG_ERR0014', cCng.NUMFCT);
      vCptAno := 1;
      vExistFct := 0;
    END LOOP;
  END IF;
  TrtMsg01.DeleteItem(Err_TableName);
END CtrlNbExistFact;
-- *********************************
-- N° 15. Factura anulada
-- *********************************
PROCEDURE CtrlNbAnnFact
 (pIdtCss CNGENT.IdtCss%TYPE,
  pIdtCng CNGENT.IdtCng%TYPE)
IS
  vSwControl NUMBER(1);
   CURSOR cWork IS SELECT IDTCSS, IDTCNG,
                          IDTLGNCSSCNG, NUMFCT
    FROM CNGLGNCSS
      WHERE CNGLGNCSS.IDTCSS = pIdtCss
                  AND CNGLGNCSS.IDTCNG = pIdtCng
      AND 0 != (SELECT COUNT(*)
                  FROM FAC
                  WHERE NUMFCT != '1'
                    AND FCTANN  = 1
                    AND CNGLGNCSS.NUMFCT = FAC.NUMFCT)
      AND CNGLGNCSS.IdtTypMvmCng <> 3
      AND CNGLGNCSS.NUMFCT IS NOT NULL;
BEGIN
  TrtMsg01.InsertItem(Err_TableName,'CTRLNBANNFACT');
  SELECT Utl
    INTO vSwControl
    FROM CNGCTRL
    WHERE IdtCtrl = 15;
  IF vSwControl = 1 THEN
    FOR cCng IN cWork LOOP
      -- Message d'erreur pour la ligne de consignation
      INSERT INTO CNGANO (IDTCSS, IDTCNG, IDTCTRL, IDTLGNCSSCNG, MSG_CODE, INFCMP)
      VALUES (cCng.IDTCSS, cCng.IDTCNG, 15, cCng.IDTLGNCSSCNG, 'MSGCNG_ERR0015', cCng.NUMFCT);
      vCptAno := 1;
      vExistFct := 0;
    END LOOP;
  END IF;
  TrtMsg01.DeleteItem(Err_TableName);
END CtrlNbAnnFact;
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
      vExistFct := 0;
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
-- N° 18. Factura Existe a la fecha de pago
-- *********************************
PROCEDURE CtrlFctExistDatRgl
 (pIdtCss CNGENT.IdtCss%TYPE,
  pIdtCng CNGENT.IdtCng%TYPE)
IS
  vSwControl NUMBER(1);
   CURSOR cWork IS SELECT CNGENT.IDTCSS, CNGENT.IDTCNG, CNGENT.DatRgl,
                          CNGLGNCSS.IDTLGNCSSCNG, CNGLGNCSS.NUMFCT,
                          OPR.DatVlr
    FROM CNGLGNCSS, CNGENT, OPR
      WHERE CNGENT.IdtCss        = pIdtCss
                  AND CNGENT.IdtCng    = pIdtCng
                  AND CNGLGNCSS.IDTCSS = pIdtCss
                  AND CNGLGNCSS.IDTCNG = pIdtCng
                  AND OPR.Rfr          = CNGLGNCSS.NUMFCT
                  AND OPR.IdtTypOpr   IN (1,7)
      AND TRUNC(OPR.DatVlr)    > TRUNC(CNGENT.DatRgl)
      AND CNGLGNCSS.IdtTypMvmCng <> 3
      AND CNGLGNCSS.NUMFCT IS NOT NULL;
BEGIN
  TrtMsg01.InsertItem(Err_TableName,'CTRFCTEXISTDATRGL');
  SELECT Utl
    INTO vSwControl
    FROM CNGCTRL
    WHERE IdtCtrl = 18;
  IF vSwControl = 1 THEN
    FOR cCng IN cWork LOOP
      -- Message d'erreur pour la ligne de consignation
      INSERT INTO CNGANO (IDTCSS, IDTCNG, IDTCTRL, IDTLGNCSSCNG, MSG_CODE, INFCMP)
      VALUES (cCng.IDTCSS, cCng.IDTCNG, 18, cCng.IDTLGNCSSCNG, 'MSGCNG_ERR0018',
              'C: ' || TO_CHAR(cCng.DatRgl,'dd/mm/yyyy') || '          | F: ' ||
              TO_CHAR(cCng.DatVlr,'dd/mm/yyyy') || '          | ' || cCng.NUMFCT);
      vCptAno := 1;
      vExistFct := 0;
    END LOOP;
  END IF;
  TrtMsg01.DeleteItem(Err_TableName);
END CtrlFctExistDatRgl;
--------------------------------------------------------------
-- N° 19. Control que el c?digo de tipo de movimiento de consignaci?n
-- es v?lido
--------------------------------------------------------------
PROCEDURE CtrlTypMvmCng
 (pIdtCss CNGENT.IdtCss%TYPE,
  pIdtCng CNGENT.IdtCng%TYPE)
IS
  vSwControl NUMBER(1);
   CURSOR cWork IS SELECT IDTCSS, IDTCNG, NUMFCT, IDTLGNCSSCNG
    FROM CNGLGNCSS
      WHERE IDTCSS = pIdtCss
      AND IDTCNG = pIdtCng
      AND IDTTYPMVMCNG NOT IN (1,2,3,4,5,6,7,8,9,10);
BEGIN
  TrtMsg01.InsertItem(Err_TableName,'CTRLTYPMVMCNG');
  SELECT Utl
    INTO vSwControl
    FROM CNGCTRL
    WHERE IdtCtrl = 19;
  IF vSwControl = 1 THEN
    FOR cCng IN cWork LOOP
      -- Message d'erreur pour la consignation
      INSERT INTO CNGANO (IDTCSS, IDTCNG, IDTCTRL, IDTLGNCSSCNG, MSG_CODE, INFCMP)
      VALUES (cCng.IDTCSS, cCng.IDTCNG, 19, cCng.IDTLGNCSSCNG, 'MSGCNG_ERR0019', NULL);
      vcptano := 1;
    END LOOP;
  END IF;
  TrtMsg01.DeleteItem(Err_TableName);
END CtrlTypMvmCng;
-- *********************************
-- N° 20. Montant du paiement <> au solde de la facture
-- *********************************
PROCEDURE CtrlMtPmtDifSldFact
 (pIdtCss CNGENT.IdtCss%TYPE,
  pIdtCng CNGENT.IdtCng%TYPE)
IS
  vSwControl NUMBER(1);
   vNbrFctAno NUMBER;
   CURSOR cWork IS SELECT IDTCSS, IDTCNG, IDTLGNCSSCNG, MNTPMT, NUMFCT
    FROM CNGLGNCSS
      WHERE CNGLGNCSS.IDTCSS = pIdtCss
                  AND CNGLGNCSS.IDTCNG = pIdtCng
      AND MNTPMT <> (SELECT SLD
                       FROM OPR
                       WHERE OPR.IDTCLT    = CNGLGNCSS.IDTCLT
                         AND OPR.IDTCPTCLT = CNGLGNCSS.IDTCPTCLT
                         AND IDTTYPOPR IN (1,7)
                         AND RFR= CNGLGNCSS.NUMFCT)
      AND CNGLGNCSS.IdtTypMvmCng <> 3
      AND CNGLGNCSS.NUMFCT IS NOT NULL;
BEGIN
  TrtMsg01.InsertItem(Err_TableName,'CTRLMTPMTDIFSLDFACT');
  SELECT Utl
    INTO vSwControl
    FROM CNGCTRL
    WHERE IdtCtrl = 20;
  IF vSwControl = 1 THEN
    FOR cCng IN cWork LOOP
      SELECT COUNT(NUMFCT)
        INTO vNbrFctAno
        FROM CNGLGNCSS, CNGANO
        WHERE CNGANO.IdtLgnCssCng = CNGLGNCSS.IdtLgnCssCng
         AND  CNGANO.IdtCng       = CNGLGNCSS.IdtCng
         AND  CNGANO.IdtCss       = CNGLGNCSS.IdtCss
         AND  CNGANO.IdtCss       = cCng.IdtCss
         AND  CNGANO.IdtCng       = cCng.IdtCng
         AND  CNGLGNCSS.NUMFCT    = cCng.NUMFCT
         AND  CNGANO.Msg_Code    IN ('MSGCNG_ERR0014','MSGCNG_ERR0015');
      IF vNbrFctAno = 0 THEN
        -- Message d'erreur pour la ligne de consignation
        INSERT INTO CNGANO (IDTCSS, IDTCNG, IDTCTRL, IDTLGNCSSCNG, MSG_CODE, INFCMP)
        VALUES (cCng.IDTCSS, cCng.IDTCNG, 20, cCng.IDTLGNCSSCNG, 'MSGCNG_ERR0020', cCng.NUMFCT);
        vCptAno := 1;
      END IF;
    END LOOP;
  END IF;
  TrtMsg01.DeleteItem(Err_TableName);
END CtrlMtPmtDifSldFact;
--------------------------------------------------------------
-- N° 21. Control de coherencia entre el valor reportado en el c?digo
--        de barras y el valor del pago, para el caso que es introducido
--        el valor (Interfase COMFAUNION). Este control aplica solamente
--        cuando el c?digo de barras est? completo.
--------------------------------------------------------------
PROCEDURE CtrlCodBrrMntPmt
 (pIdtCss CNGENT.IdtCss%TYPE,
  pIdtCng CNGENT.IdtCng%TYPE)
IS
  vSwControl NUMBER(1);
  CURSOR cWORK IS
    SELECT IdtCss, IdtCng, NUMFCT, IdtLgnCssCng
      FROM CNGLGNCSS
      WHERE IdtCss = pIdtCss
       AND  IdtCng = pIdtCng
       AND  CodBrrRgt IS NOT NULL
       AND  INSTR(CodBrrRgt,'/') <> 0
       AND  DECODE(INSTR(CodBrrRgt,'/',1),
                   0,NULL,
                     SUBSTR(CodBrrRgt,INSTR(CodBrrRgt,'/',1)+1,
                                      LENGTH(CodBrrRgt)-INSTR(CodBrrRgt,'/',1))) <> MntPmt;
BEGIN
  TrtMsg01.InsertItem(Err_TableName,'CTRLCODBRRMNTPMT');
  SELECT Utl
    INTO vSwControl
    FROM CNGCTRL
    WHERE IdtCtrl = 21;
  IF vSwControl = 1 THEN
    FOR cCng IN cWork LOOP
      -- Message d'erreur pour la consignation
      INSERT INTO CNGANO (IDTCSS, IDTCNG, IDTCTRL, IDTLGNCSSCNG, MSG_CODE, INFCMP)
      VALUES (cCng.IDTCSS, cCng.IDTCNG, 21, cCng.IDTLGNCSSCNG, 'MSGCNG_ERR0021', NULL);
      vcptano := 1;
    END LOOP;
  END IF;
  TrtMsg01.DeleteItem(Err_TableName);
END CtrlCodBrrMntPmt;
-- *********************************
-- N° 22. Numéro de facture existe WAJ
-- *********************************
PROCEDURE CtrlNbExistFactWAJ
 (pIdtCss CNGENT.IdtCss%TYPE,
  pIdtCng CNGENT.IdtCng%TYPE)
IS
  vSwControl NUMBER(1);
   CURSOR cWork IS SELECT IDTCSS, IDTCNG,
                          IDTLGNCSSCNG, NUMFCT
    FROM CNGLGNCSS
      WHERE CNGLGNCSS.IDTCSS = pIdtCss
                  AND CNGLGNCSS.IDTCNG = pIdtCng
      AND 0 = (SELECT COUNT(*)
                 FROM OPR
                 WHERE OPR.IdtClt       = CNGLGNCSS.IdtClt
                  AND  OPR.IdtCptClt    = CNGLGNCSS.IdtCptClt
                  AND  CSSCNG01.fNumFct(CNGLGNCSS.NUMFCT) = CSSCNG01.fNumFct(OPR.RFR)
                  AND  idttypopr IN (1,7))
      AND CNGLGNCSS.IdtTypMvmCng <> 3
      AND CNGLGNCSS.NUMFCT IS NOT NULL;
BEGIN
  TrtMsg01.InsertItem(Err_TableName,'CTRLNBEXISTFACT');
  SELECT Utl
    INTO vSwControl
    FROM CNGCTRL
    WHERE IdtCtrl = 22;
  IF vSwControl = 1 THEN
    FOR cCng IN cWork LOOP
      -- Message d'erreur pour la ligne de consignation
      INSERT INTO CNGANO (IDTCSS, IDTCNG, IDTCTRL, IDTLGNCSSCNG, MSG_CODE, INFCMP)
      VALUES (cCng.IDTCSS, cCng.IDTCNG, 22, cCng.IDTLGNCSSCNG, 'MSGCNG_ERR0014', cCng.NUMFCT);
      vCptAno := 1;
      vExistFct := 0;
    END LOOP;
  END IF;
  TrtMsg01.DeleteItem(Err_TableName);
END CtrlNbExistFactWAJ;
-- *********************************
-- N° 23. Factura anulada WAJ
-- *********************************
PROCEDURE CtrlNbAnnFactWAJ
 (pIdtCss CNGENT.IdtCss%TYPE,
  pIdtCng CNGENT.IdtCng%TYPE)
IS
  vSwControl NUMBER(1);
   CURSOR cWork IS SELECT IDTCSS, IDTCNG,
                          IDTLGNCSSCNG, NUMFCT
    FROM CNGLGNCSS
      WHERE CNGLGNCSS.IDTCSS = pIdtCss
                  AND CNGLGNCSS.IDTCNG = pIdtCng
      AND 0 != (SELECT COUNT(*)
                  FROM FAC
                  WHERE NUMFCT != '1'
                    AND FCTANN  = 1
                    AND FAC.IdtClt = CNGLGNCSS.IdtClt
                    AND CSSCNG01.fNumFct(CNGLGNCSS.NUMFCT) = CSSCNG01.fNumFct(FAC.NUMFCT))
      AND CNGLGNCSS.IdtTypMvmCng <> 3
      AND CNGLGNCSS.NUMFCT IS NOT NULL;
BEGIN
  TrtMsg01.InsertItem(Err_TableName,'CTRLNBANNFACT');
  SELECT Utl
    INTO vSwControl
    FROM CNGCTRL
    WHERE IdtCtrl = 23;
  IF vSwControl = 1 THEN
    FOR cCng IN cWork LOOP
      -- Message d'erreur pour la ligne de consignation
      INSERT INTO CNGANO (IDTCSS, IDTCNG, IDTCTRL, IDTLGNCSSCNG, MSG_CODE, INFCMP)
      VALUES (cCng.IDTCSS, cCng.IDTCNG, 23, cCng.IDTLGNCSSCNG, 'MSGCNG_ERR0015', cCng.NUMFCT);
      vCptAno := 1;
      vExistFct := 0;
    END LOOP;
  END IF;
  TrtMsg01.DeleteItem(Err_TableName);
END CtrlNbAnnFactWAJ;
-- *********************************
-- N° 24. Factura Existe a la fecha de pago WAJ
-- *********************************
PROCEDURE CtrlFctExistDatRglWAJ
 (pIdtCss CNGENT.IdtCss%TYPE,
  pIdtCng CNGENT.IdtCng%TYPE)
IS
  vSwControl NUMBER(1);
   CURSOR cWork IS SELECT CNGENT.IDTCSS, CNGENT.IDTCNG, CNGENT.DatRgl,
                          CNGLGNCSS.IDTLGNCSSCNG, CNGLGNCSS.NUMFCT,
                          OPR.DatVlr
    FROM CNGLGNCSS, CNGENT, OPR
      WHERE CNGENT.IdtCss        = pIdtCss
                  AND CNGENT.IdtCng    = pIdtCng
                  AND CNGLGNCSS.IDTCSS = pIdtCss
                  AND CNGLGNCSS.IDTCNG = pIdtCng
                  AND OPR.IdtClt       = CNGLGNCSS.IdtClt
                  AND OPR.IdtCptClt    = CNGLGNCSS.IdtCptClt
                  AND CSSCNG01.fNumFct(OPR.Rfr) = CSSCNG01.fNumFct(CNGLGNCSS.NUMFCT)
                  AND OPR.IdtTypOpr   IN (1,7)
      AND TRUNC(OPR.DatVlr)    > TRUNC(CNGENT.DatRgl)
      AND CNGLGNCSS.IdtTypMvmCng <> 3
      AND CNGLGNCSS.NUMFCT IS NOT NULL;
BEGIN
  TrtMsg01.InsertItem(Err_TableName,'CTRFCTEXISTDATRGL');
  SELECT Utl
    INTO vSwControl
    FROM CNGCTRL
    WHERE IdtCtrl = 24;
  IF vSwControl = 1 THEN
    FOR cCng IN cWork LOOP
      -- Message d'erreur pour la ligne de consignation
      INSERT INTO CNGANO (IDTCSS, IDTCNG, IDTCTRL, IDTLGNCSSCNG, MSG_CODE, INFCMP)
      VALUES (cCng.IDTCSS, cCng.IDTCNG, 24, cCng.IDTLGNCSSCNG, 'MSGCNG_ERR0018',
              'C: ' || TO_CHAR(cCng.DatRgl,'dd/mm/yyyy') || '          | F: ' ||
              TO_CHAR(cCng.DatVlr,'dd/mm/yyyy') || '          | ' || cCng.NUMFCT);
      vCptAno := 1;
      vExistFct := 0;
    END LOOP;
  END IF;
  TrtMsg01.DeleteItem(Err_TableName);
END CtrlFctExistDatRglWAJ;
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
-- N° 26. El archivo no ha sido previamente tratado.
-- *********************************
PROCEDURE CtrlUneCngFic
 (pIdtCss CNGENT.IdtCss%TYPE,
  pIdtCng CNGENT.IdtCng%TYPE)
IS
  vSwControl NUMBER(1);
   CURSOR cWork IS
    SELECT IDTCSS, IDTCNG, DATRGL, RfrFic
    FROM CNGENT
      WHERE IDTCSS = pIdtCss
      AND IDTCNG = pIdtCng
      AND 0 <> (SELECT COUNT(*) FROM CNGENT CNGENT2
                  WHERE CNGENT2.IdtCss = CNGENT.IdtCss
                   and  CNGENT2.RfrFic = CNGENT.RfrFic
-- Specifique SEAAL
      AND  DatInt is not null)
      AND RfrFic IS NOT NULL;
   nLigne NUMBER;
BEGIN
  TrtMsg01.InsertItem(Err_TableName,'CTRLUNECNGFIC');
  SELECT Utl
    INTO vSwControl
    FROM CNGCTRL
    WHERE IdtCtrl = 26;
  IF vSwControl = 1 THEN
    FOR cCng IN cWork LOOP
      -- Message d'erreur pour la consignation
      INSERT INTO CNGANO (IDTCSS, IDTCNG, IDTCTRL, IDTLGNCSSCNG, MSG_CODE, INFCMP)
      VALUES (cCng.IDTCSS, cCng.IDTCNG, 26, NULL, 'MSGCNG_ERR0026', cCng.RfrFic);
      vCptAno := 1;
    END LOOP;
  END IF;
  TrtMsg01.DeleteItem(Err_TableName);
END CtrlUneCngFic;
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
-- N° 29. File with same payment date already imported.
-- *********************************
PROCEDURE CtrlUneCngFicDatRgl
 (pIdtCss CNGENT.IdtCss%TYPE,
  pIdtCng CNGENT.IdtCng%TYPE)
IS
  vSwControl NUMBER(1);
   CURSOR cWork IS
    SELECT IDTCSS, IDTCNG, DATRGL, RfrFic
    FROM CNGENT
      WHERE IDTCSS = pIdtCss
      AND IDTCNG = pIdtCng
      AND 0 <> (SELECT COUNT(*) FROM CNGENT CNGENT2
                  WHERE CNGENT2.RfrFic = CNGENT.RfrFic
                   AND  CNGENT2.DatRgl = CNGENT.DatRgl
                   AND  CNGENT2.IdtCss <> pIdtCss
                   AND  CNGENT2.IdtCng <> pIdtCng)
      AND RfrFic IS NOT NULL;
   nLigne NUMBER;
BEGIN
  TrtMsg01.InsertItem(Err_TableName,'CTRLUNECNGFIC');
  SELECT Utl
    INTO vSwControl
    FROM CNGCTRL
    WHERE IdtCtrl = 29;
  IF vSwControl = 1 THEN
    FOR cCng IN cWork LOOP
      -- Message d'erreur pour la consignation
      INSERT INTO CNGANO (IDTCSS, IDTCNG, IDTCTRL, IDTLGNCSSCNG, MSG_CODE, INFCMP)
      VALUES (cCng.IDTCSS, cCng.IDTCNG, 29, NULL, 'MSGCNG_ERR0029', cCng.RfrFic);
      vCptAno := 1;
    END LOOP;
  END IF;
  TrtMsg01.DeleteItem(Err_TableName);
END CtrlUneCngFicDatRgl;
-- *********************************
-- N° 30. Client is only once in the file (SEAAL)
-- *********************************
PROCEDURE CtrlUneCltOprxFic_SEAAL
 (pIdtCss CNGENT.IdtCss%TYPE,
  pIdtCng CNGENT.IdtCng%TYPE)
IS
  vSwControl NUMBER(1);
   CURSOR cWork IS
    SELECT distinct IDTCSS, IDTCNG,  IDTCLT, IDTLGNCSSCNG
      FROM CNGLGNCSS
      WHERE CNGLGNCSS.IDTCSS = pIdtCss
       AND CNGLGNCSS.IDTCNG = pIdtCng
       AND (IdtClt, nvl(NumFct,'zzzz')) in (SELECT IdtClt, nvl(NumFct,'zzzz')
                   FROM  CNGLGNCSS CNGLGNCSS1
                   WHERE IDTCSS = pIdtCss
                    AND  IDTCNG = pIdtCng
                    AND  CNGLGNCSS1.IDTCLT = CNGLGNCSS.IDTCLT
                   group by IdtClt, NumFct
                   having count(*) > 1);
   nLigne NUMBER;
BEGIN
  TrtMsg01.InsertItem(Err_TableName,'CtrlUneCltOprxFic_SEAAL');
  SELECT Utl
    INTO vSwControl
    FROM CNGCTRL
    WHERE IdtCtrl = 30;
  IF vSwControl = 1 THEN
    FOR cCng IN cWork LOOP
      -- Message d'erreur pour la consignation
      INSERT INTO CNGANO (IDTCSS, IDTCNG, IDTCTRL, IDTLGNCSSCNG, MSG_CODE, INFCMP)
      VALUES (cCng.IDTCSS, cCng.IDTCNG, 30, cCng.IDTLGNCSSCNG, 'MSGCNG_ERR0030', null);
      vCptAno := 1;
    END LOOP;
  END IF;
  TrtMsg01.DeleteItem(Err_TableName);
END CtrlUneCltOprxFic_SEAAL;
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
-- *********************************
-- Contrôle de cohérence des données
-- *********************************
PROCEDURE Controles
 (pIdtCss CNGENT.IdtCss%TYPE,
  pIdtCng CNGENT.IdtCng%TYPE)
IS
BEGIN
  TrtMsg01.InsertItem(Err_TableName,'CONTROLES');
   -- Total de la consignation = Total encaissé par mode de règlement
   CtrlTotCngModRglt (pIdtCss, pIdtCng) ;
   -- Total de la consignation = Total des montants du paiement des lignes d'encaissement
   CtrlTotPmtLgnEcss (pIdtCss, pIdtCng)  ;
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
   CtrlUneCngFic (pIdtCss, pIdtCng);
   --     Date de règlement de la consignation tombe dans une période comptable ouverte (date
   --          de début à max (date de fin ou date de fermeture) incluses)
   --   CtrlDatRgltCngPeriode (pIdtCss, pIdtCng);
   --     Date de règlement de la consignation <= Date du jour
   CtrlDatRgltCng (pIdtCss, pIdtCng);
   -- *********************************
   -- Contrôle des données de la table consignation lignes d'encaissement
   -- *********************************
   -- Cliente existe
   CtrlExistClt (pIdtCss, pIdtCng);
   -- Numéro de facture existe
   CtrlNbExistFact (pIdtCss, pIdtCng);
   CtrlNbExistFactWAJ (pIdtCss, pIdtCng);
--   if vExistFct = 1 then
     -- Factura anulada
     CtrlNbAnnFact (pIdtCss, pIdtCng);
     CtrlNbAnnFactWAJ (pIdtCss, pIdtCng);
--   end if;
     -- Facture Existante a la date de paiement
   CtrlFctExistDatRgl (pIdtCss, pIdtCng);
   CtrlFctExistDatRglWAJ (pIdtCss, pIdtCng);
--   if vExistFct = 1 then
     -- Numéro de facture appartient bien au client
     CtrlNbFactClt (pIdtCss, pIdtCng);
     -- Pas deux fois le même numéro de client dans une même consignation
     CtrlPasDeuxNbCltCng (pIdtCss, pIdtCng);
     -- Pas deux fois le même numéro de facture dans une même consignation
     CtrlPasDeuxNbFactCng (pIdtCss, pIdtCng);
     IF vModaffpmt = 1 THEN
  -- Montant du paiement <= au solde de la facture
       CtrlMtPmtInfSldFact (pIdtCss, pIdtCng);
     ELSE
  -- Montant du paiement <= au solde de toutes les opérations intégrées dans le total à payer
  --     de la facture (solde exigible hors échéances)
       CtrlMtPmtInfSldOpeInt (pIdtCss, pIdtCng);
     END IF;
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
   CtrlCodBrrMntPmt (pIdtCss, pIdtCng);
   CtrlUneCngFicDatRgl(pIdtCss, pIdtCng);
   CtrlUneCltOprxFic_SEAAL(pIdtCss, pIdtCng);
   CtrlDatRglVld_SEAAL(pIdtCss, pIdtCng);
   CltUneFois_SEAAL(pIdtCss,pIdtCng);
   DatRglFut_SEAAL(pIdtCss,pIdtCng);
   CltImp_SEAAL(pIdtCss,pIdtCng);
   RglInt_SEAAL(pIdtCss,pIdtCng);
  TrtMsg01.DeleteItem(Err_TableName);
END Controles;
-- *********************************
-- Intégration de consignation
-- *********************************
PROCEDURE Integration
 (pIdtCss CNGENT.IdtCss%TYPE,
  pIdtCng CNGENT.IdtCng%TYPE)
IS
  CURSOR cWork IS
    SELECT IDTAGT         ,
           DATRGL         ,
           TTLCNG         ,
           NBRPMTCNG      ,
           DATCTL         ,
           SITCNG         ,
           DATINT         ,
           IDTDVS         ,
           REFADDCNG      ,
           ROWID
      FROM CNGENT
      WHERE IDTCSS = pIdtCss
        AND IDTCNG = pIdtCng
        AND SITCNG = 1;
  -- Next variable is used in order to send all CNGLGNCSS information to the
  -- specific package.
  rCngLgnCss CNGLGNCSS%ROWTYPE;
  vLgnCss     NUMBER;
  v1idttypopr NUMBER;
  vMntPmt     NUMBER(15,4);
  vMntAff     NUMBER(15,4);
  vIdtCtr     CTR.IdtCtr%TYPE;
  vIdtTabSeq  TABSEQ.IdtTabSeq%TYPE;
  vOprRfr     OPR.RFR%TYPE;
  vMsgOpr     VARCHAR2(2000);
  vOldIdtClt  CLT.IdtClt%TYPE := 'zzzz';
  vTotAvcxLgn number := 0; -- Montant cumule de l'avance
  vTotPmtxLgn number := 0; -- Montant cumule de reglement par ligne de caisse
  vNbrPmtInt  number := 0; -- Nombre des lignes integrees
  vSwUneLgnxClt number := 1;
  vSss_datJou date;
BEGIN
  TrtMsg01.InsertItem(Err_TableName,'INTEGRATION');
  -- Pour chaque lot de consignation à traiter
  SELECT IdtTabSeq, sss_Datjou
    INTO vIdtTabSeq, vsss_DatJou
    FROM TYPMVM, SSS
    WHERE IdtTypMvm = 5;
  CSSCNG01_SPC.TrtCng(pIdtCss,pIdtCng);
  FOR cCng IN cWork LOOP
    -- Pour chaque ligne de paiement du lot
    DECLARE
      vPrpCptBnc VARCHAR2(40);
      --La siguiente variable almacena la informaci?n sobre si se debe o no realizar una afectaci?n
      --de pago, es decir, es un pago realizado diferente de abono. Si es el caso, se insertan l?neas
      --en la tabla LGNCSS
--      vAffPmt number;
      CURSOR cLgnWork IS
        SELECT IDTLGNCSSCNG   ,
               REFADDLGNCSSCNG,
               IDTCLT         ,
               IDTCPTCLT      ,
               NUMFCT         ,
               MNTPMT         ,
               MNTAVC         ,
               sum(MntPmt+nvl(MntAvc,0)) over (partition by IdtClt) MntPmtxClt,  -- Montant total des affectations pour le client
               sum(MntAvc) over (partition by IdtClt) MntAvcxClt,                -- Montant total des avances pour le client
               count(*) over (partition by IdtClt) NbrLgnxClt,                   -- Nombre de lignes total par client
               count(*) over (partition by IdtClt order by IdtLgnCssCng range unbounded preceding) LgnxClt, -- Numero de ligne pour chaque client
               CNGLGNCSS.IDTMODRGL,
               IDTBNQ         ,
               IDTGCH         ,
               NUMCPTBNC      ,
               CLERIB         ,
               NOMTRR         ,
               NUMCHQ         ,
               nvl(CNGLGNCSS.DatRgl,CNGENT.DATRGL) DatRgl  ,
               CNGLGNCSS.IdtTypMvmCng,
               NVL(CNGTYPMVM.Pmt,0) Pmt
          FROM CNGTYPMVM, CNGLGNCSS,CNGENT
          WHERE CNGENT.IDTCSS   = pIdtCss
            AND CNGENT.IDTCNG    = pIdtCng
            AND CNGLGNCSS.IDTCSS = CNGENT.IDTCSS
            AND CNGLGNCSS.IDTCNG = CNGENT.IDTCNG
            AND CNGTYPMVM.IdtTypMvmCng = CNGLGNCSS.IdtTypMvmCng
            and NVL(CNGTYPMVM.Pmt,0) = 1
          order by IdtClt;
    BEGIN
      Err_Msg := 'Recherche du mode d''affectation des paiements';
      SELECT NVL(modaffpmt,1)
        INTO vModaffpmt
        FROM PRMGNR;
      FOR cLgnCng IN cLgnWork LOOP
        Err_Msg := 'Consignement ===> ' || pIdtCss || ' - ' || pIdtCng ||
                 ' Line ===> ' || cLgnCng.IdtLgnCssCng;
        if vSwUneLgnxClt = 1 then
          vTotPmtxLgn := cLgnCng.MntPmtxClt;
          vTotAvcxLgn := cLgnCng.MntAvcxClt;
        else
          vTotPmtxLgn := cLgnCng.MNTPMT + NVL(cLgnCng.MNTAVC,0);
          vTotAvcxLgn := NVL(cLgnCng.MNTAVC,0);
        end if;
        -- on ne crée qu'un identifiant de  ligne de caisse (i.e. une seule opéraiton) par client
        if vSwUneLgnxClt = 1 then
          if cLgnCng.idtclt <> nvl(rCngLgncss.IdtClt,'zzzz') then
            X7_TRTSEQ01.X7_NXTTABSEQ(vIdtTabSeq,vLgnCss);
          else
            vTotAvcxLgn := 0;
          end if;
        else
          X7_TRTSEQ01.X7_NXTTABSEQ(vIdtTabSeq,vLgnCss);
        end if;
        rCngLgnCss.IDTCSS          := pIDTCSS;
        rCngLgnCss.IDTCNG          := pIDTCNG;
        rCngLgnCss.IDTLGNCSSCNG    := cLgnCng.IDTLGNCSSCNG;
        rCngLgnCss.REFADDLGNCSSCNG := cLgnCng.REFADDLGNCSSCNG;
        rCngLgnCss.IDTCLT          := cLgnCng.IDTCLT;
        rCngLgnCss.IDTCPTCLT       := cLgnCng.IDTCPTCLT;
        rCngLgnCss.NUMFCT          := cLgnCng.NUMFCT;
        rCngLgnCss.MNTPMT          := cLgnCng.MNTPMT;
        rCngLgnCss.MNTAVC          := cLgnCng.MNTAVC;
        rCngLgnCss.IDTMODRGL       := cLgnCng.IDTMODRGL;
        rCngLgnCss.IDTBNQ          := cLgnCng.IDTBNQ;
        rCngLgnCss.IDTGCH          := cLgnCng.IDTGCH;
        rCngLgnCss.NUMCPTBNC       := cLgnCng.NUMCPTBNC;
        rCngLgnCss.CLERIB          := cLgnCng.CLERIB;
        rCngLgnCss.NOMTRR          := cLgnCng.NOMTRR;
        rCngLgnCss.NUMCHQ          := cLgnCng.NUMCHQ;
        rCngLgnCss.IDTTYPMVMCNG    := cLgnCng.IDTTYPMVMCNG;
        rCngLgnCss.DatRgl          := cLgnCng.DatRgl;
        IF vTotAvcxLgn > 0 THEN
--          -- Insertion d'une ligne de caisse avance
--          if cLgnCng.idtclt <> rCngLgncss.IdtClt then
--            X7_TRTSEQ01.X7_NXTTABSEQ(vIdtTabSeq,vLgnCss);
--          end if;
          Err_Msg := '1er insert LGNCSS';
          INSERT INTO LGNCSS (IdtTypMvm           , IdtLgnCss            ,
                              IdtAgt              , IdtCss               ,
                              IdtModRgl           , IdtDvs               ,
                              MntDvs              , MtnDvsTot            ,
                              Mnt                 , SldOpr               ,
                              MntRnd              , DatCrt               ,
                              IdtClt              , IdtCptClt            ,
                              IdtTypOpr           , Rfr                  ,
                              CLERIB              , NUMCPTBNC            ,
                              IdtBnq              , IdtGch               ,
                              NomTrr              , NumChq               ,
                              IDTCNG              , IDTLGNCSSCNG         ,
                              REFADDCNG           , DATMAJ               ,
                              REFADDLGNCSSCNG     , IdtNatRgl)
          VALUES (            5                   ,   vLgnCss             ,
                              cCng.IDTAGT         , pIdtCss             ,
                              cLgnCng.IDTMODRGL   , cCng.IDTDVS         ,
                              vTotAvcxLgn         , vTotPmtxLgn,
                              vTotAvcxLgn         , NULL                ,
                              0                   ,   cLgnCng.datrgl      ,
                              cLgnCng.IDTCLT      , cLgnCng.IDTCPTCLT   ,
                              2                   , NULL                ,
                              cLgnCng.CLERIB      , cLgnCng.NUMCPTBNC   ,
                              cLgnCng.IDTBNQ      , cLgnCng.IDTGCH      ,
                              cLgnCng.NOMTRR      , cLgnCng.NUMCHQ      ,
                              pIdtCng             , cLgnCng.IDTLGNCSSCNG,
                              cCng.REFADDCNG      , TRUNC(SYSDATE)      ,
                              cLgnCng.REFADDLGNCSSCNG, 1);
        END IF; --cLgnCng.MNTAVC > 0;
        -- Si se realiza inserci?n de pago sobre la tabla LGNCSS
        IF cLgnCng.Pmt = 1 THEN
          vNbrPmtInt := vNbrPmtInt + 1;
          -- Si le mode d'affectation des paiements est sur une facture
          IF vModaffpmt = 1 THEN
            if nvl(rCngLgnCss.MntPmt,0) > 0 then
              -- Insertion d'une ligne de caisse
              SELECT idttypopr INTO v1idttypopr
                FROM OPR
                WHERE rfr =  cLgnCng.NUMFCT
                 AND  idttypopr IN (1,7);
              Err_Msg := '2eme insert LGNCSS';
              INSERT INTO LGNCSS (IdtTypMvm           , IdtLgnCss            ,
                                  IdtAgt              , IdtCss               ,
                                  IdtModRgl           , IdtDvs               ,
                                  MntDvs              , MtnDvsTot            ,
                                  Mnt                 , SldOpr               ,
                                  MntRnd              , DatCrt               ,
                                  IdtClt              , IdtCptClt            ,
                                  IdtTypOpr           , Rfr                  ,
                                  CLERIB              , NUMCPTBNC            ,
                                  IdtBnq              , IdtGch               ,
                                  NomTrr              , NumChq               ,
                                  IDTCNG              , IDTLGNCSSCNG         ,
                                  REFADDCNG           , DATMAJ               ,
                                  REFADDLGNCSSCNG     , IdtNatRgl)
              VALUES (            5                   ,   vLgnCss             ,
                                  cCng.IDTAGT         , pIdtCss             ,
                                  cLgnCng.IDTMODRGL   , cCng.IDTDVS         ,
                                  cLgnCng.MNTPMT      , vTotPmtxLgn         ,
                                  cLgnCng.MNTPMT      , NULL                ,
                                  0                   ,   cLgnCng.DatRgl      ,
                                  cLgnCng.IDTCLT      , cLgnCng.IDTCPTCLT   ,
                                  v1idttypopr         , cLgnCng.NUMFCT      ,
                                  cLgnCng.CLERIB      , cLgnCng.NUMCPTBNC   ,
                                  cLgnCng.IDTBNQ      , cLgnCng.IDTGCH      ,
                                  cLgnCng.NOMTRR      , cLgnCng.NUMCHQ      ,
                                  pIdtCng             , cLgnCng.IDTLGNCSSCNG,
                                  cCng.REFADDCNG      , TRUNC(SYSDATE)      ,
                                  cLgnCng.REFADDLGNCSSCNG, 1);
--          ELSE
--            -- Si le mode d'affectation des paiements est sur la facture et
--            --   les factures antérieures non soldées
--            IF NVL(cLgnCng.MNTPMT,0) > 0 THEN
--              -- Recherche du montant à solder de la facture
--              DECLARE
--                CURSOR cOpr IS
--                  SELECT RFR,SLD, IdtTypOpr
--                    FROM OPR
--                    WHERE OPR.IDTCLT    = cLgnCng.IDTCLT
--                      AND OPR.IDTCPTCLT = cLgnCng.IDTCPTCLT
----                      and decode(IdtTypOpr,7,OPR.DatExg,to_date('01011900','ddmmyyyy')) <= sysdate
--                      AND OPR.Sld > 0
--                    ORDER BY DECODE(OPR.IdtTypOpr,7,OPR.DatExg,OPR.DatVlr);
--              BEGIN
--                vMntPmt :=cLgnCng.MntPmt;
--                -- Appel de la fonction d'affectation
--                FOR rOpr IN cOpr LOOP
--                  IF vMntPmt > 0 THEN
--                    IF vMntPmt > rOpr.Sld THEN
--                      vMntAff := rOpr.Sld;
--                    ELSE
--                      vMntAff := vMntPmt;
--                    END IF;
--                    --
--                    --if cLgnCng.idtclt <> rCngLgncss.IdtClt then
--                    X7_TRTSEQ01.X7_NXTTABSEQ(vIdtTabSeq,vLgnCss);
--                    --end if;
--                    --
--                    vMntPmt := vMntPmt - vMntAff;
--                     Err_Msg := '3eme insert';
--                    INSERT INTO LGNCSS (IdtTypMvm           , IdtLgnCss            ,
--                                        IdtAgt              , IdtCss               ,
--                                        IdtModRgl           , IdtDvs               ,
--                                        MntDvs              , MtnDvsTot            ,
--                                        Mnt                 , SldOpr               ,
--                                        MntRnd              , DatCrt               ,
--                                        IdtClt              , IdtCptClt            ,
--                                        IdtTypOpr           , Rfr                  ,
--                                        CLERIB              , NUMCPTBNC            ,
--                                        IdtBnq              , IdtGch               ,
--                                        NomTrr              , NumChq               ,
--                                        IDTCNG              , IDTLGNCSSCNG         ,
--                                        REFADDCNG           , DATMAJ               ,
--                                        REFADDLGNCSSCNG)
--                    VALUES (            5                   ,   vLgnCss             ,
--                                        cCng.IDTAGT         , pIdtCss             ,
--                                        cLgnCng.IDTMODRGL   , cCng.IDTDVS         ,
--                                        vMntAff             , cLgnCng.MNTPMT,
--                                        vMntAff             , NULL                ,
--                                        0                   ,   cLgnCng.DatRgl      ,
--                                        cLgnCng.IDTCLT      , cLgnCng.IDTCPTCLT   ,
--                                        rOPR.IdtTypOpr      , rOpr.rfr            ,
--                                        cLgnCng.CLERIB      , cLgnCng.NUMCPTBNC   ,
--                                        cLgnCng.IDTBNQ      , cLgnCng.IDTGCH      ,
--                                        cLgnCng.NOMTRR      , cLgnCng.NUMCHQ      ,
--                                        pIdtCng             , cLgnCng.IDTLGNCSSCNG,
--                                        cCng.REFADDCNG      , TRUNC(SYSDATE)      ,
--                                        cLgnCng.REFADDLGNCSSCNG);
--                  END IF; --vMntPmt > 0
--                END LOOP; --cursor cOPR
--                IF vMntPmt > 0 THEN
--                 Err_Msg := '4eme insert';
--                  INSERT INTO LGNCSS (IdtTypMvm           , IdtLgnCss            ,
--                                      IdtAgt              , IdtCss               ,
--                                      IdtModRgl           , IdtDvs               ,
--                                      MntDvs              , MtnDvsTot            ,
--                                      Mnt                 , SldOpr               ,
--                                      MntRnd              , DatCrt               ,
--                                      IdtClt              , IdtCptClt            ,
--                                      IdtTypOpr           , Rfr                  ,
--                                      CLERIB              , NUMCPTBNC            ,
--                                      IdtBnq              , IdtGch               ,
--                                      NomTrr              , NumChq               ,
--                                      IDTCNG              , IDTLGNCSSCNG         ,
--                                      REFADDCNG           , DATMAJ               ,
--                                      REFADDLGNCSSCNG)
--                  VALUES (            5                   , vLgnCss             ,
--                                      cCng.IDTAGT         , pIdtCss             ,
--                                      cLgnCng.IDTMODRGL   , cCng.IDTDVS         ,
--                                      vMntPmt             , cLgnCng.MNTPMT,
--                                      vMntPmt             , NULL                ,
--                                      0                   , cLgnCng.datrgl      ,
--                                      cLgnCng.IDTCLT      , cLgnCng.IDTCPTCLT   ,
--                                     2                   , NULL                ,
--                                      cLgnCng.CLERIB      , cLgnCng.NUMCPTBNC   ,
--                                      cLgnCng.IDTBNQ      , cLgnCng.IDTGCH      ,
--                                      cLgnCng.NOMTRR      , cLgnCng.NUMCHQ      ,
--                                      pIdtCng             , cLgnCng.IDTLGNCSSCNG,
--                                      cCng.REFADDCNG      , TRUNC(SYSDATE)      ,
--                                      cLgnCng.REFADDLGNCSSCNG);
--                END IF; --vMntPmt > 0
--              END;
            END IF; --nvl(cLgnCng.MNTPMT,0) <> 0
          END IF; --vModaffpmt = 1
          -- Mise à jour du compte client
          vOprRfr := null;
          vMsgOpr := null;
          if vTotPmtxLgn > 0 then
            if (vSwUneLgnxClt = 1 and cLgnCng.NbrLgnxClt = cLgnCng.LgnxClt) or (vSwUneLgnxClt = 0) then
----            IF cLgnCng.MntPmt > 0 THEN  --pourquoi cette condition ?
              CltBtc01.X7_crtopr(pIdtTypOpr => 2,
                                 pIdtAgt => cCng.IDTAGT, --SJ 02 mars 2015 traitement de la fiche 12439
                                 pRfr => vOprRfr,
                                 pIdtLgnCss => vLgncss,
                                 pMsg => vMsgOpr);
              if vMsgOpr is not null then
                rollback;
                Err_Msg := 'Consignement ===> ' || pIdtCss || ' - ' || pIdtCng ||
                 ' Line ===> ' || cLgnCng.IdtLgnCssCng;
                Raise_Application_Error(-20101, vMsgOpr);
              end if;


              -- ancienne version
--              CltBtc01.MajCpt (cLgnCng.IDTCLT     , cLgnCng.IDTCPTCLT,
--                               2                  , TO_CHAR(vLgnCss) ,
--                               NULL               , NULL             ,
--                               cLgnCng.MNTPMT     , cLgnCng.DatRgl   ,
--                               cLgnCng.DatRgl     , cLgnCng.DatRgl   ,
--                               cLgnCng.DatRgl     , cCng.IDTAGT      ,
--                               vLgnCss            , NULL             ,
--                               NULL               , NULL             ,
--                               NULL               , NULL      );
            end if; --(vSwUneLgnxClt = 1 and cLgnCng.NbrLgnxClt = cLgnCng.LgnxClt) or (vSwUneLgnxClt = 0)
          END IF; --vTotPmtxLgn > 0
        END IF; --cLgnCng.Pmt = 1
        CSSCNG01_SPC.TRTLGNCSSCNG(rCngLgnCss);
      END LOOP; --cursor cLgnWork
    END;
    -- Pour chaque ligne de paiement du lot
--    DECLARE
--      cursor cTtxWork is
--        SELECT TTLENCMODRGL, IDTMODRGL,CNGENT.DATRGL
--          FROM CNGTTX, CNGENT
--          WHERE CNGENT.IDTCSS = pIdtCss
--            AND CNGENT.IDTCNG = pIdtCng
--            AND CNGTTX.IDTCSS = CNGENT.IDTCSS
--            AND CNGTTX.IDTCNG = CNGENT.IDTCNG;
--    BEGIN
--      for cCngTtx in cTtxWork loop
        -- Transfert de fonds en banque pour un montant égal au total de la consignation
--        INSERT INTO LGNCSS (IdtTypMvm           , IdtLgnCss            ,
--                            IdtAgt              , IdtCss               ,
--                            IdtModRgl           , IdtDvs               ,
--                            MntDvs              , DatCrt)
--        VALUES (            8                   ,   SEQ_LGNCSS.NEXTVAL  ,
--                            cCng.IDTAGT         , pIdtCss             ,
--                            cCngTtx.IDTMODRGL   , cCng.IDTDVS         ,
--                            (cCngTtx.TTLENCMODRGL * -1)  ,  cCngTtx.DatRgl);
--      end loop; --cursor cTtxWork
--    END;
    -- La date d'intégration est renseignée à la date du jour et Situation
    -- de consignation à 2 (intégré) si au moins un reglement est integre
    if vNbrPmtInt > 0 then
      UPDATE CNGENT
        SET DATINT = TRUNC(vSss_Datjou),
            SITCNG = 2
        WHERE ROWID = cCng.ROWID;
    end if;
  END LOOP; --cursor cWork
  TrtMsg01.DeleteItem(Err_TableName);
END Integration;
-- *********************************
-- Contrôle et integration d'une consignation
-- *********************************
PROCEDURE TRTCNG
   (pMode    NUMBER,
    pIdtCss  CNGENT.IdtCss%TYPE,
    pIdtCng  CNGENT.IdtCng%TYPE)
--
--  pMode 1 ==> Controle uniquement
--  Pmode 2 ==> Controle et integration
--
IS
BEGIN
TrtMsg01.InsertItem(Err_TableName,'TRTCNG');
   -- Purge des éventuelles anomalies de la consignation
   PURGE(pIdtCss, pIdtCng);
   -- Recherche du mode d'affectation des paiements
   SELECT NVL(modaffpmt,1)
   INTO vModaffpmt
   FROM PRMGNR;
   -- Contrôle des lignes consignations
   vCptAno := 0;
   vExistFct := 1;
   Err_Msg := 'Consignacion ===> ' || pIdtCss || ' - ' || pIdtCng;
   Controles (pIdtCss, pIdtCng);
--   DBMS_OUTPUT.PUT_LINE('vCptAno := ' || vCptAno);
   IF vCptAno = 0 THEN
     -- Pas d'anomalies dans la consignation
     MajCngValid (pIdtCss, pIdtCng);
     IF pMode = 2 THEN
       -- Intégration de la consignation
       integration (pIdtCss, pIdtCng);
     END IF;
   ELSE
     -- Anomalies dans la consignation
     MajCngNonValid (pIdtCss, pIdtCng);
     -- On force l'integration
     IF pMode = 2 THEN
       -- Intégration de la consignation
       integration (pIdtCss, pIdtCng);
     END IF;
   END IF;
TrtMsg01.DeleteItem(Err_TableName);
END TrtCng;
-- *********************************
-- Contrôle et integration de 1 consignation
-- *********************************
PROCEDURE TRT1CNG
   (pIdtAgt AGT.IdtAgt%TYPE)
--
--  pMode 1 ==> Controle uniquement
--  pMode 2 ==> Controle et integration
--
IS
vSitCng NUMBER;
CURSOR cTche
IS
SELECT TCHE.IDTTYPTCHE,
   TCHE.ROWID,
   TO_NUMBER(TCHE.PRM10) vMod,
   TCHE.PRM11 idtcss,
   TO_NUMBER(TCHE.PRM12) idtcng
  FROM TCHE
 WHERE TCHE.IDTTYPTCHE  = gvIdtTrt_Controle_Consignation
   AND TCHE.DATRLS  IS NULL
   AND TCHE.STT     IS NULL
   AND TCHE.MODDCL  = 'R'
   AND TCHE.idtAgt      = pIdtAgt
 ORDER BY TCHE.ROWID;
BEGIN
TrtMsg01.InsertItem(Err_TableName,'TRT1CNG');
FOR rTche IN cTche
 LOOP
   UPDATE TCHE
      SET stt = 'C'
    WHERE ROWID = rTche.ROWID;
   COMMIT;
   SELECT NVL(SitCng,0)
     INTO vSitCng
     FROM CNGENT
     WHERE IdtCss = rTche.IdtCss
      AND  IdtCng = rTche.IdtCng;
   IF vSitCng <> 2 THEN
     TRTCNG (rTche.vMod,rTche.IdtCss,rTche.IdtCng);
   END IF;
   UPDATE TCHE
      SET Stt    = 'F',
          DatRls = SYSDATE
    WHERE ROWID = rTche.ROWID;
   COMMIT;
 END LOOP;
TrtMsg01.DeleteItem(Err_TableName);
EXCEPTION
  WHEN OTHERS THEN
    ROLLBACK;
    TRTMSG01.MsgErr(Err_IdtPck,
                    Err_IdtTrt,
                    Err_Msg,
                    Err_IdtClt,
                    Err_IdtCtr,
                    Err_IdtCpr,
                    Err_NumCpr,
                    Err_IdtFac,
                    Err_NumFac,
                    Err_IdtOprDbt,
                    Err_IdtOprCrt,
                    Err_TableName);
END Trt1Cng;
----------------------------------------------------------------
-- *********************************
-- Contrôle et integration de lot de consignations (Toutes les consignations)
-- *********************************
PROCEDURE TRTLOTCNG
   (pMode   NUMBER)
--
--  pMode 1 ==> Controle uniquement
--  Pmode 2 ==> Controle et integration
--
IS
CURSOR cWork
IS
SELECT IDTCNG,
       IDTCSS
  FROM CNGENT
 WHERE NVL(SITCNG,0) <> '2'
 ORDER BY 1,2;
BEGIN
TrtMsg01.InsertItem(Err_TableName,'CONSIGNATION');
   --
   -- Appel Batch du controle et eventuellement de l'integration
   --
   -- Pour chaque lot de consignation à traiter
   FOR cCng IN cWork
   LOOP
        -- Contrôle des lignes consignations
        Err_Msg := 'Consignacion ===> ' || cCng.IdtCss || ' - ' || cCng.IdtCng;
        TRTCNG (pMode,cCng.IdtCss,cCng.IdtCng);
   END LOOP;
COMMIT;
TrtMsg01.DeleteItem(Err_TableName);
EXCEPTION
  WHEN OTHERS THEN
    ROLLBACK;
    TRTMSG01.MsgErr(Err_IdtPck,
                    Err_IdtTrt,
                    Err_Msg,
                    Err_IdtClt,
                    Err_IdtCtr,
                    Err_IdtCpr,
                    Err_NumCpr,
                    Err_IdtFac,
                    Err_NumFac,
                    Err_IdtOprDbt,
                    Err_IdtOprCrt,
                    Err_TableName);
END TrtLotCng;
----------------------------------------------------------------
FUNCTION CngEnt_NbrAno
(pIdtCss       CNGLGNCSS.IdtCss%TYPE,
 pIdtCng       CNGLGNCSS.IdtCng%TYPE)
RETURN NUMBER
IS
vNbrAno NUMBER;
BEGIN
SELECT COUNT(*)
  INTO vNbrAno
  FROM CNGANO
 WHERE IdtCss       = pIdtCss
   AND IdtCng       = pIdtCng;
RETURN vNbrAno;
END CngEnt_NbrAno;
--------------------------------------------------
FUNCTION cnglgncss_NbrAno
(pIdtCss       CNGLGNCSS.IdtCss%TYPE,
 pIdtCng       CNGLGNCSS.IdtCng%TYPE,
 pIdtLgnCssCng CNGLGNCSS.IdtLgnCssCng%TYPE)
RETURN NUMBER
IS
vNbrAno NUMBER;
BEGIN
SELECT COUNT(*)
  INTO vNbrAno
  FROM CNGANO
 WHERE IdtCss       = pIdtCss
   AND IdtCng       = pIdtCng
   AND IdtLgnCssCng = pIdtLgnCssCng;
RETURN vNbrAno;
END;
END CSSCNG01;

/
