@echo off
REM Impression des factures

REM - Modification
REM - 	CAL		16/12/01	Gestion du mode DEBUG + Compatibilité nom long Windows

REM paramètres
REM %1            : agent
REM %2            : mode de lancement
REM %IMP%         : imprimante
REM %SPOOL_DIR%   : répertoire de sauvegarde des factures de prestations
REM %EXPORT_DIR%  : répertoire de sauvegarde des factures de service avant envoi éditique
REM %EXPORTH_DIR% : répertoire d'historisation des factures de service 
REM %EDITIK_DIR%  : répertoire dans lequel les factures sont envoyées
REM -----------------------------------------------------------------------------

IF "%X7_DEBUG%"=="TRUE" datetime "{Begin: TRT2005.BAT --- " >> "%TEMP%\_X7_BATCH.LOG"
IF "%X7_DEBUG%"=="TRUE" echo . Parameters : %* >> "%TEMP%\_X7_BATCH.LOG"

IF EXIST "%TEMP%\sqr.log" ERASE /Q "%TEMP%\sqr.log"

REM on lance l'édition des factures
echo "%SQRW_DIR%\%SQRW_BAT%" "%SQT_DIR%\genfac_f3.sqt" %LG%/%PWD%@%ORACLE_SID% -%COMMBOX% -%IMP_TYP% %1 %2 "%SPL_DIR%" "%EXPORT_DIR%"  -KEEP -ZIV

"%SQRW_DIR%\%SQRW_BAT%" "%SQT_DIR%\genfac_f3.sqt" %LG%/%PWD%@%ORACLE_SID% -%COMMBOX% -%IMP_TYP% %1 %2 "%SPL_DIR%" "%EXPORT_DIR%"  -KEEP -ZIV 
IF EXIST "%TEMP%\sqr.log" TYPE "%TEMP%\sqr.log"
IF "%X7_DEBUG%"=="TRUE" datetime "}End: TRT2005.BAT --- " >> "%TEMP%\_X7_BATCH.LOG"
