create or replace procedure ALG_epay_TRT( idTraitement in number, 
                                          nbLignesIntegrees out number,
                                          pErr out Varchar2) is
vIdtCss Css.IdtCss%type :='DC_001';
vSqcCng Css.SqcCng%type;
vIdtDvs Dvs.IdtDvs%type;
vIdtModRgl ModRgl.IdtModRgl%type := 109;
begin
/* intégration dans CSSCNGXXX*/
-- Recherche SqcCng
Select Nvl(SqcCng, 1) into vSqcCng
from Css where IdtCss=vIdtCss;
-- insertion dans CngEnt
insert into CngEnt( IDTCSS,
                    IDTCNG,
                    IDTAGT,
                    DATRGL,
                    TTLCNG,
                    NBRPMTCNG,
                    DATCTL,
                    SITCNG,
                    DATINT,
                    IDTDVS,
                    RFRFIC,
                    DRNNMRLGNCSSCNG,
                    DATCRT) 
                    Select 
                    vIdtCss,
                    vSqcCng,
                    'BATCH',
                    sysdate,
                    sum(Transaction_Montant),
                    Count(*),
                    to_date(null),
                    to_date(null),
                    to_date(null),
                    vIdtDvs,
                    to_char(idTraitement), -- RFRFIC
                    null,
                    sysdate 
                    from Alg_Epay_Dtl 
                    where IdtTrt = idTraitement;
-- insertion CngLgnCss
INSERT INTO CNGLGNCSS
       (IDTCSS, 
       IDTCNG, 
       IDTLGNCSSCNG, 
       REFADDLGNCSSCNG, 
       IDTCLT, 
       IDTCPTCLT, 
       NUMFCT, 
       MNTPMT, 
       MNTAVC, 
       IDTMODRGL, 
       IDTBNQ, 
       IDTGCH, 
       NUMCPTBNC, 
       CLERIB, 
       NOMTRR, 
       NUMCHQ, 
       SITCNG, 
       CODBRRRGT, 
       IDTTYPMVMCNG, 
       IDTFMTCODBRR, 
       NBRANO,
       DATRGL)
Select vIdtCss,
      vSqcCng,
      rownum,
      null,--lpad(#Line,5,' '),
      Epayment_Code_Client,
      1,
      '$NumFct',
      Transaction_Montant,
      0,
      vIdtModRgl, 
      null, 
      null, 
      null, 
      null, 
      null, 
      null, 
      null, 
      null, 
      1, 
      null, 
      null,
      Transaction_date_payment
      from Alg_Epay_Dtl
      where IdtTrt = idTraitement;
-- insertion CngTtx
INSERT INTO CNGTTX (IDTCSS,
                        IDTCNG,
                        IDTMODRGL,
                        TTLENCMODRGL,
                        NBRENCMODRGL)
                 select IdtCss,
                        IdtCng,
                        IdtModRgl,
                        sum(nvl(MntPmt,0) + nvl(MntAvc,0)),
                        count(*)
                   from CNGLGNCSS
                   where IdtCss = vIdtCss
                    and  IdtCng = vSqcCng
                   group by IdtCss,
                            IdtCng,
                            IdtModRgl;

/*Controle*/
Select count(*) into nbLignesIntegrees from Alg_Epay_Dtl
where IdtTrt=idTraitement;

vSqcCng := vSqcCng + 1;
-- Mise a jour CSS
update Css
      set sqcCng = vSqcCng
      where IdtCss = vIdtCss;
return;

exception
  when others then
    pErr:='E';
end ALG_epay_TRT;
/