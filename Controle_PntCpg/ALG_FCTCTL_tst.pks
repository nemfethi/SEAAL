CREATE OR REPLACE PACKAGE X7."ALG_FCTCTL" IS
  -----------------------------------------------------------------------------
  -- Package des fonctions de controle
  -- SEAAL ALGER
  -----------------------------------------------------------------------------
  -----------------------------------------------------------------------------

  -- Function VersionPkg
  -- Version du package
  -----------------------------------------------------------------------------
  FUNCTION VersionPkg Return Number;

  -----------------------------------------------------------------------------
  -----------------------------------------------------------------------------
  -- Procédure de controle des frais d'impayé
  -- pour l'insertion des frais dans FAC ET LGNFAC
  -----------------------------------------------------------------------------
  -----------------------------------------------------------------------------
  PROCEDURE FrsImp(pIdtClt    IN CLT.IDTCLT%TYPE,
                   sTypMsg    OUT VARCHAR2,
                   sRetFctCtl OUT VARCHAR2);

  -----------------------------------------------------------------------------
  -----------------------------------------------------------------------------
  -- Procédure de controle des frais de transfert de caisse en banque
  -----------------------------------------------------------------------------
  -----------------------------------------------------------------------------
  PROCEDURE FrsTrsBnq(pIdtModRgl IN VARCHAR2,
                      pIdtCss    IN VARCHAR2,
                      pMntDvs    IN VARCHAR2,
                      pIdtBnq    IN VARCHAR2,
                      pIdtGch    IN VARCHAR2,
                      pIdtDvs    IN VARCHAR2,
                      sTypMsg    OUT VARCHAR2,
                      sRetFctCtl OUT VARCHAR2);
  -----------------------------------------------------------------------------
  -----------------------------------------------------------------------------
  -- Procédure de controle de test de recuparation de variable de ligne.
  -----------------------------------------------------------------------------
  -----------------------------------------------------------------------------
  PROCEDURE test(pMntCss    IN VARCHAR2,
                 sTypMsg    OUT VARCHAR2,
                 sRetFctCtl OUT VARCHAR2);

  -----------------------------------------------------------------------------
  --- controle usage - emplyé_seaal
  -----------------------------------------------------------------------------
  procedure Ctrl_Usg_EmpSeaal(pIdtAcv    AvtCtr.IdtAcv%type,
                              pChp12     AvtCtr.Chp12%type,
                              pCodTypCtr ctr.codtypctr%type,
                              pCffMlp    avtctr.cffmlp%type,
                              sTypMsg    OUT VARCHAR2,
                              sRetFctCtl OUT VARCHAR2);
  -----------------------------------------------------------------------------
  -----------------------------------------------------------------------------
  -----------------------------------------------------------------------------
  -----------------------------------------------------------------------------

  PROCEDURE ctrl_enc(pModRglLibAbr modrgl.libabr%TYPE,
                     pNumChq       IN OUT lgncss.numchq%TYPE,
                     ptireur       IN VARCHAR2,
                     pbanque       IN VARCHAR2,
                     pguichet      IN VARCHAR2,
                     pinfo         IN VARCHAR2,
                     sTypMsg       OUT VARCHAR2,
                     sRetFctCtl    OUT VARCHAR2);

  -----------------------------------------------------------------------------
  -----------------------------------------------------------------------------
  -- Controles sur le point de comptage
  -----------------------------------------------------------------------------
  -----------------------------------------------------------------------------
  PROCEDURE CtlPntCpg(pIdtPntLvr IN PNTLVR.IdtPntLvr%TYPE,
                      pIdtPntCpg IN PNTCPG.IdtPntCpg%TYPE,
                      pTypCpg    IN TYPCPG.TypCpg%TYPE,
                      pIdtDcpGgrNumOrd varchar2,
                      pdfA1 varchar2,
                      pdfA2 varchar2,
                      pdfA3 varchar2,
                      sTypMsg    OUT VARCHAR2,
                      sRetFctCtl OUT VARCHAR2);
  -----------------------------------------------------------------------------
  -----------------------------------------------------------------------------
  -- Procédure de controle sur la fiche compte client
  -- pour la qualite payeur
  -----------------------------------------------------------------------------
  -----------------------------------------------------------------------------
  PROCEDURE CTLCPTCLT(pIdtClt    CLT.IdtClt%TYPE,
                      pQltPyr    in CLT.QltPyr%type,
                      sTypMsg    OUT VARCHAR2,
                      sRetFctCtl OUT VARCHAR2);
  PROCEDURE CTLMNTFCTMNL(pMntHt     in fac.mntht%type,
                         sTypMsg    OUT VARCHAR2,
                         sRetFctCtl OUT VARCHAR2);
  ------------------------------------------------------------------
  -- Agent Affecté obligatoire pour le types de plan INT_E
  ------------------------------------------------------------------

  PROCEDURE CTLTypPlnActAff(pIdtAgtAff in ActCrs.IdtAgtAff%TYPE,
                            pIdtPlnAct in PlnAct.Idtplnact%type,
                            sTypMsg    OUT VARCHAR2,
                            sRetFctCtl OUT VARCHAR2);

  ------------------------------------------------------------------
  -- Désactiver case par défaut dans certains filtres
  ------------------------------------------------------------------
  PROCEDURE CHKDFTFLT(pChkBox    in VARCHAR2,
                      sTypMsg    OUT VARCHAR2,
                      sRetFctCtl OUT VARCHAR2);
  -----------------------------------------------------------------------------
  -----------------------------------------------------------------------------
  -- Procédure de controle sur motif d'extraction des contrats
  -----------------------------------------------------------------------------
  -----------------------------------------------------------------------------
  PROCEDURE CTLMTFEXT(pIdtMtfExt in VARCHAR2,
                      sTypMsg    OUT VARCHAR2,
                      sRetFctCtl OUT VARCHAR2);
  -----------------------------------------------------------------------------
  -----------------------------------------------------------------------------
  -- Procédure de controle Accès aux caisses
  -----------------------------------------------------------------------------
  -----------------------------------------------------------------------------
  PROCEDURE CtlChgCss(pIdtCss    in varchar2,
                      sTypMsg    OUT VARCHAR2,
                      sRetFctCtl OUT VARCHAR2);
  -------------------------------------------------------------------------------
  -----------------------------------------------------------------------------
  -- Contenu : Procédures de controle FDA-0092
  -------------------------------------------------------------------------------
  -----------------------------------------------------------------------------

  PROCEDURE CtlActAff(pIdtAgtAff in ActCrs.IdtAgtAff%TYPE,
                      pIdtPlnAct in PlnAct.Idtplnact%type,
                      pIdtAff    in Aff.IdtAff%Type,
                      pIdtACtCrs in ACtCrs.IdtActCrs%Type,
                      pIdtRet    ActCrs.Idtret%Type,
                      sTypMsg    OUT VARCHAR2,
                      sRetFctCtl OUT VARCHAR2);

  PROCEDURE CtlCntPrc(pIdtClt    IN VARCHAR2,
                      pIdtCnt    IN VARCHAR2,
                      pDatFinCnt IN DATE,
                      pCntTld    in Cnt.Cnttld%Type,
                      sTypMsg    OUT VARCHAR2,
                      sRetFctCtl OUT VARCHAR2);

  PROCEDURE CtlAffCntPrc(pidtAff    IN VARCHAR2,
                         pidtmtffin IN VARCHAR2,
                         pColVal    in varchar2,
                         pIdtPlnAct in plnact.idtplnact%type,
                         pDatcrt    date,
                         sTypMsg    OUT VARCHAR2,
                         sRetFctCtl OUT VARCHAR2);
  PROCEDURE CtlClt(pIdtClt    in Clt.IdtClt%type,
                   pTlp       in Clt.Tlp%type,
                   pTld       in Clt.Tld%type,
                   pTlb       in Clt.Tlb%type,
                   sTypMsg    OUT VARCHAR2,
                   sRetFctCtl OUT VARCHAR2);
  PROCEDURE CtlAgtSml(pIdtAgtSui IN VARCHAR2,
                      sTypMsg    OUT VARCHAR2,
                      sRetFctCtl OUT VARCHAR2);
  PROCEDURE CTLInt(pIdtInt    in X7.Int.idtInt%TYPE,
                   pAct       CtlAct.Act%Type,
                   pCodMotif  Typostd.Typostd%Type,
                   sTypMsg    OUT VARCHAR2,
                   sRetFctCtl OUT VARCHAR2);
   PROCEDURE ctlcri(pact IN ctlact.act%TYPE,
                   /*pidtpntlvr    IN pntcpg.idtpntlvr%TYPE,
                   pidtpntcpg IN pntcpg.idtpntcpg%TYPE,*/
									 pIdtpntlvr    IN pntlvr.idtpntlvr%TYPE,
									 pidtpntcpg IN pntcpg.idtpntcpg%TYPE,
                   pdate_pose in date,
                   pnumcpr    in varchar2,
                   pIdtTypCpr in Varchar2,
                   stypmsg    OUT VARCHAR2,
                   sretfctctl OUT VARCHAR2);

  PROCEDURE ctlfacinter(pidtctr    in Varchar2,
                        datdebprd  in Varchar2,
                        stypmsg    OUT VARCHAR2,
                        sretfctctl OUT VARCHAR2);

 PROCEDURE CtlSviLot(pIdtTypTche IN VARCHAR2,
                      pPrm1       in varchar2,
                      sTypMsg     OUT VARCHAR2,
                      sRetFctCtl  OUT VARCHAR2);

 Procedure CtlCpr(pIdtTypCpr in Varchar2,
                   pNumCpr    in varchar2,
                   pdate_pose in date,
                   sTypMsg    OUT VARCHAR2,
                   sRetFctCtl OUT VARCHAR2);


Procedure CtlDatRlv(sTypMsg    OUT VARCHAR2,
                    sRetFctCtl OUT VARCHAR2);


Procedure Ctldatr( ptrn in VARCHAR2,
                   sTypMsg    OUT VARCHAR2,
                   sRetFctCtl OUT VARCHAR2);

Procedure CtldatRlvMss( pColDatRlv in VARCHAR2,
                          pColNumCpr in varchar2,
                          sTypMsg    OUT VARCHAR2,
                          sRetFctCtl OUT VARCHAR2);

END ALG_FctCtl;
/

