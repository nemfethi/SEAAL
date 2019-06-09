Drop table IMPGENDIV purge;

create table IMPGENDIV
(
  idtimpentgendiv NUMBER,
  numero          VARCHAR2(254),
  idtpntlvrgen    VARCHAR2(254),
  idtpntcpggen    VARCHAR2(254),
  idtpntlvrdiv    VARCHAR2(254),
  idtpntcpgdiv    VARCHAR2(254),
  anc_IdtTrnTyp   VARCHAR2(254),
  new_IdtTrnTyp   VARCHAR2(254),
  anc_rng         number,
  new_rng         number,
  stt             NUMBER
);