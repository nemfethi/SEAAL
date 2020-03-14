CREATE TABLE Alg_Satim_Ent 
(
  IdtTrt  number NOT NULL,
  DatTrt  Date,
  nBrEnt  NUMBER,
  DatFrom Date,
  DatTo   Date,
  Stt     Varchar2(1)
);


CREATE TABLE Alg_Satim_Ent 
(
  IdtTrt  number NOT NULL,
  IdtClt  Varchar2(6),
  RefAut  Varchar2(255),
  DatCrt  Date,
  Mnt     number
);