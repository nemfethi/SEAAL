CREATE OR REPLACE FORCE VIEW X7.ALG_F3_XML
AS
    SELECT fac.idtfac,
           fac.idttypfct,
           typfct.libfac TypFctLib,
           ctr.idtctr,
           avtctr.idtacv,                                                   -->IdtAcv
           Usg.lib Usage,
           avtctr.cffmlp cffmlp,
           SUBSTR (avtctr.idtfactyp, 1, 3) Trgidtfactyp,                        -- trigramme factyp
           DECODE (avtctr.idtacv, 'C1', avtctr.cffmlp, 1) NbrMng,               --nombre de menages -->CffMlp
           avtctr.idttrf idttrf,
           avtctr.chp13,
           cltdst.idtclt idtcltdst,
           cltdst.adrlbr CltAdrLbr,
           cltdst.adrstr1,                                                 -->AdrStr1
           cltdst.adrstr2,                                                 -->AdrStr2
           cltdst.adrstr3,                                                 -->AdrStr3
           cltdst.adrstr10,
           clt.idtctgclt ,                                                      --IdtCtgClt
           ctgclt.libabr CtgCltLib,                                             --CtgCltLib
           cltssc.idtclt idtcltssc,
           Alg_F3_Utils.NomPrnClt(null, cltdst.nom, cltdst.prn) CltDstNomPrn,    -- client destinataire pour F1 -->CltDstF1
           NVL (trim(Alg_F3_Utils.NomPrnClt(null, orgpyr.nom, orgpyr.prn)),  Alg_F3_Utils.NomPrnClt(null, cltSsc.nom, cltSsc.prn)) CltSscNomPrn,                        -- client destinataire pour F2 -->CltDstF2
           TO_CHAR (SYSDATE, 'YYYY - MM') MoisAnnImp,                           --> mois-année impression
           fac.numfct,                                                          -->NumFctPrd
           fac.idtclt,
           fac.datclc DatClc,                                                  -->DatClc
           NVL (fac.mntHT, 0) FacMntHT,                                        
           NVL (fac.mnttva, 0) FacMntTva,                                        -- montant sur la valeur ajoutée -->MntTva
           NVL (fac.mntht, 0) + NVL (fac.mnttva, 0) FacMntTtc,                   --> MntTTC
            Alg_F3_Utils.FacTtlExg(  Fac.IdtCntOpr,
                                    '43, 44',
                                     CltDst.IdtClt,
                                     Ctr.IdtCtr,
                                     Fac.MntHt,
                                     Fac.MntTva,
                                     fac.sldexgant) FacTtlExg,     --> TTLEXG
           Alg_F3_Utils.FacSldGlb(  Fac.IdtCntOpr,
                                    '43, 44',
                                     CltDst.IdtClt,
                                     idtcptclt,
                                     Ctr.IdtCtr) SldGlb,
            Alg_F3_Utils.FacTbrFsc( Fac.IdtCntOpr,
                                    '43, 44',
                                    CltDst.IdtClt,
                                    idtcptclt,
                                    Ctr.IdtCtr) TbrFscMnt,                        -- Montant du timbre fiscal 
            Alg_F3_Utils.FacMntNetPyrAvcTbr(Fac.MntHt, Fac.MntTva, Fac.SLDEXGANT) FacMntNetPyrAvcTbr,       -- Montant facture(TTC) + timbre + arriérés/avance,
           fac.idtcntopr FacIdtCntOpr,
           fac.idtlotfac,
           fac.mntcrtaff,
           fac.echpmtreg,
           str.adrlbr CntOprAdrLbr,
           cntopr.lib CntOprLib,
           CASE nvl(chp13, 0) WHEN 0 THEN 1 WHEN 1 THEN 3 END nbrexp, --> nombre d'exemplaires
           NVL (avtctr.chp01, 1) nbrfac, -->Nombre de factures
           pntcpg.idtpntlvr,
           pntcpg.idtpntcpg,
           pntcpg.idttypcpg,
           pntcpg.adrlbr PntCpgAdrLbr,
           pntcpg.idttrntyp,
           pntcpg.rng1,
           ctrfac.datdbtprd,
           ctrfac.datfinprd,
           ctrfac.idtprdfac,
           ctrfac.idtmsgapl,
           Alg_F3_Utils.LibPrdLotFac(CtrFac.IdtCycfac, substr(CtrFac.IdtPrdFac, 5), substr(CtrFac.IdtPrdFac, 1, 4)) LibPrdFac,                  -- PERIODE de facturation -->LibPrdFac
           rcvtyp.idtmodrcv,
           modrcv.libabr libmodrcv,
           typcpg.libabr TypCpgLib,
           cycfac.libabr CycFacLib,
           -- Informations pour le routage
           NVL (ctr.t4, 'MD_001') modrtg,
           ctr.t1,
           datlctprc,
           datlctdrn,
            ALG_F3_UTILS.FacDatPrcRlv (CycFac.IdtCycFac, fac.idttypfct, datlctdrn, DatClc)  AS datprcrlv,
            ALG_F3_UTILS.FacDatPrcFac (CycFac.IdtCycFac, fac.idttypfct, datlctdrn, DatClc)  AS datprcfac
      FROM typcpg,
           clt,
           clt  cltdst,
           clt  cltssc,
           ctr,
           ctrfac,
           avtctr,
           prmgnr,
           ctgclt,
           modrcv,
           rcvtyp,
           cycfac,
           typfct,
           fac,
           Opr,
           str,
           pntcpg,
           pntlvr,
           cntopr,
           usg,
           clt  orgpyr,
           (  SELECT idtfac,
                     MIN (datlctprc)     datlctprc,
                     MAX (datlctdrn)     datlctdrn,
                     MAX (datlctdrn) - MIN (datlctprc)
                FROM cns
            GROUP BY idtfac) cns
     WHERE typcpg.idttypcpg(+)      = pntcpg.idttypcpg
           AND typfct.idttypfct     = fac.idttypfct
           AND fac.idttypfct        <> 2
           AND clt.idtclt           = fac.idtclt
           AND clt.idtctgclt        = ctgclt.idtctgclt
           AND cntopr.idtcntopr     = fac.idtcntopr
           AND str.idtcntopr        = fac.idtcntopr
           AND ctrfac.idtfac(+)     = fac.idtfac
           AND ctr.idtctr(+)        = ctrfac.idtctr
           AND cycfac.idtcycfac(+)  = ctrfac.idtcycfac
           AND modrcv.idtmodrcv(+)  = rcvtyp.idtmodrcv
           AND rcvtyp.idtrcvtyp(+)  = fac.idtrcvtyp
           AND avtctr.idtctr(+)     = ctrfac.idtctr
           AND avtctr.numavn(+)     = ctrfac.numavn
           AND AvtCtr.IdtAcv        = Usg.idtAcv
           AND cltdst.idtclt(+)     = avtctr.idtcltdst
           AND cltssc.idtclt(+)     = ctr.idtcltssc
           AND orgpyr.idtclt(+)     = TO_CHAR (avtctr.chp04)
           AND pntcpg.idtpntlvr(+)  = ctr.idtpntlvr
           AND pntcpg.idtpntcpg(+)  = ctr.idtpntcpg
           AND pntlvr.idtpntlvr(+)  = pntcpg.idtpntlvr
           AND cns.idtfac(+)        = fac.idtfac
           AND ctr.codtypctr        != 'SEAAL'
           and Opr.Rfr              = Fac.NumFct
           and Opr.IdtTypOpr in (1, 4);


-- CREATE OR REPLACE PUBLIC SYNONYM ALG_F3_XML FOR X7.ALG_F3_XML;


-- GRANT DELETE, INSERT, SELECT, UPDATE, ON COMMIT REFRESH, QUERY REWRITE, DEBUG, FLASHBACK, MERGE VIEW ON X7.ALG_F3_XML TO X7SYSADM;

-- GRANT DELETE, INSERT, SELECT, UPDATE, ON COMMIT REFRESH, QUERY REWRITE, DEBUG, FLASHBACK, MERGE VIEW ON X7.ALG_F3_XML TO X7SYSCAS;

-- GRANT DELETE, INSERT, SELECT, UPDATE, ON COMMIT REFRESH, QUERY REWRITE, DEBUG, FLASHBACK, MERGE VIEW ON X7.ALG_F3_XML TO X7SYSUSR;
