whenever sqlerror exit -1

REM Le fichier SPOOL est ajouté au log du batch:
SPOOL %LOG_DIR%\%LOG_FILE% append

truncate table eeln_lstrtg;

insert into eeln_lstrtg
SELECT DISTINCT OPR.IdtOpr,  
 TYPOPR.IdtTypRtg,CLT.IdtClt,1  idtcptclt , idttypfct, CLT.AncRfr, opr.sld, rfr, ctrfac.idtprdfac, PNTCPG.idttrntyp, fac.idtfac
FROM TYPOPR,X7.CLT CLT,OPR ,  FAC, X7.ctr   , ctrfac, pntcpg
WHERE    ctrfac.idtfac = fac.idtfac 
and TYPOPR.IdtTypOpr = OPR.IdtTypOpr   
AND  CLT.IdtClt  = OPR.IdtClt   
AND  TYPOPR.IdtTypRtg IS NOT NULL   
AND not exists (SELECT A.idtopr FROM RTG a, LOTRTG g WHERE     a.IdtOpr = OPR.IdtOpr AND a.IdtLotRtg = g.IdtLotRtg AND g.DatFinRtg IS NULL)   
AND not exists (SELECT B.idtopr FROM LSTRTG b WHERE b.IdtOpr = OPR.IdtOpr)     
AND FAC.IDTCLT = OPR.IDTCLT 
AND FAC.NUMFCT = OPR.RFR 
AND PNTCPG.idtpntcpg = ctr.idtpntcpg   
AND PNTCPG.idtpntlvr = ctr.idtpntlvr   
and ctr.idtctr=ctrfac.idtctr
AND OPR.Sld > 0 ;

commit;

EXIT
/
