CREATE OR REPLACE package body X7.TRTREPCMP01 is
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
                         RbqCmm number,
						 Rbq_MnTtcImp number
						 );
--  type typLstNLgn is table of typLgn index by binary_integer;
  type typLstLgn is table of typLgn index by typIdxChar;
  type typ2DLstLgn is table of typLstLgn index by typIdxChar;
  type typ3DLstLgn is table of typ2DLstLgn index by typIdxChar;
  gDatDbtRep date := to_date('01012099','DDMMYYYY');
--  gDatDbtRep date := to_date('01121999','DDMMYYYY');
  gArrCmp number;
--
  --type typlstRbq is table of echpmtrbq%rowtype index by typIdxChar;
  --type typ2DLstRbq is table of typLstLgn index by typIdxChar;
  --gtLstRbq typ2DLstRbq;
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
--procedure DetLttbpz (pIdtLtt LTT.IdtLtt%TYPE)
--is
--  tDetLtt typLstDetLtt;
--  vNbr number;
--BEGIN
--  syslog01.trc('DetLttbpz');
--  ClcDetLtt(pIdtLtt, tDetLtt);
--  vNbr := tDetLtt.Count;
--  for i in 1..vNbr loop
--    null; --PIPE ROW(tDetLtt(i));
--  end loop;
----  tDetLtt.Trim(vNbr);
--  tDetLtt.delete;
----  tDetLtt := typLstDetLtt(null);
--END DetLttbpz;
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
    gTypDatCmp := cCMP_DATE_VALEUR;
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
procedure TrtRepPrr (pFacRbq IN OUT typ2DLstLgn, pOpr IN OUT typLgn) is
  vFactorTtc number;
  vFactorTva number;
  vFactorHt number;
  vFactorQte number;
  vMntTtc number;
  vMntTva number;
  vMntHt number;
  vQte number;
  vQteRstLgn number;
  vMntTtcRstLgn number;
  vMntTvaRstLgn number;
  vMntHtRstLgn number;
  vMntTtcRstOpr number;
  vMntTvaRstOpr number;
  vMntHtRstOpr number;
  vDifHt number;
  vDifTva number;
  vDifHtOpr number;
  vDifTvaOpr number;
  vIdxFac typIdxChar;
  vIdxLgn typIdxChar;
  vArrQte number;
  rOpr typLgn;
  vSgn number := 1;
  tSavFacRbq typ2DLstLgn;
  rSavOpr typLgn;
BEGIN
  --syslog01.trc('TrtRepPrr');
  ChargerPrm;
  vArrQte := gArrCmp;
  rOpr.Tot_MntTtc := 0;
  rOpr.Tot_MntTva := 0;
  rOpr.Tot_MntHt  := 0;
  rOpr.Rep_MntTtc := 0;
  rOpr.Rep_MntTva := 0;
  rOpr.Rep_MntHt  := 0;
  pOpr.CumMntHt := 0;
  pOpr.CumMntTva := 0;
  vIdxFac := pFacRbq.First;
  while vIdxFac is not null loop
    vIdxLgn := pFacRbq(vIdxFac).First;
      while vIdxLgn is not null loop
        if pFacRbq(vIdxFac)(vIdxLgn).RbqCmm = 0 then
          rOpr.Tot_MntTtc := rOpr.Tot_MntTtc + pFacRbq(vIdxFac)(vIdxLgn).Tot_MntTtc;
          rOpr.Tot_MntTva := rOpr.Tot_MntTva + pFacRbq(vIdxFac)(vIdxLgn).Tot_MntTva;
          rOpr.Tot_MntHt  := rOpr.Tot_MntHt  + pFacRbq(vIdxFac)(vIdxLgn).Tot_MntHt;
          rOpr.Rep_MntTtc := rOpr.Rep_MntTtc + pFacRbq(vIdxFac)(vIdxLgn).Rep_MntTtc;
          rOpr.Rep_MntTva := rOpr.Rep_MntTva + pFacRbq(vIdxFac)(vIdxLgn).Rep_MntTva;
          rOpr.Rep_MntHt  := rOpr.Rep_MntHt  + pFacRbq(vIdxFac)(vIdxLgn).Rep_MntHt;
		  rOpr.Rbq_MnTtcImp := pFacRbq(vIdxFac)(vIdxLgn).Rbq_MnTtcImp;
        end if;
        vIdxLgn := pFacRbq(vIdxFac).Next(vIdxLgn);
      end loop;
    vIdxFac := pFacRbq.Next(vIdxFac);
  end loop;
  -- Il est possible d'affecter un montant sur une operation
  -- mais que le solde de l'operation affectee soit 0.
  -- Pour gerer ce cas, on donne le signe -1
  if pOpr.MntTtc > rOpr.Tot_MntTtc - rOpr.Rep_MntTtc then
    vSgn := -1;
  end if;
  -- Si le montant a affecter est superieur au solde, on sauvegarde les montants deja repartis
  -- et on fait comme si rien a ete deja affecte sur l'operation
  if vSgn = -1 then
    rSavOpr.Rep_MntTtc := rOpr.Rep_MntTtc;
    rSavOpr.Rep_MntTva := rOpr.Rep_MntTva;
    rSavOpr.Rep_MntHt  := rOpr.Rep_MntHt ;
    rOpr.Rep_MntTtc := 0;
    rOpr.Rep_MntTva := 0;
    rOpr.Rep_MntHt  := 0;
    vIdxFac := pFacRbq.First;
    while vIdxFac is not null loop
      vIdxLgn := pFacRbq(vIdxFac).First;
        while vIdxLgn is not null loop
          tSavFacRbq(vIdxFac)(vIdxLgn).Rep_MntTtc := pFacRbq(vIdxFac)(vIdxLgn).Rep_MntTtc;
          tSavFacRbq(vIdxFac)(vIdxLgn).Rep_MntTva := pFacRbq(vIdxFac)(vIdxLgn).Rep_MntTva;
          tSavFacRbq(vIdxFac)(vIdxLgn).Rep_MntHt  := pFacRbq(vIdxFac)(vIdxLgn).Rep_MntHt;
          tSavFacRbq(vIdxFac)(vIdxLgn).Rep_Qte    := pFacRbq(vIdxFac)(vIdxLgn).Rep_Qte;
          pFacRbq(vIdxFac)(vIdxLgn).Rep_MntTtc := 0;
          pFacRbq(vIdxFac)(vIdxLgn).Rep_MntTva := 0;
          pFacRbq(vIdxFac)(vIdxLgn).Rep_MntHt  := 0; 
          pFacRbq(vIdxFac)(vIdxLgn).Rep_Qte    := 0; 
          vIdxLgn := pFacRbq(vIdxFac).Next(vIdxLgn);
        end loop;
      vIdxFac := pFacRbq.Next(vIdxFac);
    end loop;
  end if;
  --if rOpr.Tot_MntTtc = 0  then
  if (pOpr.MntTtc + rOpr.Rep_MntTtc - rOpr.Rbq_MnTtcImp) = 0  then
    vFactorTtc := 0;
  else
    --vFactorTtc := (pOpr.MntTtc + rOpr.Rep_MntTtc - rOpr.) / rOpr.Tot_MntTtc;
    vFactorTtc := (pOpr.MntTtc + rOpr.Rep_MntTtc - rOpr.Rbq_MnTtcImp) / rOpr.Tot_MntTtc;
  end if;
  if rOpr.Tot_MntTva = 0  then
    vFactorTva := 0;
  else
    vFactorTva := pOpr.MntTva + rOpr.Rep_MntTva / rOpr.Tot_MntTva;
  end if;
  if rOpr.Tot_MntHt = 0  then
    vFactorHt := 0;
  else
    vFactorHt := (pOpr.MntHt + rOpr.Rep_MntHt) / rOpr.Tot_MntHt;
  end if;
  vIdxFac := pFacRbq.First;
  while vIdxFac is not null loop
    vIdxLgn := pFacRbq(vIdxFac).First;
    while vIdxLgn is not null loop
      if vFactorTtc = 1 then
        vMntTtc := pFacRbq(vIdxFac)(vIdxLgn).Tot_MntTtc - pFacRbq(vIdxFac)(vIdxLgn).Rep_MntTtc;
      else
        vMntTtc := round(pFacRbq(vIdxFac)(vIdxLgn).Tot_MntTtc * vFactorTtc,gArrCmp) - pFacRbq(vIdxFac)(vIdxLgn).Rep_MntTtc;
        vMntTtcRstLgn := pFacRbq(vIdxFac)(vIdxLgn).Tot_MntTtc - pFacRbq(vIdxFac)(vIdxLgn).Rep_MntTtc;
        vQteRstLgn := pFacRbq(vIdxFac)(vIdxLgn).Tot_Qte - pFacRbq(vIdxFac)(vIdxLgn).Rep_Qte;
        if vMntTtc > vMntTtcRstLgn then
          vMntTtc := vMntTtcRstLgn;
        end if;
      end if;
      if vFactorTva = 1 then
        vMntTva := pFacRbq(vIdxFac)(vIdxLgn).Tot_MntTva - pFacRbq(vIdxFac)(vIdxLgn).Rep_MntTva;
      else
        vMntTva := round(pFacRbq(vIdxFac)(vIdxLgn).Tot_MntTva * vFactorTva,gArrCmp) - pFacRbq(vIdxFac)(vIdxLgn).Rep_MntTva;
        vMntTvaRstLgn := pFacRbq(vIdxFac)(vIdxLgn).Tot_MntTva - pFacRbq(vIdxFac)(vIdxLgn).Rep_MntTva;
        if abs(vMntTva) > abs(vMntTvaRstLgn) then
          vMntTva := vMntTvaRstLgn;
        end if;
      end if;
      if vFactorHt = 1 then
        vMntHt := pFacRbq(vIdxFac)(vIdxLgn).Tot_MntHt - pFacRbq(vIdxFac)(vIdxLgn).Rep_MntHt;
      else
        vMntHt := round(pFacRbq(vIdxFac)(vIdxLgn).Tot_MntHt * vFactorHt,gArrCmp) - pFacRbq(vIdxFac)(vIdxLgn).Rep_MntHt;
        vMntHtRstLgn := pFacRbq(vIdxFac)(vIdxLgn).Tot_MntHt - pFacRbq(vIdxFac)(vIdxLgn).Rep_MntHt;
        if abs(vMntHt) > abs(vMntHtRstLgn) then
          vMntHt := vMntHtRstLgn;
        end if;
      end if;
      vMntTtc := vMntTva + vMntHt;
      if pFacRbq(vIdxFac)(vIdxLgn).RbqCmm = 0 then
        vMntTtcRstOpr := pOpr.MntTtc - nvl(pOpr.CumMntHt,0) - nvl(pOpr.CumMntTva,0);
        vMntTvaRstOpr := pOpr.MntTva - nvl(pOpr.CumMntTva,0);
        vMntHtRstOpr := pOpr.MntHt - nvl(pOpr.CumMntHt,0);
        if vMntTtc > vMntTtcRstOpr then
          vMntTtc := vMntTtcRstOpr;
        end if;
        if vMntTva > vMntTvaRstOpr then
          vMntTva := vMntTvaRstOpr;
        end if;
        if vMntHt > vMntHtRstOpr then
          vMntHt := vMntHtRstOpr;
        end if;
        vMntTtc := vMntHt + vMntTva;
        pOpr.CumMntTva := (nvl(pOpr.CumMntTva,0) + vMntTva);
        pOpr.CumMntHt  := (nvl(pOpr.CumMntHt,0)  + vMntHt);
        rOpr.Rep_MntTtc := (nvl(rOpr.Rep_MntTtc,0) + vMntTtc);
        rOpr.Rep_MntTva := (nvl(rOpr.Rep_MntTva,0) + vMntTva);
        rOpr.Rep_MntHt  := (nvl(rOpr.Rep_MntHt,0)  + vMntHt);
      end if;
      pFacRbq(vIdxFac)(vIdxLgn).MntTtc := vMntTtc;
      pFacRbq(vIdxFac)(vIdxLgn).MntTva := vMntTva;
      pFacRbq(vIdxFac)(vIdxLgn).MntHt  := vMntHt;
      pFacRbq(vIdxFac)(vIdxLgn).Rep_MntTtc := nvl(pFacRbq(vIdxFac)(vIdxLgn).Rep_MntTtc,0) + vMntTtc;
      pFacRbq(vIdxFac)(vIdxLgn).Rep_MntTva := nvl(pFacRbq(vIdxFac)(vIdxLgn).Rep_MntTva,0) + vMntTva;
      pFacRbq(vIdxFac)(vIdxLgn).Rep_MntHt  := nvl(pFacRbq(vIdxFac)(vIdxLgn).Rep_MntHt,0)  + vMntHt;
      vIdxLgn := pFacRbq(vIdxFac).Next(vIdxLgn);
    end loop;
    vIdxFac := pFacRbq.Next(vIdxFac);
  end loop;
  vDifHtOpr  := pOpr.MntHt  - nvl(pOpr.CumMntHt,0);
  vDifTvaOpr := pOpr.MntTva - nvl(pOpr.CumMntTva,0);
  if vDifHtOpr <> 0 or vDifTvaOpr <> 0 then
    vIdxFac := pFacRbq.First;
    while vIdxFac is not null loop
      vIdxLgn := pFacRbq(vIdxFac).First;
      while vIdxLgn is not null loop
        if pFacRbq(vIdxFac)(vIdxLgn).RbqCmm = 0 then
          vDifHt  := pFacRbq(vIdxFac)(vIdxLgn).Tot_MntHt  - pFacRbq(vIdxFac)(vIdxLgn).Rep_MntHt;
          vDifTva := pFacRbq(vIdxFac)(vIdxLgn).Tot_MntTva - pFacRbq(vIdxFac)(vIdxLgn).Rep_MntTva;
          if vDifHt <> 0 or vDifTva <> 0 then
            if vDifHt > vDifHtOpr then
              vDifHt := vDifHtOpr;
            end if;
            if vDifTva > vDifTvaOpr then
              vDifTva := vDifTvaOpr;
            end if;
            pFacRbq(vIdxFac)(vIdxLgn).MntTtc := pFacRbq(vIdxFac)(vIdxLgn).MntTtc + vDifHt + vDifTva;
            pFacRbq(vIdxFac)(vIdxLgn).MntTva := pFacRbq(vIdxFac)(vIdxLgn).MntTva + vDifTva;
            pFacRbq(vIdxFac)(vIdxLgn).MntHt  := pFacRbq(vIdxFac)(vIdxLgn).MntHt + vDifHt;
            pFacRbq(vIdxFac)(vIdxLgn).Rep_MntTtc := nvl(pFacRbq(vIdxFac)(vIdxLgn).Rep_MntTtc,0) + vDifHt + vDifTva;
            pFacRbq(vIdxFac)(vIdxLgn).Rep_MntTva := nvl(pFacRbq(vIdxFac)(vIdxLgn).Rep_MntTva,0) + vDifTva;
            pFacRbq(vIdxFac)(vIdxLgn).Rep_MntHt  := nvl(pFacRbq(vIdxFac)(vIdxLgn).Rep_MntHt,0)  + vDifHt;
            pOpr.CumMntTva := nvl(pOpr.CumMntTva,0) + vMntTva;
            pOpr.CumMntHt  := nvl(pOpr.CumMntHt,0)  + vMntHt;
            rOpr.Rep_MntTtc := nvl(rOpr.Rep_MntTtc,0) + vMntTtc;
            rOpr.Rep_MntTva := nvl(rOpr.Rep_MntTva,0) + vMntTva;
            rOpr.Rep_MntHt  := nvl(rOpr.Rep_MntHt,0)  + vMntHt;
            vDifHtOpr := vDifHtOpr - vDifHt;
            vDifTvaOpr := vDifTvaOpr - vDifTva;
          end if;
        end if;
        if vDifHtOpr = 0  and vDifTvaOpr = 0 then
          exit;
        end if;
        vIdxLgn := pFacRbq(vIdxFac).Next(vIdxLgn);
      end loop;
      if vDifHtOpr = 0  and vDifTvaOpr = 0 then
        exit;
      end if;
      vIdxFac := pFacRbq.Next(vIdxFac);
    end loop;
  end if;
  -- On calcul la quantite par rapport le montant TTC pour chaque rubrique
  vIdxFac := pFacRbq.First;
  while vIdxFac is not null loop
    vIdxLgn := pFacRbq(vIdxFac).First;
    while vIdxLgn is not null loop
      if pFacRbq(vIdxFac)(vIdxLgn).Tot_MntTtc = 0  then
        vFactorQte := 1;
      else
        vFactorQte := (nvl(pFacRbq(vIdxFac)(vIdxLgn).Rep_MntTtc,0)) / pFacRbq(vIdxFac)(vIdxLgn).Tot_MntTtc;
      end if;
      if vFactorQte = 1 then
        vQte    := pFacRbq(vIdxFac)(vIdxLgn).Tot_Qte - pFacRbq(vIdxFac)(vIdxLgn).Rep_Qte;
      else
        vQte    := round(pFacRbq(vIdxFac)(vIdxLgn).Tot_Qte * vFactorQte,vArrQte) - pFacRbq(vIdxFac)(vIdxLgn).Rep_Qte;
        vQteRstLgn := pFacRbq(vIdxFac)(vIdxLgn).Tot_Qte - pFacRbq(vIdxFac)(vIdxLgn).Rep_Qte;
        if abs(vQte) > abs(vQteRstLgn) then
          vQte := vQteRstLgn;
        end if;
      end if;
      pFacRbq(vIdxFac)(vIdxLgn).Qte     := vQte;
      pFacRbq(vIdxFac)(vIdxLgn).Rep_Qte := nvl(pFacRbq(vIdxFac)(vIdxLgn).Rep_Qte,0) + vQte;
      vIdxLgn := pFacRbq(vIdxFac).Next(vIdxLgn);
    end loop;
    vIdxFac := pFacRbq.Next(vIdxFac);
  end loop;
  -- Dans le cas ou le montant a affecter est superieur au solde, 
  -- on restaure la sauvegarde des montants deja repartis
  -- et on ajoute le montant affectee
  if vSgn = -1 then
    rOpr.Rep_MntTtc := rSavOpr.Rep_MntTtc + rOpr.Rep_MntTtc;
    rOpr.Rep_MntTva := rSavOpr.Rep_MntTva + rOpr.Rep_MntTva;
    rOpr.Rep_MntHt  := rSavOpr.Rep_MntHt  + rOpr.Rep_MntHt ;
    vIdxFac := pFacRbq.First;
    while vIdxFac is not null loop
      vIdxLgn := pFacRbq(vIdxFac).First;
        while vIdxLgn is not null loop
          pFacRbq(vIdxFac)(vIdxLgn).Rep_MntTtc := tSavFacRbq(vIdxFac)(vIdxLgn).Rep_MntTtc + pFacRbq(vIdxFac)(vIdxLgn).Rep_MntTtc;
          pFacRbq(vIdxFac)(vIdxLgn).Rep_MntTva := tSavFacRbq(vIdxFac)(vIdxLgn).Rep_MntTva + pFacRbq(vIdxFac)(vIdxLgn).Rep_MntTva;
          pFacRbq(vIdxFac)(vIdxLgn).Rep_MntHt  := tSavFacRbq(vIdxFac)(vIdxLgn).Rep_MntHt  + pFacRbq(vIdxFac)(vIdxLgn).Rep_MntHt ; 
          pFacRbq(vIdxFac)(vIdxLgn).Rep_Qte    := tSavFacRbq(vIdxFac)(vIdxLgn).Rep_Qte    + pFacRbq(vIdxFac)(vIdxLgn).Rep_Qte;
          vIdxLgn := pFacRbq(vIdxFac).Next(vIdxLgn);
        end loop;
      vIdxFac := pFacRbq.Next(vIdxFac);
    end loop;
  end if;
  tSavFacRbq.delete;
END TrtRepPrr;
-------------------------------------------------------------------------------------------------------------
-------------------------------------------------------------------------------------------------------------
-------------------------------------------------------------------------------------------------------------
procedure TrtRep (pOprAfc IN OUT typLgn, pOpr IN OUT typLgn, vDatRep date) is
  vFactor number;
  vTypRep number;
BEGIN
  --syslog01.trc('TrtRep');
  -- vTypRep : 1 ==> Repartition proportionnelle
  --           2 ==> Priorite sur TVA
  ChargerPrm;
  if trunc(vDatRep) >= trunc(gDatDbtRep) then
    vTypRep := cREPARTITION_TVA;
  else
    vTypRep := cREPARTITION_PRORATA;
  end if;
  pOpr.Rbq_MnTtcImp := pOprAfc.Rbq_MnTtcImp;
  -- Cas de repartition proportionnelle
  if vTypRep = cREPARTITION_PRORATA then
    --if pOprAfc.Tot_MntTtc = 0 then
    if (pOpr.Tot_MntTtc + pOprAfc.Rep_MntTtc - pOprAfc.Rbq_MnTtcImp) = 0 then
      vFactor := 0;
    else
	  -- bpz 
      --vFactor := (pOpr.Tot_MntTtc + pOprAfc.Rep_MntTtc) / pOprAfc.Tot_MntTtc;
      --vFactor := (pOpr.Tot_MntTtc + pOprAfc.Rep_MntTtc) / (pOprAfc.Tot_MntTtc - pOprAfc.Rbq_MnTtcImp);
      vFactor := (pOpr.Tot_MntTtc + pOprAfc.Rep_MntTtc - pOprAfc.Rbq_MnTtcImp) / pOprAfc.Tot_MntTtc;
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
END;
-------------------------------------------------------------------------------------------------------------
-------------------------------------------------------------------------------------------------------------
-------------------------------------------------------------------------------------------------------------
procedure ClcDetEch(pIdtOprEch OPR.IdtOpr%TYPE, ptDetEch OUT typLstDetEch, pIdtOprAfc OPR.IdtOpr%TYPE DEFAULT NULL )
is
  --
  tDetLtt typLstDetLtt;
  tLstFac typLstLgn;
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
  --syslog01.trc('ClcDetEch pIdtOprEch '||pIdtOprEch);
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
  select LTT.IdtOprDbt,
         OPRDBT.IdtTypOpr,
         OPRDBT.Mnt,
         min(LTT.IdtLtt),
         LTT.Mnt
    bulk collect into tIdtOprDbt, tIdtTypOpr, tMntOprDbt, tIdtLtt, tMntFacEch
    from OPR OPRDBT, LTT
    where OPRDBT.IdtOpr = LTT.IdtOprDbt
     and  LTT.Mnt > 0
     and  LTT.IdtOprCrt = rEch.Idt
     and  OPRDBT.IdtTypOpr not in (8,24)
    group by LTT.IdtOprDbt,
             OPRDBT.IdtTypOpr,
             OPRDBT.Mnt,
             LTT.Mnt
    order by LTT.IdtOprDbt;
  for i in 1..tIdtLtt.Count loop
    -- Recherche de la repartition
    ClcDetLtt(tIdtLtt(i), tDetLtt);
    -- Remplissage des tables en memoire avec le detail des factures
    j := tDetLtt.First;
    while j is not null loop
--      vIdxOpr := tIdtOprDbt(i);
      vIdxOpr := fIdxOpr(tIdtOprDbt(i));
--      vIdxLgn := tDetLtt(j).NumLgnFct || '-' || tDetLtt(j).NumTrn;
      vIdxLgn := fIdxLgn(tDetLtt(j).NumLgnFct,tDetLtt(j).IdtDetLgn);
      if not tLstFac.Exists(vIdxOpr) then
        rEch.MntHt := nvl(rEch.MntHt,0) + tDetLtt(j).MntHt;
        rEch.MntTva := nvl(rEch.MntTva,0) + tDetLtt(j).MntTva;
        tLstFac(vIdxOpr).IdtFac     := tDetLtt(j).IdtFac;
        tLstFac(vIdxOpr).Idt        := tDetLtt(j).IdtFac;
        tLstFac(vIdxOpr).IdtTypOpr  := tIdtTypOpr(i);
        tLstFac(vIdxOpr).MntHt      := tDetLtt(j).MntHt;
        tLstFac(vIdxOpr).MntTva     := tDetLtt(j).MntTva;
        tLstFac(vIdxOpr).MntTtc     := tDetLtt(j).MntHt + tDetLtt(j).MntTva;
        tLstFac(vIdxOpr).CumMntHt   := 0;
        tLstFac(vIdxOpr).CumMntTva  := 0;
        tLstFac(vIdxOpr).Tot_MntHt  := tLstFac(vIdxOpr).MntHt ;
        tLstFac(vIdxOpr).Tot_MntTva := tLstFac(vIdxOpr).MntTva;
        tLstFac(vIdxOpr).Tot_MntTtc := tLstFac(vIdxOpr).MntTtc;
        tLstFac(vIdxOpr).Rep_MntHt  := 0;
        tLstFac(vIdxOpr).Rep_MntTva := 0;
        tLstFac(vIdxOpr).Rep_MntTtc := 0;
      end if;
      --
      tLstFacRbq(vIdxOpr)(vIdxLgn).IdtFac     := tDetLtt(j).IdtFac;
      tLstFacRbq(vIdxOpr)(vIdxLgn).Idt        := tDetLtt(j).NumLgnFct;
      tLstFacRbq(vIdxOpr)(vIdxLgn).IdtDetLgn  := tDetLtt(j).IdtDetLgn;
      tLstFacRbq(vIdxOpr)(vIdxLgn).NumTrn     := tDetLtt(j).NumTrn;
      tLstFacRbq(vIdxOpr)(vIdxLgn).IdtTax     := tDetLtt(j).Lgn_IdtTax;
      tLstFacRbq(vIdxOpr)(vIdxLgn).IdtRbq     := tDetLtt(j).IdtRbq;
	  --syslog01.trc('tLstFacRbq(vIdxOpr)(vIdxLgn).IdtRbq '||tLstFacRbq(vIdxOpr)(vIdxLgn).IdtRbq);
      tLstFacRbq(vIdxOpr)(vIdxLgn).Qte        := tDetLtt(j).Lgn_Qte;
      tLstFacRbq(vIdxOpr)(vIdxLgn).MntHt      := tDetLtt(j).Lgn_MntHt;
      tLstFacRbq(vIdxOpr)(vIdxLgn).MntTva     := tDetLtt(j).Lgn_MntTva;
      tLstFacRbq(vIdxOpr)(vIdxLgn).MntTtc     := tDetLtt(j).Lgn_MntTtc;
      tLstFacRbq(vIdxOpr)(vIdxLgn).CumMntHt   := 0;
      tLstFacRbq(vIdxOpr)(vIdxLgn).CumMntTva  := 0;
      tLstFacRbq(vIdxOpr)(vIdxLgn).Tot_Qte    := tLstFacRbq(vIdxOpr)(vIdxLgn).Qte;
      tLstFacRbq(vIdxOpr)(vIdxLgn).Tot_MntHt  := tLstFacRbq(vIdxOpr)(vIdxLgn).MntHt ;
      tLstFacRbq(vIdxOpr)(vIdxLgn).Tot_MntTva := tLstFacRbq(vIdxOpr)(vIdxLgn).MntTva;
      tLstFacRbq(vIdxOpr)(vIdxLgn).Tot_MntTtc := tLstFacRbq(vIdxOpr)(vIdxLgn).MntTtc;
      tLstFacRbq(vIdxOpr)(vIdxLgn).Rep_Qte    := 0;
      tLstFacRbq(vIdxOpr)(vIdxLgn).Rep_MntHt  := 0;
      tLstFacRbq(vIdxOpr)(vIdxLgn).Rep_MntTva := 0;
      tLstFacRbq(vIdxOpr)(vIdxLgn).Rep_MntTtc := 0;
      tLstFacRbq(vIdxOpr)(vIdxLgn).RbqCmm     := tDetLtt(j).Lgn_RbqCmm;	  
      j := tDetLtt.Next(j);
    end loop;
    vNbr := tDetLtt.Count;
--    tDetLtt.Trim(vNbr);
    tDetLtt.delete;
  end loop;
  rEch.CumMntHt   := 0;
  rEch.CumMntTva  := 0;
  rEch.Tot_MntHt  := rEch.MntHt ;
  rEch.Tot_MntTva := rEch.MntTva;
  rEch.Tot_MntTtc := rEch.MntTtc;
  rEch.Rep_MntHt  := 0;
  rEch.Rep_MntTva := 0;
  rEch.Rep_MntTtc := 0;
  -- Si l'operation envoyee en parametre est une echeance,
  -- il faut recuperer les informations des echeances
  if vIdtTypOprEch = 6 then
    ptDetEch.Delete;
    i := 0;
    vIdxOpr := tLstFacRbq.First;
    while vIdxOpr is not null loop
      vIdxLgn := tLstFacRbq(vIdxOpr).First;
      while vIdxLgn is not null loop
        ptDetEch.Extend;
        i := i + 1;
        ptDetEch(i).Echr_IdtOpr      := rEch.Idt;
        ptDetEch(i).Echr_MntHt       := -rEch.Tot_MntHt;
        ptDetEch(i).Echr_MntTva      := -rEch.Tot_MntTva;
        ptDetEch(i).Echr_MntTtc      := -rEch.Tot_MntTtc;
        ptDetEch(i).Ech_IdtOpr       := null;
        ptDetEch(i).Ech_DatVlr       := null;
        ptDetEch(i).Ech_DatCrt       := null;
        ptDetEch(i).IdtFac           := tLstFacRbq(vIdxOpr)(vIdxLgn).IdtFac;
        ptDetEch(i).OprAfc_IdtOpr    := vIdxOpr;
        ptDetEch(i).OprAfc_IdtTypOpr := tLstFac(vIdxOpr).IdtTypOpr;
        ptDetEch(i).OprAfc_DatVlr    := null;
        ptDetEch(i).OprAfc_DatCrt    := null;
        ptDetEch(i).OprAfc_MntHt     := null;
        ptDetEch(i).OprAfc_MntTva    := null;
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
      tLstEch(vIdxEch).CumMntHt   := 0;
      tLstEch(vIdxEch).CumMntTva  := 0;
      tLstEch(vIdxEch).Tot_MntHt  := tLstEch(vIdxEch).MntHt ;
      tLstEch(vIdxEch).Tot_MntTva := tLstEch(vIdxEch).MntTva;
      tLstEch(vIdxEch).Tot_MntTtc := tLstEch(vIdxEch).MntTtc;
      tLstEch(vIdxEch).Rep_MntHt  := 0;
      tLstEch(vIdxEch).Rep_MntTva := 0;
      tLstEch(vIdxEch).Rep_MntTtc := 0;
      TrtRep(rEch, tLstEch(vIdxEch), rEch.DatVlr);
      rEch.Rep_MntHt  := rEch.Rep_MntHt  + tLstEch(vIdxEch).MntHt;
      rEch.Rep_MntTva := rEch.Rep_MntTva + tLstEch(vIdxEch).MntTva;
      rEch.Rep_MntTtc := rEch.Rep_MntTtc + tLstEch(vIdxEch).MntTtc;
      TrtRepPrr(tLstFacRbq, tLstEch(vIdxEch));
      --TrtRepPrr (pFacRbq IN OUT typ2DLstLgn, pOpr IN OUT typLgn)
      if tIdtOprEch(i) = pIdtOprEch then
        ptDetEch.Delete;
        j := 0;
        vIdxOpr := tLstFacRbq.First;
        while vIdxOpr is not null loop
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
            ptDetEch(j).OprAfc_IdtOpr    := vIdxOpr;
            ptDetEch(j).OprAfc_IdtTypOpr := tLstFac(vIdxOpr).IdtTypOpr;
            ptDetEch(j).OprAfc_DatVlr    := null;
            ptDetEch(j).OprAfc_DatCrt    := null;
            ptDetEch(j).OprAfc_MntHt     := null;
            ptDetEch(j).OprAfc_MntTva    := null;
            ptDetEch(j).NumLgnFct        := tLstFacRbq(vIdxOpr)(vIdxLgn).Idt;
            ptDetEch(j).IdtDetLgn        := tLstFacRbq(vIdxOpr)(vIdxLgn).IdtDetLgn;
            ptDetEch(j).NumTrn           := tLstFacRbq(vIdxOpr)(vIdxLgn).NumTrn;
            ptDetEch(j).Lgn_IdtTax       := tLstFacRbq(vIdxOpr)(vIdxLgn).IdtTax;
            ptDetEch(j).IdtRbq           := tLstFacRbq(vIdxOpr)(vIdxLgn).IdtRbq;
            ptDetEch(j).FacEchr_MntHt    := tLstFac(vIdxOpr).MntHt;
            ptDetEch(j).FacEchr_MntTva   := tLstFac(vIdxOpr).MntTva;
            ptDetEch(j).FacEchr_MntTtc   := tLstFac(vIdxOpr).MntTtc;
            ptDetEch(j).Ech_MntHt        := tLstEch(vIdxEch).MntHt;
            ptDetEch(j).Ech_MntTva       := tLstEch(vIdxEch).MntTva;
            ptDetEch(j).Ech_MntTtc       := tLstEch(vIdxEch).MntTtc;
            ptDetEch(j).Lgn_Qte          := tLstFacRbq(vIdxOpr)(vIdxLgn).Qte;
            ptDetEch(j).Lgn_MntHt        := tLstFacRbq(vIdxOpr)(vIdxLgn).MntHt;
            ptDetEch(j).Lgn_MntTva       := tLstFacRbq(vIdxOpr)(vIdxLgn).MntTva;
            ptDetEch(j).Lgn_MntTtc       := tLstFacRbq(vIdxOpr)(vIdxLgn).MntTtc;
            ptDetEch(j).Lgn_RbqCmm       := tLstFacRbq(vIdxOpr)(vIdxLgn).RbqCmm;
            vIdxLgn := tLstFacRbq(vIdxOpr).Next(vIdxLgn);
          end loop;
          vIdxOpr := tLstFacRbq.Next(vIdxOpr);
        end loop;
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
      end if;
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
                           RbqCmm number
						   ,Rbq_MnTtcImp number
						   );
  TYPE typLstLgnFac is table of typLgnFac index by binary_integer;
  rOpr OPR%ROWTYPE;
  rDetOpr typDetOpr; -- := typDetOprLtt(null,null,null,null,null,null,null);
--  tDetOpr typLstDetOprLtt := typLstDetOprLtt(null);
  tLstLgnFac typLstLgnFac;
  tDetEch typLstDetEch;
  tDetLtt typLstDetLtt;
  vIdtFac FAC.IdtFac%TYPE;
  vMntHt number;
  vMntTva number;
  vMnt number;
  i number;
  j number;
  vSgn number;
  vNbr number;
  vIdtLtt LTT.IdtLtt%TYPE;
  vNB number;
BEGIN
  --syslog01.trc('ClcDetOpr pIdtOpr '||pIdtOpr);
  ptDetOpr := typLstDetOpr(null);
  select *
    into rOpr
    from OPR
    where IdtOpr = pIdtOpr;
  if rOpr.IdtTypOpr in (1,3,4,26) then
    select IdtFac,
           MntHt,
           MntTva
      into vIdtFac,
           vMntHt,
           vMntTva
      from FAC
      where NumFct = rOPR.Rfr;
	select count(*)
	into vNB
	from echpmtrbq
	where IdtFac = vIdtFac;
	if vNB = 0 then
		select LGNFAC.IdtFac,
			   vMntHt,
			   vMntTva,
			   LGNFAC.NumLgnFct,
			   LGNFAC.IdtRbq,
			   DETLGN.IdtDetLgn,
			   DETLGN.NumTrn,
			   nvl(DETLGN.IdtTax,LGNFAC.IdtTax),
			   nvl(DETLGN.QteFct,LGNFAC.QteFct),
			   --
			   --nvl(DETLGN.MntHt,LGNFAC.MntHt),
			   --nvl(DETLGN.MntHt,LGNFAC.MntHt) + nvl(echpmtrbq.SldImp,0),
			   nvl(DETLGN.MntHt,LGNFAC.MntHt) - nvl(echpmtrbq.SldImpHt,0),
			   --
			   nvl(DETLGN.MntTva,LGNFAC.MntTva),
			   --
			   nvl(DETLGN.MntHt,LGNFAC.MntHt) + nvl(DETLGN.MntTva,LGNFAC.MntTva),
			   --nvl(DETLGN.MntHt,LGNFAC.MntHt) + nvl(DETLGN.MntTva,LGNFAC.MntTva) + nvl(echpmtrbq.SldImp,0),
			   --nvl(DETLGN.MntHt,LGNFAC.MntHt) + nvl(DETLGN.MntTva,LGNFAC.MntTva) - nvl(echpmtrbq.SldImp,0),
			   nvl(LGNFAC.RbqCmm,0)
			   -- BPZ 
			   ,echpmtrbq.SldImpTtc
		  bulk collect into tLstLgnFac
		  from DETLGN, LGNFAC
		  , echpmtrbq
		  where DETLGN.IdtFac(+) = LGNFAC.IdtFac
		   and  DETLGN.NumLgnFct(+) = LGNFAC.NumLgnFct
		   and  LGNFAC.IdtFac = vIdtFac
		   and  LGNFAC.IdtFac = echpmtrbq.idtfac(+) 
		   and  LGNFAC.NumLgnFct = echpmtrbq.NumLgnFct(+)
		   ;
	else 
		select LGNFAC.IdtFac,
			   vMntHt,
			   vMntTva,
			   LGNFAC.NumLgnFct,
			   LGNFAC.IdtRbq,
			   DETLGN.IdtDetLgn,
			   DETLGN.NumTrn,
			   nvl(DETLGN.IdtTax,LGNFAC.IdtTax),
			   nvl(DETLGN.QteFct,LGNFAC.QteFct),
			   --
			   --nvl(DETLGN.MntHt,LGNFAC.MntHt),
			   --nvl(DETLGN.MntHt,LGNFAC.MntHt) + nvl(echpmtrbq.SldImp,0),
			   --nvl(DETLGN.MntHt,LGNFAC.MntHt) - nvl(echpmtrbq.SldImp,0),
			   nvl(echpmtrbq.SldImpHt,0),
			   --
			   nvl(DETLGN.MntTva,LGNFAC.MntTva),
			   --
			   nvl(DETLGN.MntHt,LGNFAC.MntHt) + nvl(DETLGN.MntTva,LGNFAC.MntTva),
			   --nvl(DETLGN.MntHt,LGNFAC.MntHt) + nvl(DETLGN.MntTva,LGNFAC.MntTva) + nvl(echpmtrbq.SldImp,0),
			   --nvl(DETLGN.MntHt,LGNFAC.MntHt) + nvl(DETLGN.MntTva,LGNFAC.MntTva) - nvl(echpmtrbq.SldImp,0),
			   nvl(LGNFAC.RbqCmm,0)
			   -- BPZ 
			   ,echpmtrbq.SldImpTtc
		  bulk collect into tLstLgnFac
		  from DETLGN, LGNFAC
		  , echpmtrbq
		  where DETLGN.IdtFac(+) = LGNFAC.IdtFac
		   and  DETLGN.NumLgnFct(+) = LGNFAC.NumLgnFct
		   and  LGNFAC.IdtFac = vIdtFac
		   and  LGNFAC.IdtFac = echpmtrbq.idtfac(+) 
		   and  LGNFAC.NumLgnFct = echpmtrbq.NumLgnFct(+)
	   ;
	end if;
  elsif rOpr.IdtTypOpr in (6,7) then
    ClcDetEch(pIdtOpr, tDetEch, pIdtOprAfc);
    i := tDetEch.First;
    j := 0;
    while i is not null loop
      j := j + 1;
      tLstLgnFac(j).IdtFac     := tDetEch(i).IdtFac;
      if rOpr.IdtTypOpr = 6 then
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
  elsif rOpr.IdtTypOpr in (8) then
    select max(IdtLtt) KEEP (DENSE_RANK Last order by decode(gTypDatCmp,cCMP_DATE_CREATION,trunc(DatCrt),trunc(DatLtt)), idtltt)
      into vIdtLtt
      from  LTT 
      where IdtOprDbt = pIdtOpr;
    ClcDetLtt(vIdtLtt, tDetLtt);
    i := tDetLtt.First;
    j := 0;
    while i is not null loop
      j := j + 1;
      tLstLgnFac(j).IdtFac     := tDetLtt(i).IdtFac;
      tLstLgnFac(j).Opr_MntHt  := tDetLtt(i).MntHt;
      tLstLgnFac(j).Opr_MntTva := tDetLtt(i).MntTva;
      tLstLgnFac(j).NumLgnFct  := tDetLtt(i).NumLgnFct;
      tLstLgnFac(j).IdtDetLgn  := tDetLtt(i).IdtDetLgn;
      tLstLgnFac(j).IdtRbq     := tDetLtt(i).IdtRbq;
      tLstLgnFac(j).NumTrn     := tDetLtt(i).NumTrn;
      tLstLgnFac(j).IdtTax     := tDetLtt(i).Lgn_IdtTax;
      tLstLgnFac(j).Qte        := tDetLtt(i).Lgn_Qte;
      tLstLgnFac(j).MntHt      := tDetLtt(i).Lgn_MntHt;
      tLstLgnFac(j).MntTva     := tDetLtt(i).Lgn_MntTva;
      tLstLgnFac(j).MntTtc     := tDetLtt(i).Lgn_MntTtc;
      tLstLgnFac(j).RbqCmm     := tDetLtt(i).Lgn_RbqCmm;
      i := tDetLtt.Next(i);
    end loop;
    vNbr := tDetLtt.Count;
    tDetLtt.delete;
  else
    select Mnt
      into vMnt
      from OPR
      where IdtOpr = pIdtOpr;
    tLstLgnFac(1).IdtFac    := null;
    tLstLgnFac(1).Opr_MntHt  := vMnt;
    tLstLgnFac(1).Opr_MntTva := 0;
--    tLstLgnFac(1).NumLgnFct := 1;
    tLstLgnFac(1).NumLgnFct := null;
    tLstLgnFac(1).IdtDetLgn := null;
    tLstLgnFac(1).IdtRbq    := null;
    tLstLgnFac(1).NumTrn    := null;
    tLstLgnFac(1).IdtTax    := null;
    tLstLgnFac(1).Qte       := 1;
    tLstLgnFac(1).MntHt     := vMnt;
    tLstLgnFac(1).MntTva    := 0;
    tLstLgnFac(1).MntTtc    := vMnt;
    tLstLgnFac(1).RbqCmm    := 0;
  end if;
  for i in 1..tLstLgnFac.Count loop
    if sign(nvl(tLstLgnFac(i).Opr_MntHt+tLstLgnFac(i).Opr_MntTva,rOpr.Mnt)) <> sign(rOpr.Mnt) then
      vSgn := -1;
    else
      vSgn := 1;
    end if;
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
    --ptDetOpr(i).Rbq_MnTtcImp := tLstLgnFac(i).Rbq_MnTtcImp;
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
  --syslog01.trc('LttAnl');
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
-- Il faut faire attention aux signes utilises. La regle de gestion des signes est:
--   - Cette procedure traite les operation avec un signe positif
--   - Le signe du lettrage et le signe de l'operation affectee sont sauvegardes
--     pour redonner les signes a la fin.
--   - Pour le montant deja affecte sur les operation (montant reparti) on transforme
--     les montants resultant de la repartition avec le signe du lettrage en cours
--     pour obtenir le solde de l'operation affectee.
--   - Pour les lettrages negatifs, on cherche le lettrage positif et on le transforme
--     a la fin avec le bon signe. On ne fait pas la repartition pour les lettrages negatifs
procedure ClcDetLtt(pIdtLtt LTT.IdtLtt%TYPE, ptDetLtt OUT typLstDetLtt) is
--
  type typLstDate is table of date index by binary_integer;
--
  rDetOpr       typDetOpr;
  rLtt          typLgn;
  tDetOpr       typLstDetOpr;
  tDetOprAfc    typLstDetOpr;
  tDetOprRep    typLstDetOpr;
  tIdtLtt       typLstNumber;
  tLstFac       typLstLgn;
  tLstFacRbq    typ2DLstLgn;
  tDetLtt       typLstDetLtt;
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
                                  '       OPR.IdtOpr,' ||
                                  '       OPR.IdtTypOpr,' ||
                                  '       abs(OPR.Mnt),' ||
                                  '       LTT.Mnt,' ||
                                  '       DatCmp,';
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
  vIdtLttAnl    LTT.IdtLtt%TYPE;
  vIdtTypOprDbt TYPOPR.IdtTypOpr%TYPE;
  vIdtTypOprCrt TYPOPR.IdtTypOpr%TYPE;
  vIdtOprAfc    OPR.IdtOpr%TYPE;
  vIdtOprDbt    OPR.IdtOpr%TYPE;
  vIdtOprCrt    OPR.IdtOpr%TYPE;
  vIdtOpr       OPR.IdtOpr%TYPE;
  vMntOprDbt    OPR.Mnt%TYPE;
  vMntOprCrt    OPR.Mnt%TYPE;
  vMntOprAfc    OPR.Mnt%TYPE;
  vMntHtOprAfc  OPR.Mnt%TYPE;
  vMntTvaOprAfc OPR.Mnt%TYPE;
  vMntLtt       LTT.Mnt%TYPE;
--
  vLttDeb       number;
  vNbrLgn       number;
  vOprAfc       varchar2(1);
  vSwRep        number;
  vSwRep2       number;
  vSgnLtt       number;
  vFactor       number;
  i             number;
  j             number;
  k             number;
  vIdxOpr       typIdxChar;
  vIdxLgn       typIdxChar;
  vCumSldHt     number;
  vCumSldTva    number;
  vSgnTotLtt    number;
  vSgnOprAfc    number;
BEGIN
  --syslog01.trc('ClcDetLtt pIdtLtt '|| pIdtLtt );
  if gTypDatCmp = cCMP_DATE_CREATION then
    vStrDat := 'LTT.DatCrt';
  else
    vStrDat := 'LTT.DatLtt';
  end if;
  ptDetLtt   := typLstDetLtt(null);
  tDetOpr    := typLstDetOpr(null);
  tDetOprAfc := typLstDetOpr(null);
  tDetOprRep := typLstDetOpr(null);
  tDetLtt    := typLstDetLtt(null);
  tDetOpr.delete;
  tDetOprAfc.Delete;
  tDetOprRep.delete;
  tDetLtt.delete;
  select LTT.IdtOprDbt,
         OPRDBT.IdtTypOpr,
         OPRDBT.Mnt,
         LTT.IdtOprCrt,
         OPRCRT.IdtTypOpr,
         OPRCRT.Mnt,
         decode(gTypDatCmp,cCMP_DATE_CREATION,LTT.DatCrt,LTT.DatLtt),
         LTT.Mnt
    into vIdtOprDbt,
         vIdtTypOprDbt,
         vMntOprDbt,
         vIdtOprCrt,
         vIdtTypOprCrt,
         vMntOprCrt,
         vDatCmpLtt,
         vMntLtt
    from OPR OPRDBT, OPR OPRCRT, LTT
    where OPRDBT.IdtOpr = LTT.IdtOprDbt
     and  OPRCRT.IdtOpr = LTT.IdtOprCrt
     and  IdtLtt = pIdtLtt;
  vSgnTotLtt := sign(vMntLtt);
  -- Operations debits qui affectent les operations creditrices
  if vIdtTypOprDbt in (5, 8, 9, 10, 11, 26, 30, 31, 35) then
    -- L'operation affectee est l'operation creditrice
    vOprAfc := 'C';
  else
    -- L'operation affectee est l'operation debitrice
    vOprAfc := 'D';
  end if;
  if vOprAfc = 'D' then
    vStrSql := vSlcStd || vSlcDbt || vFrmStd || vWhrStd || vWhrDbt || vOrdStd;
    vIdtOpr := vIdtOprCrt;
    vIdtOprAfc := vIdtOprDbt;
    vMntOprAfc := vMntOprDbt;
  else
    vStrSql := vSlcStd || vSlcCrt || vFrmStd || vWhrStd || vWhrCrt || vOrdStd;
    vIdtOpr := vIdtOprDbt;
    vIdtOprAfc := vIdtOprCrt;
    vMntOprAfc := -vMntOprCrt;
  end if;
  -- On replace le texte 'DatCmp' pour la date a utiliser
  vStrSql := replace(vStrSql,'DatCmp',vStrDat);
  -- Pour certains cas, il n'est pas necessaire faire une repartition ici.
  if vIdtTypOprCrt = 6 and vIdtTypOprDbt = 8 then
    vSwRep := 0;
    ClcDetOpr(vIdtOprAfc,tDetOpr);
    -- On fait le traitement pour des operation positives, donc on change le signe
    i := tDetOpr.First;
    while i is not null loop
      tDetOpr(i).MntHt      := tDetOpr(i).MntHt      * -1;
      tDetOpr(i).MntTva     := tDetOpr(i).MntTva     * -1;
      tDetOpr(i).Lgn_MntHt  := tDetOpr(i).Lgn_MntHt  * -1;
      tDetOpr(i).Lgn_MntTva := tDetOpr(i).Lgn_MntTva * -1;
      tDetOpr(i).Lgn_MntTtc := tDetOpr(i).Lgn_MntTtc * -1;
      tDetOpr(i).Lgn_Qte    := tDetOpr(i).Lgn_Qte    * -1;
      i := tDetOpr.Next(i);
    end loop;
    vSgnOprAfc := -1;
    tDetOprAfc := tDetOpr;
  elsif vIdtTypOprDbt = 26 then
    -- Cas d'annulation d'un avoir.
    -- On prend le detail de l'operation annulation d'avoir
    vSwRep := 0;
    ClcDetOpr(vIdtOpr,tDetOpr);
    ClcDetOpr(vIdtOprAfc,tDetOprAfc);
    i := tDetOprAfc.First;
    while i is not null loop
      tDetOprAfc(i).MntHt      := tDetOprAfc(i).MntHt      * -1;
      tDetOprAfc(i).MntTva     := tDetOprAfc(i).MntTva     * -1;
      tDetOprAfc(i).Lgn_MntHt  := tDetOprAfc(i).Lgn_MntHt  * -1;
      tDetOprAfc(i).Lgn_MntTva := tDetOprAfc(i).Lgn_MntTva * -1;
      tDetOprAfc(i).Lgn_MntTtc := tDetOprAfc(i).Lgn_MntTtc * -1;
      tDetOprAfc(i).Lgn_Qte    := tDetOprAfc(i).Lgn_Qte    * -1;
      i := tDetOprAfc.Next(i);
    end loop;
    vSgnOprAfc := -1;
  elsif vIdtTypOprCrt = 11 then
    -- Cas d'annulation d'un echeance.
    -- On recupere l'information de l'echeance
    vSwRep := 0;
    ClcDetOpr(vIdtOprAfc,tDetOpr);
--    i := tDetOpr.First;
--    while i is not null loop
--      tDetOpr(i).MntHt      := tDetOpr(i).MntHt      * -1;
--      tDetOpr(i).MntTva     := tDetOpr(i).MntTva     * -1;
--      tDetOpr(i).Lgn_MntHt  := tDetOpr(i).Lgn_MntHt  * -1;
--      tDetOpr(i).Lgn_MntTva := tDetOpr(i).Lgn_MntTva * -1;
--      tDetOpr(i).Lgn_MntTtc := tDetOpr(i).Lgn_MntTtc * -1;
--      tDetOpr(i).Lgn_Qte    := tDetOpr(i).Lgn_Qte    * -1;
--      i := tDetOpr.Next(i);
--    end loop;
    vSgnOprAfc := 1;
    tDetOprAfc := tDetOpr;
  else
    -- Dans tous les autres cas, il faudra faire la repartition
    vSwRep := 1;
    -- On recupere le detail de l'information affectee
    ClcDetOpr(vIdtOprAfc,tDetOpr);
    if vOprAfc = 'C' then
      i := tDetOpr.First;
      while i is not null loop
        tDetOpr(i).MntHt      := tDetOpr(i).MntHt      * -1;
        tDetOpr(i).MntTva     := tDetOpr(i).MntTva     * -1;
        tDetOpr(i).Lgn_MntHt  := tDetOpr(i).Lgn_MntHt  * -1;
        tDetOpr(i).Lgn_MntTva := tDetOpr(i).Lgn_MntTva * -1;
        tDetOpr(i).Lgn_MntTtc := tDetOpr(i).Lgn_MntTtc * -1;
        tDetOpr(i).Lgn_Qte    := tDetOpr(i).Lgn_Qte    * -1;
        i := tDetOpr.Next(i);
      end loop;
      vSgnOprAfc := -1;
    else
      vSgnOprAfc := 1;
    end if;
    tDetOprAfc := tDetOpr;
  end if;
  -- On sauvegarde le detail de la repartition si elle a ete fait
  if vSwRep = 0 then
    tDetOprRep := tDetOpr;
  end if;
  -- Il faut trouver le montant total de l'operation affectee
  i := tDetOprAfc.First;
  vMntHtOprAfc  := nvl(tDetOprAfc(i).MntHt,vMntOprAfc);
  vMntTvaOprAfc := nvl(tDetOprAfc(i).MntTva,0);
  --syslog01.trc(vStrSql);
  --syslog01.trc(vDatCmpLtt||' '||pIdtLtt||' '||vDatCmpLtt||' '||pIdtLtt||' '||vIdtOprAfc);
  execute immediate vStrSql
    bulk collect into tIdtLtt,
                      tIdtOpr,
                      tIdtTypOpr,
                      tMntOpr,
                      tMntLtt,
                      tDatCmpLtt,
                      tMntRep
    using vDatCmpLtt, pIdtLtt, vDatCmpLtt, pIdtLtt, vIdtOprAfc;
  -- Pour des raisons de performance, on cherche le lettrage le plus recent
  -- avant lequel il n'y avait pas un montant reparti. Cela evite le calcul
  -- des lettrages dans des cas comme paiement suivi par l'annulation de paiement, etc.
--  if vMntLtt < 0 then
--    vLttDeb := tIdtLtt.Last;
--  else
    for i in 1..tMntRep.Count loop
      if tMntRep(i) = 0 then
        vLttDeb := i;
      end if;
    end loop;
--  end if;
  -- On trouve le detail pour tous les lettrages qui affectent l'operation affectee
  for i in vLttDeb..tIdtLtt.Count loop
    if tMntLtt(i) < 0 then
      if vOprAfc = 'D' then
        vIdtOprDbt := vIdtOprAfc;
        vIdtOprCrt := tIdtOpr(i);
      else
        vIdtOprDbt := tIdtOpr(i);
        vIdtOprCrt := vIdtOprAfc;
      end if;
      vSgnLtt := -1;
	  rLtt.Rbq_MnTtcImp := 0;
      vIdtLttAnl := LttAnl(tIdtLtt(i), vIdtOprDbt, vIdtOprCrt, tMntLtt(i), tDatCmpLtt(i));
      ClcDetLtt(vIdtLttAnl,tDetLtt);
      tDetOpr.Delete;
      j := tDetLtt.First;
      while j is not null loop
        tDetOpr.Extend;
        tDetOpr(j).IdtFac     := tDetLtt(j).IdtFac;
        tDetOpr(j).MntHt      := tDetLtt(j).MntHt;
        tDetOpr(j).MntTva     := tDetLtt(j).MntTva;
        tDetOpr(j).NumTrn     := tDetLtt(j).NumTrn;
        tDetOpr(j).NumLgnFct  := tDetLtt(j).NumLgnFct;
        tDetOpr(j).IdtDetLgn  := tDetLtt(j).IdtDetLgn;
        tDetOpr(j).IdtRbq     := tDetLtt(j).IdtRbq;
        tDetOpr(j).Lgn_IdtTax := tDetLtt(j).Lgn_IdtTax;
        tDetOpr(j).Lgn_Qte    := tDetLtt(j).Lgn_Qte;
        tDetOpr(j).Lgn_MntHt  := tDetLtt(j).Lgn_MntHt;
        tDetOpr(j).Lgn_MntTva := tDetLtt(j).Lgn_MntTva;
        tDetOpr(j).Lgn_MntTtc := tDetLtt(j).Lgn_MntTtc;
        tDetOpr(j).Lgn_RbqCmm := tDetLtt(j).Lgn_RbqCmm;
        rLtt.MntTtc := abs(tMntLtt(i));
        rLtt.MntHt  := abs(tDetLtt(j).MntHt);
        rLtt.MntTva := abs(tDetLtt(j).MntTva);
		rLtt.Rbq_MnTtcImp := rLtt.Rbq_MnTtcImp + nvl(tDetOpr(j).Rbq_MnTtcImp,0);
        j := tDetLtt.Next(j);
      end loop;
      vSwRep2 := 0;
      rLtt.Rep_MntHt  := 0;
      rLtt.Rep_MntTva := 0;
      rLtt.Rep_MntTtc := 0;
      rLtt.Tot_MntHt  := rLtt.MntHt ;
      rLtt.Tot_MntTva := rLtt.MntTva;
      rLtt.Tot_MntTtc := rLtt.MntTtc;
    else
      -- On fait la repartition s'il faut faire la repartition ou
      -- s'il ne s'agit pas du lettrage a repartir et la repartition a ete deja faite
      if vSwRep = 0 and tIdtLtt(i) = pIdtLtt then
        tDetOpr := tDetOprRep;
        vSwRep2 := 0;
      else
        vSwRep2 := 1;
        tDetOpr := tDetOprAfc;
        -- Il aura une repartition, donc dans le traitement de repartition, le
        -- lettrage va donner le sign. On etablie a 1 le sign du lettrage pour
        -- que il n'aie pas de conversion de sign.
      end if;
      rLtt.MntTtc := tMntLtt(i);
      rLtt.MntHt  := 0;
      rLtt.MntTva := 0;
      rLtt.Rep_MntHt  := 0;
      rLtt.Rep_MntTva := 0;
      rLtt.Rep_MntTtc := 0;
      rLtt.Tot_MntHt  := rLtt.MntHt ;
      rLtt.Tot_MntTva := rLtt.MntTva;
      rLtt.Tot_MntTtc := rLtt.MntTtc;
      vSgnLtt := 1;
    end if;
    if i = vLttDeb then
      j := tDetOpr.First;
      k := 0;
      while j is not null loop
        vIdxOpr := fIdxOpr(vIdtOprAfc);
        -- Initialisation de tLstFac
        tLstFac(vIdxOpr).IdtFac     := tDetOpr(j).IdtFac;
        tLstFac(vIdxOpr).Idt        := tDetOpr(j).IdtFac;
        tLstFac(vIdxOpr).MntHt      := vMntHtOprAfc;
        tLstFac(vIdxOpr).MntTva     := vMntTvaOprAfc;
        tLstFac(vIdxOpr).MntTtc     := vMntOprAfc;
        tLstFac(vIdxOpr).CumMntHt   := 0;
        tLstFac(vIdxOpr).CumMntTva  := 0;
        tLstFac(vIdxOpr).Tot_MntHt  := vMntHtOprAfc;
        tLstFac(vIdxOpr).Tot_MntTva := vMntTvaOprAfc;
        tLstFac(vIdxOpr).Tot_MntTtc := vMntOprAfc;
        tLstFac(vIdxOpr).Rep_MntHt  := 0;
        tLstFac(vIdxOpr).Rep_MntTva := 0;
        tLstFac(vIdxOpr).Rep_MntTtc := 0;
        tLstFac(vIdxOpr).Rbq_MnTtcImp := nvl(tLstFac(vIdxOpr).Rbq_MnTtcImp,0) +  nvl(tDetOpr(j).Rbq_MnTtcImp,0);
        --tLstFac(vIdxOpr).Rep_MntTtc := tLstFac(vIdxOpr).Rbq_MnTtcImp;
		
        -- La cle est bassee sur des donnees de la facture; si le detail ne correspond
        -- pas a une facture, l'information sera remplace a chaque fois au lieu
        -- de creer un nouveau enregistrement. Pour eviter ceci, on increment un compteur k
        if tDetOpr(j).IdtFac is null then
          k := k + 1;
          tDetOpr(j).NumLgnFct := k;
        end if;
        vIdxLgn := fIdxLgn(tDetOpr(j).NumLgnFct, tDetOpr(j).IdtDetLgn, tDetOpr(j).IdtFac);
        -- Initialisation de tLstFacRbq
        if tDetOpr(j).IdtFac is not null then
          tLstFacRbq(vIdxOpr)(vIdxLgn).IdtFac     := tDetOpr(j).IdtFac;
          tLstFacRbq(vIdxOpr)(vIdxLgn).Idt        := tDetOpr(j).NumLgnFct;
          tLstFacRbq(vIdxOpr)(vIdxLgn).IdtDetLgn  := tDetOpr(j).IdtDetLgn;
          tLstFacRbq(vIdxOpr)(vIdxLgn).NumTrn     := tDetOpr(j).NumTrn;
        end if;
        tLstFacRbq(vIdxOpr)(vIdxLgn).IdtTax     := tDetOpr(j).Lgn_IdtTax;
        tLstFacRbq(vIdxOpr)(vIdxLgn).IdtRbq     := tDetOpr(j).IdtRbq;
        tLstFacRbq(vIdxOpr)(vIdxLgn).CumMntHt   := 0;
        tLstFacRbq(vIdxOpr)(vIdxLgn).CumMntTva  := 0;
        tLstFacRbq(vIdxOpr)(vIdxLgn).Qte        := tDetOpr(j).LGN_Qte;
        tLstFacRbq(vIdxOpr)(vIdxLgn).MntHt      := nvl(tDetOpr(j).LGN_MntHt,vMntOprAfc);
        tLstFacRbq(vIdxOpr)(vIdxLgn).MntTva     := nvl(tDetOpr(j).LGN_MntTva,0);
        tLstFacRbq(vIdxOpr)(vIdxLgn).MntTtc     := tDetOpr(j).LGN_MntTtc;
        tLstFacRbq(vIdxOpr)(vIdxLgn).Tot_Qte    := tDetOprAfc(j).LGN_Qte;
        tLstFacRbq(vIdxOpr)(vIdxLgn).Tot_MntHt  := nvl(tDetOprAfc(j).LGN_MntHt,vMntOprAfc);
        tLstFacRbq(vIdxOpr)(vIdxLgn).Tot_MntTva := nvl(tDetOprAfc(j).LGN_MntTva,0);
        tLstFacRbq(vIdxOpr)(vIdxLgn).Tot_MntTtc := tDetOprAfc(j).LGN_MntTtc;
        tLstFacRbq(vIdxOpr)(vIdxLgn).Rep_Qte    := 0;
        tLstFacRbq(vIdxOpr)(vIdxLgn).Rep_MntHt  := 0;
        tLstFacRbq(vIdxOpr)(vIdxLgn).Rep_MntTva := 0;
        --tLstFacRbq(vIdxOpr)(vIdxLgn).Rep_MntTtc := 0;
        tLstFacRbq(vIdxOpr)(vIdxLgn).Rep_MntTtc := nvl(tDetOpr(j).Rbq_MnTtcImp,0);
        tLstFacRbq(vIdxOpr)(vIdxLgn).RbqCmm     := tDetOpr(j).LGN_RbqCmm;		
        tLstFacRbq(vIdxOpr)(vIdxLgn).Rbq_MnTtcImp     := tDetOpr(j).Rbq_MnTtcImp;		
        j := tDetOpr.Next(j);
      end loop;
    end if;
    if tLstFacRbq.Count = 0 then
      return;
    end if;
    vIdxOpr := tLstFac.First;
    -- TODO: Chercher l'information du lettrage dans la table ECHPMTRBQ
    -- TODO: SI pas dans ECHPMTRBQ    
    if tMntLtt(i) > 0 then
      TrtRep(tLstFac(vIdxOpr), rLtt, tDatCmpLtt(i));
    end if;
    -- TODO: FIN CONDITION
    if vSwRep2 = 1 then
      -- TODO: SI dans ECHMPTRBQ
      -- TODO: REMPLIR avec les informations de ECHPMTRBQ:
      -- tLstFacRbq(vIdxOpr)(vIdxLgn).Qte ;
      -- tLstFacRbq(vIdxOpr)(vIdxLgn).MntHt ;
      -- tLstFacRbq(vIdxOpr)(vIdxLgn).MntTva;
      -- tLstFacRbq(vIdxOpr)(vIdxLgn).MntTtc;
      
      
      -- TODO: SI pas dans ECHPMTRBQ
      TrtRepPrr(tLstFacRbq, rLtt);
      -- TODO: FIN CONDITION
      vIdxOpr := tLstFacRbq.First;
      while vIdxOpr is not null loop
        vIdxLgn := tLstFacRbq(vIdxOpr).First;
        while vIdxLgn is not null loop
          if tLstFacRbq(vIdxOpr)(vIdxLgn).RbqCmm = 0 then
            tLstFac(vIdxOpr).Rep_Qte    := tLstFac(vIdxOpr).Rep_Qte    + tLstFacRbq(vIdxOpr)(vIdxLgn).Qte ;
            tLstFac(vIdxOpr).Rep_MntHt  := tLstFac(vIdxOpr).Rep_MntHt  + tLstFacRbq(vIdxOpr)(vIdxLgn).MntHt ;
            tLstFac(vIdxOpr).Rep_MntTva := tLstFac(vIdxOpr).Rep_MntTva + tLstFacRbq(vIdxOpr)(vIdxLgn).MntTva;
            tLstFac(vIdxOpr).Rep_MntTtc := tLstFac(vIdxOpr).Rep_MntTtc + tLstFacRbq(vIdxOpr)(vIdxLgn).MntTtc;
          end if;
          vIdxLgn := tLstFacRbq(vIdxOpr).Next(vIdxLgn);
        end loop;
        vIdxOpr := tLstFacRbq.Next(vIdxOpr);
      end loop;
    else
      j := tDetOpr.First;
      while j is not null loop
        vIdxOpr := fIdxOpr(vIdtOprAfc);
        vIdxLgn := fIdxLgn(tDetOpr(j).NumLgnFct, tDetOpr(j).IdtDetLgn, tDetOpr(j).IdtFac);
        -- Initialisation de tLstFacRbq
        tLstFacRbq(vIdxOpr)(vIdxLgn).Qte        := tDetOpr(j).LGN_Qte;
        tLstFacRbq(vIdxOpr)(vIdxLgn).MntHt      := nvl(tDetOpr(j).LGN_MntHt,vMntOprAfc);
        tLstFacRbq(vIdxOpr)(vIdxLgn).MntTva     := nvl(tDetOpr(j).LGN_MntTva,0);
        tLstFacRbq(vIdxOpr)(vIdxLgn).MntTtc     := tDetOpr(j).LGN_MntTtc;
        tLstFacRbq(vIdxOpr)(vIdxLgn).Rep_Qte    := tLstFacRbq(vIdxOpr)(vIdxLgn).Rep_Qte    + tLstFacRbq(vIdxOpr)(vIdxLgn).Qte * vSgnLtt;
        tLstFacRbq(vIdxOpr)(vIdxLgn).Rep_MntHt  := tLstFacRbq(vIdxOpr)(vIdxLgn).Rep_MntHt  + tLstFacRbq(vIdxOpr)(vIdxLgn).MntHt * vSgnLtt;
        tLstFacRbq(vIdxOpr)(vIdxLgn).Rep_MntTva := tLstFacRbq(vIdxOpr)(vIdxLgn).Rep_MntTva + tLstFacRbq(vIdxOpr)(vIdxLgn).MntTva * vSgnLtt;
        tLstFacRbq(vIdxOpr)(vIdxLgn).Rep_MntTtc := tLstFacRbq(vIdxOpr)(vIdxLgn).Rep_MntTtc + tLstFacRbq(vIdxOpr)(vIdxLgn).MntTtc * vSgnLtt;
        if tLstFacRbq(vIdxOpr)(vIdxLgn).RbqCmm = 0 then
          tLstFac(vIdxOpr).Rep_Qte    := tLstFac(vIdxOpr).Rep_Qte    + tLstFacRbq(vIdxOpr)(vIdxLgn).Qte  * vSgnLtt;
          tLstFac(vIdxOpr).Rep_MntHt  := tLstFac(vIdxOpr).Rep_MntHt  + tLstFacRbq(vIdxOpr)(vIdxLgn).MntHt * vSgnLtt ;
          tLstFac(vIdxOpr).Rep_MntTva := tLstFac(vIdxOpr).Rep_MntTva + tLstFacRbq(vIdxOpr)(vIdxLgn).MntTva * vSgnLtt;
          tLstFac(vIdxOpr).Rep_MntTtc := tLstFac(vIdxOpr).Rep_MntTtc + tLstFacRbq(vIdxOpr)(vIdxLgn).MntTtc * vSgnLtt;
        end if;
        j := tDetOpr.Next(j);
      end loop;
    end if;
  end loop;
  i := 0;
  vIdxOpr := tLstFacRbq.First;
  while vIdxOpr is not null loop
    vIdxLgn := tLstFacRbq(vIdxOpr).First;
    while vIdxLgn is not null loop
      i := i + 1;
      ptDetLtt(i).IdtFac     := tLstFacRbq(vIdxOpr)(vIdxLgn).IdtFac;
      ptDetLtt(i).MntHt      := rLtt.MntHt * vSgnTotLtt;
      ptDetLtt(i).MntTva     := rLtt.MntTva * vSgnTotLtt;
      ptDetLtt(i).NumLgnFct  := tLstFacRbq(vIdxOpr)(vIdxLgn).Idt;
      ptDetLtt(i).IdtDetLgn  := tLstFacRbq(vIdxOpr)(vIdxLgn).IdtDetLgn;
      ptDetLtt(i).NumTrn     := tLstFacRbq(vIdxOpr)(vIdxLgn).NumTrn;
      ptDetLtt(i).Lgn_IdtTax := tLstFacRbq(vIdxOpr)(vIdxLgn).IdtTax;
      ptDetLtt(i).IdtRbq     := tLstFacRbq(vIdxOpr)(vIdxLgn).IdtRbq;
      ptDetLtt(i).Lgn_Qte    := tLstFacRbq(vIdxOpr)(vIdxLgn).Qte * vSgnTotLtt;
      ptDetLtt(i).Lgn_MntHt  := tLstFacRbq(vIdxOpr)(vIdxLgn).MntHt * vSgnTotLtt;
      ptDetLtt(i).Lgn_MntTva := tLstFacRbq(vIdxOpr)(vIdxLgn).MntTva * vSgnTotLtt;
      ptDetLtt(i).Lgn_MntTtc := tLstFacRbq(vIdxOpr)(vIdxLgn).MntTtc * vSgnTotLtt;
      ptDetLtt(i).Lgn_RbqCmm := tLstFacRbq(vIdxOpr)(vIdxLgn).RbqCmm;
      --
      ptDetLtt(i).Lgn_SldHt  := tLstFacRbq(vIdxOpr)(vIdxLgn).Tot_MntHt  * vSgnOprAfc - tLstFacRbq(vIdxOpr)(vIdxLgn).Rep_MntHt  * vSgnOprAfc;
      ptDetLtt(i).Lgn_SldTva := tLstFacRbq(vIdxOpr)(vIdxLgn).Tot_MntTva * vSgnOprAfc - tLstFacRbq(vIdxOpr)(vIdxLgn).Rep_MntTva * vSgnOprAfc;
      ptDetLtt(i).Lgn_SldTtc := tLstFacRbq(vIdxOpr)(vIdxLgn).Tot_MntTtc * vSgnOprAfc - tLstFacRbq(vIdxOpr)(vIdxLgn).Rep_MntTtc * vSgnOprAfc;
      if ptDetLtt(i).Lgn_RbqCmm = 0  then
        --
        vCumSldHt      := nvl(vCumSldHt,0)  + nvl(ptDetLtt(i).Lgn_SldHt,0);
        vCumSldTva     := nvl(vCumSldTva,0) + nvl(ptDetLtt(i).Lgn_SldTva,0);
      end if;
      --
      ptDetLtt.Extend;
      vIdxLgn := tLstFacRbq(vIdxOpr).Next(vIdxLgn);
    end loop;
    vIdxOpr := tLstFacRbq.Next(vIdxOpr);
  end loop;
  i := ptDetLtt.First;
  while i is not null loop
    ptDetLtt(i).SldHt  := vCumSldHt;
    ptDetLtt(i).SldTva := vCumSldTva;
    ptDetLtt(i).SldTtc := vCumSldHt + vCumSldTva;
    i := ptDetLtt.Next(i);
  end loop;
  vNbrLgn := tDetOpr.Count;
--  tDetOpr.trim(vNbrLgn);
  tDetOpr.delete;
  vNbrLgn := tDetOprAfc.Count;
--  tDetOprAfc.trim(vNbrLgn);
  tDetOprAfc.delete;
  vNbrLgn := tDetOprRep.Count;
--  tDetOprRep.trim(vNbrLgn);
  tDetOprRep.delete;
  vNbrLgn := tDetLtt.Count;
--  tDetLtt.trim(vNbrLgn);
  tDetLtt.delete;
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
