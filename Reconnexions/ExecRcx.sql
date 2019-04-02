Spool ExecRcx.log

Set Serveroutput on size unlimited;
Declare
vCr number(1);
vIdtInt X7.INT.IdtInt%type;
Begin
For rCur in (Select * from ALG_INTRCX) loop
    ALG_GnrInt( pIdtClt     => rCur.IdtClt,
                pIdtCtr     => rCur.IdtCtr,
                pIdtPntLvr  => rCur.IdtPntLvr,
                pIdtPntCpg  => rCur.IdtPntCpg,
                pIdtCprAvn  => rCur.IdtCpr,
                pIdtCntOpr  => rCur.IdtCntOpr_Clt,
                pIdtSrv     => 1,
                pIdtCtlAct  => 5,
                pDatDem     => Sysdate,
                pDatEffExe  => Sysdate,
                pIdtAgt     => 'X7',
                pSta        => '4',
                pIdtInt     => vIdtInt,
                pCR         => vCr);
end loop;
end;
/

spool off