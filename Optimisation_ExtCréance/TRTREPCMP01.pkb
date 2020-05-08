CREATE OR REPLACE PACKAGE BODY X7."TRTREPCMP01" is
  subtype typIdxChar is varchar2(30);
  TYPE typLstNumber is table of number index by binary_integer;
--type typLstDetEch is table of typDetEch;

  type typLgn is record (IdtFac number,
                         Idt number,
                         IdtDetLgn number,
                         NumTrn number,
                         IdtTypOpr number,
                         IdtTax varchar2(6),
                         IdtRbq varchar2(6),
                         DatVlr date,
                         DatCrt date,
                         Qte number,
                         MntHt number,
                         MntTva number,
                         MntTtc number,
                         CumMntHt number,
                         CumMntTva number,
                         Tot_Qte number,
                         Tot_MntHt number,
                         Tot_MntTva number,
                         Tot_MntTtc number,
                         Rep_Qte number,
                         Rep_MntHt number,
                         Rep_MntTva number,
                         Rep_MntTtc number,
                         RbqCmm number);
--  type typLstNLgn is table of typLgn index by binary_integer;
  type typLstLgn is table of typLgn index by typIdxChar;
  type typ2DLstLgn is table of typLstLgn index by typIdxChar;
  type typ3DLstLgn is table of typ2DLstLgn index by typIdxChar;
  type typ2DLstDetOpr is table of typLstDetOpr index by typIdxChar;
  type typ2DLstDetLtt is table of typLstDetLtt index by typIdxChar;
  gDatDbtRep date := to_date('01012099','DDMMYYYY');
--  gDatDbtRep date := to_date('01121999','DDMMYYYY');
  gArrCmp number;
--
-------------------------------------------------------------------------------------------------------------
-------------------------------------------------------------------------------------------------------------
-------------------------------------------------------------------------------------------------------------
function DetEch(pIdtOprEch OPR.IdtOpr%TYPE)
  return typLstDetEch pipelined is
  tLstDetEch typLstDetEch;
  vNbr number;
BEGIN
  ClcDetEch(pIdtOprEch, tLstDetEch);
  vNbr := tLstDetEch.Count;
  for i in 1..vNbr loop
    PIPE ROW(tLstDetEch(i));
  end loop;
--  tLstDetEch.Trim(vNbr);
  tLstDetEch.delete;
--  tLstDetEch := typLstDetEch(null);
  return;
END DetEch;
-------------------------------------------------------------------------------------------------------------
-------------------------------------------------------------------------------------------------------------
-------------------------------------------------------------------------------------------------------------
function DetOpr(pIdtOpr OPR.IdtOpr%TYPE)
  return typLstDetOpr pipelined is
  tDetOpr typLstDetOpr;
  vNbr number;
BEGIN
  ClcDetOpr(pIdtOpr, tDetOpr);
  vNbr := tDetOpr.Count;
  for i in 1..vNbr loop
    PIPE ROW(tDetOpr(i));
  end loop;
--  tDetOpr.Trim(vNbr);
  tDetOpr.delete;
--  tDetOpr := typLstDetOpr(null);
  return;
END DetOpr;
-------------------------------------------------------------------------------------------------------------
-------------------------------------------------------------------------------------------------------------
-------------------------------------------------------------------------------------------------------------
function DetLtt (pIdtLtt LTT.IdtLtt%TYPE)
  return typLstDetLtt pipelined is
  tDetLtt typLstDetLtt;
  vNbr number;
BEGIN
  ClcDetLtt(pIdtLtt, tDetLtt);
  vNbr := tDetLtt.Count;
  for i in 1..vNbr loop
    PIPE ROW(tDetLtt(i));
  end loop;
--  tDetLtt.Trim(vNbr);
  tDetLtt.delete;
--  tDetLtt := typLstDetLtt(null);
  return;
END DetLtt;
-------------------------------------------------------------------------------------------------------------
-------------------------------------------------------------------------------------------------------------
-------------------------------------------------------------------------------------------------------------
Procedure ChargerPrm
is
BEGIN
  if gArrCmp is null then
    select ArrCmp
      into gArrCmp
      from PRMGNR;
  end if;
  if gTypDatCmp is null then
    select nvl(DatCmp,cCMP_DATE_VALEUR)
      into gTypDatCmp
      from PRMGNR;
  end if;
END ChargerPrm;
-------------------------------------------------------------------------------------------------------------
-------------------------------------------------------------------------------------------------------------
-------------------------------------------------------------------------------------------------------------
function fIdxLgn(pNumLgnFct number, pIdtDetLgn number, pIdxOpr number default null)
  return typIdxChar
is
  vReturn typIdxChar;
BEGIN
  vReturn := lpad(nvl(pNumLgnFct,0),6,'0') || '-' || lpad(nvl(pIdtDetLgn,0),6,'0');
  if pIdxOpr is not null then
    vReturn := lpad(pIdxOpr,15,'0') || '-' || vReturn;
  end if;
  return vReturn;
END fIdxLgn;
-------------------------------------------------------------------------------------------------------------
-------------------------------------------------------------------------------------------------------------
-------------------------------------------------------------------------------------------------------------
function fIdxOpr(pIdtOpr number)
  return typIdxChar
is
  vReturn typIdxChar;
BEGIN
  vReturn := lpad(nvl(pIdtOpr,0),20,'0');
  return vReturn;
END fIdxOpr;
-------------------------------------------------------------------------------------------------------------
-------------------------------------------------------------------------------------------------------------
-------------------------------------------------------------------------------------------------------------
function fIdxDat(pn number, pIdtOpr number)
  return typIdxChar
is
  vReturn typIdxChar;
BEGIN
  vReturn := lpad(pn,3,'0') || lpad(nvl(pIdtOpr,0),19,'0');
  return vReturn;
END fIdxDat;
-------------------------------------------------------------------------------------------------------------
-------------------------------------------------------------------------------------------------------------
-------------------------------------------------------------------------------------------------------------
-- Procedure de repartition d'une operation (pOpr) sur le detail d'une operation (pFacRbq)
procedure TrtRepPrr (pOpr IN OUT typLgn, pFacRbq IN OUT typLstLgn) is
  vFactorTtc number;
  vFactorTva number;
  vIdxFac typIdxChar;
  vIdxLgn typIdxChar;
  vMntTtc number;
  vMntTva number;
  vMntHt number;
  vQte number;
  vCumTotTtc number;
  vCumTotTva number;
  vCumTotHt number;
  vCumRepTtc number;
  vCumRepTva number;
  vCumRepHt number;
BEGIN
  ChargerPrm;
  vCumTotTtc := 0;
  vCumTotTva := 0;
  vCumTotHt  := 0;
  vCumRepTtc := 0;
  vCumRepTva := 0;
  vCumRepHt  := 0;
  -- L'idee est de obtenir le pourcentage total affecte de toutes les operations (operations affectees dans le passe et l'operation en cours d'affectation)
  -- sur l'operation a affecter, ce qui gere les arrondis
  -- Le facteur multiplicateur est: (Montant deja affecte + montant a affecter) / montant total de l'operation affectee.
  -- Cette formule donne le facteur pour obtenir le montant cumule affecte en incluant l'operation a affecter
  if pOpr.Tot_MntTtc = 0  then
    vFactorTtc := 0;
  else
    vFactorTtc := (pOpr.Rep_MntTtc + pOpr.MntTtc) / pOPR.Tot_MntTtc;
  end if;
  if pOpr.Tot_MntTva = 0  then
    vFactorTva := 0;
  else
    vFactorTva := (pOpr.Rep_MntTva + pOpr.MntTva) / pOPR.Tot_MntTva;
  end if;
  vIdxLgn := pFacRbq.First;
  while vIdxLgn is not null loop
    -- Si le facteur est egale a 1, l'operation affectee est soldee
    if vFactorTtc = 1 then
      vMntTtc := pFacRbq(vIdxLgn).Tot_MntTtc - pFacRbq(vIdxLgn).Rep_MntTtc;
    -- Sinon, l'idee est d'obtenir le montant total affecte de toutes les operations (operations affectees dans le passe et l'operation en cours d'affectation)
    -- sur l'operation a affecter pour ensuite soustraire le montant affecte dans le passe
    -- La formule est: (montant cumule des lignes anterieures + montant de la ligne actuelle) * pourcentage total de repartition -
    -- (montant total deja affecte dans le passe sur les lignes de facture anterieures + montant deja affecte sur la ligne de facture actuelle)
    else
      vMntTtc := round(((vCumTotTtc + pFacRbq(vIdxLgn).Tot_MntTtc) * vFactorTtc - (vCumRepTtc + pFacRbq(vIdxLgn).Rep_MntTtc)),gArrCmp);
    end if;
    --
    if vFactorTva = 1 then
      vMntTva := pFacRbq(vIdxLgn).Tot_MntTva - pFacRbq(vIdxLgn).Rep_MntTva;
    else
      vMntTva := round(((vCumTotTva + pFacRbq(vIdxLgn).Tot_MntTva) * vFactorTva - (vCumRepTva + pFacRbq(vIdxLgn).Rep_MntTva)),gArrCmp);
    end if;
    vMntHt := vMntTtc - vMntTva;
    --
    pFacRbq(vIdxLgn).MntTtc := vMntTtc;
    pFacRbq(vIdxLgn).MntTva := vMntTva;
    pFacRbq(vIdxLgn).MntHt  := vMntHt;
    pFacRbq(vIdxLgn).Rep_MntTtc := nvl(pFacRbq(vIdxLgn).Rep_MntTtc,0) + vMntTtc;
    pFacRbq(vIdxLgn).Rep_MntTva := nvl(pFacRbq(vIdxLgn).Rep_MntTva,0) + vMntTva;
    pFacRbq(vIdxLgn).Rep_MntHt  := nvl(pFacRbq(vIdxLgn).Rep_MntHt,0)  + vMntHt;
    if pFacRbq(vIdxLgn).RbqCmm = 0 then
      vCumTotTtc := vCumTotTtc + pFacRbq(vIdxLgn).Tot_MntTtc;
      vCumTotTva := vCumTotTva + pFacRbq(vIdxLgn).Tot_MntTva;
      vCumTotHt  := vCumTotHt  + pFacRbq(vIdxLgn).Tot_MntHt;
      --
      vCumRepTtc := vCumRepTtc + pFacRbq(vIdxLgn).Rep_MntTtc;
      vCumRepTva := vCumRepTva + pFacRbq(vIdxLgn).Rep_MntTva;
      vCumRepHt  := vCumRepHt  + pFacRbq(vIdxLgn).Rep_MntHt;
    end if;
    --
    vIdxLgn := pFacRbq.Next(vIdxLgn);
  end loop;
END TrtRepPrr;
-------------------------------------------------------------------------------------------------------------
-------------------------------------------------------------------------------------------------------------
-------------------------------------------------------------------------------------------------------------
procedure TrtRep (pMnt IN number, pLstFac IN OUT typLgn, vDatRep date) is
  vFactor number;
  vTypRep number;
BEGIN
  -- vTypRep : 1 ==> Repartition proportionnelle
  --           2 ==> Priorite sur TVA
  ChargerPrm;
  if trunc(vDatRep) >= trunc(gDatDbtRep) then
    vTypRep := cREPARTITION_TVA;
  else
    vTypRep := cREPARTITION_PRORATA;
  end if;
  -- Cas de repartition proportionnelle
  if vTypRep = cREPARTITION_PRORATA then
    if pLstFac.Tot_MntTtc = 0 then
      vFactor := 0;
    else
      vFactor := (pLstFac.Rep_MntTtc + pMnt) / pLstFac.Tot_MntTtc;
    end if;
    if vFactor = 1 then
      pLstFac.MntTva := pLstFac.Tot_MntTva - pLstFac.Rep_MntTva;
    else
      pLstFac.MntTva := round((pLstFac.Tot_MntTva * vFactor), gArrCmp) - pLstFac.Rep_MntTva;
    end if;
  -- Cas de repartition en priorite sur TVA
  elsif vTypRep = cREPARTITION_TVA then
    pLstFac.MntTva := least(pLstFac.Tot_MntTtc, (pLstFac.Tot_MntTva - pLstFac.Rep_MntTva),pMnt);
  end if;
  pLstFac.MntTtc := pMnt;
  pLstFac.MntHt  := pLstFac.MntTtc - pLstFac.MntTva;
END TrtRep;
-------------------------------------------------------------------------------------------------------------
-------------------------------------------------------------------------------------------------------------
-------------------------------------------------------------------------------------------------------------
procedure TrtRepEch (pOprAfc IN OUT typLgn, pOpr IN OUT typLgn, vDatRep date, pLstFac IN OUT typLstLgn, pFacRbq IN OUT typ2DLstLgn) is
  -- A l'entree de cette procedure:
  --   - pOpr contient l'information de l'echeance
  --   - vDatRep date de l'operation echeancier
  --   - pLstFac contient l'information des toutes les factures de l'echeancier
  --   - pFacRbq contient les rubriques de toutes les factures
  --   - Les montants totaux des factures et rubriques correspondent au solde avant cette repartition
  vFactor number;
  vTypRep number;
  vIdxDat typIdxChar;
  vIdxLgn typIdxChar;
  vMntRepHt number  := 0;
  vMntRepTva number := 0;
  vMntRepTtc number := 0;
  vMntCum number    := 0;
BEGIN
  -- vTypRep : 1 ==> Repartition proportionnelle
  --           2 ==> Priorite sur TVA
  --           3 --> Du plus ancien au plus recent
  --           4 --> Du plus recent au plus ancien
  ChargerPrm;
  if trunc(vDatRep) >= trunc(gDatDbtRep) then
    vTypRep := cREPARTITION_TVA;
  else
    vTypRep := gIdtTypRepEch;
  end if;
  -- Le tableau est deja organise selon l'ordre de la repartition
  if vTypRep = cREPARTITION_RECENT or vTypRep = cREPARTITION_ANCIEN then
    vIdxDat := pLstFac.First;
    while vIdxDat is not null loop
      -- Remise a zero des montants pour la repartition du prochain echeance
      pLstFac(vIdxDat).MntHt  := 0;
      pLstFac(vIdxDat).MntTva := 0;
      pLstFac(vIdxDat).MntTtc := 0;
      vIdxLgn := pFacRbq(vIdxDat).First;
      while vIdxLgn is not null loop
        -- Remise a zero des montants pour la repartition du prochain echeance
        pFacRbq(vIdxDat)(vIdxLgn).Qte    := 0;
        pFacRbq(vIdxDat)(vIdxLgn).MntHt  := 0;
        pFacRbq(vIdxDat)(vIdxLgn).MntTva := 0;
        pFacRbq(vIdxDat)(vIdxLgn).MntTtc := 0;
        vIdxLgn := pFacRbq(vIdxDat).Next(vIdxLgn);
      end loop;
      if pOpr.Rep_MntTtc = pOpr.Tot_MntTtc then
        EXIT;
      end if;
      -- Le montant a repartir correspond soit au solde de l'echeance soit au solde de la facture (apres la repartition)
      vMntRepTtc := least((pOpr.Tot_MntTtc - pOpr.Rep_MntTtc), (pLstFac(vIdxDat).Tot_MntTtc - pLstFac(vIdxDat).Rep_MntTtc));
      if vMntRepTtc <> 0 then
        -- On fait une premiere repartition du montant a repartir sur la facture selon les regles de repartition definies
        TrtRep(vMntRepTtc, pLstFac(vIdxDat), vDatRep);
        -- On cumule pour le montant reparti et le montant total de l'echeance
        pOpr.Tot_MntHt  := pOpr.Tot_MntHt  + pLstFac(vIdxDat).MntHt;
        pOpr.Tot_MntTva := pOpr.Tot_MntTva + pLstFac(vIdxDat).MntTva;
        pOpr.MntHt      := pOpr.MntHt  + pLstFac(vIdxDat).MntHt;
        pOpr.MntTva     := pOpr.MntTva + pLstFac(vIdxDat).MntTva;
        pOpr.Rep_MntHt  := pOpr.Rep_MntHt  + pLstFac(vIdxDat).MntHt;
        pOpr.Rep_MntTva := pOpr.Rep_MntTva + pLstFac(vIdxDat).MntTva;
        pOpr.Rep_MntTtc := pOpr.Rep_MntTtc + pLstFac(vIdxDat).MntTtc;
        -- On connait mantenant les montants ht, tva et ttc repartis sur cette facture. On fait la repartition
        -- sur les rubriques pour cette facture
        TrtRepPrr(pLstFac(vIdxDat), pFacRbq(vIdxDat));
        -- On cumule les montants repartis sur la facture
        pLstFac(vIdxDat).Rep_MntHt  := pLstFac(vIdxDat).Rep_MntHt  + pLstFac(vIdxDat).MntHt;
        pLstFac(vIdxDat).Rep_MntTva := pLstFac(vIdxDat).Rep_MntTva + pLstFac(vIdxDat).MntTva;
        pLstFac(vIdxDat).Rep_MntTtc := pLstFac(vIdxDat).Rep_MntTtc + pLstFac(vIdxDat).MntTtc;
      else -- vMntRepTtc <> 0
        -- Pas besoin de cette facture dans l'echeance s'il n'y a rien affecte
        pLstFac.Delete(vIdxDat);
        pFacRbq.Delete(vIdxDat);
      end if; -- vMntRepTtc <> 0
      vIdxDat := pLstFac.Next(vIdxDat);
    end loop;
  else
    -- Cas de repartition proportionnelle
    if vTypRep = cREPARTITION_PRORATA then
      if pOprAfc.Tot_MntTtc = 0 then
        vFactor := 0;
      else
        vFactor := (pOpr.Tot_MntTtc + pOprAfc.Rep_MntTtc) / pOprAfc.Tot_MntTtc;
      end if;
      if vFactor = 1 then
        pOpr.MntTva := pOprAfc.Tot_MntTva - pOprAfc.Rep_MntTva;
      else
        pOpr.MntTva := round((pOprAfc.Tot_MntTva * vFactor), gArrCmp) - pOprAfc.Rep_MntTva;
      end if;
    -- Cas de repartition en priorite sur TVA
    elsif vTypRep = cREPARTITION_TVA then
      pOpr.MntTva := least(pOpr.Tot_MntTtc, (pOprAfc.Tot_MntTva - pOprAfc.Rep_MntTva));
    end if;
    pOpr.MntHt  := pOpr.MntTtc - pOpr.MntTva;
  end if;
END;
-------------------------------------------------------------------------------------------------------------
-------------------------------------------------------------------------------------------------------------
-------------------------------------------------------------------------------------------------------------
procedure ClcDetEch(pIdtOprEch OPR.IdtOpr%TYPE, ptDetEch OUT typLstDetEch, pIdtOprAfc OPR.IdtOpr%TYPE DEFAULT NULL )
is
  --
  tDetLtt typLstDetLtt;
  tLstFac typLstLgn;
  tLstFacSav typLstLgn;
  tLstEch typLstLgn;
  tLstFacRbq typ2DLstLgn;
  --
  rEch typLgn;
  --
  tIdtOprDbt     typLstNumber;
  tIdtOprEch     typLstNumber;
  tIdtTypOpr  typLstNumber;
--  tDatVlr     typLstNumber;
--  tDatCrt     typLstNumber;
  tMntOprDbt        typLstNumber;
  tMntOprEch        typLstNumber;
  tIdtLtt     typLstNumber;
  tMntFacEch  typLstNumber;
  --
  vIdxOpr typIdxChar;
  vIdxEch typIdxChar;
  vIdxLgn typIdxChar;
  i number;
  j number;
  --
  vIdtOpr OPR.IdtOpr%TYPE;
  vIdtTypOprEch TYPOPR.IdtTypOpr%TYPE;
  vEchPmt ECHPMT.EchPmt%TYPE;
  vMntEch OPR.Mnt%TYPE;
  vSgnOpr number;
  vDatVlrEch date;
  vDatCrtEch date;
  --
  vNbr number;
BEGIN
  ptDetEch := typLstDetEch (null);
  -- On recupere l'information de la operation
  select IdtOpr,
         IdtTypOpr,
         EchPmt,
         Mnt
    into vIdtOpr,
         vIdtTypOprEch,
         vEchPmt,
         vMntEch
    from OPR
    where IdtOpr = pIdtOprEch;
  vSgnOpr := sign(vMntEch);
  -- Cette procedure est construite pour les echeances, donc s'il ne s'agit pas
  -- d'une operation du type 7, on sort.
  if vIdtTypOprEch not in (6,7) then
    return;
  end if;
  -- Si l'operation est l'echeance, il faut recuperer les valeurs de l'operation echeancier
  if vIdtTypOprEch = 7 then
    select IdtOpr,
           IdtTypOpr,
           DatVlr,
           DatCrt,
           abs(Mnt)
      into rEch.Idt,
           rEch.IdtTypOpr,
           rEch.DatVlr,
           rEch.DatCrt,
           rEch.MntTtc
      from OPR
      where EchPmt = vEchPmt
       and  IdtTypOpr = 6;
  else
    rEch.Idt       := vIdtOpr;
    rEch.IdtTypOpr := vIdtTypOprEch;
    rEch.DatVlr    := vDatVlrEch;
    rEch.DatCrt    := vDatCrtEch;
    rEch.MntTtc    := abs(vMntEch);
  end if;
  -- Recuperation des informations des operations debits affectees
  -- par l'echeancier
  -- Requete dans le cas d'ordre du plus recent au plus ancien
  -- L'ordre de la requete permet organiser le tableau en memoire
  if gIdtTypRepEch = cREPARTITION_RECENT then
    select LTT.IdtOprDbt,
           OPRDBT.IdtTypOpr,
           OPRDBT.Mnt,
           LTT.IdtLtt,
           LTT.Mnt
      bulk collect into tIdtOprDbt, tIdtTypOpr, tMntOprDbt, tIdtLtt, tMntFacEch
      from OPR OPRDBT, LTT
      where OPRDBT.IdtOpr = LTT.IdtOprDbt
       and  LTT.Mnt > 0
       and  LTT.IdtOprCrt = rEch.Idt
       and  OPRDBT.IdtTypOpr not in (8,24)
--      group by trunc(OPRDBT.DatCrt),
--               LTT.IdtOprDbt,
--               OPRDBT.IdtTypOpr,
--               OPRDBT.Mnt,
--               LTT.Mnt
      order by trunc(OPRDBT.DatCrt) desc, LTT.IdtOprDbt desc;
  else
    select LTT.IdtOprDbt,
           OPRDBT.IdtTypOpr,
           OPRDBT.Mnt,
           LTT.IdtLtt,
           LTT.Mnt
      bulk collect into tIdtOprDbt, tIdtTypOpr, tMntOprDbt, tIdtLtt, tMntFacEch
      from OPR OPRDBT, LTT
      where OPRDBT.IdtOpr = LTT.IdtOprDbt
       and  LTT.Mnt > 0
       and  LTT.IdtOprCrt = rEch.Idt
       and  OPRDBT.IdtTypOpr not in (8,24)
--      group by trunc(OPRDBT.DatCrt),
--               LTT.IdtOprDbt,
--               OPRDBT.IdtTypOpr,
--               OPRDBT.Mnt,
--               LTT.Mnt
      order by trunc(OPRDBT.DatCrt), LTT.IdtOprDbt;
  end if;
  for i in 1..tIdtLtt.Count loop
    -- Recherche de la repartition
    -- On recupere le lettrage d'affectation de l'echancier sur la facture
    ClcDetLtt(tIdtLtt(i), tDetLtt);
    -- Remplissage des tables en memoire avec le detail des factures
    j := tDetLtt.First;
    vIdxOpr := fIdxDat(i,tIdtOprDbt(i));
    while j is not null loop
--      vIdxOpr := fIdxOpr(tIdtOprDbt(i));
      vIdxLgn := fIdxLgn(tDetLtt(j).NumLgnFct,tDetLtt(j).IdtDetLgn);
      --
      tLstFacRbq(vIdxOpr)(vIdxLgn).IdtFac     := tDetLtt(j).IdtFac;
      tLstFacRbq(vIdxOpr)(vIdxLgn).Idt        := tDetLtt(j).NumLgnFct;
      tLstFacRbq(vIdxOpr)(vIdxLgn).IdtDetLgn  := tDetLtt(j).IdtDetLgn;
      tLstFacRbq(vIdxOpr)(vIdxLgn).NumTrn     := tDetLtt(j).NumTrn;
      tLstFacRbq(vIdxOpr)(vIdxLgn).IdtTax     := tDetLtt(j).Lgn_IdtTax;
      tLstFacRbq(vIdxOpr)(vIdxLgn).IdtRbq     := tDetLtt(j).IdtRbq;
      tLstFacRbq(vIdxOpr)(vIdxLgn).Qte        := 0;
      tLstFacRbq(vIdxOpr)(vIdxLgn).MntHt      := 0;
      tLstFacRbq(vIdxOpr)(vIdxLgn).MntTva     := 0;
      tLstFacRbq(vIdxOpr)(vIdxLgn).MntTtc     := 0;
      tLstFacRbq(vIdxOpr)(vIdxLgn).CumMntHt   := 0;
      tLstFacRbq(vIdxOpr)(vIdxLgn).CumMntTva  := 0;
      -- Pour les echeances et les echeanciers, le montant total des rubriques corresponde
      -- au solde de chaque ligne afin de faire le calcul de repartition.
      -- Etant donnee qu'on traite le lettrage de l'echeancier, le solde correspond
      -- au solde + le montant reparti
      tLstFacRbq(vIdxOpr)(vIdxLgn).Tot_Qte    := tDetLtt(j).Lgn_SldQte + tDetLtt(j).Lgn_Qte;
      tLstFacRbq(vIdxOpr)(vIdxLgn).Tot_MntHt  := tDetLtt(j).Lgn_SldHt  + tDetLtt(j).Lgn_MntHt;
      tLstFacRbq(vIdxOpr)(vIdxLgn).Tot_MntTva := tDetLtt(j).Lgn_SldTva + tDetLtt(j).Lgn_MntTva;
      tLstFacRbq(vIdxOpr)(vIdxLgn).Tot_MntTtc := tDetLtt(j).Lgn_SldTtc + tDetLtt(j).Lgn_MntTtc;
      -- Le total par ligne est egal au solde, donc le montant reparti est egal a zero
      tLstFacRbq(vIdxOpr)(vIdxLgn).Rep_Qte    := 0;
      tLstFacRbq(vIdxOpr)(vIdxLgn).Rep_MntHt  := 0;
      tLstFacRbq(vIdxOpr)(vIdxLgn).Rep_MntTva := 0;
      tLstFacRbq(vIdxOpr)(vIdxLgn).Rep_MntTtc := 0;
      tLstFacRbq(vIdxOpr)(vIdxLgn).RbqCmm     := tDetLtt(j).Lgn_RbqCmm;
      --
      if not tLstFac.Exists(vIdxOpr) then
        rEch.MntHt  := nvl(rEch.MntHt,0)  + tDetLtt(j).MntHt;
        rEch.MntTva := nvl(rEch.MntTva,0) + tDetLtt(j).MntTva;
        tLstFac(vIdxOpr).IdtFac     := tDetLtt(j).IdtFac;
        tLstFac(vIdxOpr).Idt        := tIdtOprDbt(i);
        tLstFac(vIdxOpr).IdtTypOpr  := tIdtTypOpr(i);
        -- On sauvegarde le tableau tLstFac pour avoir les totaux, le montant total
        -- de la facture correspond au solde de la facture, afin de faire la repartition
        -- sur les rubriques
        tLstFacSav(vIdxOpr) := tLstFac(vIdxOpr);
        tLstFacSav(vIdxOpr).MntHt      := tDetLtt(j).MntHt;
        tLstFacSav(vIdxOpr).MntTva     := tDetLtt(j).MntTva;
        tLstFacSav(vIdxOpr).MntTtc     := tDetLtt(j).MntHt + tDetLtt(j).MntTva;
        -- Dans le cas de repartition de l'echeance, on met a zero les montant des factures
        if vIdtTypOprEch = 7 then
          tLstFac(vIdxOpr).MntHt      := 0;
          tLstFac(vIdxOpr).MntTva     := 0;
          tLstFac(vIdxOpr).MntTtc     := 0;
        -- Dans le cas de repartition de l'echeancier, pas besoin de repartition
        else
          tLstFac(vIdxOpr).MntHt      := tDetLtt(j).MntHt;
          tLstFac(vIdxOpr).MntTva     := tDetLtt(j).MntTva;
          tLstFac(vIdxOpr).MntTtc     := tDetLtt(j).MntHt + tDetLtt(j).MntTva;
        end if;
        tLstFac(vIdxOpr).Tot_MntHt  := tDetLtt(j).SldHt  + tDetLtt(j).MntHt ;
        tLstFac(vIdxOpr).Tot_MntTva := tDetLtt(j).SldTva + tDetLtt(j).MntTva;
        tLstFac(vIdxOpr).Tot_MntTtc := tDetLtt(j).SldTtc + tDetLtt(j).MntHt + tDetLtt(j).MntTva;
        tLstFac(vIdxOpr).Rep_MntHt  := 0;
        tLstFac(vIdxOpr).Rep_MntTva := 0;
        tLstFac(vIdxOpr).Rep_MntTtc := 0;
      end if;
      --
      if tLstFacRbq(vIdxOpr)(vIdxLgn).RbqCmm = 0 then
        -- On garde les totaux sur le tables tLstFacSav
        tLstFacSav(vIdxOpr).Tot_MntHt  := nvl(tLstFacSav(vIdxOpr).Tot_MntHt ,0) + tDetLtt(j).Lgn_TotHt ;
        tLstFacSav(vIdxOpr).Tot_MntTva := nvl(tLstFacSav(vIdxOpr).Tot_MntTva,0) + tDetLtt(j).Lgn_TotTva;
        tLstFacSav(vIdxOpr).Tot_MntTtc := nvl(tLstFacSav(vIdxOpr).Tot_MntTtc,0) + tDetLtt(j).Lgn_TotTtc;
      end if;
      --
      j := tDetLtt.Next(j);
    end loop; -- j is not null
    vNbr := tDetLtt.Count;
--    tDetLtt.Trim(vNbr);
    tDetLtt.delete;
  end loop; -- i in 1..tIdtLtt.Count
  rEch.CumMntHt   := 0;
  rEch.CumMntTva  := 0;
  rEch.Tot_MntHt  := rEch.MntHt ;
  rEch.Tot_MntTva := rEch.MntTva;
  rEch.Tot_MntTtc := rEch.MntTtc;
  rEch.Rep_MntHt  := 0;
  rEch.Rep_MntTva := 0;
  rEch.Rep_MntTtc := 0;
  if vIdtTypOprEch = 6 then
    ptDetEch.Delete;
    i := 0;
    vIdxOpr := tLstFacRbq.First;
    while vIdxOpr is not null loop
      -- Repartition du montant de la facture sur les rubriques
      TrtRepPrr(tLstFac(vIdxOpr), tLstFacRbq(vIdxOpr));
      vIdxLgn := tLstFacRbq(vIdxOpr).First;
      while vIdxLgn is not null loop
        ptDetEch.Extend;
        i := i + 1;
        -- On a traite des valeurs positives, comme il s'agit d'une echeancier (credit)
        -- on inverse les signes des montants
        ptDetEch(i).Echr_IdtOpr      := rEch.Idt;
        ptDetEch(i).Echr_MntHt       := -rEch.Tot_MntHt;
        ptDetEch(i).Echr_MntTva      := -rEch.Tot_MntTva;
        ptDetEch(i).Echr_MntTtc      := -rEch.Tot_MntTtc;
        ptDetEch(i).Ech_IdtOpr       := null;
        ptDetEch(i).Ech_DatVlr       := null;
        ptDetEch(i).Ech_DatCrt       := null;
        ptDetEch(i).IdtFac           := tLstFacRbq(vIdxOpr)(vIdxLgn).IdtFac;
        ptDetEch(i).OprAfc_IdtOpr    := tLstFac(vIdxOpr).Idt;
        ptDetEch(i).OprAfc_IdtTypOpr := tLstFac(vIdxOpr).IdtTypOpr;
        ptDetEch(i).OprAfc_DatVlr    := null;
        ptDetEch(i).OprAfc_DatCrt    := null;
        ptDetEch(i).OprAfc_MntHt     := tLstFacSav(vIdxOpr).Tot_MntHt;
        ptDetEch(i).OprAfc_MntTva    := tLstFacSav(vIdxOpr).Tot_MntTva;
        ptDetEch(i).IdtDetLgn        := tLstFacRbq(vIdxOpr)(vIdxLgn).IdtDetLgn;
        ptDetEch(i).NumLgnFct        := tLstFacRbq(vIdxOpr)(vIdxLgn).Idt;
        ptDetEch(i).NumTrn           := tLstFacRbq(vIdxOpr)(vIdxLgn).NumTrn;
        ptDetEch(i).Lgn_IdtTax       := tLstFacRbq(vIdxOpr)(vIdxLgn).IdtTax;
        ptDetEch(i).IdtRbq           := tLstFacRbq(vIdxOpr)(vIdxLgn).IdtRbq;
        ptDetEch(i).FacEchr_MntHt    := -tLstFac(vIdxOpr).MntHt;
        ptDetEch(i).FacEchr_MntTva   := -tLstFac(vIdxOpr).MntTva;
        ptDetEch(i).FacEchr_MntTtc   := -tLstFac(vIdxOpr).MntTtc;
        ptDetEch(i).Ech_MntHt        := null;
        ptDetEch(i).Ech_MntTva       := null;
        ptDetEch(i).Ech_MntTtc       := null;
        ptDetEch(i).Lgn_Qte          := -tLstFacRbq(vIdxOpr)(vIdxLgn).Qte;
        ptDetEch(i).Lgn_MntHt        := -tLstFacRbq(vIdxOpr)(vIdxLgn).MntHt;
        ptDetEch(i).Lgn_MntTva       := -tLstFacRbq(vIdxOpr)(vIdxLgn).MntTva;
        ptDetEch(i).Lgn_MntTtc       := -tLstFacRbq(vIdxOpr)(vIdxLgn).MntTtc;
        ptDetEch(i).Lgn_RbqCmm       := tLstFacRbq(vIdxOpr)(vIdxLgn).RbqCmm;
        vIdxLgn := tLstFacRbq(vIdxOpr).Next(vIdxLgn);
      end loop;
      vIdxOpr := tLstFacRbq.Next(vIdxOpr);
    end loop;
  else
    -- Repartition sur les echeances
    select IdtOpr,
           Mnt
      bulk collect into tIdtOprEch, tMntOprEch
      from OPR
      where EchPmt = vEchPmt
       and  IdtTypOpr = 7
      order by IdtOpr;
    for i in 1..tIdtOprEch.Count loop
--      vIdxEch := tIdtOprEch(i);
      vIdxEch := fIdxOpr(tIdtOprEch(i));
      tLstEch(vIdxEch).Idt        := tIdtOprEch(i);
      tLstEch(vIdxEch).MntHt      := 0;
      tLstEch(vIdxEch).MntTva     := 0;
      tLstEch(vIdxEch).MntTtc     := tMntOprEch(i);
      tLstEch(vIdxEch).Tot_MntHt  := tLstEch(vIdxEch).MntHt ;
      tLstEch(vIdxEch).Tot_MntTva := tLstEch(vIdxEch).MntTva;
      tLstEch(vIdxEch).Tot_MntTtc := tLstEch(vIdxEch).MntTtc;
      tLstEch(vIdxEch).Rep_MntHt  := 0;
      tLstEch(vIdxEch).Rep_MntTva := 0;
      tLstEch(vIdxEch).Rep_MntTtc := 0;
      TrtRepEch(rEch, tLstEch(vIdxEch), rEch.DatVlr, tLstFac,tLstFacRbq);
      rEch.Rep_MntHt  := rEch.Rep_MntHt  + tLstEch(vIdxEch).MntHt;
      rEch.Rep_MntTva := rEch.Rep_MntTva + tLstEch(vIdxEch).MntTva;
      rEch.Rep_MntTtc := rEch.Rep_MntTtc + tLstEch(vIdxEch).MntTtc;
      if tIdtOprEch(i) = pIdtOprEch then
        ptDetEch.Delete;
        j := 0;
        vIdxOpr := tLstFacRbq.First;
        while vIdxOpr is not null loop
          -- On passe la facture que s'il y a un montant reparti de l'echeance sur la facture
          if tLstFac(vIdxOpr).MntTtc <> 0 then
            vIdxLgn := tLstFacRbq(vIdxOpr).First;
            while vIdxLgn is not null loop
              ptDetEch.Extend;
              j := j + 1;
              ptDetEch(j).Echr_IdtOpr      := rEch.Idt;
              ptDetEch(j).Echr_MntHt       := rEch.Tot_MntHt;
              ptDetEch(j).Echr_MntTva      := rEch.Tot_MntTva;
              ptDetEch(j).Echr_MntTtc      := rEch.Tot_MntTtc;
              ptDetEch(j).Ech_IdtOpr       := tIdtOprEch(i);
              ptDetEch(j).Ech_DatVlr       := null;
              ptDetEch(j).Ech_DatCrt       := null;
              ptDetEch(j).IdtFac           := tLstFacRbq(vIdxOpr)(vIdxLgn).IdtFac;
              ptDetEch(j).OprAfc_IdtOpr    := tLstFac(vIdxOpr).Idt;
              ptDetEch(j).OprAfc_IdtTypOpr := tLstFac(vIdxOpr).IdtTypOpr;
              ptDetEch(j).OprAfc_DatVlr    := null;
              ptDetEch(j).OprAfc_DatCrt    := null;
              ptDetEch(j).OprAfc_MntHt     := tLstFacSav(vIdxOpr).Tot_MntHt;
              ptDetEch(j).OprAfc_MntTva    := tLstFacSav(vIdxOpr).Tot_MntTva;
              ptDetEch(j).NumLgnFct        := tLstFacRbq(vIdxOpr)(vIdxLgn).Idt;
              ptDetEch(j).IdtDetLgn        := tLstFacRbq(vIdxOpr)(vIdxLgn).IdtDetLgn;
              ptDetEch(j).NumTrn           := tLstFacRbq(vIdxOpr)(vIdxLgn).NumTrn;
              ptDetEch(j).Lgn_IdtTax       := tLstFacRbq(vIdxOpr)(vIdxLgn).IdtTax;
              ptDetEch(j).IdtRbq           := tLstFacRbq(vIdxOpr)(vIdxLgn).IdtRbq;
              ptDetEch(j).FacEchr_MntHt    := tLstFacSav(vIdxOpr).MntHt;
              ptDetEch(j).FacEchr_MntTva   := tLstFacSav(vIdxOpr).MntTva;
              ptDetEch(j).FacEchr_MntTtc   := tLstFacSav(vIdxOpr).MntTtc;
              ptDetEch(j).Ech_MntHt        := tLstEch(vIdxEch).MntHt;
              ptDetEch(j).Ech_MntTva       := tLstEch(vIdxEch).MntTva;
              ptDetEch(j).Ech_MntTtc       := tLstEch(vIdxEch).MntTtc;
              ptDetEch(j).Lgn_Qte          := tLstFacRbq(vIdxOpr)(vIdxLgn).Qte;
              ptDetEch(j).Lgn_MntHt        := tLstFacRbq(vIdxOpr)(vIdxLgn).MntHt;
              ptDetEch(j).Lgn_MntTva       := tLstFacRbq(vIdxOpr)(vIdxLgn).MntTva;
              ptDetEch(j).Lgn_MntTtc       := tLstFacRbq(vIdxOpr)(vIdxLgn).MntTtc;
              ptDetEch(j).Lgn_RbqCmm       := tLstFacRbq(vIdxOpr)(vIdxLgn).RbqCmm;
              vIdxLgn := tLstFacRbq(vIdxOpr).Next(vIdxLgn);
            end loop; -- vIdxLgn is not null
          end if; -- tLstFac(vIdxOpr).MntTtc <> 0
          vIdxOpr := tLstFacRbq.Next(vIdxOpr);
        end loop; -- vIdxOpr is not null
        vNbr := tDetLtt.Count;
--        tDetLtt.Trim(vNbr);
        tDetLtt.delete;
        tLstFac.delete;
        tLstEch.delete;
        tLstFacRbq.delete;
        --
        tIdtOprDbt.Delete;
        tIdtOprEch.delete;
        tIdtTypOpr.delete;
        tMntOprDbt.delete;
        tMntOprEch.delete;
        tIdtLtt.delete;
        tMntFacEch.delete;
        exit;
      end if; -- tIdtOprEch(i) = pIdtOprEch
    end loop;
  end if;
  vNbr := tDetLtt.Count;
--  tDetLtt.Trim(vNbr);
  tDetLtt.delete;
  tLstFac.delete;
  tLstEch.delete;
  tLstFacRbq.delete;
  --
  tIdtOprDbt.Delete;
  tIdtOprEch.delete;
  tIdtTypOpr.delete;
  tMntOprDbt.delete;
  tMntOprEch.delete;
  tIdtLtt.delete;
  tMntFacEch.delete;
END ClcDetEch;
-------------------------------------------------------------------------------------------------------------
-------------------------------------------------------------------------------------------------------------
-------------------------------------------------------------------------------------------------------------
procedure ClcDetOpr(pIdtOpr OPR.IdtOpr%TYPE, ptDetOpr OUT typLstDetOpr, pIdtOprAfc OPR.IdtOpr%TYPE default null)
is
  TYPE typLgnFac is record(IdtFac number,
                           Opr_MntHt number,
                           Opr_MntTva number,
                           NumLgnFct number,
                           IdtRbq varchar2(6),
                           IdtDetLgn number,
                           NumTrn number,
                           IdtTax varchar2(6),
                           Qte number,
                           MntHt number,
                           MntTva number,
                           MntTtc number,
                           RbqCmm number);
  TYPE typLstLgnFac is table of typLgnFac index by binary_integer;
  rOpr OPR%ROWTYPE;
  tLstLgnFac typLstLgnFac;
  tDetEch typLstDetEch;
  tDetLtt typLstDetLtt;
  vIdtOpr OPR.IdtOpr%TYPE;
  vIdtFac FAC.IdtFac%TYPE;
  vMntHt number;
  vMntTva number;
  vMnt number;
  i number;
  j number;
  vSgn number;
  vNbr number;
  vIdtLtt LTT.IdtLtt%TYPE;
BEGIN
  ptDetOpr := typLstDetOpr(null);
  -- Par defaut, on etablie le signe a 1, on le change a -1 s'il s'agit d'une annulation
  vSgn := 1;
  select *
    into rOpr
    from OPR
    where IdtOpr = pIdtOpr;
  if rOpr.IdtTypOpr in (1,3,4,26) then
    if rOPR.IdtTypOpr in (3,26) then
      vSgn := -1;
    else
      vSgn := 1;
    end if;
    select IdtFac,
           MntHt,
           MntTva
      into vIdtFac,
           vMntHt,
           vMntTva
      from FAC
      where NumFct = rOPR.Rfr;
    select LGNFAC.IdtFac,
           vMntHt,
           vMntTva,
           LGNFAC.NumLgnFct,
           LGNFAC.IdtRbq,
           DETLGN.IdtDetLgn,
           DETLGN.NumTrn,
           nvl(DETLGN.IdtTax,LGNFAC.IdtTax),
           nvl(DETLGN.QteFct,LGNFAC.QteFct),
           nvl(DETLGN.MntHt,LGNFAC.MntHt),
           nvl(DETLGN.MntTva,LGNFAC.MntTva),
           nvl(DETLGN.MntHt,LGNFAC.MntHt) + nvl(DETLGN.MntTva,LGNFAC.MntTva),
           nvl(LGNFAC.RbqCmm,0)
      bulk collect into tLstLgnFac
      from DETLGN, LGNFAC
      where DETLGN.IdtFac(+) = LGNFAC.IdtFac
       and  DETLGN.NumLgnFct(+) = LGNFAC.NumLgnFct
       and  LGNFAC.IdtFac = vIdtFac;
  elsif rOpr.IdtTypOpr in (6,7,8,11) then
    if rOPR.IdtTypOpr in (8,11) then
      if rOPR.IdtTypOpr = 8 then
        vSgn := -1;
      else
        vSgn := 1;
      end if;
      select IdtOpr
        into vIdtOpr
        from OPR
        where EchPmt = rOPR.EchPmt
         and  IdtTypOpr = 6;
    else
      vIdtOpr := pIdtOpr;
    end if;
    ClcDetEch(vIdtOpr, tDetEch, pIdtOprAfc);
    i := tDetEch.First;
    j := 0;
    while i is not null loop
      j := j + 1;
      tLstLgnFac(j).IdtFac     := tDetEch(i).IdtFac;
      if rOpr.IdtTypOpr in (6,8,11) then
        tLstLgnFac(j).Opr_MntHt  := tDetEch(i).Echr_MntHt;
        tLstLgnFac(j).Opr_MntTva := tDetEch(i).Echr_MntTva;
      else
        tLstLgnFac(j).Opr_MntHt  := tDetEch(i).Ech_MntHt;
        tLstLgnFac(j).Opr_MntTva := tDetEch(i).Ech_MntTva;
      end if;
      tLstLgnFac(j).NumLgnFct  := tDetEch(i).NumLgnFct;
      tLstLgnFac(j).IdtDetLgn  := tDetEch(i).IdtDetLgn;
      tLstLgnFac(j).IdtRbq     := tDetEch(i).IdtRbq;
      tLstLgnFac(j).NumTrn     := tDetEch(i).NumTrn;
      tLstLgnFac(j).IdtTax     := tDetEch(i).Lgn_IdtTax;
      tLstLgnFac(j).Qte        := tDetEch(i).Lgn_Qte;
      tLstLgnFac(j).MntHt      := tDetEch(i).Lgn_MntHt;
      tLstLgnFac(j).MntTva     := tDetEch(i).Lgn_MntTva;
      tLstLgnFac(j).MntTtc     := tDetEch(i).Lgn_MntTtc;
      tLstLgnFac(j).RbqCmm     := tDetEch(i).Lgn_RbqCmm;
      i := tDetEch.Next(i);
    end loop;
    vNbr := tDetEch.Count;
    tDetEch.delete;
  else
    vMnt := rOPR.Mnt;
    tLstLgnFac(1).IdtFac    := null;
    tLstLgnFac(1).Opr_MntHt  := vMnt;
    tLstLgnFac(1).Opr_MntTva := 0;
    tLstLgnFac(1).NumLgnFct := null;
    tLstLgnFac(1).IdtDetLgn := null;
    tLstLgnFac(1).IdtRbq    := null;
    tLstLgnFac(1).NumTrn    := null;
    tLstLgnFac(1).IdtTax    := null;
    tLstLgnFac(1).Qte       := 1 * sign(vMnt);
    tLstLgnFac(1).MntHt     := vMnt;
    tLstLgnFac(1).MntTva    := 0;
    tLstLgnFac(1).MntTtc    := vMnt;
    tLstLgnFac(1).RbqCmm    := 0;
  end if;
  for i in 1..tLstLgnFac.Count loop
    ptDetOpr(i).IdtFac     := tLstLgnFac(i).IdtFac;
    ptDetOpr(i).MntHt      := tLstLgnFac(i).Opr_MntHt * vSgn;
    ptDetOpr(i).MntTva     := tLstLgnFac(i).Opr_MntTva * vSgn;
    ptDetOpr(i).NumLgnFct  := tLstLgnFac(i).NumLgnFct;
    ptDetOpr(i).IdtDetLgn  := tLstLgnFac(i).IdtDetLgn;
    ptDetOpr(i).IdtRbq     := tLstLgnFac(i).IdtRbq;
    ptDetOpr(i).NumTrn     := tLstLgnFac(i).NumTrn;
    ptDetOpr(i).Lgn_IdtTax := tLstLgnFac(i).IdtTax;
    ptDetOpr(i).Lgn_Qte    := tLstLgnFac(i).Qte * vSgn;
    ptDetOpr(i).Lgn_MntHt  := tLstLgnFac(i).MntHt * vSgn;
    ptDetOpr(i).Lgn_MntTva := tLstLgnFac(i).MntTva * vSgn;
    ptDetOpr(i).Lgn_MntTtc := tLstLgnFac(i).MntTtc * vSgn;
    ptDetOpr(i).Lgn_RbqCmm := tLstLgnFac(i).RbqCmm;
    ptDetOpr.Extend;
  end loop;
  tLstLgnFac.Delete;
  -- Le dernier enregistrement est null, donc on l'efface
  ptDetOpr.Trim;
END ClcDetOpr;
-------------------------------------------------------------------------------------------------------------
-------------------------------------------------------------------------------------------------------------
-------------------------------------------------------------------------------------------------------------
function LttAnl (pIdtLtt LTT.IdtLtt%TYPE,
                 pIdtOprDbt OPR.IdtOpr%TYPE,
                 pIdtOprCrt OPR.IdtOpr%TYPE,
                 pMnt LTT.Mnt%TYPE,
                 pDat date)
  return number is
  vIdtLtt LTT.IdtLtt%TYPE;
  tIdtLtt typLstNumber;
  tMntLtt typLstNumber;
BEGIN
  select IdtLtt,
         Mnt
    bulk collect into tIdtLtt, tMntLtt
    from LTT
    where IdtOprDbt = pIdtOprDbt
     and  IdtOprCrt = pIdtOprCrt
     and  abs(Mnt) = abs(pMnt)
     and  (decode(gTypDatCmp,cCMP_DATE_CREATION,trunc(DatCrt),trunc(DatLtt)) <= trunc(pDat) and IdtLtt <= pIdtLtt
           or decode(gTypDatCmp,cCMP_DATE_CREATION,trunc(DatCrt),trunc(DatLtt)) < trunc(pDat) and IdtLtt > pIdtLtt)
    order by decode(gTypDatCmp,cCMP_DATE_CREATION,trunc(DatCrt),trunc(DatLtt)), IdtLtt;
  for i in 1..tIdtLtt.Count loop
    if tMntLtt(i) > 0 then
      vIdtLtt := tIdtLtt(i);
    end if;
  end loop;
  tIdtLtt.delete;
  tMntLtt.delete;
  return vIdtLtt;
END LttAnl;
-------------------------------------------------------------------------------------------------------------
-------------------------------------------------------------------------------------------------------------
-------------------------------------------------------------------------------------------------------------
-- Cette procedure fait la repartition de un lettrage sur l'operation affectee.
procedure ClcDetLtt(pIdtLtt LTT.IdtLtt%TYPE, ptDetLtt OUT typLstDetLtt) is
--
  type typLstDate is table of date index by binary_integer;
--
  rLtt          typLgn;
  tDetOpr       typLstDetOpr;
  tIdtLtt       typLstNumber;
  tIdtLttAnl    typLstNumber;
  tLstFac       typLstLgn;
  tLstFacRbq    typ2DLstLgn;
  tLstFacRbqxLtt typ3DLstLgn;
--
  tIdtOpr       typLstNumber;
  tIdtTypOpr    typLstNumber;
  tMntOpr       typLstNumber;
  tMntLtt       typLstNumber;
  tMntRep       typLstNumber;
  tDatCmpLtt    typLstDate;
--
-- Ici, on ne connait pas la date sur laquelle on va faire le traitement
-- On utilise 'DatCmp' et apres on le remplace, soit par la date de creation,
-- soit par la date de lettrage
  vStrDat       varchar2(100);
  vSlcStd       varchar2(1000) := 'select IdtLtt,' ||
                                  '       LTT.IdtLttAnl,' ||
                                  '       OPR.IdtOpr,' ||
                                  '       OPR.IdtTypOpr,' ||
                                  '       abs(OPR.Mnt),' ||
                                  '       LTT.Mnt,' ||
                                  '       DatCmp';
  vFrmStd       varchar2(1000) := '  from OPR, LTT';
  vWhrStd       varchar2(2000) := '  where (trunc(DatCmp) <= trunc(:vDatLtt) and LTT.IdtLtt <= :pIdtLtt' ||
                                  '         or trunc(DatCmp) < trunc(:vDatLtt) and LTT.IdtLtt > :pIdtLtt) ';
  vOrdStd       varchar2(100)  := '  order by trunc(DatCmp), LTT.IdtLtt';
-- Les clauses DBT seront ajoutees si l'operation affectee est l'operation debitrice
  vSlcDbt       varchar2(1000) := '       sum(LTT.Mnt) over (partition by LTT.IdtOprDbt order by trunc(DatCmp), LTT.IdtLtt) - LTT.Mnt RepAvn';
  vWhrDbt       varchar2(100)  := '   and  OPR.IdtOpr = LTT.IdtOprCrt' ||
                                  '   and  LTT.IdtOprDbt = :vIdtOprAfc';
-- Les clauses CRT seront ajoutees si l'operation affectee est l'operation creditrice
  vSlcCrt       varchar2(1000) := '       sum(LTT.Mnt) over (partition by LTT.IdtOprCrt order by trunc(DatCmp), LTT.IdtLtt) - LTT.Mnt RepAvn';
  vWhrCrt       varchar2(100)  := '   and  OPR.IdtOpr = LTT.IdtOprDbt' ||
                                  '   and  LTT.IdtOprCrt = :vIdtOprAfc';
  vStrSql       long;
--
  vDatCmpLtt    date;
  vIdtLtt       LTT.IdtLtt%TYPE;
  vIdtTypOprDbt TYPOPR.IdtTypOpr%TYPE;
  vIdtTypOprCrt TYPOPR.IdtTypOpr%TYPE;
  vIdtOprAfc    OPR.IdtOpr%TYPE;
  vIdtOprDbt    OPR.IdtOpr%TYPE;
  vIdtOprCrt    OPR.IdtOpr%TYPE;
  vIdtOpr       OPR.IdtOpr%TYPE;
  vMntOprDbt    OPR.Mnt%TYPE;
  vMntOprCrt    OPR.Mnt%TYPE;
  vMntOprAfc    OPR.Mnt%TYPE;
  vMntLtt       LTT.Mnt%TYPE;
  vIdtLttAnl    LTT.IdtLtt%TYPE;
  vIdtModImpDbt MODIMP.IdtModImp%TYPE;
  vIdtModImpCrt MODIMP.IdtModImp%TYPE;
--
  vNbrLgn       number;
  vOprAfc       varchar2(1);
  vSwRep        number;
  vSgn          number := 1;
  i             number;
  vIdxOpr       typIdxChar;
  vIdxLtt       typIdxChar;
  vIdxLgn       typIdxChar;
BEGIN
  vSgn := 1;
  if gTypDatCmp = cCMP_DATE_CREATION then
    vStrDat := 'LTT.DatCrt';
  else
    vStrDat := 'LTT.DatLtt';
  end if;
  ptDetLtt   := typLstDetLtt(null);
  tDetOpr    := typLstDetOpr(null);
  tDetOpr.delete;
  vIdtLtt := pIdtLtt;
  select LTT.IdtOprDbt,
         OPRDBT.IdtTypOpr,
         OPRDBT.Mnt,
         TYPOPRDBT.IdtModImp,
         LTT.IdtOprCrt,
         OPRCRT.IdtTypOpr,
         OPRCRT.Mnt,
         TYPOPRCRT.IdtModImp,
         decode(gTypDatCmp,cCMP_DATE_CREATION,LTT.DatCrt,LTT.DatLtt),
         LTT.Mnt,
         LTT.IdtLttAnl
    into vIdtOprDbt,
         vIdtTypOprDbt,
         vMntOprDbt,
         vIdtModImpDbt,
         vIdtOprCrt,
         vIdtTypOprCrt,
         vMntOprCrt,
         vIdtModImpCrt,
         vDatCmpLtt,
         vMntLtt,
         vIdtLttAnl
    from TYPOPR TYPOPRDBT, OPR OPRDBT, TYPOPR TYPOPRCRT, OPR OPRCRT, LTT
    where OPRDBT.IdtOpr = LTT.IdtOprDbt
     and  OPRCRT.IdtOpr = LTT.IdtOprCrt
     and  TYPOPRDBT.IdtTypOpr = OPRDBT.IdtTypOpr
     and  TYPOPRCRT.IdtTypOpr = OPRCRT.IdtTypOpr
     and  IdtLtt = pIdtLtt;
  -- L'operation affectee est l'operation creditrice dans le cas de:
  --  - Transfert de reglement
  --  - Remboursement
  --  - Gain minimale
  --  - Si le mode d'imputation de l'operation debitrice est annulation
  -- Dans les autres cas, l'operation affectee est l'operation debitrice
  if vIdtTypOprDbt in (10, 30, 31) or vIdtModImpDbt = 21 then
    vOprAfc := 'C';
--    if vIdtModImpDbt = 21 then
--      vSgn := -1;
--    end if;
  else
    vOprAfc := 'D';
  end if;
  -- Nous avons toute l'information pour la requete, donc on complete ce qu'il manque
  if vOprAfc = 'D' then
    vStrSql := vSlcStd || vFrmStd || vWhrStd || vWhrDbt || vOrdStd;
    vIdtOpr := vIdtOprCrt;
    vIdtOprAfc := vIdtOprDbt;
    vMntOprAfc := vMntOprDbt;
  else
--    vStrSql := vSlcStd || vSlcCrt || vFrmStd || vWhrStd || vWhrCrt || vOrdStd;
    vStrSql := vSlcStd || vFrmStd || vWhrStd || vWhrCrt || vOrdStd;
    vIdtOpr := vIdtOprDbt;
    vIdtOprAfc := vIdtOprCrt;
    vMntOprAfc := -vMntOprCrt;
  end if;
  -- On replace le texte 'DatCmp' pour la date a utiliser
  vStrSql := replace(vStrSql,'DatCmp',vStrDat);
  --
  -- Pas besoin de repartition s'il s'agit du lettrage du type "operation d'annulation sur l'operation annulee", sauf dans le cas de retour d'impaye
  -- ou il est possible d'avoir un retour partiel
  -- Pour ce cas, on prend le detail de l'operation d'annulation
  if 21 in (vIdtModImpDbt, vIdtModImpCrt) and vIdtTypOprDbt <> 9 then
    vSwRep := 0;
    if vIdtModImpDbt = 21 then
      vSgn := -1;
    end if;
--    vSgn := 1;
    ClcDetOpr(vIdtOprAfc,tDetOpr);
  else
    -- Dans le cas de repartition, on prendre le detail de l'operation affectee
    vSwRep := 1;
    vSgn := 1;
    ClcDetOpr(vIdtOprAfc,tDetOpr);
  end if;
  -- Initialisation du tableau avec le detail de l'operation affectee et le detail des rubriques
  i := tDetOpr.First;
  while i is not null loop
    vIdxLgn := fIdxLgn(tDetOpr(i).NumLgnFct, tDetOpr(i).IdtDetLgn, tDetOpr(i).IdtFac);
    -- Dans le cas de repartition, on initialise a zero
    if vSwRep = 1 then
      vIdxOpr := fIdxOpr(vIdtOprAfc);
      tLstFac(vIdxOpr).MntHt                  := 0;
      tLstFac(vIdxOpr).MntTva                 := 0;
      tLstFac(vIdxOpr).MntTtc                 := 0;
      tLstFac(vIdxOpr).Rep_MntHt              := 0;
      tLstFac(vIdxOpr).Rep_MntTva             := 0;
      tLstFac(vIdxOpr).Rep_MntTtc             := 0;
      tLstFacRbq(vIdxOpr)(vIdxLgn).Qte        := 0;
      tLstFacRbq(vIdxOpr)(vIdxLgn).MntHt      := 0;
      tLstFacRbq(vIdxOpr)(vIdxLgn).MntTva     := 0;
      tLstFacRbq(vIdxOpr)(vIdxLgn).MntTtc     := 0;
      tLstFacRbq(vIdxOpr)(vIdxLgn).Rep_Qte    := 0;
      tLstFacRbq(vIdxOpr)(vIdxLgn).Rep_MntHt  := 0;
      tLstFacRbq(vIdxOpr)(vIdxLgn).Rep_MntTva := 0;
      tLstFacRbq(vIdxOpr)(vIdxLgn).Rep_MntTtc := 0;
    -- S'il n'y a pas une repartition (cas d'annulation), les montants correspondent aux montants de l'operation d'annulation
    else
      vIdxOpr := fIdxOpr(vIdtOpr);
      tLstFac(vIdxOpr).MntHt                  := tDetOpr(i).MntHt * vSgn;
      tLstFac(vIdxOpr).MntTva                 := tDetOpr(i).MntTva * vSgn;
      tLstFac(vIdxOpr).MntTtc                 := (tDetOpr(i).MntHt + tDetOpr(i).MntTva) * vSgn;
      tLstFac(vIdxOpr).Rep_MntHt              := tDetOpr(i).MntHt * vSgn;
      tLstFac(vIdxOpr).Rep_MntTva             := tDetOpr(i).MntTva * vSgn;
      tLstFac(vIdxOpr).Rep_MntTtc             := (tDetOpr(i).MntHt + tDetOpr(i).MntTva) * vSgn;
      tLstFacRbq(vIdxOpr)(vIdxLgn).Qte        := tDetOpr(i).Lgn_Qte * vSgn;
      tLstFacRbq(vIdxOpr)(vIdxLgn).MntHt      := tDetOpr(i).Lgn_MntHt * vSgn;
      tLstFacRbq(vIdxOpr)(vIdxLgn).MntTva     := tDetOpr(i).Lgn_MntTva * vSgn;
      tLstFacRbq(vIdxOpr)(vIdxLgn).MntTtc     := tDetOpr(i).Lgn_MntTtc * vSgn;
      tLstFacRbq(vIdxOpr)(vIdxLgn).Rep_Qte    := tDetOpr(i).Lgn_Qte * vSgn;
      tLstFacRbq(vIdxOpr)(vIdxLgn).Rep_MntHt  := tDetOpr(i).Lgn_MntHt * vSgn;
      tLstFacRbq(vIdxOpr)(vIdxLgn).Rep_MntTva := tDetOpr(i).Lgn_MntTva * vSgn;
      tLstFacRbq(vIdxOpr)(vIdxLgn).Rep_MntTtc := tDetOpr(i).Lgn_MntTtc * vSgn;
      rLtt.MntHt                              := tDetOpr(i).MntHt * vSgn;
      rLtt.MntTva                             := tDetOpr(i).MntTva * vSgn;
      rLtt.MntTtc                             := (tDetOpr(i).MntHt + tDetOpr(i).MntTva) * vSgn;
    end if; -- vSwRep = 1
    tLstFac(vIdxOpr).IdtFac     := tDetOpr(i).IdtFac;
    tLstFac(vIdxOpr).Idt        := tDetOpr(i).IdtFac;
    tLstFac(vIdxOpr).CumMntHt   := 0;
    tLstFac(vIdxOpr).CumMntTva  := 0;
    tLstFac(vIdxOpr).Tot_MntHt  := tDetOpr(i).MntHt * vSgn;
    tLstFac(vIdxOpr).Tot_MntTva := tDetOpr(i).MntTva * vSgn;
    tLstFac(vIdxOpr).Tot_MntTtc := (tDetOpr(i).MntHt + tDetOpr(i).MntTva) * vSgn;
    -- Initialisation de tLstFacRbq
    tLstFacRbq(vIdxOpr)(vIdxLgn).IdtFac     := tDetOpr(i).IdtFac;
    tLstFacRbq(vIdxOpr)(vIdxLgn).Idt        := tDetOpr(i).NumLgnFct;
    tLstFacRbq(vIdxOpr)(vIdxLgn).IdtDetLgn  := tDetOpr(i).IdtDetLgn;
    tLstFacRbq(vIdxOpr)(vIdxLgn).NumTrn     := tDetOpr(i).NumTrn;
    tLstFacRbq(vIdxOpr)(vIdxLgn).IdtTax     := tDetOpr(i).Lgn_IdtTax;
    tLstFacRbq(vIdxOpr)(vIdxLgn).IdtRbq     := tDetOpr(i).IdtRbq;
    tLstFacRbq(vIdxOpr)(vIdxLgn).CumMntHt   := 0;
    tLstFacRbq(vIdxOpr)(vIdxLgn).CumMntTva  := 0;
    tLstFacRbq(vIdxOpr)(vIdxLgn).Tot_Qte    := tDetOpr(i).LGN_Qte * vSgn;
    tLstFacRbq(vIdxOpr)(vIdxLgn).Tot_MntHt  := tDetOpr(i).LGN_MntHt * vSgn;
    tLstFacRbq(vIdxOpr)(vIdxLgn).Tot_MntTva := tDetOpr(i).LGN_MntTva * vSgn;
    tLstFacRbq(vIdxOpr)(vIdxLgn).Tot_MntTtc := tDetOpr(i).LGN_MntTtc * vSgn;
    tLstFacRbq(vIdxOpr)(vIdxLgn).RbqCmm     := nvl(tDetOpr(i).LGN_RbqCmm,0);
    i := tDetOpr.Next(i);
  end loop; -- i is not null
  --
  -- Traitement en cas de repartition
  if vSwRep = 1 then
    -- On prend tous les affectations sur l'operation affectee pour calculer la repartition actuelle
    execute immediate vStrSql
      bulk collect into tIdtLtt,
                        tIdtLttAnl,
                        tIdtOpr,
                        tIdtTypOpr,
                        tMntOpr,
                        tMntLtt,
                        tDatCmpLtt
      using vDatCmpLtt, vIdtLtt, vDatCmpLtt, vIdtLtt, vIdtOprAfc;
    for i in 1..tIdtLtt.Count loop
      vSwRep := 1;
      -- Pour les lettrages d'annulation, on prend le lettrage annule et on change le sign
      if tIdtLttAnl(i) is not null then
        vIdxLtt := fIdxOpr(tIdtLttAnl(i));
        -- On s'assure que le lettrage d'annulation a ete traite sinon, on fait la repartition
        if tLstFacRbqxLtt.Exists(vIdxLtt) then
          vSwRep := 0;
          rLtt.MntHt  := 0;
          rLtt.MntTva := 0;
          rLtt.MntTtc := 0;
          vIdxLgn := tLstFacRbqxLtt(vIdxLtt)(vIdxOpr).First;
          while vIdxLgn is not null loop
            tLstFacRbq(vIdxOpr)(vIdxLgn).Qte    := - tLstFacRbqxLtt(vIdxLtt)(vIdxOpr)(vIdxLgn).Qte   ;
            tLstFacRbq(vIdxOpr)(vIdxLgn).MntHt  := - tLstFacRbqxLtt(vIdxLtt)(vIdxOpr)(vIdxLgn).MntHt ;
            tLstFacRbq(vIdxOpr)(vIdxLgn).MntTva := - tLstFacRbqxLtt(vIdxLtt)(vIdxOpr)(vIdxLgn).MntTva;
            tLstFacRbq(vIdxOpr)(vIdxLgn).MntTtc := - tLstFacRbqxLtt(vIdxLtt)(vIdxOpr)(vIdxLgn).MntTtc;
            --
            tLstFacRbq(vIdxOpr)(vIdxLgn).Rep_Qte    := nvl(tLstFacRbq(vIdxOpr)(vIdxLgn).Rep_Qte,0)    + tLstFacRbq(vIdxOpr)(vIdxLgn).Qte;
            tLstFacRbq(vIdxOpr)(vIdxLgn).Rep_MntHt  := nvl(tLstFacRbq(vIdxOpr)(vIdxLgn).Rep_MntHt,0)  + tLstFacRbq(vIdxOpr)(vIdxLgn).MntHt;
            tLstFacRbq(vIdxOpr)(vIdxLgn).Rep_MntTva := nvl(tLstFacRbq(vIdxOpr)(vIdxLgn).Rep_MntTva,0) + tLstFacRbq(vIdxOpr)(vIdxLgn).MntTva;
            tLstFacRbq(vIdxOpr)(vIdxLgn).Rep_MntTtc := nvl(tLstFacRbq(vIdxOpr)(vIdxLgn).Rep_MntTtc,0) + tLstFacRbq(vIdxOpr)(vIdxLgn).MntTtc;
            --
            tLstFac(vIdxOpr).Rep_MntHt  := nvl(tLstFac(vIdxOpr).Rep_MntHt ,0) + tLstFacRbq(vIdxOpr)(vIdxLgn).MntHt ;
            tLstFac(vIdxOpr).Rep_MntTva := nvl(tLstFac(vIdxOpr).Rep_MntTva,0) + tLstFacRbq(vIdxOpr)(vIdxLgn).MntTva;
            tLstFac(vIdxOpr).Rep_MntTtc := nvl(tLstFac(vIdxOpr).Rep_MntTtc,0) + tLstFacRbq(vIdxOpr)(vIdxLgn).MntTtc;
            rLtt.MntHt  := nvl(rLtt.MntHt,0)  + tLstFacRbq(vIdxOpr)(vIdxLgn).MntHt;
            rLtt.MntTva := nvl(rLtt.MntTva,0) + tLstFacRbq(vIdxOpr)(vIdxLgn).MntTva;
            rLtt.MntTtc := nvl(rLtt.MntTtc,0) + tLstFacRbq(vIdxOpr)(vIdxLgn).MntTtc;
            vIdxLgn := tLstFacRbqxLtt(vIdxLtt)(vIdxOpr).Next(vIdxLgn);
          end loop; -- vIdxLgn is not null
        end if; -- tLstFacRbqxLtt.Exists(vIdxLtt)
      end if; -- tIdtLttAnl is not null
      if vSwRep = 1 then
        -- On fait une premiere repartition sur les montant total sans rubriques
        -- selon la regle de repartition choisie
        TrtRep(tMntLtt(i), tLstFac(vIdxOpr), tDatCmpLtt(i));
        -- Ici, les montants repartis ne sont pas encores mises a jour, nous avons besoin de connaitre
        -- le montant reparti avant l'operation a affecter en cours de traitement
        --
        -- Montant total pour le lettrage
        rLtt.MntHt  := tLstFac(vIdxOpr).MntHt;
        rLtt.MntTva := tLstFac(vIdxOpr).MntTva;
        rLtt.MntTtc := tLstFac(vIdxOpr).MntTtc;
        -- Repartition au prorata sur les rubriques par rapport les totaux repartis
        TrtRepPrr(tLstFac(vIdxOpr), tLstFacRbq(vIdxOpr));
        -- Mise a jour des montant cumules deja repartis pour le tableau tLstFac.
        -- Pour le tableau tLstFacRbq les montants deja repartis ont deja ete mises a jour
        -- lors du traitement de repartition au prorata
        tLstFac(vIdxOpr).Rep_MntHt  := nvl(tLstFac(vIdxOpr).Rep_MntHt ,0) + tLstFac(vIdxOpr).MntHt ;
        tLstFac(vIdxOpr).Rep_MntTva := nvl(tLstFac(vIdxOpr).Rep_MntTva,0) + tLstFac(vIdxOpr).MntTva;
        tLstFac(vIdxOpr).Rep_MntTtc := nvl(tLstFac(vIdxOpr).Rep_MntTtc,0) + tLstFac(vIdxOpr).MntTtc;
        -- On sauvegarde le resultat du lettrage au cas ou il y a une annulation
        vIdxLtt := fIdxOpr(tIdtLtt(i));
        tLstFacRbqxLtt(vIdxLtt)(vIdxOpr):= tLstFacRbq(vIdxOpr);
      end if; -- vSwRep = 1
    end loop; -- i in 1..tIdtLtt
  end if; -- vSwRep = 1
  i := 0;
  vIdxOpr := tLstFacRbq.First;
  while vIdxOpr is not null loop
    vIdxLgn := tLstFacRbq(vIdxOpr).First;
    while vIdxLgn is not null loop
      i := i + 1;
      ptDetLtt(i).IdtFac     := tLstFacRbq(vIdxOpr)(vIdxLgn).IdtFac;
      ptDetLtt(i).MntHt      := rLtt.MntHt ;
      ptDetLtt(i).MntTva     := rLtt.MntTva;
      ptDetLtt(i).SldHt      := tLstFac(vIdxOpr).Tot_MntHt  - tLstFac(vIdxOpr).Rep_MntHt ;
      ptDetLtt(i).SldTva     := tLstFac(vIdxOpr).Tot_MntTva - tLstFac(vIdxOpr).Rep_MntTva;
      ptDetLtt(i).SldTtc     := tLstFac(vIdxOpr).Tot_MntTtc - tLstFac(vIdxOpr).Rep_MntTtc;
      ptDetLtt(i).NumLgnFct  := tLstFacRbq(vIdxOpr)(vIdxLgn).Idt;
      ptDetLtt(i).IdtDetLgn  := tLstFacRbq(vIdxOpr)(vIdxLgn).IdtDetLgn;
      ptDetLtt(i).NumTrn     := tLstFacRbq(vIdxOpr)(vIdxLgn).NumTrn;
      ptDetLtt(i).Lgn_IdtTax := tLstFacRbq(vIdxOpr)(vIdxLgn).IdtTax;
      ptDetLtt(i).IdtRbq     := tLstFacRbq(vIdxOpr)(vIdxLgn).IdtRbq;
      ptDetLtt(i).Lgn_TotQte := tLstFacRbq(vIdxOpr)(vIdxLgn).Tot_Qte   ;
      ptDetLtt(i).Lgn_TotHt  := tLstFacRbq(vIdxOpr)(vIdxLgn).Tot_MntHt ;
      ptDetLtt(i).Lgn_TotTva := tLstFacRbq(vIdxOpr)(vIdxLgn).Tot_MntTva;
      ptDetLtt(i).Lgn_TotTtc := tLstFacRbq(vIdxOpr)(vIdxLgn).Tot_MntTtc;
      ptDetLtt(i).Lgn_Qte    := tLstFacRbq(vIdxOpr)(vIdxLgn).Qte   ;
      ptDetLtt(i).Lgn_MntHt  := tLstFacRbq(vIdxOpr)(vIdxLgn).MntHt ;
      ptDetLtt(i).Lgn_MntTva := tLstFacRbq(vIdxOpr)(vIdxLgn).MntTva;
      ptDetLtt(i).Lgn_MntTtc := tLstFacRbq(vIdxOpr)(vIdxLgn).MntTtc;
      ptDetLtt(i).Lgn_RbqCmm := tLstFacRbq(vIdxOpr)(vIdxLgn).RbqCmm;
      --
      ptDetLtt(i).Lgn_SldQte := tLstFacRbq(vIdxOpr)(vIdxLgn).Tot_Qte    - tLstFacRbq(vIdxOpr)(vIdxLgn).Rep_Qte ;
      ptDetLtt(i).Lgn_SldHt  := tLstFacRbq(vIdxOpr)(vIdxLgn).Tot_MntHt  - tLstFacRbq(vIdxOpr)(vIdxLgn).Rep_MntHt ;
      ptDetLtt(i).Lgn_SldTva := tLstFacRbq(vIdxOpr)(vIdxLgn).Tot_MntTva - tLstFacRbq(vIdxOpr)(vIdxLgn).Rep_MntTva;
      ptDetLtt(i).Lgn_SldTtc := tLstFacRbq(vIdxOpr)(vIdxLgn).Tot_MntTtc - tLstFacRbq(vIdxOpr)(vIdxLgn).Rep_MntTtc;
      --
      ptDetLtt.Extend;
      vIdxLgn := tLstFacRbq(vIdxOpr).Next(vIdxLgn);
    end loop; -- vIdxLgn is not null
    vIdxOpr := tLstFacRbq.Next(vIdxOpr);
  end loop; -- vIdxOpr is not null
  --
  vNbrLgn := tDetOpr.Count;
--  tDetOpr.trim(vNbrLgn);
  tDetOpr.delete;
  --
  tIdtLtt.delete;
  tLstFac.delete;
  tLstFacRbq.delete;
  tIdtOpr.delete;
  tIdtTypOpr.delete;
  tMntOpr.delete;
  tMntLtt.delete;
  tMntRep.delete;
  tDatCmpLtt.delete;
  -- Le dernier enregistrement est null, donc on l'efface
  ptDetLtt.Trim;
END ClcDetLtt;
END TRTREPCMP01; 

/
