CREATE OR REPLACE TRIGGER TRBU_LOTRTG_OET
-- Ce trigger permet de gérer les OPR concernées par le lot de routage qui
-- vient d'être fermé.
-- +++++++++++++++++  OET / LIBAN ++++++++++++++
-- On doit ici :
-- 1/ retirer du fond de caisse du collecteur les montants des factures du lot
-- 2/ flager les OPR qui n'ont pas été payées pour éviter de faire cette saisie
--    qui bloque avec Wiztom
-- 3/ Marquer comme imprimées les factures de pénalités qui accompagnent les factures du lot
-- 4/ mettre à NULL cette meme date sur les factures impayées et donc libérées du lot.
BEFORE UPDATE ON LOTRTG
FOR EACH ROW
WHEN (
NEW.DatFinRtg IS NOT NULL
      )
DECLARE
  -- Declaration des constants
  cTypOprChgSitDeb             CONSTANT TYPOPR.IdtTypOpr%TYPE := 15;
  cTypOprChgSitCrt             CONSTANT TYPOPR.IdtTypOpr%TYPE := 16;
  cIdtSit_IssuedToCollector    CONSTANT SIT.IdtSit%TYPE       := 103;
  cIdtSit_ReturnedByCollector  CONSTANT SIT.IdtSit%TYPE       := 105;
  -- Declaration des variables
  vIdtAgtPrv      SOUSLOTRTG.IdtAgtPrv%TYPE;
  vIdtSousLotRtg  SOUSLOTRTG.IdtSousLotRtg%TYPE;
  vSumMntRtgImp      NUMBER;
  vMntImpayes     NUMBER;
  vBrdRgr         OPR.BrdRgr%TYPE;
  vIdtAgt         AGT.IdtAgt%TYPE;
  vIdtSit         SIT.IdtSit%TYPE;
  vRfrChgSitDeb  OPR.Rfr%TYPE;
  vRfrChgSitCrt  OPR.Rfr%TYPE;
  vPrfxChgSitDeb TYPOPR.Prfx%TYPE;
  vPrfxChgSitCrt TYPOPR.Prfx%TYPE;
  vChrSep        PRMGNR.SprCdf%TYPE;
  -- Cursor listant les sous-lots avec collecteur et montant associés.
  CURSOR cSousLot IS
    SELECT
      SUM(
        DECODE(nvl(RT.DatExe, to_date('01011900', 'DDMMYYYY')),
          -- Si la DatExe est NULL (donc nvl() retourne '01011900') la facture n'est pas payée dans la collecte.
          -- il faut donc prendre en compte son montant pour le retrancher du fond de caisse du collecteur
          to_date('01011900', 'DDMMYYYY'),
             NVL(VF.MNTHT,0) + NVL(VF.MNTTVA,0) + NVL(VF.MntPen,0) + NVL(MntTim,0) + NVL(MntArr,0) + TrtPen_Oet.MntTimFacxOpr (VF.IDTOPR),
          -- Si la facture est payée alors on retourne 0.
          0)
        )  SumMntRtgImp,
      SL.IdtAgtPrv,
      SL.IdtSousLotRtg
    FROM
      X7.SOUSLOTRTG SL,
      X7.X7_DIST_CTRL_OET VF,
      X7.RTG RT
    WHERE  RT.IDTLOTRTG = :NEW.IdtLotRtg
       -- Il ne faut pas prendre les factures de timbres et pénalités
       -- qui pourraient passer par là...
       AND VF.IDTTYPFCT NOT IN ('7', '102')
       AND VF.IDTOPR        = RT.IDTOPR
       AND RT.IDTSOUSLOTRTG = SL.IDTSOUSLOTRTG
       AND RT.IDTLOTRTG = SL.IDTLOTRTG
    GROUP BY SL.IdtAgtPrv,
             SL.IdtSousLotRtg ;
  -- Les curseurs suivants permettent de traiter TOUTES les
  -- operation attachées aux factures du lot de routage, meme
  -- si elles n'ont pas été dans le lot elle meme (facture de pen. générées apres le lot par ex.).
  -- Cursor sur les operations payées dans le lot
  CURSOR cOpr1 IS
    SELECT IdtOpr, DatImp, BrdRgr
    FROM OPR
    WHERE IdtLotRtg = :NEW.IdtLotRtg
     AND  IdtCodObsRtg = 101;
  -- Cursor sur les operations impayées dans le lot
  CURSOR cOpr2 IS
    SELECT IdtOpr, DatImp, BrdRgr
    FROM OPR
    WHERE IdtLotRtg = :NEW.IdtLotRtg
     AND  IdtCodObsRtg = 102;
  -- Cursor avec toutes les factures ayant les codes d'observation 102, 104, 105
  cursor cFACINLOT is
    select OPR.IdtLotRtg, OPR.Rfr, RTG.IdtCodObsRtg
      from OPR, RTG
      where RTG.IdtLotRtg     = :NEW.IdtLotRtg
       and  OPR.IdtOpr    = RTG.IdtOpr
       and  OPR.IdtTypOpr = 1
       and  OPR.IdtCodObsRtg in (102, 104, 105);
  -- Cursor avec toutes les factures dans le borderau de regroupement
  cursor cFACBRD is
    select OPR.IdtClt,
           OPR.IdtCptClt,
           OPR.Rfr,
           OPR.Mnt,
           OPR.DatCnv,
           OPR.IdtDvs,
           OPR.IdtOpr
      from OPR
      where BrdRgr = vBrdRgr
       and  OPR.IdtTypOpr = 1
       and  CLTBTC01.EstOprAnl(OPR.IdtOpr) = 0;

  vMntFndCss FNDCSSAGN.MNTFNDCSS%TYPE;

  vMsg varchar2(200);
  
  vAGT varchar2(250);

BEGIN
  -- ** trtmsg01.WriteSimpleLogFile('PENALITES', ' => TRBU_LOTRTG_OET(IdtLotRtg = ' || to_char(:NEW.IdtLotRtg) || ')');
  -- Nous devons traiter les opérations du lot pour :
  -- supprimer les montants correspondant des fonds de caisse des collecteur
  -- et marquer commer traitées IMPAYEE (code 102) les factures non payées (non collectées)
  FOR rSousLot IN cSousLot LOOP
    -- ** trtmsg01.WriteSimpleLogFile('PENALITES', ' TRBU_LOTRTG_OET : update sous lot ' || to_char(rSousLot.IdtSousLotRtg));

    -- Marquage des opérations non traitées du lot
    UPDATE RTG
      SET IdtCodObsRtg = 102,
          -- Ceci me permet d'avoir l'heure exacte au moins au niveau des OPR...
          DatExe = SYSDATE,
          IdtAgtExe = rSousLot.IdtAgtPrv
      WHERE IdtLotRtg = :NEW.IdtLotRtg
        AND IdtSousLotRtg = rSousLot.IdtSousLotRtg
        AND DatExe IS NULL;

    -- ===============================================================================
    -- Révision 10/12/2009 CAL : il faut quand même retirer les factures impayées du
    -- fond de caisse du collecteur !
    -- ===============================================================================


    -- On récupère le fond de caisse
    begin
        SELECT MntFndCss into vMntFndCss
        FROM FNDCSSAGN
        WHERE IdtAgt = rSousLot.IdtAgtPrv;
    exception when no_data_found then
    -- bpz
        RAISE_APPLICATION_ERROR(x7util.erreur_x7() ,'Font de caisse inconnu pour '||rSousLot.IdtAgtPrv);
    end;

    -- ** trtmsg01.WriteSimpleLogFile('PENALITES', ' TRBU_LOTRTG_OET : vMntFndCss = ' || to_char(vMntFndCss));
    -- ** trtmsg01.WriteSimpleLogFile('PENALITES', ' TRBU_LOTRTG_OET : SumMntRtgImp = ' || to_char(rSousLot.SumMntRtgImp));

    -- On empêche ici le fond de caisse de passer en négatif.
    if vMntFndCss < rSousLot.SumMntRtgImp then
      vMntFndCss := 0;
    else
      vMntFndCss := vMntFndCss - rSousLot.SumMntRtgImp;
    end if;

    -- ** trtmsg01.WriteSimpleLogFile('PENALITES', ' TRBU_LOTRTG_OET : vMntFndCss corrigé = ' || to_char(vMntFndCss));

    -- Mise à jour du fond de caisse.
    UPDATE FNDCSSAGN
      SET MntFndCss = vMntFndCss
      WHERE IdtAgt = rSousLot.IdtAgtPrv;

  END LOOP;
   -- Il faut aussi les marquer dans OPR ! Les OPR non marquées sont suposées non payées (102).
   -- Il faut aller chercher les lignes de RTG avec le code 102, car c'est le seul moyen de
   -- retrouver celle d'OPR. En effet si une OPR est ré-émise une seconde fois dans un lot,
   -- elle garde l'ancien code d'observation qui n'est donc plus NULL.

   -- ** trtmsg01.WriteSimpleLogFile('PENALITES', ' TRBU_LOTRTG_OET : update OPR');
   UPDATE OPR
     SET IdtCodObsRtg = 102
     WHERE (IdtOpr, IdtLotRtg) IN (
                                    SELECT IdtOpr, IdtLotRtg
                                    FROM RTG
                                    WHERE IdtLotRtg = :NEW.IdtLotRtg
                                      AND IdtCodObsRtg = 102
                                   );
  -- On assigne tout d'abord une date d'impression à toute les operations marquées comme payée (1)
  -- On copie betement la date d'impression de l'opération pour lequel BRDRGR = RFR, car il faut
  -- traiter les OPR appartenant aux bordereaux (les factures de penalités et de timbres ne sont
  -- pas nécessairement dans le lot de routage !!!).
  FOR rOpr1 IN cOpr1 LOOP
    UPDATE OPR
      SET DatImp = rOpr1.DatImp
      WHERE BrdRgr = rOpr1.BrdRgr;
  END LOOP;
  -- Ici on met NULL.
  FOR rOpr2 IN cOpr2 LOOP
    UPDATE OPR
      SET DatImp = NULL
      WHERE BrdRgr = rOpr2.BrdRgr;
  END LOOP;
  -- Traitement de changement de situation
  --------------------------------------------------------------------
  -- recherche de prefix pour le type d'operation de changement
  -- de situation.
  --------------------------------------------------------------------
  select Prfx
    into vPrfxChgSitDeb
    from TYPOPR
    where IdtTypOpr = cTypOprChgSitDeb;
  select Prfx
    into vPrfxChgSitCrt
    from TYPOPR
    where IdtTypOpr = cTypOprChgSitCrt;
  select SprCdf
    into vChrSep
    from PRMGNR;
  select IdtAgt
    into vIdtAgt
    from AGT
    where NomCnx = user;

  -- ** trtmsg01.WriteSimpleLogFile('PENALITES', ' TRBU_LOTRTG_OET : Maj état des opérations');
  for rFACINLOT in cFACINLOT loop
    vBrdRgr := rFACINLOT.Rfr;
    if rFACINLOT.IdtCodObsRtg in (102, 105) then
      vIdtSit := cIdtSit_ReturnedByCollector;
    else
      vIdtSit := cIdtSit_IssuedToCollector;
    end if;
    for rFACBRD in cFACBRD loop
      X7_TRTSEQ01.X7_AttNumChtSit(rFACBRD.Rfr, vRfrChgSitDeb, vRfrChgSitCrt);

             vMsg := NULL;
             -- ** trtmsg01.WriteSimpleLogFile('PENALITES', ' TRBU_LOTRTG_OET : X7_CrtOpr(' || to_char(rFACBRD.IdtOpr) || ')');
      CLTBTC01.X7_CrtOpr(pIdtAgt => TrtPen_OET.CurrentIdtAgt,
                         pIdtCltOrg => rFACBRD.IdtClt,
                         pIdtCptCltOrg => rFACBRD.IdtCptClt,
                         pRfr => vRfrChgSitCrt,
                         pIdtTypOpr => 16,
                         pMnt => rFACBRD.Mnt,
                         pDatVlr => sysdate,
                         pDatExg => sysdate,
                         pDatCnv => rFACBRD.DatCnv,
                         pIdtOprAff => rFACBRD.IdtOpr,
                         pIdtSit => vIdtSit,
                         pIdtDvs => rFACBRD.IdtDvs,
                         pMsg => vMsg);

--      if nvl(vMsg, '') <> '' then
          -- ** trtmsg01.WriteSimpleLogFile('PENALITES', ' TRBU_LOTRTG_OET : X7_CrtOpr retourne : "' || vMsg || '"');
--      end if;


--      CLTBTC01.MajCpt(rFACBRD.IdtClt,
--                      rFACBRD.IdtCptClt,
--                      cTypOprChgSitDeb,
--                      rFACBRD.Rfr,
--                      1,
--                      vRfrChgSitCrt,
--                      rFACBRD.Mnt,
--                      sysdate,
--                      sysdate,
--                      sysdate,
--                      rFACBRD.DatCnv,
--                      vIdtAgt,
--                      vIdtSit,
--                      null,
--                      null,
--                      null,
--                      vRfrChgSitDeb,
--                      rFACBRD.IdtDvs);
    end loop;
  end loop;
  -- ** trtmsg01.WriteSimpleLogFile('PENALITES', ' <= TRBU_LOTRTG_OET');
EXCEPTION
WHEN OTHERS THEN
    X7.GEST_ERREUR_CENTURA(71700,
                          71700,
                          'TRBU_LOTRTG_OET',
                          'TRBU_LOTRTG_OET',
                          to_char(SQLERRM),
                          sqlcode,
                          DBMS_UTILITY.FORMAT_ERROR_BACKTRACE);
    Raise;
  
END;
/


