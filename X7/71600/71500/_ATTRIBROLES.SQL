
/*------------------------------------------*/
-- Ajout des droits sur les ROLE
/*------------------------------------------*/
DECLARE
    Cursor c_tab is
        select 'grant all on ' || user || '.' || uo.object_name || ' to '||rol.rol "LIBSQL1"
        from    user_objects uo,
                (select distinct rol from fct where rol is not null
                union 
                select 'X7SYSUSR' from dual
                union 
                select 'X7SYSCAS' from dual
                union
                select 'X7SYSADM' from dual) rol
        where uo.object_type not in ('INDEX','TRIGGER','DATABASE LINK')
        and not exists (
        select 1 
        from table_privileges tp
        where tp.table_name = uo.object_name
          and tp.grantee = rol.rol
          and owner = user
        )
        order by object_name;
    r_tab c_tab%rowtype;
    TXTSQL varchar2(100);
BEGIN
   open c_tab;
   loop
      fetch c_tab into r_tab;
      exit when c_tab%notfound;
         BEGIN
            TXTSQL := r_tab.LIBSQL1;
            DBMS_OUTPUT.PUT_LINE('TXTSQL ' || TXTSQL );
            execute immediate TXTSQL;
         EXCEPTION
         WHEN OTHERS THEN null;
         END;
   end loop;
   close c_tab;
EXCEPTION
WHEN OTHERS THEN
   DBMS_OUTPUT.PUT_LINE('ERREUR ' || TXTSQL );
   DBMS_OUTPUT.PUT_LINE('       ' || to_char(sqlcode) ||' '|| to_char(SQLERRM  ) );
END;
/



/*------------------------------------------*/
-- suppression des droits 'TO PUBLIC'
/*------------------------------------------*/
DECLARE
	Cursor c_tab is
		select 'revoke all on ' || user || '.' || uo.object_name || ' from public' "LIBSQL"
        from user_objects uo
        where object_type not in ('INDEX','TRIGGER','DATABASE LINK')
        and exists (
        select 1 
        from table_privileges tp
        where tp.table_name = uo.object_name
          and tp.grantee = 'PUBLIC'
          and owner = user
        );
	r_tab c_tab%rowtype;
	TXTSQL varchar2(100);
BEGIN
   open c_tab;
   loop
      fetch c_tab into r_tab;
      exit when c_tab%notfound;
	  BEGIN
	     TXTSQL := r_tab.LIBSQL;
		 execute immediate TXTSQL;
         DBMS_OUTPUT.PUT_LINE(TXTSQL) ;
      EXCEPTION
      WHEN OTHERS THEN
	     DBMS_OUTPUT.PUT_LINE('ERREUR ' || TXTSQL );
	     DBMS_OUTPUT.PUT_LINE('       ' || to_char(sqlcode) ||' '|| to_char(SQLERRM  ) );
	  end;
   end loop;
   close c_tab;
END;
/