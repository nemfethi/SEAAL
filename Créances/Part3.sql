-- La requete suivante prendre la date (trunquee) et le montant des lettrages pour les operation creditrices
SELECT OPR.IdtClt,
      OPR.IdtCptClt,
      OPR.IdtTypOpr,
      OPR.IdtOpr,
      OPR.DatCrt DatCrtOpr,
      OPR.DatExg DatExg,
      OPR.Rfr Rfr,
      LTTCRT.IdtLtt
          IdtLtt,
      -- Si la date du letrage est anterieur a l'operation creditrice, on ne tiens pas en compte
      -- la date du lettrage sinon la date de l'operation
      CASE
          WHEN TRUNC (LTTCRT.DatCrt) < TRUNC (OPR.DatCrt) THEN TRUNC (OPR.DatCrt)
          ELSE TRUNC (LTTCRT.DatCrt)
      END DatCrt,
      LTTCRT.Mnt Mnt
  FROM LTT LTTCRT,
      OPR,
      TYPOPR,
      NTROPR
WHERE     NTROPR.IdtNatOpr = TYPOPR.IdtNatOpr
      AND TYPOPR.IdtTypOpr = OPR.IdtTypOpr
      AND NTROPR.Fin = 1 --Modification pour prendre en compte les operations financieres seulement
      AND LTTCRT.IdtOprCrt = OPR.IdtOpr
--and  opr.idtclt ='484297' --not in ('13659','740413','484297','620324')