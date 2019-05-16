#include 'dft_cste.h'

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

