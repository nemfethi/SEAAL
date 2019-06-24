CREATE OR REPLACE PACKAGE X7.CssCng01 IS
--      --------
/***************************************************************************\
* CssCng01 Contrôle et Intégration de consignation                          *
*          Création: 25/05/98 par C. Bonhomme                               *
*          Modification:                                                    *
\***************************************************************************/

Function versionpkg
  return number;
--------------------------------------------------------
PROCEDURE TRTLOTCNG
   (pMode   NUMBER);
PROCEDURE TRT1CNG
   (pIdtAgt AGT.IdtAgt%TYPE);
--------------------------------------------------------
FUNCTION CngEnt_NbrAno
(pIdtCss       CNGLGNCSS.IdtCss%TYPE,
 pIdtCng       CNGLGNCSS.IdtCng%TYPE)
RETURN NUMBER;
--------------------------------------------------------
FUNCTION cnglgncss_NbrAno
(pIdtCss       CNGLGNCSS.IdtCss%TYPE,
 pIdtCng       CNGLGNCSS.IdtCng%TYPE,
 pIdtLgnCssCng CNGLGNCSS.IdtLgnCssCng%TYPE)
RETURN NUMBER;
--------------------------------------------------------
PROCEDURE MajCngLgnNbrAno
 (pIdtCss CNGENT.IdtCss%TYPE,
  pIdtCng CNGENT.IdtCng%TYPE);
--------------------------------------------------------
FUNCTION fNumFct
 (pNumFct FAC.NUMFCT%TYPE)
RETURN VARCHAR2;
--------------------------------------------------------
PROCEDURE TRTCNG
   (pMode    NUMBER,
    pIdtCss  CNGENT.IdtCss%TYPE,
    pIdtCng  CNGENT.IdtCng%TYPE);
END CssCng01;

/
