CREATE OR REPLACE package body X7.CLTBTC01 is

--BPZ
/*
suppression de la sequence SEQ_LGNCSS
remplacee par X7_TRTSEQ01.X7_AttNumLgnCss

*/

--SJ - 17/03/2009
/*
 correction de la procedure ANLTRSEAU: au lieu de faire 'null;' on fait l'insertion de l'operation 41 et le lettrage sur l'op 40
*/

--LL - 11/04/2009
/*
 -- LL: La ligne 4875 ne peut pas fonctionner car dans ce cas vsqcOpr = null car on passe idtopr en paramètre de la fonction
*/

-- JLD - 16/04/2009 - ajout du paramètre pMnt

--SJ - 16/06/2009
/*
 correction de la procedure MAJOPRLTT - cas de retour d'impaye partiel
*/

--SJ - 27/07/2009
/*
 fiche 7559 - correction: references des operation de type 15,16
*/

--SJ - 27/11/2009
/*
 --fiche 7921 ajouter vMsg := 'Appel de la procedure specifique';
*/

--SJ 07 jan 2010 correction ici : fiche 7998 : annulation ech + ann imp  double solde fct pen ; cette modification est à revoir car les opr changement de sit ne doivent pas modifie les soldes des operations comme dans les vers avant dev nouveau compte client

--SJ 04 nov 2010 traitement de la fiche 8650 : recuperer les coord bancaires des factures qui sont liees à un contrat

--BPZ
/*
9467
mise à jour du retour d'impaye du client
*/

-----------------------------------------------------------------------------
-- Maj     : 11/11/2010
-- Par     : BPZ
-- Contenu : Nouvelle gstion des devis operation 71,72
-----------------------------------------------------------------------------
-----------------------------------------------------------------------------
-- Maj     : 14/10/2011
-- Par     : BPZ
-- Contenu : Transferts de règlement: information incomplète sur OPR
-- Mantis  : 7663
-----------------------------------------------------------------------------
-----------------------------------------------------------------------------
-- Maj     : 16/11/2012
-- Par     : BPZ
-- Contenu : Devis - annulation - erreur calcul de solde
-- Mantis  : 9656
-----------------------------------------------------------------------------
-----------------------------------------------------------------------------
-- Version : 70104.007
-- Maj     : 29/03/2012
-- Par     : FBE
-- Contenu : - Probleme de performance sur la reimpresion d'un tiquet de caisse.
--             Modification de la procedure DRNTCKCSSAGT pour ne pas utiliser la
--             fonction GetImpTck mais pour faire la requete directe
--           - Plantage du calcul de soldes sur certains postes clientes.
--             Le probleme est dans la procedure MajSldCptClt. Il est cause par
--             l'utilisation des dates dans les curseurs sans la fonction to_date
--             Correction: ajout de la fonction to_date aux curseurs
-- Mantis  : 10018, 10019
-----------------------------------------------------------------------------
-- Version : 70200.008
-- Maj     : 10/04/2012
-- Par     : SJ
-- Contenu : correction de la mise à jour du champs CLT.INTBNC (suite à une regression dû traitement de la fiche 4307 quand on transfert la maj du CLT lors de retour d'impaye de centura en Oracle mais partiel)
-- Mantis  : traitement de la fiche 9512
-----------------------------------------------------------------------------
-----------------------------------------------------------------------------
-- Version : 70200.009
-- Maj     : 19/04/2012
-- Par     : SJ
-- Contenu : renforcer les controles dans X7_crtopr et majoprltt pour s'assuerer que si il y a une erreur on la retourne
-- Mantis  : traitement des fiches 9919 et 9969
-----------------------------------------------------------------------------
-----------------------------------------------------------------------------
-- Version : 70200.010
-- Maj     : 20/06/2012
-- Par     : SJ
-- Contenu : ajouter une colone MTRAGT pour enregistre l'agent qui ann une mensualisation dans echpmt
-- Mantis  : trateienet de la fiche 10182
-----------------------------------------------------------------------------
-----------------------------------------------------------------------------
-- Version : 70300.012
-- Maj     : 17/08/2012
-- Par     : SJ
-- Contenu : modifier cltbtc01 pour alimenter une variable globale  vpDatCrt date := sysdate;  en majcpt qui sera utilisée en majoprltt pour datcrt
-- Mantis  : Fiche 10308 point 3
-----------------------------------------------------------------------------
-- Version : 70301.013
-- Maj     : 29/10/2012
-- Par     : SJ
-- Contenu : revenir en arrière sur la modification faite pour la fiche 10308;FBE: la solution du problème soumit par la Chine fiche 10308 point B sera alors la modification des sources spécifiques (ou devenus spécifique à un moment donné) comme les packages des pénalités et de consignations
-- Mantis  : Fiche 10511
-----------------------------------------------------------------------------
-- Version : 70302.014
-- Maj     : 30/11/2012
-- Par     : FBE
-- Contenu : Liberation de depot de garantie deja libere auparavant
--           Il s'agit d'un probleme de compatibilite ascendant avec le systeme anterieur de liberation.
--           Modification des procedures MAJCPT et SoldeDptGrn pour ajouter le test de existence de liberation de l'ancienne systeme
-- Mantis  : 10598
-----------------------------------------------------------------------------
-- Version : 70304.015
-- Maj     : 05/02/2013
-- Par     : SJ
-- Contenu : compatibilité CLTBTC01 - TRTFAC01 ne plus recalculer le mntcrtaff pour un avoir car nous avons fait la correction dans TRTFAC01 = enlever la modif faite pour traitement de la fiche 4138
-- Mantis  : 10748
-----------------------------------------------------------------------------
-- version : 70304.016
-- maj     : 21/02/2013
-- par     : lla
-- contenu : amélioration des performances de la procédure majcoordbncopr
-- mantis  : 10788
-----------------------------------------------------------------------------
-- version : 70600.018
-- maj     : 01/01/2014
-- par     : BPZ
-- contenu : Mise à jour des coordonné bancaire d'un contrat de fourniture
-- mantis  :
-----------------------------------------------------------------------------
-- Maj     : 08/07/2014
-- Par     : SJ
-- Contenu : Traitement de la fiche #11859 - évolutions pour SEPA
-- ==========================================================================
-----------------------------------------------------------------------------
-- version : new: 70608.22 
-- maj     : 07/08/2014
-- par     : SJ 
-- contenu : traitement de la fiche  #11948 - ajouter dans INSPRL les iban bic pour les encaissements "prélèvement"
-- mantis  :
-----------------------------------------------------------------------------
-- version : new: 70608.23
-- maj     : 07/08/2014
-- par     : SJ 
-- contenu : traitement de la fiche  #11952 - ajouter dans lgncss et opr les iban bic +  modif des procedures refbnc, MODRMBCPTCLT (correction par rapport au idtcltssc sans regarder prmgnr + retourner IBAN et BIC pour utilisation ultérieure)
-- mantis  :  #11952  - note du 11/08/2014
-----------------------------------------------------------------------------
-----------------------------------------------------------------------------
-- version : new: 70608.24
-- maj     : 20/08/2014
-- par     : BPZ
-- contenu : 11958: Gestion mandat changement nom, prénom, banque, numéro de compte. 
-- mantis  : 11958: Gestion mandat changement nom, prénom, banque, numéro de compte. 
-----------------------------------------------------------------------------


  -- Variables pour la gestion des erreurs
  err_Mnt          OPR.Mnt%TYPE;
  err_Rfr          OPR.Rfr%TYPE;
  err_LibTypOpr    TYPOPR.Lib%TYPE;
  err_IdtClt       CLT.IdtClt%TYPE;
  err_IdtCptClt    CPTCLT.IdtCptClt%TYPE;
  err_RfrAff       OPR.Rfr%TYPE;
  err_LibTypOprAff TYPOPR.Lib%TYPE;
  err_IdtAgt       AGT.IdtAgt%TYPE;
  err_IdtModImp    MODIMP.IdtModImp%TYPE;

  -- Mode de lettrage par defaut: 1: Manual, 2: Automatique
  gModeLettrage number := 1;


--Variables globales para el manejo de errores
--Se genera una excepci?n "when others" que llama al
--Procedimiento trtmsg01.msgerr.
--Los parametros de entrada son:
--
  Err_IdtPck    VARCHAR2(40) := 'CLTBTC01';
  Err_IdtTrt    VARCHAR2(40);
  Err_Msg       VARCHAR2(255):= NULL;
--  Err_IdtClt    CLT.IdtClt%TYPE  := NULL;
  Err_IdtCtr    CTR.IdtCtr%TYPE  := NULL;
  Err_IdtCpr    CPR.IdtCpr%TYPE  := NULL;
  Err_NumCpr    CPR.NumCpr%TYPE  := NULL;
  Err_IdtFac    FAC.IdtFac%TYPE  := NULL;
  Err_NumFac    FAC.NUMFCT%TYPE  := NULL;
  Err_IdtOprDbt OPR.IdtOpr%TYPE  := NULL;
  Err_IdtOprCrt OPR.IdtOpr%TYPE  := NULL;
  Err_TableName Trtmsg01.TableType := Trtmsg01.MakeTable;
  err_stack     LONG;
--------------------------------------------------------------------------------
--Constantes que almacenan los mensajes de la mensualizaci?n
--------------------------------------------------------------------------------
cCALCUL_ECHEANCIER       SYS_MSG.MSG_LIBELLE%TYPE := NULL;
cPAS_CALCUL_NBRECH       SYS_MSG.MSG_LIBELLE%TYPE := 'Calcul échéancier de mensualisation impossible. Nombre d''échéances inférieur au seuil minimum autorisé.';
cPAS_CALCUL_MNTECH       SYS_MSG.MSG_LIBELLE%TYPE := 'Calcul échéancier de mensualisation impossible. Montant échéance inféreure au seuil minimum autorisé.';
cPAS_CALCUL_SLDFAC       SYS_MSG.MSG_LIBELLE%TYPE := 'Calcul échéancier de régularisation impossible. La facture est déja soldée.';
cPAS_CALCUL_CTR_DANS_LOT SYS_MSG.MSG_LIBELLE%TYPE := 'Calcul échéancier de mensualisation impossible. Contrat en cours de facturation.';
cPAS_CALCUL_PERIOD       SYS_MSG.MSG_LIBELLE%TYPE := 'Calcul échéancier de mensualisation impossible. Date de prochaine facturation trop rapprochée ou antérieure a la date de début demandée.';
cPAS_CALCUL_MNSACT       SYS_MSG.MSG_LIBELLE%TYPE := 'Calcul échéancier de mensualisation impossible. Il existe déja un échéancier de mensualisation actif.';
cPAS_CALCUL_CTRNONMNS    SYS_MSG.MSG_LIBELLE%TYPE := 'Calcul échéancier de mensualisation impossible. Contrat non mensualisé.';
gvCurUpd       NUMBER;
gvIdtTypOpr_Rgl            CONSTANT TYPOPR.IdtTypOpr%TYPE := 2;
gvIdtTypOpr_Annulation_Rgl CONSTANT TYPOPR.IdtTypOpr%TYPE := 5;
gvIdtTypOpr_RetImp         CONSTANT TYPOPR.IdtTypOpr%TYPE := 9;
gvIdtTypOpr_Mensualisation CONSTANT TYPOPR.idttypopr%TYPE := 22;
gvIdtTypMvm_Rgl            CONSTANT TYPMVM.IdtTypMvm%TYPE := 5;
gvIdtTypMvm_Annulation_Rgl CONSTANT TYPMVM.IdtTypMvm%TYPE := 11;
gvIdtTrt_Validation_LotMns CONSTANT TYPTCHE.idttyptche%TYPE := 'TRT2038';

-----------------------------------------------------------------------------
-----------------------------------------------------------------------------
-----------------------------------------------------------------------------
-- A MODIFIER A CHAQUE MODIF DU PACKAGE!!!
FUNCTION VersionPkg
--        --------- Version du package utilise
  RETURN NUMBER
IS
BEGIN
  RETURN 71400.025;
END;
-----------------------------------------------------------------------------
-----------------------------------------------------------------------------
-----------------------------------------------------------------------------
FUNCTION DATCNVDVSJOU (pIdtDvs DVS.IdtDvs%TYPE)
RETURN DATE
IS
vDatCnv DATE;
BEGIN
  SELECT DatTauCnv
    INTO vDatCnv
    FROM DVS
    WHERE IdtDvs = pIdtDvs;
  RETURN vDatCnv;
END DATCNVDVSJOU;
-----------------------------------------------------------------------------
-----------------------------------------------------------------------------
-----------------------------------------------------------------------------
FUNCTION ModCmp
  RETURN NUMBER
IS
BEGIN
  RETURN 2;
END;
-----------------------------------------------------------------------------
-----------------------------------------------------------------------------
-----------------------------------------------------------------------------
PROCEDURE MajSldCptClt( pnTypeMaj IN NUMBER)
IS

	vNBCommit	number;

   cTypeMajSld_Relance CONSTANT NUMBER := 1;
   cTypeMajSld_Coupure CONSTANT NUMBER := 2;
   cTypeMajSld_Global  CONSTANT NUMBER := 3;
   nNbFctSldUtl NUMBER;
   nCount       NUMBER ;
   ReqUpdSld    VARCHAR2(2000):=NULL;
   vWhr         VARCHAR2(200)   := ' where cptclt.idtclt = :idtclt and cptclt.idtcptclt = :idtcptclt';
   CURSOR cFctSld IS
      SELECT FCTSLD, fctsldnbr, idtfctsld
          FROM FCTSLD
         WHERE utl = 1
         ORDER BY FCTSLD.idtfctsld ;
   CURSOR cRlc_Clt IS
      SELECT DISTINCT CPTCLT.idtclt,CPTCLT.idtcptclt
        FROM CPTCLT,RLC_CLT
       WHERE CPTCLT.idtclt = RLC_CLT.idtclt
        AND  NVL(CPTCLT.datmajsld,to_date('01-01-1900','DD-MM-YYYY')) < NVL(CPTCLT.datmajcptclt,NVL(CPTCLT.datmajsld,to_date('01-01-1900','DD-MM-YYYY')));
   CURSOR cCou_PntCpg IS
      SELECT DISTINCT CPTCLT.idtclt,CPTCLT.idtcptclt
        FROM CPTCLT,CTR,COU_PNTCPG
       WHERE CPTCLT.idtClt = CTR.idtCltDst
         AND CTR.IdtPntLvr = COU_PNTCPG.IdtPntLvr
         AND CTR.IdtPntCpg = COU_PNTCPG.IdtPntCpg
         AND NVL(CPTCLT.datmajsld,to_date('01-01-1900','DD-MM-YYYY')) < NVL(CPTCLT.datmajcptclt,NVL(CPTCLT.datmajsld,to_date('01-01-1900','DD-MM-YYYY')));
-- HNG 16/12/2002 - Fiche 1338
  CURSOR cCptClt IS
      SELECT DISTINCT CPTCLT.idtclt,CPTCLT.idtcptclt
        FROM CPTCLT,OPR
       WHERE CPTCLT.idtclt      =  OPR.idtclt
         AND CPTCLT.idtcptclt   =  OPR.idtcptclt
         AND TRUNC(OPR.datexg) <  TRUNC(SYSDATE)
         AND TRUNC(OPR.datexg) >=  TRUNC(NVL(CPTCLT.datmajsld,to_date('01-01-1900','DD-MM-YYYY')))
         AND OPR.sld           <>  0
      UNION
      SELECT CPTCLT.idtclt,CPTCLT.idtcptclt
        FROM CPTCLT
       WHERE CPTCLT.datmajsld < CPTCLT.datmajcptclt
          OR CPTCLT.datmajsld IS NULL
          OR CPTCLT.datmajsld < (SELECT MAX(datcngutl) FROM FCTSLD WHERE utl=1)
--SJ modif - fiche 2059
;
-- End HNG
--          or cptclt.datmajcptclt is null;
BEGIN
        /*----------------------------------------------------
        - construction de la clause UPDATE
        ----------------------------------------------------
        - seuls les soldes 'utilises' sont calcules
        ----------------------------------------------------*/
        nCount := 0;
        ReqUpdSld := 'update cptclt set DatMajSld = sysdate, ';
        SELECT COUNT(*) INTO nNbFctSldUtl FROM FCTSLD WHERE utl = 1 ;
             FOR rFctSld IN cFctSld LOOP
                        nCount := nCount +1 ;
                        IF rFctSld.idtfctsld = 10 THEN
                                ReqUpdSld := ReqUpdSld ||'SLD10 ='||rFctSld.FCTSLD
                                 ||'( cptclt.IdtClt, cptclt.IdtCptClt ), SLD10NBR ='||rFctSld.fctsldnbr
                                 ||'( cptclt.IdtClt, cptclt.IdtCptClt )';
                        ELSE
                                ReqUpdSld := ReqUpdSld
                                     || 'SLD0'
                                     || rFctSld.idtfctsld
                                     || ' = '
                                     || rFctSld.FCTSLD
                                             || '( cptclt.IdtClt, cptclt.IdtCptClt ),  SLD0'||rFctSld.idtfctsld
                                     || 'NBR ='
                                     || rFctSld.fctsldnbr
                                             || '( cptclt.IdtClt, cptclt.IdtCptClt ) ';
                        END IF;
                        IF nCount < nNbFctSldUtl THEN
                                ReqUpdSld := ReqUpdSld ||',';
                        END IF ;
      END LOOP;
      
    ReqUpdSld := ReqUpdSld || vWhr;
    /*----------------------------------------------------------------
    - Parse de l'ordre SQL construit precedemment
    ----------------------------------------------------------------*/
    gvCurUpd := dbms_sql.open_cursor;
    dbms_sql.parse ( gvCurUpd, ReqUpdSld, dbms_sql.native);
    /*----------------------------------------------------------------
    - Seuls les comptes clients propose pour relance sont consideres
    ----------------------------------------------------------------*/
    vNBCommit   := 0;
    IF pnTypeMaj = cTypeMajSld_Relance THEN
        FOR rRlc_Clt IN cRlc_Clt
        LOOP
            Cltbtc01.maj1sldcptclt(rRlc_Clt.idtclt,rRlc_Clt.idtCptClt);
            vNBCommit   := vNBCommit + 1;
            IF vNBCommit > 1000 THEN
                COMMIT;
                vNBCommit := 0;
                --DBMS_OUTPUT.PUT_LINE('commit');
            END IF;
        END LOOP;
    ELSIF
        /*----------------------------------------------------------------
        - Seuls les comptes clients propose pour coupure sont consideres
        ----------------------------------------------------------------*/
        pnTypeMaj = cTypeMajSld_Coupure THEN
        FOR rCou_Pntcpg IN cCou_Pntcpg
        LOOP
            Cltbtc01.maj1sldcptclt(rCou_Pntcpg.idtclt,rCou_Pntcpg.idtCptclt);
            vNBCommit   := vNBCommit + 1;
            IF vNBCommit > 1000 THEN
                COMMIT;
                vNBCommit := 0;
                --DBMS_OUTPUT.PUT_LINE('commit');
            END IF;
        END LOOP;
    ELSIF
        /*----------------------------------------------------------------
        - Tous les comptes clients sont consideres
        ----------------------------------------------------------------*/
        pnTypeMaj = cTypeMajSld_Global THEN
        FOR rCptClt IN cCptClt
        LOOP
            Cltbtc01.maj1sldcptclt(rCptClt.IdtClt,rCptClt.IdtCptClt);
            vNBCommit   := vNBCommit + 1;
            IF vNBCommit > 1000 THEN
                COMMIT;
                vNBCommit := 0;
                --DBMS_OUTPUT.PUT_LINE('commit');
            END IF;
        END LOOP;
    END IF;
    dbms_sql.close_cursor (gvCurUpd);
    COMMIT;
END MajSldCptClt;
-----------------------------------------------------------------------------
-----------------------------------------------------------------------------
-----------------------------------------------------------------------------
PROCEDURE Maj1SldCptClt( pIdtClt    IN VARCHAR2,
                         pIdtCptClt IN NUMBER)
IS
retUpd       NUMBER;
BEGIN
dbms_sql.bind_variable(gvCurUpd, 'IdtClt',   pIdtClt);
dbms_sql.bind_variable(gvCurUpd, 'IdtCptClt',pIdtCptClt);
retUpd := dbms_sql.EXECUTE(gvCurUpd);
END Maj1SldCptClt;
-----------------------------------------------------------------------------
-----------------------------------------------------------------------------
-----------------------------------------------------------------------------
FUNCTION X7_TckAnl (pIdtLgnCss LGNCSS.IdtLgnCss%TYPE)
   RETURN NUMBER
IS
vIdtTypMvm TYPMVM.IdtTypMvm%TYPE;
vRfr       OPR.Rfr%TYPE := NULL;
BEGIN
SELECT MIN(IdtTypMvm)
  INTO vIdtTypMvm
  FROM LGNCSS
 WHERE LGNCSS.IdtLgnCss = pIdtLgnCss
   AND IdtTypMvm  IN (gvIdtTypMvm_Rgl ,gvIdtTypMvm_Annulation_Rgl);
IF vIdtTypMvm = gvIdtTypMvm_Rgl
THEN SELECT OprDbt.Rfr
       INTO vRfr
       FROM OPR OprDbt, LTT, OPR OprCrt
      WHERE OprDbt.IdtOpr    = LTT.IdtOprDbt
        AND OprDbt.IdtTypOpr = gvIdtTypOpr_Annulation_Rgl
        AND LTT.IdtOprCrt    = OprCrt.IdtOpr
        AND OprCrt.IdtTypOpr = gvIdtTypOpr_Rgl
        AND OprCrt.Rfr       = TO_CHAR(pIdtLgnCss);
ELSE SELECT OprCrt.Rfr
       INTO vRfr
       FROM OPR OprCrt, LTT, OPR OprDbt
      WHERE OprCrt.IdtOpr    = LTT.IdtOprCrt
        AND OprCrt.IdtTypOpr = gvIdtTypOpr_Rgl
        AND LTT.IdtOprDbt    = OprDbt.IdtOpr
        AND OprDbt.IdtTypOpr = gvIdtTypOpr_Annulation_Rgl
        AND OprDbt.Rfr       = TO_CHAR(pIdtLgnCss);
END IF;
RETURN TO_NUMBER(vRfr);
EXCEPTION
WHEN OTHERS
  THEN RETURN NULL;
END X7_TckAnl;
-----------------------------------------------------------------------------
-----------------------------------------------------------------------------
-----------------------------------------------------------------------------
FUNCTION IDTCLTANCRFR (pAncRfr CLT.ANCRFR%TYPE)
   RETURN CLT.IDTCLT%TYPE
IS
vIdtclt CLT.IDTCLT%TYPE;
BEGIN
  SELECT IdtClt
    INTO vIdtclt
    FROM CLT
  WHERE CLT.ANCRFR=pAncRfr;
  RETURN vIdtclt;
EXCEPTION
WHEN OTHERS
THEN RETURN NULL;
END IDTCLTANCRFR;
-----------------------------------------------------------------------------
-----------------------------------------------------------------------------
-----------------------------------------------------------------------------
PROCEDURE MAJLTT (pIdtOprDr OPR.IdtOpr%TYPE,
                  pIdtOprCr OPR.IdtOpr%TYPE,
                  pMnt NUMBER,
                  pDatLtt DATE) IS
BEGIN
   /*-----------------------------------------
   - Mise a jour de la ligne de lettrage
   -----------------------------------------*/
  UPDATE LTT
    SET DatLtt    = NVL(pDatLtt,DatLtt),
        Mnt       = pMnt
    WHERE IdtOprDbt = pIdtOprDr
     AND  IdtOprCrt = pIdtOprCr;
END MAJLTT;
-----------------------------------------------------------------------------
-----------------------------------------------------------------------------
-----------------------------------------------------------------------------
PROCEDURE MAJOPR (pIdtOpr  OPR.IdtOpr%TYPE,
                   pMnt    OPR.Mnt%TYPE,
                   pSld    OPR.Sld%TYPE,
                   pDatCrt DATE,
                   pDatVlr DATE,
                   pDatExg DATE)
IS
BEGIN
  UPDATE OPR
    SET Mnt    = pMnt,
        Sld    = pSld,
        DatCrt = NVL(pDatCrt,DatCrt),
        DatVlr = NVL(pDatVlr,DatVlr),
        DatExg = NVL(pDatExg,DatExg)
  WHERE IdtOpr = pIdtOpr;
END MAJOPR;
-----------------------------------------------------------------------------
-----------------------------------------------------------------------------
-----------------------------------------------------------------------------
FUNCTION CtlCptBnq (pIdtBnq VARCHAR2,
                    pIdtGch VARCHAR2,
                    pNumCptBnc VARCHAR2,
                    pCleRib VARCHAR2,
                   pIBAN    CTR.IBAN%type,
                   pBIC    CTR.BIC%type
                    )
RETURN NUMBER
IS
------------------------------------------------------------------------------
--Constante para el divisor
------------------------------------------------------------------------------
  cDiv    NUMBER(2) := 97;
------------------------------------------------------------------------------
--Largo de la cadena de caracteres v?lido (Utilizado para reccorrer caracter
--a caracter la cadena)
------------------------------------------------------------------------------
  cLenStr NUMBER(2) := 23;
------------------------------------------------------------------------------
--Variable que almacena la concatenaci?n de los par?metros de entrada
------------------------------------------------------------------------------
  vStr VARCHAR2(50);
------------------------------------------------------------------------------
--Variable que almacena el n?mero de cuenta bancaria con la conversi?n de
--caracteres alfabeticos a su correspondiente valor
------------------------------------------------------------------------------
  vNumCptBnc CPTCLT.NumCptBnc%TYPE;

  sRetFctCtl VARCHAR2(254);
BEGIN
------------------------------------------------------------------------------
--Control del largo de cada uno de los par?metros de entrada
--Si la longitud de alguno de los par?metros es mayor al permitido,
--retorna informaci?n inv?lida
------------------------------------------------------------------------------
  IF  LENGTH(LTRIM(pIdtBnq,'0'))    >  5
   OR LENGTH(LTRIM(pIdtGch,'0'))    >  5
   OR LENGTH(LTRIM(pNumCptBnc,'0')) > 11
   OR LENGTH(LTRIM(pCleRib,'0'))    >  2  THEN
    RETURN 0;
  END IF;

--  sRetFctCtl := NULL;
--  X7.FCTCTLIBAN_SPC(pIBAN, sRetFctCtl);
--  if sRetFctCtl is not null then
--    return 0;
--  end if;
--
--  sRetFctCtl := NULL;
--  X7.FCTCTLBIC_SPC(pBIC, sRetFctCtl);
--  if sRetFctCtl is not null then
--    return 0;
--  end if;

------------------------------------------------------------------------------
--Eliminaci?n de caracteres invalidos y conversion de
--caracteres alfabeticos a su correspondiente valor numerico
------------------------------------------------------------------------------
  vNumCptBnc := TRANSLATE(UPPER(pNumCptBnc),
                   'ABCDEFGHIJKLMNOPQRSTUVWXYZ-,.@ \:;^_#''|!"$%&/()=??*<>{[}]',
                   '12345678912345678923456789********************************');
------------------------------------------------------------------------------
--Concatenaci?n de los par?metros de entrada. Se completa con ceros a la
--izquierda a la longitud de cada par?metro de entrada
------------------------------------------------------------------------------
  vStr := LPAD(pIdtBnq,5,'0') || LPAD(pIdtGch,5,'0') ||
          LPAD(vNumCptBnc,11,'0') || LPAD(pCleRib,2,'0');
------------------------------------------------------------------------------
--Control de la cadena : 1 ==> la informaci?n es valida
--                       0 ==> la informaci?n es invalida
------------------------------------------------------------------------------
  IF MOD(TO_NUMBER(vStr),cDiv) = 0 AND INSTR(vNumCptBnc,'*')=0 THEN
    RETURN 1;
  ELSE
    RETURN 0;
  END IF;
-- si les caractères speciaux sont sont dans la chaine to_number peux retourne err
EXCEPTION WHEN VALUE_ERROR OR INVALID_NUMBER THEN
  RETURN 0;
END CTLCPTBNQ;
-----------------------------------------------------------------------------
-----------------------------------------------------------------------------
-----------------------------------------------------------------------------
FUNCTION AFFAUTCRT
  RETURN NUMBER IS
vReturn NUMBER;
BEGIN
  SELECT NVL(LTTAUT,0)
    INTO vReturn
    FROM PRMGNR;
  RETURN vReturn;
END AFFAUTCRT;
-- Funci?n RMBAUTCRT
--           Sin par?metros.
--           Retorna   : 0 --> Remboursement automatique des credits non affectes non autorise
--                       1 --> Remboursement automatique des credits non affectes autorise
--
-----------------------------------------------------------------------------
-----------------------------------------------------------------------------
-----------------------------------------------------------------------------
FUNCTION RMBAUTCRT
  RETURN NUMBER IS
vReturn NUMBER;
BEGIN
  SELECT NVL(RMBAUT,0)
    INTO vReturn
    FROM PRMGNR;
  RETURN vReturn;
END RMBAUTCRT;
-----------------------------------------------------------------------------
-----------------------------------------------------------------------------
-----------------------------------------------------------------------------
PROCEDURE SVNPRDFAC(pIdtCtr        IN  CTR.IdtCtr%TYPE,
                    pIdtPrdFac     OUT CTRFAC.IdtPrdFac%TYPE,
                    pDebSvnPrdFct  OUT DATE,
                    pFinSvnPrdFct  OUT DATE)
IS
vIdtCycFac CYCFAC.IdtCycFac%TYPE;
rPrdFac    PRDFAC%ROWTYPE;
vDebCycFac DATE;
vnxtprdfac VARCHAR2(6);
vFinDrnPrdFct DATE;
vnbrprd NUMBER;
BEGIN
  SELECT TRUNC(FinDrnPrdFct + 1), FinDrnPrdFct
    INTO pDebSvnPrdFct, vFinDrnPrdFct
    FROM CTR
    WHERE IdtCtr = pIdtCtr;
  SELECT IdtCycFac
    INTO vIdtCycFac
    FROM AVTCTR_DERNIER_V1, FACTYP
    WHERE FACTYP.IdtFacTyp = AVTCTR_DERNIER_V1.IdtFacTyp
     AND  AVTCTR_DERNIER_V1.IdtCtr    = pIdtCtr;
  SELECT nbrprd
  INTO vNbrPrd
  FROM CYCFAC WHERE idtcycfac=vIdtcycfac;

   IF vNbrPrd!=1 THEN
       SELECT Trtfac01.nxtprdfac(vIdtCycFac,vFinDrnPrdFct,'F')
     INTO pFinSvnPrdFct
     FROM dual;
    ELSE
  SELECT *
  INTO rPrdFac
  FROM PRDFAC
  WHERE IdtCycFac = vIdtCycFac;

  pFinSvnPrdFct := TO_DATE(LPAD(rPRDFAC.PrmJou,2,'0') ||
                           LPAD(rPRDFAC.PrmMoi,2,'0') ||
                           TO_CHAR(pDebSvnPrdFct,'yyyy'), 'ddmmyyyy') - 1;
--  if pFinSvnPrdFct < pDebSvnPrdFct then
--    pFinSvnPrdFct := add_months(pFinSvnPrdFct,12);
--  end if;
  IF pFinSvnPrdFct < SYSDATE OR pFinSvnPrdFct < pDebSvnPrdFct THEN
    pFinSvnPrdFct := ADD_MONTHS(pFinSvnPrdFct,12);
  END IF;
  END IF;
    vDebCycFac := ADD_MONTHS(pFinSvnPrdFct,-12) + 1;
  pIdtPrdFac := TO_CHAR(vDebCycFac,'yyyy') || rPRDFAC.IdtPrdFac;

END SVNPRDFAC;
-----------------------------------------------------------------------------
-----------------------------------------------------------------------------
-----------------------------------------------------------------------------
PROCEDURE TRMECHMNS (pEchPmt ECHPMT.ECHPMT%TYPE,
                     pIdtStaMns STAMNS.IdtStaMns%TYPE,
                     pIdtAgt AGT.IdtAgt%TYPE,
                     pIdtOprOrg OPR.IdtOpr%TYPE)
IS
  cursor cOPR is
    select IdtOpr, IdtClt, IdtCptClt, IdtDvs, DatCnv
      from OPR
      where EchPmt = pEchPmt
       and  IdtTypOpr = 19;
-- Declaration des variables
  vIdtClt CLT.IdtClt%TYPE;
  vIdtCptClt CPTCLT.IdtCptClt%TYPE;
  vIdtOpr OPR.IdtOpr%TYPE;
  vIdtOprAff OPR.IdtOpr%TYPE;
--  vIdtOprOrg OPR.IdtOpr%TYPE;
  vRfr OPR.Rfr%TYPE;
  vDatCnv date;
  vIdtDvs DVS.IdtDvs%TYPE;
  vMsg varchar2(2000);
BEGIN
  open cOPR;
    fetch cOPR
      into vIdtOprAff, vIdtClt, vIdtCptClt, vIdtDvs, vDatCnv;
  close cOPR;
  MAJOPRLTT (pModImp=>23,
             pIdtAgt=>pIdtAgt,
             pIdtCltOrg=>vIdtClt,
             pIdtCptCltOrg=>vIdtCptClt,
             pRfr=>vRfr,
             pIdtTypOpr=>22,
             pIdtOpr=>vIdtOpr,
             pDatVlr=>sysdate,
             pDatExg=>sysdate,
             pIdtCltDst=>vIdtClt,
             pIdtCptCltDst=>vIdtCptClt,
             pIdtOprAff=>vIdtOprAff,
             pIdtOprOrg=>pIdtOprOrg,
             pIdtDvs=>vIdtDvs,
             pDatCnv=>vDatCnv,
             pMsg=>vMsg);
  if vMsg is not null then
    Raise_Application_Error(-20101, vMsg);
  end if;
  UPDATE ECHPMT
     SET IdtStaMns = pIdtStaMns,
         MtrAgt    = pIdtAgt, --replace Idtagt = pIdtAgt , traitement de la fiche 10182
         DatMaj    = SYSDATE,
         DatAnn    = DECODE(pIdtStaMns,4,SYSDATE,NULL)
   WHERE ECHPMT = pEchPmt;
END TRMECHMNS;
-----------------------------------------------------------------------------
-----------------------------------------------------------------------------
-----------------------------------------------------------------------------
PROCEDURE RMBCRT (pIdtClt    IN  CLT.IdtClt%TYPE,
                  pIdtCptClt IN  CPTCLT.IdtCptClt%TYPE,
                  pIdtOpr    IN  OPR.IdtOpr%TYPE,
                  pIdtTypOpr OUT TYPOPR.IdtTypOpr%TYPE)
  IS
--Curseur  des credits non affectes du client
-- On prend les credits pour lesquels le remboursement est autorise
CURSOR cOpr IS
  SELECT OPR.IdtClt,
         OPR.IdtCptClt,
         OPR.Rfr,
         OPR.IdtOpr,
         OPR.IdtTypOpr,
         OPR.Sld,
         OPR.IdtDvs,
         OPR.DatCnv
    FROM LTTAUT_VIEW, OPR, TYPOPR
    WHERE OPR.IdtTypOpr = TYPOPR.IdtTypOpr
     AND  LTTAUT_VIEW.IdtTypOprAff = OPR.IdtTypOpr
     AND  nvl(LTTAUT_VIEW.IdtNatRglAff,-1) = nvl(OPR.IdtNatRgl,-1)
     AND  LTTAUT_VIEW.IdtTypOpr    = 30
     AND  decode(gModeLettrage,1,LTTAUT_VIEW.Man,2,LTTAUT_VIEW.Atm) = 1
     AND  TYPOPR.DbtCrt = 'C'
     AND  OPR.IdtClt    = pIdtClt
     AND  OPR.IdtCptClt = pIdtCptClt
   --traitement fiche 4138 - remboursement tous les credits = mettre en comm la ligne suivante: and opr.idtopr=NVL(pIdtOpr,OPR.IdtOpr)
--     AND  OPR.IdtOpr    =   NVL(pIdtOpr,OPR.IdtOpr)  -- Si pIdtOpr est null, on traite toutes les operation, sinon on traite l'operation donnee
     AND  OPR.Sld < 0
    ORDER BY DatVlr;
--CURSOR cOpr IS
--  SELECT OPR.IdtClt,
--         OPR.IdtCptClt,
--         OPR.Rfr,
--         OPR.IdtOpr,
--         OPR.IdtTypOpr,
--         OPR.Sld,
--         OPR.IdtDvs,
--         OPR.DatCnv
--    FROM OPR, TYPOPR
--    WHERE OPR.IdtTypOpr = TYPOPR.IdtTypOpr
--     AND  TYPOPR.DbtCrt = 'C'
--     AND  OPR.IdtClt    = pIdtClt
--     AND  OPR.IdtCptClt = pIdtCptClt
--   --traitement fiche 4138 - remboursement tous les credits = mettre en comm la ligne suivante: and opr.idtopr=NVL(pIdtOpr,OPR.IdtOpr)
----     AND  OPR.IdtOpr    =   NVL(pIdtOpr,OPR.IdtOpr)  -- Si pIdtOpr est null, on traite toutes les operation, sinon on traite l'operation donnee
--     AND  Sld < 0
--    ORDER BY DatVlr;
rOPR cOPR%ROWTYPE;
vMntRmb OPR.Mnt%TYPE := 0;
vMntMinRmbCptClt OPR.Mnt%TYPE;
vIdtTypOpr TYPOPR.IdtTypOpr%TYPE;
vIdtAgt AGT.IDTAGT%TYPE;
vMntLtt LTT.Mnt%TYPE;
vRfr OPR.Rfr%TYPE;
vIdtOpr OPR.IdtOpr%TYPE;
vIdtModImp MODIMP.IdtModImp%TYPE;
vMsg varchar2(2000);
BEGIN
  IF RMBAUTCRT = 1 THEN
    -- Recherche du total a rembourser
    -- On utilise le meme cursor pour assurer une coherence des donnees
    FOR rR IN cOPR LOOP
      vMntRmb := vMntRmb + rR.Sld;
    END LOOP;
    -- Changement de sign du montant a rembourser
    vMntRmb := -vMntRmb;
    --
    -- recherche du montant minimum de remboursement
    --    = fonction du recouvrement type
    --
    SELECT MntMinRmbCptClt (pIdtClt, pIdtCptClt)
      INTO vMntMinRmbCptClt
      FROM dual;
     --
     -- choix du type d'operation à generer
     --   remboursement ou gain minime
     --
    IF vMntMinRmbCptClt IS NOT NULL THEN
      IF vMntRmb >= vMntMinRmbCptClt THEN
        -- Remboursement
        vIdtTypOpr := 30;
      ELSE
        -- Gain Minime
        vIdtTypOpr := 31;
      END IF;
    ELSE
      vIdtTypOpr := NULL;
    END IF;
    --
    -- TEST 'on rembourse (ou gain minime) oui ou non ?'
    --
    IF vIdtTypOpr IS NOT NULL THEN
      select IdtModImp
        into vIdtModImp
        from TYPOPR
        where IdtTypOpr = vIdtTypOpr;
    --
    -- BOUCLE sur les credit non affecte à rembourser
    --
      SELECT idtagt INTO vIdtAgt FROM AGT WHERE NOMCNX = USER;
      OPEN cOPR;
        LOOP
          FETCH cOPR INTO rOPR;
          EXIT WHEN cOPR%NOTFOUND;
          vIdtOpr := null;
          vRfr := null;
          --
          -- insertion de l'operation de remboursement ou de gain minime
          --   les credits non affectes sont lettres dans la procedure appelee.
          --
          MAJOPRLTT (pModImp=>vIdtModImp,
                     pIdtAgt=>vIdtAgt,
                     pIdtCltOrg=>rOPR.IdtClt,
                     pIdtCptCltOrg=>rOPR.IdtCptClt,
                     pRfr=>vRfr,
                     pIdtTypOpr=>vIdtTypOpr,
                     pIdtOpr=>vIdtOpr,
                     pMnt=>abs(rOPR.Sld),
                     pDatVlr=>sysdate,
                     pDatExg=>sysdate,
                     pDatCnv=>rOPR.DatCnv,
                     pIdtCltDst=>rOPR.IdtClt,
                     pIdtCptCltDst=>rOPR.IdtCptClt,
                     pIdtOprAff=>rOPR.IdtOpr,
                     pIdtOprOrg=>pIdtOpr,
                     pIdtDvs=>rOPR.IdtDvs,
                     pMsg=>vMsg);
          if vMsg is not null then
            Raise_Application_Error(-20101, vMsg);
          end if;
          -- S'il s'agit d'une gain minime, on fait le lettrage
          if vIdtTypOpr = 31 then
            MAJOPRLTT (pModImp=>8,
                       pIdtAgt=>vIdtAgt,
                       pIdtCltOrg=>rOPR.IdtClt,
                       pIdtCptCltOrg=>rOPR.IdtCptClt,
                       pRfr=>vRfr,
                       pIdtTypOpr=>vIdtTypOpr,
                       pIdtOpr=>vIdtOpr,
                       pMnt=>abs(rOPR.Sld),
                       pDatVlr=>sysdate,
                       pDatExg=>sysdate,
                       pDatCnv=>rOPR.DatCnv,
                       pIdtCltDst=>rOPR.IdtClt,
                       pIdtCptCltDst=>rOPR.IdtCptClt,
                       pIdtOprAff=>rOPR.IdtOpr,
                       pIdtOprOrg=>pIdtOpr,
                       pIdtDvs=>rOPR.IdtDvs,
                       pMsg=>vMsg);
            if vMsg is not null then
              Raise_Application_Error(-20101, vMsg);
            end if;
          end if;
        --
        -- FIN BOUCLE sur les credit non affecte à rembourser
        --
        END LOOP;
      CLOSE cOPR;
      --
      -- le type d'operation effectuee est retourne a l'appelant
      --
      pIdtTypOpr := vIdtTypOpr;
    --
    -- FIN TEST 'on rembourse (ou gain minime) oui ou non ?'
    --
  END IF;

 -- SJ 05/02/2013 traitement de la fiche #10748
 -- fiche 4138 - cas d'avoir, mntcrtaff mise à jour
 -- IF pIdtOpr IS NOT NULL  AND vIdtTypOpr =30 THEN
 --   UPDATE FAC SET mntcrtaff = NVL(mntcrtaff,0) - vMntRmb - mntht - mnttva
 --        WHERE NUMFCT=(SELECT rfr FROM OPR WHERE idtopr=pIdtOpr AND idttypopr=4);
 -- END IF;
 --end fiche 4138
 -- SJ 05/02/2013 traitement de la fiche #10748

  --
  -- FIN TEST Remboursement credits non affectes autorise
  --
  END IF;
  --
END RMBCRT;
-----------------------------------------------------------------------------
-----------------------------------------------------------------------------
-----------------------------------------------------------------------------
PROCEDURE CLCECH (pIdtCtr    IN     CTR.IdtCtr%TYPE,
                  pIdtFac    IN     FAC.IdtFac%TYPE,
                  pIdtTypTrt IN     NUMBER,
                  pDatPrmEch IN OUT DATE,
                  pNbrEch    OUT    ECHPMT.NbrEch%TYPE,
                  pMntTtl    OUT    ECHPMT.MntTtl%TYPE,
                  pMntPrmEch OUT    ECHPMT.MntTtl%TYPE,
                  pMntSvnEch OUT    ECHPMT.MntTtl%TYPE,
                  pMntDrnEch OUT    ECHPMT.MntTtl%TYPE,
                  pCodMsg    OUT    SYS_MSG.Msg_Libelle%TYPE)
IS
  vNbr       NUMBER;
  rRCVTYP    RCVTYP%ROWTYPE;
  vIdtRcvTyp RCVTYP.IdtRcvTyp%TYPE;
  vDlaCstMns PRMGNR.DlaCstMns%TYPE;
  vMntEchArr ECHPMT.MntTtl%TYPE;
  vMntEchMns ECHPMT.MntTtl%TYPE;
  vNbrEchMns ECHPMT.MntTtl%TYPE;
  vMntEch    ECHPMT.MntTtl%TYPE;
  vMinDatEch DATE;
  vMaxDatEch DATE;
  vLstDatEchRgl DATE;
  vMaxNbrEch ECHPMT.NbrEch%TYPE;
  vDebDrnPrdFct DATE;
  vFinDrnPrdFct DATE;
  vDebSvnPrdFct DATE;
  vFinSvnPrdFct DATE;
  vIdtCycFac    CYCFAC.IdtCycFac%TYPE;
  vIdtPrdFac    PRDFAC.IdtPrdFac%TYPE;
  vIdtLotFac LOTFAC.IdtLotFac%TYPE;
  vIdtClt    CLT.IdtClt%TYPE;
  vNbrPrdCycMns CYCFAC.NbrPrd%TYPE;
  vNbrPrdCycFac CYCFAC.NbrPrd%TYPE;
  vMntCrtAff FAC.MntCrtAff%TYPE;
  --vIdtCtr    CTR.IdtCtr%TYPE; -- HNG 09/07/2004 Fiche 3167
  vIdtModRcv RCVTYP.IdtModRcv%TYPE;
  vIdtDvs    DVS.IdtDvs%TYPE;
  CURSOR cFAC IS
    SELECT FAC.*, CTRFAC.IdtPrdFac
      FROM FAC, CTRFAC
      WHERE FAC.IdtFac    = CTRFAC.IdtFac
       AND  FAC.IdtTypFct = '1'
       AND  FAC.FctAnn    = 0
       AND  FAC.NUMFCT   <> '1'
       AND  CTRFAC.IdtCtr = pIdtCtr
    ORDER BY FAC.DatClc DESC;
  rFAC cFAC%ROWTYPE;
BEGIN
  SELECT DlaCstMns
  INTO vDlaCstMns
  FROM X7.PRMGNR;
  pCodMsg := NULL;
  ------------------------------------------------------------------------------
  ------------------------------------------------------------------------------
  --TRATAMIENTO DE MENSUALIZACION (1 = Interactivo, 3 = Batch)
  ------------------------------------------------------------------------------
  ------------------------------------------------------------------------------
  IF pIdtTypTrt IN (1,3) THEN
    ----------------------------------------------------------------------------
    --B?squeda de las informaciones del contrato
    ----------------------------------------------------------------------------
    -- HNG 11/05/2004 - Fiche 3007
    BEGIN
      SELECT DebDrnPrdFct,  FinDrnPrdFct,  IdtLotFac,  IdtRcvTyp,  IdtCltSsc
      INTO vDebDrnPrdFct, vFinDrnPrdFct, vIdtLotFac, vIdtRcvTyp, vIdtClt
      FROM CTR
      WHERE IdtCtr = pIdtCtr;
      EXCEPTION
        WHEN NO_DATA_FOUND THEN NULL;
    END;
    -- End HNG
    ----------------------------------------------------------------------------
    --No es posible calcular una mensualizaci?n, el contrato no est? mensualizado
    ----------------------------------------------------------------------------
    IF vIdtRcvTyp IS NULL THEN
      pCodMsg := cPAS_CALCUL_CTRNONMNS;
      GOTO End_ClcEch;
    END IF;
    SELECT IdtModRcv
    INTO vIdtModRcv
    FROM RCVTYP
    WHERE IdtRcvTyp = vIdtRcvTyp;
    IF vIdtModRcv <> 'MNS' THEN
      pCodMsg := cPAS_CALCUL_CTRNONMNS;
      GOTO End_ClcEch;
    END IF;
    ----------------------------------------------------------------------------
    --No es posible calcular una mensualizaci?n, contrato en curso de
    --facturaci?n
    ----------------------------------------------------------------------------
    IF vIdtLotFac IS NOT NULL AND pIdtTypTrt = 1 THEN
      pCodMsg := cPAS_CALCUL_CTR_DANS_LOT;
      GOTO End_ClcEch;
    END IF;
    ----------------------------------------------------------------------------
    --No es posible calcular una mensualizaci?n, existe una mensualizaci?n activa
    ----------------------------------------------------------------------------
    -- HNG 28/09/2004 - Fiche 3329
    SELECT COUNT(*)
    INTO vNbr
    FROM ECHPMT
    WHERE IdtClt = vIdtClt
    AND Idtctr   = pIdtCtr
    AND Typ = 'M'
    AND IdtStaMns IN (1,2);
    -- End HNG
    IF vNbr <> 0 THEN
      pCodMsg := cPAS_CALCUL_MNSACT;
      GOTO End_ClcEch;
    END IF;
    ----------------------------------------------------------------------------
    --B?squeda de las reglas de mensualizaci?n
    ----------------------------------------------------------------------------
    SELECT *
    INTO rRCVTYP
    FROM RCVTYP
    WHERE IdtRcvTyp = vIdtRcvTyp;
    ----------------------------------------------------------------------------
    --B?squeda del ciclo y n?mero de periodos del ciclo de facturaci?n
    --del contrato
    ----------------------------------------------------------------------------
    SELECT CYCFAC.IdtCycFac, CYCFAC.NbrPrd
    INTO vIdtCycFac, vNbrPrdCycFac
    FROM AVTCTR, FACTYP, CYCFAC
    WHERE CYCFAC.IdtCycFac = FACTYP.IdtCycFac
    AND  FACTYP.IdtFacTyp = AVTCTR.IdtFacTyp
    AND  AVTCTR.IdtCtr = pIdtCtr
    AND  AVTCTR.DatFin IS NULL;
    ----------------------------------------------------------------------------
    --B?squeda del n?mero de periodos del ciclo de mensualizaci?n
    ----------------------------------------------------------------------------
    SELECT NbrPrd
    INTO vNbrPrdCycMns
    FROM CYCFAC
    WHERE IdtCycFac = rRCVTYP.IdtCycFac;
    ----------------------------------------------------------------------------
    --B?squeda del las fechas del pr?ximo periodo de facturaci?n
    ----------------------------------------------------------------------------
    SvnPrdFac(pIdtCtr, vIdtPrdFac, vDebSvnPrdFct, vFinSvnPrdFct);
    ----------------------------------------------------------------------------
    --Si la fecha de fin del pr?ximo periodo de facturaci?n es menor que la
    --fecha del d?a se devuelve un error de c?lculo
    ----------------------------------------------------------------------------
    IF TRUNC(vFinSvnPrdFct) < TRUNC(SYSDATE) THEN
      pCodMsg := cPAS_CALCUL_PERIOD;
      GOTO End_ClcEch;
    END IF;
    ----------------------------------------------------------------------------
    --Periodos m?ximo de la mensualizaci?n
    ----------------------------------------------------------------------------
    vMaxNbrEch := 12/vNbrPrdCycMns - rRCVTYP.MoiRgl;
    OPEN cFAC;
    FETCH cFAC INTO rFAC;
    ----------------------------------------------------------------------------
    --Tratamiento si no se tiene hist?rico de facturaci?n
    ----------------------------------------------------------------------------
    IF cFAC%NOTFOUND THEN
      SELECT CPTCLT.IdtDvs
      INTO vIdtDvs
      FROM CPTCLT
      WHERE CPTCLT.IdtClt = vIdtClt
      AND  CPTCLT.IdtCptClt = 1;
      pMntTtl := rRCVTYP.MntMnsDft;
      --------------------------------------------------------------------------
      --Correcci?n del valor de la mensualizaci?n de acuerdo al pr?ximo
      --periodo de facturaci?n
      --------------------------------------------------------------------------
      pMntTtl := pMntTtl / (365 / vNbrPrdCycMns) *
        (TRUNC(vFinSvnPrdFct) - TRUNC(vFinDrnPrdFct));
      ----------------------------------------------------------------------------
      --Tratamiento si se tiene hist?rico de facturaci?n
      ----------------------------------------------------------------------------
    ELSE
      vIdtDvs := rFAC.IdtDvs;
      pMntTtl := rFAC.MntHt + rFAC.MntTva;
      --------------------------------------------------------------------------
      --Correcci?n del valor de la mensualizaci?n de acuerdo al pr?ximo
      --periodo de facturaci?n
      --------------------------------------------------------------------------
      pMntTtl := pMntTtl / (vFinDrnPrdFct - vDebDrnPrdFct + 1) *
                  (vFinSvnPrdFct - vFinDrnPrdFct);
    END IF;
    CLOSE cFAC;
    ----------------------------------------------------------------------------
    --Correcci?n del valor de la mensualizaci?n de acuerdo a las
    --reglas de mensualizaci?n
    ----------------------------------------------------------------------------
    pMntTtl := pMntTtl * rRCVTYP.Prc / 100;
    ----------------------------------------------------------------------------
    --FBE 03 05 01 : Se elimina el redondeo, se realiza un floor del valor
    ----------------------------------------------------------------------------
    pMntTtl := FLOOR(pMntTtl);
    ----------------------------------------------------------------------------
    --C?lculo de la m?nima fecha de la primera cuota
    ----------------------------------------------------------------------------
    vMinDatEch := TRUNC(SYSDATE) + vDlaCstMns;
    --
    -- PLS 29/10/2001 recherche de la dernière echeance de regularisation
    --
    SELECT MAX(datexg) + 1
    INTO vLstDatEchRgl
    FROM OPR
    WHERE idttypopr = 21
    AND sld > 0
    AND idtclt = vIdtClt;
    pDatPrmEch := TRUNC(NVL(pDatPrmEch,NVL(vLstDatEchRgl,SYSDATE)));
    ----------------------------------------------------------------------------
    --Si el d?a de inicio calculado es mayor al d?a de la tabla RCVTYP, se
    --toma el siguiente mes
    ----------------------------------------------------------------------------
    IF TO_NUMBER(TO_CHAR(vMinDatEch,'dd')) > rRCVTYP.JouPlv THEN
      vMinDatEch := ADD_MONTHS(vMinDatEch,1);
    END IF;
    ----------------------------------------------------------------------------
    --Se asigna el d?a de la tabla RCVTYP. Se trata el problema de si el d?a
    --de la tabla es mayor que el ?ltimo d?a del mes. En este caso, se asigna
    --el ?ltimo d?a del mes.
    ----------------------------------------------------------------------------
    vMinDatEch := TO_DATE(TO_CHAR(vMinDatEch,'yyyymm') ||
             LEAST(TO_CHAR(LAST_DAY(vMinDatEch),'dd'),LPAD(rRCVTYP.JouPlv,2,'0')),
             'yyyymmdd');
    ----------------------------------------------------------------------------
    --B?squeda de la m?nima fecha posterior a la fecha entrada por par?metro
    ----------------------------------------------------------------------------
    WHILE TRUNC(vMinDatEch) < TRUNC(pDatPrmEch) LOOP
      vMinDatEch := ADD_MONTHS(vMinDatEch,1);
    END LOOP;
    ----------------------------------------------------------------------------
    --JLD - 20/10/2010 - Recaler la première mensualite si elle tombe trop loin
    ----------------------------------------------------------------------------
    if vFinSvnPrdFct > add_months(sysdate,12/vNbrPrdCycMns)
    and vFinSvnPrdFct > add_months(vMinDatEch,12/vNbrPrdCycMns) then
        vFinSvnPrdFct := vFinDrnPrdFct;
        vDebDrnPrdFct := vDebDrnPrdFct;
    end if;

    ----------------------------------------------------------------------------
    --B?squeda de la m?xima fecha de la primer cuota
    ----------------------------------------------------------------------------
    vMaxDatEch := TRUNC(vFinSvnPrdFct);
    ----------------------------------------------------------------------------
    --Se asigna el d?a de la tabla RCVTYP. Se trata el problema de si el d?a
    --de la tabla es mayor que el ?ltimo d?a del mes. En este caso, se asigna
    --el ?ltimo d?a del mes.
    ----------------------------------------------------------------------------
    vMaxDatEch := TO_DATE(TO_CHAR(vMaxDatEch,'yyyymm') ||
             LEAST(TO_CHAR(LAST_DAY(vMaxDatEch),'dd'),LPAD(rRCVTYP.JouPlv,2,'0')),
             'yyyymmdd');
    ----------------------------------------------------------------------------
    --Si la fecha resultante es mayor que la fecha de fin del pr?ximo
    --periodo de facturaci?n, se resta un mes
    ----------------------------------------------------------------------------
    IF TRUNC(vMaxDatEch) > TRUNC(vFinSvnPrdFct) THEN
      vMaxDatEch := ADD_MONTHS(vMaxDatEch,-1);
    END IF;
    ----------------------------------------------------------------------------
    --C?lculo del n?mero de cuotas de la mensualizaci?n y la fecha de
    --la primera cuota.
    ----------------------------------------------------------------------------
    pNbrEch := 0;
    WHILE TRUNC(vMaxDatEch) >= TRUNC(vMinDatEch) AND pNbrEch < vMaxNbrEch LOOP
      pNbrEch := pNbrEch + 1;
      vMaxDatEch := ADD_MONTHS(vMaxDatEch,-1);
    END LOOP;
    pDatPrmEch := ADD_MONTHS(vMaxDatEch,1);
    ----------------------------------------------------------------------------
    --Si el n?mero de cuotas calculadas es igual a cero se devuelve el mensaje
    --que no existen meses para la mensualizaci?n
    ----------------------------------------------------------------------------
    IF pNbrEch = 0 THEN
      pCodMsg := cPAS_CALCUL_PERIOD;
      GOTO End_ClcEch;
    END IF;
    ----------------------------------------------------------------------------
    --C?lculo del valor de una cuota de mensualizaci?n. Si solamente se calcula
    --una cuota, no se realiza el redondeo de la cuota.
    --FBE 03 05 01 : Se elimina el redondeo, se realiza un floor
    ----------------------------------------------------------------------------
    IF pNbrEch > 1 THEN
      vMntEch := FLOOR(pMntTtl / pNbrEch);
    ELSE
      vMntEch := pMntTtl;
    END IF;
    ----------------------------------------------------------------------------
    --Si el n?mero de cuotas resultantes es menor que el n?mero de cuotas
    --m?nimas de las reglas de mensualizaci?n, se devuelve este mensaje
    ----------------------------------------------------------------------------
    IF pNbrEch < rRCVTYP.NbrMinEchMns THEN
      pCodMsg := cPAS_CALCUL_NBRECH;
      GOTO End_ClcEch;
    END IF;
    ----------------------------------------------------------------------------
    --Si el monto de una cuota es inferior al m?nimo seg?n las reglas
    --de mensualizaci?n, se devuelve este mensaje
    ----------------------------------------------------------------------------
    IF vMntEch < rRCVTYP.MntMinEchMns THEN
      pCodMsg := cPAS_CALCUL_MNTECH;
      GOTO End_ClcEch;
    END IF;
    ----------------------------------------------------------------------------
    --Si el convenio de regularizaci?n tiene m?s de una cuota, se calcula la
    --cuota de redondeo, de lo contrario la cuota de redondeo = 0
    ----------------------------------------------------------------------------
    IF pNbrEch > 1 THEN
      vMntEchArr := pMntTtl - (vMntEch * (pNbrEch - 1));
      --------------------------------------------------------------------------
      --Si la cuota de redondeo es menor al m?nimo permitido, se disminuye el
      --n?mero de cuotas y la cuota de redondeo es igual al valor de una cuota
      --m?s el valor de redondeo. La fecha de primera cuota ser?a el mes
      --siguiente
      --------------------------------------------------------------------------
      IF vMntEchArr < rRCVTYP.MntMinEchMns THEN
        pNbrEch := pNbrEch - 1;
        vMntEchArr := vMntEch + vMntEchArr;
        pDatPrmEch := ADD_MONTHS(pDatPrmEch,1);
        IF pNbrEch = 1 THEN
          vMntEch := vMntEchArr;
        END IF;
      END IF;
    ELSE
        vMntEchArr := 0;
    END IF;
    ----------------------------------------------------------------------------
    --Se eval?a si el redondeo se realiza sobre la primer cuota.
    --Se asignan los valores de la primera, siguiente y ?ltima cuota
    --dependiendo si el convenio de regularizaci?n tiene 1, 2 ? m?s de 2
    --cuotas
    ----------------------------------------------------------------------------
    IF rRCVTYP.EchArr = 'P' THEN
      IF pNbrEch = 1 THEN
        pMntPrmEch := vMntEch;
        pMntSvnEch := 0;
        pMntDrnEch := 0;
      ELSIF pNbrEch = 2 THEN
        pMntPrmEch := vMntEchArr;
        pMntSvnEch := vMntEch;
        pMntDrnEch := 0;
      ELSIF pNbrEch > 2 THEN
        pMntPrmEch := vMntEchArr;
        pMntSvnEch := vMntEch;
        pMntDrnEch := vMntEch;
      END IF;
      ----------------------------------------------------------------------------
      --Se eval?a si el redondeo se realiza sobre la ?ltima cuota.
      --Se asignan los valores de la primera, siguiente y ?ltima cuota
      --dependiendo si el convenio de regularizaci?n tiene 1, 2 ? m?s de 2
      --cuotas
      ----------------------------------------------------------------------------
    ELSIF rRCVTYP.EchArr = 'D' THEN
      IF pNbrEch = 1 THEN
        pMntPrmEch := vMntEch;
        pMntSvnEch := 0;
        pMntDrnEch := 0;
      ELSIF pNbrEch = 2 THEN
        pMntPrmEch := vMntEch;
        pMntSvnEch := vMntEchArr;
        pMntDrnEch := 0;
      ELSIF pNbrEch > 2 THEN
        pMntPrmEch := vMntEch;
        pMntSvnEch := vMntEch;
        pMntDrnEch := vMntEchArr;
      END IF;
    END IF;
    ------------------------------------------------------------------------------
    --Se devuelve el c?digo de mensaje de c?lculo del convenio posible
    ------------------------------------------------------------------------------
    pCodMsg := cCALCUL_ECHEANCIER;
    ------------------------------------------------------------------------------
    ------------------------------------------------------------------------------
    --TRATAMIENTO DE REGULARIZACION
    ------------------------------------------------------------------------------
    ------------------------------------------------------------------------------
  ELSIF pIdtTypTrt = 2 THEN
    ----------------------------------------------------------------------------
    --B?squeda del contrato de la factura
    ----------------------------------------------------------------------------
    -- HNG 04/05/2004 - Fiche 2950 , 3007 et 3167
    BEGIN
      IF pIdtCtr IS NULL THEN
        SELECT CTR.IdtRcvTyp
        INTO vIdtRcvTyp
        FROM CTRFAC, CTR
        WHERE CTR.IdtCtr = CTRFAC.IdtCtr
        AND  CTRFAC.IdtFac = pIdtFac
        AND ROWNUM = 1;
      ELSE
        SELECT CTR.IdtRcvTyp
        INTO vIdtRcvTyp
        FROM CTR
        WHERE CTR.IdtCtr = pIdtCtr;
      END IF;
        EXCEPTION
          WHEN NO_DATA_FOUND THEN NULL;
    END;
    -- End HNG
    ----------------------------------------------------------------------------
    --No es posible calcular una mensualizaci?n, el contrato no est? mensualizado
    ----------------------------------------------------------------------------
    IF vIdtRcvTyp IS NULL THEN
      pCodMsg := cPAS_CALCUL_CTRNONMNS;
      GOTO End_ClcEch;
    END IF;
    SELECT IdtModRcv
    INTO vIdtModRcv
    FROM RCVTYP
    WHERE IdtRcvTyp = vIdtRcvTyp;
    IF vIdtModRcv <> 'MNS' THEN
      pCodMsg := cPAS_CALCUL_CTRNONMNS;
      GOTO End_ClcEch;
    END IF;
    ----------------------------------------------------------------------------
    --B?squeda de las informaciones de la factura
    ----------------------------------------------------------------------------
    -- PLS 22/08/2002
    --select MntHt + MntTva - abs(MntCrtAff), abs(MntCrtAff),  Idtclt,  IdtDvs
    --  into pMntTtl,                         vMntCrtAff,      vIdtClt, vIdtDvs
    --  from FAC
    --  where IdtFac = pIdtFac;
    -- FBE 23/09/2005 PVCS 3927. Ajout du montant du depot garantie affecte sur la facture
    SELECT NVL(MntHt,0) + NVL(MntTva,0) - ABS(NVL(MntCrtAff,0)) - ABS(NVL(MntDptGrnAff,0)),
    ABS(NVL(MntCrtAff,0)),
    Idtclt,
    IdtDvs
    INTO pMntTtl,
    vMntCrtAff,
    vIdtClt,
    vIdtDvs
    FROM FAC
    WHERE IdtFac = pIdtFac;
    -- FIN PLS 22/08/2002
    ----------------------------------------------------------------------------
    --Existe saldo en la factura para regularizar
    ----------------------------------------------------------------------------
    IF pMntTtl <= 0 THEN
      pCodMsg    := cPAS_CALCUL_SLDFAC;
      GOTO End_ClcEch;
    END IF;
    ----------------------------------------------------------------------------
    --B?squeda de las reglas de mensualizaci?n
    ----------------------------------------------------------------------------
    SELECT *
    INTO rRCVTYP
    FROM RCVTYP
    WHERE IdtRcvTyp = vIdtRcvTyp;
    ----------------------------------------------------------------------------
    --B?squeda del n?mero de cuotas de mensualizaci?n
    ----------------------------------------------------------------------------
    SELECT 12/NbrPrd - rRCVTYP.MoiRgl
    INTO vNbrEchMns
    FROM CYCFAC
    WHERE IdtCycFac = rRCVTYP.IdtCycFac;
    ----------------------------------------------------------------------------
    --B?squeda del valor de una cuota de regularizaci?n
    ----FBE 03 05 01 : Se elimina el redondeo, se realiza un floor
    ----------------------------------------------------------------------------
    vMntEchMns := FLOOR(vMntCrtAff / vNbrEchMns);
    ----------------------------------------------------------------------------
    --El monto del saldo < que el n?mero de cuotas de regularizaci?n
    --por el valor de una cuota de mensualizaci?n
    ----------------------------------------------------------------------------
    IF pMntTtl < rRCVTYP.MoiRgl * vMntEchMns THEN
      pNbrEch := TRUNC(pMntTtl / vMntEchMns) + 1;
      vMntEch := LEAST(pMntTtl,vMntEchMns);
    ELSE
      pNbrEch := rRCVTYP.MoiRgl;
      --------------------------------------------------------------------------
      --Si se va a calcular m?s de una cuota de regularizaci?n
      --se realiza el redondeo. Si solamente se calcula una cuota
      --de regularizaci?n, no se realiza el redondeo
      --FBE 03 05 01 : Se elimina el redondeo, se realiza un floor
      --------------------------------------------------------------------------
      IF pNbrEch > 1 THEN
        vMntEch := FLOOR(pMntTtl / pNbrEch);
      ELSE
        vMntEch := pMntTtl;
      END IF;
    END IF;
    ----------------------------------------------------------------------------
    --Si el convenio de regularizaci?n tiene m?s de una cuota, se calcula la
    --cuota de redondeo, de lo contrario la cuota de redondeo = 0
    ----------------------------------------------------------------------------
    IF pNbrEch > 1 THEN
      vMntEchArr := pMntTtl - (vMntEch * (pNbrEch - 1));
      --------------------------------------------------------------------------
      --Si la cuota de redondeo es menor al m?nimo permitido, se disminuye el
      --n?mero de cuotas y la cuota de redondeo es igual al valor de una cuota
      --m?s el valor de redondeo.
      --------------------------------------------------------------------------
      IF vMntEchArr < rRCVTYP.MntMinEchMns THEN
        pNbrEch := pNbrEch - 1;
        vMntEchArr := vMntEch + vMntEchArr;
        IF pNbrEch = 1 THEN
          vMntEch := vMntEchArr;
        END IF;
      END IF;
    ELSE
      vMntEchArr := 0;
    END IF;
    ----------------------------------------------------------------------------
    --Se eval?a si el redondeo se realiza sobre la primer cuota.
    --Se asignan los valores de la primera, siguiente y ?ltima cuota
    --dependiendo si el convenio de regularizaci?n tiene 1, 2 ? m?s de 2
    --cuotas
    ----------------------------------------------------------------------------
    IF rRCVTYP.EchArr = 'P' THEN
      IF pNbrEch = 1 THEN
        pMntPrmEch := vMntEch;
        pMntSvnEch := 0;
        pMntDrnEch := 0;
      ELSIF pNbrEch = 2 THEN
        pMntPrmEch := vMntEchArr;
        pMntSvnEch := vMntEch;
        pMntDrnEch := 0;
      ELSIF pNbrEch > 2 THEN
        pMntPrmEch := vMntEchArr;
        pMntSvnEch := vMntEch;
        pMntDrnEch := vMntEch;
      END IF;
      ----------------------------------------------------------------------------
      --Se eval?a si el redondeo se realiza sobre la ?ltima cuota.
      --Se asignan los valores de la primera, siguiente y ?ltima cuota
      --dependiendo si el convenio de regularizaci?n tiene 1, 2 ? m?s de 2
      --cuotas
      ----------------------------------------------------------------------------
    ELSIF rRCVTYP.EchArr = 'D' THEN
      IF pNbrEch = 1 THEN
        pMntPrmEch := vMntEch;
        pMntSvnEch := 0;
        pMntDrnEch := 0;
      ELSIF pNbrEch = 2 THEN
        pMntPrmEch := vMntEch;
        pMntSvnEch := vMntEchArr;
        pMntDrnEch := 0;
      ELSIF pNbrEch > 2 THEN
        pMntPrmEch := vMntEch;
        pMntSvnEch := vMntEch;
        pMntDrnEch := vMntEchArr;
      END IF;
    END IF;
    ----------------------------------------------------------------------------
    --C?lculo de la m?nima fecha de la primera cuota
    ----------------------------------------------------------------------------
    vMinDatEch := TRUNC(SYSDATE) + vDlaCstMns;
    pDatPrmEch := TRUNC(NVL(pDatPrmEch,SYSDATE));
    ----------------------------------------------------------------------------
    --Si el d?a de inicio calculado es mayor al d?a de la tabla RCVTYP, se
    --toma el siguiente mes
    ----------------------------------------------------------------------------
    IF TO_NUMBER(TO_CHAR(vMinDatEch,'dd')) > rRCVTYP.JouPlv THEN
      vMinDatEch := ADD_MONTHS(vMinDatEch,1);
    END IF;
    ----------------------------------------------------------------------------
    --Se asigna el d?a de la tabla RCVTYP. Se trata el problema de si el d?a
    --de la tabla es mayor que el ?ltimo d?a del mes. En este caso, se asigna
    --el ?ltimo d?a del mes.
    ----------------------------------------------------------------------------
    vMinDatEch := TO_DATE(TO_CHAR(vMinDatEch,'yyyymm') ||
                LEAST(TO_CHAR(LAST_DAY(vMinDatEch),'dd'),LPAD(rRCVTYP.JouPlv,2,'0')),
                'yyyymmdd');
    ----------------------------------------------------------------------------
    --B?squeda de la m?nima fecha posterior a la fecha entrada por par?metro
    ----------------------------------------------------------------------------
    WHILE TRUNC(vMinDatEch) < TRUNC(pDatPrmEch) LOOP
      vMinDatEch := ADD_MONTHS(vMinDatEch,1);
    END LOOP;
    pDatPrmEch := vMinDatEch;
    ----------------------------------------------------------------------------
    --Se devuelve el c?digo de mensaje de c?lculo del convenio posible
    ----------------------------------------------------------------------------
    pCodMsg := cCALCUL_ECHEANCIER;
  END IF;
  <<End_ClcEch>>
  IF pCodMsg IS NOT NULL THEN
    pDatPrmEch := NULL;
    pNbrEch    := 0;
    pMntTtl    := 0;
    pMntPrmEch := 0;
    pMntSvnEch := 0;
    pMntDrnEch := 0;
  END IF;
END CLCECH;
-----------------------------------------------------------------------------
-----------------------------------------------------------------------------
-----------------------------------------------------------------------------
PROCEDURE CRTECH (pIdtFac    IN     FAC.IdtFac%TYPE,
                  pIdtCtr    IN     CLT.IdtCtr%TYPE,
                  pIdtTypTrt IN     NUMBER,
                  pIdtLotFac IN     LOTFAC.IdtLotFac%TYPE,
                  pIdtAgt    IN     AGT.IdtAgt%TYPE,
                  pEchPmt    OUT    ECHPMT.ECHPMT%TYPE,
                  pCodMsg    OUT    SYS_MSG.Msg_Libelle%TYPE)
IS
vIdtDvs    DVS.IdtDvs%TYPE;
vDatPrmEch DATE;
vNbrEch    ECHPMT.NbrEch%TYPE;
vMntTtl    ECHPMT.MntTtl%TYPE;
vMntPrmEch ECHPMT.MntTtl%TYPE;
vMntSvnEch ECHPMT.MntTtl%TYPE;
vMntDrnEch ECHPMT.MntTtl%TYPE;
vIdtRcvTyp RCVTYP.IdtRcvTyp%TYPE;
vTypEch    ECHPMT.Typ%TYPE;
vIdtOpr    OPR.IdtOpr%TYPE;
vIdtOprFac OPR.IdtOpr%TYPE;
vIdtOprOrg OPR.IdtOpr%TYPE;
vMntEch    ECHPMT.MntTtl%TYPE;
vIdtTypOpr TYPOPR.IdtTypOpr%TYPE;
vIdtTypOprEch TYPOPR.IdtTypOpr%TYPE;
vIdtClt CLT.IdtClt%TYPE;
vRfrDbt OPR.Rfr%TYPE;
vRfr    OPR.Rfr%TYPE;
vRfrEch OPR.Rfr%TYPE;
vDatExg DATE;
vPrfx   TYPOPR.Prfx%TYPE;
vIdtModImp MODIMP.IdtModImp%TYPE;
vCrcSpr PRMGNR.SprCdf%TYPE;
vIdtPrdFac CTRFAC.IdtPrdFac%TYPE;
vIdtPrdEch CTRFAC.IdtPrdFac%TYPE;
vDatFinPrd date;
vIdtCycFac CYCFAC.IdtCycFac%TYPE;
i NUMBER;
vDatCnv date;
vMsg varchar2(2000);
BEGIN
  SELECT SprCdf
    INTO vCrcSpr
    FROM PRMGNR;
  if pIdtFac is not null then
    select OPR.IdtOpr
      into vIdtOprFac
      from OPR, FAC
      where OPR.Rfr = FAC.NumFct
       and  OPR.IdtTypOpr in (1,4)
       and  FAC.IdtFac = pIdtFac;
  end if;
  vIdtOprOrg := vIdtOprFac;
  CLCECH (pIdtCtr,
          pIdtFac,
          pIdtTypTrt,
          vDatPrmEch,
          vNbrEch,
          vMntTtl,
          vMntPrmEch,
          vMntSvnEch,
          vMntDrnEch,
          pCodMsg);
  IF pCodMsg IS NULL AND vMntTtl > 0 THEN
    SELECT Seq_EchPmt.NEXTVAL
      INTO pEchPmt
      FROM dual;
    BEGIN
      select IdtPrdFac, IdtCycFac, DatFinPrd
        into vIdtPrdFac, vIdtCycFac, vDatFinPrd
        from CTRFAC
        where IdtFac = pIdtFac;
    EXCEPTION
      when NO_DATA_FOUND then
        vIdtPrdFac := null;
        vIdtCycFac := null;
        vDatFinPrd := null;
    END;

      IF pIdtTypTrt IN (1,3) THEN
        SELECT CLT.IdtClt,  CPTCLT.IdtDvs, IdtRcvTyp
          INTO vIdtClt,     vIdtDvs,       vIdtRcvTyp
          FROM CLT, CPTCLT, CTR
          WHERE CPTCLT.IdtClt = CLT.IdtClt
           AND  CPTCLT.IdtCptClt = 1
           AND  CLT.IdtClt = CTR.IdtCltSsc
           AND  CTR.IdtCtr = pIdtCtr;
        vTypEch := 'M';
        vIdtPrdEch := TRTFAC01.NxtPrdFac(vIdtCycFac,vDatFinPrd,'P');
      ELSIF pIdtTypTrt = 2 THEN
        SELECT IdtClt,  IdtDvs,  NUMFCT
          INTO vIdtClt, vIdtDvs, vRfrDbt
          FROM FAC
          WHERE IdtFac = pIdtFac;
        SELECT CTR.IdtRcvTyp
          INTO vIdtRcvTyp
          FROM CTR, CTRFAC
          WHERE CTR.IdtCtr    = CTRFAC.IdtCtr
           AND  CTRFAC.IdtFac = pIdtFac;
        vTypEch := 'R';
        vIdtPrdEch := vIdtPrdFac;
      END IF;
    -- HNG 09/07/2004 - Fiche 3167
      INSERT INTO ECHPMT (ECHPMT,
                          IDTPRD,
                          DATCRT,
                          DATPRMECH,
                          MNTPRMECH,
                          MNTECHSVN,
                          MNTTTL,
                          NBRECH,
                          IDTAGT,
                          IDTCLT,
                          IDTCPTCLT,
                          TYP,
                          DATMAJ,
                          IDTSTAMNS,
                          DATIMP,
                          MNTTTLINI,
                          IDTRCVTYP,
                          IDTLOTFAC,
                          IDTCTR,
                          IDTPRDFAC)
                  VALUES (pEchPmt,
                          1,
                          SYSDATE,
                          vDatPrmEch,
                          vMntPrmEch,
                          vMntSvnEch,
                          vMntTtl,
                          vNbrEch,
                          pIdtAgt,
                          vIdtClt,
                          1,
                          vTypEch,
                          SYSDATE,
                          1,
                          NULL,
                          vMntTtl,
                          vIdtRcvTyp,
                          pIdtLotFac,
                          pIdtCtr,
                          vIdtPrdEch);
    -- End HNG
    vDatCnv := DatCnvDvsJou(vIdtDvs);
    IF pIdtTypTrt IN (1,3) THEN
      -- FBE: 17/12/2007: Plus d'operation 17 et 18
      vIdtTypOprEch := 19;
    ELSIF pIdtTypTrt = 2 THEN
      vIdtTypOpr := 20;
      vIdtTypOprEch := 21;
      SELECT Prfx, IdtModImp
        INTO vPrfx, vIdtModImp
        FROM TYPOPR
        WHERE IdtTypOpr = vIdtTypOpr;
      IF vPrfx IS NOT NULL THEN
        vRfr := vPrfx || vCrcSpr || pEchPmt;
      ELSE
        vRfr := pEchPmt;
      END IF;
      -- Insertion de l'operation de regularisation
      MAJOPRLTT (pModImp=>vIdtModImp,
                 pIdtAgt=>pIdtAgt,
                 pIdtCltOrg=>vIdtClt,
                 pIdtCptCltOrg=>1,
                 pRfr=>vRfr,
                 pIdtTypOpr=>vIdtTypOpr,
                 pIdtOpr=>vIdtOpr,
                 pMnt=>-vMntTtl,
                 pDatVlr=>sysdate,
                 pDatExg=>sysdate,
                 pDatCnv=>vDatCnv,
                 pIdtCltDst=>vIdtClt,
                 pIdtCptCltDst=>1,
                 pIdtOprOrg=>vIdtOprOrg,
                 pIdtDvs=>vIdtDvs,
                 pMsg=>vMsg);
      if vMsg is not null then
        Raise_Application_Error(-20101, vMsg);
      end if;
      vIdtOprOrg := nvl(vIdtOprOrg,vIdtOpr);
      -- Lettrage des operations
      MAJOPRLTT (pModImp=>8,
                 pIdtAgt=>pIdtAgt,
                 pIdtCltOrg=>vIdtClt,
                 pIdtCptCltOrg=>1,
                 pRfr=>vRfr,
                 pIdtTypOpr=>vIdtTypOpr,
                 pIdtOpr=>vIdtOpr,
                 pMnt=>vMntTtl,
                 pDatVlr=>sysdate,
                 pDatExg=>sysdate,
                 pDatCnv=>vDatCnv,
                 pIdtCltDst=>vIdtClt,
                 pIdtCptCltDst=>1,
                 pIdtOprAff=>vIdtOprFac,
                 pIdtOprOrg=>vIdtOprFac,
                 pIdtDvs=>vIdtDvs,
                 pMsg=>vMsg);
      if vMsg is not null then
        Raise_Application_Error(-20101, vMsg);
      end if;
    END IF;
    SELECT Prfx, IdtModImp
      INTO vPrfx, vIdtModImp
      FROM TYPOPR
      WHERE IdtTypOpr = vIdtTypOprEch;
    IF vPrfx IS NOT NULL THEN
      vRfrEch := vPrfx || vCrcSpr || pEchPmt;
    ELSE
      vRfr := pEchPmt;
    END IF;
    vDatExg := vDatPrmEch;
    FOR i IN 1..vNbrEch LOOP
      IF i = 1 THEN
        vMntEch := vMntPrmEch;
      ELSIF i = 2 THEN
        vMntEch := vMntSvnEch;
      ELSIF i = vNbrEch THEN
        vMntEch := vMntDrnEch;
      ELSE
        vMntEch := vMntSvnEch;
      END IF;
      IF vMntEch > 0 THEN
        vRfr := vRfrEch || vCrcSpr || i;
        vIdtOpr := null;
        MAJOPRLTT (pModImp=>vIdtModImp,
                   pIdtAgt=>pIdtAgt,
                   pIdtCltOrg=>vIdtClt,
                   pIdtCptCltOrg=>1,
                   pRfr=>vRfr,
                   pIdtTypOpr=>vIdtTypOprEch,
                   pIdtOpr=>vIdtOpr,
                   pMnt=>vMntEch,
                   pDatVlr=>sysdate,
                   pDatExg=>vDatExg,
                   pDatCnv=>vDatCnv,
                   pIdtCltDst=>vIdtClt,
                   pIdtCptCltDst=>1,
                   pIdtOprOrg=>vIdtOprOrg,
                   pIdtDvs=>vIdtDvs,
                   pMsg=>vMsg);
        if vMsg is not null then
          Raise_Application_Error(-20101, vMsg);
        end if;
      END IF;
      vDatExg := ADD_MONTHS(vDatExg,1);
    END LOOP;
  END IF;
END CRTECH;
-----------------------------------------------------------------------------
-----------------------------------------------------------------------------
-----------------------------------------------------------------------------
PROCEDURE INSPRL
(pIdtClt    OPR.IdtClt%TYPE,
 pIdtCptClt OPR.IdtCptClt%TYPE,
 pRfr       OPR.Rfr%TYPE,
 pIdtBnq    OPR.IdtBnq%TYPE,
 pIdtGch    OPR.IdtBnq%TYPE,
 pNumCptBnc OPR.NumCptBnc%TYPE,
 pNomCptBnc OPR.NomCptBnc%TYPE,
 pIBAN      OPR.IBAN%type,
 pBIC       OPR.BIC%type,
 pDatPrl    DATE,
 pMntPrl    OPR.Mnt%TYPE,
 pIdtDvs    OPR.IdtDvs%TYPE,
 pIdtOpr    OPR.IdtOpr%TYPE)
IS
vIdtLgnCss LGNCSS.IdtLgnCss%TYPE;
vIdtCntOpr CPTCLT.IdtCntOpr%TYPE;
vIdtCodSns CPTCLT.IdtCodSns%TYPE;
vIdtTypOpr TYPOPR.IdtTypOpr%TYPE;
vIdtNatRgl NATRGL.IdtNatRgl%TYPE;
vIdtTypFct TYPFCT.IdtTypFct%TYPE;
vRfr OPR.Rfr%TYPE;
vIdtOpr OPR.IdtOpr%TYPE;
vMsg varchar2(2000);
------------------------------------------------------------------------------
-- enregistrement d'un prelèvement                                          --
------------------------------------------------------------------------------
BEGIN
  SELECT idtcntopr,
         idtcodsns
    INTO vIdtCntOpr,
         vIdtCodSns
    FROM CPTCLT
   WHERE IdtClt    = pIdtClt
     AND IdtCptClt = pIdtCptClt;
  SELECT idttypopr
    INTO vidttypopr
    FROM OPR
   WHERE idtopr = pIdtOpr;
  if vIdtTypOpr = 19 then
    vIdtNatRgl := 2;
  elsif vIdtTypOpr = 1 then
    select IdtTypFct
      into vIdtTypFct
      from FAC
      where NumFct = pRfr;
    if vIdtTypFct = '15' then
      vIdtNatRgl := 3;
    else
      vIdtNatRgl := 1;
    end if;
  else
    vIdtNatRgl := 1;
  end if;
--   SELECT seq_LgnCss.NEXTVAL
--     INTO vIdtLgnCss
--     FROM dual;
--BPZ CC
--  X7_TRTSEQ01.X7_AttNumLgnCss( vidttypopr , vIdtLgnCss );
-- JCD le 17/02/2009
    X7_TRTSEQ01.X7_AttNumLgnCss( 5 , vIdtLgnCss );
  vRfr := to_char(vIdtLgnCss);
  INSERT INTO X7.LGNCSS (IDTLGNCSS,
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
                         NOMTRR,
                         MNT,
                         RFR,
                         MNTRND,
                         MTNDVSTOT,
                         MNTDVS,
                         IDTNATRGL,
                         IBAN, --SJ 07/08/2014 - traitement de la fiche #11948
                         BIC)
                 VALUES (vIdtLgnCss,
                         3,
                         'CSSPRL',
                         'CSSPRL',
                         pIdtBnq,
                         pIdtGch,
                         pIdtDvs,
                         vIdtTypOpr,
                         pIdtClt,
                         pIdtCptClt,
                         5,
                         vIdtCntOpr,
                         vIdtCodSns,
                         pDatPrl,
                         pNumCptBnc,
                         pNomCptBnc,
                         pMntPrl,
                         pRfr,
                         0,
                         pMntPrl,
                         pMntPrl,
                         vIdtNatRgl,
                         pIBAN,
                         pBIC);
  MAJOPRLTT (pModImp=>2,
             pIdtAgt=>'CSSPRL',
             pIdtCltOrg=>pIdtClt,
             pIdtCptCltOrg=>pIdtCptClt,
             pRfr=>vRfr,
             pIdtTypOpr=>2,
             pIdtOpr=>vIdtOpr,
             pMnt=>-pMntPrl,
             pDatVlr=>pDatPrl,
             pDatExg=>pDatPrl,
             pDatCnv=>DatCnvDvsJou(pIdtDvs),
             pIdtCltDst=>pIdtClt,
             pIdtCptCltDst=>pIdtCptClt,
             pIdtLgnCss=>vIdtLgnCss,
             pIdtDvs=>pIdtDvs,
             pMsg=>vMsg);
  if vMsg is not null then
    Raise_Application_Error(-20101, vMsg);
  end if;
END INSPRL;
-----------------------------------------------------------------------------
-----------------------------------------------------------------------------
-----------------------------------------------------------------------------
FUNCTION Verrou_TCHE(pROWID VARCHAR2)
--        --------- Version du package utilise
  RETURN NUMBER
IS
    verrou  exception;
    pragma  exception_init ( verrou, -54 ) ;
    var     number;
BEGIN
    UPDATE TCHE SET Stt = 'C' WHERE ROWID = pROWID AND TCHE.Stt IS NULL;
    if SQL%ROWCOUNT <> 0 THEN
        COMMIT;
        BEGIN
            Select 1 into var from tche where rowid = pROWID for update nowait;
        EXCEPTION
            WHEN verrou THEN
                RETURN 0;
        END;
        RETURN 1;
    end if;
    RETURN 0;
END Verrou_TCHE;

-----------------------------------------------------------------------------
-----------------------------------------------------------------------------
-----------------------------------------------------------------------------

PROCEDURE ValLotMns IS
---        ------- Validation d'un lot de mensualisation ----------------------------
nNombreDeMensu    TCHE.NBRENT%TYPE := 0;
vIdtLotFac        FAC.IDTLOTFAC%TYPE;
-------        Curseur, requete sur la table tâche
CURSOR cSelect_TRT IS
        SELECT        TCHE.IDTTYPTCHE,
                TCHE.ROWID,
                TCHE.PRM1,
                TCHE.PRM2
        FROM        TCHE
        WHERE        TCHE.IDTTYPTCHE        = gvIdtTrt_Validation_LotMns
        AND        TCHE.DATRLS        IS NULL
        AND        TCHE.STT        IS NULL
        AND        TCHE.MODDCL        = 'B'
        AND        1                = (SELECT Paserreurdanstachepourlelot2(TCHE.PRM1, gvIdtTrt_Validation_LotMns)
                                   FROM          DUAL
                                  )
        ORDER BY        TCHE.ROWID;
-----------------------------------------------------------------------------------
-------        Curseur de recherche de la liste des mensu à valider
CURSOR cListe_EchPmt IS
        SELECT        ECHPMT.ECHPMT
          FROM           ECHPMT
            WHERE         ECHPMT.IDTLOTFAC = vIdtLotFac
         AND      ECHPMT.Typ = 'M'
           AND        ECHPMT.IdtStaMns   = 1
         FOR UPDATE OF IdtStaMns;
----------------------------------------------------------------
BEGIN
err_idttrt:=gvIdtTrt_Validation_LotMns;
Trtmsg01.insert_msg
   (
    gvIdtTrt_Validation_LotMns,
    'MSG_DEBUT',
    Trtmsg01.concat_msg('MSG_DEBUT',NULL,NULL,NULL,NULL)
    );
COMMIT WORK;
Trtmsg01.InsertItem(Err_TableName,'VALLOTMNS');
------------------------------------------------:\te-------
--        Debut du type de traitement
-------------------------------------------------------
FOR rSelect_TRT IN cSelect_TRT        -- Tant qu'il y a des lots a valider
LOOP
      Trtmsg01.insert_msg (gvIdtTrt_Validation_LotMns,
                           'MSG_INF2001',
                           Trtmsg01.concat_msg('MSG_INF2001',rSelect_TRT.PRM1,NULL,NULL,NULL));
        --        Mise à jour de l'etat de la ligne de la table tâche
        -- Trtfac01.MAJLOTCCOMMIT (rSelect_TRT.IDTTYPTCHE, rSelect_TRT.ROWID);
        if Verrou_TCHE(rSelect_TRT.ROWID) = 1 then
            ----------------------------------------------
            -- Validation de la liste de factures d'un lot
            ----------------------------------------------
            IF        rSelect_TRT.PRM1 IS NOT NULL
            THEN        --------------------------------------
                    -- Validation des factures
                    BEGIN
                    nNombreDeMensu := 0;
                    vIdtLotFac          := rSelect_TRT.PRM1;
                    ------------------------------------------------------
                    --        Debut du tant qu'il y a des factures à valider
                    ------------------------------------------------------
                    FOR rListe_EchPmt IN cListe_EchPmt
                    LOOP
                          /* Appel de la fonction validation de la facture */
                          UPDATE ECHPMT
                         SET IdtStaMns = 2,
                             IdtAgt = 'X7',
                             DatMaj = SYSDATE
                       WHERE CURRENT OF cListe_EchPmt;
                             nNombreDeMensu := nNombreDeMensu + 1;
                    END LOOP;
                    --        Fin du tant qu'il y a des factures à valider
                            ------------------------------------------------------
                    END;
                    ---------------------------------------
            END IF;
            --        Mise à jour de la date de realisation de la table tâche
            UPDATE        TCHE
               SET        DATRLS        = SYSDATE,
                            STT              = 'F',
                            NBRENT        = nNombreDeMensu
             WHERE        IDTTYPTCHE        = rSelect_TRT.IDTTYPTCHE
               AND        ROWID                = rSelect_TRT.ROWID
               AND        STT                = 'C'
               AND        DATRLS      IS NULL
               AND        MODDCL        = 'B';
         Trtmsg01.insert_msg (gvIdtTrt_Validation_LotMns,
                               'MSG_INF2002',
                               Trtmsg01.concat_msg('MSG_INF2002',rSelect_TRT.PRM1,NULL,NULL,NULL));
        end if;
        COMMIT WORK;
END LOOP;        --        Fin du type de traitement
Trtmsg01.insert_msg (gvIdtTrt_Validation_LotMns,
                     'MSG_FIN',
                     Trtmsg01.concat_msg('MSG_FIN',NULL,NULL,NULL,NULL));
COMMIT WORK;
Trtmsg01.DeleteItem(Err_TableName);
EXCEPTION
  WHEN OTHERS
  THEN
    ROLLBACK;
    Trtmsg01.Msgerr(
           Err_IdtPck,
           Err_idttrt,
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
        -- BPZ
        -- Message d'erreur dans la table TBLERREUR
        X7.GEST_ERREUR_CENTURA(VersionPkg(),
                              0,
                              'CLTBTC01',
                              'ValLotMns',
                              to_char(SQLERRM),
                              sqlcode,
                              DBMS_UTILITY.FORMAT_ERROR_BACKTRACE);

END ValLotMns;
-----------------------------------------------------------------------------
-----------------------------------------------------------------------------
-----------------------------------------------------------------------------
-- HNG 07/02/2002
PROCEDURE SOLDEDPTGRN( pIdtClt    IN  OPR.IdtClt%TYPE,
                       pIdtCtr    IN  LGNFAC.IdtCtr%TYPE,
                       pIdtTypFct IN  FAC.IdtTypFct%TYPE,
                       pIdtAgt    IN  AGT.IdtAgt%TYPE,
                       pIdtOprOrg IN  OPR.IdtOpr%TYPE  -- FBE: 17/12/2007 parametre ajoute
                     )
IS
-- Curseur des operations de debit issue de facture type DEPOT_GARANTIE_2
CURSOR cOPR IS
  SELECT DISTINCT OPR.*
    FROM OPR,
         FAC,
       CTRFAC
   WHERE OPR.IdtTypOpr = '1'
     AND OPR.IdtClt    = FAC.IdtClt
       AND OPR.Rfr       = FAC.NUMFCT
     AND FAC.FctAnn    = '0'
     AND FAC.NUMFCT    <> '1'
       AND FAC.IdtTypFct = pIdtTypFct
     AND FAC.IdtFac    = CTRFAC.IdtFac
     AND CTRFAC.IdtCtr = pIdtCtr
     AND EstOprAnl(OPR.IdtOpr) = 0
  ORDER BY DatCrt ASC;
-- variable de fecth
rOPR cOPR%ROWTYPE;
vMnt           OPR.Mnt%TYPE;
vIdtTypOpr     OPR.IdtTypOpr%TYPE;
sCrcSpr        PRMGNR.SprCdf%TYPE;
vRfr       OPR.Rfr%TYPE;
vPrfx      TYPOPR.Prfx%TYPE;
vFlgDejLib     NUMBER;
vMsg varchar2(2000);
vIdtOpr OPR.IdtOpr%TYPE;
vIdtModImp MODIMP.IdtModImp%TYPE;
BEGIN
  select IdtModImp
    into vIdtModImp
    from TYPOPR
    where IdtTypOpr = 34;
  OPEN cOPR;
    LOOP
      FETCH cOPR INTO rOPR;
      EXIT WHEN cOPR%NOTFOUND;
      --
      -- Contrôle que le depot de garantie n'a pas deja ete libere pour cette operation
      --
      -- FBE: 17/12/2007: Changement de la requete. Pas besoin de gere l'exception NO_DATA_FOUND
      --                  parce qu'il s'agit d'un select count
      select count(*)
        into vFlgDejLib
        from TYPOPR, OPR OPRCRT, LTT
        where OPRCRT.IdtOpr = LTT.IdtOprCrt
         and  LTT.IdtOprDbt = rOPR.IdtOpr
         and  OPRCRT.IdtTypOpr in (33,34)
         and  EstOprAnl(OPRCRT.IdtOpr) = 0;
      -- FBE: 30/11/2012: Fiche 10598: Si le depot de garantie n'est pas libere, on fait le test au cas
      --                  ou la liberation a deja ete fait avec le systeme de liberation anterieur
      if vFlgDejLib = 0 then
        select COUNT(*)
          into vFlgDejLib
            from OPR, PRMGNR
        where OPR.IdtClt = rOPR.IdtClt
         and  OPR.IdtCptClt = rOPR.IdtCptClt
         and  DECODE(INSTR(OPR.RFR,PRMGNR.SprCdf),0,OPR.rfr,SUBSTR(OPR.rfr,INSTR(OPR.rfr,PRMGNR.SprCdf)+1)) = TO_CHAR(rOpr.IdtOpr)         -- SJ - F1038 modif pour recuperer le prefix du solde depot garantie et lingrn
         and  OPR.IdtTypOpr IN (33,34);
      end if; -- vFlgDejLib = 0
      if vFlgDejLib = 0 then
        MAJOPRLTT (pModImp=>vIdtModImp,
                   pIdtAgt=>pIdtAgt,
                   pIdtCltOrg=>rOPR.IdtClt,
                   pIdtCptCltOrg=>rOPR.IdtCptClt,
                   pRfr=>vRfr,
                   pIdtTypOpr=>33,
                   pIdtOpr=>vIdtOpr,
                   pDatVlr=>sysdate,
                   pDatExg=>sysdate,
                   pDatCnv=>rOPR.DatCnv,
                   pIdtCltDst=>rOPR.IdtClt,
                   pIdtCptCltDst=>rOPR.IdtCptClt,
                   pIdtOprAff=>rOPR.IdtOpr,
                   pIdtOprOrg=>pIdtOprOrg,
                   pIdtDvs=>rOPR.IdtDvs,
                   pMsg=>vMsg);
        if vMsg is not null then
          Raise_Application_Error(-20101, vMsg);
        end if;
      end if;
    end loop;
  close cOPR;
END SOLDEDPTGRN;
-- End HNG
-----------------------------------------------------------------------------
-----------------------------------------------------------------------------
-----------------------------------------------------------------------------
FUNCTION GETIMPTCK(pIdtLgnCss LGNCSS.IdtLgnCss%TYPE)
RETURN NUMBER
IS
CURSOR cLgnCss IS
  SELECT IdtCss,  IdtTypMvm,  IdtModRgl
    FROM LGNCSS
    WHERE IdtLgnCss = pIdtLgnCss;
vImpTckCss PRMGNR.ImpTckCss%TYPE :=0;
rLgnCss cLgnCss%ROWTYPE;
BEGIN
  SELECT ImpTckCss
    INTO vImpTckCss
    FROM PRMGNR;
  IF vImpTckCss = 1 THEN
    OPEN cLgnCss;
    FETCH cLgnCss INTO rLgnCss;
    CLOSE cLgnCss;
    SELECT ImpTckCss
      INTO vImpTckCss
      FROM CSS
      WHERE IdtCss = rLgnCss.IdtCss;
  END IF;
  IF vImpTckCss = 1 THEN
    SELECT ImpTckCss
      INTO vImpTckCss
      FROM TYPMVM
      WHERE IdtTypMvm = rLgnCss.IdtTypMvm;
  END IF;
  IF vImpTckCss = 1 THEN
    IF rLgnCss.IdtTypMvm = 5 THEN
      SELECT ImpTckCss
        INTO vImpTckCss
        FROM MODRGL
        WHERE IdtModRgl = rLgnCss.IdtModRgl;
    END IF;
  END IF;
  RETURN vImpTckCss;
END GETIMPTCK;
-----------------------------------------------------------------------------
-----------------------------------------------------------------------------
-----------------------------------------------------------------------------
FUNCTION DRNTCKCSSAGT(pIdtAgt AGT.IdtAgt%TYPE,
                      pIdtCss CSS.IdtCss%TYPE)
RETURN NUMBER
IS
CURSOR cLgnCss
IS
  select IdtLgnCss
    from LGNCSS,
         PRMGNR,
         CSS,
         TYPMVM,
         MODRGL
    WHERE CSS.IdtCss = LGNCSS.IdtCss
     and  TYPMVM.IdtTypMvm = LGNCSS.IdtTypMvm
     and  MODRGL.IdtModRgl = LGNCSS.IdtModRgl
     and  PRMGNR.ImpTckCss = 1
     and  CSS.ImpTckCss    = 1
     and  TYPMVM.ImpTckCss = 1
     and  MODRGL.ImpTckCss = 1
     and  LGNCSS.IdtAgt = pIdtAgt
     and  LGNCSS.IdtCss = pIdtCss
    ORDER BY LGNCSS.datcrt DESC;
--SELECT Idtlgncss
--  FROM LGNCSS
-- WHERE IdtAgt = pIdtAgt
--   AND IdtCss = pIdtCss
--   AND Cltbtc01.GetImpTck (IdtLgncss) = 1
-- ORDER BY datcrt DESC;
vIdtLgnCss LGNCSS.IdtLgnCss%TYPE;
BEGIN
    OPEN cLgnCss;
    FETCH cLgnCss
     INTO vIdtLgnCss;
    IF   cLgnCss%NOTFOUND
    THEN
         vIdtLgnCss := 0;
    END IF;
    CLOSE cLgnCss;
    RETURN vIdtLgnCss;
END DRNTCKCSSAGT;
-----------------------------------------------------------------------------
-----------------------------------------------------------------------------
-----------------------------------------------------------------------------
FUNCTION MODRGLCPTCLT (pIdtClt    CPTCLT.IdtClt%TYPE,
                       pIdtCptClt CPTCLT.IdtCptClt%TYPE)
RETURN NUMBER
IS
vIdtModRgl MODRGL.IdtModRgl%TYPE;
BEGIN
SELECT RCVTYP.IdtModRgl
  INTO vIdtModRgl
  FROM RCVTYP,CTR
 WHERE RCVTYP.IdtRcvTyp = CTR.IdtRcvTyp
   AND CTR.IdtCltSsc    = pIdtClt;
-- recouvrement type sans mode de règlement
-- on prend le mode de règlement par defaut
IF vIdtModRgl IS NULL
THEN SELECT IdtModRgl
       INTO vIdtModRgl
       FROM MODRGL
      WHERE VlrDft = 1;
END IF;
RETURN vIdtModRgl;
EXCEPTION
  WHEN NO_DATA_FOUND
   THEN RETURN 1;
END MODRGLCPTCLT;
-----------------------------------------------------------------------------
-----------------------------------------------------------------------------
-----------------------------------------------------------------------------
FUNCTION MNTMINRMBCPTCLT (pIdtClt    CPTCLT.IdtClt%TYPE,
                          pIdtCptClt CPTCLT.IdtCptClt%TYPE)
RETURN NUMBER
IS
CURSOR cCtr
IS
SELECT RCVTYP.MntMinRmb
  FROM RCVTYP,CTR
 WHERE RCVTYP.IdtRcvTyp = CTR.IdtRcvTyp
   AND CTR.IdtCltSsc    = pIdtClt
 ORDER BY datscr DESC;
vMntMinRmb RCVTYP.MntMinRmb%TYPE;
BEGIN
OPEN cCtr;
FETCH cCtr INTO vMntMinRmb;
CLOSE cCtr;
RETURN vMntMinRmb;
EXCEPTION
  WHEN NO_DATA_FOUND
   THEN RETURN NULL;
END MNTMINRMBCPTCLT;
-----------------------------------------------------------------------------
-----------------------------------------------------------------------------
-----------------------------------------------------------------------------
FUNCTION Modulo11  (pVlr VARCHAR2)
RETURN NUMBER
IS
------------------------------------------------------------------------------
--Nombre de chiffre de la valeur à controler
------------------------------------------------------------------------------
  vLenStr NUMBER(3);
  vTotPdt NUMBER := 0;
  vMod11  NUMBER;
  vCoef   NUMBER;
  vReturn NUMBER;
BEGIN
  vLenStr := LENGTH(pVlr);
  vCoef := 2;
  FOR i IN 1..vLenStr
  LOOP
    vTotPdt := vTotPdt + TO_NUMBER(SUBSTR(pVlr,vLenStr - i +1,1)) * vCoef;
    IF vCoef = 7
    THEN vCoef := 2;
    ELSE vCoef := vCoef + 1;
    END IF;
  END LOOP;
  vMod11 := MOD(vTotPdt,11);
  IF    vMod11 = 0
  THEN  vReturn := 0;
  ELSIF vMod11 = 1
  THEN  vReturn := 0;
  ELSE  vReturn := 11 - vMod11;
  END IF;
  RETURN vReturn;
EXCEPTION
WHEN OTHERS THEN RETURN NULL;
END Modulo11;
-----------------------------------------------------------------------------
-----------------------------------------------------------------------------
-----------------------------------------------------------------------------
FUNCTION Modulo23  (pVlr VARCHAR2)
RETURN VARCHAR2
IS
  vMod23  NUMBER;
  vTabLet VARCHAR2(23) := 'ABCDEFGHJKLMNPQRSTUVWXY';
  vReturn VARCHAR2(1);
BEGIN
  vMod23 := MOD(pVlr,23);
  vReturn := SUBSTR(vTabLet,vMod23+1,1);
  RETURN vReturn;
EXCEPTION
WHEN OTHERS THEN RETURN NULL;
END Modulo23;
-----------------------------------------------------------------------------
-----------------------------------------------------------------------------
-----------------------------------------------------------------------------
FUNCTION Modulo100 (pVlr VARCHAR2)
RETURN VARCHAR2
IS
  VcleM100  NUMBER(4);
  vString VARCHAR2(27);
  vlen NUMBER(2);
BEGIN
  vString :=TRANSLATE(UPPER(pVlr),'ABCDEFGHIJKLMNOPQR STUVWXYZ','123456789123456789123456789');
  vlen :=LENGTH(LTRIM(RTRIM(vString)));
  VcleM100 :=0;
  FOR I IN 1 .. Vlen
  LOOP
    VcleM100 :=VcleM100+I*TO_NUMBER(SUBSTR(vString,VLen-I+1,1));
  END LOOP;
  VCleM100 := MOD(VcleM100,100);
RETURN LPAD(TO_CHAR(VcleM100),2,' ');
END Modulo100;
-----------------------------------------------------------------------------
-----------------------------------------------------------------------------
-----------------------------------------------------------------------------
FUNCTION SldEcheancier  (pEchPmt ECHPMT.ECHPMT%TYPE)
RETURN NUMBER
IS
  vSld NUMBER;
BEGIN
  SELECT SUM(sld)
    INTO  vsld
    FROM OPR
   WHERE idttypopr IN (7,19,21)
     AND ECHPMT = pEchPmt;
  RETURN vSld;
EXCEPTION
WHEN OTHERS THEN RETURN NULL;
END SldEcheancier;
-----------------------------------------------------------------------------
-----------------------------------------------------------------------------
-----------------------------------------------------------------------------
FUNCTION Nbrretimpopr  (pIdtOpr  OPR.IdtOpr%TYPE)
RETURN NUMBER
IS
vNbrRetImpOpr NUMBER;
 CURSOR cRgl IS
   SELECT DISTINCT idtopr
     FROM OPR,LTT
    WHERE OPR.IdtTypOpr IN (gvIdtTypOpr_Rgl, gvIdtTypOpr_Mensualisation)
      AND OPR.IdtOpr    = LTT.IdtOprCrt
      AND LTT.Mnt       > 0
      AND LTT.IdtOprDbt = pIdtOpr;
 rRgl cRgl%ROWTYPE;
 vIdtOprRgl OPR.IdtOpr%TYPE;
 CURSOR cRetImp IS
   SELECT COUNT(*) Nbrretimpopr
      FROM OPR,LTT
     WHERE OPR.IdtTypOpr = gvIdtTypOpr_RetImp
       AND OPR.IdtOpr    = LTT.IdtOprDbt
       AND LTT.IdtOprCrt = vIdtOprRgl;
 rRetImp cRetImp%ROWTYPE;
vNbrRetImpTot NUMBER := 0;
 BEGIN
   FOR rRgl IN Crgl
   LOOP
       vIdtOprRgl := rRgl.IdtOpr;
       FOR rRetImp IN cRetImp
       LOOP
           vNbrRetImpTot := vNbrRetImpTot + rRetImp.Nbrretimpopr;
       END LOOP;
   END LOOP;
 RETURN vNbrRetImpTot;
EXCEPTION
WHEN OTHERS THEN RETURN NULL;
END Nbrretimpopr;
-----------------------------------------------------------------------------
-----------------------------------------------------------------------------
-----------------------------------------------------------------------------
FUNCTION DatDrnRetImpOpr (pIdtOpr OPR.IdtOpr%TYPE)
RETURN DATE
IS
 vDatDrnRetImpOpr DATE ;
 CURSOR cRgl IS
   SELECT DISTINCT idtopr
     FROM OPR,LTT
    WHERE OPR.IdtTypOpr IN (gvIdtTypOpr_Rgl, gvIdtTypOpr_Mensualisation)
      AND OPR.IdtOpr    = LTT.IdtOprCrt
      AND LTT.Mnt       > 0
      AND LTT.IdtOprDbt = pIdtOpr;
 rRgl cRgl%ROWTYPE;
 vIdtOprRgl OPR.IdtOpr%TYPE;
 CURSOR cRetImp IS
   SELECT OPR.DatCrt
      FROM OPR,LTT
     WHERE OPR.IdtTypOpr = gvIdtTypOpr_RetImp
       AND OPR.IdtOpr    = LTT.IdtOprDbt
       AND LTT.IdtOprCrt = vIdtOprRgl;
 rRetImp cRetImp%ROWTYPE;
 BEGIN
   FOR rRgl IN Crgl
   LOOP
       vIdtOprRgl := rRgl.IdtOpr;
       FOR rRetImp IN cRetImp
       LOOP
           vDatDrnRetImpOpr := GREATEST (NVL(vDatDrnRetImpOpr,'01-JAN-1900'), rRetImp.DatCrt);
       END LOOP;
   END LOOP;
 RETURN vDatDrnRetImpOpr;
--exception
--when others then return null;
END DatDrnRetImpOpr;
-----------------------------------------------------------------------------
-----------------------------------------------------------------------------
-----------------------------------------------------------------------------
FUNCTION NXTDRI
RETURN DATE
IS
vDatNxtDri DATE;
vDat DATE;
vDatDptPrl PRMGNR.DatDptPrl%TYPE;
BEGIN
-- recuperation de la date avec delai de transmission et de la date de depot à considerer
  SELECT TRUNC(SYSDATE) + DlaTrsSupPrl, DatDptPrl
    INTO vDat, vDatDptPrl
    FROM PRMGNR;
-- selection de la plus petite date de reglement interbancaire dont la date de depot comptoir
-- ou la date d'echange interbancaire (suivant le parametre generale) est superieure ou
-- egale à la date du jour + le delai de transmission
  SELECT MIN(DatRglIntBnq)
    INTO vDatNxtDri
    FROM CLDBNQFCE
    WHERE DECODE( NVL( vDatDptPrl, 0), 1, DatEchIntBnq, DatDepCmp) >= vDat;
  RETURN vDatNxtDri;
END NXTDRI;
-----------------------------------------------------------------------------
-----------------------------------------------------------------------------
-----------------------------------------------------------------------------
FUNCTION DATDRNPRSPRLOPR (pIdtOpr IN OPR.IdtOpr%TYPE)
RETURN DATE
IS
vDatDrnPrsPrlOpr DATE := NULL;
BEGIN
   SELECT MAX(DatVlr) DatDrnPrsPrlOpr
     INTO vDatDrnPrsPrlOpr
     FROM OPR,LTT
    WHERE OPR.IdtTypOpr = 2
      AND OPR.IdtModRgl = 3
      AND OPR.IdtOpr    = LTT.IdtOprCrt
      AND LTT.Mnt       > 0
      AND LTT.IdtOprDbt = pIdtOpr;
RETURN vDatDrnPrsPrlOpr;
END DATDRNPRSPRLOPR;
-----------------------------------------------------------------------------
-----------------------------------------------------------------------------
-----------------------------------------------------------------------------
FUNCTION MODAFFAUTCRT
RETURN NUMBER
IS
vReturn NUMBER;
BEGIN
  SELECT NVL(MODLTTAUT,0)
  INTO vReturn
  FROM PRMGNR;
  RETURN vReturn;
END MODAFFAUTCRT;
-----------------------------------------------------------------------------
-----------------------------------------------------------------------------
FUNCTION EstOprAnl (pIdtOpr OPR.IdtOpr%TYPE)
RETURN NUMBER
IS
  vOprAnn    NUMBER;
BEGIN
  select nvl(Anl,0)
    into vOprAnn
    from OPR
    where IdtOpr = pIdtOpr;
  return vOprAnn;
END EstOprAnl;
-----------------------------------------------------------------------------
-----------------------------------------------------------------------------
-----------------------------------------------------------------------------
FUNCTION EstLttAnl (pIdtLtt LTT.IdtLtt%TYPE)
RETURN NUMBER
IS
  vLttAnn    NUMBER;
BEGIN
  select nvl(Anl,0)
    into vLttAnn
    from LTT
    where IdtLtt = pIdtLtt;
  return vLttAnn;
END EstLttAnl;
-----------------------------------------------------------------------------
-----------------------------------------------------------------------------
-----------------------------------------------------------------------------
FUNCTION EXTPFJ(pRfr OPR.Rfr%TYPE)
RETURN VARCHAR2
IS
sCrcSpr VARCHAR2(1);
vEchPmt OPR.Rfr%TYPE;
BEGIN
  SELECT PRMGNR.SprCdf
    INTO   sCrcSpr
    FROM   PRMGNR;
  -----------------------------------------------------------------------------------
  --Asignaci?n de la referencia de la operaci?n a la variable de n?mero de convenio
  -----------------------------------------------------------------------------------
  vEchPmt := pRfr;
  -----------------------------------------------------------------------------------
  --Se toman los datos a partir del primer caracter separador.
  -----------------------------------------------------------------------------------
  IF INSTR(pRfr,sCrcSpr,1,1) <> 0 THEN
    vEchPmt := SUBSTR(vEchPmt,INSTR(vEchPmt,sCrcSpr,1,1) + 1,LENGTH(vEchPmt));
  END IF;
  RETURN vEchPmt;
END EXTPFJ;
-----------------------------------------------------------------------------
-----------------------------------------------------------------------------
-----------------------------------------------------------------------------
FUNCTION EXTSFJ(pRfr OPR.Rfr%TYPE)
RETURN VARCHAR2
IS
sCrcSpr VARCHAR2(1);
vEchPmt OPR.Rfr%TYPE;
BEGIN
  SELECT PRMGNR.SprCdf
    INTO   sCrcSpr
    FROM   PRMGNR;
  -----------------------------------------------------------------------------------
  --Asignaci?n de la referencia de la operaci?n a la variable de n?mero de convenio
  -----------------------------------------------------------------------------------
  vEchPmt := pRfr;
  -----------------------------------------------------------------------------------
  --Si existen dos caracteres separadores, se asume que la referencia de la
  --operaci?n consta de un sufijo y un prefijo. Si es el caso, se elimina a partir
  --del segundo caracter separador. Si no existe caracter separador no se hace nada
  -----------------------------------------------------------------------------------
  IF INSTR(pRfr,sCrcSpr,1,2) <> 0 THEN
    vEchPmt := SUBSTR(vEchPmt,1,INSTR(vEchPmt,sCrcSpr,1,2) -1);
  -----------------------------------------------------------------------------------
  --Si existen un solo caracter separador, se asume que la referencia de la
  --operaci?n consta de un sufijo. Si es el caso, se elimina a partir del
  --primer caracter separador. Si no existe caracter separador no se hace nada
  -----------------------------------------------------------------------------------
  ELSIF INSTR(pRfr,sCrcSpr,1,1) <> 0 THEN
    vEchPmt := SUBSTR(vEchPmt,1,INSTR(vEchPmt,sCrcSpr,1,1) -1);
  END IF;
  RETURN vEchPmt;
END EXTSFJ;
-----------------------------------------------------------------------------
-----------------------------------------------------------------------------
-----------------------------------------------------------------------------
FUNCTION Rfr2IdtOpr (pIdtClt    VARCHAR2,
                     pIdtCptClt NUMBER,
                     pIdtTypOpr NUMBER,
                     pRfr       VARCHAR2)
 RETURN NUMBER
IS
vIdtOpr OPR.IdtOpr%TYPE;        /* Numero de l'operation */
BEGIN
   IF pRfr IS NOT NULL
   THEN
      SELECT IdtOpr
        INTO vIdtOpr
        FROM OPR
       WHERE IdtClt    = pIdtClt
       AND IdtCptClt = pIdtCptClt
       AND IdtTypOpr = pIdtTypOpr
     AND Rfr       = pRfr;
   END IF;
   RETURN vIdtOpr;
EXCEPTION
WHEN NO_DATA_FOUND
THEN RETURN NULL;
END Rfr2IdtOpr;
-----------------------------------------------------------------------------
-----------------------------------------------------------------------------
-----------------------------------------------------------------------------
FUNCTION SqcCptClt
   RETURN NUMBER
IS
Sqc NUMBER;
BEGIN
   SELECT SEQ_OPR.NEXTVAL
     INTO Sqc
     FROM DUAL;
   RETURN Sqc;
END SqcCptClt;
-----------------------------------------------------------------------------
-----------------------------------------------------------------------------
-----------------------------------------------------------------------------
PROCEDURE REFBNC (pIdtClt    IN  CLT.IdtClt%TYPE,
                  pIdtCptClt IN  CPTCLT.IdtCptClt%TYPE,
                  pIdtCtr    IN CTR.IdtCtr%TYPE,
                  pIdtModRgl OUT MODRGL.IdtModRgl%TYPE,
                  pIdtModRcv OUT RCVTYP.IdtModRcv%TYPE,
                  pIdtBnq    OUT OPR.IdtBnq%TYPE,
                  pIdtGch    OUT OPR.IdtGch%TYPE,
                  pNumCptBnc OUT OPR.NumCptBnc%TYPE,
                  pCleRib    OUT OPR.CleRib%TYPE,
                  pNomCptBnc OUT OPR.NomCptBnc%TYPE,
                  pIBAN      OUT OPR.IBAN%type,
                  pBIC      OUT OPR.BIC%type)
IS
vIdtRcvTyp RCVTYP.IdtRcvTyp%TYPE := NULL;
vIdtModRgl MODRGL.IdtModRgl%TYPE := NULL;
vIdtModRcv RCVTYP.IdtModRcv%TYPE := NULL;
CURSOR cCTR IS
   SELECT CTR.IdtRcvTyp,
          CTR.IdtBnq,
          CTR.IdtGch,
          CTR.NumCptBnc,
          CTR.CleRib,
          CTR.PrpCptBnc, 
          CTR.IBAN,
          CTR.BIC
     FROM CTR, prmgnr
-- Modification par Anthony le 27/11/2002
-- on considere uniquement le dernier contrat en date
WHERE decode(dft,0,IdtCltSsc,IdtCltDst)  = pIdtClt
AND idtctr = NVL(pIdtCtr,idtctr) --fiche 4284
ORDER BY datrsl DESC, datcrt DESC;
rCtr cCtr%ROWTYPE;
BEGIN
  OPEN cCtr;
   FETCH cCtr INTO rCtr;
   IF cCtr%NOTFOUND THEN
     SELECT IdtModRgl
       INTO pIdtModRgl
       FROM CPTCLT
       WHERE IdtClt = pIdtClt
        AND  IdtCptClt = pIdtCptClt;
     pIdtModRcv := NULL;
     pIdtBnq    := NULL;
     pIdtGch    := NULL;
     pNumCptBnc := NULL;
     pCleRib    := NULL;
     pNomCptBnc := NULL;
     pIBAN      := null;
     pBIC       := null;
   ELSE
     SELECT IdtModRgl,
            IdtModRcv
       INTO vIdtModRgl,
            vIdtModRcv
       FROM RCVTYP
      WHERE IdtRcvTyp = rCtr.IdtRcvTyp;
     pIdtModRgl := vIdtModRgl;
     pIdtModRcv := vIdtModRcv;
     pIdtBnq    := rCtr.IdtBnq;
     pIdtGch    := rCtr.IdtGch;
     pNumCptBnc := rCtr.NumCptBnc;
     pCleRib    := rCtr.CleRib;
     pNomCptBnc := rCtr.PrpCptBnc;
     pIBAN      := rCtr.IBAN;
     pBIC       := rCtr.BIC;
   END IF;
   CLOSE cCtr;
END REFBNC;
-----------------------------------------------------------------------------
-----------------------------------------------------------------------------
-----------------------------------------------------------------------------
PROCEDURE MODRCVFAC(pNumFct IN FAC.NUMFCT%TYPE,
                    pIdtRcvTyp OUT RCVTYP.IdtRcvTyp%TYPE,
                    pIdtModRcv OUT RCVTYP.IdtModRcv%TYPE,
                    pIdtModRgl OUT MODRGL.IdtModRgl%TYPE)
IS
BEGIN
  SELECT IdtRcvTyp
    INTO pIdtRcvTyp
    FROM FAC
    WHERE NUMFCT = pNumFct;
  SELECT IdtModRgl,  IdtModRcv
    INTO pIdtModRgl, pIdtModRcv
    FROM RCVTYP
    WHERE IdtRcvTyp = pIdtRcvTyp;
END;
-----------------------------------------------------------------------------
-----------------------------------------------------------------------------
-----------------------------------------------------------------------------
FUNCTION DATEXGDMC (pNumFct FAC.NUMFCT%TYPE,
                    pDatClc DATE)
RETURN DATE
IS
vReturn    DATE := NULL;
vIdtRcvTyp RCVTYP.IdtRcvTyp%TYPE;
vIdtModRcv RCVTYP.IdtModRcv%TYPE;
vJouPlv    RCVTYP.JouPlv%TYPE;
vDlaCstMns PRMGNR.DlaCstMns%TYPE;
BEGIN
  --
  -- Recherche du code de recouvrement type du contrat de la facture
  -- HNG 04/05/2004 - Fiche 2950
  SELECT CTR.IdtRcvTyp
    INTO vIdtRcvTyp
    FROM CTR, CTRFAC, FAC
   WHERE CTR.IdtCtr    = CTRFAC.IdtCtr
     AND CTRFAC.IDTFAC = FAC.IdtFac
     AND FAC.NUMFCT    = pNumFct
   AND ROWNUM = 1;
  -- End HNG

  -- Recherche du jour theorique de prelèvement dans table RCPTYP
  --
  IF vIdtRcvTyp IS NOT NULL
  THEN
    SELECT IdtModRcv,  JouPlv
      INTO vIdtModRcv, vJouPlv
      FROM RCVTYP
      WHERE IdtRcvTyp = vIdtRcvTyp;
    IF vJouPlv <> 0
    THEN
    --
    -- il s'agit d'un mode 'AVIS DE PRELEVEMENT' (DOMICILIATION)
    --  On calcule la date de  prelèment (qui devient date d'exibilite sur OPR)
    --  = Prochain jour therique de prélèvement à partir de date de calcul + délai de constitution des prélèvements
    --
      IF vIdtModRcv = 'AVP'
      THEN
         --
         -- recherche délai de constitution
         --
         SELECT DlaCstMns
           INTO vDlaCstMns
           FROM PRMGNR;
         vReturn := pDatClc + vDlaCstMns;
         IF TO_NUMBER(TO_CHAR(vReturn,'DD')) > vJouPlv
         THEN
           vReturn := ADD_MONTHS(vReturn,1);
         END IF;
         vReturn := TO_DATE(TO_CHAR(vReturn,'yyyymm') ||
                    LEAST(TO_CHAR(LAST_DAY(vReturn),'dd'),LPAD(NVL(vJouPlv,0),2,'0')),
                    'yyyymmdd');
      END IF;
    END IF;
  END IF;
  RETURN vReturn;
  EXCEPTION
  WHEN NO_DATA_FOUND THEN
       RETURN vReturn;
END;
-----------------------------------------------------------------------------
-----------------------------------------------------------------------------
-----------------------------------------------------------------------------
function EstLttAutorise (pIdtOpr OPR.IdtOpr%TYPE,
                         pIdtOprAff OPR.IdtOpr%TYPE,
                         pMode number DEFAULT 1)   -- 1: Manual; 2: Automatique
  return number
  is
  vNbr number;
  vIdtTypOpr    TYPOPR.IdtTypOpr%TYPE;
  vIdtTypOprAff TYPOPR.IdtTypOpr%TYPE;
  vIdtNatRgl    NATRGL.IdtNatRgl%TYPE;
  vIdtNatRglAff NATRGL.IdtNatRgl%TYPE;
  vIdtTypFctAff TYPFCT.IdtTypFct%TYPE;
  vRfr          OPR.Rfr%TYPE;
BEGIN
  select IdtTypOpr, IdtNatRgl
    into vIdtTypOpr, vIdtNatRgl
    from OPR
    where IdtOpr = pIdtOpr;
  select IdtTypOpr, IdtNatRgl, Rfr
    into vIdtTypOprAff, vIdtNatRglAff, vRfr
    from OPR
    where IdtOpr = pIdtOprAff;
  if vIdtTypOprAff = 1 then
    select IdtTypFct
      into vIdtTypFctAff
      from FAC
      where NumFct = vRfr;
  end if;
  select count(*)
    into vNbr
    from LTTAUT_VIEW
    where LTTAUT_VIEW.IdtTypOpr             = vIdtTypOpr
     and  LTTAUT_VIEW.IdtTypOprAff          = vIdtTypOprAff
     and  nvl(LTTAUT_VIEW.IdtNatRgl,-1)    = nvl(vIdtNatRgl,-1)
     and  nvl(LTTAUT_VIEW.IdtNatRglAff,-1) = nvl(vIdtNatRglAff,-1)
     and  nvl(LTTAUT_VIEW.IdtTypFctAff,'*') = nvl(vIdtTypFctAff,'*')
     and  decode(pMode,1,LTTAUT_VIEW.Man,2,LTTAUT_VIEW.Atm) = 1;
  if vNbr = 0 then
    return 0;
  else
    return 1;
  end if;
END EstLttAutorise;
-----------------------------------------------------------------------------
-----------------------------------------------------------------------------
-----------------------------------------------------------------------------
PROCEDURE MODRMBCPTCLT  (pIdtClt       IN CPTCLT.IdtClt%TYPE,
                         pIdtCptClt    IN CPTCLT.IdtCptClt%TYPE,
                         pIdtModRgl    OUT MODRGL.IdtModrgl%TYPE,
                         pIdtBnq       OUT CTR.IdtBnq%TYPE,
                         pIdtGch       OUT CTR.IdtGch%TYPE,
                         pNumCptBnc    OUT CTR.NumCptBnc%TYPE,
                         pNomCptBnc    OUT CTR.PrpCptBnc%TYPE,
                         pCleRib       OUT CTR.CleRib%TYPE,
                         pIBAN         OUT CTR.IBAN%type,
                         pBIC          OUT CTR.BIC%type)
IS
CURSOR cCtr
IS
SELECT RCVTYP.idtmodrgl,
       DECODE(RCVTYP.idtmodrgl,3,CTR.idtbnq,NULL),
       DECODE(RCVTYP.idtmodrgl,3,CTR.idtgch,NULL),
       DECODE(RCVTYP.idtmodrgl,3,CTR.numcptbnc,NULL),
       DECODE(RCVTYP.idtmodrgl,3,CTR.Prpcptbnc,NULL),
       DECODE(RCVTYP.idtmodrgl,3,CTR.Clerib,NULL),
       DECODE(RCVTYP.idtmodrgl,3,CTR.IBAN,NULL),
       DECODE(RCVTYP.idtmodrgl,3,CTR.BIC,NULL) --SJ le 11/08/2014 traitement de la fiche 11952
  FROM RCVTYP,CTR, prmgnr
 WHERE RCVTYP.IdtRcvTyp = CTR.IdtRcvTyp
   AND decode(dft,0,CTR.IdtCltSsc,CTR.IdtCltDst) = pIdtClt
 ORDER BY ctr.datscr DESC;
BEGIN
OPEN cCtr;
FETCH cCtr INTO pIdtModRgl,
                pIdtBnq,
                pIdtGch,
                pNumCptBnc,
                pNomCptBnc,
        pCleRib,
        pIBAN,
        pBIC;
CLOSE cCtr;
EXCEPTION
  WHEN NO_DATA_FOUND
   THEN pIdtModRgl := 1;
        pIdtBnq    := NULL;
        pIdtGch    := NULL;
        pNumCptBnc := NULL;
        pNomCptBnc := NULL;
        pCleRib    := NULL;
        pIBAN      := null;
        pBIC       := null;
END MODRMBCPTCLT;
-----------------------------------------------------------------------------
-----------------------------------------------------------------------------
-----------------------------------------------------------------------------
PROCEDURE InsLtt (pIdtOprDr NUMBER,
                  pIdtOprCr NUMBER,
                  pMnt NUMBER,
                  pIdtSitAvt NUMBER,
                  pDatLtt DATE,
                  pIdtOprOrg OPR.IDTOPR%TYPE,
                  pIdtRgu RGU.IDTRGU%TYPE,
                  pIdtAgt AGT.IdtAgt%TYPE,
                  pIdtLttAnl LTT.IdtLtt%TYPE,
                  pIdtLtt OUT LTT.IDTLTT%TYPE) IS
  vIdtLtt LTT.IdtLtt%TYPE;

  VIdttypoprdbt opr.idttypopr%type;
  VIdttypoprcrt opr.idttypopr%type;
BEGIN
  /*-----------------------------------------
  - Insertion de la ligne de lettrage
  -----------------------------------------*/
  SELECT SEQ_LTT.NEXTVAL
  INTO vIdtLtt
  FROM DUAL;
  INSERT INTO LTT
     (IdtLtt,
      IdtOprDbt,
      IdtOprCrt,
      DatLtt,
      IdtSitAvt,
      Mnt,
      IdtOprOrg,
      IdtRgu,
      DatCrt,
      IdtAgt,
      IdtLttAnl,
      Anl)
  VALUES  (vIdtLtt,
      pIdtOprDr,
      pIdtOprCr,
      pDatLtt,
      pIdtSitAvt,
      pMnt,
      pIdtOprOrg,
      pIdtRgu,
      sysdate, --SJ 29/10/2012 F10511 vpDatCrt, --sysdate, SJ 17/08/2012 traitement de la fiche 10308
      pIdtAgt,
      pIdtLttAnl,
      0);

 select idttypopr into VIdttypoprdbt from opr where idtopr=pIdtOprDr;
 select idttypopr into VIdttypoprcrt from opr where idtopr=pIdtOprCr;
 -- ici il faudrait que tu vérifies que le type d'opr de changement de situation crédit est bien 16
 -- SJ 07 jan 2010 correction ici : fiche 7998 : annulation ech + ann imp  double solde fct pen
if VIdttypoprdbt != 15 and VIdttypoprcrt = 16  then
  null;
else

  /*----------------------------------------------
  - Mise a jour du solde de l'operation debitrice
  ------------------------------------------------*/
  UPDATE OPR SET Sld = Sld - pMnt
    WHERE  IdtOpr    = pIdtOprDr;
  /*-----------------------------------------------
  - Mise a jour du solde de l'operation creditrice
  ------------------------------------------------*/
  UPDATE OPR SET Sld = Sld + pMnt
    WHERE IdtOpr    = pIdtOprCr;

end if;
  /*-----------------------------------------------
  - Renseigne l'identifint de lettrage de retour
  ------------------------------------------------*/
  pIdtLtt := vIdtLtt;
  ------------------------------------------------
  --Contabilizaci?n del Lettrage
  ------------------------------------------------
  --   if ModCmp = 1 then
  --     TrtCmp.TrtCmp(vIdtLtt, 'LTT');
  --   end if;
END InsLtt;
-----------------------------------------------------------------------------
-----------------------------------------------------------------------------
-----------------------------------------------------------------------------
PROCEDURE AnlLtt (pIdtAgt AGT.IdtAgt%TYPE,
                  pIdtLtt LTT.IdtLtt%TYPE,
                  pDatLtt date,
                  pIdtOprOrg OPR.IdtOpr%TYPE)
IS
  rLtt LTT%ROWTYPE;
  vIdtLtt LTT.IdtLtt%TYPE;
BEGIN
  select *
    into rLtt
    from LTT
    where IdtLtt = pIdtLtt
     and  Mnt > 0;
  if EstLttAnl(rLTT.IdtLtt) = 0 and EstOprAnl(rLTT.IdtOprDbt) = 0 and EstOprAnl(rLTT.IdtOprCrt) = 0 then
    InsLtt (rLtt.IdtOprDbt, rLtt.IdtOprCrt, -rLtt.Mnt, rLtt.IdtSitAvt, pDatLtt, pIdtOprOrg, NULL, pIdtAgt, pIdtLtt, vIdtLtt);
    -- Mise a jour du lettrage annule
    update LTT
      set Anl = 1
      where IdtLtt = pIdtLtt;
  end if;
END AnlLtt;
-----------------------------------------------------------------------------
-----------------------------------------------------------------------------
-----------------------------------------------------------------------------
PROCEDURE AnlLttxOpr (pIdtAgt AGT.IdtAgt%TYPE,
                      pIdtOpr NUMBER,
                      pMode NUMBER,
                      pDatLtt DATE,
                      pIdtOprOrg OPR.IdtOpr%TYPE)
IS
  /*-------------------------------------------------------------------------------------
  - declaration du curseur de selection des lignes de lettrage d'une operation debitrice
  --------------------------------------------------------------------------------------*/
  /* modification du 10/12/2001 par PLS                                                 */
  /*  dans le cas ou l'opération créditrice est déja annulé on ne traite pas le         */
  /*    lettrage associé                                                                */
  /*-------------------------------------------------------------------------------------*/
  CURSOR cDr IS
    SELECT IdtLtt
    FROM LTT
    WHERE EstOprAnl (LTT.IdtOprCrt) = 0
     and  EstLttAnl (LTT.IdtLtt)    = 0
     and  Mnt > 0  -- pas de lettrages de desaffectation
     AND  LTT.IdtOprDbt = pIdtOpr;
  /*-------------------------------------------------------------------------------------
  - declaration du curseur de selection des lignes de lettrage d'une operation creditrice
  --------------------------------------------------------------------------------------*/
  CURSOR cCr IS
    SELECT IdtLtt
    FROM   LTT
    WHERE EstOprAnl (LTT.IdtOprDbt) = 0
     and  EstLttAnl (LTT.IdtLtt)    = 0
     and  Mnt > 0  -- pas de lettrages de desaffectation
     AND  IdtOprCrt = pIdtOpr;
  /*-----------------------------------------------
  - même enregistrement pour les deux curseurs
  ------------------------------------------------*/
  rDrCr cDr%ROWTYPE;
  -- HNG 20/08/2004 Fiche 3232
  vIdtLtt LTT.IDTLTT%TYPE;
  -- End HNG
  vMsg varchar2(255);
BEGIN
  /*-----------------------------------------------
  - Traitement d'une operation debitrice
  ------------------------------------------------*/
  IF pMode = 1 THEN
    FOR rDrCr IN cDr LOOP
      -----------------------------------------------------
      -- Annulation du lettrage
      ------------------------------------------------------
      AnlLtt(pIdtAgt,
             rDrCr.IdtLtt,
             pDatLtt,
             pIdtOprOrg);
    END LOOP;
    /*-----------------------------------------------
    - Traitement d'une operation creditrice
    ------------------------------------------------*/
  ELSIF pMode = 2 THEN
    FOR rDrCr IN cCr LOOP
      -----------------------------------------------------
      -- Annulation du lettrage
      ------------------------------------------------------
      AnlLtt(pIdtAgt,
             rDrCr.IdtLtt,
             pDatLtt,
             pIdtOprOrg);
    END LOOP;
  END IF;
END AnlLttxOpr;
-----------------------------------------------------------------------------
-----------------------------------------------------------------------------
-----------------------------------------------------------------------------
-- procedure X7_CRTOPR (pIdtAgt              AGT.IdtAgt%TYPE        DEFAULT NULL,
--                      pIdtCltOrg           CLT.IdtClt%TYPE        DEFAULT NULL,
--                      pIdtCptCltOrg        CPTCLT.IdtCptClt%TYPE  DEFAULT NULL,
--                      pRfr          IN OUT OPR.Rfr%TYPE,
--                      pIdtTypOpr           TYPOPR.IdtTypOpr%TYPE,
--                      pMnt                 OPR.Mnt%TYPE           DEFAULT NULL,
--                      pDatVlr              date                   DEFAULT NULL,
--                      pDatExg              date                   DEFAULT NULL,
--                      pDatCnv              date                   DEFAULT NULL,
--                      pIdtCltDst           CLT.IdtClt%TYPE        DEFAULT NULL,
--                      pIdtCptCltDst        CPTCLT.IdtCptClt%TYPE  DEFAULT NULL,
--                      pIdtLgnCss           LGNCSS.IdtLgnCss%TYPE  DEFAULT NULL,
--                      pIdtOprAff           OPR.IdtOpr%TYPE        DEFAULT NULL,
--                      pIdtOprOrg           OPR.IdtOpr%TYPE        DEFAULT NULL,
--                      pIdtDvs              DVS.IdtDvs%TYPE        DEFAULT NULL,
--                      pInfCpl              OPR.InfCpl%TYPE        DEFAULT NULL,
--                      pIdtMtf              MTF.IdtMtf%TYPE        DEFAULT NULL,
--                      pIdtSit              SIT.IdtSit%TYPE        DEFAULT NULL,
--                      pMsg          IN OUT varchar2) is
--   --
--   vMsg                   varchar2(2000);
--   vModImp                MODIMP.IdtModImp%TYPE;
--   vCodeErreur            SYS_MSG.Msg_Code%TYPE;
--   vNbr                   number;
--   vIdtClt                CLT.IdtClt%TYPE;
--   vIdtCptClt             CPTCLT.IdtCptClt%TYPE;
--   vIdtOpr                OPR.IdtOpr%TYPE;
--   vIdtDvs                DVS.IdtDvs%TYPE;
--   vDatCnv                date;
--   vDatVlr                date;
--   vMnt                   OPR.Mnt%TYPE;
--   vIdtAgt                AGT.IdtAgt%TYPE;
--   vRfr                   OPR.Rfr%TYPE;
-- BEGIN
--   err_LibTypOpr    := null;
--   err_RfrAff       := null;
--   err_LibTypOprAff := null;
--   err_IdtModImp    := null;
--   if pIdtTypOpr = 2 and pIdtCltOrg is null then
--     vMsg := 'Recherche du client';
--     select min(IdtClt), min(IdtCptClt), min(IdtAgt), -sum(Mnt), min(DatCrt)
--       into vIdtClt, vIdtCptClt, vIdtAgt, vMnt, vDatVlr
--       from LGNCSS
--       where IdtLgnCss = pIdtLgnCss;
--     vRfr := nvl(pRfr,to_char(pIdtLgnCss));
--   else
--     vIdtClt := pIdtCltOrg;
--     vIdtCptClt := pIdtCptCltOrg;
--     vMnt := pMnt;
--     vIdtAgt := pIdtAgt;
--     vRfr := pRfr;
--     vDatVlr := pDatVlr;
--   end if;
--   err_Mnt          := vMnt;
--   err_IdtClt       := vIdtClt;
--   err_IdtCptClt    := vIdtCptClt;
--   err_IdtAgt       := vIdtAgt;
--   err_Rfr          := vRfr;
--   BEGIN
--     vMsg := 'Recherche du type d''operation';
--     select IdtModImp, Lib
--       into vModImp, err_LibTypOpr
--       from TYPOPR
--       where IdtTypOpr = pIdtTypOpr;
--   EXCEPTION
--     when NO_DATA_FOUND then
--       vCodeErreur := 'ERR_MAJCPT0003'; -- Le type d'operation n'existe pas
--       raise eErr_MajCpt;
--     when others then
--       raise;
--   END;
--   err_IdtModImp := vModImp;
--   vMsg := 'Recherche du client';
--   select count(*)
--     into vNbr
--     from CLT
--     where IdtClt = vIdtClt;
--   if vNbr = 0 then
--     vCodeErreur := 'ERR_MAJCPT0007'; -- Le client n'existe pas
--     raise eErr_MajCpt;
--   end if;
--   BEGIN
--     vMsg := 'Recherche de la devise';
--     select IdtDvs
--       into vIdtDvs
--       from CPTCLT
--       where IdtClt = vIdtClt
--        and  IdtCptClt = vIdtCptClt;
--   EXCEPTION
--     when NO_DATA_FOUND then
--       vCodeErreur := 'ERR_MAJCPT0008'; -- Le compte client n'existe pas
--       raise eErr_MajCpt;
--     when others then
--       raise;
--   END;
--   if vIdtClt <> nvl(pIdtCltDst,vIdtClt) then
--     vMsg := 'Recherche du client destinataire';
--     select count(*)
--       into vNbr
--       from CLT
--       where IdtClt = pIdtCltOrg;
--     if vNbr = 0 then
--       vCodeErreur := 'ERR_MAJCPT0007'; -- Le client n'existe pas
--       raise eErr_MajCpt;
--     end if;
--     BEGIN
--       vMsg := 'Recherche de la devise';
--       select IdtDvs
--         into vIdtDvs
--         from CPTCLT
--         where IdtClt = pIdtCltDst
--          and  IdtCptClt = pIdtCptCltDst;
--     EXCEPTION
--       when NO_DATA_FOUND then
--         vCodeErreur := 'ERR_MAJCPT0008'; -- Le compte client n'existe pas
--         raise eErr_MajCpt;
--       when others then
--         raise;
--     END;
--   end if;
--   vMsg := 'Recherche si l''operation existe';
--   select count(*)
--     into vNbr
--     from OPR
--     where Rfr = vRfr
--      and  IdtTypOpr = pIdtTypOpr;
--   if vNbr > 0 then
--     vCodeErreur := 'ERR_MAJCPT0029'; -- L'operation existe deja
--     raise eErr_MajCpt;
--   end if;
--   vIdtDvs := nvl(pIdtDvs,vIdtDvs);
--   vDatCnv := nvl(pDatCnv,vDatCnv);
--   MAJOPRLTT(pModImp=>vModImp,
--             pIdtAgt=>vIdtAgt,
--             pIdtCltOrg=>vIdtClt,
--             pIdtCptCltOrg=>vIdtCptClt,
--             pRfr=>vRfr,
--             pIdtTypOpr=>pIdtTypOpr,
--             pIdtOpr=>vIdtOpr,
--             pMnt=>vMnt,
--             pDatVlr=>vDatVlr,
--             pDatExg=>nvl(pDatExg,vDatVlr),
--             pDatCnv=>vDatCnv,
--             pIdtCltDst=>pIdtCltDst,
--             pIdtCptCltDst=>pIdtCptCltDst,
--             pIdtLgnCss=>pIdtLgnCss,
--             pIdtOprAff=>pIdtOprAff,
--             pIdtOprOrg=>pIdtOprOrg,
--             pIdtDvs=>vIdtDvs,
--             pIdtMtf=>pIdtMtf,
--             pInfCpl=>pInfCpl,
--             pIdtSit=>pIdtSit,
--             pMsg=>pMsg);
--   if pMsg is not null then
--     raise eErr_MajCpt;
--   end if;
-- --
-- -- Gestion des erreurs
-- --
-- EXCEPTION
--   -- Gestion des erreurs geres
--   when eERR_MAJCPT then
--     if pMsg is null then
--       pMsg := TRTMSG01.ChercheMsg(vCodeErreur);
--       pMsg := replace(pMsg,':IdtClt',err_IdtClt);
--       pMsg := replace(pMsg,':IdtCptClt',err_IdtCptClt);
--       pMsg := replace(pMsg,':RfrAff',err_RfrAff);
--       pMsg := replace(pMsg,':LibTypOprAff',err_LibTypOprAff);
--       pMsg := replace(pMsg,':Rfr',err_Rfr);
--       pMsg := replace(pMsg,':LibTypOpr',err_LibTypOpr);
--       pMsg := replace(pMsg,':Mnt',err_Mnt);
--       pMsg := replace(pMsg,':IdtAgt',err_IdtAgt);
--       pMsg := replace(pMsg,':IdtModImp',err_IdtModImp);
--       pMsg := 'X7_CRTOPR : ' || pMsg;
--     end if;
--   -- Gestion d'un plantage Oracle, on reenvoie le message
--   -- d'erreur Oracle, sans plantage
--   when others then
--     vCodeErreur := 'ERR_MAJCPT9999';
--     pMsg := TRTMSG01.ChercheMsg(vCodeErreur);
--     pMsg := pMsg || ' - ' || vMsg || ' ' || ' - ' || SQLERRM;
--     pMsg := 'X7_CRTOPR : ' || pMsg;
-- --
-- END X7_CRTOPR;


procedure X7_CRTOPR (pIdtAgt              AGT.IdtAgt%TYPE        DEFAULT NULL,
                     pIdtCltOrg           CLT.IdtClt%TYPE        DEFAULT NULL,
                     pIdtCptCltOrg        CPTCLT.IdtCptClt%TYPE  DEFAULT NULL,
                     pRfr          IN OUT OPR.Rfr%TYPE,
                     pIdtTypOpr           TYPOPR.IdtTypOpr%TYPE,
                     pMnt                 OPR.Mnt%TYPE           DEFAULT NULL,
                     pDatVlr              date                   DEFAULT NULL,
                     pDatExg              date                   DEFAULT NULL,
                     pDatCnv              date                   DEFAULT NULL,
                     pIdtCltDst           CLT.IdtClt%TYPE        DEFAULT NULL,
                     pIdtCptCltDst        CPTCLT.IdtCptClt%TYPE  DEFAULT NULL,
                     pIdtLgnCss           LGNCSS.IdtLgnCss%TYPE  DEFAULT NULL,
                     pIdtOprAff           OPR.IdtOpr%TYPE        DEFAULT NULL,
                     pIdtOprOrg           OPR.IdtOpr%TYPE        DEFAULT NULL,
                     pIdtDvs              DVS.IdtDvs%TYPE        DEFAULT NULL,
                     pInfCpl              OPR.InfCpl%TYPE        DEFAULT NULL,
                     pIdtMtf              MTF.IdtMtf%TYPE        DEFAULT NULL,
                     pIdtSit              SIT.IdtSit%TYPE        DEFAULT NULL,
                     pMsg          IN OUT varchar2) is
  --
  vMsg                   varchar2(2000);
  vModImp                MODIMP.IdtModImp%TYPE;
  vCodeErreur            SYS_MSG.Msg_Code%TYPE;
  vNbr                   number;
  vIdtClt                CLT.IdtClt%TYPE;
  vIdtCptClt             CPTCLT.IdtCptClt%TYPE;
  vIdtOpr                OPR.IdtOpr%TYPE;
  vIdtDvs                DVS.IdtDvs%TYPE;
  vDatCnv                date;
  vDatVlr                date;
  vMnt                   OPR.Mnt%TYPE;
  vIdtAgt                AGT.IdtAgt%TYPE;
  vRfr                   OPR.Rfr%TYPE;
BEGIN
  err_LibTypOpr    := null;
  err_RfrAff       := null;
  err_LibTypOprAff := null;
  err_IdtModImp    := null;
  if pIdtTypOpr = 2 and pIdtCltOrg is null then
    vMsg := 'Recherche du client';
    select min(IdtClt), min(IdtCptClt), min(IdtAgt), -sum(Mnt), min(DatCrt)
      into vIdtClt, vIdtCptClt, vIdtAgt, vMnt, vDatVlr
      from LGNCSS
      where IdtLgnCss = pIdtLgnCss;
    vRfr := nvl(pRfr,to_char(pIdtLgnCss));
  else
    vIdtClt := pIdtCltOrg;
    vIdtCptClt := pIdtCptCltOrg;
    vMnt := pMnt;
    vIdtAgt := pIdtAgt;
    vRfr := pRfr;
    vDatVlr := pDatVlr;
  end if;
  err_Mnt          := vMnt;
  err_IdtClt       := vIdtClt;
  err_IdtCptClt    := vIdtCptClt;
  err_IdtAgt       := vIdtAgt;
  err_Rfr          := vRfr;

  --SJ 22/07/2011 Fiche9348:
    if vIdtagt is null then vIdtagt := pIdtagt; end if;

  BEGIN
    vMsg := 'Recherche du type d''operation';
    select IdtModImp, Lib
      into vModImp, err_LibTypOpr
      from TYPOPR
      where IdtTypOpr = pIdtTypOpr;
  EXCEPTION
    when NO_DATA_FOUND then
      vCodeErreur := 'ERR_MAJCPT0003'; -- Le type d'operation n'existe pas
      raise eErr_MajCpt;
    when others then
      raise;
  END;
  err_IdtModImp := vModImp;
  vMsg := 'Recherche du client';
  select count(*)
    into vNbr
    from CLT
    where IdtClt = vIdtClt;
  if vNbr = 0 then
    vCodeErreur := 'ERR_MAJCPT0007'; -- Le client n'existe pas
    raise eErr_MajCpt;
  end if;
  BEGIN
    vMsg := 'Recherche de la devise';
    select IdtDvs
      into vIdtDvs
      from CPTCLT
      where IdtClt = vIdtClt
       and  IdtCptClt = vIdtCptClt;
  EXCEPTION
    when NO_DATA_FOUND then
      vCodeErreur := 'ERR_MAJCPT0008'; -- Le compte client n'existe pas
      raise eErr_MajCpt;
    when others then
      raise;
  END;
  if vIdtClt <> nvl(pIdtCltDst,vIdtClt) then
    vMsg := 'Recherche du client destinataire';
    select count(*)
      into vNbr
      from CLT
      where IdtClt = pIdtCltOrg;
    if vNbr = 0 then
      vCodeErreur := 'ERR_MAJCPT0007'; -- Le client n'existe pas
      raise eErr_MajCpt;
    end if;
    BEGIN
      vMsg := 'Recherche de la devise';
      select IdtDvs
        into vIdtDvs
        from CPTCLT
        where IdtClt = pIdtCltDst
         and  IdtCptClt = pIdtCptCltDst;
    EXCEPTION
      when NO_DATA_FOUND then
        vCodeErreur := 'ERR_MAJCPT0008'; -- Le compte client n'existe pas
        raise eErr_MajCpt;
      when others then
        raise;
    END;
  end if;
  vMsg := 'Recherche si l''operation existe';
  select count(*)
    into vNbr
    from OPR
    where Rfr = vRfr
     and  IdtTypOpr = pIdtTypOpr;
  if vNbr > 0 then
    vCodeErreur := 'ERR_MAJCPT0029'; -- L'operation existe deja
    raise eErr_MajCpt;
  end if;
  vIdtDvs := nvl(pIdtDvs,vIdtDvs);
  vDatCnv := nvl(pDatCnv,vDatCnv);

  --SJ F9919+9969: on controle l'existence de la ligne de caisse
  If pIdtLgnCss is not null then
   SELECT count(*)
    into vNbr
    FROM LGNCSS
    WHERE IdtAgt    = pIdtAgt
      AND IdtLgnCss = pIdtLgnCss;

      if vNbr = 0 then
         pMsg := 'Ligne de caisse non créé: ' || to_char(pIdtLgnCss); -- normalement ça n'arrive jamais ! a revoir peut-être le message ;
         vCodeErreur := 'ERR_MAJCPT0004'; -- L'encaissement n'est pas enregistre dans lgncss
         raise eErr_MajCpt;
      end if;
  end if;

  MAJOPRLTT(pModImp=>vModImp,
            pIdtAgt=>vIdtAgt,
            pIdtCltOrg=>vIdtClt,
            pIdtCptCltOrg=>vIdtCptClt,
            pRfr=>vRfr,
            pIdtTypOpr=>pIdtTypOpr,
            pIdtOpr=>vIdtOpr,
            pMnt=>vMnt,
            pDatVlr=>vDatVlr,
            pDatExg=>nvl(pDatExg,vDatVlr),
            pDatCnv=>vDatCnv,
            pIdtCltDst=>pIdtCltDst,
            pIdtCptCltDst=>pIdtCptCltDst,
            pIdtLgnCss=>pIdtLgnCss,
            pIdtOprAff=>pIdtOprAff,
            pIdtOprOrg=>pIdtOprOrg,
            pIdtDvs=>vIdtDvs,
            pIdtMtf=>pIdtMtf,
            pInfCpl=>pInfCpl,
            pIdtSit=>pIdtSit,
            pMsg=>pMsg);
  pRfr := vRfr;
  if pMsg is not null then
    raise eErr_MajCpt;
  end if;
--
-- Gestion des erreurs
--
EXCEPTION
  -- Gestion des erreurs geres
  when eERR_MAJCPT then
    if pMsg is null then
      pMsg := TRTMSG01.ChercheMsg(vCodeErreur);
      pMsg := replace(pMsg,':IdtClt',err_IdtClt);
      pMsg := replace(pMsg,':IdtCptClt',err_IdtCptClt);
      pMsg := replace(pMsg,':RfrAff',err_RfrAff);
      pMsg := replace(pMsg,':LibTypOprAff',err_LibTypOprAff);
      pMsg := replace(pMsg,':Rfr',err_Rfr);
      pMsg := replace(pMsg,':LibTypOpr',err_LibTypOpr);
      pMsg := replace(pMsg,':Mnt',err_Mnt);
      pMsg := replace(pMsg,':IdtAgt',err_IdtAgt);
      pMsg := replace(pMsg,':IdtModImp',err_IdtModImp);
      pMsg := 'X7_CRTOPR : ' || pMsg;
    end if;
  -- Gestion d'un plantage Oracle, on reenvoie le message
  -- d'erreur Oracle, sans plantage
  when others then
    vCodeErreur := 'ERR_MAJCPT9999';
    pMsg := TRTMSG01.ChercheMsg(vCodeErreur);
    pMsg := pMsg || ' - ' || vMsg || ' ' || ' - ' || SQLERRM;
    pMsg := 'X7_CRTOPR : ' || pMsg;
--
END X7_CRTOPR;


-----------------------------------------------------------------------------
-----------------------------------------------------------------------------
-----------------------------------------------------------------------------
procedure X7_ANUOPR (pIdtAgt      AGT.IdtAgt%TYPE,
                     pRfr IN OUT  OPR.Rfr%TYPE,
                     pIdtTypOpr   TYPOPR.IdtTypOpr%TYPE DEFAULT NULL,
                     pIdtOprAff   OPR.IdtOpr%TYPE,
                     pIdtOprOrg   OPR.IdtOpr%TYPE    DEFAULT NULL,
                     pMnt         OPR.Mnt%TYPE       DEFAULT NULL,
                     pDatVlr      date,
                     pIdtMtf      MTF.IdtMtf%TYPE    DEFAULT NULL,
                     pMsg IN OUT  varchar2) is
  rOPR OPR%ROWTYPE;
  vCodeErreur      SYS_MSG.Msg_Code%TYPE;
  vIdtOpr          OPR.IdtOpr%TYPE;
  vMsg             varchar2(2000);
BEGIN
  err_Mnt          := pMnt;
  err_Rfr          := pRfr;
  err_IdtClt       := null;
  err_IdtCptClt    := null;
  err_IdtAgt       := pIdtAgt;
  err_LibTypOpr    := null;
  err_RfrAff       := null;
  err_LibTypOprAff := null;
  BEGIN
    vMsg := 'Recherche operation affectee';
    select *
      into rOPR
      from OPR
      where IdtOpr = pIdtOprAff;
  EXCEPTION
    when NO_DATA_FOUND then
      err_Rfr := null;
      vCodeErreur := 'ERR_MAJCPT0004'; -- L'operation n'existe pas
      raise eErr_MajCpt;
    when others then
      raise;
  END;
  MAJOPRLTT (pModImp=>21,
             pIdtAgt=>pIdtAgt,
             pIdtCltOrg=>rOPR.IdtClt,
             pIdtCptCltOrg=>rOPR.IdtCptClt,
             pRfr=>pRfr,
             pIdtTypOpr=>pIdtTypOpr,
             pIdtOpr=>vIdtOpr,
             pMnt=>pMnt,
             pDatVlr=>pDatVlr,
             pDatExg=>pDatVlr,
             pDatCnv=>rOPR.DatCnv,
             pIdtCltDst=>rOPR.IdtClt,
             pIdtCptCltDst=>rOPR.IdtCptClt,
             pIdtOprAff=>pIdtOprAff,
             pIdtOprOrg=>pIdtOprOrg,
             pIdtDvs=>rOPR.IdtDvs,
             pIdtMtf=>pIdtMtf,
             pMsg=>pMsg);
  if pMsg is not null then
    raise eErr_MajCpt;
  end if;
--
-- Gestion des erreurs
--
EXCEPTION
  -- Gestion des erreurs geres
  when eERR_MAJCPT then
    if pMsg is null then
      pMsg := TRTMSG01.ChercheMsg(vCodeErreur);
      pMsg := replace(pMsg,':IdtClt',err_IdtClt);
      pMsg := replace(pMsg,':IdtCptClt',err_IdtCptClt);
      pMsg := replace(pMsg,':RfrAff',err_RfrAff);
      pMsg := replace(pMsg,':LibTypOprAff',err_LibTypOprAff);
      pMsg := replace(pMsg,':Rfr',err_Rfr);
      pMsg := replace(pMsg,':LibTypOpr',err_LibTypOpr);
      pMsg := replace(pMsg,':Mnt',err_Mnt);
      pMsg := replace(pMsg,':IdtAgt',err_IdtAgt);
      pMsg := replace(pMsg,':IdtModImp',err_IdtModImp);
      pMsg := 'X7_ANUOPR : ' || pMsg;
    end if;
  -- Gestion d'un plantage Oracle, on reenvoie le message
  -- d'erreur Oracle, sans plantage
  when others then
    vCodeErreur := 'ERR_MAJCPT9999';
    pMsg := TRTMSG01.ChercheMsg(vCodeErreur);
    pMsg := pMsg || ' - ' || vMsg || ' ' || ' - ' || SQLERRM;
    pMsg := 'X7_ANUOPR : ' || pMsg;
--
end X7_ANUOPR;
-----------------------------------------------------------------------------
-----------------------------------------------------------------------------
-----------------------------------------------------------------------------
procedure X7_CRTLTT (pIdtAgt AGT.IdtAgt%TYPE,
                     pIdtOpr OPR.IdtOpr%TYPE,
                     pIdtOprAff OPR.IdtOpr%TYPE,
                     pIdtOprOrg OPR.IdtOpr%TYPE,
                     pMnt OPR.Mnt%TYPE,
                     pDatVlr date,
                     pMsg IN OUT varchar2) is
  rOPR OPR%ROWTYPE;
  vMsg varchar(2000);
  vCodeErreur SYS_MSG.Msg_Code%TYPE;
  vIdtOpr OPR.IdtOpr%TYPE;
  vRfr OPR.Rfr%TYPE;
BEGIN
  err_Mnt          := null;
  err_Rfr          := null;
  err_IdtClt       := null;
  err_IdtCptClt    := null;
  err_IdtAgt       := pIdtAgt;
  err_LibTypOpr    := null;
  err_RfrAff       := null;
  err_LibTypOprAff := null;
  vIdtOpr :=pIdtOpr;
  -- On fait juste les controles pour une operation
  -- le programme MAJOPRLTT fait autres controles
  BEGIN
    vMsg := 'Recherche operation affectee';
    select *
      into rOPR
      from OPR
      where IdtOpr = pIdtOpr;
  EXCEPTION
    when NO_DATA_FOUND then
      vCodeErreur := 'ERR_MAJCPT0004'; -- L'operation n'existe pas
      raise eErr_MajCpt;
    when others then
      raise;
  END;
  -- JLD - 16/04/2009 - ajout du paramètre pMnt
  MAJOPRLTT (pModImp=>8,
             pIdtAgt=>pIdtAgt,
             pIdtCltOrg=>rOPR.IdtClt,
             pIdtCptCltOrg=>rOPR.IdtCptClt,
             pRfr=>vRfr,
             pMnt=>pMnt,
             pIdtOpr=>vIdtOpr,
             pDatVlr=>pDatVlr,
             pDatCnv=>rOPR.DatCnv,
             pIdtCltDst=>rOPR.IdtClt,
             pIdtCptCltDst=>rOPR.IdtCptClt,
             pIdtOprAff=>pIdtOprAff,
             pIdtOprOrg=>pIdtOprOrg,
             pIdtDvs=>rOPR.IdtDvs,
             pMsg=>pMsg);
--
-- Gestion des erreurs
--
EXCEPTION
  -- Gestion des erreurs geres
  when eERR_MAJCPT then
    if pMsg is null then
      pMsg := TRTMSG01.ChercheMsg(vCodeErreur);
      pMsg := replace(pMsg,':IdtClt',err_IdtClt);
      pMsg := replace(pMsg,':IdtCptClt',err_IdtCptClt);
      pMsg := replace(pMsg,':RfrAff',err_RfrAff);
      pMsg := replace(pMsg,':LibTypOprAff',err_LibTypOprAff);
      pMsg := replace(pMsg,':Rfr',err_Rfr);
      pMsg := replace(pMsg,':LibTypOpr',err_LibTypOpr);
      pMsg := replace(pMsg,':Mnt',err_Mnt);
      pMsg := replace(pMsg,':IdtAgt',err_IdtAgt);
      pMsg := replace(pMsg,':IdtModImp',err_IdtModImp);
      pMsg := 'X7_CRTLTT : ' || pMsg;
    end if;
  -- Gestion d'un plantage Oracle, on reenvoie le message
  -- d'erreur Oracle, sans plantage
  when others then
    vCodeErreur := 'ERR_MAJCPT9999';
    pMsg := TRTMSG01.ChercheMsg(vCodeErreur);
    pMsg := pMsg || ' - ' || vMsg || ' ' || ' - ' || SQLERRM;
    pMsg := 'X7_CRTLTT : ' || pMsg;

end X7_CRTLTT;
-----------------------------------------------------------------------------
-----------------------------------------------------------------------------
-----------------------------------------------------------------------------
procedure X7_ANULTT (pIdtAgt AGT.IdtAgt%TYPE,
                     pIdtLtt LTT.IdtLtt%TYPE,
                     pIdtOprOrg OPR.IdtOpr%TYPE,
                     pDatVlr date,
                     pMsg IN OUT varchar2) is
  rOPR OPR%ROWTYPE;
  rLTT LTT%ROWTYPE;
  vMsg varchar2(2000);
  vIdtOpr OPR.IdtOpr%TYPE;
  vRfr OPR.Rfr%TYPE;
  vCodeErreur SYS_MSG.Msg_Code%TYPE;
BEGIN
  err_Mnt          := null;
  err_Rfr          := null;
  err_IdtClt       := null;
  err_IdtCptClt    := null;
  err_IdtAgt       := pIdtAgt;
  err_LibTypOpr    := null;
  err_RfrAff       := null;
  err_LibTypOprAff := null;
  BEGIN
    vMsg := 'Recherche du lettrage a annuler';
    select *
      into rLTT
      from LTT
      where IdtLtt = pIdtLtt;
  EXCEPTION
    when NO_DATA_FOUND then
      vCodeErreur := 'ERR_MAJCPT0011'; -- Le lettrage n'existe pas
      raise eErr_MajCpt;
    when others then
      raise;
  END;
  -- On fait juste les controles pour une operation
  -- le programme MAJOPRLTT fait autres controles
  BEGIN
    vMsg := 'Recherche operation affectee';
    select *
      into rOPR
      from OPR
      where IdtOpr = rLTT.IdtOprDbt;
  EXCEPTION
    when NO_DATA_FOUND then
      vCodeErreur := 'ERR_MAJCPT0004'; -- L'operation n'existe pas
      raise eErr_MajCpt;
    when others then
      raise;
  END;
  MAJOPRLTT (pModImp=>22,
             pIdtAgt=>pIdtAgt,
             pIdtCltOrg=>rOPR.IdtClt,
             pIdtCptCltOrg=>rOPR.IdtCptClt,
             pRfr=>vRfr,
             pIdtLtt=>pIdtLtt,
             pIdtOpr=>vIdtOpr,
             pDatVlr=>pDatVlr,
             pIdtCltDst=>rOPR.IdtClt,
             pIdtCptCltDst=>rOPR.IdtCptClt,
             pIdtOprOrg=>pIdtOprOrg,
             pMsg=>pMsg);
--
-- Gestion des erreurs
--
EXCEPTION
  -- Gestion des erreurs geres
  when eERR_MAJCPT then
    if pMsg is null then
      pMsg := TRTMSG01.ChercheMsg(vCodeErreur);
      pMsg := replace(pMsg,':IdtClt',err_IdtClt);
      pMsg := replace(pMsg,':IdtCptClt',err_IdtCptClt);
      pMsg := replace(pMsg,':RfrAff',err_RfrAff);
      pMsg := replace(pMsg,':LibTypOprAff',err_LibTypOprAff);
      pMsg := replace(pMsg,':Rfr',err_Rfr);
      pMsg := replace(pMsg,':LibTypOpr',err_LibTypOpr);
      pMsg := replace(pMsg,':Mnt',err_Mnt);
      pMsg := replace(pMsg,':IdtAgt',err_IdtAgt);
      pMsg := replace(pMsg,':IdtModImp',err_IdtModImp);
      pMsg := 'X7_CRTLTT : ' || pMsg;
    end if;
  -- Gestion d'un plantage Oracle, on reenvoie le message
  -- d'erreur Oracle, sans plantage
  when others then
    vCodeErreur := 'ERR_MAJCPT9999';
    pMsg := TRTMSG01.ChercheMsg(vCodeErreur);
    pMsg := pMsg || ' - ' || vMsg || ' ' || ' - ' || SQLERRM;
    pMsg := 'X7_CRTLTT : ' || pMsg;
--
END;
-----------------------------------------------------------------------------
-----------------------------------------------------------------------------
-----------------------------------------------------------------------------
procedure X7_MAJCPTTRA (pIdtLgnTra LGNTRA.IdtLgnTra%TYPE,
                        pMsg IN OUT varchar2) is
  cursor cLGNTRA is
    select RowId IdRow, LGNTRA.*
      from LGNTRA
      where IdtLgnTra = pIdtLgnTra
      order by IdtDetLgn;
  vLgn                   number := 0;
  vNbr                   number;
  vIdtClt                CLT.IdtClt%TYPE;
  vIdtCptClt             CPTCLT.IdtCptClt%TYPE;
  vModImp                MODIMP.IdtModImp%TYPE;
  vIdtCltOrg             CLT.IdtClt%TYPE;
  vIdtCptCltOrg          CPTCLT.IdtCptClt%TYPE;
  vDatCnv                date;
  vIdtCltDst             CLT.IdtClt%TYPE;
  vIdtCptCltDst          CPTCLT.IdtCptClt%TYPE;
  vIdtTypOpr             TYPOPR.IdtTypOpr%TYPE;
  vIdtOprOrg             OPR.IdtOpr%TYPE := null;
  vIdtOpr                OPR.IdtOpr%TYPE := null;
  vIdtDvs                DVS.IdtDvs%TYPE;
  vCodeErreur            SYS_MSG.Msg_Code%TYPE;
  vMsg                   varchar2(2000);
  vRfr                   OPR.Rfr%TYPE;
  vPrfx                  TYPOPR.Prfx%TYPE;
  vIdtTabSeq             TABSEQ.IdtTabSeq%TYPE;
  vPadCar                TYPOPR.PadCar%TYPE;
  vNbCar                 TYPOPR.NbCar%TYPE;
  vMnt                   OPR.Mnt%TYPE;
  vNbrEch                number;
  vSprCdf                PRMGNR.SprCdf%TYPE;
BEGIN
  vNbrEch          := 0;
  for rLgnTra in cLGNTRA loop
    vRfr := null;
--    vIdtOpr := null;
    vLgn := vLgn + 1;  -- Controle pour savoir s'il y a des lignes
    err_Mnt          := rLGNTRA.Mnt;
    err_Rfr          := rLGNTRA.Rfr;
    err_IdtClt       := rLGNTRA.IdtCltOrg;
    err_IdtCptClt    := rLGNTRA.IdtCptCltOrg;
    err_IdtAgt       := rLGNTRA.IdtAgt;
    err_LibTypOpr    := null;
    err_RfrAff       := null;
    err_LibTypOprAff := null;
    -- On prend le client de la premiere ligne
    if vLgn = 1 then
      vIdtCltOrg := rLgnTra.IdtCltOrg;
      vIdtCptCltOrg := rLGNTRA.IdtCptCltOrg;
      select count(*)
        into vNbr
        from CLT
        where IdtClt = rLGNTRA.IdtCltOrg;
      if vNbr = 0 then
        vCodeErreur := 'ERR_MAJCPT0007'; -- Le client n'existe pas
        raise eErr_MajCpt;
      end if;
      BEGIN
        vMsg := 'Recherche de la devise';
        select IdtDvs
          into vIdtDvs
          from CPTCLT
          where IdtClt = rLGNTRA.IdtCltOrg
           and  IdtCptClt = rLGNTRA.IdtCptCltOrg;
      EXCEPTION
        when NO_DATA_FOUND then
          vCodeErreur := 'ERR_MAJCPT0008'; -- Le compte client n'existe pas
          raise eErr_MajCpt;
        when others then
          raise;
      END;
      vMsg := 'Recherche de la date de conversion';
      vDatCnv := DatCnvDvsJou(vIdtDvs);
    end if; -- vLgn = 1
    if rLGNTRA.IdtTypOpr is not null then
      BEGIN
        vMsg := 'Recherche type d''operation';
        select IdtModImp, Lib, IdtTabSeq, Prfx, PadCar, NbCar
          into vModImp, err_LibTypOpr, vIdtTabSeq, vPrfx, vPadCar, vNbCar
          from TYPOPR
          where IdtTypOpr = rLGNTRA.IdtTypOpr;
      EXCEPTION
        when NO_DATA_FOUND then
          vCodeErreur := 'ERR_MAJCPT0003'; -- Le type d'operation n'existe pas
          raise eErr_MajCpt;
        when others then
          raise;
      END;
    end if;
    if rLGNTRA.IdtTypTrt <> 4 then
      if rLGNTRA.IdtCltDst <> vIdtCltOrg or rLGNTRA.IdtCptCltDst <> vIdtCptCltOrg then
        vCodeErreur := 'ERR_MAJCPT0024'; -- L'operation n'est pas autorisee entre plusieurs clients
        raise eErr_MajCpt;
      end if;
    end if;
    if rLGNTRA.IdtOprAff is not null then
      BEGIN
        vMsg := 'Recherche Id de l''operation affectee';
        select IdtClt, IdtCptClt, Rfr, IdtTypOpr
          into vIdtClt, vIdtCptClt, vRfr, vIdtTypOpr
          from OPR
          where IdtOpr = rLGNTRA.IdtOprAff;
        err_RfrAff := vRfr;
      EXCEPTION
        when NO_DATA_FOUND then
          vCodeErreur := 'ERR_MAJCPT0004'; -- L'operation n'existe pas
          err_Rfr := null;
          err_LibTypOpr := null;
          raise eErr_MajCpt;
        when others then
          raise;
      END;
      BEGIN
        vMsg := 'Recherche du type d''operation affectee';
        select Lib
          into err_LibTypOprAff
          from TYPOPR
          where IdtTypOpr = vIdtTypOpr;
      EXCEPTION
        when NO_DATA_FOUND then
          vCodeErreur := 'ERR_MAJCPT0003'; -- Le type d'operation n'existe pas
          err_LibTypOpr := vIdtTypOpr;
          raise eErr_MajCpt;
        when others then
          raise;
      END;
      if vIdtClt <> vIdtCltOrg or vIdtCptClt <> vIdtCptCltOrg then
        vCodeErreur := 'ERR_MAJCPT0023'; -- L'operation ne corresponde pas au client
        err_Rfr := vRfr;
        err_LibTypOpr := err_LibTypOprAff;
        raise eErr_MajCpt;
      end if;
    end if;
    case
      when rLGNTRA.IdtTypTrt = 1 then
        if vModImp is null then
          vCodeErreur := 'ERR_MAJCPT0003'; -- Le type d'operation n'existe pas
          raise eErr_MajCpt;
        end if;
        if rLGNTRA.Rfr is not null then
          select count(*)
            into vNbr
            from OPR
            where Rfr = rLGNTRA.Rfr
             and  IdtTypOpr = rLGNTRA.IdtTypOpr;
          if vNbr > 0 then
            vCodeErreur := 'ERR_MAJCPT0029'; -- L'operation existe deja
            raise eErr_MajCpt;
          end if;
        end if;
        if vModImp = 6 then
          vNbrEch := vNbrEch + 1;
          if rLGNTRA.Rfr is null then
            if vSprCdf is null then
              select SprCdf
                into vSprCdf
                from PRMGNR;
            end if;
            if vPrfx is not null then
              rLGNTRA.Rfr := vPrfx || vSprCdf || rLGNTRA.EchPmt || vSprCdf || vNbrEch;
            else
              rLGNTRA.Rfr := rLGNTRA.EchPmt || vSprCdf || vNbrEch;
            end if;
          end if;
        end if;
        -- Pour les remboursements, on ne fait rien, on prend le montant pour faire
        -- un controle lors de l'affectation. L'operation de remboursement
        -- et l'affectation sont faites dans une seule appel
        if vModImp = 13 then
          vMnt := rLGNTRA.Mnt;
        else
          MAJOPRLTT(pModImp=>vModImp,
                    pIdtAgt=>rLGNTRA.IdtAgt,
                    pIdtCltOrg=>rLGNTRA.IdtCltOrg,
                    pIdtCptCltOrg=>rLGNTRA.IdtCptCltOrg,
                    pRfr=>rLGNTRA.Rfr,
                    pIdtTypOpr=>rLGNTRA.IdtTypOpr,
                    pIdtOpr=>vIdtOpr,
                    pMnt=>rLGNTRA.Mnt,
                    pDatVlr=>rLGNTRA.DatVlr,
                    pDatExg=>rLGNTRA.DatExg,
                    pDatCnv=>vDatCnv,
                    pIdtCltDst=>rLGNTRA.IdtCltDst,
                    pIdtCptCltDst=>rLGNTRA.IdtCptCltDst,
                    pIdtOprOrg=>vIdtOprOrg,
                    pIdtDvs=>vIdtDvs,
                    pIdtMtf=>rLGNTRA.IdtMtf,
                    pInfCpl=>rLGNTRA.InfCpl,
                    pMsg=>pMsg);
          if pMsg is not null then
            raise eErr_MajCpt;
          end if;
          vIdtOprOrg := nvl(vIdtOprOrg,vIdtOpr);
        end if; -- vModImp = 13
      when rLGNTRA.IdtTypTrt = 2 then
        -- Pour certains operations, il faut reinitialiser l'IdtOpr
        if rLGNTRA.IdtTypOpr in (15,16) then
          vIdtOpr := null;
        end if;
        -- Controles pour l'operation que en affecte
        if vModImp <> 5 then
          -- Pour le cas des remboursements, la premiere ligne de LGNTRA
          -- contient le montant total du remboursement. On fait le controle
          -- entre le montant total du remboursement
          if vModImp = 13 then
            if vMnt <> rLGNTRA.Mnt then
              vCodeErreur := 'ERR_MAJCPT0051'; -- Le montant total de l'operation est different du montant affecte
              raise eErr_MajCpt;
            end if; -- vMnt <> rLGNTRA.Mnt
          elsif vModImp <> 11 then
            if rLGNTRA.Rfr is not null then
              BEGIN
                vMsg := 'Recherche Id de l''operation';
                select IdtOpr, IdtClt, IdtCptClt
                  into vIdtOpr, vIdtClt, vIdtCptClt
                  from OPR
                  where Rfr = rLGNTRA.Rfr
                   and  IdtTypOpr = rLGNTRA.IdtTypOpr;
                vRfr := rLGNTRA.Rfr;
              EXCEPTION
                when NO_DATA_FOUND then
                  vCodeErreur := 'ERR_MAJCPT0004'; -- L'operation n'existe pas
                  raise eErr_MajCpt;
                when others then
                  raise;
              END;
            else
              BEGIN
                vMsg := 'Recherche Rfr de l''operation';
                select Rfr, IdtClt, IdtCptClt
                  into vRfr, vIdtClt, vIdtCptClt
                  from OPR
                  where IdtOpr = vIdtOpr;
                err_Rfr := vRfr;
              EXCEPTION
                when NO_DATA_FOUND then
                  vCodeErreur := 'ERR_MAJCPT0004'; -- L'operation n'existe pas
                  raise eErr_MajCpt;
                when others then
                  raise;
              END;
            end if; -- rLGNTRA.Rfr is not null
          end if; -- vModImp = 13
        else
          BEGIN
            select IdtClt, IdtCptClt
              into vIdtClt, vIdtCptClt
              from ECHPMT
              where EchPmt = rLGNTRA.EchPmt;
          EXCEPTION
            when NO_DATA_FOUND then
              vCodeErreur := 'ERR_MAJCPT0004'; -- L'operation n'existe pas
              err_Rfr := rLGNTRA.EchPmt;
              raise eErr_MajCpt;
            when others then
              raise;
          END;
        end if;
        if vIdtClt <> vIdtCltOrg or vIdtCptClt <> vIdtCptCltOrg then
          vCodeErreur := 'ERR_MAJCPT0023'; -- L'operation ne corresponde pas au client
          raise eErr_MajCpt;
        end if;
        -- Dans le cas des echeanciers, pour la premier ligne
        -- on cherche le montant total pour inserer l'operation
        if rLGNTRA.IdtDetLgn = 1 then
          if vModImp = 5 then
            vMsg := 'Recherche la somme des affectations';
            select sum(Mnt)
              into vMnt
              from LGNTRA
              where IdtLgnTra = rLGNTRA.IdtLgnTra
               and  IdtTypTrt = rLGNTRA.IdtTypTrt
               and  IdtTypOpr = rLGNTRA.IdtTypOpr;
            if rLGNTRA.Rfr is null then
              if vSprCdf is null then
                select SprCdf
                  into vSprCdf
                  from PRMGNR;
              end if;
              if vPrfx is not null then
                rLGNTRA.Rfr := vPrfx || vSprCdf || to_char(rLGNTRA.EchPmt);
              else
                rLGNTRA.Rfr := to_char(rLGNTRA.EchPmt);
              end if;
            end if;
            vMsg := 'Recherche si l''operation existe';
            select count(*)
              into vNbr
              from OPR
              where Rfr = rLGNTRA.Rfr
               and  IdtTypOpr = rLGNTRA.IdtTypOpr;
            if vNbr > 0 then
              vCodeErreur := 'ERR_MAJCPT0029'; -- L'operation existe deja
              raise eErr_MajCpt;
            end if;
            vMsg := 'Appel du programme de compte client';
            MAJOPRLTT(pModImp=>vModImp,
                      pIdtAgt=>rLGNTRA.IdtAgt,
                      pIdtCltOrg=>rLGNTRA.IdtCltOrg,
                      pIdtCptCltOrg=>rLGNTRA.IdtCptCltOrg,
                      pRfr=>rLGNTRA.Rfr,
                      pIdtTypOpr=>rLGNTRA.IdtTypOpr,
                      pIdtOpr=>vIdtOpr,
                      pMnt=>-vMnt,
                      pDatVlr=>rLGNTRA.DatVlr,
                      pDatExg=>rLGNTRA.DatVlr,
                      pDatCnv=>vDatCnv,
                      pIdtCltDst=>rLGNTRA.IdtCltDst,
                      pIdtCptCltDst=>rLGNTRA.IdtCptCltDst,
                      pIdtDvs=>vIdtDvs,
                      pIdtMtf=>rLGNTRA.IdtMtf,
                      pInfCpl=>rLGNTRA.InfCpl,
                      pMsg=>pMsg);
            if pMsg is not null then
              raise eErr_MajCpt;
            end if;
            vIdtOprOrg := nvl(vIdtOprOrg,vIdtOpr);
          end if; -- vModImp = 5
        end if; -- rLGNTRA.IdtDetLgn = 1
        -- Pout tous les cas, sauf pour le remboursement et le changement de situation, le mode d'imputation est = 8
        if vModImp not in (11, 13) then
          vModImp := 8;
        end if;
        vMsg := 'Appel du programme de compte client';
        MAJOPRLTT(pModImp=>vModImp,
                  pIdtAgt=>rLGNTRA.IdtAgt,
                  pIdtCltOrg=>rLGNTRA.IdtCltOrg,
                  pIdtCptCltOrg=>rLGNTRA.IdtCptCltOrg,
                  pRfr=>rLGNTRA.Rfr,
                  pIdtTypOpr=>rLGNTRA.IdtTypOpr,
                  pIdtOpr=>vIdtOpr,
                  pMnt=>rLGNTRA.Mnt,
                  pDatVlr=>rLGNTRA.DatVlr,
                  pDatExg=>rLGNTRA.DatExg,
                  pDatCnv=>vDatCnv,
                  pIdtCltDst=>rLGNTRA.IdtCltDst,
                  pIdtCptCltDst=>rLGNTRA.IdtCptCltDst,
                  pIdtOprAff=>rLGNTRA.IdtOprAff,
                  pIdtOprOrg=>vIdtOprOrg,
                  pIdtDvs=>vIdtDvs,
                  pIdtMtf=>rLGNTRA.IdtMtf,
                  pInfCpl=>rLGNTRA.InfCpl,
                  pIdtSit=>rLGNTRA.IdtSit,
                  pMsg=>pMsg);
        if pMsg is not null then
          raise eErr_MajCpt;
        end if;
      when rLGNTRA.IdtTypTrt = 3 then
        if rLGNTRA.IdtOprAff is not null then
          vModImp := 21;
        else
          vModImp := 22;
        end if;
        vMsg := 'Appel du programme de compte client';
        MAJOPRLTT(pModImp=>vModImp,
                  pIdtAgt=>rLGNTRA.IdtAgt,
                  pIdtCltOrg=>rLGNTRA.IdtCltOrg,
                  pIdtCptCltOrg=>rLGNTRA.IdtCptCltOrg,
                  pRfr=>rLGNTRA.Rfr,
                  pIdtTypOpr=>rLGNTRA.IdtTypOpr,
                  pIdtOpr=>vIdtOpr,
                  pDatVlr=>rLGNTRA.DatVlr,
                  pMnt=>rLGNTRA.Mnt,
                  pIdtCltDst=>rLGNTRA.IdtCltDst,
                  pIdtCptCltDst=>rLGNTRA.IdtCptCltDst,
                  pIdtOprAff=>rLGNTRA.IdtOprAff,
                  pIdtOprOrg=>vIdtOprOrg,
                  pIdtLtt=>rLGNTRA.IdtLtt,
                  pIdtMtf=>rLGNTRA.IdtMtf,
                  pInfCpl=>rLGNTRA.InfCpl,
                  pMsg=>pMsg);
        if pMsg is not null then
          raise eErr_MajCpt;
        end if;
      when rLGNTRA.IdtTypTrt = 4 then
        vIdtOpr := null;
        vMsg := 'Recherche du client destinataire';
        select count(*)
          into vNbr
          from CLT
          where IdtClt = rLGNTRA.IdtCltDst;
        if vNbr = 0 then
          err_IdtClt := rLGNTRA.IdtCltDst;
          vCodeErreur := 'ERR_MAJCPT0007'; -- Le client n'existe pas
          raise eErr_MajCpt;
        end if;
        BEGIN
          vMsg := 'Recherche de la devise';
          select IdtDvs
            into vIdtDvs
            from CPTCLT
            where IdtClt = rLGNTRA.IdtCltDst
             and  IdtCptClt = rLGNTRA.IdtCptCltDst;
        EXCEPTION
          when NO_DATA_FOUND then
            vCodeErreur := 'ERR_MAJCPT0008'; -- Le compte client n'existe pas
            raise eErr_MajCpt;
          when others then
            raise;
        END;
        if vModImp = 9 then
          vMsg := 'Appel du programme de compte client';
          MAJOPRLTT(pModImp=>vModImp,
                    pIdtAgt=>rLGNTRA.IdtAgt,
                    pIdtCltOrg=>rLGNTRA.IdtCltOrg,
                    pIdtCptCltOrg=>rLGNTRA.IdtCptCltOrg,
                    pRfr=>rLGNTRA.Rfr,
                    pIdtTypOpr=>rLGNTRA.IdtTypOpr,
                    pIdtOpr=>vIdtOpr,
                    pMnt=>RLGNTRA.Mnt,
                    pDatVlr=>rLGNTRA.DatVlr,
                    pDatExg=>rLGNTRA.DatExg,
                    pDatCnv=>vDatCnv,
                    pIdtCltDst=>rLGNTRA.IdtCltDst,
                    pIdtCptCltDst=>rLGNTRA.IdtCptCltDst,
                    pIdtOprAff=>rLGNTRA.IdtOprAff,
                    pIdtDvs=>vIdtDvs,
                    pIdtMtf=>rLGNTRA.IdtMtf,
                    pInfCpl=>rLGNTRA.InfCpl,
                    pMsg=>pMsg);
          if pMsg is not null then
            raise eErr_MajCpt;
          end if;
        else
          pMsg := 'Cette fonctionnalité n''est pas encore disponible!!!';
          raise eErr_MajCpt;
        end if;
      else
        vCodeErreur := 'ERR_MAJCPT0030'; -- Le type de transaction n'existe pas
        raise eErr_MajCpt;
    end case;
    if vLgn = 0 then
      vCodeErreur := 'ERR_MAJCPT0001'; -- La reference de la transaction n'existe pas
      raise eErr_MajCpt;
    end if;
    delete LGNTRA
      where RowId = rLGNTRA.IdRow;
  end loop; -- rLgnTra in cLGNTRA
--
-- Gestion des erreurs
--
EXCEPTION
  -- Gestion des erreurs geres
  when eERR_MAJCPT then
    if pMsg is null then
      pMsg := TRTMSG01.ChercheMsg(vCodeErreur);
      pMsg := replace(pMsg,':IdtClt',err_IdtClt);
      pMsg := replace(pMsg,':IdtCptClt',err_IdtCptClt);
      pMsg := replace(pMsg,':RfrAff',err_RfrAff);
      pMsg := replace(pMsg,':LibTypOprAff',err_LibTypOprAff);
      pMsg := replace(pMsg,':Rfr',err_Rfr);
      pMsg := replace(pMsg,':LibTypOpr',err_LibTypOpr);
      pMsg := replace(pMsg,':Mnt',err_Mnt);
      pMsg := replace(pMsg,':IdtAgt',err_IdtAgt);
      pMsg := replace(pMsg,':IdtModImp',err_IdtModImp);
      pMsg := 'X7_MAJCPTTRA : ' || pMsg;
    end if;
  -- Gestion d'un plantage Oracle, on reenvoie le message
  -- d'erreur Oracle, sans plantage
  when others then
    vCodeErreur := 'ERR_MAJCPT9999';
    pMsg := TRTMSG01.ChercheMsg(vCodeErreur);
    pMsg := pMsg || ' - ' || vMsg || ' ' || ' - ' || SQLERRM;
    pMsg := 'X7_MAJCPTTRA : ' || pMsg;
--
END X7_MAJCPTTRA;
-----------------------------------------------------------------------------
-----------------------------------------------------------------------------
-----------------------------------------------------------------------------
procedure MAJOPRLTT (pModImp                MODIMP.IdtModImp%TYPE  DEFAULT NULL,
                     pIdtAgt                AGT.IdtAgt%TYPE,
                     pIdtCltOrg             CLT.IdtClt%TYPE        DEFAULT NULL,
                     pIdtCptCltOrg          CPTCLT.IdtCptClt%TYPE  DEFAULT NULL,
                     pRfr          IN OUT   OPR.Rfr%TYPE,
                     pIdtTypOpr             TYPOPR.IdtTypOpr%TYPE  DEFAULT NULL,
                     pIdtOpr       IN OUT   OPR.IdtOpr%TYPE,
                     pMnt                   OPR.Mnt%TYPE           DEFAULT NULL,
                     pDatVlr                date                   DEFAULT NULL,
                     pDatExg                date                   DEFAULT NULL,
                     pDatCnv                date                   DEFAULT NULL,
                     pIdtCltDst             CLT.IdtClt%TYPE        DEFAULT NULL,
                     pIdtCptCltDst          CPTCLT.IdtCptClt%TYPE  DEFAULT NULL,
                     pIdtOprAff             OPR.IdtOpr%TYPE        DEFAULT NULL,
                     pIdtLtt                LTT.IdtLtt%TYPE        DEFAULT NULL,
                     pIdtLgnCss             LGNCSS.IdtLgnCss%TYPE  DEFAULT NULL,
                     pIdtOprOrg             OPR.IdtOpr%TYPE        DEFAULT NULL,
                     pIdtDvs                DVS.IdtDvs%TYPE        DEFAULT NULL,
                     pIdtMtf                MTF.IdtMtf%TYPE        DEFAULT NULL,
                     pInfCpl                OPR.InfCpl%TYPE        DEFAULT NULL,
                     pIdtSit                SIT.IdtSit%TYPE        DEFAULT NULL,
                     pMsg          IN OUT   varchar2) is
-- Declaration des types
  TYPE TypCursor is REF CURSOR;
  TYPE typTabIdtOpr is table of OPR.IdtOpr%TYPE index by binary_integer;
  TYPE typTabMnt is table of OPR.Mnt%TYPE index by binary_integer;
  TYPE typTabOpr is table of OPR%ROWTYPE index by binary_integer;
  TYPE typTabIdtLtt is table of LTT.IdtLtt%TYPE index by binary_integer;
  TYPE typTabIdtTypOpr is table of TYPOPR.IdtTypOpr%TYPE index by binary_integer;
-- Declaration des variables
  cCur             TypCursor;             -- Cursor generique
  tIdtOpr          typTabIdtOpr;
  tMnt             typTabMnt;
  tSld             typTabMnt;
  tIdtOprCrt       typTabIdtOpr;
  tMntCrt          typTabMnt;
  tSldCrt          typTabMnt;
--  tOpr             typTabOpr;
--  tOprCrt          typTabOpr;
  tIdtLtt          typTabIdtLtt;
  tIdtTypOpr       typTabIdtTypOpr;
  vCodeErreur      SYS_MSG.Msg_Code%TYPE; -- Code d'erreur
  vMsg             varchar2(2000);         -- Message a envoyer en cas de plantage Oracle
  vNbr             number;                -- Compteur
  vNbr2            number;                -- Compteur
  vSqcOpr          OPR.IdtOpr%TYPE;       -- Sequence de l'operation qui en affecte
  vSqcOrg          OPR.IdtOpr%TYPE;       -- Sequence de l'operation d'Origine
  vSqcOprAff       OPR.IdtOpr%TYPE;       -- Sequence de l'operation affectee
  vSqcRtg          OPR.IdtOpr%TYPE;       -- Sequence de l'operation de routage
  vIdtTypOprRtg    TYPOPR.IdtTypOpr%TYPE;
  vIdtTypFct       TYPFCT.IdtTypFct%TYPE; -- Type de facture
  vIdtCtr          CTR.IdtCtr%TYPE;       -- Contrat
  vMnt             OPR.Mnt%TYPE;          -- Montant
  vMntLtt          LTT.Mnt%TYPE;          -- Montant du lettrage
  vMntLttRes       LTT.Mnt%TYPE;          -- Solde du montant pour affecter
  vMntDvs          OPR.Mnt%TYPE;          -- Montant en devise
  vRfr             OPR.Rfr%TYPE;          -- Reference de l'operation
  vRfr2            OPR.Rfr%TYPE;          -- Reference de l'operation
  vRfrAff          OPR.Rfr%TYPE;          -- Reference de l'operation affectee
  vIdtTypOprLstDbt TYPOPR.IdtTypOpr%TYPE; -- Type d'operation du dernier debit
  vIdtTypOprAff    TYPOPR.IdtTypOpr%TYPE; -- Type de l'operation affectee
  vIdtOprLstDbt    OPR.IdtOpr%TYPE;       -- Idt du dernier debit
  vIdtTypOpr       TYPOPR.IdtTypOpr%TYPE;
  vIdtTypOprAnl    TYPOPR.IdtTypOpr%TYPE;
  vRfrLstDbt       OPR.Rfr%TYPE;
  vSld             OPR.Sld%TYPE;
  vSldOprAff       OPR.Sld%TYPE;
  vMntOprAff       OPR.Mnt%TYPE;
  vIdtClt          CLT.IdtClt%TYPE;
  vIdtDvs          DVS.IdtDvs%TYPE;
  vIdtNatRglAff    NATRGL.IdtNatRgl%TYPE;
  vCr              number;
  vDatCnv          date;
  vDatVlr          date;
  vIdtOpr          OPR.IdtOpr%TYPE;
  vIdtOprAff       OPR.IdtOpr%TYPE;
  vIdtSitAff       SIT.IdtSit%TYPE;
  vIdtOpr2         OPR.IdtOpr%TYPE;
  vIdtOprOrg       OPR.IdtOpr%TYPE := null;
  vDbtCrt          TYPOPR.DbtCrt%TYPE;
  vDbtCrtAff       TYPOPR.DbtCrt%TYPE;
  vIdtTabSeq       TABSEQ.IdtTabSeq%TYPE;
  vNbCar           number;
  vPadCar          TYPOPR.PadCar%TYPE;
  vPrfx            TYPOPR.Prfx%TYPE;
  vSprCdf          PRMGNR.SprCdf%TYPE;
  vIdtSqcGnr       NOTE.IdtSqcGnr%TYPE;
  vMode            number;
  vEchPmt          ECHPMT.EchPmt%TYPE;
  vIdtStaMns       STAMNS.IdtStaMns%TYPE;
  vMntTotMns       OPR.Mnt%TYPE;
  vMntSldMns       OPR.Mnt%TYPE;
  vModImpAff       MODIMP.IdtModImp%TYPE;
  -- Variables pour l'information bancaire
  vIdtRcvTyp       RCVTYP.IdtRcvTyp%TYPE;
  vIdtModRgl       MODRGL.IdtModRgl%TYPE;
  vIdtModRcv       MODRCV.IdtModRcv%TYPE;
  vIdtBnq          BNQ.IdtBnq%TYPE;
  vIdtGch          GCH.IdtGch%TYPE;
  vNumCptBnc       OPR.NumCptBnc%TYPE;
  vCleRib          OPR.CleRib%TYPE;
  vNomCptBnc       OPR.NomCptBnc%TYPE;
  vIBAN            OPR.IBAN%type; 
  vBIC             OPR.BIC%type;
  vIdtSit          SIT.IdtSit%TYPE;
  -- HNG 19/08/2   004 - Fiche 3232, actualisation des variables pour le trt specifique
  vIdtOprDbt       OPR.IdtOpr%TYPE;       -- Operation debitrice
  vRfrDbt          OPR.Rfr%TYPE;          -- Reference operation debitrice
  vIdtTypOprDbt    TYPOPR.IdtTypOpr%TYPE; -- Type d'operation debitrice
  vIdtOprCrt       OPR.IdtOpr%TYPE;       -- Operation creditrice
  vRfrCrt          OPR.Rfr%TYPE;          -- Reference operation creditrice
  vIdtTypOprCrt    TYPOPR.IdtTypOpr%TYPE; -- Type d'operation creditrice
  vIdtLtt          LTT.IdtLtt%TYPE;       -- Id du lettrage
  vModImp          MODIMP.IdtModImp%TYPE;
  vModImpDbt       MODIMP.IdtModImp%TYPE;
  vModImpCrt       MODIMP.IdtModImp%TYPE;
  -- End HNG
  vIdtPrdMns       CTRFAC.IdtPrdFac%TYPE;
  vIdtOprFac       OPR.IdtOpr%TYPE;
  vEchReg          ECHPMT.EchPmt%TYPE;
  vDebitsNonSolde  OPR.Rfr%type; --SJ 27/07/09 - fiche #7559
  vRfrChgSitDbt    OPR.Rfr%type; --SJ 27/07/09 - fiche #7559
  vRfrChgSitCrt    OPR.Rfr%type; --SJ 27/07/09 - fiche #7559

  vNumDev          FAC.NUMDEV%TYPE; -- Numéro de devis
  --vOprPresent      Number(1);

  -- BPZ 7663
  vIdtCss          OPR.IdtCss%type;
  -- SJ traitement de la fiche 9512 le 10/04/2012:
  vNbrRtrImp       PRMGNR.NbrRtrImp%type;
  ----------------------------------------------------------------------------------------
  --  Declaration de la requete de selection des ligne de caisse d'un Idt Ligne de caisse
  ----------------------------------------------------------------------------------------
-- Bug de la caisse. On va verifier que la somme des montants des operations
-- encaisses est strictement egale au montant de l'encaissement
-- !!!!! Atention: A verifier avec la gestion multidevise!!!!!!!
  CURSOR cLgnCss IS
    SELECT LGNCSS.*, sum(Mnt) over (partition by IdtLgnCss) MntTotOpr
    FROM LGNCSS
    WHERE IdtAgt    = pIdtAgt
      AND IdtLgnCss = pIdtLgnCss;
  rLgnCss cLgnCss%ROWTYPE;                  -- Enregistrement de ligne de caisse
  rOPR    OPR%ROWTYPE;
  rLTT    LTT%ROWTYPE;
BEGIN

  X7.X7UTIL.TRACE(' pRfr :' || pRfr);

  pMsg := null;
  vMsg := null;
  vDatVlr := pDatVlr;
  if pModImp is null then
    if pIdtTypOpr is not null then
      select IdtModImp
        into vModImp
        from TYPOPR
        where IdtTypOpr = pIdtTypOpr;
    end if;
  end if;
  vModImp := nvl(pModImp,vModImp);
  --
  -- mise a jour de la date de dernière mise a jour du compte client
  --  pour déclenchement de la mise à jour en batch des soldes
  --
  vMsg := 'Mise a jour de la date de derniere mise a jour du compte client origin';
  UPDATE CPTCLT
    SET DatMajCptClt = SYSDATE
    WHERE idtclt    = pIdtCltOrg
    AND idtcptclt = pIdtCptCltOrg;
  if pIdtCltOrg <> nvl(pIdtCltDst,pIdtCltOrg) or pIdtCptCltOrg <> nvl(pIdtCptCltDst,pIdtCptCltOrg) then
    vMsg := 'Mise a jour de la date de derniere mise a jour du compte client origin';
    UPDATE CPTCLT
      SET DatMajCptClt = SYSDATE
      WHERE idtclt    = pIdtCltDst
      AND idtcptclt = pIdtCptCltDst;
  end if;
  -- Remplissage des variables pour la gestion des erreurs
  err_Mnt          := pMnt;
  err_Rfr          := pRfr;
  err_IdtClt       := pIdtCltOrg;
  err_IdtCptClt    := pIdtCptCltOrg;
  err_IdtAgt       := pIdtAgt;
  err_IdtModImp    := vModImp;
  -- Controle sur la situation
  if pIdtSit is not null then
    select count(*)
      into vNbr
      from SIT
      where IdtSit = pIdtSit;
    if vNbr = 0  then
      vCodeErreur := 'ERR_MAJCPT0052'; -- La situation n'existe pas
      raise eErr_MajCpt;
    end if;
  end if;
  if pIdtTypOpr is not null and pIdtTypOpr <> 1 then
    vMsg := 'Recherche type d''operation';
    BEGIN
      select Prfx, DbtCrt, Lib, IdtTabSeq, NbCar, PadCar
        into vPrfx, vDbtCrt, err_LibTypOpr, vIdtTabSeq, vNbCar, vPadCar
        from TYPOPR
        where IdtTypOpr = pIdtTypOpr;
      vIdtTypOpr := pIdtTypOpr;
    EXCEPTION
      when NO_DATA_FOUND then
        vCodeErreur := 'ERR_MAJCPT0003'; -- Le type d'operation n'existe pas
        err_LibTypOpr := pIdtTypOpr;
        raise eErr_MajCpt;
      when others then
        raise;
    END;
    select SprCdf
      into vSprCdf
      from PRMGNR;
  end if;
  -----------------------------------------------------------------------------
  -- CONTROLES
  -----------------------------------------------------------------------------
  -- Le client origin et destinataire sont le meme sauf pour les operation du
  -- type transfert
  if vModImp <> 9 then
    if pIdtCltOrg <> nvl(pIdtCltDst,pIdtCltOrg) then
      vCodeErreur := 'ERR_MAJCPT0024'; -- L'operation n'est pas autorise sur plusieurs comptes client
      raise eERR_MAJCPT;
    end if;
  end if;
  if pIdtTypOpr <> 1 and pIdtOprAff is null then
    if pMnt > 0 and vDbtCrt = 'C' then
      vCodeErreur := 'ERR_MAJCPT0015'; -- Une operation creditrice ne peut pas etre positive
      raise eErr_MajCpt;
    end if;
    if pMnt < 0  and vDbtCrt = 'D' then
      vCodeErreur := 'ERR_MAJCPT0016'; -- Une operation debitrice ne peut pas etre negative
      raise eErr_MajCpt;
    end if;
  end if;
  if pIdtOprAff is not null then
    vMsg := 'Recherche type d''operation affectee';
    select OPR.Rfr, TYPOPR.Lib, TYPOPR.IdtTypOpr, TYPOPR.DbtCrt, OPR.Sld, OPR.Mnt, OPR.IdtNatRgl, OPR.EchPmt, TYPOPR.IdtModImp, OPR.DatCnv, OPR.IdtDvs, OPR.IdtSit
      into vRfrAff, err_LibTypOprAff, vIdtTypOprAff, vDbtCrtAff, vSldOprAff, vMntOprAff, vIdtNatRglAff, vEchPmt, vModImpAff, vDatCnv, vIdtDvs, vIdtSitAff
      from TYPOPR, OPR
      where TYPOPR.IdtTypOpr = OPR.IdtTypOpr
       and  OPR.IdtOpr = pIdtOprAff;
    err_RfrAff := vRfrAff;
    if pRfr is not null then
      vMsg := 'Recherche du solde de l''operation ' || pRfr;
      BEGIN
        select Sld
          into vSld
          from OPR
          where Rfr = pRfr
           and  IdtTypOpr = pIdtTypOpr;
      EXCEPTION
        when NO_DATA_FOUND then
          null; -- Si l'operation n'existe pas, c'est parce qu'on est en train de la creer
        when OTHERS then
          raise;
      END;
    elsif pIdtOpr is not null then
      vMsg := 'Recherche du solde de l''operation ' || pIdtOpr;
      select Sld, Rfr, IdtTypOpr
        into vSld, vRfr, vIdtTypOpr
        from OPR
        where IdtOpr = pIdtOpr;
      if pRfr is null then
        pRfr := vRfr;
      end if;
      if pIdtTypOpr is null then
        select Prfx, DbtCrt, Lib, IdtTabSeq, NbCar, PadCar
          into vPrfx, vDbtCrt, err_LibTypOpr, vIdtTabSeq, vNbCar, vPadCar
          from TYPOPR
          where IdtTypOpr = vIdtTypOpr;
      end if;
    end if;
    -- Controles de coherence sur les soldes des operations, seulement dans le cas des affectations
    if pIdtOprAff is not null then
      if vDbtCrtAff = 'D' and vSldOprAff < 0 then
        vCodeErreur := 'ERR_MAJCPT0046'; -- Le solde d'une opération debitrice ne peut pas etre negatif
        err_Rfr := vRfrAff;
        err_LibTypOpr := err_LibTypOprAff;
        raise eErr_MajCpt;
      elsif vDbtCrtAff = 'C' and vSldOprAff > 0 then
        vCodeErreur := 'ERR_MAJCPT0045'; -- Le solde d'une opération creditrice ne peut pas etre positif
        err_Rfr := vRfrAff;
        err_LibTypOpr := err_LibTypOprAff;
        raise eErr_MajCpt;
      end if;
      if vIdtTypOpr is not null and vSld is not null then
        if vDbtCrt = 'D' and vSld < 0 then
          vCodeErreur := 'ERR_MAJCPT0046'; -- Le solde d'une opération debitrice ne peut pas etre negatif
          raise eErr_MajCpt;
        elsif vDbtCrt = 'C' and vSld > 0 then
          vCodeErreur := 'ERR_MAJCPT0045'; -- Le solde d'une opération creditrice ne peut pas etre positif
          raise eErr_MajCpt;
        end if;
      end if;
    end if; -- pIdtOprAff is not null
    -- A l'exception de la liberation de la mensualisation
    if vModImp <> 23 then
      vMsg :=  'Verification que l''operation n''est pas annulee';
      vNbr := EstOprAnl(pIdtOprAff);
      if vNbr = 1 then
        vCodeErreur := 'ERR_MAJCPT0005'; -- L'operation est annulee
        err_Rfr := vRfrAff;
        err_LibTypOpr := err_LibTypOprAff;
        raise eErr_MajCpt;
      end if;
    end if;
  end if;
  vIdtDvs := nvl(pIdtDvs,vIdtDvs);
  if vIdtDvs is null then
    vMsg := 'Recherche de la devise';
    select IdtDvs
      into vIdtDvs
      from CPTCLT
      where IdtClt = pIdtCltOrg
       and  IdtCptClt = pIdtCptCltOrg;
  end if;
  vDatCnv := nvl(pDatCnv,vDatCnv);
  if vDatCnv is null and vIdtDvs is not null then
    vMsg := 'Recherche de la date de conversion';
    vDatCnv := DatCnvDvsJou(vIdtDvs);
  end if;
  case
    when vModImp is null then
      vCodeErreur := 'ERR_MAJCPT0026'; -- Le mode d'imputation n'est pas renseigne
      raise eERR_MAJCPT;
    ----------------------------------------------------------------------------------------------------------------------------------------------------------
    ----------------------------------------------------------------------------------------------------------------------------------------------------------
    -- MODE D'IMPUTATION 1: FACTURE (AVOIR)
    ----------------------------------------------------------------------------------------------------------------------------------------------------------
    ----------------------------------------------------------------------------------------------------------------------------------------------------------
    when vModImp = 1 then
      vMsg := 'Recherche si l''operation existe';
      select count(*)
        into vNbr
        from OPR
        where Rfr = pRfr
         and  IdtTypOpr = DECODE( SIGN(pMnt), -1, 4, pIdtTypOpr);
      if vNbr > 0 then
        vCodeErreur := 'ERR_MAJCPT0029'; -- L'operation existe deja
        raise eErr_MajCpt;
      end if;
      --
      vMsg := 'Recuperation nouveu Id de l''opération';
      --
      vSqcOpr := SqcCptClt;
      pIdtOpr := vSqcOpr;
      --
      vMsg := 'Recherche de la séquence de l''opération de routage';
      vSqcRtg := vSqcOpr;
      if pMnt < 0 then
        vIdtTypOprRtg := 4;
      else
        vIdtTypOprRtg := 1;
      end if;
      -----------------------------------------------------------------------------
      --Recherche des informations bancaires du client s'il s'agit d'une facture
      -----------------------------------------------------------------------------
      if pIdtTypOpr = 1 then
        -- modif pr trt devis
        -- info ctr - fiche 4284
        --SELECT idtctr INTO vIdtCtr FROM CTRFAC,FAC WHERE CTRFAC.idtfac(+)=FAC.idtfac AND  NUMFCT=prfr;
        --
        vMsg := 'Recherche du contrat';
        --
        open cCur for
          select CTR.IdtCtr
            from PNTCPG, CTR, CTRFAC, FAC
            where CTRFAC.IdtFac = FAC.IdtFac
             and  CTR.IdtCtr = CTRFAC.IdtCtr
             and  PNTCPG.IdtPntLvr = CTR.IdtPntLvr
             and  PNTCPG.IdtPntCpg = CTR.IdtPntCpg
             and  FAC.NumFct = pRfr
            order by decode(PNTCPG.IdtTypCpg,3,1,2);
          fetch cCur into vIdtCtr;
        close cCur;
        --
        vMsg := 'Recherche des informations bancaires';
        --
        RefBnc(pIdtCltOrg,pIdtCptCltOrg,vIdtCtr,vIdtModRgl,vIdtModRcv,vIdtBnq,vIdtGch,vNumCptBnc,vCleRib,vNomCptBnc,vIBAN,vBIC);
        --
        vMsg := 'Recherche mode de recouvrement';
        --
        ModRcvFac(pRfr,vIdtRcvTyp,vIdtModRcv, vIdtModRgl);
        --SJ 04 nov 2010 fiche 8650
        --IF vIdtModRcv <> 'AVP' THEN
        IF vIdtModRcv is null THEN
          vIdtBnq     := NULL;
          vIdtGch     := NULL;
          vNumCptBnc  := NULL;
          vCleRib     := NULL;
          vNomCptBnc  := NULL;
        END IF;
      END IF;
      --
      vMsg := 'Insertion operation facture';
      --
      --BPZ
      select IdtTypFct,
             NumDev
      into vIdtTypFct,
           vNumDev
      from FAC
      where FAC.NumFct = pRfr;

--      BEGIN
--      select 1 into vOprPresent
--         from OPR
--         where RFR = pRfr;
--      EXCEPTION
--          WHEN NO_DATA_FOUND THEN vOprPresent :=0;
--      END;

      --BPZ
      X7.X7UTIL.TRACE(' vidttypfct :' || vidttypfct);
      X7.X7UTIL.TRACE(' pRfr :' || pRfr);

         INSERT INTO OPR (IdtClt,
                       IdtCptClt,
                       IdtOpr,
                       IdtTypOpr,
                       Rfr,
                       DatCrt,
                       DatExg,
                       DatVlr,
                       Mnt,
                       Sld,
                       DatCnv,
                       Cmp,
                       IdtDvs,
                       IdtAgt,
                       IdtSit,
                       IdtModRgl,
                       IdtBnq,
                       IdtGch,
                       NumCptBnc,
                       CleRib,
                       NomCptBnc,
                       IdtOprOrg,
                       Anl,
                       InfCpl)
               VALUES (pIdtCltOrg,
                       pIdtCptCltOrg,
                       vSqcOpr,
                       --DECODE( SIGN(pMnt), -1, 4, pIdtTypOpr),
                       DECODE(vNumDev,'1',71,DECODE( SIGN(pMnt), -1, 4, pIdtTypOpr)),
                       pRfr,
                       sysdate, --SJ 29/10/2012 F10511 vpDatCrt, --sysdate, SJ 17/08/2012 fiche 10308
                       NVL(DatExgDmc(pRfr,sysdate),pDatExg),
                       vDatVlr,
                       pMnt,
                       -- BPZ 9656
                       --DECODE(vNumDev,'1',0,pMnt),
                       DECODE(vidttypfct,8,0,pMnt),
                       vDatCnv,
                       0,
                       vIdtDvs,
                       pIdtAgt,
                       1,
                       DECODE( SIGN(pMnt), -1, null, vIdtModRgl),
                       vIdtBnq,
                       vIdtGch,
                       vNumCptBnc,
                       vCleRib,
                       vNomCptBnc,
                       pIdtOprOrg,
                       0,
                       pInfCpl);

      -- HNG 19/08/2004 - Fiche 3232, actualisation des variables pour le trt specifique
      vIdtOprDbt    := vSqcOpr;
      vRfrDbt       := pRfr;
      IF SIGN(pMnt) = -1 THEN
        vIdtTypOprDbt := 4;
      ELSE
        vIdtTypOprDbt := pIdtTypOpr;
      END IF;
      vIdtOprCrt    := NULL;
      vRfrCrt       := NULL;
      vIdtTypOprCrt := NULL;
      vIdtLtt       := NULL;
      -- End HNG
      ------------------------------------------------
      -- Comptabilisation de l'opération
      ------------------------------------------------
      --         if ModCmp = 1 then
      --           TrtCmp.TrtCmp(SqcDr, 'OPR');
      --         end if;
    ----------------------------------------------------------------------------------------------------------------------------------------------------------
    ----------------------------------------------------------------------------------------------------------------------------------------------------------
    -- MODE D'IMPUTATION 2: REGLEMENT
    ----------------------------------------------------------------------------------------------------------------------------------------------------------
    ----------------------------------------------------------------------------------------------------------------------------------------------------------
    when vModImp = 2 then
      vMsg := 'Recuperation nouveu Id';
      vSqcOpr:= SqcCptClt;
      -- Sequence de l'opération de routage
      vSqcRtg := vSqcOpr;
      vIdtTypOprRtg := pIdtTypOpr;
      pIdtOpr := vSqcOpr;
      vRfr := to_char(pIdtLgnCss);
      pRfr := vRfr;
      err_Rfr := vRfr;
      vMsg := 'Recherche si l''operation existe';
      select count(*)
        into vNbr
        from OPR
        where Rfr = vRfr
         and  IdtTypOpr = pIdtTypOpr;
      if vNbr > 0 then
        vCodeErreur := 'ERR_MAJCPT0029'; -- L'operation existe deja
        raise eErr_MajCpt;
      end if;
      -------------------------------------------------------------------------------------
      -- Récupération du montant payé en devise de paiement et en devise du compte client)
      -------------------------------------------------------------------------------------
      BEGIN
        select -sum(Mnt), -sum(MntDvs)
          into vMnt, vMntDvs
          from LGNCSS
          where IdtLgnCss = pIdtLgnCss
           and  (Rfr is not null or IdtTypOpr = 2);

         --  SJ F9919 + F9969:  car on passe jamais dans exception
          vNbr:= SQL%ROWCOUNT;
           If  vNbr = 0 then
             vCodeErreur := 'ERR_MAJCPT0004';  -- La reference n'existe pas
             raise eERR_MAJCPT;
             vMsg := 'Recherche ligne de caisse';
          end if;


      EXCEPTION
        when NO_DATA_FOUND then
          vCodeErreur := 'ERR_MAJCPT0004';  -- La reference n'existe pas
          raise eERR_MAJCPT;
        when others then
          vMsg := 'Recherche ligne de caisse';
          raise;
      END;
      -- Controle de coherence du signe du montant
      if vMnt > 0 or vMntDvs > 0 then
        vCodeErreur := 'ERR_MAJCPT0015';  -- Le montant ne peut pas etre positif
        raise eERR_MAJCPT;
      end if;
      -------------------------------------------------------------------
      -- Recuperation de quelques info de la première ligne caisse dispo
      -------------------------------------------------------------------
      OPEN cLgnCss;
        FETCH cLgnCss INTO rLGnCss;
        IF cLgnCss%NOTFOUND THEN
          vCodeErreur := 'ERR_MAJCPT0004'; -- La reference n'existe pas
          raise eERR_MAJCPT;
        END IF;
        -- Bug de la caisse: La somme des montants des operations ne corresponde pas
        -- au montant de l'encaissement. Message d'erreur pour eviter des incoherences
        -- !!!!! Atention: A verifier avec la gestion multidevise!!!!!!!
        if rLgnCss.MtnDvsTot <> rLgnCss.MntTotOpr then
          vCodeErreur := 'ERR_MAJCPT0054'; -- La somme des operations est differente du montant paye
          raise eERR_MAJCPT;
        end if;
        vDatCnv := nvl(rLGNCSS.DatTauCnv,vDatCnv);
        vDatVlr := rLGNCSS.DatCrt;
        -------------------------------------------------------------------
        -- Insertion de l'operation - Les montants et solde sont en débit
        -- il seront soldé par le lettrage
        -- Les informations du client sont prises de la table LGNCSS
        -------------------------------------------------------------------
        /* Centura E081 */
        vMsg := 'Insertion de l''operation d''encaissement';
        INSERT INTO OPR (IdtClt,
                         IdtCptClt,
                         IdtOpr,
                         IdtTypOpr,
                         Rfr,
                         DatCrt,
                         DatExg,
                         DatVlr,
                         Mnt,
                         Sld,
                         DatCnv,
                         Cmp,
                         IdtCss,
                         MntDvs,
                         IdtDvs,
                         IdtModRgl,
                         NumChq,
                         IdtBnq,
                         IdtGch,
                         NumCptBnc,
                         NomCptBnc,
                         CleRib,
                         IdtAgt,
                         NomTrr,
                         IdtSit,
                         InfCpl,
                         IdtOprOrg,
                         IdtNatRgl,
                         Anl)
                 VALUES (rLgnCss.IdtClt,
                         rLgnCss.IdtCptClt,
                         vSqcOpr,
                         pIdtTypOpr,
                         vRfr,
                         sysdate, --SJ 29/10/2012 F10511 vpDatCrt, --sysdate, SJ 17/08/2012 fiche 10308
                         vDatVlr,
                         vDatVlr,
                         vMnt,
                         vMnt,
                         vDatCnv,
                         0,
                         rLgnCss.IdtCss,
                         vMntDvs,
                         rLgnCss.IdtDvs,
                         rLgnCss.IdtModRgl,
                         rLgnCss.NumChq,
                         rLgnCss.IdtBnq,
                         rLgnCss.IdtGch,
                         rLgnCss.NumCptBnc,
                         rLgnCss.NomTrr,
                         rLgnCss.CleRib,
                         pIdtAgt,
                         rLgnCss.NomTrr,
                         1,
                         rLgnCss.InfCpl,
                         pIdtOprOrg,
                         rLgnCss.IdtNatRgl,
                         0);
        ------------------------------------------------
        -- Comptabilisation de l'opération
        ------------------------------------------------
        --         if ModCmp = 1 then
        --           TrtCmp.TrtCmp(SqcCr, 'OPR');
        --         end if;
        /* Fin Centura E081 */
        IF rLgnCss.NOTE IS NOT NULL THEN
          vMsg := 'Recherche secuence note';
          SELECT IdtSqcGnr
            INTO vIdtSqcGnr
          FROM OPR
          WHERE IdtClt    = pIdtCltOrg
           AND  IdtCptClt = pIdtCptCltOrg
           AND  IdtOpr    = vSqcOpr;
          vMsg := 'Insertion note';
          INSERT INTO NOTE (IDTNOTE,IDTSQCGNR,TXT,DATCRT,IDTAGT)
              VALUES (SEQ_NOTE.NEXTVAL, vIdtSqcGnr ,rLgnCss.NOTE, rLgnCss.DatCrt, rLgnCss.IdtAgt);
        END IF;
      CLOSE cLgnCss;
      ----------------------------------------------------------------
      -- Lettrage des elements du règlement
      ----------------------------------------------------------------
      vMntLttRes := abs(vMnt);
      err_Rfr := vRfr;
      vMsg := 'Loop sur les encaissements';
      FOR rLgnCss IN cLgnCss LOOP
        vMsg := 'Loop sur les encaissements';
        --         if rL.Rfr is not null then
        IF rLgnCss.IdtTypOpr <> 2 THEN
          err_Mnt := rLgnCss.Mnt;
          err_RfrAff := rLgnCss.Rfr;
          vMsg := 'Recherche type d''operation affecte';
          SELECT DbtCrt, Lib, Prfx, IdtTabSeq, NbCar, PadCar
            INTO vDbtCrtAff, err_LibTypOprAff, vPrfx, vIdtTabSeq, vNbCar, vPadCar
            FROM TYPOPR
            WHERE IdtTypOpr = rLgnCss.IdtTypOpr;
          vMsg := 'Recherche IdtOpr paye';
          vSqcOprAff := Rfr2IdtOpr (pIdtCltOrg, pIdtCptCltOrg, rLgnCss.IdtTypOpr, rLgnCss.Rfr);
          IF vSqcOprAff IS NOT NULL THEN
            -- Controle: Lettrage autorise
            vMsg := 'Recherche lettrage autorise';
            vNbr := EstLttAutorise(vSqcOpr,vSqcOprAff,gModeLettrage);
            if nvl(vNbr,0) = 0 then
              vCodeErreur := 'ERR_MAJCPT0013'; -- L'affectation n'est pas autorisee
              raise eErr_MajCpt;
            end if;
            -- Controle Lettrage autorise pour la situation
            vMsg := 'Recherche situation';
            select count(*)
              into vNbr
              from SIT, OPR
              where SIT.IdtSit = OPR.IdtSit
               and  OPR.IdtOpr = vSqcOprAff
               and  SIT.LttAut = 1;
            if vNbr = 0 then
              vCodeErreur := 'ERR_MAJCPT0027'; -- La situation n'autorise pas le reglement
              raise eErr_MajCpt;
            end if;
            vMsg := 'Traitement des penalites';
            IF X7_Trtpen01_Spc.X7_MdlPenRglIns = 1 THEN
              X7_Trtpen01_Spc.X7_CreMvmExcPenRgl(vSqcOprAff, vSqcOpr, rLgnCss.Mnt, pIdtAgt, vCr);
            END IF;
            vMntLtt          := LEAST(vMntLttRes,rLgnCss.Mnt);
            vMntLttRes       := vMntLttRes - vMntLtt;
            vIdtTypOprLstDbt := rLgnCss.IdtTypOpr;
            vRfrLstDbt       := rLgnCss.Rfr;
            vIdtOprLstDbt    := vSqcOprAff;
            err_Mnt := vMntLtt;
            if vMntLtt < 0  then
              vCodeErreur := 'ERR_MAJCPT0014';  -- Le montant de l'affectation ne peut pas etre negatif
              raise eErr_MAJCPT;
            end if;
            if vMntLtt = 0 then
              vCodeErreur := 'ERR_MAJCPT0010'; -- Le montant affecte est egal a 0
              raise eErr_MAJCPT;
            end if;
            vMsg := 'Recherche solde operation affectee';
            select Sld
              into vSld
              from OPR
              where IdtOpr = vSqcOprAff;
            if vMntLtt > vSld then
              vCodeErreur := 'ERR_MAJCPT0009'; -- Le montant affecte est superieur au solde
              err_Rfr := rLGNCSS.Rfr;
              err_LibTypOpr := err_LibTypOprAff;
              raise eErr_MAJCPT;
            end if;
            -- On peut faire des affectations que sur de debits
            if vDbtCrtAff = 'C' then
              vCodeErreur := 'ERR_MAJCPT0043'; -- L'affectation d'un credit sur un credit est interdite
              raise eErr_MAJCPT;
            end if;
            -- Controle de coherence du solde de l'operation affectee
            if vDbtCrtAff = 'D' and vSld < 0 then
              vCodeErreur := 'ERR_MAJCPT0046'; -- Le solde d'une operation debitrice ne peut pas etre negatif
              err_Rfr := err_RfrAff;
              err_LibTypOpr := err_LibTypOprAff;
              raise eErr_MAJCPT;
            end if;
            if vDbtCrtAff = 'C' and vSld > 0 then
              vCodeErreur := 'ERR_MAJCPT0045'; -- Le solde d'une operation debitrice ne peut pas etre negatif
              err_Rfr := rLGNCSS.Rfr;
              err_LibTypOpr := err_LibTypOprAff;
              raise eErr_MAJCPT;
            end if;
            vMsg := 'Insertion de lettrage';
            InsLtt (vSqcOprAff, vSqcOpr, vMntLtt, NULL, vDatVlr, vSqcOpr, NULL, pIdtAgt, null, vIdtLtt);
            -- HNG 19/08/2004 - Fiche 3232, actualisation des variables pour le trt specifique
            -- dans ce cas, on prend en fait le dernier de la boucle
            vIdtOprDbt    := vSqcOprAff;
            vRfrDbt       := vRfrLstDbt;
            vIdtTypOprDbt := vIdtTypOprLstDbt;
            -- End HNG
          ELSE
            vMsg := 'Recherche de la sequence pour la reference';
            X7_TRTSEQ01.X7_NxtTabSeq(vIdtTabSeq,vRfr2);
            if vPadCar is not null AND NVL(vNbCar,0) != 0 THEN
              vRfr2 := lpad(vRfr2,vNbCar,vPadCar);
            end if;
            vRfr2 := vPrfx || vSprCdf || vRfr2;
            err_RfrAff := vRfr2;
            -- HNG 19/08/2004 - Fiche 3232, actualisation des variables pour le trt specifique
            -- dans ce cas, on prend en fait le dernier de la boucle
            vIdtOprDbt    := NULL;
            vRfrDbt       := NULL;
            vIdtTypOprDbt := rLgnCss.IdtTypOpr;
            -- End HNG
            IF vDbtCrtAff = 'C' THEN
              -- Perte minime ou similaire
              vMsg := 'Insertion operation perte minime';
              MAJOPRLTT(pModImp=>10,
                        pIdtAgt=>pIdtAgt,
                        pIdtCltOrg=>pIdtCltOrg,
                        pIdtCptCltOrg=>pIdtCptCltOrg,
                        pIdtTypOpr=>rLgnCss.IdtTypOpr,
                        pRfr=>vRfr2,
                        pIdtOpr=>vIdtOpr2,
                        pMnt=>-rLgnCss.Mnt,
                        pDatVlr=>vDatVlr,
                        pDatExg=>vDatVlr,
                        pDatCnv=>vDatCnv,
                        pIdtCltDst=>pIdtCltDst,
                        pIdtCptCltDst=>pIdtCptCltDst,
                        pIdtOprOrg=>vSqcOpr,
                        pIdtDvs=>vIdtDvs,
                        pMsg=>pMsg);
              if pMsg is not null then
                raise eErr_MajCpt;
              end if;
              vMsg := 'Lettrage perte minime';
              MAJOPRLTT(pModImp=>8,
                        pIdtAgt=>pIdtAgt,
                        pIdtCltOrg=>pIdtCltOrg,
                        pIdtCptCltOrg=>pIdtCptCltOrg,
                        pIdtTypOpr=>rLgnCss.IdtTypOpr,
                        pRfr=>vRfr2,
                        pIdtOpr=>vIdtOpr2,
                        pMnt=>rLgnCss.Mnt,
                        pDatVlr=>vDatVlr,
                        pDatExg=>vDatVlr,
                        pDatCnv=>vDatCnv,
                        pIdtCltDst=>pIdtCltDst,
                        pIdtCptCltDst=>pIdtCptCltDst,
                        pIdtOprOrg=>vSqcOpr,
                        pIdtOprAff=>vIdtOprLstDbt,
                        pIdtDvs=>vIdtDvs,
                        pMsg=>pMsg);
              if pMsg is not null then
                raise eErr_MajCpt;
              end if;
            else
              -- Gain minime ou similaire
              vMsg := 'Insertion operation gain minime';
              MAJOPRLTT(pModImp=>10,
                        pIdtAgt=>pIdtAgt,
                        pIdtCltOrg=>pIdtCltOrg,
                        pIdtCptCltOrg=>pIdtCptCltOrg,
                        pIdtTypOpr=>rLgnCss.IdtTypOpr,
                        pRfr=>vRfr2,
                        pIdtOpr=>vIdtOpr2,
                        pMnt=>rLgnCss.Mnt,
                        pDatVlr=>vDatVlr,
                        pDatExg=>vDatVlr,
                        pDatCnv=>vDatCnv,
                        pIdtCltDst=>pIdtCltDst,
                        pIdtCptCltDst=>pIdtCptCltDst,
                        pIdtOprOrg=>vSqcOpr,
                        pIdtDvs=>vIdtDvs,
                        pMsg=>pMsg);
              if pMsg is not null then
                raise eErr_MajCpt;
              end if;
              vMsg := 'Recherche Idt operation gain';
              vIdtOpr := Rfr2IdtOpr(pIdtCltOrg, pIdtCptCltOrg, rLgnCss.IdtTypOpr, vRfr2);
              vMsg := 'Lettrage reglement sur gain minime';
              MAJOPRLTT(pModImp=>8,
                        pIdtAgt=>pIdtAgt,
                        pIdtCltOrg=>pIdtCltOrg,
                        pIdtCptCltOrg=>pIdtCptCltOrg,
                        pIdtTypOpr=>pIdtOpr,
                        pRfr=>vRfr,
                        pIdtOpr=>vIdtOpr2,
                        pMnt=>rLgnCss.Mnt,
                        pDatVlr=>vDatVlr,
                        pDatExg=>vDatVlr,
                        pDatCnv=>vDatCnv,
                        pIdtCltDst=>pIdtCltDst,
                        pIdtCptCltDst=>pIdtCptCltDst,
                        pIdtOprOrg=>vSqcOpr,
                        pIdtOprAff=>vIdtOpr,
                        pIdtDvs=>vIdtDvs,
                        pMsg=>pMsg);
              if pMsg is not null then
                raise eErr_MajCpt;
              end if;
            END IF; -- vDbtCrt = 'C'
          END IF; -- vSqcOprAff IS NOT NULL
        END IF; -- rLgnCss.IdtTypOpr <> 2
      END LOOP; -- FOR rLgnCss IN cLgnCss
      -- HNG 19/08/2004 - Fiche 3232, actualisation des variables pour le trt specifique
      vIdtOprCrt    := vSqcOpr;
      vRfrCrt       := pRfr;
      vIdtTypOprCrt := pIdtTypOpr;
      -- End HNG
    ----------------------------------------------------------------------------------------------------------------------------------------------------------
    ----------------------------------------------------------------------------------------------------------------------------------------------------------
    -- MODE D'IMPUTATION 5: ECHEANCIER
    ----------------------------------------------------------------------------------------------------------------------------------------------------------
    ----------------------------------------------------------------------------------------------------------------------------------------------------------
    when vModImp = 5 then
      vMsg := 'Recuperation nouveu Id';
      vSqcOpr:= SqcCptClt;
      -- Sequence de l'opération de routage
      vSqcRtg := vSqcOpr;
      vIdtTypOprRtg := pIdtTypOpr;
      pIdtOpr := vSqcOpr;
      vMsg := 'Recherche si l''operation existe';
      select count(*)
        into vNbr
        from OPR
        where Rfr = pRfr
         and  IdtTypOpr = pIdtTypOpr;
      if vNbr > 0 then
        vCodeErreur := 'ERR_MAJCPT0029'; -- L'operation existe deja
        raise eErr_MajCpt;
      end if;
      vMsg := 'Insertion de l''operation';
      /*---------------------------------------------------------------------------
      - Insertion de l'operation - Pas d'imputation, l'operation est non lettree. -
      - Elle le sera par un appel de la mise a jour compte client enMode 8        -
      -----------------------------------------------------------------------------*/
      INSERT INTO OPR (IdtClt,
                       IdtCptClt,
                       IdtOpr,
                       IdtTypOpr,
                       Rfr,
                       ECHPMT,
                       DatCrt,
                       DatExg,
                       DatVlr,
                       Mnt,
                       Sld,
                       DatCnv,
                       Cmp,
                       IdtDvs,
                       IdtAgt,
                       IdtSit,
                       IdtOprOrg,
                       InfCpl,
                       Anl)
               VALUES (pIdtCltOrg,
                       pIdtCptCltOrg,
                       vSqcOpr,
                       pIdtTypOpr,
                       pRfr,
                       ExtSfj(ExtPfj(pRfr)),
                       sysdate,
                       pDatExg,
                       vDatVlr,
                       pMnt,
                       pMnt,
                       vDatCnv,
                       0,
                       vIdtDvs,
                       pIdtAgt,
                       1,
                       pIdtOprOrg,
                       pInfCpl,
                       0);
      -- HNG 19/08/2004 - Fiche 3232, actualisation des variables pour le trt specifique
      vIdtOprDbt    := NULL;
      vRfrDbt       := NULL;
      vIdtTypOprDbt := NULL;
      vIdtOprCrt    := vSqcOpr;
      vRfrCrt       := pRfr;
      vIdtTypOprCrt := pIdtTypOpr;
      vIdtLtt       := NULL;
      -- End HNG
      ------------------------------------------------
      --Contabilizaci?n de la operaci?n
      ------------------------------------------------
      --         if ModCmp = 1 then
      --           TrtCmp.TrtCmp(SqcCr, 'OPR');
      --         end if;
    ----------------------------------------------------------------------------------------------------------------------------------------------------------
    ----------------------------------------------------------------------------------------------------------------------------------------------------------
    -- MODE D'IMPUTATION 6: ECHEANCE
    ----------------------------------------------------------------------------------------------------------------------------------------------------------
    ----------------------------------------------------------------------------------------------------------------------------------------------------------
    when vModImp = 6 then
      -- Récupération du caractère séparateur
      --         select PRMGNR.SprCdf
      --         into   sCrcSpr
      --         from   PRMGNR;
      --B?squeda de las informaciones bancarias del contrato si la operaci?n
      --que se registra es una factura
      --info ctr fiche  4284
      vMsg := 'Recherche si l''operation existe';
      select count(*)
        into vNbr
        from OPR
        where Rfr = pRfr
         and  IdtTypOpr = pIdtTypOpr;
      if vNbr > 0 then
        vCodeErreur := 'ERR_MAJCPT0029'; -- L'operation existe deja
        raise eErr_MajCpt;
      end if;
      if pIdtTypOpr in (19,21) then
        vMsg := 'Recherche du contrat. Rfr';
        SELECT idtctr
          INTO vIdtCtr
          FROM ECHPMT
          WHERE ECHPMT = ExtPfj(ExtSfj(pRfr));
        refbnc (pIdtCltOrg,pIdtCptCltOrg,vIdtCtr,vIdtModRgl,vIdtModRcv,vIdtBnq,vIdtGch,vNumCptBnc,vCleRib,vNomCptBnc,vIBAN,vBIC);
        IF vIdtModRcv <> 'MNS' THEN
          vIdtBnq    := NULL;
          vIdtGch    := NULL;
          vNumCptBnc := NULL;
          vCleRib    := NULL;
          vNomCptBnc := NULL;
        END IF;
      end if;
      -- Insère operation debit
      vMsg := 'Recuperation nouveu Id';
      vSqcOpr:= SqcCptClt;
      -- Sequence de l'opération de routage
      vSqcRtg := vSqcOpr;
      vIdtTypOprRtg := pIdtTypOpr;
      pIdtOpr := vSqcOpr;
      vMsg := 'Insertion de l''operation';
      INSERT INTO OPR (IdtClt,
                       IdtCptClt,
                       IdtOpr,
                       IdtTypOpr,
                       Rfr,
                       ECHPMT,
                       DatCrt,
                       DatExg,
                       DatVlr,
                       Mnt,
                       Sld,
                       DatCnv,
                       Cmp,
                       IdtDvs,
                       IdtAgt,
                       IdtSit,
                       IdtModRgl,
                       IdtBnq,
                       IdtGch,
                       NumCptBnc,
                       CleRib,
                       NomCptBnc,
                       IdtOprOrg,
                       InfCpl,
                       Anl,
                       IBAN,
                       BIC)
               VALUES (pIdtCltOrg,
                       pIdtCptCltOrg,
                       vSqcOpr,
                       pIdtTypOpr,
                       pRfr,
                       ExtPfj(ExtSfj(pRfr)),
                       sysdate,
                       pDatExg,
                       vDatVlr,
                       pMnt,
                       pMnt,
                       vDatCnv,
                       0,
                       vIdtDvs,
                       pIdtAgt,
                       1,
                       vIdtModRgl,
                       vIdtBnq,
                       vIdtGch,
                       vNumCptBnc,
                       vCleRib,
                       vNomCptBnc,
                       pIdtOprOrg,
                       pInfCpl,
                       0,
                       vIBAN,
                       vBIC);
      -- HNG 19/08/2004 - Fiche 3232, actualisation des variables pour le trt specifique
      vIdtOprDbt    := vSqcOpr;
      vRfrDbt       := pRfr;
      vIdtTypOprDbt := pIdtTypOpr;
      vIdtOprCrt    := NULL;
      vRfrCrt       := NULL;
      vIdtTypOprCrt := NULL;
      vIdtLtt       := NULL;
      -- End HNG
      ------------------------------------------------
      --Contabilizaci?n de la operaci?n
      ------------------------------------------------
      --         if ModCmp = 1 then
      --           TrtCmp.TrtCmp(SqcDr, 'OPR');
      --         end if;
    ----------------------------------------------------------------------------------------------------------------------------------------------------------
    ----------------------------------------------------------------------------------------------------------------------------------------------------------
    -- MODE D'IMPUTATION 8: LETTRAGE DIRECT
    ----------------------------------------------------------------------------------------------------------------------------------------------------------
    ----------------------------------------------------------------------------------------------------------------------------------------------------------
    when vModImp = 8 then
      pRfr := null;
      vMsg := 'Recuperation du Idt de l''operation';
      if pIdtOpr is null then
        vSqcOpr:= Rfr2IdtOpr (pIdtCltOrg, pIdtCptCltOrg, pIdtTypOpr, pRfr);
        pIdtOpr := vSqcOpr;
        vRfr := pRfr;
      else
        vMsg := 'Recherche de la reference de l''operation';
        select Rfr, IdtTypOpr
          into vRfr, vIdtTypOpr
          from OPR
          where IdtOpr = pIdtOpr;
        err_Rfr := vRfr;
      end if;
      vIdtTypOpr := nvl(pIdtTypOpr,vIdtTypOpr);
      vMsg := 'Recherche du type d''operation : ' || vIdtTypOpr;
      select Lib, DbtCrt
        into err_LibTypOpr, vDbtCrt
        from TYPOPR
        where IdtTypOpr = vIdtTypOpr;
      vMsg := 'Recherche lettrage autorise. IdtOpr:' || pIdtOpr || 'IdtOprAff:' || pIdtOprAff;
      vNbr := EstLttAutorise(pIdtOpr, pIdtOprAff, gModeLettrage);
      if nvl(vNbr,0) = 0 then
        vCodeErreur := 'ERR_MAJCPT0013'; -- Le lettrage n'est pas autorise
        raise eErr_MajCpt;
      end if;
      if vDbtCrt = 'D' and vDbtCrtAff = 'D' then
        vCodeErreur := 'ERR_MAJCPT0044'; -- Pas possible d'affecter un debit sur un debit
        raise eErr_MajCpt;
      end if;
      if vDbtCrt = 'C' and vDbtCrtAff = 'C' then
        vCodeErreur := 'ERR_MAJCPT0043'; -- Pas possible d'affecter un credit sur un credit
        raise eErr_MajCpt;
      end if;
      vMsg := 'Recherche situation';
      select count(*)
        into vNbr
        from SIT, OPR
        where SIT.IdtSit = OPR.IdtSit
         and  OPR.IdtOpr = pIdtOprAff
         and  SIT.LttAut = 1;
      if vNbr = 0 then
        vCodeErreur := 'ERR_MAJCPT0027'; -- La situation n'autorise pas le reglement
        raise eErr_MajCpt;
      end if;
      if vDbtCrtAff = 'D' then
        vIdtOprDbt    := pIdtOprAff;
        vRfrDbt       := vRfrAff;
        vIdtTypOprDbt := vIdtTypOprAff;
        vIdtOprCrt    := pIdtOpr;
        vRfrCrt       := vRfr;
        vIdtTypOprCrt := vIdtTypOpr;
      else
-- LL: La ligne suivante ne peut pas fonctionner car dans ce cas vsqcOpr = null car on passe idtopr en paramètre de la fonction
--        vIdtOprDbt    := vSqcOpr;
-- LL: Correction
        vIdtOprDbt    := pIdtOpr;
        vRfrDbt       := vRfr;
        vIdtTypOprDbt := vIdtTypOpr;
        vIdtOprCrt    := pIdtOprAff;
        vRfrCrt       := vRfrAff;
        vIdtTypOprCrt := vIdtTypOprAff;
      end if;
      if pMnt < 0  then
        vCodeErreur := 'ERR_MAJCPT0014'; -- Le montant d'une affectation ne peut pas etre negatif
        raise eErr_MajCpt;
      end if;
      if pMnt = 0  then
        vCodeErreur := 'ERR_MAJCPT0010'; -- Le montant affecte est egal a cero
        raise eErr_MajCpt;
      end if;
      if pMnt > abs(vSld) then
        vCodeErreur := 'ERR_MAJCPT0009';
        raise eErr_MajCpt;
      end if;
      if pMnt > abs(vSldOprAff) then
        vCodeErreur := 'ERR_MAJCPT0009';
        err_Rfr := vRfrAff;
        err_LibTypOpr := err_LibTypOprAff;
        raise eErr_MajCpt;
      end if;
      vMsg := 'Insertion du lettrage';
      InsLtt (vIdtOprDbt, vIdtOprCrt, pMnt, NULL, vDatVlr, pIdtOprOrg,NULL, pIdtAgt, null, vIdtLtt);
    ----------------------------------------------------------------------------------------------------------------------------------------------------------
    ----------------------------------------------------------------------------------------------------------------------------------------------------------
    -- MODE D'IMPUTATION 9: TRANSFERT DE CREDIT
    ----------------------------------------------------------------------------------------------------------------------------------------------------------
    ----------------------------------------------------------------------------------------------------------------------------------------------------------
    when vModImp = 9 then
      if pMnt < 0  and vDbtCrt = 'D' then
        vCodeErreur := 'ERR_MAJCPT0016'; -- Une operation debitrice ne peut pas etre negative
        raise eErr_MajCpt;
      end if;
      if pMnt = 0 then
        vCodeErreur := 'ERR_MAJCPT0010'; -- Le montant affecte est egal a 0
        raise eErr_MajCpt;
      end if;
      vMsg := 'Recherche si le lettrage est autorise';
      select count(*)
        into vNbr
        from LTTAUT_VIEW
        where LTTAUT_VIEW.IdtTypOpr             = pIdtTypOpr
         and  LTTAUT_VIEW.IdtTypOprAff          = vIdtTypOprAff
         and  nvl(LTTAUT_VIEW.IdtNatRglAff,-1) = nvl(vIdtNatRglAff,-1)
         and  decode(gModeLettrage,1,LTTAUT_VIEW.Man,2,LTTAUT_VIEW.Atm) = 1;
      if vNbr = 0 then
--        vCodeErreur := 'ERR_MAJCPT0025'; -- Le transfert n'est pas autorise pour le type d'operation
        vCodeErreur := 'ERR_MAJCPT0013'; -- Le lettrage n'est pas autorise
--        err_Rfr := vRfrAff;
--        err_LibTypOpr := err_LibTypOprAff;
        raise eErr_MajCpt;
      end if;
      -- Si le transfert est partiel, le solde du credit doit etre superieur au transfert
      --BPZ
      if ABS(pMnt) <> abs(vMntOprAff) then
        if ABS(pMnt) > abs(vSldOprAff) then
          vCodeErreur := 'ERR_MAJCPT0028'; -- Le montant du transfert est superieur au solde
          raise eErr_MajCpt;
        end if;
      -- Sinon, le reglement ne doit pas etre rembourse
      else
        vMsg := 'Verification que l''operation n''est pas remboursée';
        select count(*)
          into vNbr
          from TYPOPR, OPR OPRDBT, LTT
          where OPRDBT.IdtOpr = LTT.IdtOprDbt
           and  TYPOPR.IdtTypOpr = OPRDBT.IdtTypOpr
           and  LTT.IdtOprCrt = pIdtOprAff
           and  TYPOPR.IdtModImp = 13
           and  EstOprAnl(OPRDBT.IdtOpr) = 0;
        if vNbr <> 0 then
          vCodeErreur := 'ERR_MAJCPT0018'; -- L'operation est remboursee
          err_Rfr := vRfrAff;
          err_LibTypOpr := err_LibTypOprAff;
          raise eErr_MajCpt;
        end if;
        vMsg := 'Recherche si l''operation est transferee';
        select count(*)
          into vNbr
          from OPR, LTT
          where OPR.IdtOpr = LTT.IdtOprDbt
           and  OPR.IdtTypOpr = 10
           and  EstOprAnl(OPR.IdtOpr) = 0
           and  LTT.IdtOprCrt = pIdtOprAff;
        if vNbr > 0 then
          BEGIN
            select min(OPRCRT.IdtClt)
              into vIdtClt
              from OPR OPRDBT, OPR OPRCRT, LTT
              where OPRDBT.IdtOpr = LTT.IdtOprDbt
               and  OPRCRT.IdtOprOrg = OPRDBT.IdtOpr
               and  EstOprAnl(OPRCRT.IdtOpr) = 0
               and  OPRDBT.IdtTypOpr = 10
               and  LTT.IdtOprCrt = pIdtOprAff;
          EXCEPTION
            when others then
              null;
          END;
          vCodeErreur := 'ERR_MAJCPT0017'; -- L'operation est transferee
          err_Rfr := vRfrAff;
          err_LibTypOpr := err_LibTypOprAff;
          err_IdtClt := vIdtClt;
          raise eErr_MajCpt;
        end if; -- vNbr > 0
      end if; -- pMnt <> abs(vMntOprAff)
      -- Recuperation de la reference
      if pRfr is null then
        vMsg := 'Recherche de la sequence pour la reference';
        X7_TRTSEQ01.X7_NxtTabSeq(vIdtTabSeq,vRfr);
        if vPadCar is not null AND NVL(vNbCar,0) != 0 THEN
          vRfr := lpad(vRfr,vNbCar,vPadCar);
        end if;
        vRfr := vPrfx || vSprCdf || vRfr;
      else
        vRfr := pRfr;
      end if;
      pRfr := vRfr;
      err_Rfr := vRfr;
      vMsg := 'Recherche si l''operation existe';
      select count(*)
        into vNbr
        from OPR
        where Rfr = vRfr
         and  IdtTypOpr = pIdtTypOpr;
      if vNbr > 0 then
        vCodeErreur := 'ERR_MAJCPT0029'; -- L'operation existe deja
        raise eErr_MajCpt;
      end if;
      ---------------------------------------------------------------------------
      -- Insertion de l'operation debitrice sur le client origine
      ---------------------------------------------------------------------------
      vMsg := 'Recuperation nouveu Id';
      vSqcOpr:= SqcCptClt;
      -- Sequence de l'opération de routage
      vSqcRtg := vSqcOpr;
      vIdtTypOprRtg := pIdtTypOpr;
      pIdtOpr := vSqcOpr;
      vMsg := 'Insertion de l''operation';
      if pIdtOprAff is not null then
        begin
        select IdtModRgl, IdtCss
        into   vIdtModRgl, vIdtCss
        from opr where IdtOpr = pIdtOprAff;
        exception
          when others then
            vIdtCss    := null;
            vIdtModRgl := null;
        end;

      end if;
      INSERT INTO OPR (IdtClt,
                       IdtCptClt,
                       IdtOpr,
                       IdtTypOpr,
                       Rfr,
                       DatCrt,
                       DatExg,
                       DatVlr,
                       Mnt,
                       Sld,
                       DatCnv,
                       Cmp,
                       IdtDvs,
                       IdtAgt,
                       IdtSit,
                       IdtOprOrg,
                       InfCpl,
                       Anl,
                       IdtModRgl,
                       IdtCss)
               VALUES (pIdtCltOrg,
                       pIdtCptCltOrg,
                       vSqcOpr,
                       pIdtTypOpr,
                       vRfr,
                       sysdate,
                       pDatExg,
                       vDatVlr,
                       pMnt,
                       pMnt,
                       vDatCnv,
                       0,
                       vIdtDvs,
                       pIdtAgt,
                       1,
                       pIdtOprOrg,
                       pInfCpl,
                       0,
                       vIdtModRgl,
                       vIdtCss
                       );
      ------------------------------------------------
      --Contabilizaci?n de la operaci?n
      ------------------------------------------------
      --         if ModCmp = 1 then
      --           TrtCmp.TrtCmp(SqcDr, 'OPR');
      --         end if;
      -- Si le transfert est total
      if pMnt = abs(vMntOprAff) then
        vMsg := 'Annulation des lettrages pour le reglement';
        AnlLttxOpr(pIdtAgt, pIdtOprAff, 2, vDatVlr, vSqcOpr);
      end if;
      vMsg := 'Lettrage du transfert';
      InsLtt(vSqcOpr, pIdtOprAff, pMnt, null, vDatVlr, vSqcOpr, null, pIdtAgt, null, vIdtLtt);
      vMsg := 'Recherche type d''operation creditrice';
      vIdtTypOpr := 12;
      vMsg := 'Recherche type d''operation';
      select Prfx, IdtTabSeq, NbCar, PadCar
        into vPrfx, vIdtTabSeq, vNbCar, vPadCar
        from TYPOPR
        where IdtTypOpr = vIdtTypOpr;
      vMsg := 'Recherche de la sequence pour la reference';
      X7_TRTSEQ01.X7_NxtTabSeq(vIdtTabSeq,vRfr2);
      if vPadCar is not null AND NVL(vNbCar,0) != 0 THEN
        vRfr2 := lpad(vRfr2,vNbCar,vPadCar);
      end if;
      vRfr2 := vPrfx || vSprCdf || vRfr2;
      vMsg := 'Recuperation nouveu Id';
      vIdtOpr:= SqcCptClt;
      vMsg := 'Insertion operation creditrice sur le client destinataire';
      INSERT INTO OPR (IdtClt,
                       IdtCptClt,
                       IdtOpr,
                       IdtTypOpr,
                       Rfr,
                       DatCrt,
                       DatExg,
                       DatVlr,
                       Mnt,
                       Sld,
                       DatCnv,
                       Cmp,
                       IdtDvs,
                       IdtAgt,
                       IdtSit,
                       IdtOprOrg,
                       Anl,
                       IdtModRgl,
                       IdtCss)
               VALUES (pIdtCltDst,
                       pIdtCptCltDst,
                       vIdtOpr,
                       vIdtTypOpr,
                       vRfr2,
                       sysdate,
                       pDatExg,
                       vDatVlr,
                       -pMnt,
                       -pMnt,
                       vDatCnv,
                       0,
                       vIdtDvs,
                       pIdtAgt,
                       1,
                       vSqcOpr,
                       0,
                       vIdtModRgl,
                       vIdtCss
                       );
      -- HNG 19/08/2004 - Fiche 3232, actualisation des variables pour le trt specifique
      vIdtOprDbt    := vSqcOpr;
      vRfrDbt       := vRfr;
      vIdtTypOprDbt := pIdtTypOpr;
      vIdtOprCrt    := vIdtOpr;
      vRfrCrt       := vRfr2;
      vIdtTypOprCrt := vIdtTypOpr;
      -- End HNG
      ------------------------------------------------
      --Contabilizaci?n de la operaci?n
      ------------------------------------------------
      --         if ModCmp = 1 then
      --           TrtCmp.TrtCmp(SqcCr, 'OPR');
      --         end if;
    ----------------------------------------------------------------------------------------------------------------------------------------------------------
    ----------------------------------------------------------------------------------------------------------------------------------------------------------
    -- MODE D'IMPUTATION 10: OPERATION MANUELLE
    ----------------------------------------------------------------------------------------------------------------------------------------------------------
    ----------------------------------------------------------------------------------------------------------------------------------------------------------
    when vModImp = 10 then
      if pRfr is null then
        vMsg := 'Recherche de la sequence pour la reference';
        X7_TRTSEQ01.X7_NxtTabSeq(vIdtTabSeq,vRfr);
        if vPadCar is not null AND NVL(vNbCar,0) != 0 THEN
          vRfr := lpad(vRfr,vNbCar,vPadCar);
        end if;
        vRfr := vPrfx || vSprCdf || vRfr;
      else
        vRfr := pRfr;
      end if;
      pRfr := vRfr;
      err_Rfr := vRfr;
      vMsg := 'Recherche si l''operation existe';
      select count(*)
        into vNbr
        from OPR
        where Rfr = vRfr
         and  IdtTypOpr = pIdtTypOpr;
      if vNbr > 0 then
        vCodeErreur := 'ERR_MAJCPT0029'; -- L'operation existe deja
        raise eErr_MajCpt;
      end if;
      vMsg := 'Recuperation nouveau Id';
      vSqcOpr:= SqcCptClt;
      vMsg := 'Recherche de la séquence de l''opération de routage';
      vSqcRtg := vSqcOpr;
      pIdtOpr := vSqcOpr;
      vIdtTypOprRtg := pIdtTypOpr;
      vMsg := 'Insertion operation mannuelle';
      INSERT INTO OPR (IdtClt,
                       IdtCptClt,
                       IdtOpr,
                       IdtTypOpr,
                       Rfr,
                       DatCrt,
                       DatExg,
                       DatVlr,
                       Mnt,
                       Sld,
                       DatCnv,
                       Cmp,
                       IdtDvs,
                       IdtAgt,
                       IdtSit,
                       IdtOprOrg,
                       InfCpl,
                       IdtMtfRim,
                       Anl)
               VALUES (pIdtCltOrg,
                       pIdtCptCltOrg,
                       vSqcOpr,
                       pIdtTypOpr,
                       vRfr,
                       sysdate,
                       pDatExg,
                       vDatVlr,
                       pMnt,
                       pMnt,
                       vDatCnv,
                       0,
                       vIdtDvs,
                       pIdtAgt,
                       1,
                       pIdtOprOrg,
                       pInfCpl,
                       pIdtMtf,
                       0);
      -- HNG 19/08/2004 - Fiche 3232, actualisation des variables pour le trt specifique
      vIdtOprDbt    := vSqcOpr;
      vRfrDbt       := vRfr;
      vIdtTypOprDbt := pIdtTypOpr;
      vIdtOprCrt    := null;
      vRfrCrt       := null;
      vIdtTypOprCrt := null;
      -- End HNG
      ------------------------------------------------
      --Contabilizaci?n de la operaci?n
      ------------------------------------------------
      --         if ModCmp = 1 then
      --           TrtCmp.TrtCmp(SqcCr, 'OPR');
      --         end if;
    ----------------------------------------------------------------------------------------------------------------------------------------------------------
    ----------------------------------------------------------------------------------------------------------------------------------------------------------
    -- MODE D'IMPUTATION 11: CHANGEMENT DE SITUATION
    ----------------------------------------------------------------------------------------------------------------------------------------------------------
    ----------------------------------------------------------------------------------------------------------------------------------------------------------
    when vModImp = 11 then
--      pMsg := 'Cette fonctionnalité n''est pas encore disponible. Merci de continuer a utiliser X7 ;)';
      -- Controles:
      -- On ne peut pas affecter un debit sur un debit

    --SJ 27/07/09 fiche 7559

      select  rfr  into vDebitsNonSolde from opr where OPR.IdtOpr = pIdtOprAff;
    vMsg := 'Calcul des references pour les opération changement de situation';
    X7_TRTSEQ01.X7_ATTNUMCHTSIT( vDebitsNonSolde, vRfrChgSitDbt, vRfrChgSitCrt);
    -- end SJ 27/07/09 fiche 7559
      if vDbtCrt = 'D' and vDbtCrtAff = 'D' then
        vCodeErreur := 'ERR_MAJCPT0044'; -- L'affectation d'un debit sur un debit est interdite
        raise eErr_MajCpt;
      end if;
      if vDbtCrt = 'C' and vDbtCrtAff = 'C' then
        vCodeErreur := 'ERR_MAJCPT0043'; -- L'affectation d'un credit sur un credit est interdite
        raise eErr_MajCpt;
      end if;

      vMsg := 'Mise à jour de la dette d''origine avec la nouvelle situation';
      UPDATE OPR
        SET OPR.IdtSit = pIdtSit
        WHERE OPR.IdtOpr = pIdtOprAff;

      --SJ 27/07/09 fiche 7559
      if pRfr is null then
        vRfr := vRfrChgSitCrt;
      else
        vRfr := pRfr;
      end if;
      -- end SJ 27/07/09 fiche 7559

      pRfr := vRfr;
      err_Rfr := vRfr;
      vMsg := 'Recherche si l''operation existe';
      select count(*)
        into vNbr
        from OPR
        where Rfr = vRfr
         and  IdtTypOpr = pIdtTypOpr;
      if vNbr > 0 then
        vCodeErreur := 'ERR_MAJCPT0029'; -- L'operation existe deja
        raise eErr_MajCpt;
      end if;
      vMsg := 'Recuperation nouveau Id';
      vSqcOpr:= SqcCptClt;
      vMsg := 'Recherche de la séquence de l''opération de routage';
      vSqcRtg := vSqcOpr;
      pIdtOpr := vSqcOpr;
      vIdtTypOprRtg := pIdtTypOpr;
      if vDbtCrtAff = 'D' then
        vIdtOprDbt    := pIdtOprAff;
        vRfrDbt       := vRfrAff;
        vIdtTypOprDbt := vIdtTypOprAff;
        vIdtOprCrt    := pIdtOpr;
        vRfrCrt       := vRfr;
        vIdtTypOprCrt := vIdtTypOpr;
      else
        vIdtOprDbt    := vSqcOpr;
        vRfrDbt       := vRfr;
        vIdtTypOprDbt := vIdtTypOpr;
        vIdtOprCrt    := pIdtOprAff;
        vRfrCrt       := vRfrAff;
        vIdtTypOprCrt := vIdtTypOprAff;
      end if;
      vMsg := 'Insertion operation changement situation 1';
      INSERT INTO OPR (IdtClt,
                       IdtCptClt,
                       IdtOpr,
                       IdtTypOpr,
                       Rfr,
                       DatCrt,
                       DatExg,
                       DatVlr,
                       Mnt,
                       Sld,
                       DatCnv,
                       Cmp,
                       IdtDvs,
                       IdtAgt,
                       IdtSit,
                       IdtOprOrg,
                       InfCpl,
                       IdtMtfRim,
                       Anl)
               VALUES (pIdtCltOrg,
                       pIdtCptCltOrg,
                       vSqcOpr,
                       pIdtTypOpr,
                       vRfr,
                       sysdate,
                       pDatExg,
                       vDatVlr,
                       -vSldOprAff,
                       -vSldOprAff,
                       vDatCnv,
                       0,
                       vIdtDvs,
                       pIdtAgt,
                       pIdtSit,
                       pIdtOprOrg,
                       pInfCpl,
                       pIdtMtf,
                       0);
      vMsg := 'Lettrage entre l''opération affectee et l''opération de changement de situation 1';
      InsLtt(vIdtOprDbt, vIdtOprCrt, abs(vSldOprAff), vIdtSitAff, vDatVlr, nvl(pIdtOprOrg,pIdtOpr), null, pIdtAgt, null, vIdtLtt);
      vMsg := 'Recherche du type d''opération de changement de situation';
      select Prfx, IdtTabSeq, nbCar, PadCar
        into vPrfx, vIdtTabSeq, vNbCar, vPadCar
        from TYPOPR
        where IdtTypOpr = decode(pIdtTypOpr,16,15,16);

      --sj 27/07/09

      vRfr := vRfrChgSitDbt;

      -- sj 27/07/09

      vMsg := 'Recuperation nouveau Id';
      vSqcOpr:= SqcCptClt;
      vMsg := 'Insertion operation changement situation 2';
      INSERT INTO OPR (IdtClt,
                       IdtCptClt,
                       IdtOpr,
                       IdtTypOpr,
                       Rfr,
                       DatCrt,
                       DatExg,
                       DatVlr,
                       Mnt,
                       Sld,
                       DatCnv,
                       Cmp,
                       IdtDvs,
                       IdtAgt,
                       IdtSit,
                       IdtOprOrg,
                       InfCpl,
                       IdtMtfRim,
                       Anl)
               VALUES (pIdtCltOrg,
                       pIdtCptCltOrg,
                       vSqcOpr,
                       decode(pIdtTypOpr,16,15,16),
                       vRfr,
                       sysdate,
                       pDatExg,
                       vDatVlr,
                       vSldOprAff,
                       vSldOprAff,
                       vDatCnv,
                       0,
                       vIdtDvs,
                       pIdtAgt,
                       pIdtSit,
                       nvl(pIdtOprOrg,pIdtOpr),
                       pInfCpl,
                       pIdtMtf,
                       0);
      vMsg := 'Annulation du lettrage anterieur';
      AnlLtt(pIdtAgt, vIdtLtt, vDatVlr, nvl(pIdtOprOrg,pIdtOpr));
      vMsg := 'Insertion du lettrage entre les operations de changement de situation';
      if vDbtCrt = 'C' then  -- correspond a l'operation passe en parametre: 16 pour les debits, 15 pour les credits
        InsLtt(vSqcOpr, pIdtOpr, abs(vSldOprAff), vIdtSitAff, vDatVlr, nvl(pIdtOprOrg,pIdtOpr), null, pIdtAgt, null, vIdtLtt);
      else
        InsLtt(pIdtOpr, vSqcOpr, abs(vSldOprAff), vIdtSitAff, vDatVlr, nvl(pIdtOprOrg,pIdtOpr), null, pIdtAgt, null, vIdtLtt);
      end if;
    ----------------------------------------------------------------------------------------------------------------------------------------------------------
    ----------------------------------------------------------------------------------------------------------------------------------------------------------
    -- MODE D'IMPUTATION 13: REMBOURSEMENT
    ----------------------------------------------------------------------------------------------------------------------------------------------------------
    ----------------------------------------------------------------------------------------------------------------------------------------------------------
    when vModImp = 13 then
      if pMnt > abs(vSldOprAff) then
        vCodeErreur := 'ERR_MAJCPT0009'; -- Le montant a affecter est superieur au solde
        err_Rfr := err_RfrAff;
        err_LibTypOpr := err_LibTypOprAff;
        raise eErr_MajCpt;
      end if;
      if pMnt = 0 then
        vCodeErreur := 'ERR_MAJCPT0010'; -- Le montant a affecter est egal a 0
        err_Rfr := err_RfrAff;
        err_LibTypOpr := err_LibTypOprAff;
        raise eErr_MajCpt;
      end if;
      vMsg := 'Recherche si l''operation existe';
      select count(*)
        into vNbr
        from OPR
        where Rfr = vRfr
         and  IdtTypOpr = pIdtTypOpr;
      if vNbr > 0 then
        vCodeErreur := 'ERR_MAJCPT0029'; -- L'operation existe deja
        raise eErr_MajCpt;
      end if;
      vMsg := 'Recherche si le lettrage est autorise';
      select count(*)
        into vNbr
        from LTTAUT_VIEW
        where LTTAUT_VIEW.IdtTypOpr             = pIdtTypOpr
         and  LTTAUT_VIEW.IdtTypOprAff          = vIdtTypOprAff
         and  nvl(LTTAUT_VIEW.IdtNatRglAff,-1) = nvl(vIdtNatRglAff,-1)
         and  decode(gModeLettrage,1,LTTAUT_VIEW.Man,2,LTTAUT_VIEW.Atm) = 1;
      if vNbr = 0 then
        vCodeErreur := 'ERR_MAJCPT0013'; -- Le lettrage n'est pas autorise
        raise eErr_MajCpt;
      end if;
      if pRfr is null then
        vMsg := 'Recherche de la sequence pour la reference';
        X7_TRTSEQ01.X7_NxtTabSeq(vIdtTabSeq,vRfr);
        if vPadCar is not null AND NVL(vNbCar,0) != 0 THEN
          vRfr := lpad(vRfr,vNbCar,vPadCar);
        end if;
        vRfr := vPrfx || vSprCdf || vRfr;
      else
        vRfr := pRfr;
      end if;
      pRfr := vRfr;
      err_Rfr := vRfr;
      vMsg := 'Recherche si l''operation existe';
      select count(*)
        into vNbr
        from OPR
        where Rfr = vRfr
         and  IdtTypOpr = pIdtTypOpr;
      if vNbr > 0 then
        vCodeErreur := 'ERR_MAJCPT0029'; -- L'operation existe deja
        raise eErr_MajCpt;
      end if;
      vMsg := 'Recuperation nouveau Id';
      vSqcOpr:= SqcCptClt;
      pIdtOpr := vSqcOpr;
      vMsg := 'Recherche de la séquence de l''opération de routage';
      vSqcRtg := vSqcOpr;
      vIdtTypOprRtg := pIdtTypOpr;
      vMsg := 'Recherche du mode de remboursement';
      Modrmbcptclt(pIdtCltOrg,pIdtCptCltOrg,vidtmodrgl,vidtbnq,vidtgch,vnumcptbnc,vnomcptbnc,vCleRib,vIBAN, vBIC);
      vMsg := 'Insertion operation remboursement';
      INSERT INTO OPR (IdtClt,
                       IdtCptClt,
                       IdtOpr,
                       IdtTypOpr,
                       Rfr,
                       DatCrt,
                       DatExg,
                       DatVlr,
                       Mnt,
                       Sld,
                       DatCnv,
                       Cmp,
                       IdtDvs,
                       IdtAgt,
                       IdtSit,
                       IdtOprOrg,
                       InfCpl,
                       IdtMtfRim,
                       Anl,
                       IdtModRgl,
                       IdtBnq,
                       IdtGch,
                       NumCptBnc,
                       NomCptBnc,
                       CleRib,
                       IBAN,
                       BIC)
               VALUES (pIdtCltOrg,
                       pIdtCptCltOrg,
                       vSqcOpr,
                       pIdtTypOpr,
                       vRfr,
                       sysdate,
                       pDatExg,
                       vDatVlr,
                       pMnt,
                       pMnt,
                       vDatCnv,
                       0,
                       vIdtDvs,
                       pIdtAgt,
                       1,
                       pIdtOprOrg,
                       pInfCpl,
                       pIdtMtf,
                       0,
                       vIdtModRgl,
                       vIdtBnq,
                       vIdtGch,
                       vNumCptBnc,
                       vNomCptBnc,
                       vCleRib,
                       vIBAN,
                       vBIC);
      ------------------------------------------------
      --Contabilizaci?n de la operaci?n
      ------------------------------------------------
      --         if ModCmp = 1 then
      --           TrtCmp.TrtCmp(SqcCr, 'OPR');
      --         end if;
      vMsg := 'Lettrage du remboursement';
      InsLtt(vSqcOpr, pIdtOprAff, pMnt, null, vDatVlr, vSqcOpr, null, pIdtAgt, null, vIdtLtt);
      -- HNG 19/08/2004 - Fiche 3232, actualisation des variables pour le trt specifique
      vIdtOprDbt    := vSqcOpr;
      vRfrDbt       := vRfr;
      vIdtTypOprDbt := pIdtTypOpr;
      vIdtOprCrt    := pIdtOprAff;
      vRfrCrt       := vRfrAff;
      vIdtTypOprCrt := vIdtTypOprAff;
      -- End HNG
    ----------------------------------------------------------------------------------------------------------------------------------------------------------
    ----------------------------------------------------------------------------------------------------------------------------------------------------------
    -- MODE D'IMPUTATION 21: ANNULATION D'OPERATION
    ----------------------------------------------------------------------------------------------------------------------------------------------------------
    ----------------------------------------------------------------------------------------------------------------------------------------------------------
    when vModImp = 21 then
      vIdtOprOrg := pIdtOprOrg;
      -- On vérifie s'il s'agit de l'annulation d'une annulation
      select count(*)
        into vNbr
        from TYPOPR
        where IdtTypOpr = vIdtTypOprAff
         and  IdtTypOprAnl is not null;
      if vNbr > 0 then
        vCodeErreur := 'ERR_MAJCPT0040'; -- On ne peut pas annuler une annulation
        raise eErr_MajCpt;
      end if;
      -- Si l'operation a annuler es le transfert de credit (credit)
      -- on verifie si le transfert debit est annulé, sinon, on l'annule d'abord
      if vIdtTypOprAff = 12 then
        vMsg := 'Recherche du transfert de credit (debit)';
        select IdtOprOrg
          into vIdtOprAff
          from OPR
          where IdtOpr = pIdtOprAff;
        if EstOprAnl(vIdtOprAff) = 0 then
          MAJOPRLTT (pModImp=>vModImp,
                     pIdtAgt=>pIdtAgt,
                     pIdtCltOrg=>pIdtCltOrg,
                     pIdtCptCltOrg=>pIdtCptCltOrg,
                     pRfr=>pRfr,
                     pIdtOpr=>pIdtOpr,
                     pMnt=>pMnt,
                     pDatVlr=>vDatVlr,
                     pDatExg=>pDatExg,
                     pDatCnv=>vDatCnv,
                     pIdtCltDst=>pIdtCltDst,
                     pIdtCptCltDst=>pIdtCptCltDst,
                     pIdtOprAff=>vIdtOprAff,
                     pIdtLtt=>pIdtLtt,
                     pIdtLgnCss=>pIdtLgnCss,
                     pIdtOprOrg=>vIdtOprOrg,
                     pIdtDvs=>vIdtDvs,
                     pIdtMtf=>pIdtMtf,
                     pInfCpl=>pInfCpl,
                     pMsg=>pMsg);
          if pMsg is not null then
            raise eErr_MajCpt;
          end if;
          vIdtOprOrg := nvl(vIdtOprOrg,pIdtOpr);
        end if; -- EstOprAnl(vIdtOprAff) = 0
      end if; -- vIdtTypOprAff = 12
      -- Une echeance ne peut pas etre annulee,
      -- il faut annuler l'echeancier
      -- (sauf pour les mensualites)
      if vModImpAff = 6 and vIdtTypOprAff <> 19 then
        vCodeErreur := 'ERR_MAJCPT0032'; -- Une echeance ne peut pas etre annulee
        err_Rfr := err_RfrAff;
        err_LibTypOpr := err_LibTypOprAff;
        raise eErr_MajCpt;
      end if;
      -- Controles specifiques pour le retour d'impaye
      if nvl(pIdtTypOpr,0) = 9 then
        vIdtTypOprAnl := 9;
        vMnt := pMnt;
        -- Le retour d'impayé peut s'appliquer seulement sur les encaissements
        if vIdtTypOprAff <> 2 then
          vCodeErreur := 'ERR_MAJCPT0039'; -- Le retour d'impaye est autorise que pour les encaissements
          raise eErr_MajCpt;
        end if;
        -- En cas de retour d'impaye partiel
        if nvl(pMnt,0) <> abs(vMntOprAff) then
          if nvl(pMnt,0) > abs(vMntOprAff) then  --Correction SJ 16/06/2009
            vCodeErreur := 'ERR_MAJCPT0009'; -- L'affectation est superieur au solde
            err_Rfr := err_RfrAff;
            err_LibTypOpr := err_LibTypOprAff;
            raise eErr_MajCpt;
          end if;
        end if;
        if pMnt = 0 then
          vCodeErreur := 'ERR_MAJCPT0010'; -- Le montant affecte est egal a 0
          err_Rfr := err_RfrAff;
          err_LibTypOpr := err_LibTypOprAff;
          raise eErr_MajCpt;
        end if;
        if pMnt < 0  then
          vCodeErreur := 'ERR_MAJCPT0016'; -- Le montant de l'operation ne peut pas etre negatif
          err_Rfr := err_RfrAff;
          err_LibTypOpr := err_LibTypOprAff;
          raise eErr_MajCpt;
        end if;
      -- On traite l'annulation des mensualites comme l'annulation
      -- d'un echeancier, mais on n'insere pas une operation
      -- d'annulation d'echeancier
      elsif vIdtTypOprAff = 19 then
        vMnt := null;
        vModImpAff := 5;
      else
        vMnt := null;
        -- Pour tous les cas sauf pour le retour d'impaye
        BEGIN
          vMsg := 'Recherche du type d''operation d''annulation';
          select IdtTypOpr
            into vIdtTypOprAnl
            from TYPOPR
            where IdtTypOprAnl = vIdtTypOprAff
             and  IdtTypOpr <> 9;
        EXCEPTION
          when NO_DATA_FOUND then
            vCodeErreur := 'ERR_MAJCPT0006'; -- Pas d'operation d'annulation
            err_LibTypOpr := err_LibTypOprAff;
            raise eErr_MajCpt;
        END;
        if vIdtTypOprAff = 4 then
          -- Pour l'annulation de facture on passe le type d'operation 3, on ne le considere pas comme erreur
          if nvl(pIdtTypOpr,vIdtTypOprAnl) not in (3,vIdtTypOprAnl) then
            vCodeErreur := 'ERR_MAJCPT0048'; -- L'operation passee en parametre ne corresponde pas a l'operation d'annulation
            raise eErr_MajCpt;
          end if;
        elsif nvl(pIdtTypOpr,vIdtTypOprAnl) <> vIdtTypOprAnl then
          vCodeErreur := 'ERR_MAJCPT0048'; -- L'operation passee en parametre ne corresponde pas a l'operation d'annulation
          raise eErr_MajCpt;
        END if;
      end if;
      vIdtTypOprAnl := nvl(pIdtTypOpr,vIdtTypOprAnl);
      -- Controles specifiques pour l'annulation d'une facture
      if vIdtTypOprAff = 1 then
        -- S'il s'agit d'une facture de caution, on autorise l'annulation
        -- que si la caution n'est pas liberee
        vMsg := 'Rechereche du type de facture';
        select IdtTypFct, EchPmtReg
          into vIdtTypFct, vEchReg
          from FAC, OPR
          where FAC.NumFct = OPR.Rfr
           and  OPR.IdtOpr = pIdtOprAff;
        if vIdtTypFct = 15 then
          select count(*)
            into vNbr
            from OPR OPRDG, LTT
            where IdtOprDbt = pIdtOprAff
             and  OPRDG.IdtOpr = LTT.IdtOprCrt
             and  EstOprAnl(OPRDG.IdtOpr) = 0
             and  OPRDG.IdtTypOpr in (33,34);
          if vNbr > 0 then
            vCodeErreur := 'ERR_MAJCPT0021'; -- La caution est deja liberee
            err_Rfr := err_RfrAff;
            err_LibTypOpr := err_LibTypOprAff;
            raise eErr_MajCpt;
          end if; -- vNbr > 0
        end if; -- vIdtTypFct = 15
        -- On n'autorise pas l'annulation s'il existe un echeancier de regularisation
        if vEchReg is not null then
          select count(*)
            into vNbr
            from ECHPMT
            where EchPmt    = vEchReg
             and  Typ       = 'R'
             and  IdtStaMns = 4;
          if vNbr = 0 then
            err_Rfr := to_char(vEchReg);
            vCodeErreur := 'ERR_MAJCPT0053'; -- Impossible annuler, il existe un echeancier de regularisation non annule
            raise eErr_MajCpt;
          end if; -- vNbr > 0
        end if; -- vEchReg is not null
      end if; -- vIdtTypOprAff = 1
      -- Controles specifiques pour l'annulation des reglements ou transfert de credits
      if vModImpAff = 2 or vIdtTypOprAff = 12 then
        -- S'il s'agit d'une annulation et pas d'un retour d'impaye partiel
        -- il ne faut pas que le reglement soit rembourse
        if nvl(pIdtTypOpr,0) <> 9 or (nvl(pIdtTypOpr,0) = 9 and nvl(pMnt,abs(vMntOprAff)) = abs(vMntOprAff)) then
          vMsg := 'Recherche si le reglement est rembourse';
          select count(*)
            into vNbr
            from TYPOPR, OPR OPRDBT, LTT
            where OPRDBT.IdtOpr = LTT.IdtOprDbt
             and  TYPOPR.IdtTypOpr = OPRDBT.IdtTypOpr
             and  LTT.IdtOprCrt = pIdtOprAff
             and  EstOprAnl(OPRDBT.IdtOpr) = 0
             and  TYPOPR.IdtModImp = 13;
          if vNbr > 0 then
            vCodeErreur := 'ERR_MAJCPT0018'; -- Le reglement est rembourse
            err_Rfr := err_RfrAff;
            err_LibTypOpr := err_LibTypOprAff;
            raise eErr_MajCpt;
          end if;
          -- Si le reglement a un retour d'impaye, il n'est pas possible de l'annuler
          vMsg := 'Recherche si le reglement est retourne impaye';
          select count(*)
            into vNbr
            from OPR OPRDBT, LTT
            where OPRDBT.IdtOpr = LTT.IdtOprDbt
             and  LTT.IdtOprCrt = pIdtOprAff
             and  EstOprAnl(OPRDBT.IdtOpr) = 0
             and  OPRDBT.IdtTypOpr = 9;
          if vNbr > 0 then
            vCodeErreur := 'ERR_MAJCPT0031'; -- Le reglement a des retours d'impaye
            err_Rfr := err_RfrAff;
            err_LibTypOpr := err_LibTypOprAff;
            raise eErr_MajCpt;
          end if;
        end if; -- nvl(pIdtTypOpr,0) <> 9 or (nvl(pIdtTypOpr,0) = 9 and nvl(pMnt,abs(vMntOprAff)) = abs(vMntOprAff))
      end if; -- vIdtTypOprAff in (2,12)
      -- Au cas où l'operation est deja annulee, est parce qu'on
      -- vient de l'annuler. On ne fait rien
      if EstOprAnl(pIdtOprAff) = 0 then
        vMsg := 'Recherche du character separator';
        select SprCdf
          into vSprCdf
          from PRMGNR;
        vMsg := 'Recherche de l''operation a annuler';
        select *
          into rOPR
          from OPR
          where IdtOpr = pIdtOprAff;
        -- Cas particulier pour l'annulation de mensualisation:
        -- on n'insere pas une operation d'annulation, on le fait
        -- dans le traitement de annulation des echeances
        if vIdtTypOprAff <> 19 then
          vMnt := nvl(vMnt,-rOPR.Mnt);
          vMsg := 'Recherche du type d''operation d''annulation';
          select Prfx, NbCar, PadCar, IdtTabSeq, DbtCrt, Lib
            into vPrfx, vNbCar, vPadCar, vIdtTabSeq, vDbtCrt, err_LibTypOpr
            from TYPOPR
            where IdtTypOpr = vIdtTypOprAnl;
          -- Controles de coherence entre debits/credits
          if vDbtCrtAff = 'D' and vDbtCrt = 'D' then
            vCodeErreur := 'ERR_MAJCPT0042'; -- Un debit ne peut pas annuler un debit
            raise eErr_MajCpt;
          end if;
          if vDbtCrtAff = 'C' and vDbtCrt = 'C' then
            vCodeErreur := 'ERR_MAJCPT0041'; -- Un credit ne peut pas annuler un credit
            raise eErr_MajCpt;
          end if;
          if pRfr is null then
            if vModImpAff in (5) then
              vRfr := rOPR.EchPmt;
            else
              vMsg := 'Recherche de la sequence pour la reference';
              X7_TRTSEQ01.X7_NxtTabSeq(vIdtTabSeq,vRfr);
              if vPadCar is not null AND NVL(vNbCar,0) != 0 THEN
                vRfr := lpad(vRfr,vNbCar,vPadCar);
              end if;
            end if;
            vRfr := vPrfx || vSprCdf || vRfr;
          else
            vRfr := pRfr;
          end if;
          err_Rfr := vRfr;
          vMsg := 'Recherche si l''operation existe';
          select count(*)
            into vNbr
            from OPR
            where Rfr = vRfr
             and  IdtTypOpr = vIdtTypOprAnl;
          if vNbr > 0 then
            vCodeErreur := 'ERR_MAJCPT0029'; -- L'operation existe deja
            raise eErr_MajCpt;
          end if;
          vMsg := 'Recherche situation';
          select count(*)
            into vNbr
            from SIT, OPR
            where SIT.IdtSit = OPR.IdtSit
             and  OPR.IdtOpr = pIdtOprAff
             and  SIT.LttAut = 1;
          if vNbr = 0 then
            err_LibTypOpr := err_LibTypOprAff;
            err_Rfr := err_RfrAff;
            vCodeErreur := 'ERR_MAJCPT0047'; -- La situation n'autorise pas l'annulation
            raise eErr_MajCpt;
          end if;
          vMsg := 'Recuperation nouveau Id';
          vSqcOpr:= SqcCptClt;
          vMsg := 'Recherche de la séquence de l''opération de routage';
          vSqcRtg := vSqcOpr;
          pIdtOpr := vSqcOpr;
          pRfr := vRfr;
          vIdtTypOprRtg := vIdtTypOprAnl;
          --BPZ 9467
          --mise à jour du retour d'impaye du client
          if vIdtTypOprAnl = 9 then
           select NbrRtrImp into vNbrRtrImp from prmgnr;
            update clt set
             RTRIPY = nvl(RTRIPY,0) + 1,
             intbnc = decode(least(nvl(RTRIPY,0) + 1,vNbrRtrImp),vNbrRtrImp,1,0) --SJ traitement de la fiche 9512, le 10/04/2012
            where idtclt = rOPR.IdtClt;
          end if;
          vMsg := 'Insertion operation d''annulation';
          INSERT INTO OPR (IdtClt,
                           IdtCptClt,
                           IdtOpr,
                           IdtTypOpr,
                           Rfr,
                           DatCrt,
                           DatExg,
                           DatVlr,
                           Mnt,
                           MntDvs,
                           Sld,
                           DatCnv,
                           Cmp,
                           IdtDvs,
                           IdtAgt,
                           IdtSit,
                           IdtOprOrg,
                           InfCpl,
                           IdtMtfRim,
                           Anl,
                           BrdRgr,
                           IdtCss,
                           IdtModRgl,
                           EchPmt)
                   VALUES (rOPR.IdtClt,
                           rOPR.IdtCptClt,
                           vSqcOpr,
                           vIdtTypOprAnl,
                           vRfr,
                           sysdate,
                           nvl(pDatExg,vDatVlr),
                           vDatVlr,
                           vMnt,
                           -rOPR.MntDvs,
                           vMnt,
                           rOPR.DatCnv,
                           0,
                           rOPR.IdtDvs,
                           pIdtAgt,
                           1,
                           vIdtOprOrg,
                           pInfCpl,
                           pIdtMtf,
                           0,
                           rOPR.BrdRgr,
                           rOPR.IdtCss,
                           rOPR.IdtModRgl,
                           rOPR.EchPmt);
          ------------------------------------------------
          --Contabilizaci?n de la operaci?n
          ------------------------------------------------
          --         if ModCmp = 1 then
          --           TrtCmp.TrtCmp(SqcCr, 'OPR');
          --         end if;
          -- Si aucune operation origine est donnee en parametre,
          -- l'operation d'origine sera l'operation creee
          vIdtOprOrg := nvl(vIdtOprOrg,vSqcOpr);
          vMsg := 'Identification des operations debitrices/creditrices';
          if vDbtCrt = 'D' then
            vMode         := 2;
            vIdtOprDbt    := vSqcOpr;
            vIdtTypOprDbt := vIdtTypOprAnl;
            vRfrDbt       := vRfr;
            vIdtOprCrt    := pIdtOprAff;
            vIdtTypOprCrt := vIdtTypOprAff;
            vRfrCrt       := vRfrAff;
          else
            vMode         := 1;
            vIdtOprDbt    := pIdtOprAff;
            vIdtTypOprDbt := vIdtTypOprAff;
            vRfrDbt       := vRfrAff;
            vIdtOprCrt    := vSqcOpr;
            vIdtTypOprCrt := vIdtTypOprAnl;
            vRfrCrt       := vRfr;
          end if;
          vMsg := 'Annulation des lettrages';
          AnlLttxOpr(pIdtAgt,
                     pIdtOprAff,
                     vMode,
                     vDatVlr,
                     vIdtOprOrg);
          vMsg := 'Lettrage de l''annulation';
          InsLtt(vIdtOprDbt, vIdtOprCrt, abs(vMnt), null, vDatVlr, vIdtOprOrg, null, pIdtAgt, null, vIdtLtt);
          -- On marque l'operation comme annulee s'il ne s'agit pas d'un retour d'impaye
          -- ou si le retour d'impayé est pour le montant total de l'operation
          if (nvl(pMnt,0) = abs(vMntOprAff) and pIdtTypOpr = 9) or nvl(pIdtTypOpr,0) <> 9 then
            vMsg := 'Mise a jour de l''operation annulee';
            update OPR
              set Anl = 1
              where IdtOpr = pIdtOprAff;
          end if; -- (nvl(pMnt,0) = abs(vMntOprAff) and pIdtTypOpr = 9) or nvl(pIdtTypOpr,0) <> 9
        end if; -- vIdtTypOprAff <> 19
        -- Dans le cas d'annulation d'un echeancier
        -- on insere une seule operation pour l'annulation
        -- des echeances
        if vModImpAff = 5 then
          vMsg := 'Cursor pour l''annulation des echeances';
          open cCur for
            select OPR.IdtOpr, OPR.Mnt, TYPOPR.IdtTypOpr
              from TYPOPR, OPR
              where TYPOPR.IdtTypOpr = OPR.IdtTypOpr
               and  OPR.EchPmt = rOPR.EchPmt
               and  TYPOPR.IdtModImp = 6
              order by OPR.DatCrt, OPR.IdtOpr;
            vMsg := 'Fetch des operations des echeances';
            fetch cCur
              BULK COLLECT into tIdtOpr, tMnt, tIdtTypOpr;
          close cCur;
          vMsg := 'Recherche type d''operation d''annulation';
          select IdtTypOpr
            into vIdtTypOprAnl
            from TYPOPR
            where IdtTypOprAnl = tIdtTypOpr(1);
          vMsg := 'Recherche du type d''operation d''annulation des echeances';
          select Prfx, NbCar, PadCar, IdtTabSeq, DbtCrt, Lib
            into vPrfx, vNbCar, vPadCar, vIdtTabSeq, vDbtCrt, err_LibTypOpr
            from TYPOPR
            where IdtTypOpr = vIdtTypOprAnl;
          vRfr := rOPR.EchPmt;
          vRfr := vPrfx || vSprCdf || vRfr;
          err_Rfr := vRfr;
          vMsg := 'Recherche si l''operation existe';
          select count(*)
            into vNbr
            from OPR
            where Rfr = vRfr
             and  IdtTypOpr = vIdtTypOprAnl;
          if vNbr > 0 then
            vCodeErreur := 'ERR_MAJCPT0029'; -- L'operation existe deja
            raise eErr_MajCpt;
          end if;
          -- Si le montant est null (cas d'annulation de mensualisation)
          if vMnt is null then
            vMnt := 0;
            for i in 1..tMnt.Count loop
              vMnt := vMnt + tMnt(i);
            end loop;
          end if; -- vMnt = null
          vMsg := 'Recuperation nouveau Id';
          vSqcOpr:= SqcCptClt;
          vMsg := 'Insertion d''operation d''annulation des echeances';
          INSERT INTO OPR (IdtClt,
                           IdtCptClt,
                           IdtOpr,
                           IdtTypOpr,
                           Rfr,
                           DatCrt,
                           DatExg,
                           DatVlr,
                           Mnt,
                           Sld,
                           DatCnv,
                           Cmp,
                           IdtDvs,
                           IdtAgt,
                           IdtSit,
                           IdtOprOrg,
                           Anl,
                           EchPmt)
                   VALUES (rOPR.IdtClt,
                           rOPR.IdtCptClt,
                           vSqcOpr,
                           vIdtTypOprAnl,
                           vRfr,
                           sysdate,
                           nvl(pDatExg,vDatVlr),
                           vDatVlr,
                           -vMnt,
                           -vMnt,
                           rOPR.DatCnv,
                           0,
                           rOPR.IdtDvs,
                           pIdtAgt,
                           1,
                           vIdtOprOrg,
                           0,
                           rOPR.EchPmt);
          vMsg := 'Loop sur les echeances';
          if tIdtOpr.Count > 0 then
            for i in 1..tIdtOpr.Count loop
              vMsg := 'Annulation des lettrages des echeances';
              AnlLttxOpr(pIdtAgt,
                         tIdtOpr(i),
                         1,
                         vDatVlr,
                         vIdtOprOrg);
              vMsg := 'Lettrage d''annulation d''echeance';
              InsLtt(tIdtOpr(i), vSqcOpr, tMnt(i), null, vDatVlr, vIdtOprOrg, null, pIdtAgt, null, vIdtLtt);
            end loop;
            vMsg := 'Mise a jour de l''operation echeance';
            forall i in 1..tIdtOpr.Count
              update OPR
                set Anl = 1
                where IdtOpr = tIdtOpr(i);
          end if; -- tIdtOpr.Count > 0
        end if; -- vModImpAff = 5
        -- Dans le cas de l'annulation des factures,
        -- on annule la liberation de caution s'il en a
        if vIdtTypOprAff in (1,4) then
          vMsg := 'Cursor pour les operations a annuler (1,4)';
          -- Il peut y avoir une operation du type 33 ou une operation du type 34
          -- ou une de chaque une, et il peut y avoir plusieurs liberations de caution
          -- effectuees; donc, on prends le min(IdtOpr) de la liberation non annule pour chaque caution
          open cCur for
            select IdtOpr
              from (select LTT.IdtOprDbt, min(LTT.IdtOprCrt) IdtOpr
                      from LTT, OPR
                      where Ltt.IdtOprCrt = OPR.IdtOpr
                       and  OPR.IdtTypOpr in (33,34)
                       and  CLTBTC01.EstOprAnl(OPR.IdtOpr) = 0
                       and  OPR.IdtOprOrg = pIdtOprAff
                      group by LTT.IdtOprDbt);
        -- Dans le cas d'annulation de solde de depot de garantie on annule aussi la liberation
        elsif vIdtTypOprAff = 33 then
          vMsg := 'Cursor pour les operations a annuler (33)';
          open cCur for
            select distinct OPR.IdtOpr
              from OPR, LTT, LTT LTT33
              where LTT.IdtOprDbt   = LTT33.IdtOprDbt
               and  OPR.IdtOpr      = LTT.IdtOprCrt
               and  LTT33.IdtOprCrt = pIdtOprAff
               and  OPR.IdtTypOpr in (34)
               and  EstOprAnl(OPR.IdtOpr) = 0;
        -- Dans le cas d'annulation de liberation de depot de garantie on annule aussi le solde
        elsif vIdtTypOprAff = 34 then
          vMsg := 'Cursor pour les operations a annuler (34)';
          open cCur for
            select distinct OPR.IdtOpr
              from OPR, LTT, LTT LTT34
              where LTT.IdtOprDbt   = LTT34.IdtOprDbt
               and  OPR.IdtOpr      = LTT.IdtOprCrt
               and  LTT34.IdtOprCrt = pIdtOprAff
               and  OPR.IdtTypOpr in (33)
               and  EstOprAnl(OPR.IdtOpr) = 0;
        -- S'il s'agit d'un retour d'impaye partiel, on n'annule rien
        elsif vIdtTypOprAnl = 9 and abs(vMntOprAff) <> pMnt then
          vMsg := 'Cursor pour les operations a annuler (9)';
          open cCur for
            select IdtOpr
              from OPR
              where 1 = 0;
        -- Dans le cas d'annulation des reglements, on annule les transferts
        elsif vModImpAff = 2 then
          vMsg := 'Cursor pour les operations a annuler (2)';
          open cCur for
            select distinct OPR.IdtOpr
              from OPR, LTT
              where OPR.IdtOpr = LTT.IdtOprDbt
               and  LTT.IdtOprCrt = pIdtOprAff
               and  EstOprAnl(OPR.IdtOpr) = 0
               and  OPR.IdtTypOpr = 10
            union
            select IdtOpr from
              (select distinct IdtOpr, DatCrt
                 from OPR
                 where IdtOprOrg = pIdtOprAff
                  and  EstOprAnl(OPR.IdtOpr) = 0
                  and  IdtTypOpr not in (select IdtTypOpr
                                          from TYPOPR
                                          where IdtTypOprAnl is not null)
                order by DatCrt);
        else
          vMsg := 'Cursor pour les operations a annuler';
          open cCur for
            select IdtOpr
              from (select distinct IdtOpr, DatCrt
                      from OPR
                      where IdtOprOrg = pIdtOprAff
                       and  EstOprAnl(OPR.IdtOpr) = 0
                       and  IdtTypOpr not in (select IdtTypOpr
                                                from TYPOPR
                                                where IdtTypOprAnl is not null)
                      order by DatCrt);
        end if; -- vIdtTypOprAff in (1,4)
        vMsg := 'Fetch des operations';
        fetch cCur
          BULK COLLECT into tIdtOpr;
        close cCur;
        vMsg := 'Loop sur les operations a annuler';
        vNbr := tIdtOpr.Count;
        if tIdtOpr.Count > 0 then
          for i in 1..tIdtOpr.Count loop
            vRfr := null;
            vIdtOpr := null;
            MAJOPRLTT (pModImp=>21,
                       pIdtAgt=>pIdtAgt,
                       pIdtCltOrg=>pIdtCltOrg,
                       pIdtCptCltOrg=>pIdtCptCltOrg,
                       pRfr=>vRfr,
                       pIdtOpr=>vIdtOpr,
                       pDatVlr=>vDatVlr,
                       pDatExg=>pDatExg,
                       pDatCnv=>vDatCnv,
                       pIdtCltDst=>pIdtCltDst,
                       pIdtCptCltDst=>pIdtCptCltDst,
                       pIdtOprAff=>tIdtOpr(i),
                       pIdtOprOrg=>vIdtOprOrg,
                       pIdtDvs=>vIdtDvs,
                       pIdtMtf=>pIdtMtf,
                       pInfCpl=>pInfCpl,
                       pMsg=>pMsg);
            if pMsg is not null then
              raise eErr_MajCpt;
            end if;
          end loop; --i in 1..tIdtOpr.Count
        end if; -- tIdtOpr.Count > 0
        if vIdtTypOprAff = 2 then
          ---------------------------------------------------------------------------------
          -- Annulation des mouvements de pénalités précédemment gérés sur le paiement annulé
          ---------------------------------------------------------------------------------
          IF X7_Trtpen01_Spc.X7_MdlPenRglIns = 1 THEN
            vMsg := 'Appel de la procedure d''annulation des penalites generees';
            X7_Trtpen01_Spc.X7_AnlMvmExcPenRgl(TO_NUMBER(rOPR.Rfr), pIdtAgt, vCr);
          END IF;
        end if;
      end if; -- EstOprAnl(pIdtOprAff) = 0
    ----------------------------------------------------------------------------------------------------------------------------------------------------------
    ----------------------------------------------------------------------------------------------------------------------------------------------------------
    -- MODE D'IMPUTATION 22: ANNULATION DE LETTRAGE
    ----------------------------------------------------------------------------------------------------------------------------------------------------------
    ----------------------------------------------------------------------------------------------------------------------------------------------------------
    when vModImp = 22 then
      vMsg := 'Recherche des information du lettrage';
      BEGIN
        select *
          into rLTT
          from LTT
          where IdtLtt = pIdtLtt;
      EXCEPTION
        when NO_DATA_FOUND then
          vCodeErreur := 'ERR_MAJCPT0011';  -- Le lettrage n'existe pas
          raise eErr_MajCpt;
        when others then
          raise;
      END;
      if EstLttAnl(pIdtLtt) = 1 then
        vCodeErreur := 'ERR_MAJCPT0019'; -- Le lettrage est annule
        raise eErr_MajCpt;
      end if;
      vMsg := 'Recherche s''il s''agit d''une lettrage d''annulation pour l''operation debitrice';
      select count(*)
        into vNbr
        from TYPOPR, OPR
        where TYPOPR.IdtTypOpr = OPR.IdtTypOpr
         and  TYPOPR.IdtTypOprAnl is not null
         and  OPR.IdtOpr = rLTT.IdtOprDbt;
      if vNbr > 0 then
        vCodeErreur := 'ERR_MAJCPT0034'; -- Le lettrage est une lettrage d'annulation
        vMsg := 'Recherche type d''operation debitrice';
        select OPR.Rfr, TYPOPR.Lib
          into err_Rfr, err_LibTypOpr
          from TYPOPR, OPR
          where TYPOPR.IdtTypOpr = OPR.IdtTypOpr
           and  OPR.IdtOpr = rLTT.IdtOprCrt;
        raise eErr_MajCpt;
      end if;
      vMsg := 'Recherche s''il s''agit d''une lettrage d''annulation pour l''operation creditrice';
      select count(*)
        into vNbr
        from TYPOPR, OPR
        where TYPOPR.IdtTypOpr = OPR.IdtTypOpr
         and  TYPOPR.IdtTypOprAnl is not null
         and  OPR.IdtOpr = rLTT.IdtOprCrt;
      if vNbr > 0 then
        vCodeErreur := 'ERR_MAJCPT0034'; -- Le lettrage est une lettrage d'annulation
        vMsg := 'Recherche type d''operation creditrice';
        select OPR.Rfr, TYPOPR.Lib
          into err_Rfr, err_LibTypOpr
          from TYPOPR, OPR
          where TYPOPR.IdtTypOpr = OPR.IdtTypOpr
           and  OPR.IdtOpr = rLTT.IdtOprDbt;
        raise eErr_MajCpt;
      end if;
      -- Un lettrage ne peut pas etre annule si l'operation est annule
      vMsg := 'Recherche si l''operation est annulee';
      select EstOprAnl(LTT.IdtOprDbt), EstOprAnl(LTT.IdtOprCrt)
        into vNbr, vNbr2
        from LTT
        where IdtLtt = pIdtLtt;
      if vNbr = 1 or vNbr2 = 1 then
        vCodeErreur := 'ERR_MAJCPT0033'; -- L'operation est annulee
        if vNbr = 1 then
          vMsg := 'Recherche type d''operation debitrice';
          select OPR.Rfr, TYPOPR.Lib
            into err_Rfr, err_LibTypOpr
            from TYPOPR, OPR, LTT
            where OPR.IdtOpr = LTT.IdtOprDbt
             and  TYPOPR.IdtTypOpr = OPR.IdtTypOpr
             and  LTT.IdtLtt = pIdtLtt;
          raise eErr_MajCpt;
        else
          vMsg := 'Recherche type d''operation creditrice';
          select OPR.Rfr, TYPOPR.Lib
            into err_Rfr, err_LibTypOpr
            from TYPOPR, OPR, LTT
            where OPR.IdtOpr = LTT.IdtOprCrt
             and  TYPOPR.IdtTypOpr = OPR.IdtTypOpr
             and  LTT.IdtLtt = pIdtLtt;
          raise eErr_MajCpt;
        end if;
      end if;
      vIdtOprDbt    := rLtt.IdtOprDbt;
      vIdtOprCrt    := rLtt.IdtOprCrt;
      vMsg := 'Recherche de la reference et type d''operation debitrice';
      select OPR.Rfr, OPR.IdtTypOpr, SIT.IdtSit, nvl(SIT.LttAut,0), TYPOPR.IdtModImp
        into vRfrDbt, vIdtTypOprDbt, vIdtSit, vNbr, vModImpDbt
        from SIT, TYPOPR, OPR
        where TYPOPR.IdtTypOpr = OPR.IdtTypOpr
         and  SIT.IdtSit = OPR.IdtSit
         and  OPR.IdtOpr = vIdtOprDbt;
      if vNbr = 0 then
        select Lib
          into err_LibTypOpr
          from TYPOPR
          where IdtTypOpr = vIdtTypOprDbt;
        err_Rfr := vRfrDbt;
        vCodeErreur := 'ERR_MAJCPT0049'; -- La situation n'autorise pas la desaffectation
        raise eErr_MajCpt;
      end if;
      vMsg := 'Recherche de la reference et type d''operation creditrice';
      select OPR.Rfr, OPR.IdtTypOpr, SIT.IdtSit, nvl(SIT.LttAut,0), TYPOPR.IdtModImp
        into vRfrDbt, vIdtTypOprCrt, vIdtSit, vNbr, vModImpCrt
        from SIT, TYPOPR, OPR
        where TYPOPR.IdtTypOpr = OPR.IdtTypOpr
         and  SIT.IdtSit = OPR.IdtSit
         and  OPR.IdtOpr = vIdtOprCrt;
      if vNbr = 0 then
        select Lib
          into err_LibTypOpr
          from TYPOPR
          where IdtTypOpr = vIdtTypOprCrt;
        err_Rfr := vRfrCrt;
        vCodeErreur := 'ERR_MAJCPT0049'; -- La situation n'autorise pas la desaffectation
        raise eErr_MajCpt;
      end if;
      -- Pour certains operation debitrices, il n'est pas possible
      -- d'annuler le lettrage
      if vIdtTypOprDbt in (9, 10, 15, 30, 31) or vModImpDbt in (30) then
        vCodeErreur := 'ERR_MAJCPT0038'; -- Le lettrage ne peut pas etre annule
        vMsg := 'Recherche type d''operation debitrice';
        select OPR.Rfr, TYPOPR.Lib
          into err_Rfr, err_LibTypOpr
          from TYPOPR, OPR
          where OPR.IdtOpr = rLTT.IdtOprDbt
           and  TYPOPR.IdtTypOpr = OPR.IdtTypOpr;
        raise eErr_MajCpt;
      end if;
      -- Pour certains operation creditrices, il n'est pas possible
      -- d'annuler le lettrage
      if vIdtTypOprCrt in (6, 16, 20, 22, 32,33, 34) or vModImpCrt in (5) then
        vCodeErreur := 'ERR_MAJCPT0038'; -- Le lettrage ne peut pas etre annule
        vMsg := 'Recherche type d''operation debitrice';
        select OPR.Rfr, TYPOPR.Lib
          into err_Rfr, err_LibTypOpr
          from TYPOPR, OPR
          where OPR.IdtOpr = rLTT.IdtOprCrt
           and  TYPOPR.IdtTypOpr = OPR.IdtTypOpr;
        raise eErr_MajCpt;
      end if;
      vMsg := 'Annulation de lettrage';
      AnlLtt (pIdtAgt,
              pIdtLtt,
              vDatVlr,
              pIdtOprOrg);
      if pMsg is not null then
        raise eErr_MajCpt;
      end if;
    ----------------------------------------------------------------------------------------------------------------------------------------------------------
    ----------------------------------------------------------------------------------------------------------------------------------------------------------
    -- MODE D'IMPUTATION 23: LIBERATION MENSUALISATION
    ----------------------------------------------------------------------------------------------------------------------------------------------------------
    ----------------------------------------------------------------------------------------------------------------------------------------------------------
    when vModImp = 23 then
      vMsg := 'Recherche de l''etat de la mensualisation';
      BEGIN
        select IdtStaMns, IdtPrdFac, IdtCtr
          into vIdtStaMns, vIdtPrdMns, vIdtCtr
          from ECHPMT
          where EchPmt = vEchPmt;
      EXCEPTION
        when NO_DATA_FOUND then
          vCodeErreur := 'ERR_MAJCPT0035'; -- La mensualisation n'existe pas
          err_Rfr := to_char(vEchPmt);
          err_LibTypOpr := err_LibTypOprAff;
          raise eErr_MajCpt;
        when others then
          raise;
      END;
      if vIdtStaMns in (3,4) then
        vCodeErreur := 'ERR_MAJCPT0005'; -- La mensualisation est annulee
        err_Rfr := to_char(vEchPmt);
        err_LibTypOpr := err_LibTypOprAff;
        raise eErr_MajCpt;
      elsif vIdtStaMns in (1,2) then
        vMsg := 'Recherche si la mensualisation est liberee';
        select count(*)
          into vNbr
          from OPR
          where EchPmt = vEchPmt
           and  IdtTypOpr = 22;
        if vNbr > 0 then
          vCodeErreur := 'ERR_MAJCPT0020'; -- La mensualisation a ete deja liberee
          err_Rfr := to_char(vEchPmt);
          err_LibTypOpr := err_LibTypOprAff;
          raise eErr_MajCpt;
        end if;
        vMsg := 'Recherche s''il existe au moins une echeance non annulee';
        select count(*)
          into vNbr
          from OPR
          where EchPmt = vEchPmt
           and  IdtTypOpr = 19
           and  EstOprAnl(OPR.IdtOpr) = 0;
        if vNbr = 0 then
          vCodeErreur := 'ERR_MAJCPT0005'; -- La mensualisation est annulee
          err_Rfr := to_char(vEchPmt);
          err_LibTypOpr := err_LibTypOprAff;
          raise eErr_MajCpt;
        end if;
        tIdtOpr.delete;
        tMnt.delete;
        tSld.delete;
        vMsg := 'Recherche des echeances de mensualisation';
        open cCur for
          select IdtOpr, Mnt, Sld
            from OPR
            where EchPmt = vEchPmt
             and  IdtTypOpr = 19
             and  EstOprAnl(OPR.IdtOpr) = 0
            order by DatCrt, IdtOpr;
          FETCH cCur
            BULK COLLECT into tIdtOpr, tMnt, tSld;
        close cCur;
        -- On recupere les credits affectes sur les mensualites
        -- avant d'annuler les lettrages
        tIdtOprCrt.delete;
        tMntCrt.delete;
        tSldCrt.delete;
        vMsg := 'Recherche des reglements sur les mensualites';
        open cCur for
          select LTT.IdtOprCrt, -sum(LTT.Mnt)
            from OPR OPRCRT, LTT, OPR OPRDBT
            where LTT.IdtOprDbt = OPRDBT.IdtOpr
             and  OPRCRT.IdtOpr = LTT.IdtOprCrt
             and  OPRDBT.EchPmt = vEchPmt
             and  OPRDBT.IdtTypOpr = 19
             and  EstOprAnl(OPRDBT.IdtOpr) = 0
--             and  OPRCRT.IdtTypOpr in (2,12)
             and  EstOprAnl(OPRCRT.IdtOpr) = 0
             and  EstLttAnl(LTT.IdtLtt) = 0
             and  LTT.Mnt > 0
            group by LTT.IdtOprCrt
            order by LTT.IdtOprCrt;
          FETCH cCur
            BULK COLLECT into tIdtOprCrt, tMntCrt;
        close cCur;
        vMntTotMns := 0;
        vMntSldMns := 0;
        vMsg := 'Loop sur les echeances de mensualisation';
        if tIdtOpr.Count > 0 then
          for i in 1..tIdtOpr.Count loop
            -- Montant total de la mensualisation
            vMntTotMns := vMntTotMns + tMnt(i) - tSld(i);
            vMntSldMns := vMntSldMns + tSld(i);
          end loop;
        end if; -- tIdtOpr.Count > 0
        if pRfr is null then
          vMsg := 'Recherche de la sequence pour la reference';
          vRfr := to_char(vEchPmt);
          if vPadCar is not null AND NVL(vNbCar,0) != 0 THEN
            vRfr := lpad(vRfr,vNbCar,vPadCar);
          end if;
          vRfr := vPrfx || vSprCdf || vRfr;
        else
          vRfr := pRfr;
        end if;
        err_Rfr := vRfr;
        vMsg := 'Recherche si l''operation existe';
        select count(*)
          into vNbr
          from OPR
          where Rfr = vRfr
           and  IdtTypOpr = pIdtTypOpr;
        if vNbr > 0 then
          vCodeErreur := 'ERR_MAJCPT0029'; -- L'operation existe deja
          raise eErr_MajCpt;
        end if;
        vMsg := 'Recuperation nouveau Id';
        vSqcOpr:= SqcCptClt;
        vMsg := 'Recherche de la séquence de l''opération de routage';
        vSqcRtg := vSqcOpr;
        pIdtOpr := vSqcOpr;
        pRfr := vRfr;
        vIdtTypOprRtg := pIdtTypOpr;
        vMsg := 'Insertion operation de mensualisation';
        -- On insere l'operation, meme si le montant de la mensualisation est egal a 0
        INSERT INTO OPR (IdtClt,
                         IdtCptClt,
                         IdtOpr,
                         IdtTypOpr,
                         Rfr,
                         DatCrt,
                         DatExg,
                         DatVlr,
                         Mnt,
                         Sld,
                         DatCnv,
                         Cmp,
                         IdtDvs,
                         IdtAgt,
                         IdtSit,
                         IdtOprOrg,
                         InfCpl,
                         IdtMtfRim,
                         Anl,
                         EchPmt,
                         IdtModRgl)
                 VALUES (pIdtCltOrg,
                         pIdtCptCltOrg,
                         pIdtOpr,
                         pIdtTypOpr,
                         vRfr,
                         sysdate,
                         nvl(pDatExg,vDatVlr),
                         vDatVlr,
                         -vMntTotMns,
                         -vMntTotMns,
                         vDatCnv,
                         0,
                         vIdtDvs,
                         pIdtAgt,
                         1,
                         pIdtOprOrg,
                         pInfCpl,
                         pIdtMtf,
                         0,
                         vEchPmt,
                         0);
        vIdtOprDbt    := null;
        vIdtTypOprDbt := null;
        vRfrDbt       := null;
        vIdtOprCrt    := vSqcOpr;
        vIdtTypOprCrt := pIdtTypOpr;
        vRfrCrt       := vRfr;
        vIdtOprOrg    := nvl(pIdtOprOrg, vSqcOpr);
        vIdtOpr       := vSqcOpr;
        if vMntSldMns > 0 then
          vMsg := 'Recherche du type d''operation d''annulation de mensualite';
          select Prfx, IdtTabSeq, IdtTypOpr, NbCar, PadCar, Lib
            into vPrfx, vIdtTabSeq, vIdtTypOpr, vNbCar, vPadCar, err_LibTypOpr
            from TYPOPR
            where IdtTypOprAnl = vIdtTypOprAff;
          vMsg := 'Recuperation nouveau Id';
          vSqcOpr:= SqcCptClt;
          vMsg := 'Recherche de la sequence pour la reference';
          if vPrfx is not null then
            vRfr := vPrfx || vSprCdf || to_char(vEchPmt);
          else
            vRfr := to_char(vEchPmt);
          end if;
          vMsg := 'Recherche si l''operation existe';
          select count(*)
            into vNbr
            from OPR
            where Rfr = vRfr
             and  IdtTypOpr = vIdtTypOpr;
          if vNbr > 0 then
            vCodeErreur := 'ERR_MAJCPT0029'; -- L'operation existe deja
            err_Rfr := vRfr;
            raise eErr_MajCpt;
          end if;
          vMsg := 'Insertion de l''operation d''annulation du solde de la mensualite';
          INSERT INTO OPR (IdtClt,
                           IdtCptClt,
                           IdtOpr,
                           IdtTypOpr,
                           Rfr,
                           DatCrt,
                           DatExg,
                           DatVlr,
                           Mnt,
                           Sld,
                           DatCnv,
                           Cmp,
                           IdtDvs,
                           IdtAgt,
                           IdtSit,
                           IdtOprOrg,
                           InfCpl,
                           IdtMtfRim,
                           Anl,
                           EchPmt,
                           IdtModRgl)
                   VALUES (pIdtCltOrg,
                           pIdtCptCltOrg,
                           vSqcOpr,
                           vIdtTypOpr,
                           vRfr,
                           sysdate,
                           nvl(pDatExg,vDatVlr),
                           vDatVlr,
                           -vMntSldMns,
                           -vMntSldMns,
                           vDatCnv,
                           0,
                           vIdtDvs,
                           pIdtAgt,
                           1,
                           pIdtOprOrg,
                           pInfCpl,
                           pIdtMtf,
                           0,
                           vEchPmt,
                           0);
        end if; -- vMntSldMns > 0
        if tIdtOpr.Count > 0 then
          for i in 1..tIdtOpr.Count loop
            -- Si le solde est different du montant, il y a des lettrages
            -- non annules, donc on les annule
            if tSld(i) <> tMnt(i) then
              vMsg := 'Annulation des lettrages';
              AnlLttxOpr(pIdtAgt,
                         tIdtOpr(i),
                         1,
                         vDatVlr,
                         vIdtOprOrg);
            end if; -- tSld(i) <> tMnt(i)
            -- S'il y a un solde, on annule le solde
            if tSld(i) > 0 then
              vMsg := 'Insertion de lettrage d''annulation de mensualite';
              InsLtt(tIdtOpr(i), vSqcOpr, tSld(i), null, vDatVlr, vIdtOprOrg, null, pIdtAgt, null, vIdtLtt);
            end if; --tSld(i) > 0
            -- S'il y a un montant affecte
            if tMnt(i) - tSld(i) > 0 then
              vMsg := 'Insertion de lettrage de mensualisation';
              InsLtt(tIdtOpr(i), vIdtOpr, (tMnt(i) - tSld(i)), null, vDatVlr, vIdtOprOrg, null, pIdtAgt, null, vIdtLtt);
            end if; -- tMnt(i) - tSld(i) > 0
            -- Dans tous les cas on marque la mensualite comme annulee
            vMsg := 'Mise a jour des mensualites';
            update OPR
              set Anl = 1
              where IdtOpr = tIdtOpr(i);
          end loop; --i in 1..tOPR.Count
        end if; -- tIdtOpr.Count > 0
        -- On affecte les credits liberes sur la facture de la periode de la mensualisation
        -- On cherche la facture mensualise.
        vIdtOprFac := null;
        if pIdtOprOrg is not null then
          vIdtOprFac := pIdtOprOrg;
        else
          BEGIN
            vMsg := 'Recherche de la facture mensualisee';
            open cCur for
              select OPR.IdtOpr
                from OPR, FAC, CTRFAC
                where FAC.IdtFac = CTRFAC.IdtFac
                 and  OPR.Rfr    = FAC.NumFct
                 and  OPR.IdtTypOpr = 1
                 and  EstOprAnl(OPR.IdtOpr) = 0
                 and  CTRFAC.IdtCtr = vIdtCtr
                 and  CTRFAC.IdtPrdFac >= vIdtPrdMns
                order by CTRFAC.IdtPrdFac;
              fetch cCur into vIdtOprFac;
            close cCur;
          EXCEPTION
            when NO_DATA_FOUND then
              null;
            when others then
              raise;
          END;
        end if; --pIdtOprOrg is not null
        -- Nous allons affecter les reglements de mensualite sur la facture
        if vIdtOprFac is not null then
          vMsg := 'Recherche de l''information de la facture mensualisee';
          select *
            into rOPR
            from OPR
            where IdtOpr = vIdtOprFac;
          vMsg := 'Loop sur les credits de mensualisation';
          for i in 1..tIdtOprCrt.Count loop
            if rOPR.Sld <= 0 then
              EXIT;
            end if;
            if tMntCrt(i) > 0 then
              vCodeErreur := 'ERR_MAJCPT0045'; -- Le solde d'une operation creditrice ne peut pas etre positif
              select OPR.Rfr, TYPOPR.Lib
                into err_Rfr, err_LibTypOpr
                from TYPOPR, OPR
                where TYPOPR.IdtTypOpr = OPR.IdtTypOpr
                 and  OPR.IdtOpr = tIdtOprCrt(i);
              raise eErr_MAJCPT;
            end if;
            if tMntCrt(i) < 0 then
              vMntLtt := least(abs(tMntCrt(i)),rOPR.Sld);
              vMsg := 'Insertion de lettrage d''affectation';
              InsLtt(rOPR.IdtOpr, tIdtOprCrt(i), vMntLtt, null, vDatVlr, vIdtOprOrg, null, pIdtAgt, null, vIdtLtt);
              rOPR.Sld := rOPR.Sld - vMntLtt;
              tMntCrt(i) := tMntCrt(i) + vMntLtt;
            end if; -- tMntCrt(i) < 0
          end loop; -- i in 1..tIdtOprCrt.Count
        end if; --vIdtOprFac is not null
      end if; --vIdtStaMns in (1,2)
    ----------------------------------------------------------------------------------------------------------------------------------------------------------
    ----------------------------------------------------------------------------------------------------------------------------------------------------------
    -- MODE D'IMPUTATION 24: LIBERATION DEPOT DE GARANTIE
    ----------------------------------------------------------------------------------------------------------------------------------------------------------
    ----------------------------------------------------------------------------------------------------------------------------------------------------------
    when vModImp = 24 then
      BEGIN
        vMsg := 'Recherche de l''operation affectee';
        select *
          into rOPR
          from OPR
          where IdtOpr = pIdtOprAff;
      EXCEPTION
        when NO_DATA_FOUND then
          vCodeErreur := 'ERR_MAJCPT0036'; -- La caution n'existe pas
          raise eErr_MajCpt;
      END;
      if rOPR.IdtTypOpr = 1 then
        vMsg := 'Recherche type de facture';
        select IdtTypFct
          into vIdtTypFct
          from FAC
          where NumFct = rOPR.Rfr;
        if vIdtTypFct <> '15' then
          vCodeErreur := 'ERR_MAJCPT0037'; -- Il n'est pas une caution
          err_Rfr := rOPR.Rfr;
          err_LibTypOpr := err_LibTypOprAff;
          raise eErr_MajCpt;
        end if;
      else
        vCodeErreur := 'ERR_MAJCPT0037'; -- Il n'est pas une caution
        err_Rfr := rOPR.Rfr;
        err_LibTypOpr := err_LibTypOprAff;
        raise eErr_MajCpt;
      end if;
      vMsg := 'Recherche si la caution est annulee';
      if EstOprAnl(pIdtOprAff) = 1 then
        vCodeErreur := 'ERR_MAJCPT0050'; -- La caution est annulee
        err_Rfr := rOPR.Rfr;
        err_LibTypOpr := err_LibTypOprAff;
        raise eErr_MajCpt;
      end if;
      vMsg := 'Recherche si la caution a ete liberee';
      select count(*)
        into vNbr
        from OPR, LTT
        where OPR.IdtOpr = LTT.IdtOprCrt
         and  LTT.IdtOprDbt = pIdtOprAff
         and  OPR.IdtTypOpr in (33,34)
         and  EstOprAnl(OPR.IdtOpr) = 0;
      -- FBE: 30/11/2012: Fiche 10598: Si le depot de garantie n'est pas libere, on fait le test au cas
      --                  ou la liberation a deja ete fait avec le systeme de liberation anterieur
      if vNbr = 0 then
        select COUNT(*)
          into vNbr
            from OPR, PRMGNR
        where OPR.IdtClt = rOPR.IdtClt
         and  OPR.IdtCptClt = rOPR.IdtCptClt
         and  DECODE(INSTR(OPR.RFR,PRMGNR.SprCdf),0,OPR.rfr,SUBSTR(OPR.rfr,INSTR(OPR.rfr,PRMGNR.SprCdf)+1)) = TO_CHAR(rOpr.IdtOpr)         -- SJ - F1038 modif pour recuperer le prefix du solde depot garantie et lingrn
         and  OPR.IdtTypOpr IN (33,34);
      end if; -- vNbr = 0
      if vNbr > 0 then
        vCodeErreur := 'ERR_MAJCPT0021'; -- La caution est deja liberee
        err_Rfr := rOPR.Rfr;
        err_LibTypOpr := err_LibTypOprAff;
        raise eErr_MajCpt;
      end if;
      vMsg := 'Cursor pour les reglements de la caution';
      open cCur for
        select LTT.IdtLtt, LTT.IdtOprCrt, LTT.Mnt
          from OPR, LTT
          where OPR.IdtOpr = LTT.IdtOprCrt
           and  LTT.IdtOprDbt = pIdtOprAff
           and  EstOprAnl(LTT.IdtOprCrt) = 0
           and  EstLttAnl(LTT.IdtLtt) = 0
           and  LTT.Mnt > 0
           and  OPR.IdtTypOpr in (2,12);
        vMsg := 'Fetch des paiements de caution';
        fetch cCur
          BULK COLLECT into tIdtLtt, tIdtOpr, tMnt;
      close cCur;
      vMsg := 'Recuperation nouveau Id';
      vSqcOpr:= SqcCptClt;
      pIdtOpr := vSqcOpr;
      vMntLtt := 0;
      vIdtOprOrg := pIdtOprOrg;
      if tIdtLtt.Count > 0 then
        for i in 1..tIdtLtt.Count loop
          vIdtOprOrg := nvl(pIdtOprOrg,vSqcOpr);
          vMsg := 'Annulation des lettrage de reglement de caution';
          AnlLtt(pIdtAgt, tIdtLtt(i), vDatVlr, vIdtOprOrg);
          vMntLtt := vMntLtt + tMnt(i);
        end loop;
      end if; -- tIdtLtt.Count > 0
      -- S'il y a des reglements, on insere l'operation de liberation pour solder la facture
      if vMntLtt > 0 then
        vIdtTypOpr := 34;
        vMsg := 'Recherche de la séquence de l''opération de routage';
        vSqcRtg := vSqcOpr;
        vIdtTypOprRtg := 34;
        if pIdtTypOpr <> 34 then
          vMsg := 'Recherche type d''operation de liberation';
          select Prfx, IdtTabSeq, PadCar, NbCar, Lib
            into vPrfx, vIdtTabSeq, vPadCar, vNbCar, err_LibTypOpr
            from TYPOPR
            where IdtTypOpr = 34;
        end if;
        vMsg := 'Recherche de la sequence pour la reference';
        X7_TRTSEQ01.X7_NxtTabSeq(vIdtTabSeq,vRfr);
        if vPadCar is not null AND NVL(vNbCar,0) != 0 THEN
          vRfr := lpad(vRfr,vNbCar,vPadCar);
        end if;
        if vPrfx is not null then
          vRfr := vPrfx || vSprCdf || vRfr;
        end if;
        pRfr := vRfr;
        err_Rfr := vRfr;
        vMsg := 'Recherche si l''operation existe';
        select count(*)
          into vNbr
          from OPR
          where Rfr = vRfr
           and  IdtTypOpr = 34;
        if vNbr > 0 then
          vCodeErreur := 'ERR_MAJCPT0029'; -- L'operation existe deja
          raise eErr_MajCpt;
        end if;
        vMsg := 'Insertion de l''operation de liberation';
        INSERT INTO OPR (IdtClt,
                         IdtCptClt,
                         IdtOpr,
                         IdtTypOpr,
                         Rfr,
                         DatCrt,
                         DatExg,
                         DatVlr,
                         Mnt,
                         Sld,
                         DatCnv,
                         Cmp,
                         IdtDvs,
                         IdtAgt,
                         IdtSit,
                         IdtOprOrg,
                         Anl)
                 VALUES (rOPR.IdtClt,
                         rOPR.IdtCptClt,
                         vSqcOpr,
                         34,
                         vRfr,
                         sysdate,
                         nvl(pDatExg,vDatVlr),
                         vDatVlr,
                         -vMntLtt,
                         -vMntLtt,
                         rOPR.DatCnv,
                         0,
                         rOPR.IdtDvs,
                         pIdtAgt,
                         1,
                         vIdtOprOrg,
                         0);
        vIdtOprCrt    := vSqcOpr;
        vIdtTypOprCrt := 34;
        vRfrCrt       := vRfr;
        vMsg := 'Lettrage de la liberation avec la facture';
        InsLtt (rOPR.IdtOpr, vSqcOpr, vMntLtt, null, vDatVlr, vIdtOprOrg, null, pIdtAgt, null, vIdtLtt);
      end if;
      -- Si la facture n'est pas solde on insere l'operation de solde
      if rOPR.Sld > 0 then
        vMsg := 'Recherche type d''operation de solde';
        select Prfx, IdtTabSeq, PadCar, NbCar, Lib
          into vPrfx, vIdtTabSeq, vPadCar, vNbCar, err_LibTypOpr
          from TYPOPR
          where IdtTypOpr = 33;
        vMsg := 'Recuperation nouveau Id';
        vSqcOpr:= SqcCptClt;
        vMsg := 'Recherche de la séquence de l''opération de routage';
        vSqcRtg := vSqcOpr;
        pIdtOpr := vSqcOpr;
        vIdtTypOprRtg := 33;
        vMsg := 'Recherche de la sequence pour la reference';
        X7_TRTSEQ01.X7_NxtTabSeq(vIdtTabSeq,vRfr);
        if vPadCar is not null AND NVL(vNbCar,0) != 0 THEN
          vRfr := lpad(vRfr,vNbCar,vPadCar);
        end if;
        if vPrfx is not null then
          vRfr := vPrfx || vSprCdf || vRfr;
        end if;
        pRfr := vRfr;
        err_Rfr := vRfr;
        vIdtTypOpr := 33;
        vMsg := 'Recherche si l''operation existe';
        select count(*)
          into vNbr
          from OPR
          where Rfr = vRfr
           and  IdtTypOpr = 33;
        if vNbr > 0 then
          vCodeErreur := 'ERR_MAJCPT0029'; -- L'operation existe deja
          raise eErr_MajCpt;
        end if;
        vMsg := 'Insertion de l''operation pour solder le DG';
        INSERT INTO OPR (IdtClt,
                         IdtCptClt,
                         IdtOpr,
                         IdtTypOpr,
                         Rfr,
                         DatCrt,
                         DatExg,
                         DatVlr,
                         Mnt,
                         Sld,
                         DatCnv,
                         Cmp,
                         IdtDvs,
                         IdtAgt,
                         IdtSit,
                         IdtOprOrg,
                         Anl)
                 VALUES (rOPR.IdtClt,
                         rOPR.IdtCptClt,
                         vSqcOpr,
                         33,
                         vRfr,
                         sysdate,
                         nvl(pDatExg,vDatVlr),
                         vDatVlr,
                         -rOPR.Sld,
                         -rOPR.Sld,
                         rOPR.DatCnv,
                         0,
                         rOPR.IdtDvs,
                         pIdtAgt,
                         1,
                         vIdtOprOrg,
                         0);
        vIdtOprCrt    := vSqcOpr;
        vIdtTypOprCrt := 33;
        vRfrCrt       := vRfr;
        vIdtOprOrg := nvl(vIdtOprOrg,vSqcOpr);
        vMsg := 'Lettrage du solde avec la facture';
        InsLtt (rOPR.IdtOpr, vSqcOpr, rOPR.Sld, null, vDatVlr, vIdtOprOrg, null, pIdtAgt, null, vIdtLtt);
      end if;
      vIdtOprDbt    := rOPR.IdtOpr;
      vIdtTypOprDbt := rOPR.IdtTypOpr;
      vRfrDbt       := rOPR.Rfr;
    else
      vCodeErreur := 'ERR_MAJCPT0012';
      raise eERR_MAJCPT;
  end case;
  IF vSqcRtg IS NOT NULL THEN
    vMsg := 'Appel de la procédure de routage des documents';
    Trtrtg01.GNRRTGOPR ( vSqcRtg, pIdtCltOrg, pIdtCptCltOrg, vIdtTypOprRtg, pIdtAgt );
  END IF;
 --SJ 27/11/2009 fiche 7921
  vMsg := 'Appel de la procédure spécifique';
  -- HNG 19/08/2004 - Fiche 3232
  -- Appel de la procédure spécifique
  Cltbtc01_Spc.MAJCPT_SPC (
      pIdtCltOrg ,
      pIdtCptCltOrg,
      vModImp,
      vIdtOprDbt,
      vRfrDbt,
      vIdtTypOprDbt,
      vIdtOprCrt,
      vRfrCrt,
      vIdtTypOprCrt,
      vIdtLtt,
      nvl(pMnt,vMnt),
      vIdtDvs,
      vDatVlr,
      vDatCnv,
      pIdtAgt,
      pIdtCltDst,
      pIdtCptCltDst );

  -- End HNG
--
-- Gestion des erreurs
--
EXCEPTION
  -- Gestion des erreurs geres par le programme de compte client
  when eERR_MAJCPT then
    if pMsg is null then
      pMsg := TRTMSG01.ChercheMsg(vCodeErreur);
      pMsg := replace(pMsg,':IdtClt',err_IdtClt);
      pMsg := replace(pMsg,':IdtCptClt',err_IdtCptClt);
      pMsg := replace(pMsg,':RfrAff',err_RfrAff);
      pMsg := replace(pMsg,':LibTypOprAff',err_LibTypOprAff);
      pMsg := replace(pMsg,':Rfr',err_Rfr);
      pMsg := replace(pMsg,':LibTypOpr',err_LibTypOpr);
      pMsg := replace(pMsg,':Mnt',err_Mnt);
      pMsg := replace(pMsg,':IdtAgt',err_IdtAgt);
      pMsg := replace(pMsg,':IdtModImp',err_IdtModImp);
      pMsg := 'MAJOPRLTT : ' || pMsg;
    end if;
  -- Gestion d'un plantage Oracle, on reenvoie le message
  -- d'erreur Oracle, sans plantage
  when others then
    vCodeErreur := 'ERR_MAJCPT9999';
    pMsg := TRTMSG01.ChercheMsg(vCodeErreur);
    pMsg := pMsg || ' - ' || vMsg || ' ' || ' - ' || SQLERRM;
    pMsg := 'MAJOPRLTT : ' || pMsg;
--
END MAJOPRLTT;
-----------------------------------------------------------------------------
-----------------------------------------------------------------------------
-----------------------------------------------------------------------------
-----------------------------------------------------------------------------
PROCEDURE ANLTRSEAU(pNumFct FAC.NUMFCT%TYPE)
IS
cOpr_Transfert_EAU     CONSTANT TYPOPR.IdtTypOpr%TYPE := 40;
cOpr_Anl_Transfert_EAU CONSTANT TYPOPR.IdtTypOpr%TYPE := 41;
-- Cursor pour trouver l'operation de transfert au Tresor Public
-- liee au facture donnee par paramettre
CURSOR cOPREAU IS
  SELECT OPRCRT.IdtClt,
         OPRCRT.IdtCptClt,
         OPRCRT.Rfr,
         OPRCRT.IdtDvs,
         -OPRCRT.Sld Sld,
         OPRCRT.IdtOpr,
         OPRCRT.DatCnv
    FROM OPR OPRCRT, LTT, OPR OPRDBT
    WHERE LTT.IdtOprDbt    = OPRDBT.IdtOpr
     AND  OPRCRT.IdtOpr    = LTT.IdtOprCrt
     AND  OPRCRT.IdtTypOpr = cOpr_Transfert_EAU
     AND  OPRCRT.Sld       < 0
     AND  OPRDBT.Rfr       = pNumFct;
rOPREAU cOPREAU%ROWTYPE;
vRfrDbt OPR.Rfr%TYPE;
vPrfRfr TYPOPR.Prfx%TYPE;
vIdtAgt AGT.IDTAGT%TYPE;
vMsg    varchar2(2000);         -- Message a envoyer en cas de plantage Oracle
vIdtOpr OPR.Idtopr%type;
vIdtOprOrg OPR.Idtopr%type;
vIdtLtt LTT.IdtLtt%TYPE;
BEGIN
--  null;
   OPEN cOPREAU;
     FETCH cOPREAU INTO rOPREAU;
-- L'annulation est lancee seulement s'il y a une operation a annuler
     IF cOPREAU%FOUND THEN
-- Recherche de la sequence pour le mettre comme la reference de l'operation
       SELECT seq_OPR.NEXTVAL
         INTO vRfrDbt
         FROM dual;
-- Recherche du prefix de l'operation d'annulation
       SELECT Prfx
         INTO vPrfRfr
         FROM TYPOPR
         WHERE IdtTypOpr = cOpr_Anl_Transfert_EAU;

       vRfrDbt := vPrfRfr || '-' || vRfrDbt;
-- Insertion de la operation debitrice d'annulation de transfert au Tresor Public
       SELECT idtagt INTO vIdtAgt FROM AGT WHERE NOMCNX = USER;
--       Cltbtc01.MajCpt(rOPREAU.IdtClt,
--                       rOPREAU.IdtCptClt,
--                       cOpr_Anl_Transfert_EAU,
--                       vRfrDbt,
--                       NULL,
--                       NULL,
--                       rOPREAU.Sld,
--                       SYSDATE,
--                       SYSDATE,
--                       SYSDATE,
--                       rOPREAU.DatCnv,
--                       vIdtAgt,
--                       NULL,
--                       NULL,
--                       NULL,
--                       NULL,
--                       NULL,
--                       rOPREAU.IdtDvs
--                       );

         -- Gain minime ou similaire
              vMsg := 'Insertion operation 41 anulation TP';
              X7_crtopr(pIdtAgt => vIdtAgt,
                       pIdtCltOrg => rOPREAU.IdtClt,
                       pIdtCptCltOrg => rOPREAU.IdtCptClt,
                       pRfr => vRfrDbt,
                       pIdtTypOpr => 41,
                       pMnt  => rOPREAU.Sld,
                       pDatVlr => sysdate,
                       pDatExg => sysdate,
                       pDatCnv => rOPREAU.DatCnv,
                       pIdtDvs => rOPREAU.IdtDvs,
                       pIdtSit => 1,
                       pMsg  => vMsg);

              if vMsg is not null then
                raise eErr_MajCpt;
              end if;

              vMsg := 'Recherche Idt oprdbt anulation TP 41 qu on vien de créer';

              vIdtOpr := Rfr2IdtOpr(rOPREAU.IdtClt, rOPREAU.IdtCptClt, 41, vRfrDbt);

              vMsg := 'Recherche Idt de la facture d anulation';
              SELECT oprcrt.idtopr
              into vIdtOprOrg
                       FROM OPR OPRCRT, LTT, OPR OPRDBT
                     WHERE LTT.IdtOprDbt    = OPRDBT.IdtOpr
                          AND  OPRCRT.IdtOpr    = LTT.IdtOprCrt
                          AND  OPRCRT.IdtTypOpr = 3 --on cherche la facture d annulation (comme trsf eau la fact org est >0)
                           AND  OPRDBT.Rfr       = pNumFct;

              vMsg := 'Lettrage anulation TP 41 sur l opération transfert eau TP 40';

              InsLtt (vIdtOpr,rOPREAU.IdtOpr,rOPREAU.Sld,null,sysdate,vIdtOprOrg,null,vIdtAgt,0,vIdtLtt);


-- Lettrage mannuel d'annulation
--       Cltbtc01.MajCpt(rOPREAU.IdtClt,
--                       rOPREAU.IdtCptClt,
--                       NULL,
--                       NULL,
--                       cOpr_Anl_Transfert_EAU,
--                       vRfrDbt,
--                       rOPREAU.Sld,
--                       SYSDATE,
--                       SYSDATE,
--                       SYSDATE,
--                       NULL,
--                       vIdtAgt,
--                       NULL,
--                       NULL,
--                       NULL,
--                       cOpr_Transfert_EAU,
--                       rOPREAU.Rfr,
--                       NULL
--                       );
     END IF; --cOPREAU%FOUND
   CLOSE cOPREAU;
END ANLTRSEAU;
-----------------------------------------------------------------------------
-----------------------------------------------------------------------------
-----------------------------------------------------------------------------
procedure Aff1Opr (pIdtAgt AGT.IdtAgt%TYPE,
                   pIdtOpr OPR.IdtOpr%TYPE,
                   pIdtOprAff OPR.IdtOpr%TYPE,
                   pIdtOprOrg OPR.IdtOpr%TYPE,
                   pDatVlr date,
                   pMsg IN OUT varchar2) is
  type typTabIdtOpr is table of OPR.IdtOpr%TYPE index by binary_integer;
  type typTabRfr is table of OPR.Rfr%TYPE index by binary_integer;
  type typTabIdtTypOpr is table of TYPOPR.IdtTypOpr%TYPE index by binary_integer;
  type typTabMnt is table of OPR.Mnt%TYPE index by binary_integer;
  type typTabIdtTypFct is table of TYPFCT.IdtTypFct%TYPE index by binary_integer;
  --
  tIdtOpr        typTabIdtOpr;
  tRfr           typTabRfr;
  tIdtTypOpr     typTabIdtTypOpr;
  tMnt           typTabMnt;
  tSld           typTabMnt;
  tIdtTypFctAff  typTabIdtTypFct;
  vIdtTypFctAff  TYPFCT.IdtTypFct%TYPE;
  vIdtClt        CLT.IdtClt%TYPE;
  vIdtCptClt     CPTCLT.IdtCptClt%TYPE;
  vIdtOpr        OPR.IdtOpr%TYPE;
  vIdtTypOpr     TYPOPR.IdtTypOpr%TYPE;
  vRfr           OPR.Rfr%TYPE;
  vIdtTypOprAff  TYPOPR.IdtTypOpr%TYPE;
  vRfrAff        OPR.Rfr%TYPE;
  vIdtTypOprOrg  TYPOPR.IdtTypOpr%TYPE;
  vIdtNatRgl     number(6);
  vSld           OPR.Sld%TYPE;
  vMntLtt        LTT.Mnt%TYPE;
  vMsg           varchar2(2000);
  vCodeErreur    SYS_MSG.Msg_Code%TYPE;
  vModLttAut     PRMGNR.ModLttAut%TYPE;
  cursor cOPRAFFASC is
    select OPR.IdtOpr,
           OPR.Rfr,
           OPR.IdtTypOpr,
           OPR.Mnt,
           OPR.Sld,
           LTTAUT_VIEW.IdtTypFctAff
      from OPR, LTTAUT_VIEW
      where LTTAUT_VIEW.IdtTypOprAff = OPR.IdtTypOpr
       and  nvl(LTTAUT_VIEW.IdtNatRglAff,-1) = nvl(OPR.IdtNatRgl,-1)
       and  decode(gModeLettrage,1,LTTAUT_VIEW.Man,LTTAUT_VIEW.Atm) = 1
       and  OPR.IdtClt = vIdtClt
       and  OPR.IdtCptClt = vIdtCptClt
       and  OPR.IdtOpr = nvl(pIdtOprAff,OPR.IdtOpr)
       and  LTTAUT_VIEW.IdtTypOpr = vIdtTypOpr
       and  nvl(LTTAUT_VIEW.IdtNatRgl,-1) = nvl(vIdtNatRgl,-1)
       and  OPR.Sld <> 0
       and  EstOprAnl(OPR.IdtOpr) = 0
      order by LTTAUT_VIEW.NivPrt, OPR.DatVlr ASC, OPR.IdtOpr ASC;
  cursor cOPRAFFDESC is
    select OPR.IdtOpr,
           OPR.Rfr,
           OPR.IdtTypOpr,
           OPR.Mnt,
           OPR.Sld,
           LTTAUT_VIEW.IdtTypFctAff
      from OPR, LTTAUT_VIEW
      where LTTAUT_VIEW.IdtTypOprAff = OPR.IdtTypOpr
       and  nvl(LTTAUT_VIEW.IdtNatRglAff,-1) = nvl(OPR.IdtNatRgl,-1)
       and  decode(gModeLettrage,1,LTTAUT_VIEW.Man,LTTAUT_VIEW.Atm) = 1
       and  OPR.IdtClt = vIdtClt
       and  OPR.IdtCptClt = vIdtCptClt
       and  OPR.IdtOpr = nvl(pIdtOprAff,OPR.IdtOpr)
       and  LTTAUT_VIEW.IdtTypOpr = vIdtTypOpr
       and  nvl(LTTAUT_VIEW.IdtNatRgl,-1) = nvl(vIdtNatRgl,-1)
       and  OPR.Sld <> 0
       and  EstOprAnl(OPR.IdtOpr) = 0
      order by LTTAUT_VIEW.NivPrt, OPR.DatVlr DESC, OPR.IdtOpr DESC;
  rOPRAFF cOPRAFFASC%ROWTYPE;
BEGIN
  pMsg := null;
  err_Mnt          := null;
  err_Rfr          := null;
  err_LibTypOpr    := null;
  err_IdtClt       := null;
  err_IdtCptClt    := null;
  err_RfrAff       := null;
  err_LibTypOprAff := null;
  err_IdtAgt       := null;
  err_IdtModImp    := null;
  vIdtOpr := pIdtOpr;
  vMsg := 'Recherche mode de lettrage';
  select ModLttAut
    into vModLttAut
    from PRMGNR;
  BEGIN
    vMsg := 'Recherche operation a affecter';
    select IdtClt, IdtCptClt, IdtTypOpr, Rfr, IdtNatRgl, Sld
      into vIdtClt, vIdtCptClt, vIdtTypOpr, vRfr, vIdtNatRgl, vSld
      from OPR
      where OPR.IdtOpr = vIdtOpr;
  EXCEPTION
    when NO_DATA_FOUND then
      vCodeErreur := 'ERR_MAJCPT0004'; -- L'operation n'existe pas
      err_LibTypOpr := 'IdtOpr = ' || vIdtOpr;
      raise eErr_MajCpt;
    when OTHERS then
      raise;
  END;
  if vModLttAut = 1 then
    open cOPRAFFASC;
      fetch cOPRAFFASC
        bulk collect into tIdtOpr, tRfr, tIdtTypOpr, tMnt, tSld, tIdtTypFctAff;
    close cOPRAFFASC;
  else
    open cOPRAFFDESC;
      fetch cOPRAFFDESC
        bulk collect into tIdtOpr, tRfr, tIdtTypOpr, tMnt, tSld, tIdtTypFctAff;
    close cOPRAFFDESC;
  end if;
  if tIdtOpr.Count > 0 then
    for i in 1..tIdtOpr.Count loop
      vIdtTypFctAff := null;
      vMsg := 'Loop sur la(les) operations affectee(s)';
      if vSld = 0 or tSld(i) = 0 then
        EXIT;
      end if;
      if tIdtTypOpr(i) = 1 then
        BEGIN
          vMsg := 'Recherche de la facture';
          select IdtTypFct
            into vIdtTypFctAff
            from FAC
            where NumFct = tRfr(i);
        EXCEPTION
          when NO_DATA_FOUND then
            vCodeErreur := 'ERR_MAJCPT0004'; -- L'operation n'existe pas
            select Lib
              into err_LibTypOpr
              from TYPOPR
              where IdtTypOpr = tIdtTypOpr(i);
            err_Rfr := tRfr(i);
            raise eErr_MajCpt;
          when OTHERS then
            raise;
        END;
      end if;
      if nvl(tIdtTypFctAff(i),'*') = nvl(vIdtTypFctAff,'*') then
        vMntLtt := least(abs(vSld),abs(tSld(i)));
        vMsg := 'Appel de la procedure de mise a jour';
        MAJOPRLTT (pModImp=>8,
                   pIdtAgt=>pIdtAgt,
                   pIdtCltOrg=>vIdtClt,
                   pIdtCptCltOrg=>vIdtCptClt,
                   pRfr=>vRfr,
                   pIdtOpr=>vIdtOpr,
                   pMnt=>vMntLtt,
                   pDatVlr=>pDatVlr,
                   pIdtCltDst=>vIdtClt,
                   pIdtCptCltDst=>vIdtCptClt,
                   pIdtOprAff=>tIdtOpr(i),
                   pIdtOprOrg=>pIdtOprOrg,
                   pMsg=>pMsg);
        if pMsg is not null then
          raise eErr_MajCpt;
        end if;
        vSld := vSld - (vMntLtt * sign(vSld));
        tSld(i) := tSld(i) - (vMntLtt * sign(tSld(i)));
      end if;
    end loop;
  end if; -- tIdtOpr.Count > 0
--
-- Gestion des erreurs
--
EXCEPTION
  -- Gestion des erreurs geres par le programme de compte client
  when eERR_MAJCPT then
    if pMsg is null then
      pMsg := TRTMSG01.ChercheMsg(vCodeErreur);
      pMsg := replace(pMsg,':IdtClt',err_IdtClt);
      pMsg := replace(pMsg,':IdtCptClt',err_IdtCptClt);
      pMsg := replace(pMsg,':RfrAff',err_RfrAff);
      pMsg := replace(pMsg,':LibTypOprAff',err_LibTypOprAff);
      pMsg := replace(pMsg,':Rfr',err_Rfr);
      pMsg := replace(pMsg,':LibTypOpr',err_LibTypOpr);
      pMsg := replace(pMsg,':Mnt',err_Mnt);
      pMsg := replace(pMsg,':IdtAgt',err_IdtAgt);
      pMsg := replace(pMsg,':IdtModImp',err_IdtModImp);
      pMsg := 'MAJOPRLTT : ' || pMsg;
    end if;
  -- Gestion d'un plantage Oracle, on reenvoie le message
  -- d'erreur Oracle, sans plantage
  when others then
    vCodeErreur := 'ERR_MAJCPT9999';
    pMsg := TRTMSG01.ChercheMsg(vCodeErreur);
    pMsg := pMsg || ' - ' || vMsg || ' ' || ' - ' || SQLERRM;
    pMsg := 'MAJOPRLTT : ' || pMsg;
--
END Aff1Opr;
-----------------------------------------------------------------------------
-----------------------------------------------------------------------------
-----------------------------------------------------------------------------
procedure AffAutOpr (pIdtAgt AGT.IdtAgt%TYPE,
                     pIdtClt CLT.IdtClt%TYPE,
                     pIdtCptClt CPTCLT.IdtCptClt%TYPE,
                     pIdtOprAff OPR.IdtOpr%TYPE,
                     pIdtOprOrg OPR.IdtOpr%TYPE,
                     pDatVlr date,
                     pMsg IN OUT varchar2) is
  vCodeErreur SYS_MSG.Msg_Code%TYPE;
  vMsg varchar2(2000);
  cursor cOPR is
    select OPR.IdtOpr
      from OPR
      where OPR.IdtClt = pIdtClt
       and  OPR.IdtCptClt = pIdtCptClt
       and  OPR.Sld <> 0
       and  EstOprAnl(OPR.IdtOpr) = 0
      order by decode(OPR.IdtNatRgl,
                        2,1,
                        1,2,
                        3,4,
                          3),
               OPR.DatVlr,
               OPR.IdtOpr;
BEGIN
  for rOPR in cOPR loop
    vMsg := 'Appel procedure d''affectation';
    Aff1Opr (pIdtAgt,
             rOPR.IdtOpr,
             pIdtOprAff,
             pIdtOprOrg,
             pDatVlr,
             pMsg);
  end loop;
--
-- Gestion des erreurs
--
EXCEPTION
  -- Gestion des erreurs geres par le programme de compte client
  when eERR_MAJCPT then
    if pMsg is null then
      pMsg := TRTMSG01.ChercheMsg(vCodeErreur);
      pMsg := replace(pMsg,':IdtClt',err_IdtClt);
      pMsg := replace(pMsg,':IdtCptClt',err_IdtCptClt);
      pMsg := replace(pMsg,':RfrAff',err_RfrAff);
      pMsg := replace(pMsg,':LibTypOprAff',err_LibTypOprAff);
      pMsg := replace(pMsg,':Rfr',err_Rfr);
      pMsg := replace(pMsg,':LibTypOpr',err_LibTypOpr);
      pMsg := replace(pMsg,':Mnt',err_Mnt);
      pMsg := replace(pMsg,':IdtAgt',err_IdtAgt);
      pMsg := replace(pMsg,':IdtModImp',err_IdtModImp);
      pMsg := 'MAJOPRLTT : ' || pMsg;
    end if;
  -- Gestion d'un plantage Oracle, on reenvoie le message
  -- d'erreur Oracle, sans plantage
  when others then
    vCodeErreur := 'ERR_MAJCPT9999';
    pMsg := TRTMSG01.ChercheMsg(vCodeErreur);
    pMsg := pMsg || ' - ' || vMsg || ' ' || ' - ' || SQLERRM;
    pMsg := 'MAJOPRLTT : ' || pMsg;
--
END AffAutOpr;
PROCEDURE MajCpt
   (
   pIdtClt     VARCHAR2,
   pIdtCptClt  NUMBER,
   pIdtTypOpr  NUMBER,
   pRfr        VARCHAR2,
   pIdtTypOpr2 NUMBER,
   pRfr2       VARCHAR2,
   pMnt        NUMBER,
   pDatCrt     DATE,
   pDatExg     DATE,
   pDatVlr     DATE,
   pDatCnv     DATE,
   pIdtAgt     VARCHAR2,
   pIdtLgnCss  NUMBER,
   pIdtClt2    VARCHAR2,
   pIdtCptClt2 NUMBER,
   pIdtTypOpr3 NUMBER,
   pRfr3       VARCHAR2,
   pIdtDvs     VARCHAR2
   )
IS
  vIdtModImp MODIMP.IdtModImp%TYPE;
  vMsg varchar2(2000);
  vRfr OPR.Rfr%TYPE;
  vIdtOpr OPR.IdtOpr%TYPE;
  vIdtTypOpr TYPOPR.IdtTypOpr%TYPE;
  vIdtOprAff OPR.IdtOpr%TYPE;
  vIdtLtt    LTT.IdtLtt%TYPE;
  vIdtOprOrg OPR.IdtOpr%TYPE;
  vIdtSit    SIT.IdtSit%TYPE;
  vIdtOprTmp OPR.IdtOpr%TYPE;
  vIdtLgnCss LGNCSS.IdtLgnCss%TYPE;
BEGIN
  vIdtLgnCss := pIdtLgnCss;
    vRfr := pRfr;
    vIdtTypOpr := pIdtTypOpr;
    IF pIdtTypOpr IS NOT NULL THEN
        SELECT IdtModImp
        INTO   vIdtModImp
        FROM   TYPOPR
        WHERE  IdtTypOpr = pIdtTypOpr;
    /*-------------------------------------------------------
    - Si Aucune reference d'operation = Lettrage direct = Mode 8
    --------------------------------------------------------*/
    ELSE
        vIdtModImp:= 8;
    END IF;
    if vIdtModImp in (11,14) THEN
       vIdtSit := pIdtLgnCss;
       vIdtLgnCss := null;
     end if;
  if pIdtTypOpr is not null and pRfr is not null and vIdtLgnCss is null then
       select IdtOpr
      into vIdtOpr
         from OPR
         where Rfr = pRfr
          and  IdtTypOpr = pIdtTypOpr;
     end if;
     if pRfr2 is not null and pIdtTypOpr2 is not null then
       select IdtOpr
         into vIdtOprAff
         from OPR
         where Rfr = pRfr2
          and  IdtTypOpr = pIdtTypOpr2;
     end if;
     if vIdtModImp in (11) then
       if pRfr is not null and pIdtTypOpr2 is not null then
         select IdtOpr
           into vIdtOprAff
           from OPR
           where Rfr = pRfr
            and  IdtTypOpr = pIdtTypOpr2;
         vIdtOpr := null;
       end if;
     end if;
     if pRfr3 is not null and pIdtTypOpr3 is not null then
       select IdtOpr
         into vIdtOprTmp
         from OPR
         where Rfr = pRfr3
          and  IdtTypOpr = pIdtTypOpr3;
       if vIdtModImp = 8 then
         vIdtOpr := vIdtOprTmp;
         vIdtTypOpr := pIdtTypOpr3;
       end if;
     end if;
     -- --SJ 29/10/2012 F10511 vpDatCrt := pDatCrt; --SJ 17/08/2012 fiche 10308
     MAJOPRLTT(pModImp       => vIdtModImp,
            pIdtAgt       => pIdtAgt,
            pIdtCltOrg    => pIdtClt,
            pIdtCptCltOrg => pIdtCptClt,
            pRfr          => vRfr,
            pIdtTypOpr    => vIdtTypOpr,
            pIdtOpr       => vIdtOpr,
            pMnt          => pMnt,
            pDatVlr       => pDatVlr,
            pDatExg       => pDatExg,
            pDatCnv       => pDatCnv,
            pIdtCltDst    => pIdtClt2,
            pIdtCptCltDst => pIdtCptClt2,
            pIdtOprAff    => vIdtOprAff,
--            pIdtLtt       => vIdtLtt,
            pIdtLgnCss    => vIdtLgnCss,
            pIdtOprOrg    => vIdtOprOrg,
            pIdtDvs       => pIdtDvs,
--            pIdtMtf       => ,
--            pInfCpl       => ,
            pIdtSit       => vIdtSit,
            pMsg          => vMsg);

       -- --SJ 29/10/2012 F10511 vpDatCrt := sysdate; --SJ 26/10/2012 fiche 10511
  if vMsg is not null then
    Raise_Application_Error(-20101, vMsg);
  end if;
END;

-----------------------------------------------------------------------------
-----------------------------------------------------------------------------
-----------------------------------------------------------------------------
procedure MAJECHMNS (pEchPmt ECHPMT.EchPmt%TYPE,
                     pMnt    OPR.Mnt%TYPE,
                     pSld    OPR.Sld%TYPE)
is
-------------------------------------------------------------------------------------
--Cursor de las operaciones mensualizaci?n y débito de la mensualizaci?n
-------------------------------------------------------------------------------------
cursor cOprMns is
  select OPR.IdtOpr,
         OPR.IdtTypOpr,
         decode(TYPOPR.DbtCrt,'D',1,'C',-1) Sgn
    from OPR, TYPOPR
    where TYPOPR.IdtTypOpr = OPR.IdtTypOpr
     and  EchPmt = pEchPmt
     and  OPR.IdtTypOpr in (17, 18);
vIdtOprDbt OPR.IdtOpr%TYPE;
vIdtOprCrt OPR.IdtOpr%TYPE;
BEGIN
  -----------------------------------------------------------------------------------
  --Loop sobre las operaciones mensualizaci?n y débito de la mensualizaci?n
  -----------------------------------------------------------------------------------
  for rOPRMNS in cOPRMNS loop
    MAJOPR (rOPRMNS.IdtOpr,
            pMnt * rOPRMNS.Sgn,
            0,
            null,
            null,
            null);
    ---------------------------------------------------------------------------------
    --Si es la operaci?n débito se recupera el Idt de la operaci?n
    ---------------------------------------------------------------------------------
    if rOPRMNS.IdtTypOpr = 17 then
      vIdtOprDbt := rOPRMNS.IdtOpr;
    ---------------------------------------------------------------------------------
    --Si es la operaci?n crédito se recupera el Idt de la operaci?n
    ---------------------------------------------------------------------------------
    else
      vIdtOprCrt := rOPRMNS.IdtOpr;
    end if;
  end loop;
  -----------------------------------------------------------------------------------
  --Actualizaci?n del Lettrage
  -----------------------------------------------------------------------------------
  MAJLTT (vIdtOprDbt,
          vIdtOprCrt,
          pMnt,
          null);
end MAJECHMNS;


--ll le 21/02/2013 - fiche #10788: amélioration des performances en modifiant la requête
Procedure MajCoordBncOpr(pidtctr        ctr.idtctr%type,
                         pidtbnq        opr.idtbnq%type,
                         pidtgch        opr.idtgch%type,
                         pprpcptbnc     opr.nomcptbnc%type,
                         pnumcptbnc     opr.numcptbnc%type,
                         pclerib        opr.clerib%type,
                         pIBAN      OPR.IBAN%type,
                         pBIC       OPR.BIC%type
                         )
is
  type typtabidtopr is table of opr.idtopr%type index by binary_integer;
  tidtopr          typtabidtopr;

--  ridctr rowid;
--  ridctrfrn rowid;
--  ridmdt rowid;
--  nNB number;

Begin

  -- ll 21/02/2013 : modification de ce select qui est trop long
  --  on le conserve pour référence, si nécessaire
/*
select idtopr bulk collect into tidtopr
from fac, ctrfac, opr, echpmt ,ctr
where fac.idtclt(+) = opr.idtclt  and
    fac.numfct(+) = decode( opr.idttypopr,1,opr.rfr,3,opr.rfr,4,opr.rfr,26,opr.rfr,null )  and
    fac.idtfac = ctrfac.idtfac(+) and
    opr.echpmt = echpmt.echpmt(+)  and
    decode(opr.echpmt, null, ctrfac.idtctr) || echpmt.idtctr  = ctr.idtctr  and
    opr.sld<>0  and
    opr.datexg >= sysdate and
    ctr.idtctr = pidtctr ;
*/

-- BPZ
--    ridctr := null;
--    ridctrfrn := null;
--    ridmdt := null;
--
--    select
--        (select rowid from ctr where idtctr=pidtctr)
--        ,(select rowid from ctrfrn where idtctrfrn=pidtctr)
--    into ridctr, ridctrfrn
--    from dual;
--
--    if ridctr is not null then
--
--        select
--            (select rowid from mdt where idtctr=pidtctr and datrsl is null and datssc is not null
--            and (nvl(iban,'-1') <> nvl(pIBAN,'-1') or nvl(bic,'-1') <> nvl(pBIC,'-1')))
--        into ridmdt
--        from dual;
--
----        update ctr set
----            idtbnq = pidtbnq,
----            idtgch = pidtgch,
----            PrpCptBnc = pprpcptbnc,
----            numcptbnc = pnumcptbnc,
----            clerib = pclerib,
----            iban = piban,
----            bic = pbic
----        where rowid = ridctr;
--
--    end if;
--    if ridctrfrn is not null then
--
--        select
--            (select rowid from mdt where idtctrfrn=pidtctr and hst=0 and datrsl is null and datssc is not null
--            and (nvl(iban,'-1') <> nvl(pIBAN,'-1') or nvl(bic,'-1') <> nvl(pBIC,'-1')))
--        into ridmdt
--        from dual;
--
--
----        update ctrfrn set
----            idtbnq = pidtbnq,
----            idtgch = pidtgch,
----            PrpCptBnc = pprpcptbnc,
----            numcptbnc = pnumcptbnc,
----            clerib = pclerib,
----            iban = piban,
----            bic = pbic
----        where rowid = ridctrfrn;
--    end if;

--    if ridmdt is not null then
--        INSERT INTO MDT (    IDTMDT, IDTCTRFRN, IDTCTR, IDTTYPPMT, DATCRT, DATIMP, DATSSC, DATMAJ, IBAN, BIC, DATRSL, IDTCLT, NOM, ADRLBR, IDTSQCFCH, RAISON, TYPMDT, HST)
--        SELECT         IDTMDT, IDTCTRFRN, IDTCTR, IDTTYPPMT, DATCRT, DATIMP, DATSSC, DATMAJ, IBAN, BIC, DATRSL, IDTCLT, NOM, ADRLBR, IDTSQCFCH, RAISON, TYPMDT, 1
--        FROM     MDT
--        WHERE     ROWID = ridmdt;

--        update mdt set
--        iban = piban,
--        bic = pbic,
--        datmaj = sysdate,
--        raison = 'Report'
--        where rowid = ridmdt;
--    end if;


-- ll 21/02/2013
  select idtopr bulk collect
    into tidtopr
  from ( select idtopr      -- ici, on récupère les échéances et mensualités
         from opr, echpmt
         where echpmt.idtctr = pidtctr
           and opr.echpmt = echpmt.echpmt
           and opr.sld <> 0
           and opr.datexg >= sysdate
        union all
         select idtopr        -- ici, on récupère les factures
         from opr, fac, ctrfac
         where ctrfac.idtctr = pidtctr
           and ctrfac.idtfac = fac.idtfac
           and fac.numfct = opr.rfr
           and opr.sld <> 0
           and opr.datexg >= sysdate
       );

  Forall i in 1..tidtopr.count
    update opr set idtbnq = pidtbnq,
                   idtgch = pidtgch,
                   nomcptbnc = pprpcptbnc,
                   numcptbnc = pnumcptbnc,
                   clerib = pclerib,
                   iban = piban,
                   bic = pbic
    where idtopr = tidtopr(i);

EXCEPTION
    WHEN OTHERS THEN
        X7.GEST_ERREUR_CENTURA(VersionPkg(),
                              0,
                              'CLTBTC01',
                              'MajCoordBncOpr',
                              to_char(SQLERRM),
                              sqlcode,
                              DBMS_UTILITY.FORMAT_ERROR_BACKTRACE);
        Raise;
end MajCoordBncOpr;

procedure MajCoordBncOprFrn(pIdtCtrFrn    CTRFRN.IdtCtrFrn%type,
                         pidtbnq        opr.idtbnq%type,
                         pidtgch        opr.idtgch%type,
                         pprpcptbnc     opr.nomcptbnc%type,
                         pnumcptbnc     opr.numcptbnc%type,
                         pclerib        opr.clerib%type,
                         pIBAN      OPR.IBAN%type,
                         pBIC       OPR.BIC%type
                         )
is
CURSOR CUR1 IS
SELECT IDTCTR
FROM CTR
WHERE IDTCTRFRN = pIdtCtrFrn
AND DATRSL IS NULL;

Begin

  FOR cCUR1 in CUR1 loop

      UPDATE    CTR SET
        CTR.IdtBnq     = pidtbnq,
        CTR.IdtGch     = pidtgch,
        CTR.PrpCptBnc  = pprpcptbnc,
        CTR.NumCptBnc  = pnumcptbnc,
        CTR.CleRib     = pclerib,
        CTR.IBAN       = piban,
        CTR.BIC        = pbic
      WHERE IDTCTR = cCUR1.IDTCTR;

    MajCoordBncOpr(cCUR1.IDTCTR,pidtbnq, pidtgch, pprpcptbnc, pnumcptbnc, pclerib , pIBAN , pBIC);

  END loop;

EXCEPTION
    WHEN OTHERS THEN
        X7.GEST_ERREUR_CENTURA(VersionPkg(),
                              0,
                              'CLTBTC01',
                              'MajCoordBncOprFrn',
                              to_char(SQLERRM),
                              sqlcode,
                              DBMS_UTILITY.FORMAT_ERROR_BACKTRACE);
        Raise;

end MajCoordBncOprFrn;


END CLTBTC01;
/