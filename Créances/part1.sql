/*Part 1*/
-- La requete suivante prendre la date (trunquee) 
-- et le montant des lettrages pour les operation debitrices
-- sauf les echeanciers
  SELECT OPR.IdtClt,
        OPR.IdtCptClt,
        OPR.IdtTypOpr,
        OPR.IdtOpr,
        OPR.DatCrt DatCrtOpr,
        OPR.DatExg DatExg,
        OPR.Rfr Rfr,
        LTTDBT.IdtLtt,
        -- Si la date du letrage est anterieur a l'operation debitrice, on ne tiens pas en compte
        -- la date du lettrage sinon la date de l'operation
        CASE
            WHEN TRUNC (LTTDBT.DatCrt) < TRUNC (OPR.DatCrt) THEN TRUNC (OPR.DatCrt)
            ELSE TRUNC (LTTDBT.DatCrt)
        END DatCrt,
        -LTTDBT.Mnt Mnt
    FROM LTT LTTDBT,
        OPR OPRCRT,
        OPR,
        TYPOPR,
        NTROPR
  WHERE NTROPR.IdtNatOpr = TYPOPR.IdtNatOpr
        AND TYPOPR.IdtTypOpr = OPR.IdtTypOpr
        AND LTTDBT.IdtOprDbt = OPR.IdtOpr
        AND OPRCRT.IdtOpr = LTTDBT.IdtOprCrt
        AND NTROPR.Fin = 1 --Modification pour prendre en compte les operations financieres seulement
        AND OPRCRT.IdtTypOpr <> DECODE (OPR.IdtTypOpr, 8, 0, 6)