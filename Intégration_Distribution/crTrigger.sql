CREATE OR REPLACE TRIGGER TRBI_ALG_Dist_ENT
-----------------------------------------------------------------------------------------
-- Maj     :
-- Par     :
-- Contenu :
-----------------------------------------------------------------------------------------
BEFORE INSERT ON ALG_Dist_ENT FOR EACH ROW
BEGIN
      select Seq_ENT_DIST.NextVal into :NEW.IdtDst from dual;
      :NEW.IdtDst := :NEW.IdtDst + 1;
END;
/

CREATE OR REPLACE TRIGGER TRBI_ALG_Dist_DTL
BEFORE INSERT ON ALG_Dist_DTL FOR EACH ROW
DECLARE
    vIdtAgt AGT.IdtAgt%TYPE;
BEGIN
      select Seq_SqcGnr.NextVal * 1000 into :NEW.IdtSqcGnr from dual;
      :NEW.IdtSqcGnr := :NEW.IdtSqcGnr + 21;

END;
/