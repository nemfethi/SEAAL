create or replace procedure TRTAGECRE_new(pDatTrt IN Date) is
  Cursor cClt is
    select IdtClt from x7.clt 
    where IdtCntOpr = '43'
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
      TRTAGECRECLT(pDatTrt, vIdtClt );
    end loop;
    exit when cClt%NOTFOUND;
  end loop;
  close cClt;
end TRTAGECRE_new; 
/