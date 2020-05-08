Create or replace  
function FNE_NXTTABSEQIDTCLT(pSeq number) return varchar2
IS
vResult Varchar2(6);
BEGIN
  vResult := chr(mod(floor(pSeq/100000)-10, 26) + 65)|| substr(to_char(pSeq), 3);
	return vResult;
END FNE_NXTTABSEQIDTCLT;
/