insert into tche (IDTTYPTCHE, IDTAGT, STT, DATDMD, DATRLS, MODDCL, ADRIMP, PRM1, PRM2) 
select 'TRT8005', 'M23361', '', sysdate, to_date(null), 'R', 'LPT1', IdtFac , 'D' from
alg_impfac, fac
where rfr=numfct;


/* insertion des factures de clients avec seulement des factures F + FRS*/
insert into tche (IDTTYPTCHE, IDTAGT, STT, DATDMD, DATRLS, MODDCL, ADRIMP, PRM1, PRM2) 
select 'TRT8005', 'M23361', '', sysdate, to_date(null), 'R', 'LPT1', IdtFac , 'D' from
alg_impfac, fac
where rfr=numfct
and alg_impfac.idtclt in (select idtclt from (
select idtclt, column6 as Ftype, count(*) from alg_impfac
group by idtclt, column6
) group by idtclt
having count(*)=1);

/* pour les tests*/
insert into tche (IDTTYPTCHE, IDTAGT, STT, DATDMD, DATRLS, MODDCL, ADRIMP, PRM1, PRM2) 
select 'TRT8005', 'M23361', '', sysdate, to_date(null), 'R', 'LPT1', IdtFac , 'D' from
alg_impfac, fac
where rfr=numfct
and Alg_impfac.IdtClt in (125892, 80315, 511894, 462590 ,120358,261260, 112309,336487,181987) 