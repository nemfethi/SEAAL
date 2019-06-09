ALTER TABLE X7.INT  DROP CONSTRAINT FK12_INT;

ALTER TABLE X7.INT DROP CONSTRAINT FK1_INT;


declare
    vsql varchar2(333);
begin
    for cur in (
        select a.idtagt,A.NOMCNX,a.idtfct
        ,decode(a.idtfct,1,'X7SYSCAS',2,'X7SYSCAS',3,'X7SYSADM',4,'X7SYSADM','X7SYSUSR') rr
        ,r.*
        from agt a, fct f, DBA_ROLE_PRIVS r
        where a.idtfct = f.idtfct
        and A.NOMCNX = R.GRANTEE
        and R.GRANTED_ROLE(+) in ('X7SYSUSR','X7SYSCAS','X7SYSADM')
    )loop
        vsql := 'REVOKE ' || cur.GRANTED_ROLE || ' FROM ' || cur.NomCnx;
        DBMS_OUTPUT.PUT_LINE(vsql) ;
        execute immediate vsql; 
    end loop;
end;
/

declare
    vsql varchar2(333);
    vrol varchar2(333);
begin
    for cur in (
        select a.idtagt,A.NOMCNX,a.idtfct
        --,decode(a.idtfct,1,'X7SYSCAS',2,'X7SYSCAS',3,'X7SYSADM',4,'X7SYSADM','X7SYSUSR') rr
        --,(select count(*) from DBA_ROLE_PRIVS r where A.NOMCNX = R.GRANTEE and R.GRANTED_ROLE in ('X7SYSCAS','X7SYSADM','X7SYSUSR')) r
        from agt a 
        where exists (select 1 from all_users where username = a.nomcnx) 
    )loop
        --if cur.idtfct in (1,2) then 
        --    vrol := 'X7SYSCAS';
        --elsif cur.idtfct in (3,4) then 
        --    vrol := 'X7SYSADM';
        --else 
        --    vrol := 'X7SYSUSR';
        --end if;
		vrol := 'X7SYSUSR';
        vsql := 'GRANT ' || vrol || '  TO "' || cur.NomCnx ||'" WITH ADMIN OPTION ';
        DBMS_OUTPUT.PUT_LINE(vsql) ;
        execute immediate vsql;
        vsql := 'ALTER USER  "' || cur.NomCnx ||'" DEFAULT ROLE ' || vrol;  
        DBMS_OUTPUT.PUT_LINE(vsql) ;
        execute immediate vsql;
    end loop;
end;
/


