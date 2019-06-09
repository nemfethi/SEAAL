-- ============================================================
--   Nom de la base   :  X7
--   Nom de SGBD      :  ORACLE Version 9.1.2                    
--   Date de création :  14/11/96
--   Modification     :  19/10/2004 
-- ============================================================


SET TERM      OFF
/*
SET HEAD      OFF
SET VERI      OFF
SET FEED      OFF
SET PAUSE     OFF
SET PAGES     0
SET RECSEP    OFF
SET LINES     1000
SET ARRAYSIZE 1
SET NUMWIDTH  12
SET SPACE 0

PROMPT GENERATION DES GRANT SUR LES OBJECTS DE LA BASE

spool _crgrt.sql

select 'spool crgrt.lst' from dual;

select 'grant all on ' || user || '.' || object_name || ' to public;'
from user_objects where object_type not in ('INDEX','TRIGGER','DATABASE LINK');

select 'spool off' from dual;
select 'PROMPT ERREURS GENEREES DANS crgrt.lst' from dual;

select '/' from dual;
spool off

PROMPT SCRIPT GENERE DANS crgrt.sql
*/


/*------------------------------------------*/
-- Ajout des droits sur les ROLE
/*------------------------------------------*/
DECLARE
	Cursor c_tab is
    (select  user , object_name ,rol
       from user_objects , (
            select distinct rol from fct where rol is not null
        	union 
        	select 'X7SYSUSR' from dual
        	union 
        	select 'X7SYSCAS' from dual
        	union
        	select 'X7SYSADM' from dual) f
       where object_type not in ('INDEX','TRIGGER','DATABASE LINK','LOB')
    minus
    select user, Table_Name, grantee
      from table_privileges --ROLE_TAB_PRIVS
      where owner = user)
    order by 2;
	r_tab c_tab%rowtype;
--		
	PROCEDURE grant_all (u varchar2, o varchar2, r varchar2)
	IS
	TXTSQL varchar2(100);
	BEGIN
	  TXTSQL := 'grant all on ' || u || '.' || o || ' to ' || r;
	  execute immediate TXTSQL;
	EXCEPTION
	  WHEN others THEN
        DBMS_OUTPUT.PUT_LINE('ERREUR ' || TXTSQL );
        DBMS_OUTPUT.PUT_LINE('       ' || to_char(sqlcode) ||' '|| to_char(SQLERRM  ) );
	END;
--	
BEGIN
   open c_tab;
   loop
      fetch c_tab into r_tab;
      exit when c_tab%notfound;
      grant_all(r_tab.user,r_tab.object_name,r_tab.rol);
   end loop;
   close c_tab;
EXCEPTION
WHEN OTHERS THEN
   DBMS_OUTPUT.PUT_LINE('ERREUR ' );
   DBMS_OUTPUT.PUT_LINE('       ' || to_char(sqlcode) ||' '|| to_char(SQLERRM  ) );
END;

/

SET TERM      ON
      
