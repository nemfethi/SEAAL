create or replace Package Alg_TRTEPAY is
Procedure import (  idTraitement in number, 
                      nbLignesIntegrees out number,
                      pErr out Varchar2);
PROCEDURE MajCngLgnNbrAno
 (pIdtCss CNGENT.IdtCss%TYPE,
  pIdtCng CNGENT.IdtCng%TYPE);
PROCEDURE Integration
 (pIdtCss CNGENT.IdtCss%TYPE,
  pIdtCng CNGENT.IdtCng%TYPE);
PROCEDURE TRTCNG
   (pMode    NUMBER,
    pIdtCss  CNGENT.IdtCss%TYPE,
    pIdtCng  CNGENT.IdtCng%TYPE);
procedure  Controles(  idTraitement in number, 
                      nbLignesIntegrees out number,
                      pErr out number);
-- Procedure Traitement(pIdtCss CNGENT.IdtCss%TYPE, pIdtCng CNGENT.IdtCng%TYPE);
end;
/