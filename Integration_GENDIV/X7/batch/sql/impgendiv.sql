REM -------------------------------------------------------
REM IMPORT FICHEIR GEN/DIV
REM -------------------------------------------------------
REM HISTORIQUE :
REM -------------------------------------------------------
REM Creation : 
REM -------------------------------------------------------
REM

REM Retourner -1 en cas d''erreur SQL
whenever sqlerror exit -1;

set serveroutput on

REM Le fichier SPOOL est :
Spool ImpGenDiv.log Append

REM Lancement de la commande
EXEC IMPCLT.ALG_GENDIV.IMPORT;

SPOOL OFF
EXIT
/
