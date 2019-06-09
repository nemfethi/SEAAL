#include 'msg.inc'
#include 'sql.inc'
#include 'dft_cste.h'
#INCLUDE 'o_cstglb.h'

#define TRT TRT8005 ! Code traitement

#define EDTEPR01
#DEFINE IDTTYPTCHE_RTG_FAC 'TRT5016'
#DEFINE IDTTYPTCHE_RPRFAC 'TRT8005'
#DEFINE IDTTYPTCHE_LSTRTG_FAC 'TRT2045'

Begin-Procedure cntoprFacFromFac(#IdtFac, :$IdtCntOpr)

Begin-select 
IdtCntOpr &IdtCntOpr
  let $IdtCntOpr = &IdtCntOpr
From FAC
  where IdtFac = #IdtFac 
End-select 

End-Procedure

! -----------------------------------------------------------------------------
Begin-Procedure cntoprFacFromClt(#IdtFac, :$IdtCntOpr)

Begin-select 
Clt.IdtCntOpr &IdtCntOpr
  let $IdtCntOpr = &IdtCntOpr
From FAC, Clt
  where IdtFac = #IdtFac
  and Clt.idtClt = Fac.IdtClt 
End-select 

End-Procedure

! -----------------------------------------------------------------------------
BEGIN-PROCEDURE InsTche
  do MSG_DefinirLocalisation ('{TRT}_INSTCHE')
  do MSG_DefinirRequeteCourante ('DELETE TCHE')
  BEGIN-SQL on-error=SQL_Erreur
    delete TCHE 
    where IdtTypTche = {IDTTYPTCHE_LSTRTG_FAC} 
    and IdtAgt = $user 
    and ModDcl = $Mode 
    and (Stt is null or Stt = 'C')
  END-SQL
  do MSG_DefinirRequeteCourante ('INSERT INTO TCHE')
  BEGIN-SQL on-error=SQL_Erreur
    insert into TCHE (IdtTypTche,
                      IdtAgt,
                      ModDcl,
                      DatDmd,
                      DatPrv,
                      Prm1,
                      Prm2,
                      AdrImp,
                      NbrEnt)
              values ({IDTTYPTCHE_LSTRTG_FAC},
                      $user,
                      $Mode,
                      &DatDmdDat,
                      &DatPrv,
                      &IdtLotRtg,
                      &IdtSousLotRtg,
                      &AdrImp,
                      #NbrFac)
  END-SQL
END-PROCEDURE


!-------------------------------------------------------------------------------
!-- Procedure : Maj_Tche
!-- Objectif : Mise ï¿½ jour de l'ï¿½tat de la tï¿½che: $stt
!-------------------------------------------------------------------------------

BEGIN-PROCEDURE Maj_Tche ($rowid, $stt, #NbrEnt)
	 do MSG_DefinirLocalisation ('{TRT}_MAJTCHE')
   do MSG_DefinirRequeteCourante ('UPDATE TCHE set STT = $stt, DATRLS = SYSDATE WHERE ROWID = &ROWID')
   BEGIN-SQL  on-error=SQL_Erreur
    UPDATE TCHE set STT = $stt, DATRLS = SYSDATE, NBRENT = #_NbrFac
	 WHERE ROWID = $rowid
  END-SQL
END-PROCEDURE

!-----------------------------------------------------------------------
!-- Procedure : Rech_Num_Report 
!-- Objectif : Recherche du dernier numï¿½ro de rapport attribuï¿½
!-----------------------------------------------------------------------

Begin-procedure Rech_Num_Report(:#P1_Num_rpt)
	do MSG_DefinirLocalisation ('{TRT}_RECHNUMREPORT')
Begin-Select
seq_rpt.nextval &num_rpt
 let #P1_Num_rpt = &num_rpt
from dual
End-Select
End-Procedure

!---------------------------------------------------------------------------------
!-- Procedure : FctMnt
!-- Objectif : la facture est-elle imprimable en manuel ou pas !
!---------------------------------------------------------------------------------

begin-procedure FctMnl(#IdtFac,:#ValFctMnlUtl, :$ValChp13, :$IdtLot)
  do MSG_DefinirLocalisation ('{TRT}_FCTMNL')
BEGIN-SELECT  
TYPFCT.FctMnlUtl &FctMnlUtl
	let #ValFctMnlUtl = &FctMnlUtl
decode(nvl(AVTCTR.Chp13,0),0,'F1','F2') &chp13
	let $ValChp13 = &chp13
FAC.IdtLotFac &IdtLot
		let $IdtLot = &IdtLot
FROM FAC, TYPFCT, CTRFAC, AVTCTR
WHERE FAC.IdtFac = #IdtFac
  AND FAC.IdtTypFct = TYPFCT.IdtTypFct
  AND Fac.IdtFac = CtrFac.IdtFac(+)
  AND CtrFac.IdtCtr = AvtCtr.IdtCtr(+)
  AND CtrFac.NumAvn = AvtCtr.NumAvn(+)
END-SELECT
END-PROCEDURE  ! Fctmnl

!---------------------------------------------------------------------------------
!-- Procedure : cntoprinfo
!-- Objectif : idtcntopr pour l'appellation du fichier
!---------------------------------------------------------------------------------

begin-procedure cntoprinfo($vIdtLotFac, :$P5_IdtCntOpr)
begin-select
LOTFAC.IdtCntOpr &IdtCntOpr
	let $P5_IdtCntOpr = &IdtCntOpr
From LOTFAC
  where LOTFAC.IdtLotFac = $vIdtLotFac
end-select
end-procedure

!---------------------------------------------------------------------------------
!-- Procedure : cntoprinfoHLT
!-- Objectif : idtcntopr pour l'appellation du fichier
!---------------------------------------------------------------------------------

begin-procedure cntoprinfoHLT(#IdtFac, :$P5_IdtCntOpr)
Begin-select 
IdtCntOpr &IdtCntOpr
  let $P5_IdtCntOpr = &IdtCntOpr
From FAC
  where IdtFac = #IdtFac 
End-select 
 ! show 'cntoprhlt' &IdtCntOpr
end-procedure


!---------------------------------------------------------------------------------
!-- Procedure : infcntopr
!-- Objectif : infos necessaires pour le rapport de génération
!---------------------------------------------------------------------------------

begin-procedure infcntopr($vIdtLotFac, :$P1_IdtCntOpr, :$P2_lib, :$P3_datdbtprd, :$P4_datfinprd)

begin-select 
lotfac.idtcntopr &IdtCntOpr
	let $P1_IdtCntOpr = &IdtCntOpr
cntopr.lib &lib
	let $P2_lib = &lib
lotfac.datdbtprd &datdbtprd
	let $P3_datdbtprd = &datdbtprd
lotfac.datfinprd &datfinprd
	let $P4_datfinprd = &datfinprd
from lotfac, cntopr
where lotfac.idtcntopr = cntopr.idtcntopr
  and lotfac.idtlotfac = $vIdtLotFac
end-select
  
end-procedure

begin-Procedure Solde_Date($pidtclt, $pdate) !Solde du client avant une certaine date
begin-select
sum(Sld) &_Solde 
 let $_Solde = &_Solde
from SLDOPR_VIEW1 
where IdtClt=$pIdtClt 
and datdeb<=to_date($pdate, 'DD/MM/YYYY')
end-select 
End-Procedure

begin-Procedure Solde_Date2($pidtclt, $pdate, :#solde_date) !Solde du client avant une certaine date version 2
begin-select
sum(Sld) &_Solde2 
 let #solde_date = &_Solde2
from SLDOPR_VIEW1 
where IdtClt=$pIdtClt 
and datdeb<=to_date($pdate, 'DD/MM/YYYY')
and NVL(idtltt, 0)=0
end-select 
End-Procedure

BEGIN-PROCEDURE SendSms(#idtfac)
begin-SQL
declare
result varchar2 (100);;
begin
$v :=ALG_KTSMS.SendSMS_HTTP(#idtfac, 2);;
 exception 
when others then
null;;
end;;
end-SQL   
commit 
End-procedure

!-------------------------------------------------------------------------------
!-- Procedure : Maj_SousLotRtg
!-- Objectif : Mise ï¿½ jour de la date d'impression du sous lot de routage
!-------------------------------------------------------------------------------

BEGIN-PROCEDURE Maj_OPR (#IdtOpr)
	 do MSG_DefinirLocalisation ('{TRT}_Maj_OPR')
   do MSG_DefinirRequeteCourante ('UPDATE OPR')
   BEGIN-SQL  on-error=SQL_Erreur
    UPDATE OPR
      set DatImp = sysdate
	 WHERE IdtOpr = #IdtOpr
  END-SQL
END-PROCEDURE

Begin-procedure Timbre_fiscal(#montant_fac, :#Timbre)
BEGIN-select
CASE WHEN (#montant_fac<= 0) THEN 0 ELSE
NVL (LEAST (2500,GREATEST (5, CEIL((#Montant_fac) / 100))), 0)
END &_timbre 
 let #Timbre = &_timbre 
from dual
END-Select
END-PROCEDURE