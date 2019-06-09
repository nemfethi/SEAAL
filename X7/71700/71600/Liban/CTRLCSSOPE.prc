CREATE OR REPLACE PROCEDURE X7.Ctrlcssope (
       pIdtClt            VARCHAR2,
       pIdtCptClt         NUMBER ,
       pIdtOpr            VARCHAR2,
       pTypOpr            VARCHAR2,
       pIdtCss            VARCHAR2,
       pMontantPaye       NUMBER ,
       pTypMsg       IN OUT  VARCHAR2,
       pRetFctCtl IN OUT  VARCHAR2)
IS
  TYPE typArrNumber IS TABLE OF NUMBER INDEX BY BINARY_INTEGER;
  TYPE typArrChar IS TABLE OF VARCHAR2(6) INDEX BY BINARY_INTEGER;
  tIdtOpr     typArrNumber;
  tTypOpr     typArrChar;
  vIdtLotRtg  RTG.IdtLotRtg%TYPE;
  vAgtCll     RTG.IDTAGTEXE%TYPE;
  vDatIMp     DATE;
  vDatFinRtg  DATE;
  vOldPos     NUMBER;
  i           NUMBER;
  vRfr        OPR.Rfr%TYPE;
  vIdtTypFct  TYPFCT.IdtTypFct%TYPE;
  vIdtTypOpr  TYPOPR.IdtTypOpr%TYPE;
  vMntFndCss  NUMBER;
  vBrdRgr     OPR.BrdRgr%type;
  vNbrOprNonSelection number;
  vRet        number;
--- *************************************************************************************
-- ***********   Fonction de controle sur l'encaissement                        *********
-- ***********   Fiche: #3221                                                   *********
-- ***********                                                                  *********
-- ***********   Evolution pour le liban (OET)                                  *********
-- ***********                                                                  *********
-- ***********  PARAMETRES:                                                     *********
-- ***********    pIdtClt     : Code client                                     *********
-- ***********    pIdtCptClt  : Compte client                                   *********
-- ***********    pIdtOpr     : Code de l'opération  (liste de codes)           *********
-- ***********    pIdtCss     : Code de la caisse                               *********
-- ***********                                                                  *********
-- ***********    pRetFctCtl : Message d'erreur (parametre obligatoire)         *********
-- ***********                                                                  *********
-- ***********    Retourne NULL dans le parametre pRetFctCtl si la fonction est *********
-- ***********    ok sinon il contient le message de l'erreur a afficher        *********
-- ***********                                                                  *********
-- ***********                                                                  *********
-- ***********  AUTHORS:                                                        *********
-- ***********     Origal Version :  11/08/2004 - JCD                           *********
-- ***********  Modifications                                                   *********
-- ***********  24/04/2004 - FBE                                                *********
-- ***********               Le control 1 ne permet jamais encaisse un facture  *********
-- ***********               parce qu'elle sera toujours imprimee. On change    *********
-- ***********               ce control
-- ***********                                                                  *********
-- ***********  SJ 12 août 2009                                                 *********
-- *********** - adaptation suite au modification produit fiche 7617            *********
-- ***********  SJ 26 sept 2014 - traitement de la fiche 12076: ajouter 2 ctrl: arrodi à 1000 encaissé+séléctionner toutes les opération du brdrgr *********
-- **************************************************************************************
BEGIN
  --------------------------------------------------------------------
    -- Recuperation de la liste des operations passe.
  --------------------------------------------------------------------
--  pRetFctCtl := pIdtOpr || '||||' || pTypOpr;
--  return;

   IF MOD(pMontantPaye, 1000) != 0
      THEN
     pTypMsg := '0';
     pRetFctCtl := 'Le montant encaissé '||to_char(pMontantPaye)||' doit être arrondi!';
     return;
   END IF;

    select count(*)
    into vRet
    from SEUCSSAGN
    where idtagt= user --'SBS'
    and  SEUCSSAGN.SEUCSSMAX <= pMontantPaye;
    if vRet > 0 then
        pTypMsg := '0';
        pRetFctCtl := 'Seuil de caisse dépassé!';
        return;
    END IF;



  i:=0;
  vOldPos := 1;
  LOOP
    i := i+1;
    IF INSTR(pIdtOpr,'|',vOldPos) <> 0 THEN
      tIdtOpr(i) := SUBSTR(pIdtOpr,vOldPos,INSTR(pIdtOpr,'|',vOldPos) - vOldPos);
      vOldPos := INSTR(pIdtOpr,'|',vOldPos)+1;
    ELSE
      tIdtOpr(i) := SUBSTR(pIdtOpr,vOldPos,LENGTH(pIdtOpr) - vOldPos+1);

      EXIT;
    END IF;
  END LOOP;
  --------------------------------------------------------------------
    -- Recuperation de la liste de type des operations passe.
  --------------------------------------------------------------------
  i:=0;
  vOldPos := 1;
  LOOP
    i := i+1;
    IF INSTR(pTypOpr,'|',vOldPos) <> 0 THEN
      tTypOpr(i) := SUBSTR(pTypOpr,vOldPos,INSTR(pTypOpr,'|',vOldPos) - vOldPos);
      vOldPos := INSTR(pTypOpr,'|',vOldPos)+1;
    ELSE
      tTypOpr(i) := SUBSTR(pTypOpr,vOldPos,LENGTH(pTypOpr) - vOldPos+1);
      EXIT;
    END IF;
  END LOOP;
  --------------------------------------------------------------------
    -- Condition pour eviter un plantage "NO_DATA_FOUND" sur l'array count > 0 et le premier element soit not null
  --------------------------------------------------------------------

  IF tIdtOpr.COUNT > 0 AND tTypOpr(1) IS NOT NULL THEN
    FOR i IN 1..tIdtOpr.LAST LOOP
      --------------------------------------------------------------------
      -- Recuperation du type d'operation
      --------------------------------------------------------------------
      SELECT IdtTypOpr
        INTO vIdtTypOpr
        FROM TYPOPR
        WHERE TYPOPR = tTypOpr(i);
      --------------------------------------------------------------------
      -- Recuperation des valeurs dont on a besoin de la table OPR
      --------------------------------------------------------------------
      SELECT OPR.IdtLotRtg, OPR.DatImp, OPR.Rfr, OPR.BrdRgr
        INTO vIdtLotRtg, vDatImp, vRfr, vBrdRgr
        FROM OPR
        WHERE OPR.IdtOpr    = tIdtOpr(i)
         AND  OPR.IdtTypOpr = vIdtTypOpr;
      --------------------------------------------------------------------
      -- Les controles sont faits que pour les factures periodiques. Pour les echeances les seuls control sont
      -- l'impression et l'encaissement sur une caisse hors les caisses des collecteurs.
      -- On va a la fin du loop dans les autres cas
      --------------------------------------------------------------------
      IF vIdtTypOpr IN (1,7) THEN
        vIdtTypFct := NULL;
        --------------------------------------------------------------------
        -- Recherche du type de facture
        --------------------------------------------------------------------
        IF vIdtTypOpr = 1 THEN
          SELECT IdtTypFct
            INTO vIdtTypFct
            FROM FAC
            WHERE NUMFCT = vRfr;
        END IF;

        --SJ 26/09/2014 -- on vérifie que toutes les opérations du brdrgr ont été séléctionnées
        select count(*) into vNbrOprNonSelection from opr where BrdRgr=vBrdRgr and INSTR(pIdtOpr,to_char(idtopr),1)=0 and sld>0;
        IF vNbrOprNonSelection>0 THEN
          pTypMsg := '0';
          pRetFctCtl := 'Véuillez selectionner toutes les opérations du bordereau ' || vBrdRgr;
          RETURN;
        END IF;

        --=============================================================================================================
        -- Control 1: La facture doit etre imprimee avant de l'encaissee
        --=============================================================================================================
        IF vDatImp IS NULL AND NVL(vIdtTypFct,'0') NOT IN (7, 102) THEN
          pTypMsg := '0';
          pRetFctCtl := 'Bill ' || vRfr || ' must be printed before this operation';
          RETURN;
        END IF;

        --------------------------------------------------------------------
        -- S'il ne s'agit pas d'une facture periodique, on ne control plus
        -- On va a la fin du loop
        --------------------------------------------------------------------
        IF NVL(vIdtTypFct,'0') NOT IN ('7', '102') OR vIdtTypOpr = 7 THEN
          --=============================================================================================================
          -- Control 2: Si le lot de routage n'est pas reseingné, on peut encaisser la facture
          --            sur une caisse differente d'une caisse de collecte.
          --=============================================================================================================
          IF vIdtLotRtg IS NULL THEN
            IF pIdtCss LIKE 'CLL%' THEN
              pTypMsg := '0';
              pRetFctCtl := 'This debit is not in distribution lot, you cannot use this cash desk to pay it';
              RETURN;
            END IF;
          END IF;
          --------------------------------------------------------------------
          -- S'il s'agit du paiement d'un echeance on ne fait pas des autres controls
          -- ou si le lot de routage n'est pas reseigne.
          -- On va a la fin du loop sans message d'erreur
          --------------------------------------------------------------------
          IF vIdtTypOpr <> 7 AND vIdtLotRtg IS NOT NULL THEN
            --------------------------------------------------------------------
            -- Recuperation des informations liees au lot de collecte
            --------------------------------------------------------------------
            SELECT SOUSLOTRTG.IdtAgtPrv, LOTRTG.DatFinRtg
              INTO vAgtCll, vDatFinRtg
              FROM SOUSLOTRTG, LOTRTG, RTG
              WHERE LOTRTG.IdtLotRtg         = RTG.IdtLotRtg
               AND  SOUSLOTRTG.IdtLotRtg     = LOTRTG.IdtLotRtg
               AND  SOUSLOTRTG.IdtSousLotRtg = RTG.IdtSousLotRtg
               AND  RTG.IdtOpr               = tIdtOpr(i)
               AND  RTG.IdtLotRtg            = vIdtLotRtg;
            --=============================================================================================================
            -- Control 3: Si le lot de routage es cloture, on peut encaisse la facture
            --            sur une caisse differente d'une caisse de collecte.
            --=============================================================================================================
            IF pIdtCss LIKE 'CLL%' AND vDatFinRtg IS NOT NULL THEN
              pTypMsg := '0';
              pRetFctCtl := 'Bill ' || vRfr || ' is not in distribution lot, you cannot use this cash desk to pay it';
              RETURN;
            END IF;
            --------------------------------------------------------------------
            -- Ici, la facture se trouve dans un lot de collecte
            --------------------------------------------------------------------
            IF vDatFinRtg IS NULL THEN
              --=============================================================================================================
              -- Control 4: L'agent prevu doit etre reseigne, on donne un message d'erreur si ce n'est pas le cas
              --=============================================================================================================
              IF vAgtCll IS NULL THEN
                pTypMsg := '0';
                pRetFctCtl := 'Distribution user is not assigned for the distribution lot';
                RETURN;
              END IF;



              --=============================================================================================================
              -- Control 5: La caisse correspond a celui de l'agent prevu
              --=============================================================================================================
              IF vAgtCll <> pIdtCss THEN
                pTypMsg := '0';
                pRetFctCtl := 'The cash desk is not the good one for bill' || vRfr;
                RETURN;
              END IF;
--  Ajoue le 03/07/08 par CAL et BP pour transférer du trigger TRBU_LOTRTG_OET.
--  paiement de chaque facture.

              -- Maj du fond de caisse
              SELECT MntFndCss INTO vMntFndCss
              FROM FNDCSSAGN
              WHERE IdtAgt = vAgtCll;

              -- On empêche ici le fond de caisse de passer en négatif.
              IF vMntFndCss < pMontantPaye THEN
                vMntFndCss := 0;
              ELSE
                vMntFndCss := vMntFndCss - pMontantPaye;
              END IF;

              UPDATE FNDCSSAGN
               SET MntFndCss = vMntFndCss
              WHERE IdtAgt = vAgtCll;

            END IF; -- vDatFinRtg is not null
          END IF; -- vIdtTypOpr <> 7 or vIdtLotRtg is null
        END IF;  -- nvl(vIdtTypFct,'0') not in ('7', '102') or vIdtTypOpr = 7
      END IF;  -- vIdtTypOpr in (1,7)
    END LOOP;


 ELSE
   IF tTypOpr(1) IS NULL AND pMontantPaye IS NOT NULL THEN
     pTypMsg := '0';
     pRetFctCtl := 'It is not possible to enter only advance!';
     return;
   END IF;
 END IF; -- tIdtOpr.Count > 0
--  pRetFctCtl := 'REUSSI';

EXCEPTION
    WHEN OTHERS THEN
      pTypMsg := '0';
      pRetFctCtl := SQLERRM;
END;
/