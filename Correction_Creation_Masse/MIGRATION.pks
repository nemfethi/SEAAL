CREATE OR REPLACE PACKAGE IMPCLT.MIGRATION AUTHID CURRENT_USER is

  type typLstNumber is table of number index by binary_integer;
  type typClt is table of CLT%ROWTYPE index by binary_integer;
  type typCptClt is table of CPTCLT%ROWTYPE index by binary_integer;
  type typPntLvr is table of PntLvr%ROWTYPE index by binary_integer;
  type typPntCpg is table of PntCpg%ROWTYPE index by binary_integer;
  type typCpr is table of Cpr%ROWTYPE index by binary_integer;
  type typCprPntCpg is table of CprPntCpg%ROWTYPE index by binary_integer;
  type typCtr is table of Ctr%ROWTYPE index by binary_integer;
  type typAvtCtr is table of AvtCtr%ROWTYPE index by binary_integer;

  type typCtrFac is table of CtrFac%ROWTYPE index by binary_integer;
  type typInd is table of X7.Ind%ROWTYPE index by binary_integer;
  type typCns is table of Cns%ROWTYPE index by binary_integer;
  type typSqcPntLvr is record(
    IdtPntLvr number,
    SqcPntCpg number);
  type typLstPntLvr is table of typSqcPntLvr index by varchar2(40);

  type typLstMIGR_CLT is table of MIGR_CLT%ROWTYPE index by binary_integer;

  type typSqcCpr is record(
    SqcInd number,
    SqcCns number);
  type typLstSqcCpr is table of typSqcCpr index by varchar2(40);

  tLstIdtPntLvr typLstPntLvr;
  tLstSqcCpr    typLstSqcCpr;
  tLstCpr       typLstSqcCpr;

  type typFac is table of FAC%ROWTYPE index by binary_integer;
  type typTabLgnFac is table of LGNFAC%ROWTYPE index by binary_integer;
  type typOpr is table of OPR%ROWTYPE index by binary_integer;
  type typLtt is table of LTT%ROWTYPE index by binary_integer;

  PROCEDURE CHGPRM;
  PROCEDURE ASGPRM(rMIGR_CLT IN OUT MIGR_CLT%ROWTYPE);
  PROCEDURE INSNOTE(rNOTE IN OUT NOTE%ROWTYPE);
  PROCEDURE INSCLT(rMIGR_CLT IN OUT MIGR_CLT%ROWTYPE);
  PROCEDURE INSPNTLVR(rMIGR_CLT IN OUT MIGR_CLT%ROWTYPE);
  PROCEDURE INSPNTCPG(rMIGR_CLT IN OUT MIGR_CLT%ROWTYPE);
  PROCEDURE INSCPR(rMIGR_CLT IN OUT MIGR_CLT%ROWTYPE);
  PROCEDURE INSCPRPNTCPG(rMIGR_CLT IN OUT MIGR_CLT%ROWTYPE);
  PROCEDURE INSCTR(rMIGR_CLT IN OUT MIGR_CLT%ROWTYPE);
  PROCEDURE INSAVTCTR(rMIGR_CLT IN OUT MIGR_CLT%ROWTYPE);
  PROCEDURE INSX7;
  PROCEDURE INSX7CLTONLY;

  ------------------------------------------------------------------------------
  --  Variables globales para manejo de errores                               --
  ------------------------------------------------------------------------------

  Err_IdtPck    varchar2(40);
  Err_Msg       varchar2(255) := null;
  Err_IdtClt    CLT.IdtClt%TYPE := null;
  Err_IdtCtr    CTR.IdtCtr%TYPE := null;
  Err_IdtCpr    CPR.IdtCpr%TYPE := null;
  Err_NumCpr    CPR.NumCpr%TYPE := null;
  Err_IdtFac    FAC.IdtFac%TYPE := null;
  Err_NumFac    FAC.NumFct%TYPE := null;
  Err_IdtOprDbt OPR.IdtOpr%TYPE := null;
  Err_IdtOprCrt OPR.IdtOpr%TYPE := null;
  Err_TableName STACK.TableType;

  ------------------------------------------------------------------------------
  --  Variables para establecer el rango de las secuencias                    --
  ------------------------------------------------------------------------------
  gMinIdtCtr    number;
  gMinIdtFac    number;
  gMinIdtPntLvr number;
  gMinIdtCpr    number;
  gMinIdtClt    number;
  gMinIdtOpr    number;
  gMinIdtLtt    number;
  gMinIdtNote   number;
  gMinIdtLgnCss number;

  gMaxIdtCtr    number;
  gMaxIdtFac    number;
  gMaxIdtPntLvr number;
  gMaxIdtCpr    number;
  gMaxIdtClt    number;
  gMaxIdtOpr    number;
  gMaxIdtLtt    number;
  gMaxIdtNote   number;
  gMaxIdtLgnCss number;

  gLimit        number := 10000;
  gSwInsererLgn number;
  gIdxPntLvr    varchar2(40);

  gLastIdtClt    number;
PROCEDURE SET_SEQ_TO(p_name IN VARCHAR2, p_val IN NUMBER);
PROCEDURE SET_SEQ_TO_DATA(seq_name IN VARCHAR2, table_name IN VARCHAR2, col_name IN VARCHAR2);
end MIGRATION;

/
