CREATE OR REPLACE PACKAGE X7.Trtpen_Oet IS
-- Bug Oracle 951161 solved in 8.1.6
-------------------------------------
-- SBE/CAL : ajout de cIdtRbqPenIrr
-------------------------------------

  cTypFctPen CONSTANT TYPFCT.IdtTypFct%TYPE := '7';
  cTypFctTim CONSTANT TYPFCT.IdtTypFct%TYPE := '102';
  cTypRbrPen CONSTANT TYPRBR.IdtTypRbr%TYPE := 3;
  cTypRbrTim CONSTANT TYPRBR.IdtTypRbr%TYPE := 111;
  cIdtRbqPen CONSTANT RBQ.IdtRbq%TYPE       := 'PENALI';
  cIdtRbqPenIrr constant RBQ.IdtRbq%TYPE    := 'IRRPEN';
  cIdtRbqTim CONSTANT RBQ.IdtRbq%TYPE       := 'TIMBRE';
  cIdtRbqTvam CONSTANT RBQ.IdtRbq%TYPE      := 'TVAMUN';
  cIdtRbqTvaf CONSTANT RBQ.IdtRbq%TYPE      := 'TVAFIN';
  GVIDTTRT_CALCUL_PENALITES CONSTANT TYPTCHE.IdtTypTche%TYPE := 'TRT2011';
  gClcPenAct NUMBER;

------
-----------------------------------------------------------------------------
-----------------------------------------------------------------------------
FUNCTION CurrentIdtAgt RETURN AGT.IDTAGT%TYPE;
-----------------------------------------------------------------------------
FUNCTION GetDiscountPen (pDatDbtPrd CTRFAC.DatDbtPrd%TYPE, pDatFinPrd CTRFAC.DatFinPrd%TYPE, pId OET_PENDIS.ID%TYPE)
  RETURN OET_PENDIS.DISCOUNT%TYPE;
-----------------------------------------------------------------------------
FUNCTION GetPlafondPen (pDatDbtPrd CTRFAC.DatDbtPrd%TYPE, pDatFinPrd CTRFAC.DatFinPrd%TYPE, pId OET_PENDIS.ID%TYPE)
RETURN NUMBER ;
-----------------------------------------------------------------------------
-----------------------------------------------------------------------------
FUNCTION OprDansLotRtgAct(pIdtOpr OPR.IdtOpr%TYPE, pIdtTypRtg TYPRTG.IdtTypRtg%TYPE)
  RETURN NUMBER;
-----------------------------------------------------------------------------
-----------------------------------------------------------------------------
-----------------------------------------------------------------------------
FUNCTION PrxTim
  RETURN NUMBER;
-----------------------------------------------------------------------------
-----------------------------------------------------------------------------
-----------------------------------------------------------------------------
FUNCTION MntTimFacMgr (pIdtFac FAC.IdtFac%TYPE)
  RETURN NUMBER;
-----------------------------------------------------------------------------
-----------------------------------------------------------------------------
-----------------------------------------------------------------------------
FUNCTION MntTimFacxOpr (pIdtOpr OPR.IdtOpr%TYPE)
  RETURN NUMBER;
-----------------------------------------------------------------------------
-----------------------------------------------------------------------------
-----------------------------------------------------------------------------
FUNCTION MntTimFacxFac (pIdtFac FAC.IdtFac%TYPE)
  RETURN NUMBER;
-----------------------------------------------------------------------------
-----------------------------------------------------------------------------
-----------------------------------------------------------------------------
FUNCTION AplTimxClt(pIdtClt CLT.IdtClt%TYPE)
  RETURN NUMBER;
-----------------------------------------------------------------------------
-----------------------------------------------------------------------------
-----------------------------------------------------------------------------
FUNCTION AplTimxOpr (pIdtOpr OPR.IdtOpr%TYPE)
  RETURN NUMBER;
-----------------------------------------------------------------------------
-----------------------------------------------------------------------------
-----------------------------------------------------------------------------
FUNCTION AplTvaxFac (pIdtOpr OPR.IdtOpr%TYPE, pIdtTax TAX.IDTTAX%TYPE)
  RETURN NUMBER;
-----------------------------------------------------------------------------
-----------------------------------------------------------------------------
-----------------------------------------------------------------------------
FUNCTION AplTvaPenxFac (pIdtOpr OPR.IdtOpr%TYPE, pIdtTax TAX.IDTTAX%TYPE)
  RETURN NUMBER;
-----------------------------------------------------------------------------
-----------------------------------------------------------------------------
-----------------------------------------------------------------------------
FUNCTION AplTvaxEch (pIdtOpr OPR.IdtOpr%TYPE, pIdtTax TAX.IDTTAX%TYPE)
  RETURN NUMBER;
-----------------------------------------------------------------------------
-----------------------------------------------------------------------------
-----------------------------------------------------------------------------
FUNCTION MntTvaxEch (pIdtOpr OPR.IdtOpr%TYPE, pIdtTax TAX.IDTTAX%TYPE)
  RETURN NUMBER;
-----------------------------------------------------------------------------
-----------------------------------------------------------------------------
-----------------------------------------------------------------------------
FUNCTION AplTvaxOpr (pIdtOpr OPR.IdtOpr%TYPE)
  RETURN NUMBER;
-----------------------------------------------------------------------------
-----------------------------------------------------------------------------
-----------------------------------------------------------------------------
PROCEDURE CreFacTimxOpr (pIdtOpr OPR.IdtOpr%TYPE,
                         pIdtFacOrg FAC.IdtFac%TYPE,
                         pIdtLotRtg OPR.IdtLotRtg%TYPE,
                         pIdtLotFac FAC.IdtLotFac%TYPE,
                         pIdtFacTim OUT FAC.IdtFac%TYPE);
-----------------------------------------------------------------------------
-----------------------------------------------------------------------------
-----------------------------------------------------------------------------
PROCEDURE InsMvmExcFct (rMVMEXCFCT MVMEXCFCT%ROWTYPE);
-----------------------------------------------------------------------------
-----------------------------------------------------------------------------
-----------------------------------------------------------------------------
FUNCTION SldPenFacxFac (pIdtFac FAC.IdtFac%TYPE)
  RETURN NUMBER;
-----------------------------------------------------------------------------
-----------------------------------------------------------------------------
-----------------------------------------------------------------------------
FUNCTION MntPenFacxFac (pIdtFac FAC.IdtFac%TYPE)
  RETURN NUMBER ;
-----------------------------------------------------------------------------
-----------------------------------------------------------------------------
-----------------------------------------------------------------------------
FUNCTION MntPenTvaFacxFac (pIdtFac FAC.IdtFac%TYPE)
  RETURN NUMBER ;
-----------------------------------------------------------------------------
-----------------------------------------------------------------------------
-----------------------------------------------------------------------------
FUNCTION MntPenTvaTodayFacxFac (pIdtFac FAC.IdtFac%TYPE)
  RETURN NUMBER ;
-----------------------------------------------------------------------------
-----------------------------------------------------------------------------
-----------------------------------------------------------------------------
FUNCTION MntPenHTFacxFac (pIdtFac FAC.IdtFac%TYPE)
  RETURN NUMBER;
-----------------------------------------------------------------------------
-----------------------------------------------------------------------------
-----------------------------------------------------------------------------
FUNCTION SldPenNonFacxFac(pIdtFac FAC.IdtFac%TYPE)
  RETURN NUMBER;
-----------------------------------------------------------------------------
-----------------------------------------------------------------------------
-----------------------------------------------------------------------------
FUNCTION SldPenTvaNonFacxFac(pIdtFac FAC.IdtFac%TYPE)
  RETURN NUMBER;
-----------------------------------------------------------------------------
-----------------------------------------------------------------------------
-----------------------------------------------------------------------------
FUNCTION SldPenTvaTodayNonFacxFac(pIdtFac FAC.IdtFac%TYPE)
  RETURN NUMBER;
-----------------------------------------------------------------------------
-----------------------------------------------------------------------------
-----------------------------------------------------------------------------
FUNCTION SldPenHTNonFacxFac(pIdtFac FAC.IdtFac%TYPE)
  RETURN NUMBER;
-----------------------------------------------------------------------------
-----------------------------------------------------------------------------
-----------------------------------------------------------------------------
FUNCTION MntPenFacMgr (pIdtFac FAC.IdtFac%TYPE)
  RETURN NUMBER;
-----------------------------------------------------------------------------
-----------------------------------------------------------------------------
-----------------------------------------------------------------------------
FUNCTION MntPenTvaFacMgr (pIdtFac FAC.IdtFac%TYPE)
  RETURN NUMBER;
-----------------------------------------------------------------------------
-----------------------------------------------------------------------------
-----------------------------------------------------------------------------
FUNCTION MntPenTvaTodayFacMgr (pIdtFac FAC.IdtFac%TYPE)
  RETURN NUMBER;
-----------------------------------------------------------------------------
-----------------------------------------------------------------------------
-----------------------------------------------------------------------------
FUNCTION MntPenHTFacMgr (pIdtFac FAC.IdtFac%TYPE)
  RETURN NUMBER;
-----------------------------------------------------------------------------
-----------------------------------------------------------------------------
-----------------------------------------------------------------------------
FUNCTION MntPenTot (pIdtFac FAC.IdtFac%TYPE)
  RETURN NUMBER;
-----------------------------------------------------------------------------
-----------------------------------------------------------------------------
-----------------------------------------------------------------------------
FUNCTION MntPenHT (pIdtFac FAC.IdtFac%TYPE)
  RETURN NUMBER;
-----------------------------------------------------------------------------
-----------------------------------------------------------------------------
-----------------------------------------------------------------------------
FUNCTION MntPenTva (pIdtFac FAC.IdtFac%TYPE)
  RETURN NUMBER;
-----------------------------------------------------------------------------
-----------------------------------------------------------------------------
-----------------------------------------------------------------------------
FUNCTION MntPenTvaToday (pIdtFac FAC.IdtFac%TYPE)
  RETURN NUMBER;
-----------------------------------------------------------------------------
-----------------------------------------------------------------------------
-----------------------------------------------------------------------------
FUNCTION SldPenTot (pIdtFac FAC.IdtFac%TYPE)
  RETURN NUMBER;
-----------------------------------------------------------------------------
-----------------------------------------------------------------------------
-----------------------------------------------------------------------------
FUNCTION AplPenxClt
   (pIdtClt IN       CLT.IdtClt%TYPE)
    RETURN NUMBER;
-----------------------------------------------------------------------------
-----------------------------------------------------------------------------
-----------------------------------------------------------------------------
FUNCTION AplPenxFac(pIdtFac FAC.IdtFac%TYPE, pDatClc DATE)
  RETURN NUMBER;
-----------------------------------------------------------------------------
-----------------------------------------------------------------------------
-----------------------------------------------------------------------------
PROCEDURE ChgPrm;
-----------------------------------------------------------------------------
-----------------------------------------------------------------------------
-----------------------------------------------------------------------------
PROCEDURE PrxPen(pIdtRbq    IN     RBQ.IdtRbq%TYPE,
                 pDatDbt    IN     DATE,
                 pDatFin    IN OUT DATE,
                 pModAppPrx IN     VARCHAR2,
                 pPrxUnt       OUT PRX.PrxUnt%TYPE);
-----------------------------------------------------------------------------
-----------------------------------------------------------------------------
-----------------------------------------------------------------------------
PROCEDURE NxtPrdClcPen(pIdtFac IN     FAC.IdtFac%TYPE,
                       pDatClc IN     DATE,
                       pDatDbt IN     DATE,
                       pDatFin IN OUT DATE,
                       pSldFac IN OUT OPR.Sld%TYPE,
                       pQteFct IN OUT LGNFAC.QteFct%TYPE);
-----------------------------------------------------------------------------
-----------------------------------------------------------------------------
-----------------------------------------------------------------------------
PROCEDURE ClcPenxFac(pIdtFac FAC.IdtFac%TYPE, pDatClc DATE, pIdtAgt AGT.IdtAgt%TYPE, pCr OUT NUMBER);
-----------------------------------------------------------------------------
-----------------------------------------------------------------------------
-----------------------------------------------------------------------------
PROCEDURE ClcPen1Fac (pIdtFac FAC.IdtFac%TYPE, pIdtAgt AGT.IdtAgt%TYPE);
-----------------------------------------------------------------------------
-----------------------------------------------------------------------------
-----------------------------------------------------------------------------
PROCEDURE CLCPEN(pIdtAgt AGT.IdtAgt%TYPE);
-----------------------------------------------------------------------------
-----------------------------------------------------------------------------
-----------------------------------------------------------------------------
PROCEDURE CreFacMvmExc
   (pIdtClt    IN       CLT.IdtClt%TYPE,
    pIdtLotFac IN       LOTFAC.IdtLotFac%TYPE,
    pIdtLotRtg IN       OPR.IdtLotRtg%TYPE,
    pIdtTypRbr IN       TYPRBR.IdtTypRbr%TYPE,
    pIdtTypFct IN       TYPFCT.IdtTypFct%TYPE,
    pIdtAgt    IN       AGT.IdtAgt%TYPE,
    pIdtFacOrg IN       FAC.IdtFac%TYPE,
    pIdtFac    OUT      FAC.IdtFac%TYPE);
-----------------------------------------------------------------------------
-- Ma procédure suivante crée un enregistrement dans CTRFAC pour une facture
-- de pénalité ou de timbre, sous réserve que la facture d'origine soit
-- aussi dans CTRFAC.
-----------------------------------------------------------------------------
PROCEDURE CreCtrFac(pIdtFacOrg FAC.IdtFac%TYPE, pIdtFacPoT FAC.IdtFac%TYPE);
-----------------------------------------------------------------------------
-- Cette fonction retourne la facture de service à l'origine d'une facture
-- de timbre ou de pénalités.
-----------------------------------------------------------------------------
FUNCTION GetFacOrgxFac(pIdtFac FAC.IdtFac%TYPE, pIdtOpr OPR.IdtOpr%TYPE)
RETURN FAC.IdtFac%TYPE;
-----------------------------------------------------------------------------
-- Le groupe de fonctions ci-dessous permet de simplifier le codage de la vue
-- X7_DIST_OET. Ces fonctions retournent les montants nécessaires à
-- l'impression de la facture dans les deux cas possibles :
-- 1/ toutes les factures du bordereau existent (TRT2005/EdtEpr01)
-- 2/ les factures du bordereau n'existent pas encore (Carnet de collecte)
--
-- Ces fonctions ne sont applicables qu'aux factures 'principales', elles
-- donneront des résultats incohérents pour des factures de timbres ou de pénalités.
-----------------------------------------------------------------------------
FUNCTION MntSvcHtxFac (pIdtFac FAC.IdtFac%TYPE)
RETURN NUMBER;
FUNCTION MntSvcTvaTodayxFac (pIdtFac FAC.IdtFac%TYPE)
RETURN NUMBER;
--BPZ
FUNCTION MntSvcTvaxFac (pIdtFac FAC.IdtFac%TYPE)
RETURN NUMBER;

--------------------------------------------------------------------
-- Procédure assurant l'effacement des pénalités d'une facture...
-- Elle demande en paramètre, le N° de la facture d'origine et la
-- date de fin des pénalités à conserver.
-- Cette fonction controle que la facture n'est pas déjà imprimée.
-- C.A. LEBRUN 09/2005
--------------------------------------------------------------------
PROCEDURE AnnuPenalites(pNumFct FAC.NUMFCT%TYPE, pDatFin MVMEXCFCT.DATFIN%TYPE, pErrorMsg OUT VARCHAR2);

--SJ 04 nov 2009 ajouter le montant d'arrondi
-----------------------------------------------------------------------------
FUNCTION MntArr (pIdtFac FAC.IdtFac%TYPE)
  RETURN NUMBER;
-----------------------------------------------------------------------------
--SJ 06 nov 2009 ajouter la fonction pendingpenality - impossible d'utiliser clcpen1fac car on fait des DML qui ne sont pas supportés dans req sql pour afficher le solde en compta client
-----------------------------------------------------------------------------
FUNCTION PendingPenality(pIdtFac FAC.IdtFac%TYPE, pDatClc DATE, pIdtAgt AGT.IdtAgt%TYPE, pAvecOuSansTVA NUMBER)
--pAvecOuSansTVA = 1 signifie mntht + mntTVA
--pAvecOuSansTVA = 0 signifie mntht
--pAvecOuSansTVA = 2 mntTVA
RETURN NUMBER ;

-- CAL : procédure retournant une ligne complète pour pénalités.
PROCEDURE GetPendingPenality(
	pIdtFac FAC.IdtFac%TYPE,
	pDatClc DATE,
	pIdtAgt AGT.IdtAgt%TYPE,
	pMvmExcFct IN OUT MVMEXCFCT%ROWTYPE);


FUNCTION CalculArrondi1000(pMnt OPR.MNT%TYPE)
RETURN OPR.MNT%TYPE;
-----------------------------------------------------------------------------
-----------------------------------------------------------------------------
-----------------------------------------------------------------------------
-- Creation FBE : 21/07/2010
-- Cette procedure realise les taches specifiques lors de la creation d'un
-- echeancier (IdtTypOpr = 6), comme l'annulation des factures de timbre et arrondi
-- creees pour la facture incluse dans l'echeancier
----------------------------------------------------------------------------
PROCEDURE CreEch(pIdtOprEch OPR.IdtOpr%TYPE);
--SJ 06/06/2018 - F15990
FUNCTION VersionPkg
  RETURN NUMBER;
END Trtpen_Oet;
/