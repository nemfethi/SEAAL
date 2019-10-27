Create or Replace Function to_date_fne (pDate in varchar2, pFormat in varchar2) return Date is
vResult date;
Begin
vResult := to_date(pDate, pFormat);
return vResult;
exception
  when others then
    vResult:=null;
return vResult;
end to_date_fne;
/