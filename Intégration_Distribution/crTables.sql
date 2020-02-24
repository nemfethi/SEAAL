Drop table Alg_Dist_Ent purge;

Create table Alg_Dist_Ent (
IDTDST number,
FICDST VARCHAR2(255),
DATFIC Date,
STT VARCHAR2(1),
DATIMP Date,
SizeFic number,
DateFic date
);

alter table ALG_DIST_ENT
  add constraint PK_ALG_DIST_ENT primary key (IDTDST);

create unique index unq_algdistent_ficdst on ALG_DIST_ENT (ficdst);

Drop Table  Alg_Dist_Dtl;

Create table Alg_Dist_Dtl (
IDTDST number not null,
CLEDST VARCHAR2(255),
CLTDST VARCHAR2(6),
AGTDST VARCHAR2(6),
STTDST VARCHAR2(1),
COMDST VARCHAR2(255),
-- ORGDATDST VARCHAR2(255),
-- ORGLNGDST VARCHAR2(255),
-- ORGLATDST VARCHAR2(255),
DATDSTDTL Date,
LNGDST number,
LATDST number,
NUMFCT VARCHAR2(10),
TRNDST VARCHAR2(6),
IDTSQCGNR number,
INT number(1),
STT VARCHAR2(1));

create index IDX_ALG_DIST_DTL_IDTDST on ALG_DIST_DTL (IDTDST)     tablespace Index_X7;
create index IDX_ALG_DIST_DTL_NUMFCT on ALG_DIST_DTL (NUMFCT)     tablespace Index_X7;
create index IDX_ALG_DIST_DTL_SQCGNR on ALG_DIST_DTL (IDTSQCGNR)  tablespace Index_X7;
create index IDX_ALG_DIST_DTL_TRNDST on ALG_DIST_DTL (TRNDST)     tablespace Index_X7;

alter table alg_dist_dtl
add constraint FK1_ALGDISTDTL foreign key (IDTDST)
  references alg_dist_ent (IDTDST);

-- drop table logint;

create table LOGINT
(
  idttrt NUMBER(27),
  lgn    VARCHAR2(4000),
  err    VARCHAR2(4000)
);