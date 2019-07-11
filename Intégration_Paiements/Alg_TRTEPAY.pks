create or replace Package Alg_TRTEPAY is
Procedure import (  idTraitement in number, 
                      nbLignesIntegrees out number,
                      pErr out Varchar2);
procedure  Controles(  idTraitement in number, 
                      nbLignesIntegrees out number,
                      pErr out Varchar2);
-- Procedure Traitement(pIdtCss CNGENT.IdtCss%TYPE, pIdtCng CNGENT.IdtCng%TYPE);
end;
/