create or replace package body ALG_F3_UTILS
--------------------------------------------------------------------------------
-- Package Body: ALG_F3_UTILS 
--                Procédures utiles pour l'édition de la facture F3 SEAAL
--------------------------------------------------------------------------------
as
--------------------------------------------------------------------------------
-- Fonction : VersionPkg 
--            Retourne la version du package
--------------------------------------------------------------------------------
function VersionPkg return Varchar2
is
begin
  return gVersionPkg;
end VersionPkg;
--------------------------------------------------------------------------------
-- Fonction : LibPrdLotFac 
--            Retourne le libellé formaté de la période du lot de facturation
-- Param:
--    pIdtLotfac : Id Lot de facturation
--------------------------------------------------------------------------------
function LibPrdLotFac(pIdtLotfac Lotfac.IdtLotFac%type) return LotfacPrd_SType
is
vResult LotfacPrd_SType;
begin
  select LibPrdLotFac(IdtCycFac, IdtPrdFac, Ann) into vResult
  from LotFac 
  where IdtLotfac = pIdtLotfac;
  return vResult;
end LibPrdLotFac;
--------------------------------------------------------------------------------
-- Fonction : LibPrdLotFac 
--            Retourne le libellé formaté de la période du lot de facturation
-- Param:
--    pIdtCycFac : Id Cycle de facturation
--    pIdtPrdFac : Id Période de facturation
--    pAnn       : Année Lot de facturation
--------------------------------------------------------------------------------
function LibPrdLotFac(pIdtCycFac Lotfac.IdtCycFac%type,
                      pIdtPrdFac Lotfac.IdtPrdFac%type,
                      pAnn       Lotfac.Ann%type) return LotfacPrd_SType
is
vResult LotfacPrd_SType;
begin
  vResult := case 
              when pIdtCycFac='M01' then trim(to_char(to_date(pidtprdfac, 'MM'), 'Month')) ||' '|| pann
              when pIdtCycfac='T01' then pidtprdfac||' °Trim '|| pAnn
              else 'Format inconnu'
            end;
  return vResult;
end LibPrdLotFac;
--------------------------------------------------------------------------------
-- Fonction: NomPrnClt --
--           Compose la cahine Nom + Prénom du client à partir d'un IdtClt
-- Param:
--    pIdtClt : Id Client
--------------------------------------------------------------------------------
function NomPrnClt(pIdtClt Clt.IdtClt%type) return NomPrnClt_SType
is
vResult NomPrnClt_SType;
begin
  select trim(Qlt.Lib || ' ' || Nom || ' ' || Prn) into vResult
  from Clt, Qlt
  where Clt.IdtClt = pIdtClt
  and Clt.IdtQlt = Qlt.IdtQlt (+);
  return vResult;
  exception
    when no_data_found then
      return vResult;
end NomPrnClt;
--------------------------------------------------------------------------------
-- Fonction: NomPrnClt --
--           Compose la cahine Nom + Prénom du client à partir d'un IdtClt
-- Param:
--    pQlt : Libellé qualité
--    pNom : Nom
--    pPrn : Prénom
--------------------------------------------------------------------------------
function NomPrnClt(pQlt Qlt.Lib%type, pNom Clt.Nom%type, pPrn Clt.Prn%type) return NomPrnClt_SType
is
vResult NomPrnClt_SType;
begin
  vResult:= trim(pQlt || ' ' || pNom || ' ' || pPrn);
  return vResult;
end NomPrnClt;
--------------------------------------------------------------------------------
-- Fonction : InfoLotFac 
--            Informations Lot de facturation --
--            * Pipelined *
-- Param:
--    pIdtLotfac : Id Lot de Facturation
--------------------------------------------------------------------------------
function InfoLotFac( pIdtLotfac Lotfac.IdtLotFac%type  ) return TypLst_LotFacInf Pipelined is
  Cursor cCur is
  SELECT LotFac.IdtLotfac ,
          LotFac.LibAbr LibLotFac ,
          LotTyp.IdtLotTyp ,
          LotTyp.Lib LibLotTyp ,
          LotFac.IdtCntOpr IdtCntOpr ,
          CntOpr.Lib LibCntOpr ,
          Str.AdrLbr AdrLbrCntOpr,
          LibPrdLotFac(pIdtLotfac ) PrdLotFac,
          Lotfac.DatCrt DatCrtLotfac,
          Lotfac.DatDbtPrd 
  from LotFac, LotTyp, CntOpr, Str 
  where LotFac.IdtLotFac = pIdtLotfac
  and Lotfac.IdtLotTyp = LotTyp.IdtLotTyp
  and CntOpr.IdtCntOpr = Str.IdtCntOpr
  and LotFac.IdtCntOpr = CntOpr.IdtCntOpr; 

  rCur TypLotFacInf;
  type typCUR is table of cCur%ROWTYPE index by binary_integer;
  tCur typCUR;

  begin
    open cCur;
    fetch cCur
      bulk collect into tCur;
    close cCur;
    
    for i in 1..tCur.Count loop
      rCur.IdtLotfac    := tCur(i).IdtLotfac;
      rCur.LibLotFac    := tCur(i).LibLotFac;
      rCur.IdtLotTyp    := tCur(i).IdtLotTyp;
      rCur.LibLotTyp    := tCur(i).LibLotTyp;
      rCur.IdtCntOpr    := tCur(i).IdtCntOpr;
      rCur.LibCntOpr    := tCur(i).LibCntOpr;
      rCur.AdrLbrCntOpr := tCur(i).AdrLbrCntOpr;
      rCur.PrdLotFac    := tCur(i).PrdLotFac;
      rCur.DatCrtLotfac := tCur(i).DatCrtLotfac;
      rCur.DatDbtPrd    := tCur(i).DatDbtPrd;
      PIPE ROW(rCur); 
    end loop;

    return ;
  end InfoLotFac;
--------------------------------------------------------------------------------
-- Commentaire --
--------------------------------------------------------------------------------
function FacTtlExg( pIdtCntOpr Fac.IdtCntOpr%type,
                    cIdtCntOpr Varchar2,
                    pidtcltDst Clt.IdtClt%type,
                    pIdtCtr    Ctr.IdtCtr%type,
                    pMntHt     Fac.MntHt%type,
                    pMntTva    Fac.MntTva%type,
                    psldexgant Fac.sldexgant%type) return Fac.MntHt%type
is
vResult Fac.MntHt%type;
begin
  vResult :=  CASE
                WHEN pidtcntopr in (cIdtCntOpr)
                THEN sldglbdst (pidtcltDst, pidtctr) - NVL (pmntht, 0) - NVL (pmnttva, 0)
              ELSE NVL (psldexgant, 0)
              END;
  return vResult;
end FacTtlExg;
--------------------------------------------------------------------------------
-- Commentaire --
--------------------------------------------------------------------------------
function FacSldGlb( pIdtCntOpr Fac.IdtCntOpr%type,
                    cIdtCntOpr Varchar2,
                    pidtcltDst Clt.IdtClt%type,
                    pidtCptclt CptClt.IdtCptClt%type,
                    pIdtCtr    Ctr.IdtCtr%type) return CptClt.Sld01%type
is
vResult CptClt.Sld01%type;
begin
  vResult :=  CASE
                WHEN pidtcntopr in (cIdtCntOpr) THEN sldglbdst (pidtcltDst, pidtctr)
                ELSE sldglb (pidtcltDst, pidtcptclt)
              END;
  return vResult;
end FacSldGlb;
--------------------------------------------------------------------------------
-- Commentaire --
--------------------------------------------------------------------------------
function FacTbrFsc( pIdtCntOpr Fac.IdtCntOpr%type,
                    cIdtCntOpr Varchar2,
                    pidtcltDst Clt.IdtClt%type,
                    pidtCptclt CptClt.IdtCptClt%type,
                    pIdtCtr    Ctr.IdtCtr%type) return Number
is
vResult Number;
begin
  vResult :=   CASE
                WHEN pidtcntopr in(cIdtCntOpr) THEN
                CASE
                  WHEN (NVL (sldglbdst (pidtcltDst, pidtctr), 0) <= 0) THEN 0
                  ELSE NVL ( LEAST ( gMaxTbrFsc, GREATEST ( gMinTbrFsc, CEIL ( (NVL ( sldglbdst (pidtcltDst, pidtctr), 0)) / 100))), 0)
                END
                ELSE
                  CASE
                    WHEN (NVL (sldglb (pidtcltDst, pidtcptclt), 0) <= 0)
                    THEN 0
                    ELSE NVL ( LEAST ( gMaxTbrFsc, GREATEST ( gMinTbrFsc, CEIL ( (NVL ( sldglb (pidtcltDst, pidtcptclt), 0)) / 100))), 0)
                  END
           END;
  return vResult;
end FacTbrFsc;
--------------------------------------------------------------------------------
-- Commentaire --
--------------------------------------------------------------------------------
function FacMntNetPyrAvcTbr( pMntHt     Fac.MntHt%type,
                             pMntTva    Fac.MntTva%type,
                             pSldExgAnt Fac.SldExgAnt%type
                            ) return Number
is
vResult Number;
begin
  vResult := CASE
               WHEN NVL (pmntht, 0) + NVL (pmnttva, 0) + NVL (psldexgant, 0) <= 0
               THEN NVL (pmntht, 0) + NVL (pmnttva, 0) + NVL (psldexgant, 0)
               ELSE NVL (pmntht, 0) + 
                    NVL (pmnttva, 0) + 
                    NVL (psldexgant, 0) + NVL ( LEAST ( gMaxTbrFsc, GREATEST ( gMinTbrFsc, CEIL ( (  NVL (pmntht, 0) + NVL (pmnttva, 0) + NVL (psldexgant, 0)) / 100))), 0)
              END;
  return vResult;  
end FacMntNetPyrAvcTbr;
--------------------------------------------------------------------------------
-- Commentaire --
--------------------------------------------------------------------------------
function FacDatPrcRlv(  pIdtCycFac  CycFac.IdtCycFac%type,
                        pIdtTypFct  Fac.IdtTypFct%type,
                        pdatlctdrn  Cns.DatLctDrn%type,
                        pdatClc     Fac.DatClc%type ) return Date
is
  vResult Date;
begin
  vResult :=  CASE
                WHEN pidttypfct <> '4' THEN 
                  CASE 
                    WHEN pidtCycFac='T01' THEN Nvl(pDatLctDrn + 90, pdatclc + 90)
                    WHEN pidtCycFac='M01' THEN Nvl(pDatLctDrn + 30, pdatclc + 30)
                  END
              END;
  return vResult;  
end FacDatPrcRlv;
--------------------------------------------------------------------------------
-- Commentaire --
--------------------------------------------------------------------------------
function FacDatPrcFac(  pIdtCycFac  CycFac.IdtCycFac%type,
                        pIdtTypFct  Fac.IdtTypFct%type,
                        pdatlctdrn  Cns.DatLctDrn%type,
                        pdatClc     Fac.DatClc%type ) return Date
is
  vResult Date;
begin
  vResult :=  CASE
                WHEN pidttypfct <> '4' THEN 
                  CASE 
                    WHEN pidtCycFac='T01' THEN Nvl(pDatLctDrn + 104, pdatclc + 104)
                    WHEN pidtCycFac='M01' THEN Nvl(pDatLctDrn + 44, pdatclc + 44)
                  END
              END;
  return vResult;  
end FacDatPrcFac;
end ALG_F3_UTILS;
/
-- alter package ALG_F3_UTILS compile debug;
-- /