CREATE OR REPLACE PACKAGE BODY X7.Csscng01_Spc IS
-------------------------------------------------------------------------
-------------------------------------------------------------------------
-------------------------------------------------------------------------
PROCEDURE TRTLGNCSSCNG (pCngLgnCss CNGLGNCSS%ROWTYPE) IS
  vPmt number;
BEGIN
  select Pmt
    into vPmt
 from CNGTYPMVM
 where IdtTypMvmCng = pCngLgnCss.IdtTypMvmCng;
  if vPmt = 1 then
    update ALG_EAP
      set Ett = 1
      where (IdtClt, DatTrt) in (select IdtClt, DatTrt
                                   from ALG_EAP_VIEW1 b
                                   where IdtClt = pCngLgnCss.IdtClt
                                    and  trunc(pCNGLGNCSS.DatRgl) between nvl(trunc(b.DatTrt),pCNGLGNCSS.DatRgl-1) and nvl(trunc(b.DatTrtSvn),sysdate+1));
--    delete ALG_EAP
--      where (IdtClt, DatTrt) in (select IdtClt, DatTrt
--                                  from ALG_EAP_VIEW1 b
--                                  where IdtClt = pCngLgnCss.IdtClt
--                                   and  DatTrt < pCngLgnCss.DatRgl);
----                                   and  trunc(pCngLgnCss.DatRgl) between nvl(trunc(b.DatTrt),pCngLgnCss.DatRgl-1) and nvl(trunc(b.DatTrtSvn),sysdate+1))
  end if;
END TRTLGNCSSCNG;
-------------------------------------------------------------------------
-------------------------------------------------------------------------
-------------------------------------------------------------------------
PROCEDURE TRTCNG (pIdtCss CNGENT.IdtCss%TYPE,
                  pIdtCng CNGENT.IdtCng%TYPE)
  is
  vSitCng CNGENT.SitCng%TYPE;
  vRfrFic CNGENT.RfrFic%TYPE;
  vNbr    number;
  vNbr2   number;
BEGIN
--  DBMS_OUTPUT.PUT_LINE('DEBUT');
  select SitCng, RfrFic
    into vSitCng, vRfrFic
    from CNGENT
    where IdtCss = pIdtCss
     and  IdtCng = pIdtCng;
  -- Specifique SEAAL
  -- Pour les consignations non valides
  -- Si le fichier est deja integre on ne fait rien
  select count(*)
    into vNbr
    from X7.CNGANO, X7.CNGLGNCSS
    where CNGANO.IdtCss = CNGLGNCSS.IdtCss
     and  CNGANO.IdtCng = CNGLGNCSS.IdtCng
     and  CNGANO.IdtCss = pIdtCss
     and  CNGANO.IdtCng = pIdtCng
     and  CNGANO.IdtLgnCssCng is null;
  -- Si tous les ligne sont en erreur on ne fait rien
  select count(*)
    into vNbr2
    from (select IdtCss, IdtCng, IdtLgnCssCng from X7.CNGLGNCSS where IdtCss = pIdtCss and IdtCng = pIdtCng
          minus
          select IdtCss, IdtCng, IdtLgnCssCng from X7.CNGANO where IdtCss = pIdtCss and IdtCng = pIdtCng);
  if nvl(vSitCng,9) = 0 and vNbr = 0 and vNbr2 > 0 then
--  DBMS_OUTPUT.PUT_LINE('Integration');
    -- On efface l'historique des anomalies pour cette consignation
    delete CNGANOHST
      where IdtCss = pIdtCss
       and  IdtCng = pIdtCng;
    -- Historisation des anomalies
    insert into CNGANOHST (IDTCSS,
                           IDTCNG,
                           IDTLGNCSSCNG,
                           MSG_CODE,
                           INFCMP,
                           IDTCTRL)
                    select IDTCSS,
                           IDTCNG,
                           IDTLGNCSSCNG,
                           MSG_CODE,
                           INFCMP,
                           IDTCTRL
                      from CNGANO
                      where IdtCss = pIdtCss
                       and  IdtCng = pIdtCng;
    -- On efface les anomalies pour la consignation
    delete CNGANO
      where IdtCss = pIdtCss
       and  IdtCng = pIdtCng;
    -- Mise a jour du type de mouvement a 100 (Client avec erreur) pour pouvoir integrer
    update CNGLGNCSS
      set IdtTypMvmCng = 100,
          NbrAno       = 0
      where (IdtCss, IdtCng, IdtLgnCssCng) in (select IdtCss, IdtCng, IdtLgnCssCng
                                                 from CNGANOHST
                                                 where IdtCss = pIdtCss
                                                  and  IdtCng = pIdtCng);
    -- Mise a jour de l'entete de la consignation
    update CNGENT
      set (NbrPmtCng,
           TtlCng,
           SitCng)    = (select count(*), sum(nvl(MntPmt,0) + nvl(MntAvc,0)), max(1)
                           from CNGTYPMVM, CNGLGNCSS
                           where CNGTYPMVM.IdtTypMvmCng = CNGLGNCSS.IdtTypMvmCng
                            and  CNGLGNCSS.IdtCss = pIdtCss
                            and  CNGLGNCSS.IdtCng = pIdtCng
                            and  CNGTYPMVM.Pmt = 1)
      where IdtCss = pIdtCss
       and  IdtCng = pIdtCng;
    update CNGTTX
      set (NbrEncModRgl,
           TtlEncModRgl) = (select count(*), sum(nvl(MntPmt,0) + nvl(MntAvc,0))
                           from CNGLGNCSS
                           where CNGLGNCSS.IdtCss    = pIdtCss
                            and  CNGLGNCSS.IdtCng    = pIdtCng
                            and  CNGLGNCSS.IdtModRgl = CNGTTX.IdtModRgl)
      where IdtCss = pIdtCss
       and  IdtCng = pIdtCng;
    update ALG_EAPHST
      set Stt = 1
      where RfrFicIN = (select RfrFic
                             from CNGENT
                             where IdtCss = pIdtCss
                              and  IdtCng = pIdtCng)
       and  Stt = 0;
    vRfrFic := substr(replace(vRfrFic,'IN','OUT'),1,15);
    -- Avant de commencer l'integration il faudra verifier si le montant a affecter
    -- est inferieur au solde de l'operation au moment de l'integration
    -- On adjuste les montants affectes et l'avance pour ne pas faire planter
    update CNGLGNCSS
      set  (MntPmt, MntAvc) = (select least(OPR.Sld, CNGLGNCSS.MntPmt), (CNGLGNCSS.MNTPMT+CNGLGNCSS.MNTAVC) - least(OPR.Sld, CNGLGNCSS.MntPmt)
                                 from X7.OPR
                                 where OPR.IdtClt = CNGLGNCSS.IdtClt
                                  and  OPR.Rfr    = CNGLGNCSS.NumFct
                                  and  OPR.IdtTypOpr in (1,7))
      where MntPmt > (select least(OPR.Sld, CNGLGNCSS.MntPmt)
                        from X7.OPR
                           where OPR.IdtClt = CNGLGNCSS.IdtClt
                            and  OPR.Rfr    = CNGLGNCSS.NumFct
                            and  OPR.IdtTypOpr in (1,7))
       and  NumFct is not null
       and  IdtCss = pIdtCss
       and  IdtCng = pIdtCng;
--    delete ALG_EAP;
  end if;
END TRTCNG;
END Csscng01_Spc; 
/
