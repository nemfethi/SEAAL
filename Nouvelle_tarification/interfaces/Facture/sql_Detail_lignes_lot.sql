Select LgnFac.idtfac    LgnFac_IdtFac,
       LgnFac.numlgnfct LgnFac_NumLgnFct,
       LgnFac.idtctr    LgnFac_IdtCtr,
       LgnFac.numavn    LgnFac_numavn,
       LgnFac.idtrbq    LgnFac_IdtRbq,
       LgnFac.idttax    LgnFac_IdtTax,
       HstTax.Tau       LgnFac_TauTva,
       LgnFac.qtefct    LgnFac_qtefct,
       LgnFac.prxunt    LgnFac_prxunt,
       LgnFac.mntht     LgnFac_mntht,
       LgnFac.mnttva    LgnFac_mnttva,
       LgnFac.untmsr    LgnFac_untmsr,
       DetLgn.Idtdetlgn DetLgn_Idtdetlgn,
       DetLgn.Lib       DetLgn_Tranche,
       DetLgn.Qtefct    DetLgn_Qtefct,
       DetLgn.Prxunt    DetLgn_Prxunt,
       DetLgn.Mntht     DetLgn_Mntht,
       DetLgn.Mnttva    DetLgn_Mnttva,
       DetLgn.Numtrn    DetLgn_Numtrn
  from FAC, LGNFAC, DETLGN, HSTTAX
 where Fac.idtFac = LgnFac.IdtFac
   and LgnFac.idtfac = detlgn.idtfac(+)
   and LgnFac.numlgnfct = detlgn.numlgnfct(+)
   and Fac.IdtLotFac='" + ((String)globalMap.get("vLot"))+"'
   and Nvl(RbqCmm,0) = 0
   and LgnFac.IdtTax = HSTTax.IDTTax (+)
  and LgnFac.DatDbtVld = HSTTax.DatDbtVld(+)
 order by LgnFac.Idtfac,LgnFac.Numlgnfct, detlgn.idtdetlgn
