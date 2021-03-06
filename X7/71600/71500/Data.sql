-- ****************************************************************************
-- ***********  Script containing NEW AND MODIFIED DATA               *********
-- ***********  for this new version                                  *********
-- ***********                                                        *********
-- ***********  Author:  X7 Product Team           Version : 71600    *********
-- ***********                                                        *********
-- ****************************************************************************
-- ****************************************************************************
-- ***********                                                        *********
-- ***********  WARNING BEFORE RUNNING THIS SCRIPT :                  *********
-- ***********                                                        *********
-- ***********  - Check data and translate if needed                  *********
-- ***********  - NEVER translate column called LIBINT                *********
-- ***********  - Table and column comments should be kept in English *********
-- ***********                                                        *********
-- ****************************************************************************

---ATTENTION AUX INSERT DANS LES TABLES DES PARAMETRAGES SANS PK CAR CA GENERE DES DOUBLONS 
---SI LA MISE A JOUR EST RE-LANCEE! 
spool Data.lst
PROMPT ====================================================================
PROMPT Debut Data.sql
PROMPT ====================================================================
-------------------------------------------------------------------------------

insert into TRT
    (CODTRT,LIB, LIBINT)
    values
    ('40220RGRRBQ','Facture - Règles de facturation - Regroupement de rubriques','Facture - Règles de facturation - Regroupement de rubriques');


COMMIT;

PROMPT ====================================================================
PROMPT Fin Data.sql
PROMPT ====================================================================

spool off
/