--SJ : le 19/03/2018 traitement de la fiche 15873 : ajoute and fac.datclc between rbqapl.datdbtvald and nvl(RbqApl.datfinvld,fac.datclc)

DROP VIEW X7.FAC_RBQAPL_V1;

CREATE OR REPLACE FORCE VIEW X7.FAC_RBQAPL_V1
(
   IDTFAC,
   IDTRBQ,
   LIBABR,
   VIS,
   VISDTL,
   IMP,
   ORDIMP,
   RBQCMM,
   IMPDTL
)
AS
   SELECT fac.idtfac,
          rbqapl.idtrbq,
          rbqapl.libabr,
          rbqapl.vis,
          rbqapl.visdtl,
          rbqapl.imp,
          rbqapl.ordimp,
          rbqapl.RbqCmm,
          rbqapl.impdtl
     FROM RbqApl, Fac
    WHERE     RbqApl.idtfactyp = TrtFac01.X7_FacTyp_Fac (Fac.IdtFac)
          AND RbqApl.DatDbtFacTyp =
                 (SELECT MAX (DatDbtFacTyp)
                    FROM RbqApl
                   WHERE     DatDbtFacTyp <= Fac.DatClc
                         AND IdtFacTyp = TrtFac01.X7_FacTyp_Fac (Fac.IdtFac))
          and fac.datclc between rbqapl.datdbtvald and nvl(RbqApl.datfinvld,fac.datclc);  

COMMENT ON TABLE X7.FAC_RBQAPL_V1 IS 'Captions applied on a standard bill or estimate main view';



DROP PUBLIC SYNONYM FAC_RBQAPL_V1;

CREATE OR REPLACE PUBLIC SYNONYM FAC_RBQAPL_V1 FOR X7.FAC_RBQAPL_V1;


GRANT DELETE, INSERT, REFERENCES, SELECT, UPDATE, ON COMMIT REFRESH, QUERY REWRITE, DEBUG, FLASHBACK, MERGE VIEW ON X7.FAC_RBQAPL_V1 TO PUBLIC;

GRANT DELETE, INSERT, SELECT, UPDATE, ON COMMIT REFRESH, QUERY REWRITE, DEBUG, FLASHBACK, MERGE VIEW ON X7.FAC_RBQAPL_V1 TO X7SYSADM;

GRANT DELETE, INSERT, SELECT, UPDATE, ON COMMIT REFRESH, QUERY REWRITE, DEBUG, FLASHBACK, MERGE VIEW ON X7.FAC_RBQAPL_V1 TO X7SYSCAS;

GRANT DELETE, INSERT, SELECT, UPDATE, ON COMMIT REFRESH, QUERY REWRITE, DEBUG, FLASHBACK, MERGE VIEW ON X7.FAC_RBQAPL_V1 TO X7SYSUSR;
