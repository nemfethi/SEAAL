create or replace package ALG_INTDST
as
  cCrLf varchar2(2) :=  CHR(13) || CHR(10) ;
  
  /* paramètres globaux: à adapter selon le paramétrage */
  gIdtTypCnt  Cnt.IdtTypCnt%type := 110;
  gIdtMtfCnt  Cnt.IdtMtfCnt%type := 420;
  gIdtOrgCnt  Cnt.IdtOrgCnt%type := 536;
  gT1         Cnt.T1%type        := 'TN_001';
  
  Procedure Controles;
  procedure creer1CntDst(  pIdtSqcGnr ALG_Dist_Dtl.IdtSqcGnr%type);
  Procedure Creer1CntDst ( pIdtClt Clt.IdtClt%type,
                          pIdtAgt Agt.IdtAgt%type,
                          pLng Cnt.N1%type,
                          pLat Cnt.N1%type,
                          pDtl Cnt.Dtl%type,
                          pDatDst Cnt.DatCnt%type);
  procedure IntDst(pIdtDst Alg_Dist_Ent.IdtDst%type);
  FUNCTION distance(Lat1   IN NUMBER,
                  Lon1   IN NUMBER,
                  Lat2   IN NUMBER,
                  Lon2   IN NUMBER,
                  Radius IN NUMBER DEFAULT 3963)
  RETURN NUMBER;
end ALG_INTDST;
/