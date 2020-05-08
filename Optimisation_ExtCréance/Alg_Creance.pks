create or replace package Alg_Creance
as
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
--------------------------------------------------------------------------------
-- Fonctions --
--------------------------------------------------------------------------------
function DetLttOprCrc( pIdtClt Clt.IdtClt%type ) return typLst_LttOprCrc pipelined;
function DetLttEchCrc( pIdtClt Clt.IdtClt%type ) return typLst_LttOprCrc pipelined;
function DetLttOprAllCrc( pIdtClt Clt.IdtClt%type ) return typLst_LttOprCrc pipelined;
procedure TRTAGECRECLT(pDatTrt IN Date, pIdtClt CLT.IdtClt%type);
procedure TRTAGECRE(pDatTrt IN Date);
PROCEDURE TCHE_TRTAGECRE;
end Alg_Creance;
/