create or replace view ALG_Distribution_V1 as
select a.*,
       clt.AdrLbr,
       Clt.IdtCntOpr,
       trunc(ALG_INTDST.distance(latdst, lngdst, anclat, anclng), 4) dist,
       datdstdtl - ancdat duree,
       extract (hour   from  to_timestamp(to_char(datdstdtl, 'yyyy-mm-dd hh24:mi:ss'), 'yyyy-mm-dd hh24:mi:ss') - to_timestamp(to_char(ancdat, 'yyyy-mm-dd hh24:mi:ss'), 'yyyy-mm-dd hh24:mi:ss')) duree_HH,
       extract (minute from  to_timestamp(to_char(datdstdtl, 'yyyy-mm-dd hh24:mi:ss'), 'yyyy-mm-dd hh24:mi:ss') - to_timestamp(to_char(ancdat, 'yyyy-mm-dd hh24:mi:ss'), 'yyyy-mm-dd hh24:mi:ss'))  duree_Mi,
       extract (second from  to_timestamp(to_char(datdstdtl, 'yyyy-mm-dd hh24:mi:ss'), 'yyyy-mm-dd hh24:mi:ss') - to_timestamp(to_char(ancdat, 'yyyy-mm-dd hh24:mi:ss'), 'yyyy-mm-dd hh24:mi:ss'))  duree_SS,
  from (select alg_dist_dtl.*,
               nvl(lag(latdst) over(partition by idtdst order by datdstdtl),
                   latdst) anclat,
               nvl(lag(lngdst) over(partition by idtdst order by datdstdtl),
                   lngdst) anclng,
               nvl(lag(datdstdtl)
                   over(partition by idtdst order by datdstdtl),
                   datdstdtl) AncDat
          from alg_dist_dtl
           where stt = 'I') a,
       clt
 where a.CltDst = Clt.IdtClt
 order by datdstdtl;
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
create or replace view ALG_Distribution_V2 as
select  a.*,
        clt.AdrLbr,
        a.TrnDst,
        PntCpg.IdtTrnTyp,
        fac.idtfac,
        CtrFac.IdtPrdFac,
        trunc(ALG_INTDST.distance(latdst, lngdst, anclat, anclng), 4) dist,
        24 * (datdstdtl - ancdat) duree_H
  from (select alg_dist_dtl.*,
               nvl(lag(latdst) over(partition by idtdst order by datdstdtl),
                   latdst) anclat,
               nvl(lag(lngdst) over(partition by idtdst order by datdstdtl),
                   lngdst) anclng,
               nvl(lag(datdstdtl)
                   over(partition by idtdst order by datdstdtl),
                   datdstdtl) AncDat
          from alg_dist_dtl
           where stt = 'I') a,
       clt, Fac, CtrFac, Ctr, PntCpg
 where a.CltDst = Clt.IdtClt
 and CtrFac.IdtCtr = Ctr.IdtCtr
 and CtrFac.IdtFac = Fac.IdtFac
 and Ctr.IdtPntLvr = PntCpg.IdtPntLvr
 and Ctr.IdtPntCpg = PntCpg.IdtPntCpg
 and a.NumFct = Fac.NumFct
 order by IdtDst, datdstdtl;
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
create or replace view ALG_Distribution_V3 as
select  IDtdst,
        Clt.IdtCntOpr, 
        TrnDst,
        clt.idtclt, 
        numfct, 
        Opr.datcrt DatVldFct, 
        datdstdtl, 
        datdstdtl-Opr.datcrt delai,
        Opr.Mnt,
        Opr.sld
  from alg_dist_dtl, opr, clt
 where rfr = numfct
   and clt.idtclt = opr.idtclt
and int=1;