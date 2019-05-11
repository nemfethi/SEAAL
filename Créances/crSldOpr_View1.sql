DROP VIEW X7.SLDOPR_VIEW1;

/* Formatted on 21/04/2019 09:39:24 (QP5 v5.326) */
CREATE OR REPLACE FORCE VIEW X7.SLDOPR_VIEW1
(
    IDTCLT,
    IDTCPTCLT,
    IDTTYPOPR,
    IDTOPR,
    DATCRTOPR,
    DATEXG,
    RFR,
    DATDEB,
    IDTLTT,
    DATFIN,
    MNT,
    SLD
)
AS
      SELECT IdtClt,
             IdtCptClt,
             IdtTypOpr,
             IdtOpr,
             DatCrtOpr DatCrtOpr,
             DatExg DatExg,
             Rfr Rfr,
             DatCrt DatDeb,
             MAX (IdtLtt) KEEP (DENSE_RANK LAST ORDER BY DatCrt) IdtLtt,
               -- La colone suivante (DatFin) prendre la date du prochain lettrage - 0.00001
               -- ce qui veut dire le jour anterieur au 23:59:59 au cas ou dans l'utilisation
               -- on ne fasse pas le truncate des dates.
               LEAD (DatCrt, 1) OVER (PARTITION BY IdtClt,
                                      IdtCptClt,
                                      IdtTypOpr,
                                      IdtOpr
                         ORDER BY DatCrt) - 0.00001
                 DatFin,
             SUM (Mnt) Mnt,
             -- On prendre le solde du dernier lettrage order by DatCrt, IdtLtt
             MAX (Sld) KEEP (DENSE_RANK LAST ORDER BY DatCrt, IdtLtt) Sld
        FROM ( -- La requete suivante prendre le montant cumule des lettrages anterieures
              -- au lettrage en cours (ltt en cours inclu) order by DatCrt, IdtLtt
              SELECT IdtClt,
                     IdtCptClt,
                     IdtTypOpr,
                     IdtOpr,
                     DatCrtOpr
                     DatCrtOpr,
                     DatExg
                     DatExg,
                     Rfr Rfr,
                     --                    MAX (DatCrtOpr) KEEP (DENSE_RANK LAST ORDER BY DatCrtOpr nulls FIRST) over (Partition by IdtOpr) DatCrtOpr,
                     --                    MAX (DatExg) KEEP (DENSE_RANK LAST ORDER BY DatExg nulls FIRST) over (Partition by IdtOpr) DatExg,
                     --                    MAX (Rfr) KEEP (DENSE_RANK LAST ORDER BY Rfr nulls FIRST) over (Partition by IdtOpr) Rfr,
                     DatCrt,
                     IdtLtt,
                     Mnt,
                     SUM (Mnt)
                         OVER (PARTITION BY IdtClt,
                                            IdtCptClt,
                                            IdtTypOpr,
                                            IdtOpr
                               ORDER BY DatCrt, IdtLtt
                               ROWS UNBOUNDED PRECEDING)
                         Sld
                FROM ( -- La requete suivante prendre la date (trunquee) et le montant des lettrages pour les operation debitrices
                                                       -- sauf les echeanciers
                     SELECT OPR.IdtClt,
                            OPR.IdtCptClt,
                            OPR.IdtTypOpr,
                            OPR.IdtOpr,
                            OPR.DatCrt DatCrtOpr,
                            OPR.DatExg DatExg,
                            OPR.Rfr Rfr,
                            LTTDBT.IdtLtt,
                            -- Si la date du letrage est anterieur a l'operation debitrice, on ne tiens pas en compte
                            -- la date du lettrage sinon la date de l'operation
                            CASE
                                WHEN TRUNC (LTTDBT.DatCrt) < TRUNC (OPR.DatCrt) THEN TRUNC (OPR.DatCrt)
                                ELSE TRUNC (LTTDBT.DatCrt)
                            END DatCrt,
                            -LTTDBT.Mnt Mnt
                       FROM LTT LTTDBT,
                            OPR OPRCRT,
                            OPR,
                            TYPOPR,
                            NTROPR
                      WHERE     NTROPR.IdtNatOpr = TYPOPR.IdtNatOpr
                            AND TYPOPR.IdtTypOpr = OPR.IdtTypOpr
                            AND LTTDBT.IdtOprDbt = OPR.IdtOpr
                            AND OPRCRT.IdtOpr = LTTDBT.IdtOprCrt
                            AND NTROPR.Fin = 1 --Modification pour prendre en compte les operations financieres seulement
                            AND OPRCRT.IdtTypOpr <> DECODE (OPR.IdtTypOpr, 8, 0, 6)
                     --and opr.idtclt ='484297'--not in ('13659','740413','484297','620324')
                     UNION ALL
                       -- La requete suivante prendre la date (trunquee) et le montant des lettrages pour les factures dans une echeance
                       SELECT OPRECH.IdtClt,
                              OPRECH.IdtCptClt,
                              OPRFAC.IdtTypOpr,
                              OPRFAC.IdtOpr,
                              OPRFAC.DatCrt DatCrtOpr,
                              OPRFAC.DatExg DatExg,
                              OPRFAC.Rfr Rfr,
                              LTTRGL.IdtLtt,
                              -- Si la date du letrage est anterieur a l'operation creditrice, on ne tiens pas en compte
                              -- la date du lettrage sinon la date de l'operation
                              CASE WHEN TRUNC (LTTRGL.DatCrt) < TRUNC (OPRFAC.DatCrt)  THEN TRUNC (OPRFAC.DatCrt)
                                  ELSE TRUNC (LTTRGL.DatCrt)
                              END DatCrt,
                              -SUM (DETLTT_VIEW1.Lgn_MntTtc)
                         FROM DETLTT_VIEW1,
                              FAC,
                              OPR OPRFAC,
                              FACTURESxECHEANCIER,
                              OPR OPRECH,
                              OPR OPRRGL,
                              LTT LTTRGL
                        WHERE     OPRECH.IdtOpr = LTTRGL.IdtOprDbt
                              AND OPRRGL.IdtOpr = LTTRGL.IdtOprCrt
                              AND FACTURESxECHEANCIER.Rfr_Ech = OPRECH.EchPmt
                              AND OPRFAC.IdtOpr = FACTURESxECHEANCIER.IdtOprFac
                              AND FAC.NumFct(+) = FACTURESxECHEANCIER.Rfr_Fac
                              AND DETLTT_VIEW1.IdtLtt = LTTRGL.IdtLtt
                              AND NVL (DETLTT_VIEW1.IdtFac, 0) =
                                  NVL (FAC.IdtFac, 0)
                              AND OPRRGL.IdtTypOpr NOT IN (6, 11)
                     --and oprfac.idtclt ='484297' --not in ('13659','740413','484297','620324')
                     GROUP BY OPRECH.IdtClt,
                              OPRECH.IdtCptClt,
                              OPRFAC.IdtTypOpr,
                              OPRFAC.IdtOpr,
                              OPRFAC.DatCrt,
                              OPRFAC.DatExg,
                              OPRFAC.Rfr,
                              LTTRGL.IdtLtt,
                              CASE WHEN TRUNC (LTTRGL.DatCrt) < TRUNC (OPRFAC.DatCrt) THEN TRUNC (OPRFAC.DatCrt)
                                  ELSE TRUNC (LTTRGL.DatCrt)
                              END
                     UNION ALL
                     -- La requete suivante prendre la date (trunquee) et le montant des lettrages pour les operation creditrices
                     SELECT OPR.IdtClt,
                            OPR.IdtCptClt,
                            OPR.IdtTypOpr,
                            OPR.IdtOpr,
                            OPR.DatCrt DatCrtOpr,
                            OPR.DatExg DatExg,
                            OPR.Rfr Rfr,
                            LTTCRT.IdtLtt
                                IdtLtt,
                            -- Si la date du letrage est anterieur a l'operation creditrice, on ne tiens pas en compte
                            -- la date du lettrage sinon la date de l'operation
                            CASE
                                WHEN TRUNC (LTTCRT.DatCrt) < TRUNC (OPR.DatCrt) THEN TRUNC (OPR.DatCrt)
                                ELSE TRUNC (LTTCRT.DatCrt)
                            END DatCrt,
                            LTTCRT.Mnt Mnt
                       FROM LTT LTTCRT,
                            OPR,
                            TYPOPR,
                            NTROPR
                      WHERE     NTROPR.IdtNatOpr = TYPOPR.IdtNatOpr
                            AND TYPOPR.IdtTypOpr = OPR.IdtTypOpr
                            AND NTROPR.Fin = 1 --Modification pour prendre en compte les operations financieres seulement
                            AND LTTCRT.IdtOprCrt = OPR.IdtOpr
                     --and  opr.idtclt ='484297' --not in ('13659','740413','484297','620324')
                     UNION ALL
                     -- La requete suivante prendre le montant et la date (trunquee) de l'operation
                     SELECT IdtClt,
                            IdtCptClt,
                            OPR.IdtTypOpr,
                            IdtOpr,
                            DatCrt     DatCrtOpr,
                            DatExg,
                            Rfr,
                            0          IdtLtt,
                            TRUNC (DatCrt),
                            Mnt
                       FROM OPR, TYPOPR, NTROPR
                      WHERE     NTROPR.IdtNatOpr = TYPOPR.IdtNatOpr
                            AND TYPOPR.IdtTypOpr = OPR.IdtTypOpr
                            --and opr.idtclt='484297'-- not in ('13659','740413','484297','620324')
                            AND NTROPR.Fin = 1 --Modification pour prendre en compte les operations financieres seulement
                                              )
                )
    GROUP BY IdtClt,
             IdtCptClt,
             IdtTypOpr,
             IdtOpr,
             DatCrtOpr,
             DatExg,
             Rfr,
             DatCrt;


CREATE OR REPLACE PUBLIC SYNONYM SLDOPR_VIEW1 FOR X7.SLDOPR_VIEW1;


GRANT DELETE, INSERT, SELECT, UPDATE, ON COMMIT REFRESH, QUERY REWRITE, DEBUG, FLASHBACK, MERGE VIEW ON X7.SLDOPR_VIEW1 TO X7SYSADM;

GRANT DELETE, INSERT, SELECT, UPDATE, ON COMMIT REFRESH, QUERY REWRITE, DEBUG, FLASHBACK, MERGE VIEW ON X7.SLDOPR_VIEW1 TO X7SYSCAS;

GRANT DELETE, INSERT, SELECT, UPDATE, ON COMMIT REFRESH, QUERY REWRITE, DEBUG, FLASHBACK, MERGE VIEW ON X7.SLDOPR_VIEW1 TO X7SYSUSR;
