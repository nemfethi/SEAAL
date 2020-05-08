SELECT a.username, a.sid, a.serial#, a.osuser, b.tablespace, b.blocks, c.sql_text
FROM v$session a, v$tempseg_usage b, v$sqlarea c
WHERE a.saddr = b.session_addr
AND c.address= a.sql_address
AND c.hash_value = a.sql_hash_value
ORDER BY b.tablespace, b.blocks;

SELECT
TABLE_NAME,
LAST_ANALYZED
FROM
DBA_TAB_STATISTICS
WHERE OWNER = 'SYS' AND TABLE_NAME LIKE 'X$%'
ORDER BY LAST_ANALYZED ASC;

--------------------------------------------------------------------------------
-- Diagnostic complet avec trigger --
--------------------------------------------------------------------------------
-- What is the space available in temporary tablespace
  SELECT A.tablespace_name tablespace,
         D.mb_total,
         SUM (A.used_blocks * D.block_size) / 1024 / 1024 mb_used,
         D.mb_total - SUM (A.used_blocks * D.block_size) / 1024 / 1024 mb_free
    FROM v$sort_segment A,
         (  SELECT B.name, C.block_size, SUM (C.bytes) / 1024 / 1024 mb_total
              FROM v$tablespace B, v$tempfile C
             WHERE B.ts# = C.ts#
          GROUP BY B.name, C.block_size) D
   WHERE A.tablespace_name = D.name
GROUP BY A.tablespace_name, D.mb_total;


-- What is the temp segment usage per session
 SELECT S.sid || ',' || S.serial# sid_serial,
         S.username,
         S.osuser,
         P.spid,
         S.module,
         P.program,
         SUM (T.blocks) * TBS.block_size / 1024 / 1024 mb_used,
         T.tablespace,
         COUNT (*) statements
    FROM v$sort_usage T,
         v$session S,
         dba_tablespaces TBS,
         v$process P
   WHERE     T.session_addr = S.saddr
         AND S.paddr = P.addr
         AND T.tablespace = TBS.tablespace_name
GROUP BY S.sid,
         S.serial#,
         S.username,
         S.osuser,
         P.spid,
         S.module,
         P.program,
         TBS.block_size,
         T.tablespace
ORDER BY mb_used;


-- What is the Temp segment usage per statement
  SELECT S.sid || ',' || S.serial# sid_serial,
         S.username,
         Q.hash_value,
         Q.sql_text,
         T.blocks * TBS.block_size / 1024 / 1024 mb_used,
         T.tablespace
    FROM v$sort_usage T,
         v$session S,
         v$sqlarea Q,
         dba_tablespaces TBS
   WHERE     T.session_addr = S.saddr
         AND T.sqladdr = Q.address
         AND T.tablespace = TBS.tablespace_name
ORDER BY mb_used;


-- We can also trap the user and statement involved next time this error is raised
-- Thanks to T. Kyte:

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