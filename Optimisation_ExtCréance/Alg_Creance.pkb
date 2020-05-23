create or replace package body Alg_Creance
as
--------------------------------------------------------------------------------
-- Package de traitement de la créance SEAAL --
-- insertion de la donnée finale dans X7_SLDOPR
--------------------------------------------------------------------------------

--------------------------------------------------------------------------------
-- Fonctions --
--------------------------------------------------------------------------------

--------------------------------------------------------------------------------
-- détails des opérations avec lettrage --
-- prendre la date (trunquee) et le montant des lettrages pour les opérations débitrices et créditrices
-- on exclut les écéanciers
--------------------------------------------------------------------------------
function DetLttOprCrc( pIdtClt Clt.IdtClt%type ) return typLst_LttOprCrc pipelined is
  Cursor cCur is
  select OPR.IdtClt,
        OPR.IdtCptClt,
        OPR.IdtTypOpr,
        OPR.IdtOpr,
        OPR.DatCrt DatCrtOpr,
        OPR.DatExg DatExg,
        OPR.Rfr Rfr,
        a.IDTLTT,
        CASE
          WHEN TRUNC(A.DatCrtLtt) < TRUNC(OPR.DatCrt) THEN
          TRUNC(OPR.DatCrt)
          ELSE
          TRUNC(A.DatCrtLtt)
        END DatCrt,
        a.mnt
  from OPR,
        TYPOPR,
        NTROPR,
        (SELECT LTTDBT.IdtOprDbt idtopr,
                LTTDBT.IDTLTT,
                -LTTDBT.Mnt      Mnt,
                LTTDBT.DatCrt    DatCrtLtt
          FROM LTT LTTDBT, OPR OPRCRT
          WHERE OPRCRT.IdtOpr = LTTDBT.IdtOprCrt
            AND OPRCRT.IdtTypOpr <> 6
            and OPRCRT.idtclt = pIdtClt
            And OprCrt.IdtCptClt = 1
        UNION ALL
        SELECT LTTCRT.IdtOprCrt,
                LTTCRT.IDTLTT,
                LTTCRT.Mnt       Mnt,
                LTTCRT.DatCrt    DatCrtLtt
          FROM LTT LTTCRT) a
  where OPR.idtopr = a.idtopr
    and OPR.idtclt = pIdtClt
    And Opr.IdtCptClt = 1
    and NTROPR.IdtNatOpr = TYPOPR.IdtNatOpr
    AND TYPOPR.IdtTypOpr = OPR.IdtTypOpr
    and NTROPR.Fin = 1; 
  rCur typLttOprCrc;
  type typCUR is table of cCur%ROWTYPE index by binary_integer;
  tCur typCUR;
  begin
    open cCur;
    fetch cCur
      bulk collect into tCur;
    close cCur;
    for i in 1..tCur.Count loop
      rCur.IdtClt    := tCur(i).IdtClt;
      rCur.IdtCptClt := tCur(i).IdtCptClt;
      rCur.IdtTypOpr := tCur(i).IdtTypOpr;
      rCur.IdtOpr    := tCur(i).IdtOpr;
      rCur.DatCrtOpr := tCur(i).DatCrtOpr;
      rCur.DatExg    := tCur(i).DatExg;
      rCur.Rfr       := tCur(i).Rfr;
      rCur.DatCrt    := tCur(i).DatCrt;
      rCur.IdtLtt    := tCur(i).IdtLtt;
      rCur.mnt       := tCur(i).mnt;
      PIPE ROW(rCur); 
    end loop;
    return ;
end DetLttOprCrc;

--------------------------------------------------------------------------------
-- détails des opérations liées à un échéancier --
-- prendre la date (trunquee) et le montant des lettrages pour les factures dans une échéance --
--------------------------------------------------------------------------------  
function DetLttEchCrc( pIdtClt Clt.IdtClt%type ) return typLst_LttOprCrc pipelined is
  Cursor cCur is
  SELECT FX.IdtClt_OprEch    IdtClt,
        FX.IdtCptClt_OprEch IdtCptClt,
        FX.IdtTypOpr_OprFac IdtTypOpr,
        FX.IdtOpr_OprFac    IdtOpr,
        FX.DatCrt_OprFac    DatCrtOpr,
        FX.DatExg_OprFac    DatExg,
        FX.rfr_fac          Rfr,
        LTTRGL.IdtLtt,
        CASE
          WHEN TRUNC(LTTRGL.DatCrt) < TRUNC(FX.DatCrt_OprFac) THEN TRUNC(FX.DatCrt_OprFac)
          ELSE TRUNC(LTTRGL.DatCrt)
        END DatCrt,
        -SUM(DETLTT_VIEW1.Lgn_MntTtc) Mnt
  FROM DETLTT_VIEW1,
        FAC,
        (SELECT OprEch.IdtOpr IdtOprEch,
                OprEch.IdtClt IdtClt_OprEch,
                OprEch.IdtCptClt IdtCptClt_OprEch,
                OprEch.EchPmt rfr_ech,
                ABS(OprEch.mnt) mntech,
                OprFac.rfr rfr_fac,
                OprFac.mnt mntfac,
                ltt.mnt mntfacech,
                OPRFAC.DatCrt DatCrt_OprFac,
                OPRFAC.IdtTypOpr IdtTypOpr_OprFac,
                OPRFAC.IdtOpr IdtOpr_OprFac,
                OPRFAC.DatExg DatExg_OprFac,
                OPRFAC.IDTCLT IdtClt_OprFac
          FROM opr OprEch, ltt, opr OprFac
          WHERE OprFac.idttypopr NOT IN (8, 24)
            AND OprFac.idtopr = ltt.idtoprdbt
            AND OprFac.IdtClt = pIdtClt
            AND OprFac.IdtCptClt = 1
            AND ltt.mnt > 0
            AND ltt.idtoprcrt = OprEch.idtopr
            AND OprEch.idttypopr IN (6, 20)
            AND OprEch.IdtClt = pIdtClt
            AND OprEch.IdtCptClt = 1
            ) FX,
        OPR OPRRGL,
        OPR OPRECH7,
        LTT LTTRGL
  WHERE OPRECH7.IdtOpr = LTTRGL.IdtOprDbt
    AND FX.Rfr_Ech = OPRECH7.EchPmt
    AND FX.Rfr_Fac = FAC.NumFct(+)
    AND OPRRGL.IdtOpr = LTTRGL.IdtOprCrt
    AND OPRRGL.IdtTypOpr NOT IN (6, 11)
    AND OprRgl.IdtClt = pIdtClt
    AND OprRgl.IdtCptClt = 1  
    AND DETLTT_VIEW1.IdtLtt = LTTRGL.IdtLtt
    AND NVL(DETLTT_VIEW1.IdtFac, 0) = NVL(FAC.IdtFac, 0)
    AND OPRECH7.IdtClt = pIdtClt
    AND OPRECH7.IdtCptClt = 1
  GROUP BY FX.IdtClt_OprEch,
          FX.IdtCptClt_OprEch,
          FX.IdtTypOpr_OprFac,
          FX.IdtOpr_OprFac,
          FX.DatCrt_OprFac,
          FX.DatExg_OprFac,
          FX.rfr_fac,
          LTTRGL.IdtLtt,
          CASE
            WHEN TRUNC(LTTRGL.DatCrt) < TRUNC(FX.DatCrt_OprFac) THEN
              TRUNC(FX.DatCrt_OprFac)
            ELSE
              TRUNC(LTTRGL.DatCrt)
          END; 
  rCur typLttOprCrc;
  type typCUR is table of cCur%ROWTYPE index by binary_integer;
  tCur typCUR;
  begin
    open cCur;
    fetch cCur
      bulk collect into tCur;
    close cCur;
    for i in 1..tCur.Count loop
      rCur.IdtClt    := tCur(i).IdtClt;
      rCur.IdtCptClt := tCur(i).IdtCptClt;
      rCur.IdtTypOpr := tCur(i).IdtTypOpr;
      rCur.IdtOpr    := tCur(i).IdtOpr;
      rCur.DatCrtOpr := tCur(i).DatCrtOpr;
      rCur.DatExg    := tCur(i).DatExg;
      rCur.Rfr       := tCur(i).Rfr;
      rCur.IdtLtt    := tCur(i).IdtLtt;
      rCur.DatCrt    := tCur(i).DatCrt;
      rCur.mnt       := tCur(i).mnt;
      PIPE ROW(rCur); 
    end loop;
    return ;
end DetLttEchCrc;

--------------------------------------------------------------------------------
-- détails de toutes les opérations 
--------------------------------------------------------------------------------
function DetLttOprAllCrc( pIdtClt Clt.IdtClt%type ) return typLst_LttOprCrc pipelined is
  Cursor cCur is
  SELECT IdtClt,
        IdtCptClt,
        OPR.IdtTypOpr,
        IdtOpr,
        DatCrt DatCrtOpr,
        DatExg,
        Rfr,
        0 IdtLtt,
        TRUNC(DatCrt) DatCrt,
        Mnt
  from OPR, TypOpr, NtrOpr
    Where NTROPR.IdtNatOpr = TYPOPR.IdtNatOpr
    AND TYPOPR.IdtTypOpr = OPR.IdtTypOpr
    and NTROPR.Fin = 1
    and OPR.IdtClt = pIdtClt
    and Opr.IdtCptClt = 1; 
  rCur typLttOprCrc;
  type typCUR is table of cCur%ROWTYPE index by binary_integer;
  tCur typCUR;
  begin
    open cCur;
    fetch cCur
      bulk collect into tCur;
    close cCur;
    for i in 1..tCur.Count loop
      rCur.IdtClt    := tCur(i).IdtClt;
      rCur.IdtCptClt := tCur(i).IdtCptClt;
      rCur.IdtTypOpr := tCur(i).IdtTypOpr;
      rCur.IdtOpr    := tCur(i).IdtOpr;
      rCur.DatCrtOpr := tCur(i).DatCrtOpr;
      rCur.DatExg    := tCur(i).DatExg;
      rCur.Rfr       := tCur(i).Rfr;
      rCur.IdtLtt    := tCur(i).IdtLtt;
      rCur.DatCrt    := tCur(i).DatCrt;
      rCur.mnt       := tCur(i).mnt;
      PIPE ROW(rCur); 
    end loop;
    return ;
end DetLttOprAllCrc;

--------------------------------------------------------------------------------
-- Traitement de la créance par client --
--------------------------------------------------------------------------------
procedure TRTAGECRECLT(pDatTrt IN Date, pIdtClt CLT.IdtClt%type) is
  type typLst_X7_SldOpr is table of x7_SLDOPR_FNE%rowtype index by binary_integer;
  tCur_X7_SldOpr typLst_X7_SldOpr;
  errors         PLS_INTEGER;
begin
  SELECT idtclt,
        idtcptclt,
        idttypopr,
        idtopr,
        DatCrtOpr DatCrt,
        datexg,
        rfr,
        datdeb,
        idtltt,
        datfin,
        mnt,
        sld, 
        pDatTrt DatTrt
    BULK COLLECT
    INTO tCur_X7_SldOpr
    from (SELECT IdtClt,
       IdtCptClt,
       IdtTypOpr,
       IdtOpr,
       DatCrtOpr DatCrtOpr,
       DatExg DatExg,
       Rfr Rfr,
       DatCrt DatDeb,
       MAX(IdtLtt) KEEP(DENSE_RANK LAST ORDER BY DatCrt) IdtLtt,
       LEAD(DatCrt, 1) OVER(PARTITION BY IdtClt, IdtCptClt, IdtTypOpr, IdtOpr ORDER BY DatCrt) - 0.00001 DatFin,
       SUM(Mnt) Mnt,
       MAX(Sld) KEEP(DENSE_RANK LAST ORDER BY DatCrt, IdtLtt) Sld
  FROM (SELECT IdtClt,
               IdtCptClt,
               IdtTypOpr,
               IdtOpr,
               DatCrtOpr DatCrtOpr,
               DatExg DatExg,
               Rfr Rfr,
               DatCrt,
               IdtLtt,
               Mnt,
               SUM(mnt) OVER(PARTITION BY IdtClt, IdtCptClt, IdtTypOpr, IdtOpr ORDER BY DatCrt, IdtLtt ROWS UNBOUNDED PRECEDING) Sld
          from (select *
                  from table(Alg_creance.DetLttOprCrc(pIdtClt))
                union all
                select *
                  from table(Alg_creance.DetLttEchCrc(pIdtClt))
                union all
                select *
                  from table(Alg_creance.DetLttOprAllCrc(pIdtClt))))
 GROUP BY IdtClt,
          IdtCptClt,
          IdtTypOpr,
          IdtOpr,
          DatCrtOpr,
          DatExg,
          Rfr,
          DatCrt) S
   where pDatTrt between trunc(datdeb) and
         nvl(trunc(datfin), to_date('31122099', 'ddmmyyyy'))
     and Sld <> 0
     and IdtClt = pIdtClt;
  forall i in tCur_X7_SldOpr.first .. tCur_X7_SldOpr.last save exceptions
    insert into x7_SLDOPR_FNE values tCur_X7_SldOpr(i);
    commit;
end TRTAGECRECLT;

--------------------------------------------------------------------------------
-- Traitement de la créance par date --
--------------------------------------------------------------------------------
procedure TRTAGECRE(pDatTrt IN Date) is
  Cursor cClt is
    select IdtClt from x7.clt 
    -- where IDTCLT LIKE 'RAI%*'
    -- where IdtCntOpr = '43'
    order by idtclt;
  type typLst_Clt is table of cClt%ROWTYPE index by binary_integer;
  tCur_Clt        typLst_Clt;
  vIdtClt x7.Clt.idtClt%type := 'XXXX';
  errors  PLS_INTEGER;
begin
  open cClt;
  loop
    fetch cClt bulk collect into tCur_Clt limit 50;
    for j in 1 .. tcur_CLT.count 
      loop
      vIdtClt := tcur_CLT(j).IdtClt;
      ALG_Creance.TRTAGECRECLT(pDatTrt, vIdtClt );
    end loop;
    exit when cClt%NOTFOUND;
  end loop;
  close cClt;
end TRTAGECRE;

--------------------------------------------------------------------------------
-- tache de Traitement automatique de la créance   --
--------------------------------------------------------------------------------
PROCEDURE TCHE_TRTAGECRE IS
  vDatTrt date;
  vIdtAgt varchar2(6) := 'BATCH';
  vModDcl varchar2(1) := 'B';
  vdate   date;
  vRowid varchar2(50);
BEGIN
  -- on s'assure que les dates sont correctement entr‚es
  vDatTrt := to_date('31122013', 'DDMMYYYY');--TRUNC(LAST_DAY(ADD_MONTHS(SYSDATE, -1)));
  vDate   := SYSDATE;

  INSERT INTO TCHE
    (IDTTYPTCHE, IDTAGT, DATDMD, MODDCL, PRM1, TYPENT, DATPRV)
  VALUES
    ('TRT5014',
     vIdtAgt,
     vdate,
     vModDcl,
     TO_CHAR(vDatTrt, 'YYYY/MM/DD'),
     'ITF',
     SYSDATE) returning rowidtochar(rowid) into vRowid;

  COMMIT;
  TRTAGECRE(vDatTrt);

  UPDATE TCHE
     SET DatRls = SYSDATE
   WHERE rowid=chartorowid(vRowid);

  COMMIT;
END TCHE_TRTAGECRE;

end Alg_Creance;
/