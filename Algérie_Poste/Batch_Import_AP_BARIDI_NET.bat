@ECHO OFF
TITLE BATCH IMPORT FICHIER ALGERIE POSTE LOGICIEL X7 

REM ------------------------------------------------------------------------
REM - DEBUT SECTION PARAMETRAGE
REM ------------------------------------------------------------------------
call X7Cnfg.bat
SET LOG_FILE=BATCH_Import_AP.LOG
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
ECHO --           IMPORTATION DU FICHIER ALGERIE POSTE                        >> %LOG_DIR%\%LOG_FILE%
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
ECHO Importation fichier Algerie Poste BARIDI NET  >> %LOG_DIR%\%LOG_FILE%
ECHO ----------------------------------- >> %LOG_DIR%\%LOG_FILE%
ECHO . >> %LOG_DIR%\%LOG_FILE%
ECHO .
ECHO -----------------------------------
ECHO Importation fichier Algerie Poste
ECHO -----------------------------------
ECHO .

CALL %cmd_dir%\datedeb.bat

for %%a in ("%IMPORT_DIR%\AP_IN_NET_*.txt") do call "%SQRW_DIR%\%SQRW_BAT%" "%SQT_DIR%\AlgEap03.sqt" %LG%/%PWD%@%ORACLE_SID% -%COMMBOX% -%IMP_TYP% %AGENT% %MOD_DCL% "%SPL_DIR%" "%LOG_DIR%\%LOG_FILE%" "%IMPORT_DIR%" %%a -KEEP -ZIV -O%SQR_LOG_FILE%

IF NOT ERRORLEVEL 0 GOTO ERREUR
IF EXIST %TMP_DIR%\output.lst TYPE %TMP_DIR%\output.lst >> %LOG_DIR%\%LOG_FILE%
IF EXIST %TMP_DIR%\output.lst ERASE /Q %TMP_DIR%\output.lst 
IF EXIST "%SQR_LOG_FILE%" TYPE "%SQR_LOG_FILE%" >> %LOG_DIR%\%LOG_FILE%
IF EXIST "%SQR_LOG_FILE%" ERASE /Q "%SQR_LOG_FILE%" 

CALL %cmd_dir%\datefin.bat




ECHO . >> %LOG_DIR%\%LOG_FILE%
ECHO ----------------------------------- >> %LOG_DIR%\%LOG_FILE%
ECHO Controle des encaissements Algérie Poste   >> %LOG_DIR%\%LOG_FILE%
ECHO ----------------------------------- >> %LOG_DIR%\%LOG_FILE%
ECHO . >> %LOG_DIR%\%LOG_FILE%
ECHO .
ECHO -----------------------------------
ECHO Controle des encaissements Algérie Poste
ECHO -----------------------------------
ECHO .

CALL %cmd_dir%\datedeb.bat

%SQLPLUS_bat% -s %LG%/%PWD%@%ORACLE_SID% @%SQL_DIR%\Cng1.sql %AGENT% %MOD_DCL%


IF NOT ERRORLEVEL 0 GOTO ERREUR
IF EXIST %TMP_DIR%\output.lst TYPE %TMP_DIR%\output.lst >> %LOG_DIR%\%LOG_FILE%
IF EXIST %TMP_DIR%\output.lst ERASE /Q %TMP_DIR%\output.lst 
CALL %cmd_dir%\datefin.bat




ECHO . >> %LOG_DIR%\%LOG_FILE%
ECHO ----------------------------------- >> %LOG_DIR%\%LOG_FILE%
ECHO Impresion rapport de controle encaissements Algérie Poste   >> %LOG_DIR%\%LOG_FILE%
ECHO ----------------------------------- >> %LOG_DIR%\%LOG_FILE%
ECHO . >> %LOG_DIR%\%LOG_FILE%
ECHO .
ECHO -----------------------------------
ECHO Impresion rapport de controle encaissements Algérie Poste
ECHO -----------------------------------
ECHO .

CALL %cmd_dir%\datedeb.bat

"%SQRW_DIR%\%SQRW_BAT%" "%SQT_DIR%\CtrCng01.sqt" %LG%/%PWD%@%ORACLE_SID% -%COMMBOX% -%IMP_TYP% %AGENT% %MOD_DCL% "%IMP_TYP%" "%SPL_DIR%" "%CMD_DIR%" -KEEP -ZIV -O%SQR_LOG_FILE%

IF NOT ERRORLEVEL 0 GOTO ERREUR
IF EXIST %TMP_DIR%\output.lst TYPE %TMP_DIR%\output.lst >> %LOG_DIR%\%LOG_FILE%
IF EXIST %TMP_DIR%\output.lst ERASE /Q %TMP_DIR%\output.lst 
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


