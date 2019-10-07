prompt Importing table ctlhwd...


insert into ctlhwd (IDTHWD, LIB, LIBABR, VLRDFT, LIBINT, FCTCTL, CTLALT, UTL, IDTSEQ)
values ('dlgRLVSAI01', 'Controle Date de relÃ¨ve (en masse)', 'Controle DatRlv (Masse)', 0, 'Controle DatRlv (Masse)', 'ALG_FCTCTL.CtlDatRlvMss( :dlgRLVSAI01.tblIndRLVSAI01.colDatRlv.lsColumnValues, :dlgRLVSAI01.tblIndRLVSAI01.colNumCpr.lsColumnValues, :sTypMsg, :sRetFctCtl)', 0, 1, 1001);

commit;

prompt Done.
