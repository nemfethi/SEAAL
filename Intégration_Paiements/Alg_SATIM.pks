create or replace Package Alg_SATIM is
Procedure import (  idTraitement in number, 
                    nbLignesIntegrees out number,
                    pErr out Varchar2);
PROCEDURE MajCngLgnNbrAno
 (pIdtCss CNGENT.IdtCss%TYPE,
  pIdtCng CNGENT.IdtCng%TYPE);
PROCEDURE MajCngValid
 (pIdtCss CNGENT.IdtCss%TYPE,
  pIdtCng CNGENT.IdtCng%TYPE);
PROCEDURE MajCngNonValid
 (pIdtCss CNGENT.IdtCss%TYPE,
  pIdtCng CNGENT.IdtCng%TYPE);
PROCEDURE Integration
 (pIdtCss CNGENT.IdtCss%TYPE,
  pIdtCng CNGENT.IdtCng%TYPE);
Procedure integration ( idTraitement in number, 
                        nbLignesIntegrees out number,
                        pErr out Varchar2);
PROCEDURE TRTCNG
   (pMode    NUMBER,
    pIdtCss  CNGENT.IdtCss%TYPE,
    pIdtCng  CNGENT.IdtCng%TYPE);
procedure  Controles(  idTraitement in number, 
                      nbLignesIntegrees out number,
                      pErr out number);

-- Procedure Traitement(pIdtCss CNGENT.IdtCss%TYPE, pIdtCng CNGENT.IdtCng%TYPE);
end Alg_SATIM;
/