create or replace package Alg_Creance_2
as
--------------------------------------------------------------------------------
-- Constantes --
--------------------------------------------------------------------------------
gPkgName Varchar2(255) := 'ALG_CREANCE_2';
--------------------------------------------------------------------------------
-- Structures --
--------------------------------------------------------------------------------
TYPE typLttOprCrc is record (IdtClt   CLT.IdtClt%type,
                            IdtCptClt CptClt.IdtCptClt%type,
                            IdtTypOpr Opr.IdtTypOpr%type,
                            IdtOpr    Opr.IdtOpr%type,
                            DatCrtOpr Opr.DatCrt%type,
                            DatExg    Opr.DatCrt%type,
                            Rfr       Opr.Rfr%type,
                            IdtLtt    Ltt.IdtLtt%type,
                            DatCrt    Opr.DatCrt%type,
                            mnt       Opr.Mnt%type);
type typLst_LttOprCrc is table of typLttOprCrc;

type typDetSldOpr is record (IdtClt   CLT.IdtClt%type,
                            IdtCptClt CptClt.IdtCptClt%type,
                            IdtTypOpr Opr.IdtTypOpr%type,
                            IdtOpr    Opr.IdtOpr%type,
                            DatCrt    Opr.DatCrt%type,
                            DatExg    Opr.DatCrt%type,
                            Rfr       Opr.Rfr%type,
                            DatDeb    Opr.DatCrt%type,
                            IdtLtt    Ltt.IdtLtt%type,
                            DatFin    Opr.DatCrt%type,
                            mnt       Opr.Mnt%type,
                            Sld       Opr.Mnt%type,
                            DatTrt    Opr.DatCrt%type);
type typLst_DetSldOpr is table of typDetSldOpr;

--------------------------------------------------------------------------------
-- Fonctions --
--------------------------------------------------------------------------------
function VersionPkg return varchar2;
Function DetLttOprCrc( pIdtClt Clt.IdtClt%type ) return typLst_LttOprCrc pipelined;
Function DetLttEchCrc( pIdtClt Clt.IdtClt%type ) return typLst_LttOprCrc pipelined;
Function DetLttOprAllCrc( pIdtClt Clt.IdtClt%type ) return typLst_LttOprCrc pipelined;
Function DetSldOpr( pDatTrt IN Date, pIdtClt Clt.IdtClt%type ) return typLst_DetSldOpr pipelined;
--------------------------------------------------------------------------------
-- Procedures --
--------------------------------------------------------------------------------
Procedure TRTAGECRECLT( pDatTrt IN Date, pIdtClt CLT.IdtClt%type);
Procedure TRTAGECRE( pDatTrt IN Date);
Procedure TCHE_TRTAGECRE;
procedure RepriseTche( pDatTrt IN Date);
procedure RepriseClt(pDatTrt IN Date, pIdtClt CLT.IdtClt%type, pIdtCntOpr Clt.IdtCntOpr%type) ;
end Alg_Creance_2;
/