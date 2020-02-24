select to_char(sysdate, 'DD/MM/YYYY HH24:mi:ss') datimp,
       opr.IdtClt,
       opr.Rfr,
       opr.DatVlr,
       decode(sign(opr.Mnt), +1, abs(opr.Mnt), 0) as debit,
       decode(sign(opr.Mnt), -1, abs(opr.Mnt), 0) as credit,
       opr.Sld,
       abs(opr.Sld) as valsld,
       TypOpr.TYPOPR,
       typopr.libabr libabrtypopr,
       opr.idttypopr,
       opr.InfCpl as Int,
       X.NOM || ' ' || X.PRN as Nom,
       X.adrlbr as Adresse,
       X.idtcntopr,
       X.ancrfr,
       X.CO,
       decode(sign(opr.sld), -1, 'CR', null) as symb,
       opr.idtopr,
       typopr.dbtcrt,
       X.idtctr,
       X.Acv,
       --cprpntcpg.rowid,
       X.NumCpr,
       CASE
        WHEN typopr = 'ANAV'    then 'إلغاء التسبيق'
        WHEN typopr = 'ANDPGR'  then 'إلغاء ايداع الضمان'
        WHEN typopr = 'ANDVS'   then 'إلغاء التقويم المالي'
        WHEN typopr = 'ANEC'    then 'إلغاء رزنامة التقسيط'
        WHEN typopr = 'ANES'    then 'إلغاء القسط الزمني'
        WHEN typopr = 'ANFC'    then 'إلغاء الفاتورة'
        WHEN typopr = 'ANRE'    then 'إلغاء التسوية'
        WHEN typopr = 'ANSLDG'  then 'إلغاء رصيد الضمان'
        WHEN typopr = 'ANTIMB'  then 'إلغاء الطابع الجبائي'
        WHEN typopr = 'ANTRCR'  then 'إلغاء تحويل التسوية'
        WHEN typopr = 'ANTRDB'  then 'إلغاء تحويل المدين'
        WHEN typopr = 'ATRTMC'  then 'إلغاء تحويل الطابع'
        WHEN typopr = 'ATRTMD'  then 'إلغاء الطابع المحول'
        WHEN typopr = 'AVOIR'   then 'تسبيق'
        WHEN typopr = 'DEVIS'   then 'التقويم المالي'
        WHEN typopr = 'ECHE'    then 'القسط الزمني'
        WHEN typopr = 'ECHR'    then 'رزنامة التقسيط'
        WHEN typopr = 'FCTR'    then 'الفاتورة'
        WHEN typopr = 'IMPA'    then 'عائد غير مدفوع'
        WHEN typopr = 'LIBGRN'  then 'إيداع الضمان'
        WHEN typopr = 'REGL'    then 'التسديد'
        WHEN typopr = 'SLDGRN'  then 'رصيد إيداع الضمان'
        WHEN typopr = 'TIMBRE'  then ' الطابع الجبائي'
        WHEN typopr = 'TRREC'   then 'تحويل التسوية'
        WHEN typopr = 'TRRED'   then 'تحويل التسوية للمدين'
        WHEN typopr = 'TRTMC'   then 'تحويل الطابع'
        WHEN typopr = 'TRTMD'   then 'طابع  محول للمدين'
       END typopr_ar,
       ctrfac.idtprdfac,
       case
         when idtcycfac = 'T01' then
          substr(idtprdfac, 1, 4) || ' - ' || substr(idtprdfac, 6) ||
          ' الثلاثي'
         end periode,
        case WHEN X.idtCntopr NOT IN ('20', '21', '22', '29') THEN
            CASE
                WHEN ctrfac.idtcycfac = 'T01' THEN
                    CASE WHEN TO_NUMBER (ctrfac.idtprdfac) <= 200601 THEN 'الجزائرية للمياه' ELSE 'سيال' END
                WHEN ctrfac.idtcycfac = 'M01' THEN
                    CASE WHEN TO_NUMBER (ctrfac.idtprdfac) <= 200603 THEN 'الجزائرية للمياه' ELSE 'سيال' END
                ELSE 
                    CASE WHEN TRUNC (Opr.datcrt) < TO_DATE ('01042006', 'ddmmyyyy') THEN 'الجزائرية للمياه' ELSE 'سيال' END
            END
        ELSE
        CASE 
            WHEN ctrfac.idtcycfac = 'T01' THEN
                CASE WHEN TO_NUMBER (ctrfac.idtprdfac) <= 201201 THEN 'الجزائرية للمياه' ELSE 'سيال' END
            WHEN ctrfac.idtcycfac = 'M01' THEN
                CASE WHEN TO_NUMBER (ctrfac.idtprdfac) <= 201201 THEN 'الجزائرية للمياه' ELSE 'سيال' END
            ELSE
                CASE WHEN TRUNC (Opr.datcrt) < TO_DATE ('01012012', 'ddmmyyyy') THEN 'الجزائرية للمياه' ELSE 'سيال' END
        END
        END ADE_SEAAL_AR
  from TypOpr,
       Fac,
       ctrfac,
       Opr,
       (select cntopr.Lib CO,
               Clt.IdtClt,
               Clt.nom,
               Clt.Prn,
               Ctr.IdtCtr,
               AvtCtr.Idtacv||'-'|| usg.lib Acv,
               Clt.IdtCntOpr,
               Clt.AncRfr,
               Clt.AdrLbr,
               cpr.NumCpr,
               row_number() over ( ORDER BY ctr.DatRsl NULLS LAST, ctr.datcrt) rn
          from cntopr, Clt, ctr, pntcpg, cprpntcpg, cpr, avtctr, usg
         where cntopr.idtcntopr = clt.idtcntopr
           AND clt.idtclt = :prm1
           and CTR.IdtPntLvr = PNTCPG.IdtPntLvr(+)
           and CTR.IdtPntCpg = PNTCPG.IdtPntCpg(+)
           and CPRPNTCPG.IdtPntLvr(+) = PNTCPG.IdtPntLvr
           and CPRPNTCPG.IdtPntCpg(+) = PNTCPG.IdtPntCpg
           and Ctr.Idtctr = avtctr.IdtCtr
           and Avtctr.numavn=Ctr.sqcavn
           and AvtCtr.IdtAcv = usg.idtacv
           and nvl(CPRPNTCPG.RowId, PNTCPG.RowId) =
               (select nvl(max(b.RowId)
                           KEEP(DENSE_RANK LAST ORDER BY DatDps NULLS LAST,
                                DatPos),
                           PNTCPG.RowId)
                  from CPRPNTCPG b
                 where b.IdtPntLvr = PNTCPG.IdtPntLvr
                   and b.IdtPntCpg = PNTCPG.IdtPntCpg)
           and CPR.IdtCpr(+) = CPRPNTCPG.IdtCpr
           and Ctr.IdtCltDst = Clt.IdtClt
           and CTR.IdtCtr = 
               (select max(IdtCtr) KEEP(DENSE_RANK LAST ORDER BY DatRsl NULLS LAST, DatCrt)
                  from CTR b
                 where b.IdtPntLvr = CTR.IdtPntLvr
                   and b.IdtPntCpg = CTR.IdtPntCpg)) x
 where X.IDTCLT = Opr.IDTCLT
   and TypOpr.IdtTypOpr = Opr.IdtTypOpr
   and opr.rfr = fac.numfct(+)
   and opr.IdtClt = :prm1
   and x.rn=1
   and fac.idtfac = ctrfac.idtfac(+)
      -- on elimine les relances et changements de situation 
   and opr.idttypopr not in (50, 51, 52, 15, 16)
 order by datvlr desc