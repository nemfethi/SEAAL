spool CRSYNVUE.lst

PROMPT ===================================================================
PROMPT
PROMPT CRSYNVUE.SQL : CREATION DES SYNONYMES SUR LES VUES
PROMPT
PROMPT ===================================================================

--drop public synonym pntlvr;
--drop public synonym ctr;
--drop public synonym ctr_all;
--drop public synonym clt;
--drop public synonym pntcpg;
--drop public synonym cptclt;
--drop public synonym cnt;
--drop public synonym aff;
--drop public synonym int;
--drop public synonym fac;
--drop public synonym lottyp;
--drop public synonym lotfac;
--drop public synonym trntyp;
--drop public synonym lgncss;
--drop public synonym prx;
--drop public synonym intpkb;


-- JCD le 30/04/2010
--col us FOR A25 NEW_VALUE us noprint
--select user us
--from dual;

--create public synonym pntlvr     for &&us..pntlvr_view;
--create public synonym ctr        for &&us..ctr_view;
--create public synonym ctr_all    for &&us..ctr_all_view;
--create public synonym clt        for &&us..clt_view;
--create public synonym pntcpg     for &&us..pntcpg_view;
--create public synonym cptclt     for &&us..cptclt_view;
--create public synonym cnt        for &&us..cnt_view;
--create public synonym aff        for &&us..aff_view;
--create public synonym int        for &&us..int_view;
--create public synonym fac        for &&us..fac_view;
--create public synonym lottyp     for &&us..lottyp_view;
--create public synonym lotfac     for &&us..lotfac_view;
--create public synonym trntyp     for &&us..trntyp_view;
--create public synonym lgncss     for &&us..lgncss_view;
--create public synonym prx        for &&us..prx_view;
--create public synonym intpkb     for &&us..int;

create or replace public synonym pntlvr     for X7.pntlvr_view;    
create or replace public synonym ctr        for X7.ctr_view;       
create or replace public synonym ctr_all    for X7.ctr_all_view;   
create or replace public synonym clt        for X7.clt_view;       
create or replace public synonym pntcpg     for X7.pntcpg_view;    
create or replace public synonym cptclt     for X7.cptclt_view;    
create or replace public synonym cnt        for X7.cnt_view;       
create or replace public synonym aff        for X7.aff_view;       
create or replace public synonym int        for X7.int_view;       
create or replace public synonym fac        for X7.fac_view;       
create or replace public synonym lottyp     for X7.lottyp_view;    
create or replace public synonym lotfac     for X7.lotfac_view;    
create or replace public synonym trntyp     for X7.trntyp_view;    
create or replace public synonym lgncss     for X7.lgncss_view;    
create or replace public synonym prx        for X7.prx_view;       
create or replace public synonym intpkb     for X7.int;         
create or replace public synonym ctrfrn     for X7.ctrfrn_view;       

/                                                                             
                                                                           
PROMPT =================================================================== 
PROMPT                                                                     
PROMPT CRSYNVUE.SQL : FIN CREATION DES SYNONYMES SUR LES VUES              
PROMPT                                                                     
PROMPT =================================================================== 
                                                                           
spool off                                                                  