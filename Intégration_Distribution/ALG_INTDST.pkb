create or replace package body ALG_INTDST
as
Function versionPkg return varchar2 is
begin
  return 10000;
end;
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
procedure Controles is
begin
  null;
  /*Agent inconnu*/
  /*Client inconnu*/
end;
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
procedure creer1CntDst(  pIdtSqcGnr ALG_Dist_Dtl.IdtSqcGnr%type) is
  vIdtClt Clt.IdtClt%type;
  vIdtAgt Agt.IdtAgt%type;
  vLng Cnt.N1%type;
  vLat Cnt.N1%type;
  vDtl Cnt.Dtl%type;
  vNumFct Alg_Dist_Dtl.NumFct%type;
  vInt Alg_Dist_Dtl.Int%type;
  vDatDst Date;
begin
  -- dbms_output.put_line('Traitement: '||pIdtSqcGnr);
  begin
  Select  CltDst,
          AgtDst,
          LngDst, --to_number(replace(ORGLNGDST, '.',',')),
          LatDst, --to_number(replace(ORGLATDST, '.',',')),
          case when SttDst=1 then -- Distribué = Oui
            'Facture N° '                 || NUMFCT                                     || cCrLf || 
            'distribuée par l''agent : '  || AGTDST                                     || cCrLf ||
            'Date : '                     || to_char(DATDSTDTL, 'DD/MM/YYYY HH24:mi:ss')|| cCrLf ||
            'Longitude : '                || LNGDST                                     || cCrLf ||
            'Latitude : '                 || LATDST                                     || cCrLf || 
            case when Ltrim(ComDst) is null then 
              null 
            else 
            'Commentaire: ' || COMDST 
            end
          else -- Distribué = Non
            'Facture N° '                 || NUMFCT                                       || cCrLf || 
            'non distribuée : (agent: '   || AGTDST ||  ' )'                              || cCrLf ||
            'Date : '                     || to_char(DATDSTDTL, 'DD/MM/YYYY HH24:mi:ss')  || cCrLf ||
            'Longitude : '                || LNGDST                                       || cCrLf ||
            'Latitude : '                 || LATDST                                       || cCrLf || 
            case when Ltrim(ComDst) is null then 
              null 
            else 
              'Commentaire: ' || COMDST 
            end
          end,
          nvl(Int, 0),
          NumFct,
          DatDstDtl --to_date(ORGDATDST, 'DD/MM/YY HH24:mi:ss') 
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
  exception
    -- when no_data_found then
    --   dbms_output.put_line('erreur: '||pIdtSqcGnr);
    when others then
    update alg_dist_dtl set stt='E' where IdtSqcGnr=pIdtSqcGnr;
    X7.GEST_ERREUR_CENTURA(VersionPkg(),
                                    0,
                                    'ALG_INTDST',
                                    'CREER1CNTDST',
                                    to_char(SQLERRM),
                                    sqlcode,
                                    DBMS_UTILITY.FORMAT_ERROR_BACKTRACE);
  end;

  if vNumFct is not null then
    -- on vérifie si cette facture a deja été distribuée
    for rDist in (Select * from Alg_Dist_Dtl where numFct = vNumFct and IdtSqcGnr!=pIdtSqcGnr )
    loop
      if rDist.DatDstDtl <= vDatDst and rDist.STT is null then -- une date de distribution plus récente
        update Alg_Dist_Dtl 
        set Stt='D', Int = 0
        where IdtSqcGnr = rDist.IdtSqcGnr;
      elsif rDist.DatDstDtl >= vDatDst and rDist.STT is not null then
        vInt :=1;
        update Alg_Dist_Dtl 
        set Stt='D', Int = 0
        where IdtSqcGnr = pIdtSqcGnr;
      end if;
    end loop;
    if vInt = 0 then
      begin
        creer1CntDst(  vIdtClt,
                      vIdtAgt,
                      vLng,
                      vLat,
                      vDtl,
                      vDatDst
                      );
        update Alg_Dist_Dtl set Int = 1, Stt='I' where IdtSqcGnr = pIdtSqcGnr;
      exception
        when others then
          update Alg_Dist_Dtl set Int = 0, Stt='E' where IdtSqcGnr = pIdtSqcGnr;
          X7.GEST_ERREUR_CENTURA(VersionPkg(),
                                0,
                                'ALG_INTDST',
                                'CREER1CNTDST',
                                to_char(SQLERRM),
                                sqlcode,
                                DBMS_UTILITY.FORMAT_ERROR_BACKTRACE);
      end;
    end if;
    
    commit;
  end if;
  
end creer1CntDst;
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
  procedure creer1CntDst( pIdtClt Clt.IdtClt%type,
                          pIdtAgt Agt.IdtAgt%type,
                          pLng Cnt.N1%type,
                          pLat Cnt.N1%type,
                          pDtl Cnt.Dtl%type,
                          pDatDst Cnt.DatCnt%type) is
  vSqcCnt Clt.SqcCnt%type;
  vIdtCodSns Clt.IdtCodSns%type;
  vIdtCntOpr Clt.IdtCntOpr%type;

  begin
    -- Recherche de la séquence de contact
    Select SqcCnt+1, IdtCodSns, IdtCntOpr into vSqcCnt, vIdtCodSns, vIdtCntOpr 
    from Clt 
    where IdtClt = pIdtClt;
    
    -- Création du contact
    insert into Cnt (IdtClt,  IdtCnt,  IdtTypCnt,  IdtMtfCnt,  IdtOrgCnt,  IdtAgt,  IdtCodSns,  IdtCntOpr,  Int, DatFin,  DatCnt,  DatEnr,  T1,  Dtl)
             values (pIdtClt, vSqcCnt, gIdtTypCnt, gIdtMtfCnt, gIdtOrgCnt, pIdtAgt, vIdtCodSns, vIdtCntOpr, 1,   Sysdate, pDatDst, Sysdate, gT1, pDtl);
    
    -- Mise à jour de la séquence de contact
    update CLT 
      set SqcCnt=vSqcCnt 
    where idtClt=pIdtClt;
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
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
procedure IntDst(pIdtDst Alg_Dist_Ent.IdtDst%type)
  is
  begin
    for rCur in (Select * from Alg_Dist_Dtl 
                where IdtDst = pIdtDst 
                and SttDst is not null 
                order by datdstdtl desc) loop
      creer1CntDst(rCur.IdtSqcGnr);
    end loop;
  end IntDst;
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
FUNCTION distance(Lat1   IN NUMBER,
                  Lon1   IN NUMBER,
                  Lat2   IN NUMBER,
                  Lon2   IN NUMBER,
                  Radius IN NUMBER DEFAULT 3963)
  RETURN NUMBER IS
  -- Convert degrees to radians
  DegToRad NUMBER := 57.29577951;
  vresult  number;

BEGIN
  begin
    vResult := ACOS(COS(0.017453293 * (90 - lat1)) *
                    COS(0.017453293 * (90 - lat2)) +
                    SIN(0.017453293 * (90 - lat1)) *
                    SIN(0.017453293 * (90 - lat2)) *
                    COS(0.017453293 * (lon1 - lon2))) * 6371;
  exception
    when others then
      vResult := 0;
  end;
  return vResult;
END distance;
end ALG_INTDST;
/
