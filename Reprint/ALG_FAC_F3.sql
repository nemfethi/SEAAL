DROP VIEW X7.ALG_FAC_F3;

/* Formatted on 12/05/2019 12:36:13 (QP5 v5.326) */
CREATE OR REPLACE FORCE VIEW X7.ALG_FAC_F3
(
    IDTFAC,
    IDTTYPFCT,
    LIBTYPFCT,
    IDTCTR,
    Z27,
    CFFMLP,
    Z29,
    ADRLBRCLT,
    ZZ10,
    ZZ11,
    IDTCLTDST,
    IDTCLTSSC,
    Z90,
    Z91,
    ZZ36,
    Z92,
    Z93,
    Z94,
    ADRSTR10,
    Z12,
    Z13,
    IDTCLT,
    Z14,
    DATEXG,
    IDTCSS,
    Z10,
    Z86,
    Z97,
    Z99,
    Z101,
    Z103,
    Z105,
    ZZ80,
    IDTCNTOPR,
    ADRCNTOPR,
    NUMFCT,
    LIB,
    IDTACV,
    IDTTRF,
    IDTFACTYP,
    Z36,
    CHP13,
    CHP14,
    NBREXP,
    NBRFAC,
    IDTPNTLVR,
    IDTPNTCPG,
    IDTTYPCPG,
    ADRLBR,
    IDTTRNTYP,
    RNG1,
    DATDBTPRD,
    DATFINPRD,
    IDTPRDFAC,
    IDTMSGAPL,
    Z16,
    IDTMODRCV,
    LIBMODRCV,
    IDTLOTFAC,
    MNTCRTAFF,
    ECHPMTREG,
    LIBTYPCPG,
    LIBCYCFAC,
    MODRTG,
    IDTOPR,
    DATLCTPRC,
    DATLCTDRN,
    DATPRCRLV,
    DATPRCFAC,
    DATVALCLE,
    T1
)
AS
    SELECT fac.idtfac,
           fac.idttypfct,
           typfct.libfac
               libtypfct,
           ctr.idtctr,
           avtctr.idtacv
               z27,                                                  -->IdtAcv
           avtctr.cffmlp
               cffmlp,
           DECODE (avtctr.idtacv, 'C1', avtctr.cffmlp, 1)
               z29,
           --nombre de menages -->CffMlp

           cltdst.adrlbr
               adrlbrclt,
           clt.idtctgclt
               zz10,                                               --IdtCtgClt
           ctgclt.libabr
               zz11,
           --CtgCltLib

           cltdst.idtclt
               idtcltdst,
           cltssc.idtclt
               idtcltssc,
           cltdst.idtclt
               z90,
           -- ancienne reference -->AncRfr

           cltdst.nom || ' ' || cltdst.prn
               z91,
           -- client destinataire pour F1 -->CltDstF1

           NVL (LTRIM (orgpyr.nom || ' ' || orgpyr.prn), '') --cltssc.nom || ' ' || cltssc.prn)
               zz36,                -- client destinataire pour F2 -->CltDstF2
           cltdst.adrstr1
               z92,                                                 -->AdrStr1
           cltdst.adrstr2
               z93,                                                 -->AdrStr2
           cltdst.adrstr3
               z94,                                                 -->AdrStr3
           cltdst.adrstr10,
           fac.numfct
               z12,                                               -->NumFctPrd
           TO_CHAR (SYSDATE, 'YYYY - MM')
               z13,
           --> mois-année impression

           fac.idtclt,
           opr.datcrt
               z14,                                                  -->DatClc
           opr.datexg,
           opr.idtcss,
           opr.idtcss
               z10,
           -- identifiant de caisse -->IdtCss

           NVL (fac.mnttva, 0)
               z86,                 -- montant sur la valeur ajoutée -->MntTva
           NVL (fac.mntht, 0) + NVL (fac.mnttva, 0)
               z97,                                                 --> MntTTC
           CASE
               WHEN fac.idtcntopr = 43
               THEN
                     sldglbdst (cltdst.idtclt, ctr.idtctr)
                   - NVL (fac.mntht, 0)
                   - NVL (fac.mnttva, 0)
               ELSE
                   NVL (fac.sldexgant, 0)
           END
               z99,
           --> TTLEXG

           CASE
               WHEN fac.idtcntopr = 43
               THEN
                   sldglbdst (cltdst.idtclt, ctr.idtctr)
               ELSE
                   sldglb (cltdst.idtclt, idtcptclt)
           END
               z101,
           CASE
               WHEN fac.idtcntopr = 43
               THEN
                   CASE
                       WHEN (NVL (sldglbdst (cltdst.idtclt, ctr.idtctr), 0) <=
                             0)
                       THEN
                           0
                       ELSE
                           NVL (
                               LEAST (
                                   2500,
                                   GREATEST (
                                       5,
                                       CEIL (
                                             (NVL (
                                                  sldglbdst (cltdst.idtclt,
                                                             ctr.idtctr),
                                                  0))
                                           / 100))),
                               0)
                   END
               ELSE
                   CASE
                       WHEN (NVL (sldglb (cltdst.idtclt, idtcptclt), 0) <= 0)
                       THEN
                           0
                       ELSE
                           NVL (
                               LEAST (
                                   2500,
                                   GREATEST (
                                       5,
                                       CEIL (
                                             (NVL (
                                                  sldglb (cltdst.idtclt,
                                                          idtcptclt),
                                                  0))
                                           / 100))),
                               0)
                   END
           END
               z103,
           -- Montant du timbre fiscal  --> MntTbrFsc

           CASE
               WHEN   NVL (fac.mntht, 0)
                    + NVL (fac.mnttva, 0)
                    + NVL (fac.sldexgant, 0) <=
                    0
               THEN
                     NVL (fac.mntht, 0)
                   + NVL (fac.mnttva, 0)
                   + NVL (fac.sldexgant, 0)
               ELSE
                     NVL (fac.mntht, 0)
                   + NVL (fac.mnttva, 0)
                   + NVL (fac.sldexgant, 0)
                   + NVL (
                         LEAST (
                             2500,
                             GREATEST (
                                 5,
                                 CEIL (
                                       (  NVL (fac.mntht, 0)
                                        + NVL (fac.mnttva, 0)
                                        + NVL (fac.sldexgant, 0))
                                     / 100))),
                         0)
           END
               z105,       -- Montant facture(TTC) + timbre + arriérés/avance,
           NVL (fac.mntht, 0) + NVL (fac.mnttva, 0)
               zz80,
           -- Montant TTC de la facture,

           fac.idtcntopr,
           str.adrlbr
               adrcntopr,
           fac.numfct,
           cntopr.lib,
           avtctr.idtacv
               idtacv,
           --> en double!!!

           avtctr.idttrf
               idttrf,
           SUBSTR (avtctr.idtfactyp, 1, 3)
               idtfactyp,
           avtctr.idtcltdst
               z36,
           avtctr.chp13,
           avtctr.chp14,
           (CASE chp13 WHEN 0 THEN 1 WHEN 1 THEN 3 END)
               AS nbrexp,
           NVL (avtctr.chp01, 1)
               nbrfac,
           pntcpg.idtpntlvr,
           pntcpg.idtpntcpg,
           pntcpg.idttypcpg,
           pntcpg.adrlbr,
           pntcpg.idttrntyp,
           pntcpg.rng1,
           ctrfac.datdbtprd,
           ctrfac.datfinprd,
           ctrfac.idtprdfac,
           ctrfac.idtmsgapl,
           (CASE ctrfac.idtcycfac
                WHEN 'T01'
                THEN
                       SUBSTR (ctrfac.idtprdfac, 6, 1)
                    || '° TRIM/ '
                    || SUBSTR (ctrfac.idtprdfac, 0, 4)
                WHEN 'M01'
                THEN
                       SUBSTR (ctrfac.idtprdfac, 5, 2)
                    || '° Mois/ '
                    || SUBSTR (ctrfac.idtprdfac, 0, 4)
            END)
               AS z16,                  -- PERIODE de facturation -->LibPrdFac
           rcvtyp.idtmodrcv,
           modrcv.libabr
               libmodrcv,
           fac.idtlotfac,
           fac.mntcrtaff,
           fac.echpmtreg,
           typcpg.libabr
               libtypcpg,
           cycfac.libabr
               libcycfac,
           -- Informations pour le routage

           NVL (ctr.t4, 'MD_001')
               modrtg,
           opr.idtopr,
           datlctprc,
           datlctdrn,
           (CASE
                WHEN fac.idttypfct <> '4'
                THEN
                    CASE SUBSTR (avtctr.idtfactyp, 1, 3)
                        WHEN 'TRM'
                        THEN
                            CASE
                                WHEN datlctdrn IS NOT NULL
                                THEN
                                    datlctdrn + 90
                                WHEN datlctdrn IS NULL
                                THEN
                                    datclc + 90
                            END
                        WHEN 'MNS'
                        THEN
                            CASE
                                WHEN datlctdrn IS NOT NULL
                                THEN
                                    datlctdrn + 30
                                WHEN datlctdrn IS NULL
                                THEN
                                    datclc + 30
                            END
                    END
            END)
               AS datprcrlv,
           (CASE
                WHEN fac.idttypfct <> '4'
                THEN
                    CASE SUBSTR (avtctr.idtfactyp, 1, 3)
                        WHEN 'TRM'
                        THEN
                            CASE
                                WHEN datlctdrn IS NOT NULL
                                THEN
                                    datlctdrn + 104
                                WHEN datlctdrn IS NULL
                                THEN
                                    datclc + 104
                            END
                        WHEN 'MNS'
                        THEN
                            CASE
                                WHEN datlctdrn IS NOT NULL
                                THEN
                                    datlctdrn + 44
                                WHEN datlctdrn IS NULL
                                THEN
                                    datclc + 44
                            END
                    END
            END)
               AS datprcfac,
           (CASE
                WHEN fac.idttypfct <> '4'
                THEN
                    CASE SUBSTR (avtctr.idtfactyp, 1, 3)
                        WHEN 'TRM' THEN opr.datcrt + 90
                        WHEN 'MNS' THEN opr.datcrt + 30
                    END
            END)
               AS DATVALCLE,
           ctr.t1
      FROM typcpg,
           prmgnr,
           avtctr,
           clt,
           ctgclt,
           clt  cltdst,
           clt  cltssc,
           modrcv,
           rcvtyp,
           cycfac,
           ctrfac,
           ctr,
           typfct,
           opr,
           fac,
           str,
           pntcpg,
           pntlvr,
           cntopr,
           clt  orgpyr,
           (  SELECT idtfac,
                     MIN (datlctprc)     datlctprc,
                     MAX (datlctdrn)     datlctdrn,
                     MAX (datlctdrn) - MIN (datlctprc)
                FROM cns
            GROUP BY idtfac) cns
     WHERE     typcpg.idttypcpg(+) = pntcpg.idttypcpg
           AND opr.rfr(+) = fac.numfct
           AND (opr.idttypopr = 1 OR opr.idttypopr = 4)
           AND typfct.idttypfct = fac.idttypfct
           AND fac.idttypfct <> 2
           AND clt.idtclt = fac.idtclt
           AND clt.idtctgclt = ctgclt.idtctgclt
           AND cntopr.idtcntopr = fac.idtcntopr
           AND str.idtcntopr = fac.idtcntopr
           AND ctrfac.idtfac(+) = fac.idtfac
           AND ctr.idtctr(+) = ctrfac.idtctr
           AND cycfac.idtcycfac(+) = ctrfac.idtcycfac
           AND modrcv.idtmodrcv(+) = rcvtyp.idtmodrcv
           AND rcvtyp.idtrcvtyp(+) = fac.idtrcvtyp
           AND avtctr.idtctr(+) = ctrfac.idtctr
           AND avtctr.numavn(+) = ctrfac.numavn
           AND cltdst.idtclt(+) = avtctr.idtcltdst
           AND cltssc.idtclt(+) = ctr.idtcltssc
           AND orgpyr.idtclt(+) = ctr.A1
           AND pntcpg.idtpntlvr(+) = ctr.idtpntlvr
           AND pntcpg.idtpntcpg(+) = ctr.idtpntcpg
           AND pntlvr.idtpntlvr(+) = pntcpg.idtpntlvr
           AND cns.idtfac(+) = fac.idtfac
           AND ctr.codtypctr != 'SEAAL';


CREATE OR REPLACE PUBLIC SYNONYM ALG_FAC_F3 FOR X7.ALG_FAC_F3;


GRANT SELECT ON X7.ALG_FAC_F3 TO APPLICATIF_DSI;

GRANT DELETE, INSERT, SELECT, UPDATE, ON COMMIT REFRESH, QUERY REWRITE, DEBUG, FLASHBACK ON X7.ALG_FAC_F3 TO X7SYSADM;

GRANT DELETE, INSERT, SELECT, UPDATE, ON COMMIT REFRESH, QUERY REWRITE, DEBUG, FLASHBACK ON X7.ALG_FAC_F3 TO X7SYSCAS;

GRANT DELETE, INSERT, SELECT, UPDATE, ON COMMIT REFRESH, QUERY REWRITE, DEBUG, FLASHBACK ON X7.ALG_FAC_F3 TO X7SYSUSR;
