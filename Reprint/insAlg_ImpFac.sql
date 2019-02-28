insert into tche (IDTTYPTCHE, IDTAGT, STT, DATDMD, DATRLS, MODDCL, ADRIMP, PRM1, PRM2) 
select 'TRT2005', 'M23361', '', sysdate, to_date(null), 'R', 'LPT1', IdtFac , 'D' from
alg_impfac, fac
where rfr=numfct;