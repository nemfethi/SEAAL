CREATE TABLE my_server_errors (msg VARCHAR2 (4000));
 
CREATE OR REPLACE TRIGGER failed_to_extend_temp
   AFTER SERVERERROR
   ON DATABASE
DECLARE
   l_sql_text   ora_name_list_t;
   l_n          NUMBER;
BEGIN
   IF (is_servererror (1652)) THEN
      INSERT INTO my_server_errors VALUES ('ora_sysevent = '      || ora_sysevent);
      INSERT INTO my_server_errors VALUES ('ora_login_user = '    || ora_login_user);
      INSERT INTO my_server_errors VALUES ('ora_server_error = '  || ora_server_error (1));

      l_n := ora_sql_txt (l_sql_text);

      FOR i IN 1 .. l_n
      LOOP
         INSERT INTO my_server_errors VALUES ('l_sql_text(' || i || ') = ' || l_sql_text (i));
      END LOOP;
   END IF;
END;
/