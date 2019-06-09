spool crvue.lst

PROMPT ===================================================================
PROMPT
PROMPT CRVUE.SQL : CREATION DES VUES / FILTRES SUR LES DONNEES
PROMPT
PROMPT ===================================================================
-----------------------------------------------------------------------------------------
-- Maj     : 14/10/2004
-- Par     : HNG
-- Contenu : Ajout de commentaires sur les vues principales
-----------------------------------------------------------------------------------------

col uti FOR A15 NEW_VALUE uti noprint
select user uti from dual;

create or replace view PNTLVR_VIEW
as
select * from pntlvr
where pntlvr.idtcntopr 
           in 
           (select cntopragt.idtcntopr 
            from cntopragt 
            where cntopragt.nomcnx = user);

COMMENT ON TABLE PNTLVR_VIEW IS 'Delivery point main view'; 

create or replace view PNTCPG_VIEW
as
select * from pntcpg
where pntcpg.idtcntopr 
           in 
           (select cntopragt.idtcntopr 
            from cntopragt 
            where cntopragt.nomcnx = user);
            
COMMENT ON TABLE PNTCPG_VIEW IS 'Metering point main view'; 

create or replace view INT_VIEW
as
select * from int
where int.idtcntopr 
           in 
           (select cntopragt.idtcntopr 
            from cntopragt 
            where cntopragt.nomcnx = user);

COMMENT ON TABLE INT_VIEW IS 'Work order main view'; 

create or replace view CTR_VIEW
as
select * from ctr
where ettctr = 1
     and 
           ctr.idtcntopr 
           in 
           (select cntopragt.idtcntopr 
            from cntopragt 
            where cntopragt.nomcnx = user)
     and
           ctr.idtcodsns 
           in 
           (select codsblagt.idtcodsns 
            from codsblagt 
            where codsblagt.nomcnx = user);

COMMENT ON TABLE CTR_VIEW IS 'Contrats in normal state main view'; 

create or replace view CTR_ALL_VIEW
as
select * from ctr
where ctr.idtcntopr 
           in 
           (select cntopragt.idtcntopr 
            from cntopragt 
            where cntopragt.nomcnx = user)
     and
           ctr.idtcodsns 
           in 
           (select codsblagt.idtcodsns 
            from codsblagt 
            where codsblagt.nomcnx = user);

COMMENT ON TABLE CTR_ALL_VIEW IS 'All contrats main view'; 

create or replace view CLT_VIEW
as
select * from clt
where clt.idtcntopr 
           in 
           (select cntopragt.idtcntopr 
            from cntopragt 
            where cntopragt.nomcnx = user)
     and
           clt.idtcodsns 
           in 
           (select codsblagt.idtcodsns 
            from codsblagt 
            where codsblagt.nomcnx = user);

COMMENT ON TABLE CLT_VIEW IS 'Client main view'; 

create or replace view CPTCLT_VIEW
as
select * from cptclt
where cptclt.idtcntopr 
           in 
           (select cntopragt.idtcntopr 
            from cntopragt 
            where cntopragt.nomcnx = user)
     and
           cptclt.idtcodsns 
           in 
           (select codsblagt.idtcodsns 
            from codsblagt 
            where codsblagt.nomcnx = user);

COMMENT ON TABLE CPTCLT_VIEW IS 'Costomer account main view'; 

create or replace view CNT_VIEW
as
select * from cnt
where cnt.idtcntopr 
           in 
           (select cntopragt.idtcntopr 
            from cntopragt 
            where cntopragt.nomcnx = user)
     and
           cnt.idtcodsns 
           in 
           (select codsblagt.idtcodsns 
            from codsblagt 
            where codsblagt.nomcnx = user);

COMMENT ON TABLE CNT_VIEW IS 'Any request from a prospect or a customer main view'; 

create or replace view AFF_VIEW
as
select * from aff
where aff.idtcntopr 
           in 
           (select cntopragt.idtcntopr 
            from cntopragt 
            where cntopragt.nomcnx = user)
     and
           aff.idtcodsns 
           in 
           (select codsblagt.idtcodsns 
            from codsblagt 
            where codsblagt.nomcnx = user);

COMMENT ON TABLE AFF_VIEW IS 'Group of events triggered for a customer main view'; 

create or replace view FAC_VIEW
as
select * from fac
where fac.idtcntopr 
           in 
           (select cntopragt.idtcntopr 
            from cntopragt 
            where cntopragt.nomcnx = user)
     and
           fac.idtcodsns 
           in 
           (select codsblagt.idtcodsns 
            from codsblagt 
            where codsblagt.nomcnx = user);

COMMENT ON TABLE FAC_VIEW IS 'Bill (fluids, payments, costs, penalties, ...) main view'; 

create or replace view LOTTYP_VIEW
as
select * from lottyp
where lottyp.idtcntopr 
           in 
           (select cntopragt.idtcntopr 
            from cntopragt 
            where cntopragt.nomcnx = user)
     and
           lottyp.idtcodsns 
           in 
           (select codsblagt.idtcodsns 
            from codsblagt 
            where codsblagt.nomcnx = user);

COMMENT ON TABLE LOTTYP_VIEW IS 'Standard billing batch main view'; 

create or replace view LOTFAC_VIEW
as
select * from lotfac
where lotfac.idtcntopr 
           in 
           (select cntopragt.idtcntopr 
            from cntopragt 
            where cntopragt.nomcnx = user)
     and
           lotfac.idtcodsns 
           in 
           (select codsblagt.idtcodsns 
            from codsblagt 
            where codsblagt.nomcnx = user);

COMMENT ON TABLE LOTFAC_VIEW IS 'Billing batch main view'; 

create or replace view TRNTYP_VIEW
as
select * from trntyp
where trntyp.idtcntopr 
           in 
           (select cntopragt.idtcntopr 
            from cntopragt 
            where cntopragt.nomcnx = user)
     and
           trntyp.idtcodsns 
           in 
           (select codsblagt.idtcodsns 
            from codsblagt 
            where codsblagt.nomcnx = user);

COMMENT ON TABLE TRNTYP_VIEW IS 'Set of addresses from the smallest level main view'; 

create or replace view LGNCSS_VIEW
as
select * from lgncss
where lgncss.idtcntopr 
           in 
           (select cntopragt.idtcntopr 
            from cntopragt 
            where cntopragt.nomcnx = user)
     and
           lgncss.idtcodsns 
           in 
           (select codsblagt.idtcodsns 
            from codsblagt 
            where codsblagt.nomcnx = user);

COMMENT ON TABLE LGNCSS_VIEW IS 'Cash operations detail main view'; 


CREATE OR REPLACE FORCE VIEW X7.CTRFRN_VIEW
AS
    SELECT *
     FROM ctrfrn
    WHERE     1 = 1
          AND ctrfrn.idtcntopr IN (SELECT cntopragt.idtcntopr
                                  FROM cntopragt
                                 WHERE cntopragt.nomcnx = USER)
          AND ctrfrn.idtcodsns IN (SELECT codsblagt.idtcodsns
                                  FROM codsblagt
                                 WHERE codsblagt.nomcnx = USER);


/

PROMPT ===================================================================
PROMPT
PROMPT CRVUE.SQL : FIN CREATION DES VUES / FILTRES SUR LES DONNEES
PROMPT
PROMPT ===================================================================

spool off
