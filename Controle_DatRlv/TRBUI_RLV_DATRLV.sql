CREATE OR REPLACE TRIGGER "TRBUI_RLV_DATRLV"
--SJ 13/06/2012 - traitement spécifique pour Alger de la fiche 10167
  BEFORE UPDATE or INSERT ON X7.RLV
  FOR EACH ROW

BEGIN

  if (:new.datRlv > sysdate) then
    RAISE_APPLICATION_ERROR(-20101,
                            'La date de relève n''est pas correcte');
  end if;

EXCEPTION
  when others then
    raise;
END;
/