-- ****************************************************************************
-- ***********  Script containing NEW AND MODIFIED DATA               *********
-- ***********  for this new version                                  *********
-- ***********                                                        *********
-- ***********  Author:  X7 Product Team           Version : 71700    *********
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


@LSTUSE.sql

INSERT INTO TRT (CODTRT, LIB, LIBINT, LIBARB)
VALUES ('99140FILTRS','Général - Filtres standards','Général - Filtres standards','Général - Filtres standards');  

/* delete lstrtg 
where idtsml in (
select idtsml from lstrtg
minus
select idtsml from sml); */

COMMIT;

PROMPT ====================================================================
PROMPT Fin Data.sql
PROMPT ====================================================================

spool off
/