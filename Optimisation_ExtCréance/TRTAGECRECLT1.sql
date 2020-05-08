create or replace procedure TRTAGECRECLT1(pDatTrt IN Date,
                                         pIdtClt CLT.IdtClt%type) is
  type typLst_X7_SldOpr is table of x7_SLDOPR%rowtype index by binary_integer;
  tCur_X7_SldOpr typLst_X7_SldOpr;
  errors         PLS_INTEGER;
begin

  SELECT idtclt,
        idtcptclt,
        idttypopr,
        idtopr,
        datdeb,
        idtltt,
        datfin,
        mnt,
        sld, 
        pDatTrt DatTrt,
        datcrtopr DatCrt,
        datexg,
        rfr
    BULK COLLECT
    INTO tCur_X7_SldOpr
    from sldopr_view1 S
   where pDatTrt between trunc(datdeb) and
         nvl(trunc(datfin), to_date('31122099', 'ddmmyyyy'))
     and Sld <> 0
     and IdtClt = pIdtClt;
  forall i in tCur_X7_SldOpr.first .. tCur_X7_SldOpr.last save exceptions
    insert into x7_SLDOPR values tCur_X7_SldOpr (i);
    commit;
end TRTAGECRECLT1;
/
