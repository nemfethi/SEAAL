REM - Modification
REM - 	CAL		16/12/01	Gestion du mode DEBUG + Compatibilité nom long Windows

@echo off
IF "%X7_DEBUG%"=="TRUE" "%EXE_DIR%\datetime" "{Begin: X7cnfg.bat --- " >> "%TEMP%\_X7_BATCH.LOG"
IF "%X7_DEBUG%"=="TRUE" echo . Directory : >> "%TEMP%\_X7_BATCH.LOG"
IF "%X7_DEBUG%"=="TRUE" CD >> "%TEMP%\_X7_BATCH.LOG"
IF "%X7_DEBUG%"=="TRUE" echo . >> "%TEMP%\_X7_BATCH.LOG"

REM -----------------------------------------------------------------------
REM -----------------------------------------------------------------------
REM - DEBUT SECTION PARAMETRAGE
REM ------------------------------------------------------------------------
REM ------------------------------------------------------------------------

REM ------------------------------------------------------------------------
REM Parametres commun
REM ------------------------------------------------------------------------

REM !!!!!! TEMPORAIRE !!!!!!!!

NET USE X: /delete /yes
NET USE N: /delete /yes
NET USE X: \\siege-fch-001\X7ALG_FICHIERS
NET USE P: \\10.98.16.13\X7-F1
NET USE Q: \\10.98.16.13\X7-F2
NET USE R: \\10.98.16.13\F3-Facture
NET USE O: \\10.98.16.13\F3-Facture-exF2
NET USE N: \\siege-KSL-001\SEAAL\Facture\txt

REM !!!!!!!!!!!!!!!!!!!!!!!!!!

set HOMEDRIVE=c:

SET ORACLE_SID=X7ALG
SET X7_HOME=D:\X7
SET X7_FILES=X:
SET LG=X7
SET PWD=oraX7alg

REM ---- Oracle parameter : Set the path to the TNSNAMES.ORA and the proper NLS_LANG parameter
REM set TNS_ADMIN=%X7_HOME%\LocalCopy
set NLS_LANG=AMERICAN_AMERICA.AR8MSWIN1256


SET SQL_DIR=%X7_HOME%\%ORACLE_SID%\PRODEXE\BATCH\SQL
SET EXE_DIR=%X7_HOME%\%ORACLE_SID%\PRODEXE\BATCH\EXE
SET CMD_DIR=%X7_HOME%\%ORACLE_SID%\PRODEXE\BATCH\BAT
SET CTL_DIR=%X7_HOME%\%ORACLE_SID%\PRODEXE\BATCH\CTL
REM SET TMP_DIR=%X7_HOME%\%ORACLE_SID%\PRODEXE\BATCH\TMP
SET TMP_DIR=%X7_FILES%\LOG

SET SPL_DIR=%X7_FILES%\SPOOL
SET SPLH_DIR=%X7_FILES%\SPOOL\HISTORY
SET LOG_DIR=%X7_FILES%\LOG
SET LOGH_DIR=%X7_FILES%\LOG\HISTORY
SET EXPORT_DIR=%X7_FILES%\EXPORT
SET EXPORTH_DIR=%EXPORT_DIR%\HISTORY
SET IMPORT_DIR=%X7_FILES%\IMPORT
SET SPL_TCK=%X7_FILES%\TICKET_CAISSE

SET LOG_FILE=BATCH.LOG
SET LOG_FILE_HIST=BATCH_HIST.LOG
SET SQLPLUS_BAT=SQLPLUS
SET DMP_DIR=%X7_HOME%\DMP
SET DMP_DIRH=%X7_HOME%\DMP\HISTORY

REM ------------------------------------------------------------------------
REM Repertoires recensement
REM ------------------------------------------------------------------------

SET RCS_DIR=\\siege-pda-001\PDA\X7ALG
SET TMP_XML=\\siege-pda-001\PDA\X7ALG\TMP


REM répertoires pour l'éditique
SET EDITIK_DIR_F1=P:
SET EDITIK_DIR_F2=Q:
SET EDITIK_DIR_F3=R:
SET EDITIK_DIR_F3exF2=O:
SET EDITIK_DIR_F32=N:
SET EDITIK_DIR_F3exF22=N:


REM ----- Copy the DateTime tool in the %windir% directory (it's in the PATH...)
IF NOT EXIST "%windir%\DateTime.exe" COPY "%EXE_DIR%\DateTime.exe" "%windir%"

REM ------------------------------------------------------------------------
REM Parametres environnement MICROREL
REM ------------------------------------------------------------------------

REM SET MCR_DIR=%X7_HOME%\%ORACLE_SID%\HHU
SET MCR_DIRE=%SPL_DIR%
REM SET MCR_FILE=RETOUR.RLV
REM SET MCR_BATH=HSTMCR.BAT
REM SET MCR_ACC=ACCUSE.TXT

REM ------------------------------------------------------------------------
REM Parametres environnement INTERFACE TRESOR PUBLIC
REM ------------------------------------------------------------------------
REM SET TP_DIR=%X7_HOME%\%ORACLE_SID%\TP
REM SET TP_DEF_FILE=FLUOR.TXT

REM ------------------------------------------------------------------------
REM Parametres environnement SQR
REM ------------------------------------------------------------------------

REM We keep a centralized copy of BRIO software.
SET SQRW_DIR=C:\Program Files\Brio\SQR\ORA\BINW
SET SQT_DIR=%X7_HOME%\%ORACLE_SID%\PRODEXE\BATCH\SQT
SET SQR_DIR=%X7_HOME%\%ORACLE_SID%\PRODEXE\BATCH\SQR
SET MEM_FILE=%X7_HOME%\%ORACLE_SID%\PRODEXE\BATCH\sqt\X7.Dat
SET SQRW_BAT=SQRWT
SET RUNTIME=RT

SET IMP=LPT1
SET IMP_TYP=PRINTER:PD
SET COMMBOX=XCB

REM ------------------------------------------------------------------------
REM Parametres environnement Caisse Off-Line
REM ------------------------------------------------------------------------
SET ACS_DIR=%SYSTEMDRIVE%\X7Bis\OFFICE
SET MDB_DIR=%X7_HOME%\%ORACLE_SID%\PRODEXE\X7Bis
SET X7BIS_GRP=%X7_HOME%\%ORACLE_SID%\PRODEXE\X7Bis\X7bisgrp.mdw

REM ------------------------------------------------------------------------
REM Parametres autres
REM ------------------------------------------------------------------------

SET EXPSVG_DIR=%X7_HOME%\%ORACLE_SID%\PRODEXE\batch
SET EXPSVG_FILE=EXPORT.DMP
SET EXP=EXP73 

SET IMP_DIR=%X7_FILES%\IMPORT
SET IMPH_DIR=%X7_FILES%\IMPORT\HISTORY

SET LOADER_FILE=X7_MIGR.DAT
SET LOADER_CMD=SQLLDR.EXE
SET SQLDBA=SVRMGRL.EXE
SET ORA_SERVICE=ORACLESERVICE%ORACLE_SID% 
SET ORA_START=ORACLESTART%ORACLE_SID% 


SET BIP_SRV=\\172.16.43.44
SET BIP_DIR_RPT=\~administrator\TestFP
SET BIP_DIR_SPOOL=\SPOOL


REM ------------------------------------------------------------------------
REM Creation of non existent folders ...
REM Note : MakeDirs.bat can be modified if additional folders are required
REM ------------------------------------------------------------------------
CALL "%CMD_DIR%\MakeDirs.bat"


REM -----------------------------------------------------------------------
REM -----------------------------------------------------------------------
REM - FIN SECTION PARAMETRAGE
REM ------------------------------------------------------------------------
REM -----------------------------------------------------------------------

REM -----------------------------------------------------------------------
REM Pour débuggage : permet de récupérer les définitions de variables d'env.
REM dans un fichier.
REM -----------------------------------------------------------------------

IF "%X7_DEBUG%"=="TRUE" ECHO . ------------- Start of Variables ---------------- >> "%TEMP%\_X7_BATCH.LOG"
IF "%X7_DEBUG%"=="TRUE" SET >> "%TEMP%\_X7_BATCH.LOG"
IF "%X7_DEBUG%"=="TRUE" ECHO . -------------- End of Variables ----------------- >> "%TEMP%\_X7_BATCH.LOG"
IF "%X7_DEBUG%"=="TRUE" ECHO . >> "%TEMP%\_X7_BATCH.LOG"
IF "%X7_DEBUG%"=="TRUE" "%EXE_DIR%\datetime" "}End: X7cnfg.bat --- " >> "%TEMP%\_X7_BATCH.LOG"

REM ------------------------------------------------------------------------
REM Parametres environnement BIP
REM ------------------------------------------------------------------------
REM ICI IL FAUT METTRE LE NOM DU SERVEUR OU SON ADRESSE IP

SET BIP_SRV=\\172.16.43.44
SET BIP_DIR_RPT=\~administrator\TestFP
SET BIP_DIR_SPOOL=\SPOOL

REM ------------------------------------------------------------------------
REM Parametres releve portable
REM ------------------------------------------------------------------------
REM set RLV_REP=%X7_FILES%\RELEVE_PORTABLE
REM set RLV_REP=\\10.98.16.2\Serv-RLV
REM set RLV_DIR=%RLV_REP%\J
REM set SERVER_RLV_DIR=\\10.98.16.2\Serv-RLV\J
REM set TMP_XML_RLVPORT=\\10.98.16.2\Serv-RLV\TMP

REM set RLV_REP=\\siege-fp-v1\Transfert-Pda\J
REM set RLV_DIR=%RLV_REP%\J
REM set SERVER_RLV_DIR=\\siege-fp-v1\Transfert-Pda\J
REM set TMP_XML_RLVPORT=\\siege-fp-v1\Transfert-Pda\TMP

REM ------------------------------------------------------------------------
REM Parametres releve portable
REM ------------------------------------------------------------------------
set XMLFILES_RLVPORT=\\10.98.16.2\Serv-RLV\J

REM ------------------------------------------------------------------------
REM Parametres Archivage BLUE OCEAN
REM ------------------------------------------------------------------------
set BLUE_OCEAN_DIR_BUFFER_TRN_RLV=\\siege-fch-002\X7ALG_FILES\X7-CARNET_RELEVE
set BLUE_OCEAN_VAR_TRN_RLV=CARNET_DE_RELEVE_*LOT*

set BLUE_OCEAN_DIR_BUFFER_BDR_EDTQ=\\siege-fch-002\X7ALG_FILES\X7-RAPPORT-EDITIQUE
set BLUE_OCEAN_VAR_BDR_EDTQ=EDITIQUE_EAU_

set BLUE_OCEAN_DIR_BUFFER_MD_SIMPL=\\siege-fch-002\X7ALG_FILES\X7-MD-SIMPLE
set BLUE_OCEAN_VAR_MD_SIMPL=MD_SIMPLE_AF

set BLUE_OCEAN_DIR_BUFFER_ORD_COUP=\\siege-fch-002\X7ALG_FILES\X7-Ordre-Coupure
set BLUE_OCEAN_VAR_ORD_COUP=ORDRE_COUPURE

set BLUE_OCEAN_DIR_BUFFER_MD_JURID=\\siege-fch-002\X7ALG_FILES\X7-MD-JURIDIQUE
set BLUE_OCEAN_VAR_MD_JURID=MD_JURIDIQUE_AF

set BLUE_OCEAN_DIR_BUFFER_ENQ_COUP=\\siege-fch-002\X7ALG_FILES\X7-Enquette
set BLUE_OCEAN_VAR_ENQ_COUP=ENQUETE_APRES_COUPURE

set BLUE_OCEAN_DIR_BUFFER_MDSAP=\\siege-fch-002\X7ALG_FILES\X7-MD-SIMPLE
set BLUE_OCEAN_VAR_MDSAP=RLCAP