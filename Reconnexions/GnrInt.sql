Create or replace PROCEDURE ALG_GnrInt  ( pIdtClt     IN X7.INT.IdtClt%TYPE,
                                          pIdtCtr     IN X7.INT.IdtCtr%TYPE,
                                          pIdtPntLvr  IN X7.INT.IdtPntLvr%TYPE,
                                          pIdtPntCpg  IN X7.INT.IdtPntCpg%TYPE,
                                          pIdtCprAvn  IN X7.INT.IdtCprAvn%TYPE,
                                          pIdtCntOpr  IN X7.INT.IdtCntOpr%TYPE,
                                          pIdtSrv     IN X7.INT.IdtSrv%TYPE,
                                          pIdtCtlAct  IN X7.INT.IdtCtlAct%TYPE,
                                          pDatDem     IN X7.INT.DatDem%TYPE,
                                          pDatEffExe  IN X7.INT.DatDem%TYPE,
                                          pIdtAgt     IN X7.INT.IdtAgt%type,
                                          pSta        IN X7.INT.Sta%TYPE,
                                          pIdtInt     out X7.INT.IdtInt%TYPE,
                                          pCR         OUT NUMBER )
IS
  vDmtPntCpg PNTCPG.Dmt%TYPE;
  vIdtDspAvn DSP.IDTDSP%TYPE;
  vIdtInt X7.Int.IdtInt%type;
BEGIN
  -- vCR:= 0;
  /*Recherche de IdtInt */
  Select Seq_int.NextVal into vIdtInt from dual; 
  
  /* Recherche autre infos*/
  -- Diamètre
  SELECT PNTCPG.Dmt
  INTO   vDmtPntCpg
  FROM   PNTCPG
  WHERE  IDTPNTCPG = pIdtPntCpg
  AND    IDTPNTLVR = pIdtPntLvr;

  -- Information dispositif
  BEGIN
    SELECT IDTDSP
    INTO vIdtDspAvn
    FROM DSPCPR
    WHERE DATDPS IS NULL
      AND IDTCPR = pIdtCprAvn;
  EXCEPTION
    WHEN NO_DATA_FOUND THEN
      vIdtDspAvn := NULL;
  END;

  INSERT INTO INT ( IdtInt,
                    IdtClt,
                    IdtCtr,
                    IdtPntLvr,
                    IdtPntCpg,
                    DmtPntCpg,
                    IdtCprAvn,
                    IdtCntOpr,
                    IdtSrv,
                    IdtCtlAct,
                    DatDem,
                    Sta,
                    IdtDspAvn )
  VALUES (  vIdtInt,
            pIdtClt,
            pIdtCtr,
            pIdtPntLvr,
            pIdtPntCpg,
            vDmtPntCpg,
            DECODE(pIdtCprAvn,0,NULL,pIdtCprAvn),
            pIdtCntOpr,
            pIdtSrv ,
            pIdtCtlAct,
            pDatDem ,
            3,
            vIdtDspAvn ) Returning IdtInt into vIdtInt;
  pIdtInt := vIdtInt;

  TRTINT01_SPC.GnrInt(pIdtInt);
  Dbms_OutPut.put_line('Intervention reconnexion Créée, IdtPntLvr = '||pIdtPntLvr|| ', IdtPntCpg= '||pIdtPntCpg || ', Intervention='||vIdtInt);

  /*Mise à Exécution*/
  Update Int 
  Set Sta = 4, IdtAgt=pIdtAgt, DatEffExe = Sysdate 
  where IdtInt = vIdtInt;
    Dbms_OutPut.put_line('Intervention reconnexion Exécutée,  Intervention = '||vIdtInt);
  exception
    when others then
      Dbms_OutPut.put_line('Erreur Pendant Création reconnexion, IdtPntLvr = '||pIdtPntLvr|| ', IdtPntCpg= '||pIdtPntCpg);
      Dbms_OutPut.put_line(SQLERRM);

  -- pCR:= vCR;
END ALG_GnrInt;
/