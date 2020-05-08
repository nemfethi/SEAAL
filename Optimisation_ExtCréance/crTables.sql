Drop table X7_SLDOPR_FNE purge;
create table X7_SLDOPR_FNE
(
  idtclt    VARCHAR2(6),
  idtcptclt NUMBER(2),
  idttypopr NUMBER(3),
  idtopr    NUMBER(10),
  datcrt    DATE,
  datexg    DATE,
  rfr       VARCHAR2(30),
  datdeb    DATE,
  idtltt    NUMBER,
  datfin    DATE,
  mnt       NUMBER,
  sld       NUMBER,
  dattrt    DATE
);