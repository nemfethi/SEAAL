
SET TERM      ON
SET HEAD      OFF
SET VERI      OFF
SET FEED      OFF
SET PAUSE     OFF
SET PAGES     0
SET REcSEP    OFF
SET LINES     80
SET ARRAYSIZE 1
SET NUMWIDTH  12
SET SPAcE 0

prompt list of invalid views

select    upper(object_name) || ' Invalid view '   from user_objects 
where status!='VALID' and OBJECT_TYPE='VIEW';


PROMPT LIST OF INVALID OBJECTS FOR THE USER

select  substr(object_name,1,30), object_type, last_ddl_time 
from user_objects 
where status!='VALID'
group by object_type, substr(object_name,1,30), last_ddl_time;

select rpad(TRIGGER_NAME,30) || ' disabled on table ' || TABLE_NAME
from user_triggers
where status!='ENABLED'
order by TABLE_NAME;

-- Scripts spécifiques de vérifications:

/




