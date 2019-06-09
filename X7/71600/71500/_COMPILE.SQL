-- XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
-- Script de creation de compilation d'objets invalids
----------------------------------------------------------------------------------
-- Creation JCD: 24 01 2008
----------------------------------------------------------------------------------
-- NOTES: - Repris sur internet sur 
-- http://asktom.oracle.com/pls/asktom/f?p=100:11:0::::P11_QUESTION_ID:1418403973266
--       
----------------------------------------------------------------------------------
-- Parametres: aucun
----------------------------------------------------------------------------------
-- Historique de modifications
--================================================================================
-- Date    : 
-- Par     :
-- Contenu :
----------------------------------------------------------------------------------

column u new_val uname
select user u from dual;

drop table compile_schema_tmp;


create global temporary table compile_schema_tmp
( object_name varchar2(30),
  object_type varchar2(30),
  constraint compile_schema_tmp_pk
  primary key(object_name,object_type)
)
on commit preserve rows;

grant all on compile_schema_tmp to public;


--We start the script by getting the currently logged in users username into a SQLPlus 
--macro variable.  We will use this later in our create or replace procedures below.  The 
--temporary table is used by our procedures to ¡§remember¡¨ what objects we have attempted 
--to compile.  We need to use ¡§on commit preserve rows¡¨ because of the fact that we are 
--going to do DDL in our procedure (the alter compile command is DDL) and DDL commits.  
--Next, we can start in on the procedures we need:

create or replace
procedure get_next_object_to_compile( p_username in varchar2,
                                      p_cmd out varchar2,
                                      p_obj out varchar2,
                                      p_typ out varchar2 )
as
begin  
      select 'alter ' || 
          decode( object_type, 'PACKAGE BODY', 'PACKAGE', object_type ) || ' "'
           || p_username || '"."' || object_name || '" ' || 
          decode( object_type, 'PACKAGE BODY', ' compile body',
                  ' compile' ), object_name, object_type
      into p_cmd, p_obj, p_typ
      --from dba_objects a
      from user_objects a
     where 
       -- owner = upper(p_username)
       status = 'INVALID'
       and object_type <> 'UNDEFINED'
       and not exists ( select null
                          from compile_schema_tmp b
                         where a.object_name = b.object_name
                           and a.object_type = b.object_type
                      )
       and rownum = 1;

    insert into compile_schema_tmp
    ( object_name, object_type )
    values
    ( p_obj, p_typ );
end;
/

--This is a definers rights procedure that accesses the DBA_OBJECTS view for us.  This will 
--return ¡§some¡¨ invalid object to be compiled ¡V as long as we have not yet attempted to 
--compile it.  It just finds the first one.  As we retrieve them, we ¡§remember¡¨ them in 
--our temporary table.  Next we have our invokers rights routine that will actually do the 
--compilation.  This also shows why we needed the ¡§column u new_val uname¡¨ directive 
--above ¡V we need to physically insert the OWNER of the temporary table in here to avoid 
--having to use a synonym.  Since we do this dynamically upon install ¡V it makes it better 
--then a synonym:

create or replace procedure compile_schema( p_username in varchar2 )
authid current_user
as
    l_cmd  varchar2(512);
    --l_obj  dba_objects.object_name%type;
    --l_typ  dba_objects.object_type%type;
    
    -- JCD: on utilise la vue dans sys
    l_obj  user_objects.object_name%type;
    l_typ  user_objects.object_type%type;
begin
    delete from X7.compile_schema_tmp;

    loop
        get_next_object_to_compile( p_username, l_cmd, l_obj, l_typ );

        dbms_output.put_line( l_cmd );
        begin
            execute immediate l_cmd;
            dbms_output.put_line( 'Successful' );
        exception
            when others then
                dbms_output.put_line( sqlerrm );
        end;
        dbms_output.put_line( chr(9) );
    end loop;

exception
    when no_data_found then NULL;
end;
/

grant execute on compile_schema to public;


--And that is it ¡V now you can go into any schema that is able to compile some objects and 
--execute:

exec compile_schema('X7');

/*
create or replace
  procedure recompile_invalid_objects is
  cursor inv is 
    SELECT object_type, object_name
    FROM user_objects
    WHERE STATUS = 'INVALID';
    anz integer;
    anz_pref integer;
  begin
     select count(*) into anz
     FROM user_objects
     WHERE STATUS = 'INVALID';
     
     if anz = 0 then return; end if;
     anz_pref := anz + 1;
     
     while anz_pref > anz and anz > 0 loop
        for inv_rec in inv loop
           if inv_rec.object_type like '% BODY' then
              begin
                 execute immediate 'alter ' || substr(inv_rec.object_type, 1, 
instr(inv_rec.object_type, ' BODY') - 1) ||
                                   ' "' || inv_rec.object_name || '" compile body';
              exception when others then null;
              end;
           else
              begin           
                 execute immediate 'alter ' || inv_rec.object_type || ' "' || inv_rec.object_name 
|| '" compile';
              exception when others then null;
              end;              
           end if;
        end loop;
        
        anz_pref := anz;
      
        select count(*) into anz
        FROM user_objects
        WHERE STATUS = 'INVALID';

        
     end loop;
     
     if anz > 0 then
        declare errm varchar2(2048);
        begin
           errm := 'The following ' || anz || ' Objects compiled with error:';
           for inv_rec in inv loop
              if length(errm) < 1950 then
                 errm := errm || chr(10) || inv_rec.object_name || ' (' || inv_rec.object_type || 
')';
              else
                 errm := errm || chr(10) || '...';
                 exit;
              end if;
           end loop;
           raise_application_error(-20001, errm);
        end;
     end if;
     
  end recompile_invalid_objects;
  */
/


