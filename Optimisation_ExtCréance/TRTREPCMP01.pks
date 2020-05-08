CREATE OR REPLACE PACKAGE X7."TRTREPCMP01" is
  cREPARTITION_PRORATA constant number := 1;  -- Repartition au prorata
  cREPARTITION_TVA     constant number := 2;  -- Repartition en priorite sur la TVA
  cREPARTITION_ANCIEN  constant number := 3;  -- Repartition du plus recent au plus ancien
  cREPARTITION_RECENT  constant number := 4;  -- Repartition du plus recent au plus ancien
  cCMP_DATE_VALEUR     constant number := 1;  -- Comptabilite basee sur la date de valeur (commercial)
  cCMP_DATE_CREATION   constant number := 2;  -- Comptabilite basee sur la date de creation

  gIdtTypRepEch number := cREPARTITION_RECENT;   -- Type de repartition, 1 --> A prorata
                                                 --                      2 --> Sur TVA en priorite
                                                 --                      3 --> Du plus ancien au plus recent
                                                 --                      4 --> Du plus recent au plus ancien
  gIdtTypRepPmt number := cREPARTITION_PRORATA;  -- Type de repartition, 1 --> A prorata
                              --                                         2 --> Sur TVA en priorite
  gTypDatCmp number;   -- X7 est un logiciel commercial, par defaut, dans ChargerPrm on etablie la
                       -- la type de date (Commercial ou comptable) a commercial, si ce parametre
                       -- n'a pas etait reinsegne auparavant
--
TYPE typDetEch is record (Echr_IdtOpr number,
                          Echr_MntHt number,
                          Echr_MntTva number,
                          Echr_MntTtc number,
                          Ech_IdtOpr number,
                          Ech_DatVlr date,
                          Ech_DatCrt date,
                          IdtFac number,
                          OprAfc_IdtOpr number,
                          OprAfc_IdtTypOpr number,
                          OprAfc_DatVlr date,
                          OprAfc_DatCrt date,
                          OprAfc_MntHt number,
                          OprAfc_MntTva number,
                          NumLgnFct number,
                          IdtDetLgn number,
                          NumTrn number,
                          IdtRbq varchar2(6),
                          FacEchr_MntHt number,
                          FacEchr_MntTva number,
                          FacEchr_MntTtc number,
                          Ech_MntHt number,
                          Ech_MntTva number,
                          Ech_MntTtc number,
                          Lgn_IdtTax varchar2(6),
                          Lgn_Qte number,
                          Lgn_MntHt number,
                          Lgn_MntTva number,
                          Lgn_MntTtc number,
                          Lgn_RbqCmm number);
type typLstDetEch is table of typDetEch;
--
TYPE typDetLtt  is record (IdtFac number,
                           MntHt number,
                           MntTva number,
                           NumLgnFct number,
                           IdtDetLgn number,
                           NumTrn number,
                           IdtRbq varchar2(6),
                           Lgn_IdtTax varchar2(6),
                           Lgn_TotQte number,
                           Lgn_TotHt number,
                           Lgn_TotTva number,
                           Lgn_TotTtc number,
                           Lgn_Qte number,
                           Lgn_MntHt number,
                           Lgn_MntTva number,
                           Lgn_MntTtc number,
                           Lgn_RbqCmm number,
                           SldHt number,
                           SldTva number,
                           SldTtc number,
                           Lgn_SldQte number,
                           Lgn_SldHt number,
                           Lgn_SldTva number,
                           Lgn_SldTtc number);
type typLstDetLtt is table of typDetLtt;
--
TYPE typDetOpr  is record (IdtFac number,
                           MntHt number,
                           MntTva number,
                           NumLgnFct number,
                           IdtDetLgn number,
                           NumTrn number,
                           IdtRbq varchar2(6),
                           Lgn_IdtTax varchar2(6),
                           Lgn_Qte number,
                           Lgn_MntHt number,
                           Lgn_MntTva number,
                           Lgn_MntTtc number,
                           Lgn_RbqCmm number);
type typLstDetOpr is table of typDetOpr;
--
  function DetEch(pIdtOprEch OPR.IdtOpr%TYPE)
    return typLstDetEch pipelined;
  function DetLtt (pIdtLtt LTT.IdtLtt%TYPE)
    return typLstDetLtt pipelined;
  function DetOpr(pIdtOpr OPR.IdtOpr%TYPE)
    return typLstDetOpr pipelined;
--
  procedure ClcDetEch(pIdtOprEch OPR.IdtOpr%TYPE, ptDetEch OUT typLstDetEch, pIdtOprAfc OPR.IdtOpr%TYPE DEFAULT NULL );
  procedure ClcDetLtt(pIdtLtt LTT.IdtLtt%TYPE, ptDetLtt OUT typLstDetLtt);
  procedure ClcDetOpr(pIdtOpr OPR.IdtOpr%TYPE, ptDetOpr OUT typLstDetOpr, pIdtOprAfc OPR.IdtOpr%TYPE default null);
END TRTREPCMP01;

 
/
