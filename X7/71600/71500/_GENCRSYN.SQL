-- ============================================================
--   Nom de la base   :  X7
--   Nom de SGBD      :  ORACLE Version 9.1.2                  
--   Date de création :  14/11/96
--   Modification     :  19/10/2004 
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

PROMPT GENERATION DES SYNONYMS SUR LES OBJECTS DE LA BASE

spool _crsyn.sql

select 'spool crsyn.lst' from dual;

select 'create or replace public synonym ' || object_name  || ' for ' || user || '.' || object_name || ';'
from user_objects
where object_type in ('TABLE','VIEW','PROCEDURE','FUNCTION','PACKAGE','SEQUENCE');

select 'spool off' from dual;
select 'PROMPT ERREURS GENEREES DANS crsyn.lst' from dual;

select '/' from dual;
spool off

PROMPT SCRIPT GENERE DANS crsyn.sql
