CREATE OR REPLACE FORCE VIEW X7.DICWIZ_VIEW
(
   IDTDICWIZ,
   LG0,
   LG1,
   LG2,
   UTL
)
AS
   SELECT IDTDICWIZ,
          FRA LG0,
          ENG LG1,
          ESP LG2,
          UTL
     FROM DICWIZ
where 1=1;