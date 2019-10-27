create or replace package ALG_INTDST
as
  Procedure Controles;
  procedure creerCntDst(  pIdtSqcGnr ALG_Dist_Dtl.IdtSqcGnr%type);
  Procedure CreerCntDst ( pIdtClt Clt.IdtClt%type,
                      pIdtAgt Agt.IdtAgt%type,
                      pLng Cnt.N1%type,
                      pLat Cnt.N1%type,
                      pDtl Cnt.Dtl%type,
                      pDatDst Cnt.DatCnt%type);

end ALG_INTDST;
/