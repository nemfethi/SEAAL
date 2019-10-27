create or replace package body ALG_INTDST
as
Function versionPkg return varchar2 is
begin
  return 10000;
end;
  procedure Controles is
  begin
    null;
  end;
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
procedure creerCntDst(  pIdtSqcGnr ALG_Dist_Dtl.IdtSqcGnr%type) is
  vIdtClt Clt.IdtClt%type;
  vIdtAgt Agt.IdtAgt%type;
  vLng Cnt.N1%type;
  vLat Cnt.N1%type;
  vDtl Cnt.Dtl%type;
  vNumFct Alg_Dist_Dtl.NumFct%type;
  vInt Alg_Dist_Dtl.Int%type;
  vDatDst Date;
begin
  Select  CltDst,
          AgtDst,
          LngDst,
          LatDst,
          'Facture N° '   || NUMFCT     || 
          ' distribuée par l''agent : ' ||  AGTDST || Chr(10)||Chr(13) ||
          'Date : '       || ORGDATDST  || Chr(10)||Chr(13)||
          'Longitude : '  || ORGLNGDST  || Chr(10)||Chr(13)||
          'Latitude : '   || ORGLATDST,
          nvl(Int, 0),
          NumFct,
          to_date(ORGDATDST, 'DD/MM/YY HH24:mi:ss') 
          into
          vIdtClt,
          vIdtAgt,
          vLng,
          vLat,
          vDtl,
          vInt,
          vNumFct,
          vDatDst
  from Alg_Dist_Dtl 
  where IdtSqcGnr = pIdtSqcGnr;
  -- on vérifie si cette facture a deja été distribuée
  for rDist in (Select * from Alg_Dist_Dtl where numFct = vNumFct and int=1)
  loop
    if to_date(rDist.ORGDATDST, 'DD/MM/YY HH24:mi:ss') < vDatDst then -- une date de distribution plus récente
      vInt := 0 +vInt;
      update Alg_Dist_Dtl 
      set Stt='D' 
      where IdtSqcGnr = rDist.IdtSqcGnr;
    end if;
  end loop;
  -- on fait l'intégration si ce n'est pas déja fait
  if vInt = 0 then
    begin
      creerCntDst(  vIdtClt,
                    vIdtAgt,
                    vLng,
                    vLat,
                    vDtl,
                    vDatDst
                    );
      update Alg_Dist_Dtl set Int = 1, Stt='I' where IdtSqcGnr = pIdtSqcGnr;
      exception
        when others then
          X7.GEST_ERREUR_CENTURA(VersionPkg(),
                                0,
                                'ALG_INTDST',
                                'creerCntDst',
                                to_char(SQLERRM),
                                sqlcode,
                                DBMS_UTILITY.FORMAT_ERROR_BACKTRACE);
      end;
  end if;
end creerCntDst;
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
  procedure creerCntDst(  pIdtClt Clt.IdtClt%type,
                          pIdtAgt Agt.IdtAgt%type,
                          pLng Cnt.N1%type,
                          pLat Cnt.N1%type,
                          pDtl Cnt.Dtl%type,
                          pDatDst Cnt.DatCnt%type) is
  vSqcCnt Clt.SqcCnt%type;
  vIdtCodSns Clt.IdtCodSns%type;
  vIdtCntOpr Clt.IdtCntOpr%type;
  vIdtTypCnt Cnt.IdtTypCnt%type := 110;
  vIdtMtfCnt Cnt.IdtMtfCnt%type := 420;
  vT1 Cnt.T1%type :='TN_001';
  begin
    -- Recherche de la séquence de contact
    Select SqcCnt+1, IdtCodSns, IdtCntOpr into vSqcCnt, vIdtCodSns, vIdtCntOpr from Clt where IdtClt = pIdtClt;
    -- Création du contact
    insert into Cnt (IdtClt, IdtCnt, IdtTypCnt, IdtMtfCnt, IdtAgt, IdtCodSns, IdtCntOpr, Int, DatFin, DatCnt, DatEnr, T1, N1, N2, Dtl)
    values (pIdtClt, vSqcCnt, vIdtTypCnt, vIdtMtfCnt, pIdtAgt, vIdtCodSns, vIdtCntOpr, 1, Sysdate, pDatDst, Sysdate, vT1, pLng, pLat, pDtl);
    -- Mise à jour de la séquence de contact
    update CLT set SqcCnt=vSqcCnt where idtClt=pIdtClt;
    exception
      when others then
        X7.GEST_ERREUR_CENTURA(VersionPkg(),
                              0,
                              'ALG_INTDST',
                              'creerCntDst',
                              to_char(SQLERRM),
                              sqlcode,
                              DBMS_UTILITY.FORMAT_ERROR_BACKTRACE);
  end;
end ALG_INTDST;
/
