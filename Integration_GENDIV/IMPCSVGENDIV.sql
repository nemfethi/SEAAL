-- Create table
create table IMPCSVGENDIV
(
  numero       VARCHAR2(254),
  idtpntlvrgen VARCHAR2(254),
  idtpntcpggen VARCHAR2(254),
  idtpntlvrdiv VARCHAR2(254),
  idtpntcpgdiv VARCHAR2(254)
)
organization external
(
  type ORACLE_LOADER
  default directory IMPCLT
  access parameters 
  (
    RECORDS DELIMITED BY NEWLINE
    SKIP 1
    FIELDS TERMINATED BY ';' optionally ENCLOSED BY '"'
    MISSING FIELD VALUES ARE NULL
  )
  location (IMPCLT:'GENDIV.csv')
)
reject limit 0;
-- Grant/Revoke object privileges 
grant select on IMPCSVGENDIV to X7SYSADM;
grant select on IMPCSVGENDIV to X7SYSCAS;
grant select on IMPCSVGENDIV to X7SYSUSR;