create or replace procedure TRTAGECRECLT4(pDatTrt IN Date,
                                         pIdtClt CLT.IdtClt%type) is
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
               SUM(Mnt) OVER(PARTITION BY IdtClt, IdtCptClt, IdtTypOpr, IdtOpr ORDER BY DatCrt, IdtLtt ROWS UNBOUNDED PRECEDING) Sld
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
    insert into x7_SLDOPR_FNE values tCur_X7_SldOpr (i);
    commit;
end TRTAGECRECLT4;
/
