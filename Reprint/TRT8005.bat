@echo off
REM Impression des factures

REM - Modification

REM paramètres
REM %1            : agent
REM %2            : mode de lancement
REM %3            : IDTFAC
REM %IMP%         : imprimante
REM %SPOOL_DIR%   : répertoire de sauvegarde des factures de prestations
REM %EXPORT_DIR%  : répertoire de sauvegarde des factures de service avant envoi éditique
REM %EXPORTH_DIR% : répertoire d'historisation des factures de service 
REM %EDITIK_DIR%  : répertoire dans lequel les factures sont envoyées
REM -----------------------------------------------------------------------------

REM We keep a centralized copy of BRIO software.
SET SQRW_DIR=D:\TOOLS\Brio810\SQR\ORA\BINW
REM SET SQRW_DIR=C:\Program Files\Brio\SQR\ORA\BINW
REM SET SQT_DIR=%X7_HOME%\%ORACLE_SID%\PRODEXE\BATCH\SQT
SET SQT_DIR=D:\Projects\SEAAL2019\Reprint
SET SQR_DIR=D:\Projects\SEAAL2019\Reprint
SET SQRW_BAT=SQRWT
SET RUNTIME=RT

SET IMP=LPT1
SET IMP_TYP=PRINTER:PD
SET COMMBOX=XCB
SET LG=X7
SET PWD=X7
SET ORACLE_SID=X7algtst


IF "%X7_DEBUG%"=="TRUE" datetime "{Begin: TRT8005.BAT --- " >> "%TEMP%\_X7_BATCH.LOG"
IF "%X7_DEBUG%"=="TRUE" echo . Parameters : %* >> "%TEMP%\_X7_BATCH.LOG"

IF EXIST "%TEMP%\sqr.log" ERASE /Q "%TEMP%\sqr.log"

REM on lance l'édition des factures
REM echo %1
REM echo %2
REM echo %3

REM echo "%SQRW_DIR%\%SQRW_BAT%" "%SQT_DIR%\reprtfac.sqt" %LG%/%PWD%@%ORACLE_SID% -%COMMBOX% -%IMP_TYP% %1 %2 %3 "%SPL_DIR%" "%EXPORT_DIR%"  -KEEP -ZIV

CD \

"%SQRW_DIR%\%SQRW_BAT%" "%SQT_DIR%\reprtfac.sqt" %LG%/%PWD%@%ORACLE_SID% -%COMMBOX% -%IMP_TYP% %1 %2 %3 "%SPL_DIR%" "%EXPORT_DIR%"  -KEEP
IF EXIST "%TEMP%\sqr.log" TYPE "%TEMP%\sqr.log"
IF "%X7_DEBUG%"=="TRUE" datetime "}End: TRT8005.BAT --- " >> "%TEMP%\_X7_BATCH.LOG"
