-- ****************************************************************************
-- ***********  Script of generation of X7 policies                   *********
-- ***********                                                        *********
-- ***********                                                        *********
-- ***********  Author:  X7 Product Team           Version : 60800    *********
-- ***********                                                        *********
-- ****************************************************************************
-- ****************************************************************************
-- ***********                                                        *********
-- ***********  WARNING THIS SCRIPT MUST NOT BE MODIFIED              *********
-- ***********  If needed call X7Support@infeo.fr                     *********
-- ***********                                                        *********
-- ****************************************************************************

-------------------------------------------------------------------------------
SET TERM      OFF
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

PROMPT GENERATES LINES IN HBL TABLE FOR EACH PROFIL

-------------------------------------------------------------------------------
-- > on insere ici les nouvelles habilitations des nouvelles fenetres.

insert into hbl
(IDTPRF,VSL,CRT,MDF,SPR,CODTRT)
select IDTPRF, 0 , 0 , 0 , 0 ,CODTRT
from
(select t.CODTRT , p.IDTPRF 
from trt t,
(select distinct idtprf from prf) p
minus
select h.CODTRT , h.IDTPRF
from hbl h
);

commit;


-- > Fin de l'insertion
-------------------------------------------------------------------------------

--PROMPT SCRIPT GENERATED IN inserthbl.sql

/
