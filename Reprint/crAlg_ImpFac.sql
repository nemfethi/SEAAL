DROP TABLE X7.ALG_IMPFAC CASCADE CONSTRAINTS;

CREATE TABLE X7.ALG_IMPFAC
(
  IDTCNTOPR               VARCHAR2(2 BYTE),
  IDTCLT                  VARCHAR2(6 BYTE),
  IDTCTR                  INTEGER,
  MNTFCT_NON_SOLDEES_TTC  VARCHAR2(20 BYTE),
  CLIENT_DESTINATAIRE     VARCHAR2(6 BYTE),
  RFR                     VARCHAR2(20 BYTE)
)
TABLESPACE DATA_X7
PCTUSED    0
PCTFREE    10
INITRANS   1
MAXTRANS   255
STORAGE    (
            INITIAL          64K
            MINEXTENTS       1
            MAXEXTENTS       UNLIMITED
            PCTINCREASE      0
            BUFFER_POOL      DEFAULT
           )
LOGGING 
NOCACHE;


CREATE UNIQUE INDEX X7.UNQ_ALG_IMPFAC ON X7.ALG_IMPFAC(RFR)
LOGGING
TABLESPACE DATA_X7
PCTFREE    10
INITRANS   2
MAXTRANS   255
STORAGE    (
            INITIAL          64K
            MINEXTENTS       1
            MAXEXTENTS       UNLIMITED
            PCTINCREASE      0
            BUFFER_POOL      DEFAULT
           );
