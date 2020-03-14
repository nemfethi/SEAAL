-- select replace(DBMS_METADATA.GET_DDL('USER','H'),'CREATE USER','ALTER USER') from dual;

select replace(to_char(replace(DBMS_METADATA.GET_DDL('USER', username),
                               'CREATE USER',
                               'ALTER USER')) || ';',
               CHR(10),
               ''),
       all_users.*
  from ALL_USERS, AGT
 where idtagt = username
 order by to_number(user_id);
