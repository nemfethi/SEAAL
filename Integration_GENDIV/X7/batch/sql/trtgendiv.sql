REM -------------------------------------------------------
REM Triatement fichier GEN/DIV
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
Spool TrtGenDiv.log Append

REM Lancement de la commande
EXEC IMPCLT.ALG_GENDIV.TRAITEMENT;

SPOOL OFF
EXIT
/
