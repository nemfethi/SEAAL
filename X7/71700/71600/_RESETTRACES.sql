-- ============================================================
--   Date de création :  27/01/2011
--   Par : JCD
--   Modification     :  
-- ============================================================

SET TERM      OFF
SET HEAD      OFF
SET VERI      OFF
SET FEED      OFF
SET PAUSE     OFF
SET PAGES     0
SET RECSEP    OFF
SET LINES    1000
SET ARRAYSIZE 1
SET NUMWIDTH  12
SET SPACE 0

PROMPT Reactive le tracage tel qu''il etait avant le passage de scripts

-- Sauvegarde de la valeur 
UPDATE systrc.PRMGNR SET TRC=MAJLVR;

-- Désactivation des traces
UPDATE systrc.PRMGNR SET MAJLVR=NULL;

COMMIT;
/


