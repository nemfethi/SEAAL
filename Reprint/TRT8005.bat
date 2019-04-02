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

SET SQRW_DIR=D:\TOOLS\Brio810\SQR\ORA\BINW

REM SET SQT_DIR=D:\Projects\SEAAL2019\Reprint
REM SET SQR_DIR=Z:\Reprint
REM SET SPL_DIR=Z:\Reprint\pdf
REM SET EXPORT_DIR=Z:\Reprint\txt
REM --------------------------------------------------
SET SQT_DIR=D:\Projects\SEAAL2019\Reprint
SET SQR_DIR=D:\Projects\SEAAL2019\Reprint
SET SPL_DIR=D:\Projects\SEAAL2019\Reprint\pdf
SET EXPORT_DIR=D:\Projects\SEAAL2019\Reprint\txt
SET SQRW_BAT=SQRWT
SET RUNTIME=RT

SET IMP=LPT1
SET IMP_TYP=PRINTER:PD
SET COMMBOX=XCB
SET LG=X7
SET PWD=ORAX7ALG
SET ORACLE_SID=X7ALG


IF "%X7_DEBUG%"=="TRUE" datetime "{Begin: TRT8005.BAT --- " >> "%TEMP%\_X7_BATCH.LOG"
IF "%X7_DEBUG%"=="TRUE" echo . Parameters : %* >> "%TEMP%\_X7_BATCH.LOG"

IF EXIST "%TEMP%\sqr.log" ERASE /Q "%TEMP%\sqr.log"

REM echo "%SQRW_DIR%\%SQRW_BAT%" "%SQT_DIR%\reprtfac.sqt" %LG%/%PWD%@%ORACLE_SID% -%COMMBOX% -%IMP_TYP% %1 %2 %3 "%SPL_DIR%" "%EXPORT_DIR%"  -KEEP -ZIV

REM CD \

"%SQRW_DIR%\%SQRW_BAT%" "%SQT_DIR%\reprtfac.sqt" %LG%/%PWD%@%ORACLE_SID% -%COMMBOX% -%IMP_TYP% %1 %2 "%SPL_DIR%" "%EXPORT_DIR%"  -KEEP
IF EXIST "%TEMP%\sqr.log" TYPE "%TEMP%\sqr.log"
IF "%X7_DEBUG%"=="TRUE" datetime "}End: TRT8005.BAT --- " >> "%TEMP%\_X7_BATCH.LOG"
