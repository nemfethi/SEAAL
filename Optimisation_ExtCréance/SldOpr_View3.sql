Create Or Replace View SldOpr_View3 as
SELECT IdtClt,
            IdtCptClt,
            IdtTypOpr,
            IdtOpr,
            DatCrtOpr DatCrtOpr,
            DatExg DatExg,
            Rfr Rfr,
            DatCrt DatDeb,
            MAX (IdtLtt) KEEP (DENSE_RANK LAST ORDER BY DatCrt) IdtLtt,
            LEAD ( DatCrt, 1) OVER (PARTITION BY IdtClt, IdtCptClt, IdtTypOpr, IdtOpr ORDER BY DatCrt) - 0.00001 DatFin,
            SUM (Mnt) Mnt,
            MAX (Sld) KEEP (DENSE_RANK LAST ORDER BY DatCrt, IdtLtt) Sld
       FROM (
SELECT IdtClt,
       IdtCptClt,
       IdtTypOpr,
       IdtOpr,
       DatCrtOpr DatCrtOpr,
       DatExg DatExg,
       Rfr Rfr,
       DatCrt,
       IdtLtt,
       Mnt,
       SUM(Mnt) OVER(PARTITION BY IdtClt, IdtCptClt, IdtTypOpr, IdtOpr ORDER BY DatCrt, IdtLtt ROWS UNBOUNDED PRECEDING) Sld
  from (select OPR.IdtClt,
               OPR.IdtCptClt,
               OPR.IdtTypOpr,
               OPR.IdtOpr,
               OPR.DatCrt DatCrtOpr,
               OPR.DatExg DatExg,
               OPR.Rfr Rfr,
               a.IDTLTT,
               CASE
                 WHEN TRUNC(A.DatCrtLtt) < TRUNC(OPR.DatCrt) THEN
                  TRUNC(OPR.DatCrt)
                 ELSE
                  TRUNC(A.DatCrtLtt)
               END DatCrt,
               a.mnt
          from OPR,
               TYPOPR,
               NTROPR,
               (SELECT LTTDBT.IdtOprDbt idtopr,
                       LTTDBT.IDTLTT,
                       -LTTDBT.Mnt      Mnt,
                       LTTDBT.DatCrt    DatCrtLtt
                  FROM LTT LTTDBT, OPR OPRCRT
                 WHERE OPRCRT.IdtOpr = LTTDBT.IdtOprCrt
                   AND OPRCRT.IdtTypOpr <> 6
                UNION ALL
                SELECT LTTCRT.IdtOprCrt,
                       LTTCRT.IDTLTT,
                       LTTCRT.Mnt       Mnt,
                       LTTCRT.DatCrt    DatCrtLtt
                  FROM LTT LTTCRT) a
         where OPR.idtopr = a.idtopr
              --and OPR.idtclt = '21207'
           and NTROPR.IdtNatOpr = TYPOPR.IdtNatOpr
           AND TYPOPR.IdtTypOpr = OPR.IdtTypOpr
           and NTROPR.Fin = 1
        union all
        SELECT FX.IdtClt_OprEch    IdtClt,
               FX.IdtCptClt_OprEch IdtCptClt,
               FX.IdtTypOpr_OprFac IdtTypOpr,
               FX.IdtOpr_OprFac    IdtOpr,
               FX.DatCrt_OprFac    DatCrtOpr,
               FX.DatExg_OprFac    DatExg,
               FX.rfr_fac          Rfr,
               LTTRGL.IdtLtt,
               CASE
                 WHEN TRUNC(LTTRGL.DatCrt) < TRUNC(FX.DatCrt_OprFac) THEN
                  TRUNC(FX.DatCrt_OprFac)
                 ELSE
                  TRUNC(LTTRGL.DatCrt)
               END DatCrt,
               -SUM(DETLTT_VIEW1.Lgn_MntTtc)
          FROM DETLTT_VIEW1,
               FAC,
               (SELECT OprEch.IdtOpr IdtOprEch,
                       OprEch.IdtClt IdtClt_OprEch,
                       OprEch.IdtCptClt IdtCptClt_OprEch,
                       OprEch.EchPmt rfr_ech,
                       ABS(OprEch.mnt) mntech,
                       OprFac.rfr rfr_fac,
                       OprFac.mnt mntfac,
                       ltt.mnt mntfacech,
                       OPRFAC.DatCrt DatCrt_OprFac,
                       OPRFAC.IdtTypOpr IdtTypOpr_OprFac,
                       OPRFAC.IdtOpr IdtOpr_OprFac,
                       OPRFAC.DatExg DatExg_OprFac,
                       OPRFAC.IDTCLT IdtClt_OprFac
                  FROM opr OprEch, ltt, opr OprFac
                 WHERE OprFac.idttypopr NOT IN (8, 24)
                   AND OprFac.idtopr = ltt.idtoprdbt
                   AND ltt.mnt > 0
                   AND ltt.idtoprcrt = OprEch.idtopr
                   AND OprEch.idttypopr IN (6, 20)) FX,
               OPR OPRRGL,
               OPR OPRECH7,
               LTT LTTRGL
         WHERE OPRECH7.IdtOpr = LTTRGL.IdtOprDbt
           AND FX.Rfr_Ech = OPRECH7.EchPmt
           AND FX.Rfr_Fac = FAC.NumFct(+)
           AND OPRRGL.IdtOpr = LTTRGL.IdtOprCrt
           AND OPRRGL.IdtTypOpr NOT IN (6, 11)
           AND DETLTT_VIEW1.IdtLtt = LTTRGL.IdtLtt
           AND NVL(DETLTT_VIEW1.IdtFac, 0) = NVL(FAC.IdtFac, 0)
        --and FX.IdtClt_OprFac = '21207'
         GROUP BY FX.IdtClt_OprEch,
                  FX.IdtCptClt_OprEch,
                  FX.IdtTypOpr_OprFac,
                  FX.IdtOpr_OprFac,
                  FX.DatCrt_OprFac,
                  FX.DatExg_OprFac,
                  FX.rfr_fac,
                  LTTRGL.IdtLtt,
                  CASE
                    WHEN TRUNC(LTTRGL.DatCrt) < TRUNC(FX.DatCrt_OprFac) THEN
                     TRUNC(FX.DatCrt_OprFac)
                    ELSE
                     TRUNC(LTTRGL.DatCrt)
                  END
        union all
        SELECT IdtClt,
               IdtCptClt,
               OPR.IdtTypOpr,
               IdtOpr,
               DatCrt DatCrtOpr,
               DatExg,
               Rfr,
               0 IdtLtt,
               TRUNC(DatCrt),
               Mnt
          from OPR)
       )
   GROUP BY IdtClt,
            IdtCptClt,
            IdtTypOpr,
            IdtOpr,
            DatCrtOpr,
            DatExg,
            Rfr,
            DatCrt ;
