@ECHO OFF
TITLE BATCH GENERATION DU FICHIER ALGERIE POSTE LOGICIEL X7 

REM ------------------------------------------------------------------------
REM - DEBUT SECTION PARAMETRAGE
REM ------------------------------------------------------------------------
call X7Cnfg.bat
SET LOG_FILE=BATCH_Export_AP.LOG
SET AGENT=BATCH
SET MOD_DCL=B
SET SQR_LOG_FILE=%LOG_DIR%\TRT5001.log
SET EXPORT_TMP=%EXPORT_DIR%\TMP

REM Creation du repertoire temporaire pour le fichier OUT s'il n'existe pas

IF NOT EXIST %EXPORT_TMP%\*.* MD %EXPORT_TMP% 

REM ------------------------------------------------------------------------
REM - FIN SECTION PARAMETRAGE
REM ------------------------------------------------------------------------  

REM ------------------------------------------------------------------------
REM - SUPPRESSION FICHIER DE SORTIE TEMPORAIRE (.SQL)    
REM ------------------------------------------------------------------------
IF EXIST %TMP_DIR%\output.lst ERASE /Q %TMP_DIR%\output.lst
IF EXIST %EXPORT_TMP%\*.* ERASE /Q %EXPORT_TMP%\*.*

REM ------------------------------------------------------------------------
REM - SUPPRESSION FICHIER DE SORTIE SQR    
REM ------------------------------------------------------------------------
IF EXIST "%SQR_LOG_FILE%" ERASE /Q "%SQR_LOG_FILE%"

REM ------------------------------------------------------------------------------
REM - DESCENDRE DANS REPERTOIRE LOG (MSGHST.LOG mis à jour dans répertoire courant)
REM ------------------------------------------------------------------------------
CD /d %LOG_DIR%

REM --------------------------------------------------------
REM Historisation des anciens logs
REM --------------------------------------------------------

IF EXIST %LOG_DIR%\%LOG_FILE% type %LOG_DIR%\%LOG_FILE% >> %LOGH_DIR%\%LOG_FILE%

IF EXIST %LOG_DIR%\%LOG_FILE% erase /q  %LOG_DIR%\%LOG_FILE%

ECHO .                                                                       >> %LOG_DIR%\%LOG_FILE%
ECHO ------------------------------------------------------------------------>> %LOG_DIR%\%LOG_FILE%
ECHO ------------------------------------------------------------------------>> %LOG_DIR%\%LOG_FILE%
ECHO --              GENERATION DU FICHIER ALGERIE POSTE                    -->> %LOG_DIR%\%LOG_FILE%
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
ECHO Generation fichier Algerie Poste   >> %LOG_DIR%\%LOG_FILE%
ECHO ----------------------------------- >> %LOG_DIR%\%LOG_FILE%
ECHO . >> %LOG_DIR%\%LOG_FILE%
ECHO .
ECHO -----------------------------------
ECHO Generation fichier Algerie Poste
ECHO -----------------------------------
ECHO .

CALL %cmd_dir%\datedeb.bat

"%SQRW_DIR%\%SQRW_BAT%" "%SQT_DIR%\ALGEAP01.sqt" %LG%/%PWD%@%ORACLE_SID% %AGENT% %MOD_DCL% "%IMP_TYP%" "%SPL_DIR%" "%LOG_DIR%\%LOG_FILE%" "%EXPORT_DIR%" -%COMMBOX% -NOLIS -KEEP -O%SQR_LOG_FILE% 

REM

IF NOT ERRORLEVEL 0 GOTO ERREUR
IF EXIST "%SQR_LOG_FILE%" TYPE "%SQR_LOG_FILE%" >> %LOG_DIR%\%LOG_FILE%
IF EXIST "%SQR_LOG_FILE%" ERASE /Q "%SQR_LOG_FILE%"
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
ECHO Pour plus de details eventuels consultez le fichier TRT2005.log >> %LOG_DIR%\%LOG_FILE%
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

%LOG_DIR%\%LOG_FILE%