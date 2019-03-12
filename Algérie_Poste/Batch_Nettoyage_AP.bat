@ECHO OFF
TITLE BATCH NETTOYAGE ALGERIE POSTE LOGICIEL X7 

REM ------------------------------------------------------------------------
REM - DEBUT SECTION PARAMETRAGE
REM ------------------------------------------------------------------------
call X7Cnfg.bat
SET LOG_FILE=BATCH_NETTOYAGE_AP.LOG
SET AGENT=BATCH
SET MOD_DCL=B
SET SQR_LOG_FILE=%LOG_DIR%\TRT5002.log

REM ------------------------------------------------------------------------
REM - FIN SECTION PARAMETRAGE
REM ------------------------------------------------------------------------  

REM ------------------------------------------------------------------------
REM - SUPPRESSION FICHIER DE SORTIE TEMPORAIRE (.SQL)    
REM ------------------------------------------------------------------------
IF EXIST %TMP_DIR%\output.lst ERASE /Q %TMP_DIR%\output.lst

REM ------------------------------------------------------------------------
REM - SUPPRESSION FICHIER DE SORTIE SQR    
REM ------------------------------------------------------------------------
IF EXIST "%SQR_LOG_FILE%" ERASE /Q "%SQR_LOG_FILE%"

REM ------------------------------------------------------------------------------
REM - DESCENDRE DANS REPERTOIRE LOG (MSGHST.LOG mis à jour dans répertoire courant)
REM ------------------------------------------------------------------------------
CD /D %LOG_DIR%

REM --------------------------------------------------------
REM Historisation des anciens logs
REM --------------------------------------------------------

IF EXIST %LOG_DIR%\%LOG_FILE% type %LOG_DIR%\%LOG_FILE% >> %LOGH_DIR%\%LOG_FILE%

IF EXIST %LOG_DIR%\%LOG_FILE% erase /q  %LOG_DIR%\%LOG_FILE%


ECHO .                                                                       >> %LOG_DIR%\%LOG_FILE%
ECHO ------------------------------------------------------------------------>> %LOG_DIR%\%LOG_FILE%
ECHO ------------------------------------------------------------------------>> %LOG_DIR%\%LOG_FILE%
ECHO --           NETTOYAGE ALGERIE POSTE                        >> %LOG_DIR%\%LOG_FILE%
ECHO ------------------------------------------------------------------------>> %LOG_DIR%\%LOG_FILE%
ECHO ------------------------------------------------------------------------>> %LOG_DIR%\%LOG_FILE%
ECHO .                                                                       >> %LOG_DIR%\%LOG_FILE%

REM ------------------------------------------------------------------------
REM - DEBUT CHAINE  BATCH
REM ------------------------------------------------------------------------
ECHO . >> %LOG_DIR%\%LOG_FILE%
ECHO ---------------------------->> %LOG_DIR%\%LOG_FILE%
ECHO DEBUT LOG CHAINE BATCH      >> %LOG_DIR%\%LOG_FILE%
ECHO ---------------------------->> %LOG_DIR%\%LOG_FILE%
ECHO . >> %LOG_DIR%\%LOG_FILE%
ECHO .
ECHO ----------------------------
ECHO DEBUT CHAINE BATCH
ECHO ----------------------------
ECHO .
CALL %CMD_DIR%\datedeb.bat



ECHO ---------------------------->> %LOG_DIR%\%LOG_FILE%
ECHO Mise à jour date de session >> %LOG_DIR%\%LOG_FILE%
ECHO ---------------------------->> %LOG_DIR%\%LOG_FILE%
ECHO Mise à jour date de session
CALL %cmd_dir%\datedeb.bat
%SQLPLUS_bat% -s %LG%/%PWD%@%ORACLE_SID% @%SQL_DIR%\DateSss.sql %AGENT% %MOD_DCL%
IF NOT ERRORLEVEL 0 GOTO ERREUR
IF EXIST %TMP_DIR%\output.lst TYPE %TMP_DIR%\output.lst >> %LOG_DIR%\%LOG_FILE%
IF EXIST %TMP_DIR%\output.lst ERASE /Q %TMP_DIR%\output.lst 
CALL %cmd_dir%\datefin.bat




ECHO . >> %LOG_DIR%\%LOG_FILE%
ECHO ----------------------------------- >> %LOG_DIR%\%LOG_FILE%
ECHO Nettoyage tables temporaires Algerie Poste   >> %LOG_DIR%\%LOG_FILE%
ECHO ----------------------------------- >> %LOG_DIR%\%LOG_FILE%
ECHO . >> %LOG_DIR%\%LOG_FILE%
ECHO .
ECHO -----------------------------------
ECHO Nettoyage tables temporaires Algerie Poste
ECHO -----------------------------------
ECHO .

CALL %cmd_dir%\datedeb.bat

%SQLPLUS_bat% -s %LG%/%PWD%@%ORACLE_SID% @%SQL_DIR%\NetAP.sql %AGENT% %MOD_DCL%


IF NOT ERRORLEVEL 0 GOTO ERREUR
IF EXIST %TMP_DIR%\output.lst TYPE %TMP_DIR%\output.lst >> %LOG_DIR%\%LOG_FILE%
IF EXIST %TMP_DIR%\output.lst ERASE /Q %TMP_DIR%\output.lst 
CALL %cmd_dir%\datefin.bat


GOTO FIN


:ERREUR
ECHO . >> %LOG_DIR%\%LOG_FILE%
ECHO !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!! >> %LOG_DIR%\%LOG_FILE%
ECHO ERREUR d'EXECUTION >> %LOG_DIR%\%LOG_FILE%
ECHO CHAINE BATCH INTERROMPUE >> %LOG_DIR%\%LOG_FILE%
ECHO HEURE INTERRUPTION : >> %LOG_DIR%\%LOG_FILE%
CALL %EXE_DIR%\GetDate.exe %LOG_DIR%\%LOG_FILE%
TYPE %TMP_DIR%\output.lst >> %LOG_DIR%\%LOG_FILE%
ECHO !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!! >> %LOG_DIR%\%LOG_FILE%
ECHO . >> %LOG_DIR%\%LOG_FILE%


:FIN
ECHO .
ECHO ----------------------------
ECHO FIN LOG CHAINE BATCH
ECHO ----------------------------
ECHO .

CALL %cmd_dir%\datefin.bat

ECHO . >> %LOG_DIR%\%LOG_FILE%
ECHO ---------------------------->> %LOG_DIR%\%LOG_FILE%
ECHO FIN LOG CHAINE BATCH        >> %LOG_DIR%\%LOG_FILE%
ECHO ---------------------------->> %LOG_DIR%\%LOG_FILE%
ECHO . >> %LOG_DIR%\%LOG_FILE%


REM ------------------------------------------------------------------------
REM - Ouverture du fichier log
REM ------------------------------------------------------------------------

%LOG_DIR%\%LOG_FILE%


