CREATE OR REPLACE PACKAGE BODY X7_TRTSEQ01
IS
-- ==========================================================================
-- Creation : 
-- ==========================================================================
-----------------------------------------------------------------------------
-- Maj     : 26/06/01
-- Par     : X7 COLOMBIE
-- Contenu : En X7_AttNumFac se agrega una condicion para validar si el caracter 
--           de relleno es nulo y armar el n�mero de factura
-----------------------------------------------------------------------------
-- Maj     : 07/04/2003  
-- Par     : HNG
-- Contenu : fiche 871  
--           Modification de la procedure X7_AttNumFac (ajout du test NVL(vNbCar,0) != 0) 
-----------------------------------------------------------------------------
-- Maj     : 23/08/2004 
-- Par     : HNG 
-- Contenu : Fiche 971  
--           Ajout de la procedure X7_AttNumChtSit                                    
-----------------------------------------------------------------------------
-- Maj     : 30/11/2004             
-- Par     : HNG  
-- Contenu : Fiche  3426 
--           Passage de l'identifiant du contrat sur 10 caractere           
-----------------------------------------------------------------------------
-- Maj     : 10/03/2006 
-- Par     : JCD 
-- Contenu : Ajout de la fonction de version qui retourne le numero *
-- de version du package
--
--    ***
--     ATTENTION!!!!:
--     Penser a modifier ce numero de version a chaque mise a jour du package!!
--    ***
--           Fiche 4209 
-----------------------------------------------------------------------------
-- Maj     : 6 4 17           
-- Par     : BPZ    
-- Contenu : 14757: code client + d'1 million   
-- ==========================================================================
--
--
--
--Variables globales para el manejo de errores 
--Se genera una excepcion "when others" que llama al 
--Procedimiento trtmsg01.msgerr.
--Los parametros de entrada son:

  Err_IdtPck    varchar2(40) := 'X7_TRTSEQ01';
  Err_IdtTrt    varchar2(40);
  Err_Msg       varchar2(255):= null;
  Err_IdtClt    CLT.IdtClt%TYPE  := null;
  Err_IdtCtr    CTR.IdtCtr%TYPE  := null;
  Err_IdtCpr    CPR.IdtCpr%TYPE  := null;
  Err_NumCpr    CPR.NumCpr%TYPE  := null;
  Err_IdtFac    FAC.IdtFac%TYPE  := null;
  Err_NumFac    FAC.NumFct%TYPE  := null;
  Err_IdtOprDbt OPR.IdtOpr%TYPE  := null;
  Err_IdtOprCrt OPR.IdtOpr%TYPE  := null;
  Err_TableName trtmsg01.TableType := trtmsg01.MakeTable;
  err_stack     long;
-----------------------------------------------------------------------------
-----------------------------------------------------------------------------
-----------------------------------------------------------------------------
-- A MODIFIER A CHAQUE MODIF DU PACKAGE!!!
FUNCTION VersionPkg
--        --------- Version du package utilise
  RETURN NUMBER
IS
BEGIN
  RETURN 71800.001;
END;
-----------------------------------------------------------------------------
-----------------------------------------------------------------------------
-----------------------------------------------------------------------------
PROCEDURE X7_NXTTABSEQ 
	(pIdtTabSeq IN  TabSeq.IdtTabSeq%TYPE,
	pValTabSeq OUT TabSeq.ValTabSeq%TYPE)
is
	vValTabSeq number;
begin
	trtmsg01.InsertItem(Err_TableName,'X7_NXTTABSEQ');
	
	select ValTabSeq + 1
	  into vValTabSeq 
	  from TabSeq 
	where  IdtTabSeq = pIdtTabSeq
	   for update of ValTabSeq;
	Update TabSeq 
	   set ValTabSeq = vValTabSeq
	 where IdtTabSeq = pIdtTabSeq;
	
    pValTabSeq := vValTabSeq;
    
	trtmsg01.DeleteItem(Err_TableName);
end X7_NXTTABSEQ;
-----------------------------------------------------------------------------
-----------------------------------------------------------------------------
-----------------------------------------------------------------------------
PROCEDURE X7_NXTTABSEQIDTCLT(
	pIDTCLT		out CLT.IDTCLT%type)
IS
	--vValTabSeq	TabSeq.ValTabSeq%TYPE;
	vValTabSeq	number;
	vIDTPYSADRSTR	prmgnr.IDTPYSADRSTR%type;
	vAlpha		varchar2(26) := 'ABCDEFGHIJKLMNOPQRSTUVWXYZ';
	vNbM		number(2);
BEGIN
	X7_NXTTABSEQ('SEQCLT',vValTabSeq);
	select IDTPYSADRSTR into vIDTPYSADRSTR from prmgnr;
	if vIDTPYSADRSTR = 'SEAAL' then
		if vValTabSeq >= 1000000 then
			pIDTCLT := chr(mod(floor(vValTabSeq/100000)-10, 26) + 65) || substr(to_char(vValTabSeq), 3);
			return;
		else
			pIDTCLT := to_char(vValTabSeq);
		end if;
	end if;
	pIDTCLT := to_char(vValTabSeq);
	return;
END X7_NXTTABSEQIDTCLT;

-----------------------------------------------------------------------------
-----------------------------------------------------------------------------
-----------------------------------------------------------------------------
PROCEDURE X7_AttNumFac
	(pIdtTypFct IN  fac.idttypfct%type,
	pnumfct    OUT fac.numfct%type)
IS
	vIdtTabSeq  TabSeq.IdtTabSeq%TYPE; 
	vValTabSeq  TabSeq.ValTabSeq%TYPE;
	vPrfNmrFct  TypFct.PrfNmrFct%TYPE; 
	vNbCar      TypFct.NbCar%TYPE; 
	vPadCar     TypFct.PadCar%TYPE; 
BEGIN
	trtmsg01.InsertItem(Err_TableName,'X7_ATTNUMFAC');
	--dbms_output.put_line('typfct');
	--dbms_output.put_line(pIdttypfct);
	select IdtTabSeq, 
	      PrfNmrFct, 
	      NbCar , 
	      PadCar
	 into vIdtTabSeq,
	      vPrfNmrFct,
	      vNbCar,
	      vPadCar
	 from Typfct
	where TypFct.idtTypFct = pIdtTypFct;

	X7_TrtSeq01.X7_NxtTabSeq (vIdtTabSeq,vValTabSeq);
	-----------------------------
	-- X7 - Colombia : 26 06 01
	-- Se valida si vPadCar is nulo. Esto es porque si no se tiene caracter
	-- de relleno, devuelve null como n�mero de factura.
	-----------------------------
	if vPadCar is not null AND NVL(vNbCar,0) != 0 THEN
		 pNumFct := vPrfNmrFct || lpad(to_char(vValTabSeq),vNbCar,vPadCar);
	else
		 pNumFct := vPrfNmrFct || to_char(vValTabSeq);
	end if;
	
	trtmsg01.DeleteItem(Err_TableName);
END X7_AttNumFac;
-----------------------------------------------------------------------------
-----------------------------------------------------------------------------
-----------------------------------------------------------------------------
PROCEDURE X7_AttNumLgnCss
	(pIdtTypMvm IN  TypMvm.IdtTypMvm%type,
	pIdtLgnCss OUT LgnCss.IdtLgnCss%type)
IS
	vIdtTabSeq  TabSeq.IdtTabSeq%TYPE; 
	vValTabSeq  TabSeq.ValTabSeq%TYPE;
BEGIN
	trtmsg01.InsertItem(Err_TableName,'X7_AttNumLgnCss');
	
	select IdtTabSeq
	 into vIdtTabSeq
	 from TypMvm
	where TypMvm.IdtTypMvm = pIdtTypMvm;
	
	X7_TrtSeq01.X7_NxtTabSeq (vIdtTabSeq,vValTabSeq);
	
	pIdtLgnCss := vValTabSeq;
	
	trtmsg01.DeleteItem(Err_TableName);
END X7_AttNumLgnCss;
-----------------------------------------------------------------------------
-----------------------------------------------------------------------------
-----------------------------------------------------------------------------
PROCEDURE X7_AttNumLetRel
	(pNumLetRel    OUT OPR.RFR%type)
IS
	vValTabSeq  TabSeq.ValTabSeq%TYPE;
	vPrfx       TypOpr.Prfx%TYPE; 
BEGIN
	X7_TrtSeq01.X7_NxtTabSeq ('LETREL',vValTabSeq);
	select prfx 
	 into vprfx
	 from typopr
	where idttypopr = 50;
	pNumLetRel := vPrfx || lpad(vValTabSeq,6,'0');
END X7_AttNumLetRel;
-----------------------------------------------------------------------------
-----------------------------------------------------------------------------
-----------------------------------------------------------------------------
PROCEDURE X7_ATTNUMCHTSIT(
		  pRfr       IN  OPR.RFR%TYPE,
		  pNumChgSitDbt OUT OPR.RFR%TYPE,
		  pNumChgSitCrt OUT OPR.RFR%TYPE )
IS
	vValTabSeq  TABSEQ.ValTabSeq%TYPE;
	vPrfxDbt    TYPOPR.PRFX%TYPE;
	vPrfxCrt    TYPOPR.PRFX%TYPE;
	vSprCdf     PRMGNR.SPRCDF%TYPE;
BEGIN
	
	pNumChgSitCrt := NULL;
	pNumChgSitDbt := NULL;

	X7_TRTSEQ01.X7_NxtTabSeq ('CHTSIT', vValTabSeq);
	-- Recuperation des prefixes des types d'operation changement de situation (credit et debit) 
	SELECT SITCRT.Prfx, SITDBT.Prfx
	INTO   vPrfxCrt, vPrfxDbt
	FROM   TYPOPR SITCRT,	
		   TYPOPR SITDBT
	WHERE SITCRT.IdtTypOpr = 16
		AND	SITDBT.IdtTypOpr = 15;

	-- Recuperation du caratere separateur 
	SELECT SprCdf INTO vSprCdf FROM PRMGNR;
		
	pNumChgSitCrt := vPrfxCrt || vSprCdf || pRfr || vSprCdf || vValTabSeq;
	pNumChgSitDbt := vPrfxDbt || vSprCdf || pRfr || vSprCdf || vValTabSeq;

END X7_ATTNUMCHTSIT;

END X7_TRTSEQ01;
/

