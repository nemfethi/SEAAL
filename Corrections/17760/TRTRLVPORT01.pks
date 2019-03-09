CREATE OR REPLACE PACKAGE X7.TRTRLVPORT01 IS

-----------------------------------------------------------------------------
-- Maj     : 03/01/2006
-- Par     : JCD
-- Contenu : fonction pour gerer version du package (package produit)
-------------------------------------------------------------------------------
--
--
--
-- XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
-- Function VersionPkg
-- Version du package
-----------------------------------------------------------------------------
-- Declaration des constants
  cMODELE_EXPORT_HST_RELEVE constant number := 5;
  cMODELE_EXPORT_RELEVE constant number := 6;
  cMODELE_EXPORT_RESTRN_RELEVE constant number := 7;
  cMODELE_EXPORT_RAPPORT_RELEVE constant number := 18;
  cEttRlv_Releve constant number := 2;
FUNCTION VersionPkg
  RETURN NUMBER;
--

PROCEDURE ExporterParametres;
PROCEDURE Exporter;
procedure Importer(pFile varchar2);
procedure MajRlv(pIdtTrt number);
procedure GenererRapport(pIdtMdlXdr number, pNomFic varchar2);

-- Consommation moyenne journaliere
function CnsMoyJou (pIdtCpr number,
                    pIdtPntLvr number,
                    pIdtPntCpg number,
                    pNumCdr number,
                    pIdtCtr number,
                    pDatDbtEst date,
                    pDatFinEst date)
  return number;
-- Id du code de releve pour l'estimation (3 ou 5)
function CodRlvEst (pIdtCpr number,
                    pIdtPntLvr number,
                    pIdtPntCpg number,
                    pNumCdr number,
                    pIdtCtr number,
                    pDatDbtEst date,
                    pDatFinEst date)
  return number;

--------------------------------------------------
--------------------------------------------------
--------------------------------------------------
Procedure EstTrnDivisible( pIdtTrn TRN.IDTTRN%type,
                           pSqc    TRN.SQC%type,
                           pMsg    out VARCHAR2);
--------------------------------------------------
--------------------------------------------------
--------------------------------------------------
Procedure AnulerGeneration( pIdtTrn TRN.IDTTRN%type,
                            pSqc    TRN.SQC%type,
                            pMsg    out VARCHAR2);
--------------------------------------------------
--------------------------------------------------
--------------------------------------------------
Procedure DiviserTournee( pIdtTrn TRN.IDTTRN%type,
                          pSqc    TRN.SQC%type,
                          pNbrCpr Number,
                          pIdtAgt AGT.IDTAGT%type,
                          pMsg    out VARCHAR2);
--------------------------------------------------
--------------------------------------------------
--------------------------------------------------
function WrapText(pTxt varchar2, pLen number)
  return varchar2;
END TRTRLVPORT01;
/
