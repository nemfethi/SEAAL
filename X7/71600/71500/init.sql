spool X7.lst
set ARRAYSIZE 1

PROMPT ====================================================================
PROMPT
PROMPT STARTING THE UPDATE OF X7 DATABASE FROM VERSION 71600
PROMPT
PROMPT ====================================================================

select name from v$database;
show user

PROMPT First time of trigger management
ALTER TRIGGER X7.TRC_PRMGNR DISABLE;

PROMPT STOP HISTORIC
@_STOPTRACES.sql

PROMPT UPDATE OF THE DATABASE STRUCTURE (liste.sql)
@liste.sql

PROMPT UPDATE OF THE DATABASE STRUCTURE (listeCompile.sql)
@listeCompile.sql

--PROMPT CREATION OF PACKAGES DECLARATIONS (listepks.sql)
--@listepks.sql
--
--PROMPT CREATION OF PACKAGES (listepkb.sql)
--@listepkb.sql

PROMPT CREATION OF VIEWS (_crvue.sql) 
spool off
@_crvue.sql
spool X7.lst append

PROMPT CREATION OF GRANTS ET SYNONYMS
PROMPT (_GENCRGRT.SQL)
@_GENCRGRT.SQL
PROMPT (_GENCRSYN.SQL)
spool off
@_GENCRSYN.SQL
spool X7.lst append
PROMPT (_CRSYN.SQL)
spool off
@_CRSYN.SQL
spool X7.lst append
PROMPT (_CRSYNVUE.SQL)
spool off
@_CRSYNVUE.SQL
spool X7.lst append

PROMPT (_ATTRIBROLES.SQL)
@_ATTRIBROLES.SQL

PROMPT RESET HISTORIC
@_RESETTRACES.sql


spool off

spool X7_Compile.lst

PROMPT COMPILE DATABASE SHEMA AND CONTROL
@_COMPILE.SQL
@_INVALID.SQL

update prmgnr set VERSION = '71600';
update prmgnr set SITVRS = 0;

commit;

PROMPT ====================================================================
PROMPT
PROMPT ENDING THE UPDATE OF X7 DATABASE
PROMPT
PROMPT ====================================================================

spool off

PROMPT Results are in the spool file X7.lst
EXIT
