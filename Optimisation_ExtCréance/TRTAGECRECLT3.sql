create or replace procedure TRTAGECRECLT(pDatTrt IN Date,
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
    from sldopr_view3 S
   where pDatTrt between trunc(datdeb) and
         nvl(trunc(datfin), to_date('31122099', 'ddmmyyyy'))
     and Sld <> 0
     and IdtClt = pIdtClt;
  forall i in tCur_X7_SldOpr.first .. tCur_X7_SldOpr.last save exceptions
    insert into x7_SLDOPR_FNE values tCur_X7_SldOpr (i);
    commit;
end TRTAGECRECLT;
/
