create or replace package ALG_F3_UTILS
as
--------------------------------------------------------------------------------
-- Version 1.00.00 :
--      Version initiale sur base VM SEAAL Paris    
--------------------------------------------------------------------------------

--------------------------------------------------------------------------------
-- Constantes --
--------------------------------------------------------------------------------
gVersionPkg Varchar2(8) :='1.00.00';  --> version du pkg
gSepQlt     Varchar2(1) :=' ';        --> séparateur de concaténation Qlt
gSepNomPrn  Varchar2(1) :=' ';        --> séparateur de concaténation Nom +  Prénom
gMinTbrFsc  number      := 5;         --> Valeur Min du timbre fiscal
gMaxTbrFsc  number      := 2500;      --> Valeur Max du timbre fiscal
--------------------------------------------------------------------------------
-- Types / Subtypes --
--------------------------------------------------------------------------------  
subtype LotfacPrd_SType is Varchar2(255);
subtype NomPrnClt_SType is Varchar2(255);

type TypLotFacInf is record(IdtLotfac     LotFac.idtLotfac%type,
                            LibLotFac     LotFac.LibAbr%type,
                            IdtLotTyp     LotTyp.idtLotTyp%type,
                            LibLotTyp     LotTyp.LibAbr%type,
                            IdtCntOpr     Lotfac.IdtCntOpr%type,
                            LibCntOpr     CntOpr.lib%type,
                            AdrLbrCntOpr  Str.AdrLbr%type,
                            PrdLotFac     LotfacPrd_SType,
                            DatCrtLotfac  LotFac.DatCrt%type,
                            DatDbtPrd     LotFac.DatDbtPrd%type);
Type TypLst_LotFacInf is table of TypLotFacInf;
--------------------------------------------------------------------------------
-- Fonctions --
--------------------------------------------------------------------------------
function VersionPkg return Varchar2;

function NomPrnClt(pIdtClt Clt.IdtClt%type) return NomPrnClt_SType;
function NomPrnClt(pQlt Qlt.Lib%type, pNom Clt.Nom%type, pPrn Clt.Prn%type) return NomPrnClt_SType;

function FacTtlExg( pIdtCntOpr Fac.IdtCntOpr%type,
                    cIdtCntOpr Varchar2,
                    pidtcltDst Clt.IdtClt%type,
                    pIdtCtr    Ctr.IdtCtr%type,
                    pMntHt     Fac.MntHt%type,
                    pMntTva    Fac.MntTva%type,
                    psldexgant Fac.sldexgant%type) return Fac.MntHt%type;

function FacSldGlb( pIdtCntOpr Fac.IdtCntOpr%type,
                    cIdtCntOpr Varchar2,
                    pidtcltDst Clt.IdtClt%type,
                    pidtCptclt CptClt.IdtCptClt%type,
                    pIdtCtr    Ctr.IdtCtr%type) return CptClt.Sld01%type;

function FacTbrFsc( pIdtCntOpr Fac.IdtCntOpr%type,
                    cIdtCntOpr Varchar2,
                    pidtcltDst Clt.IdtClt%type,
                    pidtCptclt CptClt.IdtCptClt%type,
                    pIdtCtr    Ctr.IdtCtr%type) return Number;

function FacMntNetPyrAvcTbr( pMntHt     Fac.MntHt%type,
                             pMntTva    Fac.MntTva%type,
                             pSldExgAnt Fac.SldExgAnt%type
                            ) return Number;

function Facdatprcrlv(  pIdtCycFac  CycFac.IdtCycFac%type,
                        pIdtTypFct  Fac.IdtTypFct%type,
                        pdatlctdrn  Cns.DatLctDrn%type,
                        pdatClc     Fac.DatClc%type ) return Date;

function FacDatPrcFac(  pIdtCycFac  CycFac.IdtCycFac%type,
                        pIdtTypFct  Fac.IdtTypFct%type,
                        pdatlctdrn  Cns.DatLctDrn%type,
                        pdatClc     Fac.DatClc%type ) return Date;

function LibPrdLotFac(pIdtCycFac Lotfac.IdtCycFac%type,
                      pIdtPrdFac Lotfac.IdtPrdFac%type,
                      pAnn       Lotfac.Ann%type) return LotfacPrd_SType;

function LibPrdLotFac(pIdtLotfac Lotfac.IdtLotFac%type) return LotfacPrd_SType;

function InfoLotFac( pIdtLotfac Lotfac.IdtLotFac%type ) return TypLst_LotFacInf Pipelined;

end ALG_F3_UTILS;
/

alter package ALG_F3_UTILS compile debug;
/