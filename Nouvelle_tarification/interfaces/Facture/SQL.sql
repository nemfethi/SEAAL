select idtlotfac, count(*)
  from fac
 where exists (select 1 from lotfac where lotfac.IdtLotfac = fac.IdtLotFac)
 group by idtlotfac
having count(*) >= 100
order by 2 desc;

select idtlotfac, count(*)
  from fac
 where exists (select 1 from lotfac where lotfac.IdtLotfac = fac.IdtLotFac)
 and exists(select 1 from CtrFac, AvtCtr 
                   where Ctrfac.IdtFac = Fac.IdtFac
                     and Ctrfac.IdtCtr = AvtCtr.IdtCtr
                     and CtrFac.NumAvn = AvtCtr.Numavn
                     and IdtAcv='C4')
 group by idtlotfac
having count(*) <= 50
order by 2 desc.