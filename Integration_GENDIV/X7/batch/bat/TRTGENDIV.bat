call X7Cnfg.bat

SET LOG_FILE=TRTGENDIV.log
SET LGIMP=IMPCLT
SET PWDIMP=IMPCLT
SET ORACLE_SID=X7ALGTST

REM ------------------------------------------------------------------------------
REM - DESCENDRE DANS REPERTOIRE LOG (MSGHST.LOG mis à jour dans répertoire courant)
REM ------------------------------------------------------------------------------
CD /D %LOG_DIR%

REM --------------------------------------------------------
REM Historisation des anciens logs
REM --------------------------------------------------------

IF EXIST %LOG_DIR%\%LOG_FILE% type %LOG_DIR%\%LOG_FILE% >> %LOGH_DIR%\%LOG_FILE%

IF EXIST %LOG_DIR%\%LOG_FILE% erase /q  %LOG_DIR%\%LOG_FILE%


ECHO ------------------------------------->> "%LOG_DIR%\%LOG_FILE%"
ECHO Traitement des GEN/DIV >> "%LOG_DIR%\%LOG_FILE%"
ECHO ------------------------------------->> "%LOG_DIR%\%LOG_FILE%"
call %CMD_DIR%\X7Cnfg.bat

CALL "%cmd_dir%\datedeb.bat"
"%SQLPLUS_bat%" %LG%/%PWD%@%ORACLE_SID% @"%SQL_DIR%\TRTGENDIV.sql"
IF NOT ERRORLEVEL 0 GOTO ERREUR
IF EXIST "%TMP_DIR%\output.lst" TYPE "%TMP_DIR%\output.lst" >> "%LOG_DIR%\%LOG_FILE%"
IF EXIST "%TMP_DIR%\output.lst" ERASE /Q "%TMP_DIR%\output.lst" 
CALL "%cmd_dir%\datefin.bat"

exit

