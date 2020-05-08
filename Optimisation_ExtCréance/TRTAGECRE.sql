create or replace procedure TRTAGECRE(pDatTrt IN Date) is
  vIdtClt x7.Clt.idtClt%type := 'XXXX';
  errors  PLS_INTEGER;
  Cursor cClt is
    select IdtClt from x7.clt  order by idtclt;
  Cursor cSldOpr is
    select idtclt,
           idtcptclt,
           idttypopr,
           idtopr,
           datcrtopr,
           datexg,
           rfr,
           datdeb,
           idtltt,
           datfin,
           mnt,
           sld,
           pdattrt
      from sldopr_view1
     where pDatTrt between trunc(datdeb) and
           nvl(trunc(datfin), to_date('31122099', 'dd/mm/yyyy'))
       and Sld <> 0
       and IdtClt = vIdtClt;
  type typLst_X7_SldOpr is table of cSldOpr%ROWTYPE index by binary_integer;
  type typLst_Clt is table of cClt%ROWTYPE index by binary_integer;
  tCur_X7_SldOpr  typLst_X7_SldOpr;
  tCur_X7_SldOpr1 typLst_X7_SldOpr;
  tCur_Clt        typLst_Clt;
  vIdtopr         X7.Opr.IdtOpr%type;
  idx             integer;
begin
  open cClt;
  loop
    fetch cClt bulk collect
      into tCur_Clt limit 50;
    for j in 1 .. tcur_CLT.count 
      loop
      vIdtClt := tcur_CLT(j).IdtClt;
      open cSldOpr;
      loop
        fetch cSldOpr bulk collect
          into tCur_X7_SldOpr limit 1000;
        for  i in 1 .. tCur_X7_SldOpr.Count 
          loop
/*          insert into x7_SLDOPR.
            (idtclt,
             idtcptclt,
             idttypopr,
             idtopr,
             datcrt,
             datexg,
             rfr,
             datdeb,
             idtltt,
             datfin,
             mnt,
             sld,
             Dattrt)
          values tCur_X7_SldOpr(i);*/
                   begin
                     insert into x7_SLDOPR
            (idtclt,
             idtcptclt,
             idttypopr,
             idtopr,
             datcrt,
             datexg,
             rfr,
             datdeb,
             idtltt,
             datfin,
             mnt,
             sld,Dattrt)
           values (
           	 tCur_X7_SldOpr(i).idtclt,
             tCur_X7_SldOpr(i).idtcptclt,
             tCur_X7_SldOpr(i).idttypopr,
             tCur_X7_SldOpr(i).idtopr,
             tCur_X7_SldOpr(i).datcrtOpr,
             tCur_X7_SldOpr(i).datexg,
             tCur_X7_SldOpr(i).rfr,
             tCur_X7_SldOpr(i).datdeb,
             tCur_X7_SldOpr(i).idtltt,
             tCur_X7_SldOpr(i).datfin,
             tCur_X7_SldOpr(i).mnt,
             tCur_X7_SldOpr(i).sld,
             pDattrt);
             exception
               when others then dbms_output.put_line(sqlerrm);
               dbms_output.put_line('IdtOpr:  '||tCur_X7_SldOpr(i).idtopr);
               dbms_output.put_line('IdtClt:  '||tCur_X7_SldOpr(i).idtClt);
             end;
           end loop;
        commit;
        exit when cSldOpr%NOTFOUND;
      end loop;
      close cSldOpr;
    end loop;
    exit when cClt%NOTFOUND;
  end loop;
  close cClt;
end; 
