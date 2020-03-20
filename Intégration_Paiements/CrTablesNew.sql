Drop table  Alg_Satim_Ent purge;
CREATE TABLE Alg_Satim_Ent 
(
  IdtTrt  number NOT NULL,
  DatTrt  Date,
  nBrEnt  NUMBER,
  DatFrom Date,
  DatTo   Date,
  Stt     Varchar2(1),
  RfrFic  Varchar2(255
  )
);

Drop table  Alg_Satim_Dtl purge;
CREATE TABLE Alg_Satim_dTL 
(
  IdtTrt  number NOT NULL,
  IdtClt  Varchar2(6),
  RefAut  Varchar2(255),
  DatVlr    Date,
  Mnt     number
);