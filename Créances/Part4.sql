/*Part 4*/
-- La requete suivante prendre le montant et la date (trunquee) de l'operation
SELECT IdtClt,
      IdtCptClt,
      OPR.IdtTypOpr,
      IdtOpr,
      DatCrt     DatCrtOpr,
      DatExg,
      Rfr,
      0          IdtLtt,
      TRUNC (DatCrt),
      Mnt
  FROM OPR, TYPOPR, NTROPR
WHERE     NTROPR.IdtNatOpr = TYPOPR.IdtNatOpr
      AND TYPOPR.IdtTypOpr = OPR.IdtTypOpr
      --and opr.idtclt='484297'-- not in ('13659','740413','484297','620324')
      AND NTROPR.Fin = 1 --Modification pour prendre en compte les operations financieres seulement
                                              