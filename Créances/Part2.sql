/*Part 2*/
-- La requete suivante prendre la date (trunquee) 
-- et le montant des lettrages pour les factures dans une echeance
SELECT OPRECH.IdtClt,
  OPRECH.IdtCptClt,
  OPRFAC.IdtTypOpr,
  OPRFAC.IdtOpr,
  OPRFAC.DatCrt DatCrtOpr,
  OPRFAC.DatExg DatExg,
  OPRFAC.Rfr Rfr,
  LTTRGL.IdtLtt,
  -- Si la date du letrage est anterieur a l'operation creditrice, on ne tiens pas en compte
  -- la date du lettrage sinon la date de l'operation
  CASE WHEN TRUNC (LTTRGL.DatCrt) < TRUNC (OPRFAC.DatCrt)  THEN TRUNC (OPRFAC.DatCrt)
      ELSE TRUNC (LTTRGL.DatCrt)
  END DatCrt,
  -SUM (DETLTT_VIEW1.Lgn_MntTtc)
FROM DETLTT_VIEW1,
  FAC,
  OPR OPRFAC,
  FACTURESxECHEANCIER,
  OPR OPRECH,
  OPR OPRRGL,
  LTT LTTRGL
WHERE OPRECH.IdtOpr = LTTRGL.IdtOprDbt
  AND OPRRGL.IdtOpr = LTTRGL.IdtOprCrt
  AND FACTURESxECHEANCIER.Rfr_Ech = OPRECH.EchPmt
  AND OPRFAC.IdtOpr = FACTURESxECHEANCIER.IdtOprFac
  AND FAC.NumFct(+) = FACTURESxECHEANCIER.Rfr_Fac
  AND DETLTT_VIEW1.IdtLtt = LTTRGL.IdtLtt
  AND NVL (DETLTT_VIEW1.IdtFac, 0) = NVL (FAC.IdtFac, 0)
  AND OPRRGL.IdtTypOpr NOT IN (6, 11)