CREATE OR REPLACE PACKAGE BODY X7.Affbtc01
IS
/***************************************************************************\
* AFFBTC01 Avance automatique d'étape affaire                               *
*          Initialisation automatique d'affaires coupure et relance         *
*          Création: 14/6/96 par M. Rechté                                  *
*          Modification: 20/6/96 - Ajout de l'initialisation auto d'affaires*
*          4/7/96 - Conditionnement étape suivante sur un délai en jours
*        24/03/97
*       PKT
*       Avancement automatique des affaires
*       Pas d'utilisation de la table des tâches
-----------------------------------------------------------------------------
/* Modificaci?n : FBE - 05 02 01                                           */
/* Descripci?n  : Adici?n de la cl?usula 'AND DatRls is null'              */
/*                en el procedimiento Ini1AffCou para traer los contratos  */
/*                no rescindidos.                                          */
/*         *** Problema de un punto de medici?n con m?s de un contrato *** */
-----------------------------------------------------------------------------
/* Modificaci?n : FBE - 07 05 02                                           */
/* Descripci?n  : Modificaci?n del procedimiento IniAffCou                 */
/*                Se agrega la condici?n AND IdtSml = rT.IdtSml para       */
/*                seleccionar los puntos de medici?n generados por el mismo*/
/*                filtro de corte. Es posible que se generen varias OT     */
/*                para un mismo punto de medici?n cuando varias condiciones*/
/*                en tabla SML se cumplen para un mismo punto de medici?n  */
/*         *** Problema de Ordenes de Trabajo duplicadas               *** */
/***************************************************************************/
/* Modificaci?n : SJ - 10/03/04                                            */
/* Descripci?n  : Ajouter les procedures inicntmls et ini1cntmls pour      */
/*                creation des contact type mail                           */
/*         ***                                                         *** */
/***************************************************************************/
-----------------------------------------------------------------------------------------
-- Maj     : 09/12/2004
-- Par     : HNG
-- Contenu : Modification de la fonction CREACTCRS et de la procédure INI1AFFOBS
--           Fiche 3431
-----------------------------------------------------------------------------------------
-----------------------------------------------------------------------------
-- Maj     : 10/03/2006
-- Par     : JCD
-- Contenu : Ajout de la fonction de version qui retourne le numero *
-- de version du package
--
--    ***
--     ATTENTION!!!!:
--     Penser à modifier ce numéro de version à chaque mise à jour du package!!
--    ***
--           Fiche 4209
-----------------------------------------------------------------------------
-----------------------------------------------------------------------------------------
-- Maj     : 09/06/2009
-- Par     : JCD
-- Contenu : Gestion des identifiants de simulation dans contact, aff, et int
-----------------------------------------------------------------------------------------
/***************************************************************************/
/* Modificaci?n : SJ - 19/04/06 - f2943                                    */
/* Descripci?n  : Modification de la fonction CreActcrs pour récuperer     */
/*                l'identifiant du contrat                                 */
/*                                                                         */
/*         ***                                                         *** */
/***************************************************************************/
-----------------------------------------------------------------------------------------
-- Maj     : 20/11/2009
-- Par     : FBE
-- Contenu : Modifications diverses, compatibilite Workflow
-----------------------------------------------------------------------------------------

-----------------------------------------------------------------------------------------
-- Maj     : 09/02/2010
-- Par     : BPZ
-- Contenu : heure à la création d'une affaire.
-----------------------------------------------------------------------------------------

-----------------------------------------------------------------------------------------
-- Maj     : 13/03/2010
-- Par     : JCD
-- Contenu : Agent de suivi du contact généré par simulation égal a agent de suivi de la simulation.
-----------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------
-- Maj     : 15/06/2010
-- Par     : SJ
-- Contenu : Agent de suivi du contact généré par simulation égal a agent de suivi de la simulation.pour la coupure, mail;
-----------------------------------------------------------------------------------------

-----------------------------------------------------------------------------------------
-- Maj     : 14/10/2010
-- Par     : BPZ
-- Contenu : La fonction de creations des actions renvoie false si aucune action n est créé
--           fiche mantis 8677
-----------------------------------------------------------------------------------------

-----------------------------------------------------------------------------------------
-- Maj     : 12/12/2011
-- Par     : BPZ
-- Contenu : 9617: affaires en cours sans actions
--
-----------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------
-- Maj     : 06/06/2012
-- Par     : SJ
-- Contenu : Fihce 10147 passer les variables à 32000 : vReqStc VARCHAR2(32000);   vReq VARCHAR2(32000);
--
-----------------------------------------------------------------------------------------
-- Maj     : 18/04/2014
-- Par     : FBE
-- Contenu : Ajout de la procedure TrtActCrsXDoc pour gerer le publipostage XDocReport
--
-----------------------------------------------------------------------------------------
-- Maj     : 12/06/2014
-- Par     : FBE
-- Contenu : - Ajout de la procedure CreerAffaire
--           - Modification de la procedure INI1AFFOBS pour gerer la nouvelle procedure de creation d'affaire
-----------------------------------------------------------------------------------------
-- Maj     : 21/06/2014
-- Par     : FBE
-- Contenu : - 11798: Gestion de l'ordre des actions dans une etape
-----------------------------------------------------------------------------------------
-- Maj     : 26/11/2014
-- Par     : FBE
-- Version : 70707.034
-- Mantis  : 12216 : Création de plusieurs plans de relance actifs pour un meme client
-- Contenu : 12216 : Modification des procedures de relance et coupure, lorsque il existe deja un affaire
--                   ouvert pour le meme plan d'actions pour le client (relance) ou le point de comptage (coupure)
--                   on ne fait pas la creation d'un autre affaire.
--                   Pour la coupure, on regarde s'il y a une ACTCRS pour le point de comptage pour le meme plan d'actions
-----------------------------------------------------------------------------------------
-- Maj     : 19/08/2015
-- Par     : FBE
-- Version : 71200.035
-- Mantis  : 0012714: Séparation des impressions de publipostage
-- Contenu : Generation d'un fichier spool par simulation pour la meme action. Modification du traitement TrtActCrsXDoc
-----------------------------------------------------------------------------------------


--   MEGA IMPORTANT : Utiliser le       --
--   synonyme INTPKG pour la table INT  --
--   dans les packages (INT est un mot  --
--   reserve pour le PL/SQL)            --
--
   cIdtRet_OK CONSTANT NUMBER:= 0;
   cIdtRet_OKforce CONSTANT NUMBER:= 2;
   cIdtRet_encours CONSTANT NUMBER:= 4;
   cIdtRet_EtapeIgnoree CONSTANT NUMBER:= 9;
--
   cIdtNivAct_PntLvr CONSTANT NUMBER:= 1;
   cIdtNivAct_PntCpg CONSTANT NUMBER:= 2;
   cIdtNivAct_Cpr CONSTANT NUMBER:= 3;
   cIdtNivAct_CptClt CONSTANT NUMBER:= 4;
   cIdtNivAct_Ctr CONSTANT NUMBER:= 5;
   cIdtNivAct_NA CONSTANT NUMBER:= 6;
--
   cIdtTypTche_AvcAff CONSTANT VARCHAR2(10):= 'TRT2024';
   cIdtTypTche_IniAffRlc CONSTANT VARCHAR2(10):= 'TRT2026';
   cIdtTypTche_IniAffCou CONSTANT VARCHAR2(10):= 'TRT2027';
   cIdtTypTche_ImpBonInt CONSTANT VARCHAR2(10):= 'TRT2002';
   cIdtTypTche_IniCntMls CONSTANT VARCHAR2(10):= 'TRT2029';
--
   cIdtTypCnt_Com CONSTANT NUMBER:= 1;
--
   cIdtMtfCnt_Rlc CONSTANT NUMBER:= 1;
   cIdtMtfCnt_Cou CONSTANT NUMBER:= 2;
   cIdtMtfCnt_Obs CONSTANT NUMBER:= 3;
   cIdtMtfCnt_Mls CONSTANT NUMBER:= 4;
--
   cIdtTypAct_Int CONSTANT NUMBER:= 1;
--
   cStt_EnCours CONSTANT CHAR:= 'C';
   cStt_Fini CONSTANT CHAR:= 'F';
--
--

MSGERR  VARCHAR(30000);
FICERR  VARCHAR(100) := 'AFFBTC01.LOG';

-----------------------------------------------------------------------------
-----------------------------------------------------------------------------
-----------------------------------------------------------------------------
-- A MODIFIER A CHAQUE MODIF DU PACKAGE!!!
FUNCTION VersionPkg
--        --------- Version du package utilisé
  RETURN NUMBER
IS
BEGIN
  RETURN 71200.035;
END;
--
--
--
-- JCE
-- !!!!!!!!!!!!! pour la relance cette fonction n'est utilisée que pour les actions de niveau compte-client
--
-----------------------------------------------------------------------------
-----------------------------------------------------------------------------
-----------------------------------------------------------------------------

procedure AvcAff is
--        ------ Avance les affaires non terminées
--   cursor cAff is
--      select IdtClt, IdtAff from Aff where DatFin is null;
--   vDum boolean;-
--begin
--        ------ Vérifie et avance toutes les affaires en cours
--
--   for rA in cAff loop
--      vDum:= Vrf1Aff(rA.IdtClt, rA.IdtAff);
--   end loop;
--   commit;

  -- JCD le 20/10/2009
  -- Avancement automatique par le batch nouvelle version workflow
BEGIN
  AFFBTC02.avancementbatch;
end AvcAff;

FUNCTION CreActCrs (pIdtClt VARCHAR2,
                    pIdtPlnAct VARCHAR2,
                    pIdtAff NUMBER,
                    pPdl NUMBER,
                    pPdc NUMBER)
RETURN BOOLEAN IS
--
    TYPE tabCpr IS TABLE OF CPR.IdtCpr%TYPE INDEX BY BINARY_INTEGER;
    TYPE tabPdc IS TABLE OF PNTCPG.IdtPntCpg%TYPE INDEX BY BINARY_INTEGER;
    TYPE tabPdl IS TABLE OF PNTLVR.IdtPntLvr%TYPE INDEX BY BINARY_INTEGER;
    TYPE tabCtr IS TABLE OF CTR.IdtCtr%TYPE INDEX BY BINARY_INTEGER;
--
    tabctr_sIdtCtr tabCtr;
    tabctr_nIdtPntLvr tabPdl;
    tabctr_nIdtPntCpg tabPdc;
    --tabctr_nIdtCpr tabCpr;
    --tabpdl_sIdtCtr tabCtr;
    tabpdl_nIdtPntLvr tabPdl;
    --tabpdl_nIdtPntCpg tabPdc;
    --tabpdl_nIdtCpr tabCpr;
    tabpdc_sIdtCtr tabCtr;
    tabpdc_nIdtPntLvr tabPdl;
    tabpdc_nIdtPntCpg tabPdc;
    tabpdc_nIdtCpr tabCpr;
    tabcpr_sIdtCtr tabCtr;
    tabcpr_nIdtPntLvr tabPdl;
    tabcpr_nIdtPntCpg tabPdc;
    tabcpr_nIdtCpr tabCpr;
    sIdtCtr CTR.IdtCtr%TYPE;
    nIdtPntLvr PNTLVR.IdtPntLvr%TYPE;
    nIdtPntCpg PNTCPG.IdtPntCpg%TYPE;
    nIdtCpr CPR.IdtCpr%TYPE;
    nIdtCptClt CPTCLT.IdtCptClt%TYPE;
    sIdtClt CLT.IdtClt%TYPE;
    nSldExg NUMBER(12);
    maxcpr BINARY_INTEGER;
    maxctr BINARY_INTEGER;
    maxpdc BINARY_INTEGER;
    maxpdl BINARY_INTEGER;
    indcpr BINARY_INTEGER;
    indctr BINARY_INTEGER;
    indpdc BINARY_INTEGER;
    indpdl BINARY_INTEGER;
    nPntLvrSav PNTLVR.IdtPntLvr%TYPE;
    nPntCpgSav PNTCPG.IdtPntCpg%TYPE;
    nCprSav CPR.IdtCpr%TYPE;

--
   vDatPreAct    ACTCRS.DATPRE%TYPE;
   vDatReeAct    ACTCRS.DATREE%TYPE;
   vDelaiAct     ACTCRS.DELAI%TYPE;
   vIdtRpt       ACTCRS.IdtRpt%TYPE;
--
   vReturn     Boolean;

CURSOR cNivAct IS
--         SELECT RowNum NumRow, a.IdtCtlAct, b.IdtNivAct ,a.IdtEtp, nvl(b.AVCAUT,1) AvcAut
--         FROM ACT a, CTLACT b
--         WHERE a.IdtPlnAct = pIdtPlnAct
--           --AND a.IdtEtp = 1
--           AND b.IdtCtlAct = a.IdtCtlAct
--         ORDER BY a.IdtEtp;
         SELECT a.IdtCtlAct, b.IdtNivAct ,a.IdtEtp, nvl(b.AVCAUT,1) AvcAut
         FROM ACT a, CTLACT b
         WHERE a.IdtPlnAct = pIdtPlnAct
           --AND a.IdtEtp = 1
           AND b.IdtCtlAct = a.IdtCtlAct
         ORDER BY a.IdtEtp, a.NumOrd;
NumRow Number;

CURSOR cCtrCou IS
    SELECT DISTINCT
        e.IdtCptClt,
        b.idtctr, b.Idtpntlvr,
        b.Idtpntcpg, f.IdtCpr
    FROM
        CLT a,
        CTR b,
        CPR c,
        PNTLVR d,
        CPTCLT e,
        CPRPNTCPG f,
        PNTCPG g
    WHERE
        a.IdtCLt = pIdtClt
        AND g.IdtPntLvr = pPdl
        AND g.IdtPntCpg = pPdc
        -- FBE: La jointure pose pb, le client peut etre ssc ou dst
        --      La jointure avec le PDC suffit.
        --      A voir s'il faut une jointure ouverte avec le PDC!!!!
        --AND a.Idtclt = b.IdtCltDst(+)
        AND a.Idtclt = e.IdtClt(+)
        AND b.DatRsl(+) IS NULL
        AND b.IdtPntLvr = d.IdtPntLvr(+)
        AND b.IDTPNTCPG = f.IDTPNTCPG(+)
        AND b.IDTPNTLVR = f.IDTPNTLVR(+)
        AND f.DATDPS(+) IS NULL
        AND b.IDTPNTCPG = g.IDTPNTCPG(+)
        AND b.IDTPNTLVR = g.IDTPNTLVR(+)
        AND f.IDTCPR = c.IDTCPR(+);
CURSOR cCtrRel IS
 SELECT DISTINCT
        CPTCLT.IdtCptClt,
        CTR.idtctr,
        CTR.Idtpntlvr,
        CTR.Idtpntcpg,
        CPRPNTCPG.IdtCpr
   FROM PRMGNR,
        CPRPNTCPG,
        CTR,
        CPTCLT
  WHERE CPRPNTCPG.IDTPNTCPG(+) = CTR.IDTPNTCPG
    AND CPRPNTCPG.IDTPNTLVR(+) = CTR.IDTPNTLVR
    AND CPRPNTCPG.DATDPS(+)    IS NULL
    AND CTR.IdtCtr (+)         = trtfac01.X7_IdtCtr_CptClt (CPTCLT.IdtClt)
--    AND CTR.DatRsl(+)          IS NULL
    AND CPTCLT.IdtClt(+)       = pIdtClt;

vSldexg number;
BEGIN
    vReturn:= False;
    indctr := 0;
    indcpr := 0;
    indpdc := 0;
    indpdl := 0;
    nPntLvrSav := -1;
    nPntCpgSav := -1;
    nCprSav := -1;
    IF pPdl IS NOT NULL AND pPdc IS NOT NULL THEN
        OPEN cCtrCou;
    ELSE
        OPEN cCtrRel;
    END IF;
    nIdtCptClt := NULL;
    sIdtCtr := NULL;
    nIdtPntLvr := NULL;
    nIdtPntCpg := NULL;
    nIdtCpr := NULL;
    LOOP
        IF pPdl IS NOT NULL AND pPdc IS NOT NULL THEN
            FETCH cCtrCou INTO
                nIdtCptClt,
                sIdtCtr,
                nIdtPntLvr,
                nIdtPntCpg,
                nIdtCpr;
            EXIT WHEN cCtrCou%NOTFOUND;
        ELSE
            FETCH cCtrRel INTO
                nIdtCptClt,
                sIdtCtr,
                nIdtPntLvr,
                nIdtPntCpg,
                nIdtCpr;
            EXIT WHEN cCtrRel%NOTFOUND;
        END IF;
        IF sIdtCtr IS NOT NULL THEN
            tabctr_sIdtCtr(indctr) := sIdtCtr;
            tabctr_nIdtPntLvr(indctr) := nIdtPntLvr;
            tabctr_nIdtPntCpg(indctr) := nIdtPntCpg;
            indctr := indctr + 1;
        END IF;
        IF nIdtCpr IS NOT NULL THEN
            tabcpr_sIdtCtr(indcpr) := sIdtCtr;
            tabcpr_nIdtPntLvr(indcpr) := nIdtPntLvr;
            tabcpr_nIdtPntCpg(indcpr) := nIdtPntCpg;
            tabcpr_nIdtCpr(indcpr) := nIdtCpr;
            indcpr := indcpr + 1;
        END IF;
        IF nIdtPntCpg IS NOT NULL AND nIdtPntCpg <> nPntCpgSav THEN
            nPntCpgSav := nIdtPntCpg;
            tabpdc_sIdtCtr(indpdc) := sIdtCtr;
            tabpdc_nIdtPntLvr(indpdc) := nIdtPntLvr;
            tabpdc_nIdtPntCpg(indpdc) := nIdtPntCpg;
            tabpdc_nIdtCpr(indpdc) := nIdtCpr; -- HNG 09/12/2004 Prendre en compte le compteur
            indpdc := indpdc + 1;
        END IF;
        IF nIdtPntLvr IS NOT NULL AND nIdtPntLvr <> nPntLvrSav THEN
            nPntLvrSav := nIdtPntLvr;
            tabpdl_nIdtPntLvr(indpdl) := nIdtPntLvr;
            indpdl := indpdl + 1;
        END IF;
    END LOOP;
    IF pPdl IS NOT NULL AND pPdc IS NOT NULL THEN
        CLOSE cCtrCou;
        if indpdc = 0 then
            tabpdc_nIdtPntLvr(indpdc) := pPdl;
            tabpdc_nIdtPntCpg(indpdc) := pPdc;
            tabpdc_sIdtCtr(indpdc) := NULL;
            tabpdc_nIdtCpr(indpdc) := NULL;
            indpdc := indpdc + 1;
        end if;
    ELSE
        CLOSE cCtrRel;
    END IF;
    maxcpr := indcpr;
    maxctr := indctr;
    maxpdc := indpdc;
    maxpdl := indpdl;
    --
    -- remplissage des actions en cours (actcrs)
    NumRow := 0;
    FOR rA IN cNivAct LOOP
        NumRow := NumRow + 1;
        indctr := 0;
        indcpr := 0;
        indpdc := 0;
        indpdl := 0;
        -- si pas de contrat, on ne crée pas d'affaire si actions d'un niveau autre que
        -- 'sans' ou 'compte client' UTILE uniquement pour relance
--         IF maxctr = 0 AND rA.IdtNivAct <> 4 AND rA.IdtNivAct <> 6 THEN
--             RETURN FALSE;
--         END IF;
        -- si coupure, on vérifie qu'il n'y a pas de pdc non relié à un contrat ou contrat
        -- résilié (filtre normalement fait par l'interactif de coupure)
--         IF pPdl IS NOT NULL AND maxctr = 0 THEN
--             RETURN FALSE;
--         END IF;
        -- niveau compte client ou sans niveau
            AFFBTC01.ActReport (pIdtAff,rA.IdtEtp,pIdtPlnAct,rA.IdtCtlAct,vIdtRpt);
        IF rA.IdtNivAct = 4  OR rA.IdtNivAct = 6 THEN
            --      -- si batch de coupure

            AFFBTC01.IntActDelai(pIdtAff ,rA.IdtEtp ,vDatPreAct ,vDatReeAct ,vDelaiAct);



          -- JCD le 20/11/2009
          -- le statut est mis a "en cours" (4) au lieu de NULL
          -- FBE 20/11/2009: NON - Le statut doit prendre en compte si l'action est en
          --                 avancement automatique
            IF pPdl IS NOT NULL THEN
                INSERT INTO ACTCRS (IdtClt, IdtAff, IdtActCrs, IdtPlnAct,
                    IdtEtp, IdtRet, IdtCtlAct, IdtCptClt, IdtPntLvr, IdtPntCpg, MntRlc, IdtCpr
                   ,DATPRE,DATREE,DELAI,NUMORD,IDTRPT)
                VALUES (pIdtClt, pIdtAff, seq_actcrs.NEXTVAL, pIdtPlnAct,rA.IdtEtp, decode(NumRow,1,decode(rA.AvcAut,1,4,8),null), rA.IdtCtlAct,
                    nIdtCptClt, pPdl, pPdc, NVL(Sldexg(pIdtClt, 1),0),  nIdtCpr
               ,vDatPreAct,decode(NumRow,1,decode(rA.AvcAut,1,sysdate,null),null),vDelaiAct
               ,(select count(*) from actcrs where idtaff = pidtaff),vIdtRpt );
                ---- si batch de relance
                ---- un seul pdc pour le client
                vReturn := true;
            ELSE
                IF maxpdc = 1 THEN
                    INSERT INTO ACTCRS (IdtClt, IdtAff, IdtActCrs, IdtPlnAct,
                        IdtEtp, IdtRet, IdtCtlAct, IdtCptClt, IdtCtr, IdtPntLvr, IdtPntCpg, MntRlc
                   ,DATPRE,DATREE,DELAI,NUMORD,IDTRPT)
                    VALUES (pIdtClt, pIdtAff, seq_actcrs.NEXTVAL, pIdtPlnAct,
                        rA.IdtEtp, decode(NumRow,1,decode(rA.AvcAut,1,4,8),null), rA.IdtCtlAct, nIdtCptClt,
                        tabpdc_sIdtCtr(0),
                        tabpdc_nIdtPntLvr(0),
                        tabpdc_nIdtPntCpg(0),   NVL(Sldexg(pIdtClt, 1),0)
                       ,vDatPreAct,decode(NumRow,1,decode(rA.AvcAut,1,sysdate,null),null),vDelaiAct
                       ,(select count(*) from actcrs where idtaff = pidtaff),vIdtRpt );
                   vReturn := true;
                ELSE
                    INSERT INTO ACTCRS (IdtClt, IdtAff, IdtActCrs, IdtPlnAct,
                        IdtEtp, IdtRet, IdtCtlAct, IdtCptClt, MntRlc
                       ,DATPRE,DATREE,DELAI,NUMORD,IDTRPT)
                    VALUES (pIdtClt, pIdtAff, seq_actcrs.NEXTVAL, pIdtPlnAct,rA.IdtEtp, decode(NumRow,1,decode(rA.AvcAut,1,4,8),null), rA.IdtCtlAct, nIdtCptClt, NVL(Sldexg(pIdtClt, 1),0)
                           ,vDatPreAct,decode(NumRow,1,decode(rA.AvcAut,1,sysdate,null),null),vDelaiAct
                           ,(select count(*) from actcrs where idtaff = pidtaff),vIdtRpt );
                   vReturn := true;
                END IF;
            END IF;
        END IF;
        -- niveau point de livraison (inutile)
        IF rA.IdtNivAct = 1 THEN

            AFFBTC01.IntActDelai(pIdtAff ,rA.IdtEtp ,vDatPreAct ,vDatReeAct ,vDelaiAct);

            if maxpdc = 0 then
                INSERT INTO ACTCRS (IdtClt, IdtAff, IdtActCrs, IdtPlnAct,
                    IdtEtp, IdtRet, IdtCtlAct, IdtCptClt, IdtPntLvr, IdtPntCpg, MntRlc, IdtCpr
                   ,DATPRE,DATREE,DELAI,NUMORD,IDTRPT)
                VALUES (pIdtClt, pIdtAff, seq_actcrs.NEXTVAL, pIdtPlnAct,rA.IdtEtp, decode(NumRow,1,decode(rA.AvcAut,1,4,8),null), rA.IdtCtlAct,
                    nIdtCptClt, pPdl, pPdc, NVL(Sldexg(pIdtClt, 1),0),  nIdtCpr
               ,vDatPreAct,decode(NumRow,1,decode(rA.AvcAut,1,sysdate,null),null),vDelaiAct
               ,(select count(*) from actcrs where idtaff = pidtaff),vIdtRpt );
               vReturn := true;
            else
                WHILE indpdl < maxpdl LOOP
                    INSERT INTO ACTCRS (IdtClt, IdtAff, IdtActCrs, IdtPlnAct,
                        IdtEtp, IdtRet, IdtCtlAct, IdtCptClt, IdtPntLvr, MntRlc
                           ,DATPRE,DATREE,DELAI,NUMORD,IDTRPT)
                    VALUES (pIdtClt, pIdtAff, seq_actcrs.NEXTVAL, pIdtPlnAct
                        ,rA.IdtEtp, decode(NumRow,1,decode(rA.AvcAut,1,4,8),null), rA.IdtCtlAct,
                        nIdtCptClt,
                        tabpdl_nIdtPntLvr(indpdl),
                        NVL(Sldexg(pIdtClt, 1),0)
                       ,vDatPreAct,decode(NumRow,1,decode(rA.AvcAut,1,sysdate,null),null),vDelaiAct
                       ,(select count(*) from actcrs where idtaff = pidtaff),vIdtRpt );
                   vReturn := true;

                    indpdl := indpdl + 1;
                END LOOP;
            end if;
        END IF;
        -- niveau point de comptage ou contrat
        IF rA.IdtNivAct = 2  OR ra.IdtNivAct = 5 THEN

            AFFBTC01.IntActDelai(pIdtAff ,rA.IdtEtp ,vDatPreAct ,vDatReeAct ,vDelaiAct);
--             BEGIN
--             vSldexg := NVL(Sldexg(pIdtClt, 1),0);
--             EXCEPTION when others then null;
--             END;

            if maxpdc = 0 then
                INSERT INTO ACTCRS (IdtClt, IdtAff, IdtActCrs, IdtPlnAct,
                    IdtEtp, IdtRet, IdtCtlAct, IdtCptClt, IdtPntLvr, IdtPntCpg, MntRlc, IdtCpr
                   ,DATPRE,DATREE,DELAI,NUMORD,IDTRPT)
                VALUES (pIdtClt, pIdtAff, seq_actcrs.NEXTVAL, pIdtPlnAct,rA.IdtEtp, decode(NumRow,1,decode(rA.AvcAut,1,4,8),null), rA.IdtCtlAct,
                    nIdtCptClt, pPdl, pPdc, NVL(Sldexg(pIdtClt, 1),0),  nIdtCpr
               ,vDatPreAct,decode(NumRow,1,decode(rA.AvcAut,1,sysdate,null),null),vDelaiAct
               ,(select count(*) from actcrs where idtaff = pidtaff),vIdtRpt );
               vReturn := true;
            else

                WHILE indpdc < maxpdc LOOP
    --                 x7util.TRACE('zezerze' || tabpdc_nIdtPntLvr(indpdc) );
    --                 x7util.TRACE('zezerze' || tabpdc_sIdtCtr(indpdc) );
    --                 x7util.TRACE('zezerze' || tabpdc_nIdtPntCpg(indpdc) );
    --                 x7util.TRACE('zezerze' || tabpdc_nIdtCpr(indpdc) );

                    INSERT INTO ACTCRS (IdtClt, IdtAff, IdtActCrs, IdtPlnAct,
                        IdtEtp, IdtRet, IdtCtlAct, IdtCptClt,
                        IdtCtr, IdtPntLvr, IdtPntCpg, MntRlc, IdtCpr
                           ,DATPRE,DATREE,DELAI,NUMORD,IDTRPT)
                    VALUES(pIdtClt, pIdtAff, seq_actcrs.NEXTVAL, pIdtPlnAct
                        ,rA.IdtEtp, decode(NumRow,1,decode(rA.AvcAut,1,4,8),null), rA.IdtCtlAct, nIdtCptClt,
                        tabpdc_sIdtCtr(indpdc),
                        tabpdc_nIdtPntLvr(indpdc),
                        tabpdc_nIdtPntCpg(indpdc),
                        NVL(Sldexg(pIdtClt, 1),0),
                        tabpdc_nIdtCpr(indpdc)    -- HNG 09/12/2004 Prendre en compte le compteur
                       ,vDatPreAct,decode(NumRow,1,decode(rA.AvcAut,1,sysdate,null),null),vDelaiAct
                       ,(select count(*) from actcrs where idtaff = pidtaff)
                       ,vIdtRpt
                        );
                    indpdc := indpdc + 1;
                    vReturn := true;
                END LOOP;
            end if;
        END IF;
        -- niveau compteur
        IF rA.IdtNivAct = 3 THEN
            -- si pas de compteur on n'initialise pas l'affaire
--            IF maxcpr = 0 THEN
--                RETURN FALSE;
--            END IF;

            AFFBTC01.IntActDelai(pIdtAff ,rA.IdtEtp ,vDatPreAct ,vDatReeAct ,vDelaiAct);

            if maxpdc = 0 then
                INSERT INTO ACTCRS (IdtClt, IdtAff, IdtActCrs, IdtPlnAct,
                    IdtEtp, IdtRet, IdtCtlAct, IdtCptClt, IdtPntLvr, IdtPntCpg, MntRlc, IdtCpr
                   ,DATPRE,DATREE,DELAI,NUMORD,IDTRPT)
                VALUES (pIdtClt, pIdtAff, seq_actcrs.NEXTVAL, pIdtPlnAct,rA.IdtEtp, decode(NumRow,1,decode(rA.AvcAut,1,4,8),null), rA.IdtCtlAct,
                    nIdtCptClt, pPdl, pPdc, NVL(Sldexg(pIdtClt, 1),0),  nIdtCpr
               ,vDatPreAct,decode(NumRow,1,decode(rA.AvcAut,1,sysdate,null),null),vDelaiAct
               ,(select count(*) from actcrs where idtaff = pidtaff),vIdtRpt );
               vReturn := true;
           else
                WHILE indcpr < maxcpr LOOP
                    INSERT INTO ACTCRS (IdtClt, IdtAff, IdtActCrs, IdtPlnAct,
                        IdtEtp, IdtRet, IdtCtlAct, idtCptClt, IdtCtr, IdtPntLvr,
                        IdtPntCpg, IdtCpr, MntRlc
                           ,DATPRE,DATREE,DELAI,NUMORD,IDTRPT)
                    VALUES (pIdtClt, pIdtAff, seq_actcrs.NEXTVAL, pIdtPlnAct
                        ,rA.IdtEtp, decode(NumRow,1,decode(rA.AvcAut,1,4,8),null), rA.IdtCtlAct,
                        nIdtCptClt,
                        tabcpr_sIdtCtr(indcpr),
                        tabcpr_nIdtPntLvr(indcpr),
                        tabcpr_nIdtPntCpg(indcpr),
                        tabcpr_nIdtCpr(indcpr),
                        NVL(Sldexg(pIdtClt, 1),0)
                       ,vDatPreAct,decode(NumRow,1,decode(rA.AvcAut,1,sysdate,null),null),vDelaiAct
                       ,(select count(*) from actcrs where idtaff = pidtaff)
                       ,vIdtRpt );
                    indcpr := indcpr + 1;
                   vReturn := true;
                END LOOP;
           end if;
        END IF;
    END LOOP;

    RETURN vReturn;
END;
--
-- JCE
--

-----------------------------------------------------------------------------
-----------------------------------------------------------------------------
-----------------------------------------------------------------------------
PROCEDURE Ini1CntMls (pIdtClt VARCHAR2, pIdtPlnAct VARCHAR2, pIdtTypCnt NUMBER, pIdtMtfCnt NUMBER, pIdtAgt VARCHAR2, pDatDmd DATE, pObjMTextmls VARCHAR2, pIdtSml SML.IDTSML%TYPE) IS
--        --------- Initialisation d'un contact type mail
--
   vSqcCnt NUMBER;
   vSqcAff NUMBER;
   vIdtCntOpr CLT.IdtCntOpr%TYPE;
   vIdtCodSns CLT.IdtCodSns%TYPE;
   vIdtSqcGnr CNT.IDTSQCGNR%TYPE;
--   vRst boolean;
BEGIN
   SAVEPOINT spAff;
   -- Récupération de la séquence contact client et autres données
   SELECT NVL(SqcCnt, 0)+1, IdtCntOpr, IdtCodSns INTO vSqcCnt, vIdtCntOpr, vIdtCodSns
      FROM CLT WHERE IdtClt = pIdtClt FOR UPDATE OF SqcCnt;
   UPDATE CLT SET SqcCnt = vSqcCnt WHERE IdtClt = pIdtClt;
   -- Insertion d'un contact commercial, motif relance
   INSERT INTO CNT (IdtClt, IdtCnt, IdtTypCnt, IdtMtfCnt,
         IdtAgt, IdtCntOpr, IdtCodSns, INT, DatCnt
         ,IdtOrgCnt, IdtSml, IdtAgtSui)
      VALUES (pIdtClt, vSqcCnt, pIdtTypCnt, pIdtMtfCnt,
         pIdtAgt, vIdtCntOpr, vIdtCodSns, 1, pDatDmd
         ,(select idttypostd from typostd where codtypostd = 'ORGCNT' and typostd = 'CNTINT')
         ,pIdtSml
         ,(select idtagtsui from SML where IDTSML= pIdtSml)
         );
   SELECT IDTSQCGNR INTO vIdtSqcGnr  FROM CNT WHERE idtclt=pIdtClt AND idtcnt=vSqcCnt;
   INSERT INTO NOTE (IDTNOTE,IDTSQCGNR,TXT,DATCRT,IDTAGT)
   VALUES ( seq_note.NEXTVAL, vIdtSqcGnr, pObjMTextmls, pDatDmd, pIdtAgt) ;

END Ini1CntMls;
-----------------------------------------------------------------------------
-----------------------------------------------------------------------------
-----------------------------------------------------------------------------

FUNCTION Verrou_TCHE(pROWID VARCHAR2)
--        --------- Version du package utilisé
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

PROCEDURE INICNTMLS(pIdtAgt VARCHAR2, pModDcl VARCHAR2) IS
--        --------- Initialisation d'un contact type mail
   --vIdtSml VARCHAR2(8);
   vIdtSml   SML.IDTSML%TYPE;
   vReq VARCHAR2(32000);
   vReqStc VARCHAR2(32000);
   curSlc NUMBER;
   vIdtClt VARCHAR2(6);
   retSlc NUMBER;
   vIdtPlnAct VARCHAR2(6);
   vIdtTypCnt NUMBER;
   vIdtMtfCnt NUMBER;
   vIdtAgtDmd  VARCHAR2(6);
   vObjMTextmls VARCHAR2(2040);
 CURSOR cTche IS
      SELECT ROWID, DatDmd, TO_NUMBER(Prm1) IdtSml, Prm2 FROM TCHE
      WHERE IdtTypTche = cIdtTypTche_IniCntMls
      AND IdtAgt = pIdtAgt AND ModDcl = pModDcl AND Stt IS NULL;
BEGIN
   FOR rT IN cTche LOOP
--      UPDATE TCHE SET Stt = cStt_EnCours WHERE ROWID = rT.ROWID;
--      COMMIT;
      if Verrou_TCHE(rT.ROWID) = 1 then
          vIdtAgtDmd := rT.Prm2;
      SELECT REQSTC, IdtPlnAct, NVL( IdtTypCnt,cIdtTypCnt_Com),NVL( IdtMtfCnt,cIdtMtfCnt_Mls),IdtSml
      INTO vReqStc , vIdtPlnAct, vIdtTypCnt, vIdtMtfCnt, vIdtSml
      FROM SML
      WHERE IdtSml = rT.IdtSml ;

      vReq := vReqStc || ' INTERSECT
                  SELECT IdtClt
                  FROM ENVMLS
                  WHERE IdtAgt = :bvIdtAgtDmd
                  AND ModDcl = :bvModDcl ';
      curSlc := dbms_sql.open_cursor;
      dbms_sql.parse ( curSlc, vReq, dbms_sql.NATIVE);
      dbms_sql.bind_variable ( curSlc, 'bvIdtAgtDmd',vIdtAgtDmd );
      dbms_sql.bind_variable ( curSlc, 'bvModDcl',pModDcl );
      dbms_sql.define_column ( curSlc, 1, vIdtClt,6);
      retSlc := dbms_sql.EXECUTE( curSlc );

      LOOP
          EXIT WHEN dbms_sql.fetch_rows(curSlc) = 0;
          dbms_sql.column_value(curSlc, 1, vIdtClt);
          SELECT objm || CHR(13) || CHR(10) || CHR(13) || CHR(10) || txtmls
          INTO vObjMTextmls
          FROM ENVMLS
          WHERE IdtAgt = vIdtAgtDmd
            AND ModDcl = pModDcl
            AND idtclt = vIdtClt;

           Ini1CntMls(vIdtClt, vIdtPlnAct, vIdtTypCnt, vIdtMtfCnt, vIdtAgtDmd, rT.DatDmd,vObjMTextmls, vIdtSml);

      END LOOP;

      DELETE ENVMLS WHERE  IdtSml = rT.IdtSml ;

      dbms_sql.CLOSE_CURSOR (curSlc);

          UPDATE TCHE SET Stt = cStt_Fini, DatRls = SYSDATE WHERE ROWID = rT.ROWID;
      end if;

      COMMIT;
   END LOOP;
END INICNTMLS;
-----------------------------------------------------------------------------
-----------------------------------------------------------------------------
-----------------------------------------------------------------------------
PROCEDURE Ini1AffRlc (pIdtClt VARCHAR2,
                      pIdtPlnAct VARCHAR2,
                      pIdtTypCnt NUMBER,
                      pIdtMtfCnt NUMBER,
                      pIdtAgt VARCHAR2,
                      pDatDmd DATE,
                      pIdtSml SML.IDTSML%TYPE) IS
--        --------- Initialisation d'une affaire de type relance
--
   vSqcCnt NUMBER;
   vSqcAff NUMBER;
   vIdtCntOpr CLT.IdtCntOpr%TYPE;
   vIdtCodSns CLT.IdtCodSns%TYPE;
   vRst BOOLEAN;
   vidtactcrs ACTCRS.idtactcrs%type;
   CURSOR cAFF IS
    SELECT 1
    FROM AFF
    WHERE IDTCLT = pIdtClt
      AND IDTPLNACT = pIdtPlnAct
      AND DATFIN IS NULL;
   rAFF cAFF%rowtype;
BEGIN
   -- Verification s'il existe deja un affaire avec le meme plan d'action pour ce client
   OPEN cAFF;
   FETCH cAFF INTO rAFF;
   IF NOT cAFF%NOTFOUND THEN
      CLOSE cAFF;
      RETURN;
   END IF;
   CLOSE cAFF;
   SAVEPOINT spAff;
   -- Récupération de la séquence contact client et autres données
   SELECT NVL(SqcCnt, 0)+1, IdtCntOpr, IdtCodSns
   INTO vSqcCnt, vIdtCntOpr, vIdtCodSns
   FROM CLT
   WHERE IdtClt = pIdtClt
   FOR UPDATE OF SqcCnt;

   UPDATE CLT SET SqcCnt = vSqcCnt WHERE IdtClt = pIdtClt;

   -- Insertion d'un contact commercial, motif relance
   INSERT INTO CNT (IdtClt, IdtCnt, IdtTypCnt, IdtMtfCnt,
         IdtAgt, IdtCntOpr, IdtCodSns, INT, DatCnt
         ,idtorgcnt  ,IdtSml, IdtAgtSui)
      VALUES (pIdtClt, vSqcCnt, pIdtTypCnt, pIdtMtfCnt,
         pIdtAgt, vIdtCntOpr, vIdtCodSns, 1, pDatDmd
         ,(select idttypostd from typostd where codtypostd = 'ORGCNT' and typostd = 'CNTINT')
         ,pIdtSml
         ,(select idtagtsui from SML where IDTSML= pIdtSml)
         );
   -- Insertion d'une affaire
   -- JDI 26/06/97 : ne pas insérer l'heure dans la date de création de l'affaire
   SELECT seq_aff.NEXTVAL
   INTO vSqcAff
   FROM dual;

   INSERT INTO AFF (IdtClt, IdtAff, IdtCnt, IdtCntOpr, IdtCodSns,
         IdtPlnAct, DatCrt, IdtEtp, EtpExe,
         IdtSML, DatMaj, MtrAgt,Stt, IdtAgtCrt)
      VALUES (pIdtClt, vSqcAff, vSqcCnt, vIdtCntOpr, vIdtCodSns,
         pIdtPlnAct, TO_DATE(TO_CHAR(pDatDmd,'DD/MM/YYYY'),'DD/MM/YYYY')+ (sysdate - trunc(sysdate))
         , 1, 0,
         pIdtSml, sysdate, 'BATCH', 'C', 'BATCH');
   -- JCE mise à jour date de dernière relance du compte client

   UPDATE CPTCLT SET DatDrnRlc = SYSDATE WHERE IdtClt = pIdtClt;

   -- Insertion des actions en cours de l'étape 1

   vRst := CreActCrs (pIdtClt, pIdtPlnAct, vSqcAff, NULL, NULL);
   IF vRst = FALSE THEN
      ROLLBACK TO spAff;
   END IF;

    --Avancement auto
   select min(idtactcrs)
    into vidtactcrs
    from actcrs
    where idtaff = vSqcAff;

   update actcrs a set
    (idtret,DatRee) = (select decode(avcaut,1,4,0,8), decode(avcaut,1,sysdate,0,null) from ctlact c where c.IDTCTLACT = a.IDTCTLACT)
    where idtactcrs = vidtactcrs;

   AFFBTC02.AVANCEMENTAUTOAFFAIRE(vidtactcrs,'BATCH');
--
END Ini1AffRlc;
-----------------------------------------------------------------------------
-----------------------------------------------------------------------------
-----------------------------------------------------------------------------

PROCEDURE IniAffRlc (pIdtAgt VARCHAR2, pModDcl VARCHAR2) IS
--        --------- Initialisation d'affaire de type relance
   --vIdtSml varchar2(8);
   vReq VARCHAR2(32000);
   vReqStc VARCHAR2(32000);
   curSlc NUMBER;
   vIdtClt CLT.IDTCLT%TYPE;
   retSlc NUMBER;
   vIdtPlnAct PLNACT.IDTPLNACT%TYPE;
   vIdtTypCnt NUMBER;
   vIdtMtfCnt NUMBER;
   vIdtAgtDmd AGT.IDTAGT%TYPE;

   vIdtSml   SML.IDTSML%TYPE;
 CURSOR cTche IS
      SELECT ROWID, DatDmd, TO_NUMBER(Prm1) IdtSml, Prm2 FROM TCHE
      WHERE IdtTypTche = cIdtTypTche_IniAffRlc
      AND IdtAgt = pIdtAgt AND ModDcl = pModDcl AND Stt IS NULL;
BEGIN
   FOR rT IN cTche LOOP
      UPDATE TCHE SET Stt = cStt_EnCours WHERE ROWID = rT.ROWID;
      COMMIT;
      vIdtAgtDmd := rT.Prm2;
      SELECT REQSTC, IdtPlnAct, NVL( IdtTypCnt,cIdtTypCnt_Com),NVL( IdtMtfCnt,cIdtMtfCnt_Rlc),IdtSml
      INTO vReqStc , vIdtPlnAct, vIdtTypCnt, vIdtMtfCnt ,vIdtSml
      FROM SML
      WHERE IdtSml = rT.IdtSml ;
      vReq := vReqStc || ' INTERSECT
                    SELECT IdtClt
                    FROM RLC_CLT
                    WHERE IdtAgt = :bvIdtAgtDmd
                    AND ModDcl = :bvModDcl ';
      curSlc := dbms_sql.open_cursor;
      dbms_sql.parse ( curSlc, vReq, dbms_sql.NATIVE);
      dbms_sql.bind_variable ( curSlc, 'bvIdtAgtDmd',vIdtAgtDmd );
      dbms_sql.bind_variable ( curSlc, 'bvModDcl',pModDcl );
      dbms_sql.define_column ( curSlc, 1, vIdtClt,6);
      retSlc := dbms_sql.EXECUTE( curSlc );
      LOOP
         EXIT WHEN dbms_sql.fetch_rows(curSlc) = 0;
         dbms_sql.column_value(curSlc, 1, vIdtClt);
         Ini1AffRlc(vIdtClt, vIdtPlnAct, vIdtTypCnt, vIdtMtfCnt, vIdtAgtDmd, rT.DatDmd, vIdtSml);
      END LOOP;
      DELETE RLC_CLT WHERE  IdtSml = rT.IdtSml ;
      dbms_sql.CLOSE_CURSOR (curSlc);
      UPDATE TCHE SET Stt = cStt_Fini, DatRls = SYSDATE WHERE ROWID = rT.ROWID;
      COMMIT;
   END LOOP;
END IniAffRlc;
-----------------------------------------------------------------------------
-----------------------------------------------------------------------------
-----------------------------------------------------------------------------
 PROCEDURE Ini1AffCou (pIdtPntLvr NUMBER,
                       pIdtPntCpg NUMBER,
                       pIdtPlnAct VARCHAR2,
                       pIdtTypCnt NUMBER,
                       pIdtMtfCnt NUMBER,
                       pIdtAgt VARCHAR2,
                       pDatDmd DATE,
                       pIdtSml   SML.IDTSML%TYPE
                       ) IS
 --        ---------- Initialisation d'une affaire de type coupure
 --
    vSqcCnt NUMBER;
    vSqcAff NUMBER;
    vIdtClt CLT.IdtClt%TYPE;
    vIdtCtr CTR.IdtCtr%TYPE;
    vIdtCntOpr CLT.IdtCntOpr%TYPE;
    vIdtCodSns CLT.IdtCodSns%TYPE;
    nIdtCptClt CPTCLT.IdtCptClt%TYPE;
    vRst BOOLEAN;
    --vIdtCtlAct number(22);
    vIdtSrv NUMBER(22);
    vNbrCnd NUMBER(22);
    vClbMinDsj NUMBER(22);
    vClbMaxDsj NUMBER(22);
    vDmtPntCpg NUMBER(22);
    vIdtUntMsrDmtPntCpg NUMBER(22);
    vRglDsjAvn NUMBER(22);
    vIdtTypPln NUMBER(22);
    vNbrCtr NUMBER;
    CURSOR cCtlAct IS
     SELECT ACTCRS.IdtActCrs,
            ACTCRS.IdtCtlAct,
            ACTCRS.IdtCpr
     FROM ACTCRS
     WHERE ACTCRS.IdtAff = vSqcAff
       AND ACTCRS.IdtPlnAct = pIdtPlnAct
       --AND ACTCRS.IdtEtp = 1;
     ORDER BY NUMORD;
    CURSOR cAFF IS
     SELECT 1
     FROM AFF, ACTCRS
     WHERE ACTCRS.IdtAff = AFF.IdtAff
       AND ACTCRS.IdtPntLvr = pIdtPntLvr
       AND ACTCRS.IdtPntCpg = pIdtPntCpg
       AND AFF.IDTPLNACT = pIdtPlnAct
       AND AFF.DATFIN IS NULL;
    rAFF cAFF%rowtype;

    vidtactcrs     ACTCRS.idtactcrs%type;

BEGIN
    -- Verification s'il existe deja un affaire avec le meme plan d'action pour ce point de comptage
    OPEN cAFF;
    FETCH cAFF INTO rAFF;
    IF NOT cAFF%NOTFOUND THEN
       CLOSE cAFF;
       RETURN;
    END IF;
    CLOSE cAFF;
    SAVEPOINT spAff;
    -- FBE 05 02 01 : Verificaci?n que el contrato no esté rescindido
    SELECT COUNT(*)
    INTO vNbrCtr
    FROM CTR
    WHERE IdtPntLvr = pIdtPntLvr
      AND IdtPntCpg = pIdtPntCpg
      AND  DatRsl IS NULL;

    IF vNbrCtr <> 0 THEN
      -- Récupération du numéro de client destinataire attaché à ce PntCpg
      SELECT IdtCtr, IdtCltDst
      INTO vIdtCtr, vIdtClt
      FROM CTR
      WHERE IdtPntLvr = pIdtPntLvr
        AND IdtPntCpg = pIdtPntCpg
        AND DatRsl IS NULL; --FBE 05 02 01 : Busqueda de contratos no rescindidos

      -- Récupération de la séquence contact client et autres données
      SELECT NVL(SqcCnt, 0)+1, IdtCntOpr, IdtCodSns
      INTO vSqcCnt, vIdtCntOpr, vIdtCodSns
      FROM CLT
      WHERE IdtClt = vIdtClt
      FOR UPDATE OF SqcCnt;

      -- JCE recherche du compte client
      SELECT IdtCptCLt
      INTO nIdtCptClt
      FROM CPTCLT
      WHERE IdtClt = vIdtClt;

      UPDATE CLT SET SqcCnt = vSqcCnt WHERE IdtClt = vIdtClt;

      -- Insertion d'un contact commercial, motif coupure
      INSERT INTO CNT (IdtClt, IdtCnt, IdtTypCnt, IdtMtfCnt,
            IdtAgt, IdtCntOpr, IdtCodSns, INT, DatCnt
            ,idtorgcnt, IdtSml, IdtAgtSui)
         VALUES (vIdtClt, vSqcCnt, pIdtTypCnt, pIdtMtfCnt,
            pIdtAgt, vIdtCntOpr, vIdtCodSns, 1, pDatDmd
          ,(select idttypostd from typostd where codtypostd = 'ORGCNT' and typostd = 'CNTINT')
          ,pIdtSml
         ,(select idtagtsui from SML where IDTSML= pIdtSml)
            );
      -- Insertion d'une affaire

      -- JDI 26/06/97 : ne pas insérer l'heure dans la date de création de l'affaire
      SELECT seq_aff.NEXTVAL INTO vSqcAff FROM dual;

      INSERT INTO AFF (IdtClt, IdtAff, IdtCnt, IdtCntOpr, IdtCodSns,
            IdtPlnAct, DatCrt, IdtEtp, EtpExe
            ,IdtSml, DatMaj, MtrAgt,Stt, IdtAgtCrt)
         VALUES (vIdtClt, vSqcAff, vSqcCnt, vIdtCntOpr, vIdtCodSns,
            pIdtPlnAct, TO_DATE(TO_CHAR(pDatDmd,'DD/MM/YYYY'),'DD/MM/YYYY') + (sysdate - trunc(sysdate))
            , 1,1,
            pIdtSml, sysdate, 'BATCH', 'C', 'BATCH');
      -- Insertion des actions en cours de l'étape 1
      vRst := CreActCrs (vIdtClt, pIdtPlnAct, vSqcAff, pIdtPntLvr, pIdtPntCpg);
      IF vRst = FALSE THEN
         ROLLBACK TO spAff;
      END IF;


    --Avancement auto
    select min(idtactcrs)
    into vidtactcrs
    from actcrs
    where idtaff = vSqcAff;

    update actcrs a set
    (idtret,DatRee) = (select decode(avcaut,1,4,0,8), decode(avcaut,1,sysdate,0,null) from ctlact c where c.IDTCTLACT = a.IDTCTLACT)
    where idtactcrs = vidtactcrs;

    AFFBTC02.AVANCEMENTAUTOAFFAIRE(vidtactcrs,'BATCH');




--      -- Si le plan d'action est de type coupure, créer une intervention
--      -- select IdtTypPln into vIdtTypPln from PlnAct where IdtPlnAct=pIdtPlnAct;
--      -- if vIdtTypPln = 4 then
--         -- Récupérer les informations complémentaires
--      SELECT
--         PNTCPG.IdtSrv,
--         PNTCPG.NbrCnd,
--         PNTCPG.ClbMinDsj,
--         PNTCPG.ClbMaxDsj,
--         PNTCPG.Dmt,
--         PNTCPG.IdtUntMsrDmt
--      INTO
--         vIdtSrv,
--         vNbrCnd,
--         vClbMinDsj,
--         vClbMaxDsj,
--         vDmtPntCpg,
--         vIdtUntMsrDmtPntCpg
--      FROM
--         PNTCPG
--      WHERE PNTCPG.IdtPntLvr = pIdtPntLvr
--        AND PNTCPG.IdtPntCpg = pIdtPntCpg;
--
--       -- informations de réglage disjoncteur contenue dans le dernier avenant au contrat
--       SELECT PSSSSC.RglDsj
--       INTO   vRglDsjAvn
--       FROM PSSSSC,AVTCTR
--       WHERE PSSSSC.IdtPssSsc(+) = AVTCTR.IdtPssSsc
--         AND AVTCTR.DatFin IS NULL
--         AND AVTCTR.IdtCtr = vIdtCtr;
--         -- On boucle sur toutes les action en cours de l'étape 1
--         -- une action par compteur (si niveau compteur)
--       FOR rActCrs IN cCtlAct LOOP
--           -- Créer l'intervention
--          INSERT INTO INTPKB
--          (
--          INTPKB.IdtInt,
--          INTPKB.IdtCtlAct,
--          INTPKB.Sta,
--          INTPKB.IdtClt,
--          INTPKB.IdtPntLvr,
--          INTPKB.IdtPntCpg,
--          INTPKB.IdtSrv,
--          INTPKB.NbrCnd,
--          INTPKB.ClbMinDsj,
--          INTPKB.ClbMaxDsj,
--          INTPKB.DmtPntCpg,
--          INTPKB.IdtUntMsrDmtPntCpg,
--          INTPKB.IdtCtr,
--          INTPKB.IdtCprAvn,
--          INTPKB.RglDsjAvn,
--          INTPKB.DatExePrv,
--          INTPKB.DatDem,
--          INTPKB.IdtSml
--          )
--          VALUES
--          (
--          SEQ_INT.NEXTVAL,
--          rActCrs.IdtCtlAct,
--          '2',
--          vIdtClt,
--          pIdtPntLvr,
--          pIdtPntCpg,
--          vIdtSrv,
--          vNbrCnd,
--          vClbMinDsj,
--          vClbMaxDsj,
--          vDmtPntCpg,
--          vIdtUntMsrDmtPntCpg,
--          vIdtCtr,
--          rActCrs.IdtCpr,
--          vRglDsjAvn,
--          SYSDATE,
--          SYSDATE,
--          pIdtSml
--          );
--          -- Renseigner le numéro d'intervention dans l'action en cours
--          UPDATE ACTCRS SET IdtInt = SEQ_INT.CURRVAL
--          WHERE ACTCRS.IdtActCrs = rActCrs.IdtActCrs;
--      END LOOP;
      -- end if;
   END IF;
 END Ini1AffCou;
---------------------------------------------------------------------------
---------------------------------------------------------------------------
---------------------------------------------------------------------------
 PROCEDURE IniAffCou (pIdtAgt VARCHAR2, pModDcl VARCHAR2) IS
 --        --------- Initialisation d'affaire de type coupure
  nCount NUMBER;
    --vIdtSml varchar2(8);
    vReqStc  VARCHAR2(32000);
    vReq  VARCHAR2(32000);
    curSlc NUMBER;
    nIdtPntCpg NUMBER;
    nIdtPntLvr NUMBER;
    retSlc NUMBER;
    vIdtPlnAct PLNACT.IDTPLNACT%TYPE;
    vIdtTypCnt NUMBER;
    vIdtMtfCnt NUMBER;
    vIdtAgtDmd AGT.IDTAGT%TYPE;

    vIdtSml   SML.IDTSML%TYPE;

    CURSOR cTche IS
       SELECT ROWID, DatDmd,TO_NUMBER(Prm1) IdtSml, Prm2 FROM TCHE
       WHERE IdtTypTche = cIdtTypTche_IniAffCou
           AND IdtAgt = pIdtAgt AND ModDcl = pModDcl AND Stt IS NULL;
 BEGIN
    FOR rT IN cTche LOOP
       UPDATE TCHE SET Stt = cStt_EnCours WHERE ROWID = rT.ROWID;
       COMMIT;
       vIdtAgtDmd:=rT.Prm2;
       SELECT REQSTC , IdtPlnAct, NVL(IdtTypCnt,cIdtTypCnt_Com), NVL(IdtMtfCnt,cIdtMtfCnt_Cou) , idtsml
       INTO vReqStc  , vIdtPlnAct, vIdtTypCnt, vIdtMtfCnt , vIdtSml
       FROM SML
       WHERE IdtSml = rT.IdtSml ;
       -- FBE : 07 05 02 : Adici?n de la condici?n AND IdtSml = rT.IdtSml
       --                  debido a que se generaban OT duplicadas. Ver comentarios
       --                  en el encabezado.
       vReq := vReqStc || ' INTERSECT
                   SELECT IdtPntLvr,IdtPntCpg
                   FROM COU_PNTCPG
                   WHERE IdtAgt = :bvIdtAgtDmd
                   AND ModDcl = :bvModDcl
                   AND IdtSml = ' || rT.IdtSml ;

       X7.X7UTIL.TRACE(' vReq ' || vReq);

       curSlc := dbms_sql.open_cursor;
       dbms_sql.parse ( curSlc, vReq, dbms_sql.NATIVE);
       dbms_sql.bind_variable ( curSlc, 'bvIdtAgtDmd',vIdtAgtDmd );
       dbms_sql.bind_variable ( curSlc, 'bvModDcl',pModDcl );
       dbms_sql.define_column ( curSlc, 1, nIdtPntLvr );
       dbms_sql.define_column ( curSlc, 2, nIdtPntCpg );
       retSlc := dbms_sql.EXECUTE( curSlc );
       LOOP
          EXIT WHEN dbms_sql.fetch_rows(curSlc) = 0;
          dbms_sql.column_value(curSlc, 1, nIdtPntLvr );
          dbms_sql.column_value(curSlc, 2, nIdtPntCpg );
          Ini1AffCou(nIdtPntLvr, nIdtPntCpg, vIdtPlnAct,vIdtTypCnt, vIdtMtfCnt, vIdtAgtDmd, rT.DatDmd,vIdtSml);
       END LOOP;

       DELETE COU_PNTCPG WHERE   IdtSml = rT.IdtSml ;
       dbms_sql.CLOSE_CURSOR (curSlc);
       UPDATE TCHE SET Stt = cStt_Fini, DatRls = SYSDATE WHERE ROWID = rT.ROWID;
       COMMIT;
       -- Rechercher une tache d'impression pour l'agent 'BATCH'
       IF pIdtAgt = 'BATCH' THEN
          SELECT COUNT(*) INTO nCount FROM TCHE
          WHERE IdtTypTche = cIdtTypTche_ImpBonInt
            AND IdtAgt = pIdtAgt
            AND ModDcl = pModDcl
            AND Stt IS NULL;
          -- Si elle n'existe pas, la créer
          IF nCount = 0 THEN
             INSERT INTO TCHE (IDTTYPTCHE,IDTAGT,DATDMD,MODDCL)
             VALUES(cIdtTypTche_ImpBonInt,pIdtAgt,SYSDATE,'B');
             COMMIT;
          END IF;
       END IF;
    END LOOP;
EXCEPTION
   WHEN others THEN
      MSGERR := 'IniAffCou'
              || CHR(13)|| CHR(10)
              || vReq
              || CHR(13)|| CHR(10)
              || versionpkg()
              || CHR(13)|| CHR(10)
              || to_char(sqlcode) ||' '|| to_char(SQLERRM)
              || CHR(13)|| CHR(10)
              || DBMS_UTILITY.FORMAT_ERROR_BACKTRACE;
      X7UTIL.TRACEERR(FICERR,MSGERR);
      rollback;

 END IniAffCou;
-----------------------------------------------------------------------------
-----------------------------------------------------------------------------
-----------------------------------------------------------------------------
PROCEDURE CreerAffaire (pIdtPntLvr NUMBER,
                        pIdtPntCpg NUMBER,
                        pIdtCpr    NUMBER,
                        pIdtPlnAct VARCHAR2,
                        pIdtAgt    VARCHAR2,
                        pIdtClt    CLT.IDTCLT%TYPE,
                        pIdtCnt    CNT.IDTCNT%TYPE)
IS
--        ---------- Creation d'une affaire
--
   vSqcAff NUMBER;
   vIdtCtr CTR.IdtCtr%TYPE;
   vIdtCntOpr CLT.IdtCntOpr%TYPE;
   vIdtCodSns CLT.IdtCodSns%TYPE;
   vRst BOOLEAN;
   vIdtCtlAct NUMBER(22);
   vIdtSrv NUMBER(22);
   vNbrCnd NUMBER(22);
   vClbMinDsj NUMBER(22);
   vClbMaxDsj NUMBER(22);
   vDmtPntCpg NUMBER(22);
   vIdtUntMsrDmtPntCpg NUMBER(22);
   vRglDsjAvn NUMBER(22);
   vIdtTypPln NUMBER(22);

   vNUMSQL  number(22);

   vidtactcrs     ACTCRS.idtactcrs%type;
   vCodMsg SYS_MSG.Msg_Code%TYPE;
   vMsg varchar2(4000);
   vMsgErr varchar2(4000);
   eException EXCEPTION;

BEGIN
   -- Récupération du numéro de contrat
   BEGIN
     SELECT IdtCtr
     INTO   vIdtCtr
     FROM CTR
     WHERE IdtPntLvr = pIdtPntLvr
      AND  IdtPntCpg = pIdtPntCpg
      AND  CTR.datrsl IS NULL;
   EXCEPTION WHEN NO_DATA_FOUND THEN
     vIdtCtr := NULL;
   END;
   -- Récupération des informations du contact
   SELECT IdtCntOpr, IdtCodSns
   INTO   vIdtCntOpr,
          vIdtCodSns
   FROM   CNT
   WHERE  IdtClt = pIdtClt
    and   IdtCnt = pIdtCnt;
   -- Insertion d'une affaire
   SELECT seq_aff.NEXTVAL INTO vSqcAff FROM dual;
   INSERT INTO AFF
       (IdtClt,
        IdtAff,
        IdtCnt,
        IdtCntOpr,
        IdtCodSns,
        IdtPlnAct,
        DatCrt,
        IdtEtp,
        EtpExe,
        MTRAGT,
        IDTAGTCRT, Stt, DatMaj
        )
      VALUES
       (pIdtClt,
        vSqcAff,
        pIdtCnt,
        vIdtCntOpr,
        vIdtCodSns,
        pIdtPlnAct,
        SYSDATE,
        1,
        1,
        pIdtAgt,
        pIdtAgt, 'C', sysdate);
   vNUMSQL := SQL%ROWCOUNT;
   -- Insertion des actions en cours de l'étape 1
   vRst := CreActCrs (pIdtClt,
                      pIdtPlnAct,
                      vSqcAff,
                      pIdtPntLvr,
                      pIdtPntCpg);
   IF vRst = FALSE THEN
      vCodMsg := 'ERR_AFF0001';
      raise eException;
   END IF;
   -- Récupérer les informations complémentaires
    --Avancement auto
   select min(idtactcrs)
    into vidtactcrs
   from actcrs
   where idtaff = vSqcAff;

    update actcrs a set
    idtret = (select decode(avcaut,1,4,0,8) from ctlact c where c.IDTCTLACT = a.IDTCTLACT)
    where idtactcrs = vidtactcrs;

    AFFBTC02.AVANCEMENTAUTOAFFAIRE(vidtactcrs,pIdtAgt);
EXCEPTION
  when eException then
    vMsg := TRTMSG01.ChercheMsg(vCodMsg);
    vMsg := replace(vMsg,':IdtClt',pIdtClt);
--    X7.GEST_ERREUR_CENTURA(VersionPkg(),
--                          0,
--                          'AFFBTC01',
--                          'CreerAffaire',
--                          vMsg,
--                          null,
--                          null);
    Raise_Application_Error(X7UTIL.Erreur_X7_centura,vMsg);
  when others then
    vMsg := TRTMSG01.ChercheMsg('ERR_AFF0001');
    vMsg := replace(vMsg,':IdtClt',pIdtClt);
    vMsgErr := vMsg || chr(13) || chr(10);
    vMsgErr := vMsgErr || 'ERROR ORACLE:' || chr(13) || chr(10);
    vMsgErr := vMsgErr || SQLERRM || chr(13) || chr(10) || DBMS_UTILITY.Format_Error_BackTrace;
    X7.GEST_ERREUR_CENTURA(VersionPkg(),
                          0,
                          'AFFBTC01',
                          'CreerAffaire',
                          vMsgErr,
                          sqlcode,
                          DBMS_UTILITY.FORMAT_ERROR_BACKTRACE);
    Raise_Application_Error(X7UTIL.Erreur_X7_centura,vMsgErr);
END CreerAffaire;
-----------------------------------------------------------------------------
-----------------------------------------------------------------------------
-----------------------------------------------------------------------------
PROCEDURE Ini1AffObs (pIdtPntLvr NUMBER,
                      pIdtPntCpg NUMBER,
                      pIdtCpr    NUMBER,
                      pIdtPlnAct VARCHAR2,
                      pIdtAgt    VARCHAR2,
                      pIdtClt    CLT.IDTCLT%TYPE,
                      pIdtCnt    CNT.IDTCNT%TYPE)
IS
--        ---------- Initialisation d'une affaire sur code d'observation
--
   vSqcCnt NUMBER;
   vSqcAff NUMBER;
   vIdtClt CLT.IdtClt%TYPE;
   vIdtCtr CTR.IdtCtr%TYPE;
   vIdtCntOpr CLT.IdtCntOpr%TYPE;
   vIdtCodSns CLT.IdtCodSns%TYPE;
   nIdtCptClt CPTCLT.IDTCPTCLT%TYPE;
   vRst BOOLEAN;
   vIdtCtlAct NUMBER(22);
   vIdtSrv NUMBER(22);
   vNbrCnd NUMBER(22);
   vClbMinDsj NUMBER(22);
   vClbMaxDsj NUMBER(22);
   vDmtPntCpg NUMBER(22);
   vIdtUntMsrDmtPntCpg NUMBER(22);
   vRglDsjAvn NUMBER(22);
   vIdtTypPln NUMBER(22);

   vNUMSQL  number(22);

   vidtactcrs     ACTCRS.idtactcrs%type;

   CURSOR cCtlAct IS
    SELECT
        ACTCRS.IdtActCrs,
        ACTCRS.IdtCtlAct,
        ACTCRS.IdtCpr
    FROM  CTLACT,
            ACTCRS
    WHERE CTLACT.IDTTYPACT = 1
       AND  CTLACT.idtctlact = ACTCRS.idtctlact
       AND  ACTCRS.IdtAff = vSqcAff
       --AND  ACTCRS.IdtEtp = 1;
    ORDER BY ACTCRS.NumOrd;

   CURSOR cAFF IS
    SELECT 1
    FROM AFF
    WHERE IDTCLT = vIdtClt
      AND IDTPLNACT = pIdtPlnAct
      AND DATFIN IS NULL;
   rAFF cAFF%rowtype;

   nbpln number;

BEGIN

   select count(*)
   into nbpln
   from plnact
   where IdtPlnAct = pIdtPlnAct;

   -- FBE: Si le plan d'action n'existe pas, on genere une erreur
--   if nbpln = 0 then
--     --plan inconnu
--     return;
--   end if;

   SAVEPOINT spAff;
   -- Récupération du numéro de client destinataire attaché à ce PntCpg
   BEGIN
   SELECT IdtCtr,
          IdtCltDst
   INTO   vIdtCtr,
          vIdtClt
   FROM CTR
   WHERE IdtPntLvr = pIdtPntLvr
    AND  IdtPntCpg = pIdtPntCpg
    AND  CTR.datrsl IS NULL;
   EXCEPTION WHEN NO_DATA_FOUND THEN
     vIdtCtr := NULL;
     vIdtClt := pIdtClt;
   END;


   --Affaire déja présente
   OPEN cAFF;
   FETCH cAFF INTO rAFF;
   IF NOT cAFF%NOTFOUND THEN
      CLOSE cAFF;
      RETURN;
   END IF;
   CLOSE cAFF;

   -- Récupération de la séquence contact client et autres données
   IF pIdtCnt is null then
      BEGIN
      SELECT NVL(SqcCnt, 0)+1, IdtCntOpr, IdtCodSns
      INTO   vSqcCnt,
             vIdtCntOpr,
             vIdtCodSns
      FROM   CLT
      WHERE  IdtClt = vIdtClt
      FOR UPDATE OF SqcCnt;
      EXCEPTION WHEN NO_DATA_FOUND THEN
      NULL;
      END;---???
   ELSE
      SELECT pIdtCnt , IdtCntOpr, IdtCodSns
      INTO   vSqcCnt,
             vIdtCntOpr,
             vIdtCodSns
      FROM   CLT
      WHERE  IdtClt = vIdtClt
      FOR UPDATE OF SqcCnt;
   END IF;

   -- JCE recherche du compte client
   BEGIN
   SELECT IdtCptCLt
   INTO   nIdtCptClt
   FROM   CPTCLT
   WHERE IdtClt = vIdtClt;
   EXCEPTION WHEN NO_DATA_FOUND THEN
   NULL;
   END;---???

   UPDATE CLT
   SET    SqcCnt = vSqcCnt
   WHERE  IdtClt = vIdtClt;

   -- Insertion d'un contact commercial, motif Observation sur lecture
   IF pIdtCnt is null then
      INSERT INTO CNT
       (IdtClt,
        IdtCnt,
        IdtTypCnt,
        IdtMtfCnt,
        IdtAgt,
        IdtCntOpr,
        IdtCodSns,
        INT,
        DatCnt
        ,idtorgcnt)
      VALUES
       (vIdtClt,
        vSqcCnt,
        cIdtTypCnt_Com,
        cIdtMtfCnt_Obs,
        pidtagt,
        vIdtCntOpr,
        vIdtCodSns,
        1,
        TRUNC(SYSDATE)
        ,(select idttypostd from typostd where codtypostd = 'ORGCNT' and typostd = 'CNTINT')
        );
   END IF;

   -- Insertion d'une affaire
   -- FBE: Utilisation de la procedure de creation d'affaire
   CreerAffaire(pIdtPntLvr,
                pIdtPntCpg,
                pIdtCpr,
                pIdtPlnAct,
                pIdtAgt,
                vIdtClt,
                vSqcCnt);

--   SELECT seq_aff.NEXTVAL INTO vSqcAff FROM dual;
--
--   INSERT INTO AFF
--       (IdtClt,
--        IdtAff,
--        IdtCnt,
--        IdtCntOpr,
--        IdtCodSns,
--        IdtPlnAct,
--        DatCrt,
--        IdtEtp,
--        EtpExe,
--        MTRAGT,
--        IDTAGTCRT, Stt, DatMaj
--        )
--      VALUES
--       (vIdtClt,
--        vSqcAff,
--        vSqcCnt,
--        vIdtCntOpr,
--        vIdtCodSns,
--        pIdtPlnAct,
--        SYSDATE,
--        1,
--        1,
--        pIdtAgt,
--        pIdtAgt, 'C', sysdate);
--
--   vNUMSQL := SQL%ROWCOUNT;

   -- Insertion des actions en cours de l'étape 1
--   vRst := CreActCrs (vIdtClt,
--                      pIdtPlnAct,
--                      vSqcAff,
--                      pIdtPntLvr,
--                      pIdtPntCpg);
--   IF vRst = FALSE THEN
--      ROLLBACK TO spAff;
--   END IF;
   -- Récupérer les informations complémentaires

    --Avancement auto
--    select min(idtactcrs)
--    into vidtactcrs
--    from actcrs
--    where idtaff = vSqcAff;
--
--    update actcrs a set
--    idtret = (select decode(avcaut,1,4,0,8) from ctlact c where c.IDTCTLACT = a.IDTCTLACT)
--    where idtactcrs = vidtactcrs;
--
--    AFFBTC02.AVANCEMENTAUTOAFFAIRE(vidtactcrs,'BATCH');

--    BEGIN
--    SELECT
--         PNTCPG.IdtSrv,
--         PNTCPG.NbrCnd,
--         PNTCPG.ClbMinDsj,
--         PNTCPG.ClbMaxDsj,
--         PNTCPG.Dmt,
--         PNTCPG.IdtUntMsrDmt
--    INTO
--         vIdtSrv,
--         vNbrCnd,
--         vClbMinDsj,
--         vClbMaxDsj,
--         vDmtPntCpg,
--         vIdtUntMsrDmtPntCpg
--    FROM PNTCPG
--    WHERE PNTCPG.IdtPntLvr = pIdtPntLvr
--      AND PNTCPG.IdtPntCpg = pIdtPntCpg;
--    -- informations de réglage disjoncteur contenue dans le dernier avenant au contrat
--    SELECT PSSSSC.RglDsj
--    INTO vRglDsjAvn
--    FROM PSSSSC, AVTCTR
--    WHERE PSSSSC.IdtPssSsc(+) = AVTCTR.IdtPssSsc
--      AND AVTCTR.DatFin IS NULL
--      AND AVTCTR.IdtCtr = vIdtCtr;
--      -- On boucle sur toutes les action en cours de l'étape 1
--      -- une action par compteur (si niveau compteur)
--    EXCEPTION WHEN NO_DATA_FOUND THEN
--      NULL;
--    END;

--    FOR rActCrs IN cCtlAct LOOP
--       -- Créer l'intervention
--       INSERT INTO INTPKB
--       (
--       INTPKB.IdtInt,
--       INTPKB.IdtCtlAct,
--       INTPKB.Sta,
--       INTPKB.IdtClt,
--       INTPKB.IdtPntLvr,
--       INTPKB.IdtPntCpg,
--       INTPKB.IdtSrv,
--       INTPKB.NbrCnd,
--       INTPKB.ClbMinDsj,
--       INTPKB.ClbMaxDsj,
--       INTPKB.DmtPntCpg,
--       INTPKB.IdtUntMsrDmtPntCpg,
--       INTPKB.IdtCtr,
--       INTPKB.IdtCprAvn,
--       INTPKB.RglDsjAvn,
--       INTPKB.DatExePrv,
--       INTPKB.DatDem
--       )
--       VALUES
--       (
--       SEQ_INT.NEXTVAL,
--       rActCrs.IdtCtlAct,
--       '2',
--       vIdtClt,
--       pIdtPntLvr,
--       pIdtPntCpg,
--       vIdtSrv,
--       vNbrCnd,
--       vClbMinDsj,
--       vClbMaxDsj,
--       vDmtPntCpg,
--       vIdtUntMsrDmtPntCpg,
--       vIdtCtr,
--       rActCrs.IdtCpr,
--       vRglDsjAvn,
--       TRUNC(SYSDATE),
--         TRUNC(SYSDATE)
--       );
--          -- Renseigner le numéro d'intervention dans l'action en cours
--       UPDATE ACTCRS  SET
--          IdtInt = SEQ_INT.CURRVAL
--       WHERE ACTCRS.IdtActCrs = rActCrs.IdtActCrs;
--
--    END LOOP;
END Ini1AffObs;
-----------------------------------------------------------------------------
-----------------------------------------------------------------------------
-----------------------------------------------------------------------------
PROCEDURE IniAffObs IS
--        --------- Initialisation d'affaire de type coupure
   CURSOR cLstAffObs IS
      SELECT IDTPNTLVR,IDTPNTCPG,IDTCPR,IDTPLNACT,IDTAGT,NULL "IDTCLT",NULL "IDTCNT"
      FROM  LSTAFFOBS
      FOR   UPDATE OF idtpntlvr
      ORDER BY IDTPNTLVR,IDTPNTCPG,IDTCPR,IDTPLNACT;

--   CURSOR cLstAffCnt IS
--      SELECT IDTPNTLVR,IDTPNTCPG,IDTCPR,IDTPLNACT,IDTAGT,IDTCLT,IDTCNT
--      FROM  LSTAFFCNT
--      FOR   UPDATE OF idtpntlvr;
--   r_SAV cLstAffCnt%rowtype;

   CURSOR cLstAffRcs IS
      SELECT IDTPNTLVR,IDTPNTCPG,IDTCPR,IDTPLNACT,IDTAGT,IDTCLT,NULL "IDTCNT"
      FROM  LSTAFFRCS
      FOR   UPDATE OF idtpntlvr;
   r_SAV cLstAffRcs%rowtype;

BEGIN

      r_SAV.IdtPntLvr := 0;
      FOR rLstAffObs IN cLstAffObs
      LOOP
         BEGIN
         if r_SAV.IdtPntLvr <> rLstAffObs.IdtPntLvr
         or r_SAV.IdtPntCpg <> rLstAffObs.IdtPntCpg
         or r_SAV.IdtCpr    <> rLstAffObs.IdtCpr
         or r_SAV.IdtPlnAct <> rLstAffObs.IdtPlnAct
         or r_SAV.IdtClt    <> rLstAffObs.IdtClt
         or r_SAV.IdtCnt    <> rLstAffObs.IdtCnt
         THEN
            -- BPZ 9617
            SAVEPOINT spIniAffObs1;
            Ini1AffObs(rLstAffObs.IdtPntLvr,
                       rLstAffObs.IdtPntCpg,
                       rLstAffObs.IdtCpr,
                       rLstAffObs.IdtPlnAct,
                       rLstAffObs.IdtAgt,
                       null,
                       null);
         END IF;
         r_SAV.IdtPntLvr  := rLstAffObs.IdtPntLvr;
         r_SAV.IdtPntCpg  := rLstAffObs.IdtPntCpg;
         r_SAV.IdtCpr     := rLstAffObs.IdtCpr   ;
         r_SAV.IdtPlnAct  := rLstAffObs.IdtPlnAct;
         r_SAV.IdtClt     := rLstAffObs.IdtClt   ;
         r_SAV.IdtCnt     := rLstAffObs.IdtCnt   ;

         DELETE LSTAFFOBS WHERE CURRENT OF cLstAffObs;
         EXCEPTION
            WHEN OTHERS THEN
               X7UTIL.TRACE('LSTAFFOBS');
               X7UTIL.TRACE('others ' || to_char(sqlcode) ||' '|| to_char(SQLERRM  ) );
               X7UTIL.TRACE(rLstAffObs.IdtPntLvr);
               X7UTIL.TRACE(rLstAffObs.IdtPntCpg);
               X7UTIL.TRACE(rLstAffObs.IdtCpr);
               X7UTIL.TRACE(rLstAffObs.IdtPlnAct);
               X7UTIL.TRACE(rLstAffObs.IdtClt);
               X7UTIL.TRACE(rLstAffObs.IdtCnt);

              MSGERR := 'IniAffObs'
              || CHR(13)|| CHR(10)
              || versionpkg()
              || CHR(13)|| CHR(10)
              || to_char(sqlcode) ||' '|| to_char(SQLERRM)
              || CHR(13)|| CHR(10)
              || DBMS_UTILITY.FORMAT_ERROR_BACKTRACE;
              X7UTIL.TRACEERR(FICERR,MSGERR);
              --rollback;
              ROLLBACK TO spIniAffObs1;
        END;
      END LOOP;

--      r_SAV.IdtPntLvr := 0;
--      FOR rLstAffCnt IN cLstAffCnt
--      LOOP
--         BEGIN
--         if r_SAV.IdtPntLvr <> rLstAffCnt.IdtPntLvr
--         or r_SAV.IdtPntCpg <> rLstAffCnt.IdtPntCpg
--         or r_SAV.IdtCpr    <> rLstAffCnt.IdtCpr
--         or r_SAV.IdtPlnAct <> rLstAffCnt.IdtPlnAct
--         or r_SAV.IdtClt    <> rLstAffCnt.IdtClt
--         or r_SAV.IdtCnt    <> rLstAffCnt.IdtCnt
--         THEN
--            Ini1AffObs(rLstAffCnt.IdtPntLvr,
--                       rLstAffCnt.IdtPntCpg,
--                       rLstAffCnt.IdtCpr,
--                       rLstAffCnt.IdtPlnAct,
--                       rLstAffCnt.IdtAgt,
--                       rLstAffCnt.IdtClt,
--                       rLstAffCnt.IdtCnt);
--         END IF;
--         r_SAV.IdtPntLvr  := rLstAffCnt.IdtPntLvr;
--         r_SAV.IdtPntCpg  := rLstAffCnt.IdtPntCpg;
--         r_SAV.IdtCpr     := rLstAffCnt.IdtCpr   ;
--         r_SAV.IdtPlnAct  := rLstAffCnt.IdtPlnAct;
--         r_SAV.IdtClt     := rLstAffCnt.IdtClt   ;
--         r_SAV.IdtCnt     := rLstAffCnt.IdtCnt   ;

--         DELETE LSTAFFCNT WHERE CURRENT OF cLstAffCnt;
--         EXCEPTION
--            WHEN OTHERS THEN
--               X7UTIL.TRACE('LSTAFFCNT');
--               X7UTIL.TRACE('others ' || to_char(sqlcode) ||' '|| to_char(SQLERRM  ) );
--               X7UTIL.TRACE(rLstAffCnt.IdtPntLvr);
--               X7UTIL.TRACE(rLstAffCnt.IdtPntCpg);
--               X7UTIL.TRACE(rLstAffCnt.IdtCpr);
--               X7UTIL.TRACE(rLstAffCnt.IdtPlnAct);
--               X7UTIL.TRACE(rLstAffCnt.IdtClt);
--               X7UTIL.TRACE(rLstAffCnt.IdtCnt);
--        END;
--      END LOOP;

      r_SAV.IdtPntLvr := 0;
      FOR rLstAffRcs IN cLstAffRcs
      LOOP
         BEGIN
         if r_SAV.IdtPntLvr <> rLstAffRcs.IdtPntLvr
         or r_SAV.IdtPntCpg <> rLstAffRcs.IdtPntCpg
         or r_SAV.IdtCpr    <> rLstAffRcs.IdtCpr
         or r_SAV.IdtPlnAct <> rLstAffRcs.IdtPlnAct
         or r_SAV.IdtClt    <> rLstAffRcs.IdtClt
         or r_SAV.IdtCnt    <> rLstAffRcs.IdtCnt
         THEN
            -- BPZ 9617
            SAVEPOINT spIniAffObs2;
            Ini1AffObs(rLstAffRcs.IdtPntLvr,
                       rLstAffRcs.IdtPntCpg,
                       rLstAffRcs.IdtCpr,
                       rLstAffRcs.IdtPlnAct,
                       rLstAffRcs.IdtAgt,
                       rLstAffRcs.IdtClt,
                       null);
         END IF;
         r_SAV.IdtPntLvr  := rLstAffRcs.IdtPntLvr;
         r_SAV.IdtPntCpg  := rLstAffRcs.IdtPntCpg;
         r_SAV.IdtCpr     := rLstAffRcs.IdtCpr   ;
         r_SAV.IdtPlnAct  := rLstAffRcs.IdtPlnAct;
         r_SAV.IdtClt     := rLstAffRcs.IdtClt   ;
         r_SAV.IdtCnt     := rLstAffRcs.IdtCnt   ;

         DELETE LSTAFFRCS WHERE CURRENT OF cLstAffRcs;
         EXCEPTION
            WHEN OTHERS THEN
               X7UTIL.TRACE('LSTAFFRCS');
               X7UTIL.TRACE('others ' || to_char(sqlcode) ||' '|| to_char(SQLERRM  ) );
               X7UTIL.TRACE(rLstAffRcs.IdtPntLvr);
               X7UTIL.TRACE(rLstAffRcs.IdtPntCpg);
               X7UTIL.TRACE(rLstAffRcs.IdtCpr);
               X7UTIL.TRACE(rLstAffRcs.IdtPlnAct);
               X7UTIL.TRACE(rLstAffRcs.IdtClt);
               X7UTIL.TRACE(rLstAffRcs.IdtCnt);
              MSGERR := 'IniAffObs'
              || CHR(13)|| CHR(10)
              || versionpkg()
              || CHR(13)|| CHR(10)
              || to_char(sqlcode) ||' '|| to_char(SQLERRM)
              || CHR(13)|| CHR(10)
              || DBMS_UTILITY.FORMAT_ERROR_BACKTRACE;
              X7UTIL.TRACEERR(FICERR,MSGERR);
              --rollback;
              ROLLBACK TO spIniAffObs2;
        END;
      END LOOP;

END IniAffObs;
-----------------------------------------------------------------------------
-----------------------------------------------------------------------------
-----------------------------------------------------------------------------
FUNCTION X7_idtctr_idtclt(pIdtClt CLT.IdtClt%TYPE)
RETURN VARCHAR2
IS
vDft    PRMGNR.Dft%TYPE;
vIdtCtr CTR.IdtCtr%TYPE;
CURSOR cctrdst
    IS SELECT IdtCtr
        FROM CTR
       WHERE IdtCltDst = pIdtClt
    ORDER BY datrsl DESC;
CURSOR cctrssc
    IS SELECT IdtCtr
        FROM CTR
       WHERE IdtCltSsc = pIdtClt
        ORDER BY datrsl DESC;
BEGIN
 SELECT dft INTO vdft FROM PRMGNR;

 IF vDft = 0
 THEN OPEN cCtrSsc;
      FETCH cCtrSsc INTO vIdtCtr;
      CLOSE cCtrSsc;
 ELSE OPEN cCtrDst;
      FETCH cCtrDst INTO vIdtCtr;
      CLOSE cCtrDst;
 END IF;

 RETURN vIdtCtr;

EXCEPTION
 WHEN NO_DATA_FOUND THEN RETURN NULL;
END X7_idtctr_idtclt;

-----------------------------------------------------------------------
-- JCD le 09/06/2009*
-- #7345

-----------------------------------------------------------------------------
-----------------------------------------------------------------------------
-----------------------------------------------------------------------------
-- PROCEDURE Ini1AffCnt (pIdtPntLvr NUMBER,
--                       pIdtPntCpg NUMBER,
--                       pIdtCpr    NUMBER,
--                       pIdtPlnAct VARCHAR2,
--                       pIdtAgt    VARCHAR2)
-- IS
-- --        ---------- Initialisation d'une affaire sur contact
-- --
--    vSqcCnt NUMBER;
--    vSqcAff NUMBER;
--    vIdtClt CLT.IdtClt%TYPE;
--    vIdtCtr CTR.IdtCtr%TYPE;
--    vIdtCntOpr CLT.IdtCntOpr%TYPE;
--    vIdtCodSns CLT.IdtCodSns%TYPE;
--    nIdtCptClt CPTCLT.IDTCPTCLT%TYPE;
--    vRst BOOLEAN;
--    vIdtCtlAct NUMBER(22);
--    vIdtSrv NUMBER(22);
--    vNbrCnd NUMBER(22);
--    vClbMinDsj NUMBER(22);
--    vClbMaxDsj NUMBER(22);
--    vDmtPntCpg NUMBER(22);
--    vIdtUntMsrDmtPntCpg NUMBER(22);
--    vRglDsjAvn NUMBER(22);
--    vIdtTypPln NUMBER(22);
--    CURSOR cCtlAct IS
--     SELECT ACTCRS.IdtActCrs,
--            ACTCRS.IdtCtlAct,
--            ACTCRS.IdtCpr
--     FROM CTLACT, ACTCRS
--     WHERE CTLACT.IDTTYPACT = 1
--       AND CTLACT.idtctlact = ACTCRS.idtctlact
--       AND ACTCRS.IdtAff = vSqcAff
--       --AND  ACTCRS.IdtEtp = 1;
--     ORDER BY ACTCRS.NumOrd;
-- BEGIN
--    SAVEPOINT spAff;
--    -- Récupération du numéro de client destinataire attaché à ce PntCpg
--    SELECT IdtCtr,
--           IdtCltDst
--    INTO   vIdtCtr,
--           vIdtClt
--    FROM CTR
--    WHERE IdtPntLvr = pIdtPntLvr
--      AND  IdtPntCpg = pIdtPntCpg
--      AND  CTR.datrsl IS NULL;
--
--    -- Récupération de la séquence contact client et autres données
--    SELECT NVL(SqcCnt, 0)+1, IdtCntOpr, IdtCodSns
--    INTO   vSqcCnt,
--           vIdtCntOpr,
--           vIdtCodSns
--    FROM   CLT
--    WHERE  IdtClt = vIdtClt
--    FOR UPDATE OF SqcCnt;
--
--    -- JCE recherche du compte client
--    SELECT IdtCptCLt
--    INTO   nIdtCptClt
--    FROM   CPTCLT
--    WHERE IdtClt = vIdtClt;
--    UPDATE CLT
--    SET    SqcCnt = vSqcCnt
--    WHERE  IdtClt = vIdtClt;
--
--    -- Insertion d'un contact commercial, motif Observation sur lecture
--    INSERT INTO CNT
--        (IdtClt,
--         IdtCnt,
--         IdtTypCnt,
--         IdtMtfCnt,
--         IdtAgt,
--         IdtCntOpr,
--         IdtCodSns,
--         INT,
--         DatCnt
--         ,IdtOrgCnt)
--       VALUES
--        (vIdtClt,
--         vSqcCnt,
--         cIdtTypCnt_Com,
--         cIdtMtfCnt_Obs,
--         pidtagt,
--         vIdtCntOpr,
--         vIdtCodSns,
--         1,
--         TRUNC(SYSDATE)
--         ,(select idttypostd from typostd where codtypostd = 'ORGCNT' and typostd = 'CNTINT')
--         );
--    -- Insertion d'une affaire
--    SELECT seq_aff.NEXTVAL INTO vSqcAff FROM dual;
--
--    INSERT INTO AFF
--        (IdtClt,
--         IdtAff,
--         IdtCnt,
--         IdtCntOpr,
--         IdtCodSns,
--         IdtPlnAct,
--         DatCrt,
--         IdtEtp,
--         EtpExe)
--       VALUES
--        (vIdtClt,
--         vSqcAff,
--         vSqcCnt,
--         vIdtCntOpr,
--         vIdtCodSns,
--         pIdtPlnAct,
--         TRUNC(SYSDATE),
--         1,
--         1);
--    -- Insertion des actions en cours de l'étape 1
--    vRst := CreActCrs (vIdtClt,
--                       pIdtPlnAct,
--                       vSqcAff,
--                       pIdtPntLvr,
--                       pIdtPntCpg);
--    IF vRst = FALSE THEN
--       ROLLBACK TO spAff;
--    END IF;
--    -- Récupérer les informations complémentaires
--    SELECT PNTCPG.IdtSrv,
--           PNTCPG.NbrCnd,
--           PNTCPG.ClbMinDsj,
--           PNTCPG.ClbMaxDsj,
--           PNTCPG.Dmt,
--           PNTCPG.IdtUntMsrDmt
--     INTO  vIdtSrv,
--           vNbrCnd,
--           vClbMinDsj,
--           vClbMaxDsj,
--           vDmtPntCpg,
--           vIdtUntMsrDmtPntCpg
--     FROM PNTCPG
--     WHERE PNTCPG.IdtPntLvr = pIdtPntLvr
--       AND PNTCPG.IdtPntCpg = pIdtPntCpg;
--
--     -- informations de réglage disjoncteur contenue dans le dernier avenant au contrat
--     SELECT PSSSSC.RglDsj
--     INTO   vRglDsjAvn
--     FROM PSSSSC, AVTCTR
--     WHERE PSSSSC.IdtPssSsc(+) = AVTCTR.IdtPssSsc
--       AND AVTCTR.DatFin IS NULL
--       AND AVTCTR.IdtCtr = vIdtCtr;
--       -- On boucle sur toutes les action en cours de l'étape 1
--       -- une action par compteur (si niveau compteur)
--     FOR rActCrs IN cCtlAct LOOP
--        -- Créer l'intervention
--        INSERT INTO INTPKB
--        (
--        INTPKB.IdtInt,
--        INTPKB.IdtCtlAct,
--        INTPKB.Sta,
--        INTPKB.IdtClt,
--        INTPKB.IdtPntLvr,
--        INTPKB.IdtPntCpg,
--        INTPKB.IdtSrv,
--        INTPKB.NbrCnd,
--        INTPKB.ClbMinDsj,
--        INTPKB.ClbMaxDsj,
--        INTPKB.DmtPntCpg,
--        INTPKB.IdtUntMsrDmtPntCpg,
--        INTPKB.IdtCtr,
--        INTPKB.IdtCprAvn,
--        INTPKB.RglDsjAvn,
--        INTPKB.DatExePrv,
--        INTPKB.DatDem
--        )
--        VALUES
--        (
--        SEQ_INT.NEXTVAL,
--        rActCrs.IdtCtlAct,
--        '2',
--        vIdtClt,
--        pIdtPntLvr,
--        pIdtPntCpg,
--        vIdtSrv,
--        vNbrCnd,
--        vClbMinDsj,
--        vClbMaxDsj,
--        vDmtPntCpg,
--        vIdtUntMsrDmtPntCpg,
--        vIdtCtr,
--        rActCrs.IdtCpr,
--        vRglDsjAvn,
--        TRUNC(SYSDATE),
--          TRUNC(SYSDATE)
--        );
--        -- Renseigner le numéro d'intervention dans l'action en cours
--        UPDATE ACTCRS SET
--           IdtInt = SEQ_INT.CURRVAL
--        WHERE ACTCRS.IdtActCrs = rActCrs.IdtActCrs;
--
--     END LOOP;
-- END Ini1AffCnt;

-----------------------------------------------------------------------------
-----------------------------------------------------------------------------
-----------------------------------------------------------------------------
-- Calcule de la date de debut prévu et du délai prévu.

PROCEDURE IntActDelai (pIdtAff IN AFF.IDTAFF%TYPE
                      ,pIdtEtp IN ACTCRS.IDTETP%TYPE
                      ,pDatPre OUT ACTCRS.DATPRE%TYPE
                      ,pDatRee OUT ACTCRS.DATREE%TYPE
                      ,pDelai  OUT ACTCRS.DELAI%TYPE
                      )
IS


--  cursor c1 is
--    SELECT NVL((SYSDATE + (
--           ((select sum(e.delai) from etp e where e.idtplnact = aff.idtplnact and e.idtetp < etp.IDTETP)
--           / (select count(*) from act where idtplnact = aff.idtplnact and idtetp = etp.IDTETP) ) ))
--           ,SYSDATE ) DEBUT
-- --          ,(etp.delai / (select count(*) from act where idtplnact = aff.idtplnact and idtetp = etp.IDTETP) ) DELAI
--    FROM AFF
--        ,ETP
--    WHERE AFF.IDTAFF = pIdtAff
--      AND ETP.IDTETP = pIdtEtp
--      AND ETP.IDTPLNACT = AFF.IDTPLNACT;

--    greatest (
--    NVL((SYSDATE + (
--         ((select sum(e.delai) from etp e where idtplnact = aff.idtplnact and e.idtetp < etp.IDTETP)
--         / (select count(*) from act where idtplnact = aff.idtplnact and idtetp = etp.IDTETP) ) ))
--         ,SYSDATE )
--    , SYSDATE + nvl( ( select  SUM( nvl( (C1.DURMIN/60/24) ,0)  )  from act a1, ctlact c1
--                      where a1.idtplnact = aff.idtplnact
--                        and a1.IDTCTLACT = c1.IDTCTLACT
--                        and A1.IDTETP < etp.idtetp)
--                     ,0)
--    ) DEBUT

  cursor c1 is
    SELECT
    sysdate + nvl((select sum(greatest(e.delai,c.durmin/60/24))
    from act a,etp e,ctlact c
    where e.idtetp=a.idtetp
    and c.idtctlact= a.idtctlact
    and a.idtplnact = AFF.idtplnact
    and e.idtetp<ETP.idtetp
    and e.idtplnact=a.idtplnact ), 0) DEBUT
    FROM AFF
        ,ETP
    WHERE AFF.IDTAFF = pIdtAff
      AND ETP.IDTETP = pIdtEtp
      AND ETP.IDTPLNACT = AFF.IDTPLNACT;
  r1 c1%rowtype;

BEGIN

   open c1;
   fetch c1 into r1;
   close c1;

   pDATPRE := r1.DEBUT;
--   pDATREE := r1.DEBUT;
--   pDELAI  := r1.DELAI;

--   pDATPRE := NULL;
--   pDATREE := SYSDATE;
   pDATREE := NULL;
   pDELAI  := NULL;


END IntActDelai;

-----------------------------------------------------------------------------
-----------------------------------------------------------------------------
-----------------------------------------------------------------------------
-- Calcule de la date de debut prévu et du délai prévu.

PROCEDURE ActReport ( pIdtAff IN ACTCRS.IDTAFF%TYPE
                      ,pIdtEtp IN ACTCRS.IDTETP%TYPE
                      ,pIdtPlnAct IN ACTCRS.IDTPLNACT%TYPE
                      ,pIdtCtlAct IN ACTCRS.IDTCTLACT%TYPE
                      ,pIdtRpt  OUT ACTCRS.IDTRPT%TYPE
                      )
IS

  vIdtRptSml SML.IDTRPT%TYPE;

BEGIN

  BEGIN
  SELECT SML.IDTRPT
  INTO   vIdtRptSml
    FROM AFF,SML
    WHERE AFF.IDTAFF= pIdtAff
      AND SML.IDTSML= AFF.IDTSML;

  EXCEPTION
   WHEN NO_DATA_FOUND THEN vIdtRptSml := NULL;
  END;


  BEGIN
  SELECT NVL(ACT.IDTRPT,CTLACT.IDTRPT)
    INTO   pIdtRpt
    FROM ACT,CTLACT
    WHERE ACT.IdtPlnAct  = pIdtPlnAct
      AND ACT.IdtEtp  = pIdtEtp
      AND ACT.IdtCtlAct = pIdtCtlAct
      AND CTLACT.IdtCtlAct = pIdtCtlACt;

  EXCEPTION
   WHEN NO_DATA_FOUND THEN pIdtRpt := NULL;
  END;

  IF pIdtRpt IS NULL THEN
    pIdtRpt := vIdtRptSml;
  END IF;



END ActReport;
-----------------------------------------------------------------------------
-----------------------------------------------------------------------------
-----------------------------------------------------------------------------
procedure TrtActCrsXDoc(pIdtActCrs number, pNomFic IN varchar2, pMsgErr OUT varchar2) is
  type typTABNUMBER is table of number index by binary_integer;
  type typTABVARCHAR20 is table of varchar2(20) index by binary_integer;
  cursor cLSTACT is
    select ACTCRS.IdtActCrs,
           ACTCRS.IdtPlnAct,
           ACTCRS.IdtRpt,
           ACTCRS.IdtClt,
           ACTCRS.IdtCptClt,
           ACTCRS.IdtCtr,
           ACTCRS.IdtPntLvr,
           ACTCRS.IdtPntCpg,
           ACTCRS.IdtCpr,
           ACTCRS.IdtInt,
           ACTCRS.IdtCtlAct,
           CTLACT.IdtNivAct,
           decode(CTLACT.IdtTypAct,1,1,0) ActInt,   -- Gestion particuliere des interventions, on ne tient pas compte du niveau
           nvl(AFF.IdtSml,0) IdtSml
      from AFF,
           ACTCRS,
           CTLACT,
           INTPKB,
           LSTACTCRS
      where ACTCRS.IdtAff          = AFF.IdtAff
       and  CTLACT.IdtCtlAct       = ACTCRS.IdtCtlAct
       and  INTPKB.IdtInt(+)       = ACTCRS.IdtInt     -- S'il y a une intervention on recupere l'information de l'intervention
       and  LSTACTCRS.IdtActCrs(+) = ACTCRS.IdtActCrs
       and  LSTACTCRS.IdtActCrs   is null    -- On ne traite pas l'action si elle est en cours de traitement (si existe dans la table, elle est en cour de traitement)
       and  AFF.DatFin            is null
       and  ACTCRS.IdtRpt         is not null
       and  ACTCRS.IdtRet         in (4,5)
       and  decode(CTLACT.IdtTypAct,1,INTPKB.Sta,2) = 2       -- Si l'action est de type intervention on tient compte de l'etat. Si l'intervention n'est pas generee on ne prend pas l'action
       and  ACTCRS.IdtActCrs       = nvl(pIdtActCrs,ACTCRS.IdtActCrs)
       and  ACTCRS.IdtRpt in (select Idt from CTLRPT where TypFil = 'XDR');  -- On traite seulement les rapports de type XDocReport
  cursor cRPT is
    select distinct LSTACTCRS.IdtSml,
                    LSTACTCRS.IdtRpt,
                    LSTACTCRS.IdtNivAct,
                    LSTACTCRS.ActInt,
                    LSTACTCRS.IdtCtlAct,
                    CTLACT.Act,
                    nvl(CTLRPT.SplPth,'C:\TEMP') SplPth,
                    nvl(CTLRPT.TypSrt,'PDF') TypSrt,
                    MDLXDR.IdtMdlXdr,
                    EXPTAB.Nom,
                    EXPMDL.Whr
      from LSTACTCRS,
           CTLACT,
           CTLRPT,
           MDLXDR,
           EXPMDL,
           EXPTAB
      where CTLACT.IdtCtlAct = LSTACTCRS.IdtCtlAct
       and  CTLRPT.Idt       = LSTACTCRS.IdtRpt
       and  MDLXDR.CodMdlXdr = CTLRPT.PthFil
       and  EXPMDL.IdtExpMdl = MDLXDR.IdtExpMdl
       and  EXPTAB.IdtExpTab = EXPMDL.IdtExpTab
       and  LSTACTCRS.IdtStt = 0                -- Protection pour generer une seul fois le rapport au cas ou (doublons dans le path du rapport?)
      order by ActInt;                          -- On genere les interventions en dernier
  type typTABLSTACT is table of cLSTACT%ROWTYPE;
  type typTABRPT is table of cRPT%ROWTYPE;
  tIdtActCrs typTABNUMBER;
  tLstAct typTABLSTACT;
  tLstRpt typTABRPT;
  vIdtAgt AGT.IdtAgt%TYPE := X7UTIL.CurrentIdtAgt;
  vStrTmp varchar2(2000);
  vWhrClt varchar2(2000) := 'IdtClt in (select IdtClt from LSTACTCRS where IdtStt = 1 and IdtAgt = ''<IdtAgt>'')';
  vWhrCtr varchar2(2000) := 'IdtCtr in (select IdtCtr from LSTACTCRS where IdtStt = 1 and IdtAgt = ''<IdtAgt>'')';
  vWhrLvr varchar2(2000) := 'IdtPntLvr in (select IdtPntLvr from LSTACTCRS where IdtStt = 1 and IdtAgt = ''<IdtAgt>'')';
  vWhrCpg varchar2(2000) := '(IdtPntLvr, IdtPntCpg) in (select IdtPntLvr, IdtPntCpg from LSTACTCRS where IdtStt = 1 and IdtAgt = ''<IdtAgt>'')';
  vWhrCpr varchar2(2000) := 'IdtCpr in (select IdtCpr from LSTACTCRS where IdtStt = 1 and IdtAgt = ''<IdtAgt>'')';
  vWhrInt varchar2(2000) := 'IdtInt in (select IdtInt from LSTACTCRS where IdtStt = 1 and IdtAgt = ''<IdtAgt>'')';
  vWhrAct varchar2(2000) := 'IdtActCrs in (select IdtActCrs from LSTACTCRS where IdtStt = 1 and IdtAgt = ''<IdtAgt>'')';
  vWhr varchar2(2000);
  i number;
  vSwRapport number := 0;
  vMsgErr varchar2(2000);
  vNomFic varchar2(2000);
  vSqcRpt number;
  vMaxLoop number := 10;  -- Defini le nombre maximum de loops pour eviter un loop infinit
  vNbLoop number := 0;
  vIdtAff number;
  vIdtRet RET.IdtRet%TYPE;
BEGIN
  -- Suppression des donnees de la table si elle n'est pas nettoyee
  delete LSTACTCRS where IdtAgt = vIdtAgt;
  commit;
  pMsgErr := null;
  -- Dans le cas de traitement en temps reel, on met l'action a l'etat en cours si elle est "En attente"
  if pIdtActCrs is not null then
    BEGIN
      select IdtRet
        into vIdtRet
        from ACTCRS
        where IdtActCrs = pIdtActCrs;
    EXCEPTION
      when NO_DATA_FOUND then
        pMsgErr := TRTMSG01.ChercheMsg('ERR_TRTPUB0010');
        pMsgErr := replace(pMsgErr,':IdtActCrs',pIdtActCrs);
        return;
    END;
    if vIdtRet = 8 then
      update ACTCRS
        set IdtRet = 4,
            DatRee = sysdate
        where IdtActCrs = pIdtActCrs;
      commit;
    end if;
    -- Si l'action ne se trouve pas dans les etats En cours, En attente, En erreur, on genere un message d'erreur
    if nvl(vIdtRet,-1) not in (4,5,8) then
      pMsgErr := TRTMSG01.ChercheMsg('ERR_TRTPUB0009');
      return;
    end if;
  end if;
  --pNomFic := null;
  -- On fait un loop, on sors s'il n'a plus des actions a traiter
  loop
    -- On protege d'un loop infinit au cas ou!!!
    vNbLoop := vNbLoop + 1;
    if vNbLoop > vMaxLoop then
      RAISE_APPLICATION_ERROR(X7UTIL.Erreur_X7_Centura,'Loop infinie!!!!');
    end if;
    open cLSTACT;
      fetch cLSTACT
        bulk collect into tLstAct;
    close cLSTACT;
    if tLstAct.Count = 0 then
      EXIT;
    end if;
    -- Insertion de la liste des actions a traiter dans la table de traitement
    for i in 1..tLstAct.Count loop
      insert into LSTACTCRS (IDTACTCRS,
                             IDTAGT,
                             IDTSML,
                             IDTRPT,
                             IDTPLNACT,
                             IDTSTT,
                             IDTCTLACT,
                             IDTNIVACT,
                             IDTCLT,
                             IDTCPTCLT,
                             IDTCTR,
                             IDTPNTLVR,
                             IDTPNTCPG,
                             IDTCPR,
                             IDTINT,
                             ACTINT)
                     values (tLSTACT(i).IDTACTCRS,
                             vIdtAgt,
                             tLSTACT(i).IDTSML,
                             tLSTACT(i).IDTRPT,
                             tLSTACT(i).IDTPLNACT,
                             0,
                             tLSTACT(i).IDTCTLACT,
                             tLSTACT(i).IDTNIVACT,
                             tLSTACT(i).IDTCLT,
                             tLSTACT(i).IDTCPTCLT,
                             tLSTACT(i).IDTCTR,
                             tLSTACT(i).IDTPNTLVR,
                             tLSTACT(i).IDTPNTCPG,
                             tLSTACT(i).IDTCPR,
                             tLSTACT(i).IDTINT,
                             tLSTACT(i).ACTINT);

    end loop;
    commit;
    -- Generation des rapports par Id du catalogue de l'action
    open cRPT;
      fetch cRPT bulk collect into tLSTRPT;
    close cRPT;
    for j in 1..tLSTRPT.Count loop
      vNomFic := null;
      -- On gere une exception par rapport, pour continuer avec les autres.
      BEGIN
        vWhr := null;
        vMsgErr := null;
        -- Construction de la clause where pour marquer les enregistrements a traiter
        -- Suppression du mot where
        --vWhr := trim(REGEXP_Replace(vWhr, '^\W*where',null,1,1,'i'));
        -- Evaluation du niveau de l'action
        if tLSTRPT(j).ActInt = 1 then
          -- On signale qu'il faut faire le rapport
          vSwRapport := 1;
          -- Mise a jour de la table de liste des actions pour marquer qu'elles sont en cours de traitement
          update LSTACTCRS
            set IdtStt = 1
            where IdtCtlAct = tLSTRPT(j).IdtCtlAct
             and  IdtAgt = vIdtAgt
             and  IdtSml = tLSTRPT(j).IdtSml
             and  ActInt = 1;
          commit;
          -- Ajout de la condition pour les interventions
          vWhr := vWhrInt;
        elsif tLSTRPT(j).IdtNivAct in (cIdtNivAct_PntLvr,
                                       cIdtNivAct_PntCpg,
                                       cIdtNivAct_Cpr,
                                       cIdtNivAct_CptClt,
                                       cIdtNivAct_Ctr,
                                       cIdtNivAct_NA) then
          -- On signale qu'il faut faire le rapport
          vSwRapport := 1;
          -- Ajout de la condition
          if tLSTRPT(j).IdtNivAct = cIdtNivAct_PntLvr then
            vWhr := vWhrLvr;
          elsif tLSTRPT(j).IdtNivAct = cIdtNivAct_PntCpg then
            vWhr := vWhrCpg;
          elsif tLSTRPT(j).IdtNivAct = cIdtNivAct_Cpr then
            vWhr := vWhrCpr;
          elsif tLSTRPT(j).IdtNivAct = cIdtNivAct_CptClt then
            vWhr := vWhrClt;
          elsif tLSTRPT(j).IdtNivAct = cIdtNivAct_Ctr then
            vWhr := vWhrCtr;
          elsif tLSTRPT(j).IdtNivAct = cIdtNivAct_NA then
            vWhr := vWhrAct;
          end if;
          update LSTACTCRS
            set IdtStt = 1
            where IdtAgt = vIdtAgt
             and  IdtSml = tLSTRPT(j).IdtSml
             and  IdtCtlAct = tLSTRPT(j).IdtCtlAct;
          commit;
        else
          -- Niveau non gere, on ne fait pas le rapport
          vSwRapport := 0;
        end if;
        if vSwRapport = 1 then
          -- Remplacement des variables dans la requete
          vWhr := REGEXP_Replace(vWhr,'<IdtAgt>',vIdtAgt,1,0,'i');
          -- Composition du nom de fichier
          select seq_Rpt.NEXTVAL into vSqcRpt from dual;
          if pIdtActCrs is null then
            -- Traitement batch
            tLSTRPT(j).TypSrt := 'PDF';
            vNomFic := tLSTRPT(j).IdtRpt || '-' || tLSTRPT(j).Act || '-' || to_char(sysdate,'YYYY-MM-DD') || '-' || tLSTRPT(j).IdtSml || '-' || vSqcRpt || '.' || tLSTRPT(j).TypSrt;
            vNomFic := tLSTRPT(j).SplPth || '\' || vNomFic;
--'
          else
            -- Traitement pour une action
            select IdtAff
              into vIdtAff
              from ACTCRS
              where IdtActCrs = pIdtActCrs;
            vNomFic := pNomFic;
          end if;
          -- Lancement du traitement du rapport
          TRTEXP01.GenererRapportXDocTrt(tLSTRPT(j).IdtMdlXdr,
                                         vNomFic,
                                         tLSTRPT(j).TypSrt,
                                         vWhr,
                                         vMsgErr,
                                         null,
                                         null,
                                         null,
                                         null,
                                         null,
                                         null,
                                         null,
                                         null,
                                         null,
                                         null);
          -- On va continuer si pas de message d'erreur
          if vMsgErr is not null then
            --DBMS_OUTPUT.Put_Line(vMsgErr);
            if pMsgErr is not null then
              pMsgErr := substr(pMsgErr || chr(13) || chr(10),1,2000);
            end if;
            pMsgErr := substr(pMsgErr || vMsgErr,1,2000);
            rollback;
            -- On marque les actions en erreur
            update LSTACTCRS
              set IdtStt = 3
              where IdtAgt = vIdtAgt
               and  IdtStt = 1;
            commit;
          else
            -- Le rapport a ete genere, on fait avancer les actions
            select IdtActCrs
              bulk collect into tIdtActCrs
              from LSTACTCRS
              where IdtAgt = vIdtAgt
               and  IdtCtlAct = tLSTRPT(j).IdtCtlAct
               and  ActInt = 0    -- On ne fait pas avancer les actions de type intervention
               and  IdtStt = 1;
            for i in 1..tIdtActCrs.Count loop
              update ACTCRS
                set DatFin = sysdate,
                    IdtRet = 0,
                    IdtAgtTrt = vIdtAgt
                where IdtActCrs = tIdtActCrs(i);
              AFFBTC02.AvancementAutoAffaire(tIdtActCrs(i),vIdtAgt);
              commit;
            end loop;
            -- On marque les action traites comme traitees
            forall i in 1..tIdtActCrs.Count
              update LSTACTCRS
                set IdtStt = 2
                where IdtActCrs = tIdtActCrs(i);
            commit;
            -- Gestion de l'intervention
            update INT
              set Sta = 3,
                  DatEdtBi = sysdate
              where IdtInt in (select IdtInt from LSTACTCRS
                                 where IdtCtlAct = tLSTRPT(j).IdtCtlAct
                                  and  IdtAgt    = vIdtAgt
                                  and  ActInt    = 1
                                  and  IdtStt    = 1);
            -- On marque les actions comme traitees
            update LSTACTCRS
              set IdtStt = 2
              where IdtAgt = vIdtAgt
               and  ActInt = 1
               and  IdtStt = 1;
            commit;
          end if;
        end if;
      EXCEPTION
        when others then
        rollback;
        vMsgErr := SQLERRM;
        vMsgErr := vMsgErr || chr(13) || chr(10) || DBMS_UTILITY.Format_Error_BackTrace;
        DBMS_OUTPUT.Put_Line(vMsgErr);
        if pMsgErr is not null then
          pMsgErr := pMsgErr || chr(13) || chr(10);
        end if;
        pMsgErr := pMsgErr || vMsgErr;

        X7.GEST_ERREUR_CENTURA(VersionPkg(),
                              0,
                              'AFFBTC01',
                              'TrtActCrsXDoc',
                              to_char(SQLERRM),
                              sqlcode,
                              DBMS_UTILITY.FORMAT_ERROR_BACKTRACE);

        
      END;
      -- Les actions que n'ont pas pu etre traitees sont marquees en erreur
      update ACTCRS
        set IdtRet = 5
        where IdtActCrs in (select IdtActCrs
                              from LSTACTCRS
                              where IdtAgt = vIdtAgt
                               and  IdtCtlAct = tLSTRPT(j).IdtCtlAct
                               and  ActInt    = 0
                               and  IdtStt <> 2);
      commit;
    end loop; -- rRPT in cRPT
  end loop; -- Loop principal
  -- On a fini le traitement, on efface la table pour cet agent pour recomencer a nouveau si besoin (cas d'erreur)
  delete LSTACTCRS
    where IdtAgt = vIdtAgt;
  commit;
  --pNomFic := vNomFic;
END TrtActCrsXDoc;
-----------------------------------------------------------------------------
-----------------------------------------------------------------------------
-----------------------------------------------------------------------------
function IgnorerEtape(pIdtAff number,
                      pIdtPlnAct PLNACT.IdtPlnAct%TYPE,
                      pIdtEtp number)
  return number is
  cursor cActEtp is
    select IdtActCrs
      from ACTCRS
      where IdtAff = pIdtAff
       and  IdtEtp = pIdtEtp
      order by NumOrd;
  vFrm ETP.Frm%TYPE;
  vWhr ETP.Whr%TYPE;
  vSql varchar2(32767) := 'select count(1) from <From> where <Where> and AFF.IdtAff = :vIdtAff';
  vNbr number;
  vIdtActCrs number;
BEGIN
  -- Par defaut, on assume que l'etape remplie les conditions, donc, la requete retourne 1
  vNbr := 1;
--  DBMS_OUTPUT.Put_Line('Aff:' || pIdtPlnAct || '/' || pIdtEtp);
  select Frm, Whr
    into vFrm, vWhr
    from ETP
    where IdtPlnAct = pIdtPlnAct
     and  IdtEtp    = pIdtEtp;
  if vWhr is not null then
    -- Ajout de la clause from
    vSql := replace(vSql,'<From>', vFrm);
    -- Ajout de la clause where
    -- Elimination du mot where
    vWhr := trim(REGEXP_Replace(vWhr, '^\W*where',null,1,1,'i'));
    vSql := replace(vSql,'<Where>',vWhr);
    -- Execution de la requete
    --DBMS_OUTPUT.Put_Line('Req:' || vSql);
    EXECUTE IMMEDIATE vSql
      into vNbr
      using pIdtAff;
    -- Si l'etape ne rempli la condition, la valeur de vNbr est egale a 0
    -- Dans ce cas, on ignore toutes les actions de l'etape
    if vNbr = 0 then
      for rACTETP in cACTETP loop
        if vIdtActCrs is not null then
          -- Propagation des informations
          AFFBTC02.PropagationInfos(vIdtActCrs,rACTETP.IdtActCrs);
        end if;
        vIdtActCrs := rACTETP.IdtActCrs;
        -- On marque l'action comme etape ignoree
        update ACTCRS
          set IdtRet = 9,
              DatRee = sysdate,
              Datfin = sysdate,
              IdtAgtTrt = 'X7'
          where IdtActCrs = vIdtActCrs;
      end loop;
    end if;
  end if;
  return vIdtActCrs;
END IgnorerEtape;
-----------------------------------------------------------------------------
-----------------------------------------------------------------------------
-----------------------------------------------------------------------------
END Affbtc01;
/
show err
