CREATE OR REPLACE PACKAGE BODY X7.Trtpen_Oet
IS

-----------------------------------------------------------------------------
-- Maj     : 07/02/2008
-- Par     : SJ
-- Contenu : traitement fiche 6664 - plafond mntpen max = mntfac
-----------------------------------------------------------------------------
-----------------------------------------------------------------------------
-- Maj     : 03/07/2008
-- Par     : SJ
-- Contenu : traitement fiche 6934 - Am�lioration de X7 2.3.1 Arrondi du total de la facture
-----------------------------------------------------------------------------
-----------------------------------------------------------------------------
-- Maj     : 24/09/2009
-- Par     : SJ
-- Contenu : traitement fiche 7692 - Am�lioration de X7 3.4.2 parametre plafond de p�nalit�
-----------------------------------------------------------------------------

-----------------------------------------------------------------------------
-- Maj     : 30/12/2009
-- Par     : SJ
-- Contenu : modification de la fonction pendingpenality pour tenir compte de condition d'application pour le client
-----------------------------------------------------------------------------
--SJ 12 jan 2010 : si pas de contrats ou pas de facture : no datafoud  alors TRTPEN_OET.AplPenxFac(pIdtFac, pDatClc) = 0 donc on fait rien
-----------------------------------------------------------------------------
-- Maj     : 21/07/2010
-- Par     : FBE
-- Contenu : Prise en compte de la gestion des echeanciers avec plusieurs echeances
-----------------------------------------------------------------------------
-- Maj     : 09/11/2010
-- Par     : SBE
-- Contenu : Procedure CreFacTimxOpr : suppression du code qui g�rait l'ajout d'une rubrique de taxe suppl�mentaire
-----------------------------------------------------------------------------
-- Maj     : 10/11/2010
-- Par     : SBE/CAL
-- Contenu : Mise � jour des conditions portants cIdtRbqPen pour prendre en compte
--           les rubrique de p�nalit�s pour le service Irrigation
--           remplacement de IdtRbq = cIdtRbqPen par IdtRbq in (cIdtRbqPen, cIdtRbqPenIrr)
-----------------------------------------------------------------------------
-- Maj     : 06/06/2018
-- Par     : SJ 
-- Contenu : Traitement de la fiche 15590 : adaptation suite � l'ajoute des colonnes ctrfac.mntht, ctrfac.mnttva
--         + ajouter la version du package
-----------------------------------------------------------------------------

  gClcPenHt NUMBER;
  gClcPenTva NUMBER;


gDiscountPen OET_PENDIS.DISCOUNT%TYPE := -1;
gPlafondPen  NUMBER := 999999999;

--
--Variables globales para el manejo de errores
--Se genera una excepci?n "when others" que llama al
--Procedimiento trtmsg01.msgerr.
--Los parametros de entrada son:
--
  Err_IdtPck    VARCHAR2(40) := 'TRTPEN_OET';
  Err_IdtTrt    VARCHAR2(40);
  Err_Msg       VARCHAR2(255):= NULL;
  Err_IdtClt    VARCHAR2(6)  := NULL;
  Err_IdtCtr    VARCHAR2(8)  := NULL;
  Err_IdtCpr    NUMBER(8)    := NULL;
  Err_NumCpr    VARCHAR2(12) := NULL;
  Err_IdtFac    NUMBER(15)   := NULL;
  Err_NumFac    VARCHAR2(12) := NULL;
  Err_IdtOprDbt NUMBER(10)   := NULL;
  Err_IdtOprCrt NUMBER(10)   := NULL;
  Err_TableName Trtmsg01.TableType := Trtmsg01.MakeTable;
-----------------------------------------------------------------------------
-----------------------------------------------------------------------------
-----------------------------------------------------------------------------
-- Chargement des parametres concernant les calculs de penalites.
-- Permet de savoir si ce module est actif. On peut regler ici les deux
-- premieres variables pour savoir si on active le calcul pour les montants
-- HT ou/et de la taxe.
PROCEDURE ChgPrm IS
BEGIN
  gClcPenHt := 1;
  gClcPenTva := 0;
  SELECT NVL(PnlPmt,0)
    INTO gClcPenAct
    FROM PRMGNR;
END ChgPrm;

-----------------------------------------------------------------------------
-- Fonction retournant l'agent X7 courant.
-----------------------------------------------------------------------------
FUNCTION CurrentIdtAgt
RETURN
    AGT.IDTAGT%TYPE
IS
    vIdtAgt AGT.IDTAGT%TYPE;
BEGIN
  SELECT
    IdtAgt
    INTO vIdtAgt
  FROM AGT
    WHERE NomCnx = USER;

    RETURN vIdtAgt;

EXCEPTION WHEN NO_DATA_FOUND
    THEN
        -- Agent X7 non trouv�, tant pis, on retourne 'X7' � la place
        -- Un nom de cnx Oracle peut etre trop grand
        -- un nom de cnx Oracle peut g�n�rer une erreur de contrainte sur AGT.IDTAGT
        RETURN 'X7';

END;


-----------------------------------------------------------------------------
-- Fonction permettant de connaitre le taux de discount sur les p�nalit�s.
-----------------------------------------------------------------------------
FUNCTION GetDiscountPen (
    pDatDbtPrd CTRFAC.DatDbtPrd%TYPE,
    pDatFinPrd CTRFAC.DatFinPrd%TYPE,
    pId OET_PENDIS.ID%TYPE)
RETURN OET_PENDIS.DISCOUNT%TYPE
IS
--  vDiscountPen OET_PENDIS.DISCOUNT%TYPE;
BEGIN

-- JCD le 24/09/2006, on ne peut plus faire le test pour gagner en rapidit�...
--  if (gDiscountPen = -1) then
--    -- C'est notre premier passage ici... Il faut donc effectivement
--    -- rechercher l'�ventuel discount sur les p�nalit�s...
-- -- ** trtmsg01.WriteSimpleLogFile('PENALITES', 'Recherche du discount sur les p�nalit�s');
--
 -- SJ 23 nov 2009: si la facture ne concerne pas l'ann�e en cours
 -- if to_char(trunc(pDatDbtPrd,'yyyy'),'yyyy')  != to_char(trunc(sysdate,'yyyy'),'yyyy') then
 -- finalement on ne fait ce test JLD + SB
   BEGIN

-- On verifie que la periode de facturation soit bien incluse dans celle d�termin�e
-- On ajoute dans le select les conditions suivantes
-- pDatDbtPrd >= datdbtprdfac
-- pDatFinPrd <= datfinprdfac
      SELECT (1 - Discount)
        INTO gDiscountPen
        FROM OET_PENDIS
        WHERE (TRUNC(SYSDATE) BETWEEN TRUNC(datdbt)
                AND NVL(TRUNC(datfin), TO_DATE('31-12-2099', 'DD-MM-YYYY')))
              AND
              ( TRUNC(pDatDbtPrd) >= TRUNC(datdbtprdfac)
                AND TRUNC(pDatFinPrd) <= TRUNC(datfinprdfac))
              AND pId = ID ;

    EXCEPTION

        WHEN NO_DATA_FOUND THEN
          -- Si on ne trouve rien, alors, on doit appliquer 100% de la p�nalit�s.
          gDiscountPen := 1;
          ---- ** trtmsg01.WriteSimpleLogFile('PENALITES', 'Discount non trouv�');

    END;

 -- else
  -- si la facture concerne l'ann�e en cours on doit appliquer 100% de la p�nalit�s.
--   gDiscountPen := 1;
--  end if;

--    -- ** trtmsg01.WriteSimpleLogFile('PENALITES', 'Discount = ' || to_char(gDiscountPen));
--  end if;

 IF gDiscountPen IS NULL THEN  gDiscountPen := 1; END IF;

 RETURN(gDiscountPen);

END;

-----------------------------------------------------------------------------
-- Fonction permettant de connaitre le plafond sur les p�nalit�s.
-----------------------------------------------------------------------------
FUNCTION GetPlafondPen    (
  pDatDbtPrd CTRFAC.DatDbtPrd%TYPE,
    pDatFinPrd CTRFAC.DatFinPrd%TYPE,
    pId OET_PENDIS.ID%TYPE)
RETURN NUMBER
IS
BEGIN

  -- On essaye d'abord de chercher un plafond associ� au code de discount
  BEGIN
    SELECT Plafond INTO gPlafondPen
      FROM OET_PENDIS
      WHERE (TRUNC(SYSDATE) BETWEEN TRUNC(datdbt)
              AND NVL(TRUNC(datfin), TO_DATE('31-12-2099', 'DD-MM-YYYY')))
            AND
            ( TRUNC(pDatDbtPrd) >= TRUNC(datdbtprdfac)
              AND TRUNC(pDatFinPrd) <= TRUNC(datfinprdfac))
            AND ID = pId;
     EXCEPTION

    WHEN NO_DATA_FOUND THEN
      gPlafondPen := 999999999;

  END;

  -- Ensuite, si on n'a rien trouv� ci-dessus, on cherche le plafond par d�faut (ID = 0)
  IF gPlafondPen = 999999999 THEN
       BEGIN
         SELECT Plafond INTO gPlafondPen
           FROM OET_PENDIS
           WHERE ID = 0;
    EXCEPTION

         WHEN NO_DATA_FOUND THEN
           gPlafondPen := 999999999;

       END;
  END IF;

     IF gPlafondPen IS NULL THEN  gPlafondPen := 999999999;   END IF;

  -- -- ** trtmsg01.WriteSimpleLogFile('PENALITES', 'gPlafondPen = ' || to_char(gPlafondPen));
  RETURN(gPlafondPen);

END;
-----------------------------------------------------------------------------
-----------------------------------------------------------------------------
-- Indique si l'OPR est dans un lot de routage actif (non clotur�) de
-- type IdtTypRtg.
FUNCTION OprDansLotRtgAct(pIdtOpr OPR.IdtOpr%TYPE, pIdtTypRtg TYPRTG.IdtTypRtg%TYPE)
  RETURN NUMBER IS
  vNbr NUMBER := 0;
BEGIN
  SELECT COUNT(*)
    INTO vNbr
    FROM LOTRTG, RTG
    WHERE LOTRTG.IdtLotRtg  = RTG.IdtLotRtg
     AND  LOTRTG.DatFinRtg IS NULL
     AND  RTG.IdtCodObsRtg IS NULL
     AND  RTG.IdtTypRtg     = NVL(pIdtTypRtg,RTG.IdtTypRtg)
     AND  RTG.IdtOpr        = pIdtOpr;
  IF vNbr > 0 THEN
    vNbr := 1;
  END IF;
  RETURN vNbr;
END OprDansLotRtgAct;
-----------------------------------------------------------------------------
-----------------------------------------------------------------------------
-----------------------------------------------------------------------------
-- Prix de Timbre
FUNCTION PrxTim
  RETURN NUMBER
IS
  vIdtPrx PRX.IdtPrx%TYPE;
  vPrxUnt PRX.PrxUnt%TYPE;
  vDatPrx DATE;
  vDatFin DATE;
BEGIN
  -- trtmsg01.InsertItem(Err_TableName,'PRXPEN');
  ---------------------------------------------------------------------------
  Err_Msg := 'Recherche du prix valide � la date du jour';
  ---------------------------------------------------------------------------
  SELECT PrxUnt
    INTO vPrxUnt
    FROM RBQ, TRCPRX, PRXENT
    WHERE TRCPRX.IdtPrx = PRXENT.IdtPrx
     AND  RBQ.IdtRbq    = PRXENT.IdtRbq
     -- SBE/JCD - 18/02/2011 : inscription "en dur" de la rubrique TIMBRE
     -- sinon cela n�cessite de mettre en param�tre IdtSrv dans la fonction PrxTim 
     AND RBQ.IdtRbq = 'TIMBRE'
     --AND  RBQ.IdtTypRbr = cTypRbrTim
     AND  TRCPRX.DatFinVld IS NULL;
  RETURN vPrxUnt;
  -- trtmsg01.DeleteItem(Err_TableName);
END PrxTim;
-----------------------------------------------------------------------------
-----------------------------------------------------------------------------
-----------------------------------------------------------------------------
-- Retourne le montant du Timbre migre
FUNCTION MntTimFacMgr (pIdtFac FAC.IdtFac%TYPE)
  RETURN NUMBER IS
  vMntTim OPR.Mnt%TYPE;
BEGIN
  SELECT NVL(SUM(NVL(MntHt,0)+NVL(MntTva,0)),0)
    INTO vMntTim
    FROM RBQ, LGNFAC
    WHERE RBQ.IdtRbq    = LGNFAC.IdtRbq
     AND  RBQ.IdtTypRbr = cTypRbrTim
     AND  LGNFAC.IdtFac = pIdtFac;
  RETURN NVL(vMntTim,0);
END MntTimFacMgr;
-----------------------------------------------------------------------------
-----------------------------------------------------------------------------
-----------------------------------------------------------------------------
-- Retourne le montant de timbre facture par facture.
-- pour la gestion des �ch�ances...
FUNCTION MntTimFacxFac (pIdtFac FAC.IdtFac%TYPE)
  RETURN NUMBER IS
  vMntTim OPR.Sld%TYPE;
BEGIN
  -- Nouveau code de CAL - 07/12/2003
  SELECT SUM(NVL(LGNFAC.MntHT, 0))
    INTO vMntTim
  FROM LGNFAC, FAC AllFac, FAC FacOrg
  WHERE LGNFAC.IdtFac = AllFac.IdtFac
    AND AllFac.NUMFCT <> '1'
    AND AllFac.FctAnn = 0
--    and AllFac.IdtTypFct in (cTypFctPen, cTypFctTim)
    AND LGNFAC.IdtRbq = cIdtRbqTim
    AND AllFac.brdrgr = FacOrg.NUMFCT
    AND FacOrg.IdtFac =  pIdtFac;
  RETURN NVL(vMntTim,0);
END ;
-----------------------------------------------------------------------------
-----------------------------------------------------------------------------
-----------------------------------------------------------------------------
-- Retourne le montant du Timbre deja calcule pour une operation
-- (sauf pour le timbre sur la facture de migration)
FUNCTION MntTimFacxOpr (pIdtOpr OPR.IdtOpr%TYPE)
  RETURN NUMBER IS
  vMntTim OPR.Mnt%TYPE;
  vBrdRgr OPR.BrdRgr%TYPE;
  vIdtTypOpr TYPOPR.IdtTypOpr%TYPE;
  vDatVlr OPR.DATVLR%TYPE;
BEGIN
  SELECT BrdRgr, IdtTypOpr, DatVlr
    INTO vBrdRgr, vIdtTypOpr, vDatVlr
    FROM OPR
    WHERE IdtOpr = pIdtOpr;
  IF vBrdRgr IS NULL THEN
    RETURN 0;
  END IF;
  IF vIdtTypOpr NOT IN (1,7) THEN
    RETURN 0;
  END IF;
  -- Pour ce qui reste, avant d'aller voir la grosse jointure qui suit,
  -- on regarde d'abord la date de valeur de l'OPR.
  -- Les operations de type 1 et 7 migr�es ne peuvent �tre dat�e
  -- apr�s le 1er octobre 2003. Ceci permet de refaire le test
  -- des factures migr�es ou non, pr�vu initialement avec le n� de bordereau :
  -- dans les spec. initiales de la migration, les factures migr�es n'avaient
  -- pas de boredeau. Il �tait donc facile de les distinguer. Ce n'est plus
  -- le cas maintenant... On teste donc la date de l'OPR � la place...
  -- SJ 19/02/2010 Depuis la migration BAKAYA la r�gle ci-dessus n'est plus valable (confirm JLD)
  -- donc, comme les factures migr�es bakaya n'ont pas le timbre inclus dans leurs lignes de facture
  -- il faut mettre le "if" suivante en commentaire
  --IF vDatVlr < TO_DATE('01/10/2003', 'DD/MM/YYYY') THEN
  --  RETURN 0;
  --END IF;
  --end SJ 19/02/2010
  SELECT NVL(SUM(NVL(LGNFAC.MntHt,0)+NVL(LGNFAC.MntTva,0)),0)
    INTO vMntTim
    FROM RBQ, LGNFAC, FAC, OPR
    WHERE FAC.NUMFCT    = OPR.Rfr
     AND  LGNFAC.IdtFac = FAC.IdtFac
     AND  RBQ.IdtRbq    = LGNFAC.IdtRbq
     AND  RBQ.IdtTypRbr = cTypRbrTim
     AND  FAC.IdtTypFct = cTypFctTim
     AND  FAC.FctAnn    = 0
     AND  OPR.BrdRgr    = vBrdRgr
     AND  OPR.IdtTypOpr = 1;
  RETURN NVL(vMntTim,0);
EXCEPTION
  WHEN NO_DATA_FOUND THEN
    RETURN 0;
END MntTimFacxOpr;
-----------------------------------------------------------------------------
-----------------------------------------------------------------------------
-----------------------------------------------------------------------------
-- Indique si on doit calculer frais de timbre pour un client donn�
FUNCTION AplTimxClt(pIdtClt CLT.IdtClt%TYPE)
  RETURN NUMBER IS
  vIdtCodSns CLT.IdtCodSns%TYPE;
BEGIN
  SELECT IdtCodSns
    INTO vIdtCodSns
    FROM CLT
    WHERE IdtClt = pIdtClt;
  IF vIdtCodSns = 'A' THEN
    RETURN 0;
  ELSE
    RETURN 1;
  END IF;
END AplTimxClt;
-----------------------------------------------------------------------------
-----------------------------------------------------------------------------
-----------------------------------------------------------------------------
-- Indique si on doit appliquer le timbre � une op�ration
-- Modif CAL 20/10/2003
--  LA fonction retourne le montant de timbre � appliquer si n�cessaire
--  au lieu de 1 simplement.
FUNCTION AplTimxOpr (pIdtOpr OPR.IdtOpr%TYPE)
  RETURN NUMBER IS
  vIdtTypOpr OPR.IdtTypOpr%TYPE;
  vRfrOpr OPR.Rfr%TYPE;
  vIdtFac FAC.IdtFac%TYPE;
  vMnt OPR.Mnt%TYPE;
  vSld OPR.Sld%TYPE;
  vBrdRgr OPR.BrdRgr%TYPE;
  vPrxTim TRCPRX.PrxUnt%TYPE;
  vFctAnn FAC.FctAnn%TYPE;
  vIdtClt CLT.IdtClt%TYPE;
  vIdtTypFct FAC.IdtTypFct%TYPE;
  vMntTimFacxFac NUMBER;
  vMntTimFacxOpr OPR.Mnt%TYPE;   --- Pour stocker les valeurs de retour...
  vMntTimFacMgr OPR.Mnt%TYPE;
BEGIN
  SELECT IdtTypOpr, Rfr, Mnt, Sld, BrdRgr, IdtClt
    INTO vIdtTypOpr, vRfrOpr, vMnt, vSld, vBrdRgr, vIdtClt
    FROM OPR
    WHERE IdtOpr = pIdtOpr;
  -- Ceci ne sert que pour les factures et �chances...
  IF vIdtTypOpr NOT IN (1,7) THEN
    RETURN 0;
  END IF;
  -- Il faut un montant non null sinon il n'y a pas de paiement
  -- donc pas de timbre...
  IF vMnt = 0 THEN
    RETURN 0;
  END IF;
  -- Il faut que ce type de client ait des timbre � payer (pas les administrations par exemple).
  IF AplTimxClt(vIdtClt) = 0 THEN
    RETURN 0;
  END IF;
  vPrxTim := PrxTim();
  -- Ceci indique, pour les �ch�ances comme pour les factures,
  -- qu'une facture de timbre existe d�j� pour l'OPR en direct.
  -- Pour les �ch�anciers, cette fonction ne d�tecte pas un
  -- �ventuel timbre dans la facture concern�e par l'�ch�ancier.
  vMntTimFacxOpr := MntTimFacxOpr(pIdtOpr);
  IF vIdtTypOpr = 7 THEN
    -- On ne calcule pas de timbre pour la 1ere �ch�ance...
    -- Ici les �ch�ances sont toujours sur des factures, par cons�quent il y a toujours un timbre
    -- d�j� pris en compte. On le solde sur la premi�re �ch�ance...
    ----------------
    -- NON !!! Modif CAL 09/2005
    -- On va regarder si on a effectivement un timbre dans la facture
    -- si il est absent, alors il faudra l'ajouter...
    ----------------
    -- Ceci donne le n� d'�ch�ance X � partir de RFR = 'NNNNNN-X'
    -- FBE 21/07/2010: On calcule le timbre pour tous les echeances
    --                 Le montant du timbre doit etre exclu des factures migres,
    --                 donc, on ne cherche pas si le timbre est inclus dans la facture.
    --                 Mise en commentaire des lignes suivantes
--    IF TO_NUMBER(SUBSTR(vRfrOpr, INSTR(vRfrOpr, '-')+1)) = 1 THEN
--      -- Sur la 1ere �ch�ance, il faut voir si on a un timbre inclus...
--      BEGIN
--        SELECT Trtpen_Oet.MntTimFacxFac(IDTFAC)
--          INTO vMntTimFacxFac
--        FROM X7_INSTALLMENT_OET
--        WHERE X7_INSTALLMENT_OET.IDTOPR = pIdtOpr;
--      --exception
--      --  when no_data_found then
--      --    return 0;
--      END;
--
--      -- On retourne le montant de timbre � ajouter :
--      -- Prix du timbre aujourd'hui
--      --        - prix du timbre trouv� sur la facture
--      --        - prix du timbre attach� � l'OPR.
--      -- En tout cas cela ne doit jamais etre n�gatif...
--
--      RETURN GREATEST(vPrxTim - (vMntTimFacxFac + vMntTimFacxOpr), 0);
--    END IF;
--
    -- QUE SE PASSE-T-IL SI vMNT <> vSLD ????????????????
    IF vMnt = vSld AND vMntTimFacxOpr >= vPrxTim THEN
      RETURN 0;
    ELSE
      -- Au lieu de retourner 1, on peut retourner directement la valeur � appliquer.
      -- Petite s�curit� avec greatest(), sans doute inutile, mais j'aime bien le blindage...
      RETURN GREATEST(vPrxTim - vMntTimFacxOpr, 0);
    END IF;
  END IF;
  IF vIdtTypOpr = 1 THEN
    SELECT IdtFac, FctAnn, IdtTypFct
      INTO vIdtFac, vFctAnn, vIdtTypFct
      FROM FAC
      WHERE NUMFCT = vRfrOpr;
    IF vFctAnn <> 0 THEN
      RETURN 0;
    END IF;
    -- Pas de calcul de timbre s'il s'agit d'une facture de p�nalit� ou de ... timbre !
    -- CAL - 28/11/2003
    IF vIdtTypFct IN ('102', '7') THEN
      RETURN 0;
    END IF;
    vMntTimFacMgr := MntTimFacMgr(vIdtFac);
    -- QUE SE PASSE-T-IL SI vMNT <> vSLD ????????????????
    IF vMnt = vSld AND (vMntTimFacMgr + vMntTimFacxOpr) >= vPrxTim THEN
      RETURN 0;
    ELSE
      -- Au lieu de retourner 1, on peut retourner directement la valeur � appliquer.
      -- Petite s�curit� avec greatest(), sans doute inutile, mais j'aime bien le blindage...
      RETURN GREATEST(vPrxTim - (vMntTimFacMgr + vMntTimFacxOpr), 0);
    END IF;
  END IF;
  -- QUE FAIRE DU RETURN ICI ??? NORMALEMENT ON NE PASSE JAMAIS ICI...
  RAISE_APPLICATION_ERROR(-20002, 'AplTimxOpr: Cannot evaluate stamp amount');
  RETURN 1;
END AplTimxOpr;

-----------------------------------------------------------------------------
-- Cette proc�dure cr�e la facture de timbre si elle est n�cessaire (il
-- faut que le montant de timbre � appliquer soit non nul.
-- Modif CAL - 07/12/2003
-----------------------------------------------------------------------------
-- Maj     : 09/11/2010
-- Par     : SBE
-- Contenu : suppression du code qui g�rait l'ajout d'une rubrique de taxe suppl�mentaire
-----------------------------------------------------------------------------

PROCEDURE CreFacTimxOpr (pIdtOpr          OPR.IdtOpr%TYPE,
                         pIdtFacOrg       FAC.IdtFac%TYPE,
                         pIdtLotRtg       OPR.IdtLotRtg%TYPE,
                         pIdtLotFac       FAC.IdtLotFac%TYPE,
                         pIdtFacTim   OUT FAC.IdtFac%TYPE)
IS
   vPrxTim            TRCPRX.PrxUnt%TYPE;
   vIdtFac            FAC.IdtFac%TYPE;
   vIdtTypOpr         TYPOPR.IdtTypOpr%TYPE;
   vMnt               OPR.Mnt%TYPE;
   vSld               OPR.Sld%TYPE;
   vBrdRgr            OPR.BrdRgr%TYPE;
   vRfr               OPR.Rfr%TYPE;
   vIdtLotRtg         OPR.IdtLotRtg%TYPE;
   vIdtClt            CLT.IdtClt%TYPE;
   vIdtDvs            CPTCLT.IdtDvs%TYPE;
   vDatTauCnv         TXCNV.DatTauCnv%TYPE;
   vIdtCtgClt         CLT.IdtCtgClt%TYPE;
   vIdtCntOpr         CLT.IdtCntOpr%TYPE;
   vIdtCodSns         CLT.IdtCodSns%TYPE;
   vIdtCtr            CTR.IdtCtr%TYPE;
   vMntTimHt          MVMEXCFCT.MntHt%TYPE;            -- Montant du timbre HT
   vMntTimTva         MVMEXCFCT.MntTva%TYPE;          -- Montant du timbre TVA
   vMntHt             MVMEXCFCT.MntHt%TYPE; -- Montant total HT de cette facture de Timbre (et arrondi)
   vMntTva            MVMEXCFCT.MntTva%TYPE; -- Montant total TVA de cette facture de Timbre (et arrondi)
   vQteFct            MVMEXCFCT.QteFct%TYPE;
   vDatDbt            MVMEXCFCT.DatDbt%TYPE;
   vDatFin            MVMEXCFCT.DatFin%TYPE;
   vUntMsr            MVMEXCFCT.UNTMSR%TYPE;
   vNumLgnFct         LGNFAC.NumLgnFct%TYPE;
   vDatDbtPrd         CTRFAC.DatDbtPrd%TYPE;
   vDatFinPrd         CTRFAC.DatFinPrd%TYPE;
   vMntTotBrdRgrArr   OPR.MNT%TYPE;
BEGIN
   -- SBE - 09/11/2010 : suppression du code qui g�rait l'ajout d'une rubrique de taxe suppl�mentaire

   -- ** trtmsg01.WriteSimpleLogFile('PENALITES',' => CreFacTimxOpr(' || pIdtOpr || ', ' || to_char(pIdtFacOrg) || ', ' || pIdtLotRtg || ')');
   -- On r�cup�re quelques donn�es sur l'op�ration...
   SELECT   IdtTypOpr,
            Mnt,
            Sld,
            BrdRgr,
            Rfr,
            IdtClt,
            IdtLotRtg
     INTO   vIdtTypOpr,
            vMnt,
            vSld,
            vBrdRgr,
            vRfr,
            vIdtClt,
            vIdtLotRtg
     FROM   OPR
    WHERE   IdtOpr = pIdtOpr;

   -- On r�cup�re le montant de timbre � appliquer.
   -- AplTimxOpr() retourne maintenant le montant du timbre. On n'a plus besoin
   -- relancer tout le calcul ici...
   vMntTimHt := AplTimxOpr (pIdtOpr);
   vMntTimTva := 0;

   -- La cr�ation de la facture a lieu d�s que nous avons un de ces montants � g�rer...
   -- SJ 04/11/2009 - cr�ation facture timbre si il y a un arr � gerer
   -- CAL 23/11/2009 : Usage de la fonction cr��e pour cela.
   -- JLD 23/12/2009 : Ne pas prendre en compte les factures annul�es du bordereau
   -- SJ 28/12/2009: Ne pas prendre en compte les factures d'annulation du bordereau
   -- FBE : 21/07/2010: on ajout la requete pour OPR dans le cas des echeances.
   -- SBE : 02/12/2010 : modification de la condition de calcul de l'arrondi pour les �ch�ances (Brdrgr au lieu de Rfr)
   
   IF vIdtTypOpr = 1
   THEN
      SELECT   CalculArrondi1000( SUM (NVL (mntht, 0) + NVL (mnttva, 0)) )
        INTO   vMntTotBrdRgrArr
        FROM   FAC
       WHERE   brdrgr = vRfr AND fctann != 1 AND idttypfct != '2';
   ELSIF vIdtTypOpr = 7
   THEN
      -- Alimentation du champ BrdRgr de l'�ch�ance
      -- SBE : ca doit se faire avant le calcul de l'arrondi, sinon on obtient 0
      UPDATE OPR
         SET BrdRgr = Rfr
       WHERE IdtOpr = pIdtOpr;
       
      COMMIT;
       
      SELECT   CalculArrondi1000 ( SUM (NVL (mnt, 0)) )
        INTO   vMntTotBrdRgrArr
        FROM   OPR
       WHERE   brdrgr = vRfr AND Anl = 0 and idttypopr in (1,7);

   END IF;


   IF vMntTimHt > 0 OR vMntTimTva > 0 OR vMntTotBrdRgrArr <> 0
   THEN
      -- Init des montants totaux de la facture :
      vMntHt := vMntTimHt + vMntTotBrdRgrArr;
      vMntTva := vMntTimTva;

      -- JLD - 04/12/2010 - Arrondi TVA
      IF vMntTva != TRUNC (vMntTva)
      THEN
         vMntTva := TRUNC (vMntTva);
      END IF;

      -----------------------------------------------------------------------
      Err_Msg := 'On efface des anciennes factures de timbre non valid�es';

      -----------------------------------------------------------------------
      DELETE   LGNFAC
       WHERE   IdtFac IN
                     (SELECT   IdtFac
                        FROM   FAC
                       WHERE       BrdRgr = vBrdRgr
                               AND NUMFCT = '1'
                               AND IdtTypFct = cTypFctTim);

      DELETE   CTRFAC
       WHERE   IdtFac IN
                     (SELECT   IdtFac
                        FROM   FAC
                       WHERE       BrdRgr = vBrdRgr
                               AND NUMFCT = '1'
                               AND IdtTypFct = cTypFctTim);

      DELETE   FAC
       WHERE   BrdRgr = vBrdRgr AND NUMFCT = '1' AND IdtTypFct = cTypFctTim;

      -----------------------------------------------------------------------
      Err_Msg := 'Attribution du num�ro de facture';

      -----------------------------------------------------------------------
      SELECT   numfac.NEXTVAL INTO pIdtFacTim FROM DUAL;

      -- ** trtmsg01.WriteSimpleLogFile('PENALITES',' CreFacTimxOpr : pIdtFacTim = ' || to_char(pIdtFacTim));

      -----------------------------------------------------------------------
      Err_Msg := 'Recherche du code devise';

      -----------------------------------------------------------------------
      SELECT   idtdvs
        INTO   vIdtDvs
        FROM   CPTCLT
       WHERE   IdtClt = vIdtClt AND IdtCptClt = 1;

      -----------------------------------------------------------------------
      Err_Msg := 'Recherche du taux de conversion de la devise';

      -----------------------------------------------------------------------
      SELECT   MAX (TRUNC (dattaucnv))
        INTO   vDatTauCnv
        FROM   TXCNV
       WHERE   IdtDvs = vIdtDvs AND TRUNC (DatTauCnv) <= TRUNC (SYSDATE);

      -----------------------------------------------------------------------
      Err_Msg :=
         'Recherche du cat�gorie Client, centre op�rationnel, Code sensibilit�';

      -----------------------------------------------------------------------
      SELECT   IdtCtgClt, IdtCntOpr, IdtCodSns
        INTO   vIdtCtgClt, vIdtCntOpr, vIdtCodSns
        FROM   CLT
       WHERE   IdtClt = vIdtClt;


      -----------------------------------------------------------------------
      Err_Msg := 'Insertion dans la table FAC';
      -----------------------------------------------------------------------
      INSERT INTO FAC (IDTFAC,
                       NUMFCT,
                       IDTCLT,
                       IDTTYPFCT,
                       DATCLC,
                       DATCNV,
                       DATEXG,
                       CATCLT,
                       IDTDVS,
                       MNTHT,
                       MNTTVA,
                       IDTCODSNS,
                       IDTCNTOPR,
                       CODVLD,
                       FCTANN,
                       IDTLOTFAC,
                       BrdRgr)
        VALUES   (pIdtFacTim,
                  '1',
                  vIdtClt,
                  cTypFctTim,
                  TRUNC (SYSDATE),
                  vDatTauCnv,
                  TRUNC (SYSDATE),
                  vIdtCtgClt,
                  vIdtDvs,
                  -- Modif CAL - 13/09/2005 - Pb dans la compta si valeur NULL.
                  NVL (vMntHt, 0),
                  NVL (vMntTva, 0),
                  vIdtCodSns,
                  vIdtCntOpr,
                  1,
                  0,
                  pIdtLotFac,
                  vRfr);

      -----------------------------------------------------------------------
      -- Insertion des lignes de factures : TIMBRE et ARRONDI
      -----------------------------------------------------------------------

      -- Initialisation du compteur de lignes de factures
      vNumLgnFct := 0;

      IF vMntTotBrdRgrArr != 0
      THEN
         -----------------------------------------------------------------------
         Err_Msg := 'Insertion de l arrondi dans la table LGNFAC';
         -----------------------------------------------------------------------

         -- ** trtmsg01.WriteSimpleLogFile('PENALITES',' CreFacTimxOpr : Insertion de l''arrondi');

         -- on insert la ligne d'arrondi
         vNumLgnFct := vNumLgnFct + 1;

         INSERT INTO LGNFAC (IDTFAC,
                             NUMLGNFCT,
                             IDTRBQ,
                             QTEFCT,
                             PRXUNT,
                             DATDBTPRD,
                             DATFINPRD,
                             MNTHT,
                             MNTTVA,
                             UNTMSR,
                             IDTMVMEXCFCT,
                             IDTFACORG,
                             MNTBAS)
           VALUES   (pIdtFacTim,
                     vNumLgnFct,
                     'ARROND',
                     vMntTotBrdRgrArr,
                     1,
                     SYSDATE,
                     SYSDATE,
                     vMntTotBrdRgrArr,
                     0,
                     vIdtDvs,
                     NULL,
                     vIdtFac,
                     NULL);
      END IF;


      IF vMntTimHt > 0 OR vMntTimTva > 0
      THEN
         -----------------------------------------------------------------------
         Err_Msg := 'Insertion du timbre dans la table LGNFAC';
         -----------------------------------------------------------------------

         -- ** trtmsg01.WriteSimpleLogFile('PENALITES',' CreFacTimxOpr : Insertion du timbre');

         vNumLgnFct := vNumLgnFct + 1;

         INSERT INTO LGNFAC (IDTFAC,
                             NUMLGNFCT,
                             IDTRBQ,
                             QTEFCT,
                             PRXUNT,
                             DATDBTPRD,
                             DATFINPRD,
                             MNTHT,
                             MNTTVA,
                             UNTMSR,
                             IDTMVMEXCFCT,
                             IDTFACORG,
                             MNTBAS)
           VALUES   (pIdtFacTim,
                     vNumLgnFct,
                     cIdtRbqTim,
                     1,
                     vMntTimHt,
                     SYSDATE,
                     SYSDATE,
                     -- Modif CAL - 13/09/2005 - Pb dans la compta si valeur NULL.
                     NVL (vMntTimHt, 0),
                     NVL (vMntTimTva, 0),
                     vUntMsr,
                     NULL,
                     vIdtFac,
                     NULL);
      END IF;

      IF vIdtTypOpr = 1
      THEN
         -- On ne fait ceci que pour les factures, pas pour les �ch�ances...
         -----------------------------------------------------------------------
         Err_Msg := 'Ajout de la facture dans CTRFAC';
         -----------------------------------------------------------------------
         CreCtrFac (pIdtFacOrg, pIdtFacTim);
      END IF;
   END IF;
-- ** trtmsg01.WriteSimpleLogFile('PENALITES',' <= CreFacTimxOpr()');
END CreFacTimxOpr;

-----------------------------------------------------------------------------
-----------------------------------------------------------------------------
-----------------------------------------------------------------------------
-- Insert un(des) mouvements exceptionnels � partir de la table temp. de
-- calcul CLCPEN.
PROCEDURE InsMvmExcFct (rMVMEXCFCT MVMEXCFCT%ROWTYPE)
IS
BEGIN
  Trtmsg01.InsertItem(Err_TableName,'INSMVMEXCFCT');
  ---------------------------------------------------------------------------
  Err_Msg := 'Insert into MVMEXCFCT';
  ---------------------------------------------------------------------------
  -- ** trtmsg01.WriteSimpleLogFile('PENALITES', 'InsMvmExcFct : Insert into MVMEXCFCT ...');

  INSERT INTO MVMEXCFCT (IDTCTRDST,
                         IDTCTRRCP,
                         IDTRBQ,
                         QTEFCT,
                         PRXUNT,
                         DATDBT,
                         DATFIN,
                         MNTHT,
                         MNTTVA,
                         IDTTAX,
                         UNTMSR,
                         IDTCLT,
                         DATCRT,
                         IDTAGTCRT,
                         MNTBAS,
                         IDTFACORG)
    SELECT rMVMEXCFCT.IdtCtrDst,
           rMVMEXCFCT.IdtCtrRcp,
           CLCPEN.IdtRbq,
           QteFct,
           PrxUnt,
           TO_DATE(DatDbt,'J'),
           TO_DATE(DatFin,'J'),
           SUM(MntHt),
           SUM(NVL(MntHt * TAX.TAU / 100, 0)),
           TAX.IdtTax,
           UNTMSR,
           rMVMEXCFCT.IdtClt,
           rMVMEXCFCT.DatCrt,
           rMVMEXCFCT.IdtAgtCrt,
           SUM(MntBas),
           rMVMEXCFCT.IdtFacOrg
      FROM TAX, RBQ, CLCPEN
      WHERE IdtAgt = rMVMEXCFCT.IdtAgtCrt
        AND CLCPEN.IdtRbq = RBQ.IdtRbq
        AND RBQ.IdtTax = TAX.IdtTax (+)
        AND CLCPEN.mntht !=0
      GROUP BY rMVMEXCFCT.IdtCtrDst,
               rMVMEXCFCT.IdtCtrRcp,
               CLCPEN.IdtRbq,
               QteFct,
               PrxUnt,
               TO_DATE(DatDbt,'J'),
               TO_DATE(DatFin,'J'),
               TAX.IdtTax,
               UNTMSR,
               rMVMEXCFCT.IdtClt,
               rMVMEXCFCT.DatCrt,
               rMVMEXCFCT.IdtAgtCrt,
               rMVMEXCFCT.IdtFacOrg;
  ---------------------------------------------------------------------------
  Err_Msg := 'delete from CLCPEN';
  ---------------------------------------------------------------------------
  DELETE CLCPEN
    WHERE IdtAgt = rMVMEXCFCT.IdtAgtCrt;
  Trtmsg01.DeleteItem(Err_TableName);
END InsMvmExcFct;
-----------------------------------------------------------------------------
-----------------------------------------------------------------------------
-----------------------------------------------------------------------------
-- Retourne le solde des p�nalites facturee par facture.
-- Utilis�e par la simulation de collecte (entre autre ?)
-- Devrait retourner 0 dans le cas de l'OET car les factures
-- sont �mises pour paiement immediat...
-- ATTENTION : Controler la validit� de cette requete !!!!!!!!!
FUNCTION SldPenFacxFac (pIdtFac FAC.IdtFac%TYPE)
  RETURN NUMBER IS
  vSldPen OPR.Sld%TYPE;
BEGIN
  SELECT SUM(Sld)
    INTO vSldPen
    FROM (SELECT MAX(Sld) Sld
            FROM OPR, FAC, MVMEXCFCT
              WHERE FAC.IdtFac          = MVMEXCFCT.IdtFac
               AND  OPR.Rfr             = FAC.NUMFCT
               AND  OPR.IdtTypOpr       = 1
               AND  FAC.FctAnn          = 0
               AND  FAC.IdtTypFct       = cTypFctPen
               AND  FAC.NUMFCT         <> '1'
               AND  MVMEXCFCT.IdtFacOrg = pIdtFac
              GROUP BY OPR.IdtOpr);
  RETURN NVL(vSldPen,0);
END SldPenFacxFac;
-----------------------------------------------------------------------------
-----------------------------------------------------------------------------
-----------------------------------------------------------------------------
-- Retourne le montant des p�nalites facturee par facture.
-- Utilis�e par la simulation de collecte (entre autre ?)
FUNCTION MntPenFacxFac (pIdtFac FAC.IdtFac%TYPE)
  RETURN NUMBER IS
  vMntPen OPR.Sld%TYPE;
BEGIN
  -- Nouveau code de CAL - 07/12/2003
  -- Ce nouveau code permet de prendre en compte les p�nalit�s stock�es au niveau de la facture de timbre
  -- (il s'agit de la TVA diff�rencielle en cas de changement de TVA entre le calcul et le paiement d'une facture)
  SELECT NVL(SUM(NVL(LGNFAC.MntHt, 0) + NVL(LGNFAC.MntTva, 0)), 0)
    INTO vMntPen
  FROM LGNFAC, FAC AllFac, FAC FacOrg
  WHERE LGNFAC.IdtFac = AllFac.IdtFac
    AND AllFac.NUMFCT <> '1'
    AND AllFac.FctAnn = 0
    AND AllFac.IdtTypFct IN (cTypFctPen, cTypFctTim)
    AND LGNFAC.IdtRbq in (cIdtRbqPen, cIdtRbqPenIrr)
    AND AllFac.brdrgr = FacOrg.NUMFCT
    AND FacOrg.IdtFac =  pIdtFac;
/*
  -- Nouveau code de CAL - 17/11/2003
  select nvl(sum(nvl(M.MntHt, 0) + nvl(M.MntTva, 0)), 0)
    into vMntPen
  from FAC F, MVMEXCFCT M
  where M.IdtFacOrg       = pIdtFac
    and M.IdtRbq          = cIdtRbqPen
    and M.IdtFac          is not null
    and F.IdtFac          = M.IdtFac
    and F.IdtTypFct       = cTypFctPen
    and F.FctAnn          = 0
    and F.NumFct         <> '1';
*/
/* ---- Ancien code de FBE --------------------
  select sum(Mnt)
    into vMntPen
    from (select max(Mnt) Mnt
            from OPR, FAC, MVMEXCFCT
              where FAC.IdtFac          = MVMEXCFCT.IdtFac
               and  OPR.Rfr             = FAC.NumFct
               and  OPR.IdtTypOpr       = 1
               and  FAC.FctAnn          = 0
               and  FAC.IdtTypFct       = cTypFctPen
               and  FAC.NumFct         <> '1'
               and  MVMEXCFCT.IdtFacOrg = pIdtFac
              group by OPR.IdtOpr);
*/
  RETURN NVL(vMntPen, 0);
END MntPenFacxFac;
-----------------------------------------------------------------------------
-----------------------------------------------------------------------------
-----------------------------------------------------------------------------
-- Retourne le montant des p�nalites facturee par facture.
-- Utilis�e par la simulation de collecte (entre autre ?)
FUNCTION MntPenTvaFacxFac (pIdtFac FAC.IdtFac%TYPE)
  RETURN NUMBER IS
  vMntPen OPR.Sld%TYPE;
BEGIN
 -- Nouveau code de CAL - 17/11/2003
/*
  Code remplac� car il ne prend pas en compte le diff�rentiel de TVA
  pouvant appliqu� via la facture de timbre...
  select sum(nvl(M.MntTva, 0))
    into vMntPen
  from FAC F, MVMEXCFCT M
  where M.IdtFacOrg       = pIdtFac
    and M.IdtRbq          = cIdtRbqPen
    and M.IdtFac          is not null
    and F.IdtFac          = M.IdtFac
    and F.IdtTypFct       = cTypFctPen
    and F.FctAnn          = 0
    and F.NumFct         <> '1';
*/
  -- Nouveau code de CAL - 07/12/2003
  -- Ce nouveau code permet de prendre en compte les p�nalit�s stock�es au niveau de la facture de timbre
  -- (il s'agit de la TVA diff�rencielle en cas de changement de TVA entre le calcul et le paiement d'une facture)
  SELECT SUM(NVL(LGNFAC.MntTva, 0))
    INTO vMntPen
  FROM LGNFAC, FAC AllFac, FAC FacOrg
  WHERE LGNFAC.IdtFac = AllFac.IdtFac
    AND AllFac.NUMFCT <> '1'
    AND AllFac.FctAnn = 0
    AND AllFac.IdtTypFct IN (cTypFctPen, cTypFctTim)
    AND LGNFAC.IdtRbq in (cIdtRbqPen, cIdtRbqPenIrr)
    AND AllFac.brdrgr = FacOrg.NUMFCT
    AND FacOrg.IdtFac =  pIdtFac;
  RETURN NVL(vMntPen,0);
END;
-----------------------------------------------------------------------------
-----------------------------------------------------------------------------
-----------------------------------------------------------------------------
-- Retourne le montant des p�nalites facturee par facture.
-- UTILISE LA TVA DU JOUR
FUNCTION MntPenTvaTodayFacxFac (pIdtFac FAC.IdtFac%TYPE)
  RETURN NUMBER IS
  vMntPen OPR.Sld%TYPE;
BEGIN
/* BPZ Plus de recalcul de TVA
  -- Nouveau code de CAL - 07/12/2003
  -- Ce nouveau code permet de prendre en compte les p�nalit�s stock�es au niveau de la facture de timbre
  -- (il s'agit de la TVA diff�rencielle en cas de changement de TVA entre le calcul et le paiement d'une facture)
  SELECT SUM(NVL(LGNFAC.MntHT, 0) * TAX.Tau / 100)
    INTO vMntPen
  FROM TAX, LGNFAC, FAC AllFac, FAC FacOrg
  WHERE LGNFAC.IdtFac = AllFac.IdtFac
    AND AllFac.NUMFCT <> '1'
    AND AllFac.FctAnn = 0
    AND AllFac.IdtTypFct IN (cTypFctPen, cTypFctTim)
    AND LGNFAC.IdtRbq = cIdtRbqPen
    AND AllFac.brdrgr = FacOrg.NUMFCT
    AND FacOrg.IdtFac = pIdtFac
    AND TAX.IdtTax    = LGNFAC.IdtTax;

  -- Modif CAL 22/03/2006 :
  -- Il faut suivre la modification faite pour le discount des p�nalit�s.
  -- Il peut y avoir un arrondi au niveau de la TVA et on prend la livre
  -- sup�rieure...
  -- Modif CAL 05/05/2006 : On prend finalement la livre inf�rieure
  vMntPen := NVL(vMntPen,0);
  if vMntPen <> trunc(vMntPen) then
--    vMntPen := trunc(vMntPen) + 1;
    vMntPen := trunc(vMntPen);
  end if;
*/
  vMntPen := MntPenTvaFacxFac(pIdtFac);
  RETURN vMntPen;
END;
-----------------------------------------------------------------------------
-----------------------------------------------------------------------------
-----------------------------------------------------------------------------
-- Retourne le montant des p�nalites facturee par facture.
-- Utilis�e par la simulation de collecte (entre autre ?)
FUNCTION MntPenHTFacxFac (pIdtFac FAC.IdtFac%TYPE)
  RETURN NUMBER IS
  vMntPen OPR.Sld%TYPE;
BEGIN
  -- Nouveau code de CAL - 07/12/2003
  SELECT SUM(NVL(LGNFAC.MntHT, 0))
    INTO vMntPen
  FROM LGNFAC, FAC AllFac, FAC FacOrg
  WHERE LGNFAC.IdtFac = AllFac.IdtFac
    AND AllFac.NUMFCT <> '1'
    AND AllFac.FctAnn = 0
    AND AllFac.IdtTypFct IN (cTypFctPen, cTypFctTim)
    AND LGNFAC.IdtRbq in (cIdtRbqPen, cIdtRbqPenIrr)
    AND AllFac.brdrgr = FacOrg.NUMFCT
    AND FacOrg.IdtFac =  pIdtFac;
  RETURN NVL(vMntPen,0);
END ;
-----------------------------------------------------------------------------
-----------------------------------------------------------------------------
-----------------------------------------------------------------------------
-- Retourne le montant des p�nalites migres
FUNCTION MntPenFacMgr (pIdtFac FAC.IdtFac%TYPE)
  RETURN NUMBER IS
  vMntPen OPR.Sld%TYPE;
BEGIN
  SELECT NVL(SUM(NVL(MntHt,0)+NVL(MntTva,0)),0)
    INTO vMntPen
    FROM RBQ, LGNFAC
    WHERE RBQ.IdtRbq    = LGNFAC.IdtRbq
     AND  RBQ.IdtTypRbr = cTypRbrPen
     AND  LGNFAC.IdtFac = pIdtFac;
  RETURN NVL(vMntPen,0);
END MntPenFacMgr;
-----------------------------------------------------------------------------
-----------------------------------------------------------------------------
-----------------------------------------------------------------------------
-- Retourne le montant des TVA de p�nalites migres
FUNCTION MntPenTvaFacMgr (pIdtFac FAC.IdtFac%TYPE)
  RETURN NUMBER IS
  vMntPen OPR.Sld%TYPE;
BEGIN
  SELECT SUM(NVL(MntTva,0))
    INTO vMntPen
    FROM LGNFAC
    WHERE LGNFAC.IdtRbq in (cIdtRbqPen, cIdtRbqPenIrr)
     AND  LGNFAC.IdtFac = pIdtFac;
  RETURN NVL(vMntPen,0);
END ;
-----------------------------------------------------------------------------
-----------------------------------------------------------------------------
-----------------------------------------------------------------------------
-- Retourne le montant des TVA DU JOUR de p�nalites migres
FUNCTION MntPenTvaTodayFacMgr (pIdtFac FAC.IdtFac%TYPE)
  RETURN NUMBER IS
  vMntPen OPR.Sld%TYPE;
BEGIN
/* BPZ Plus de recalcul de TVA
  SELECT SUM(NVL(MntHT,0) * TAX.Tau / 100)
    INTO vMntPen
    FROM TAX, LGNFAC
    WHERE LGNFAC.IdtRbq = cIdtRbqPen
     AND  LGNFAC.IdtFac = pIdtFac
     AND  TAX.IdtTax    = LGNFAC.IdtTax;

  -- Modif CAL 22/03/2006 :
  -- Il faut suivre la modification faite pour le discount des p�nalit�s.
  -- Il peut y avoir un arrondi au niveau de la TVA et on prend la livre
  -- sup�rieure...
  -- Modif CAL 05/05/2006 : On prend finalement la livre inf�rieure
  vMntPen := NVL(vMntPen,0);
  if vMntPen <> trunc(vMntPen) then
--    vMntPen := trunc(vMntPen) + 1;
    vMntPen := trunc(vMntPen);
  end if;
*/
  vMntPen := MntPenTvaFacMgr (pIdtFac);

  RETURN vMntPen;
END ;
-----------------------------------------------------------------------------
-----------------------------------------------------------------------------
-----------------------------------------------------------------------------
-- Retourne le montant HT de p�nalites migres
FUNCTION MntPenHTFacMgr (pIdtFac FAC.IdtFac%TYPE)
  RETURN NUMBER IS
  vMntPen OPR.Sld%TYPE;
BEGIN
  SELECT SUM(NVL(MntHT,0))
    INTO vMntPen
    FROM RBQ, LGNFAC
    WHERE RBQ.IdtRbq    = LGNFAC.IdtRbq
     AND  RBQ.IdtTypRbr = cTypRbrPen
     AND  LGNFAC.IdtFac = pIdtFac;
  RETURN NVL(vMntPen,0);
END ;
-----------------------------------------------------------------------------
-----------------------------------------------------------------------------
-----------------------------------------------------------------------------
-- Retourne le montant/solde des penalit�s non encore facturees (en attente).
-- Ces penalites sont ins�r�es dans le mvts exceptionnels chaque mois par le
-- batch de calcul des penalit�s.
-- CAL 03/04/06 : ET l'�ventuel discount sur ces p�nalit�s...
-- JCD 25/09/06 : Gestion des p�riodes sur discount
  -- sur CTRFAC , meme si on a plusieurs ligne, seuls les IDTCTR change, les periodes sont les memes
FUNCTION SldPenNonFacxFac(pIdtFac FAC.IdtFac%TYPE)
  RETURN NUMBER
  IS
  vMnt OPR.Mnt%TYPE;
 -- vDatDbtPrd CTRFAC.DatDbtPrd%TYPE;
 -- vDatFinPrd CTRFAC.DatFinPrd%TYPE;
 -- nGetDiscountPen NUMBER;
 -- SJ 16 nov 2009 modification suite au d�v Liban Offre de service X7 N� 007/09
BEGIN

 -- SJ 16 nov 2009 -apel fct pendingpenality au lieu des comm lignes suivante

 -- BEGIN

 --  SELECT nvl(DatDbtPrd,to_date('01/01/1980','DD/MM/YYYY')),
 --        nvl(DatFinPrd,to_date('01/01/2980','DD/MM/YYYY'))
 --   INTO vDatDbtPrd,
 --        vDatFinPrd
 --   FROM CTRFAC
 --   WHERE CTRFAC.IdtFac   = pIdtfac
 --   GROUP BY DatDbtPrd,DatFinPrd;


 --   nGetDiscountPen := TrtPen_Oet.GetDiscountPen(vDatDbtPrd,vDatFinPrd);

 --  Exception

 --       when no_data_found then
          -- Si on ne trouve rien, alors, on doit appliquer 100% de la p�nalit�s.
 --         nGetDiscountPen := 1;
          ---- ** trtmsg01.WriteSimpleLogFile('PENALITES', 'Discount non trouv�');

 --   END;


 -- SELECT NVL(SUM(NVL(MntHt,0)+NVL(MntTva,0)),0)
 --   INTO vMnt
 --   FROM MVMEXCFCT
 --   WHERE MVMEXCFCT.IdtRbq  = cIdtRbqPen
 --     AND IdtFacOrg         = pIdtFac
 --     AND MVMEXCFCT.IdtFac  IS NULL
 --     AND DatAnn       IS NULL;

 -- vMnt := NVL(vMnt ,0) * nGetDiscountPen;


  -- SJ 16 nov 2009 -apel fct pendingpenality
  -- select TRTPEN_OET.PendingPenality(pIdtFac,sysdate,user, 0) into vMnt from dual;
  -- CAL : 23/11/2009 : on veut ici Penalit� HT + TVA => mode = 1.
  vMnt := PendingPenality(pIdtFac, SYSDATE, CurrentIdtAgt, 1);


  -- Gestion de l'arrondi.
 -- Modif CAL 05/05/2006 : On prend finalement la livre inf�rieure
 IF vMnt <> TRUNC(vMnt) THEN

    vMnt := TRUNC(vMnt);
  END IF;

  RETURN vMnt;
END SldPenNonFacxFac;
-----------------------------------------------------------------------------
-----------------------------------------------------------------------------
-----------------------------------------------------------------------------
-- Idem que la pr�c�dente pour la TVA seule
-- CAL 03/04/06 : ET l'�ventuel discount sur ces p�nalit�s...
-- JCD 25/09/06 : Gestion des p�riodes sur discount
  -- sur CTRFAC , meme si on a plusieurs ligne, seuls les IDTCTR change, les periodes sont les memes
FUNCTION SldPenTvaNonFacxFac(pIdtFac FAC.IdtFac%TYPE)
  RETURN NUMBER
  IS
  vMnt OPR.Mnt%TYPE;
 -- vDatDbtPrd CTRFAC.DatDbtPrd%TYPE;
 -- vDatFinPrd CTRFAC.DatFinPrd%TYPE;
 -- nGetDiscountPen NUMBER;
 -- SJ 16 nov 2009 modification suite au d�v Liban Offre de service X7 N� 007/09
BEGIN

 -- SJ 16 nov 2009 -apel fct pendingpenality au lieu des comm lignes suivante

 --  BEGIN

 --   SELECT nvl(DatDbtPrd,to_date('01/01/1980','DD/MM/YYYY')),
 --        nvl(DatFinPrd,to_date('01/01/2980','DD/MM/YYYY'))
 --   INTO vDatDbtPrd,
 --        vDatFinPrd
 --   FROM CTRFAC
 --   WHERE CTRFAC.IdtFac   = pIdtfac
 --   GROUP BY DatDbtPrd,DatFinPrd;

 --   nGetDiscountPen := TrtPen_Oet.GetDiscountPen(vDatDbtPrd,vDatFinPrd);

 --    Exception

 --       when no_data_found then
          -- Si on ne trouve rien, alors, on doit appliquer 100% de la p�nalit�s.
 --         nGetDiscountPen := 1;
          ---- ** trtmsg01.WriteSimpleLogFile('PENALITES', 'Discount non trouv�');

 --   END;

 -- SELECT SUM(NVL(MntTva,0))
 --   INTO vMnt
 --   FROM MVMEXCFCT
 --   WHERE MVMEXCFCT.IdtRbq  = cIdtRbqPen
 --     AND IdtFacOrg         = pIdtFac
 --     AND MVMEXCFCT.IdtFac  IS NULL
 --     AND DatAnn            IS NULL;

 -- vMnt := NVL(vMnt,0) * nGetDiscountPen;


  -- SJ 16 nov 2009 -apel fct pendingpenality
  vMnt := PendingPenality(pIdtFac,SYSDATE,CurrentIdtAgt, 2);

  -- Gestion de l'arrondi.
  -- Modif CAL 05/05/2006 : On prend finalement la livre inf�rieure

  IF vMnt <> TRUNC(vMnt) THEN
    vMnt := TRUNC(vMnt);
  END IF;

  RETURN vMnt;
END;
-----------------------------------------------------------------------------
-----------------------------------------------------------------------------
-----------------------------------------------------------------------------
-- Idem que la pr�c�dente pour la TVA DU JOUR seule
-- CAL 03/04/06 : ET l'�ventuel discount sur ces p�nalit�s...
-- JCD 25/09/06 : Gestion des p�riodes sur discount
  -- sur CTRFAC , meme si on a plusieurs ligne, seuls les IDTCTR change, les periodes sont les memes
FUNCTION SldPenTvaTodayNonFacxFac(pIdtFac FAC.IdtFac%TYPE)
  RETURN NUMBER
  IS
  vMnt OPR.Mnt%TYPE;
  vDatDbtPrd CTRFAC.DatDbtPrd%TYPE;
  vDatFinPrd CTRFAC.DatFinPrd%TYPE;
  nGetDiscountPen NUMBER;
BEGIN
/* BPZ Plus de recalcul de TVA
   BEGIN
     SELECT nvl(DatDbtPrd,to_date('01/01/1980','DD/MM/YYYY')),
            nvl(DatFinPrd,to_date('01/01/2980','DD/MM/YYYY'))
       INTO vDatDbtPrd,
            vDatFinPrd
       FROM CTRFAC
       WHERE CTRFAC.IdtFac   = pIdtfac
       GROUP BY DatDbtPrd,DatFinPrd;

     nGetDiscountPen := TrtPen_Oet.GetDiscountPen(vDatDbtPrd,vDatFinPrd);
     Exception

        when no_data_found then
          -- Si on ne trouve rien, alors, on doit appliquer 100% de la p�nalit�s.
          nGetDiscountPen := 1;
          ---- ** trtmsg01.WriteSimpleLogFile('PENALITES', 'Discount non trouv�');

    END;


  SELECT SUM(NVL(MntHT,0) * TAX.Tau / 100)
    INTO vMnt
    FROM TAX, MVMEXCFCT
    WHERE MVMEXCFCT.IdtRbq  = cIdtRbqPen
      AND IdtFacOrg         = pIdtFac
      AND MVMEXCFCT.IdtFac  IS NULL
      AND DatAnn            IS NULL
      AND TAX.IdtTax        = MVMEXCFCT.IdtTax;

  vMnt := NVL(vMnt,0) * nGetDiscountPen;

  -- Gestion de l'arrondi.
  -- Modif CAL 05/05/2006 : On prend finalement la livre inf�rieure
  if vMnt <> trunc(vMnt) then
--    vMnt := trunc(vMnt) + 1;
    vMnt := trunc(vMnt);
  end if;
*/
  vMnt := SldPenTvaNonFacxFac(pIdtFac );
  RETURN vMnt;
END;
-----------------------------------------------------------------------------
-- Retourne le montant/solde des penalit�s non encore facturees (en attente).
-- Ces penalites sont ins�r�es dans le mvts exceptionnels chaque mois par le
-- batch de calcul des penalit�s.
-- CAL 03/04/06 : ET l'�ventuel discount sur ces p�nalit�s...
-- JCD 25/09/06 : Gestion des p�riodes sur discount
  -- sur CTRFAC , meme si on a plusieurs ligne, seuls les IDTCTR change, les periodes sont les memes
FUNCTION SldPenHTNonFacxFac(pIdtFac FAC.IdtFac%TYPE)
  RETURN NUMBER
  IS
  vMnt OPR.Mnt%TYPE;
 -- vDatDbtPrd CTRFAC.DatDbtPrd%TYPE;
 -- vDatFinPrd CTRFAC.DatFinPrd%TYPE;
 -- nGetDiscountPen NUMBER;
 -- SJ 16 nov 2009 modification suite au d�v Liban Offre de service X7 N� 007/09
BEGIN

 -- SJ 16 nov 2009 -apel fct pendingpenality au lieu des comm lignes suivante
 --  BEGIN
 --    SELECT nvl(DatDbtPrd,to_date('01/01/1980','DD/MM/YYYY')),
 --           nvl(DatFinPrd,to_date('01/01/2980','DD/MM/YYYY'))
 --      INTO vDatDbtPrd,
 --           vDatFinPrd
 --      FROM CTRFAC
 --      WHERE CTRFAC.IdtFac   = pIdtfac
 --      GROUP BY DatDbtPrd,DatFinPrd;

       --vDatDbtPrd := to_date('01/01/1980','DD/MM/YYYY');
       --vDatFinPrd := to_date('01/01/2980','DD/MM/YYYY');

 --    nGetDiscountPen := TrtPen_Oet.GetDiscountPen(vDatDbtPrd,vDatFinPrd);

 --      Exception

 --      when no_data_found then
          -- Si on ne trouve rien, alors, on doit appliquer 100% de la p�nalit�s.
 --        nGetDiscountPen := 1;
          ---- ** trtmsg01.WriteSimpleLogFile('PENALITES', 'Discount non trouv�');

 --   END;

 -- SELECT SUM(NVL(MntHt,0))
 --   INTO vMnt
 --   FROM MVMEXCFCT
 --   WHERE MVMEXCFCT.IdtRbq  = cIdtRbqPen
 --     AND IdtFacOrg         = pIdtFac
 --     AND MVMEXCFCT.IdtFac  IS NULL
 --     AND DatAnn       IS NULL;

 --  vMnt := NVL(vMnt,0) * nGetDiscountPen;


   -- SJ 16 nov 2009 -apel fct pendingpenality
   vMnt := PendingPenality(pIdtFac,SYSDATE,CurrentIdtAgt, 0);

  -- Gestion de l'arrondi.
  -- Modif CAL 05/05/2006 : On prend finalement la livre inf�rieure
  IF vMnt <> TRUNC(vMnt) THEN
--    vMnt := trunc(vMnt) + 1;
    vMnt := TRUNC(vMnt);
  END IF;

  RETURN vMnt;

END;
-----------------------------------------------------------------------------
-----------------------------------------------------------------------------
-- Retourne le montant total des penalites pour une facture
FUNCTION MntPenTot (pIdtFac FAC.IdtFac%TYPE)
  RETURN NUMBER
  IS
  vMnt OPR.Mnt%TYPE;
BEGIN
  vMnt := MntPenFacxFac(pIdtFac) + MntPenFacMgr(pIdtFac) + SldPenNonFacxFac(pIdtFac);
  RETURN vMnt;
END MntPenTot;
-----------------------------------------------------------------------------
-----------------------------------------------------------------------------
-----------------------------------------------------------------------------
-- Retourne le montant total des TVA de penalites pour une facture
FUNCTION MntPenTva (pIdtFac FAC.IdtFac%TYPE)
  RETURN NUMBER
  IS
  vMnt OPR.Mnt%TYPE;
BEGIN
  vMnt := MntPenTvaFacxFac(pIdtFac) + MntPenTvaFacMgr(pIdtFac) + SldPenTvaNonFacxFac(pIdtFac);

  -- JLD - 04/12/2010 - Arrondi TVA
  IF vMnt != TRUNC( vMnt ) THEN
     vMnt := TRUNC( vMnt );
  END IF;

  RETURN vMnt;
END;
-----------------------------------------------------------------------------
-----------------------------------------------------------------------------
-----------------------------------------------------------------------------
-- Retourne le montant total des TVA DU JOUR de penalites pour une facture
FUNCTION MntPenTvaToday (pIdtFac FAC.IdtFac%TYPE)
  RETURN NUMBER
  IS
  vMnt OPR.Mnt%TYPE;
BEGIN
  vMnt := MntPenTvaTodayFacxFac(pIdtFac) + MntPenTvaTodayFacMgr(pIdtFac) + SldPenTvaTodayNonFacxFac(pIdtFac);

  -- JLD - 04/12/2010 - Arrondi TVA
  IF vMnt != TRUNC( vMnt ) THEN
     vMnt := TRUNC( vMnt );
  END IF;

  RETURN vMnt;
END;
-----------------------------------------------------------------------------
-----------------------------------------------------------------------------
-----------------------------------------------------------------------------
-- Retourne le montant total HT de penalites pour une facture
FUNCTION MntPenHT (pIdtFac FAC.IdtFac%TYPE)
  RETURN NUMBER
  IS
  vMnt OPR.Mnt%TYPE;
BEGIN
  vMnt := MntPenHTFacxFac(pIdtFac) + MntPenHTFacMgr(pIdtFac) + SldPenHTNonFacxFac(pIdtFac);

  RETURN vMnt;
END ;
-----------------------------------------------------------------------------
-----------------------------------------------------------------------------
-----------------------------------------------------------------------------
-- Retourne le solde total des penalites pour une facture
-- ******* FONCTION NON UTILISEE *************
FUNCTION SldPenTot (pIdtFac FAC.IdtFac%TYPE)
  RETURN NUMBER
  IS
  vSld OPR.Mnt%TYPE;
BEGIN
  vSld := SldPenNonFacxFac(pIdtFac) + SldPenFacxFac(pIdtFac);
  RETURN vSld;
END SldPenTot;
-----------------------------------------------------------------------------
-----------------------------------------------------------------------------
-----------------------------------------------------------------------------
-- Indique si on doit appliquer les penalites pour un client donn�.
-- Les deux exceptions, dans le cas de l'OET, sont les conditions d�finies
-- dans les param. g�n�raux et si le client a fait une r�clamation (contact ouvert).
FUNCTION AplPenxClt
   (pIdtClt IN       CLT.IdtClt%TYPE)
  RETURN NUMBER
IS
  CURSOR cflt IS
    SELECT *
      FROM FLT
     WHERE idtflt = '1';
  rflt cflt%ROWTYPE;
  vSlc CONSTANT    VARCHAR2(20)  := 'Select count(*) ';
  vFrm CONSTANT    VARCHAR2(6)   := ' FROM ';
  vWhr CONSTANT    VARCHAR2(7)   := ' WHERE ';
  vAnd CONSTANT    VARCHAR2(5)   := ' AND ';
  vClt CONSTANT    VARCHAR2(5)   := ' CLT ';
  vWhrClt CONSTANT VARCHAR2(30)  := ' clt.Idtclt = :Idtclt ';
  vReq VARCHAR2(2000);
  vNbr  NUMBER;
BEGIN
    -- ** trtmsg01.WriteSimpleLogFile('PENALITES', ' => AplPenxClt(' || pIdtClt || ')');
  OPEN cFlt;
    FETCH cFlt INTO rFlt;
    IF rFlt.Frm IS NULL THEN
      vReq := vSlc || vFrm || vClt || vWhr || vWhrClt;
    ELSE
      vReq := vSlc || vFrm || rFlt.Frm || vWhr || rFlt.Whr || vAnd || vWhrClt;
    END IF;
  CLOSE cFlt;
  EXECUTE IMMEDIATE vReq
    INTO vNbr
    USING pIdtClt;
  IF vNbr = 0  THEN
    -- ** trtmsg01.WriteSimpleLogFile('PENALITES', ' <= AplPenxClt() -> 0 (condition filtre 1 valid�e)');
    RETURN 0;
  END IF;
  SELECT COUNT(*)
    INTO vNbr
    FROM CNT
    WHERE IdtClt = pIdtClt
     AND  IdtTypCnt = 2
     AND  DatFin IS NULL;
  IF vNbr > 0 THEN
    -- ** trtmsg01.WriteSimpleLogFile('PENALITES', ' <= AplPenxClt() -> 0 (contact en cours pour ce client)');
    RETURN 0;
  END IF;

  -- ** trtmsg01.WriteSimpleLogFile('PENALITES', ' <= AplPenxClt() -> 1');
  RETURN 1;
END AplPenxClt ;
-----------------------------------------------------------------------------
-----------------------------------------------------------------------------
-----------------------------------------------------------------------------
-- Indique si on doit appliquer les penalit�s � une fact.
FUNCTION AplPenxFac(pIdtFac FAC.IdtFac%TYPE, pDatClc DATE)
  RETURN NUMBER
IS
  vDatFinDrnPen DATE;
  vDatExg       DATE;
  vNumFct       FAC.NUMFCT%TYPE;
  vIdtTypFct    FAC.IdtTypFct%TYPE;
  vDliCrc       NUMBER;
  vSld          OPR.Mnt%TYPE;
  vFctAnn       FAC.FctAnn%TYPE;
  vIdtOpr       OPR.IdtOpr%TYPE;
  vIdtPrdFac    CTRFAC.IdtPrdFac%TYPE;
  vDatImp OPR.DatImp%TYPE := NULL;
BEGIN
    -- ** trtmsg01.WriteSimpleLogFile('PENALITES', ' => AplPenxFac(' || to_char(pIdtFac) || ', ' || to_char(pDatClc) || ')');
-- Recherche du delai de carence
  SELECT NVL(DliCrc,0)
    INTO vDliCrc
    FROM PRMGNR;
-- R�cup�ration des information de la facture
  SELECT TRUNC(DatExg) + vDliCrc, NUMFCT, IdtTypFct, TRUNC(DatDrnPen), FctAnn
    INTO vDatExg, vNumFct, vIdtTypFct, vDatFinDrnPen, vFctAnn
    FROM FAC
    WHERE IdtFac = pIdtFac;
-- Pas d'application si la facture est annul�e
  IF vFctAnn = 1 THEN
    -- ** trtmsg01.WriteSimpleLogFile('PENALITES', ' <= AplPenxFac() -> 0 (facture annul�e)');
    RETURN 0;
  END IF;
-- Pas d'application de penalit�s si la date de fin
-- de la derni�re p�riode de calcul des penalit�s est superieure � la date de calcul
-- ou la date d'exigibilit� de la facture
  IF (vDatFinDrnPen > TRUNC(pDatClc) AND vDatFinDrnPen IS NOT NULL)
     OR vDatExg > TRUNC(pDatClc) THEN
    -- ** trtmsg01.WriteSimpleLogFile('PENALITES', ' <= AplPenxFac() -> 0 (pas ou plus de p�nalit�s � calculer)');
    RETURN 0;
  END IF;
-- Pas de calcul des penalit�s s'il ne s'agit pas
-- d'une facture de avenant, service, resiliation, Abonnement ou migration
-- JLD : 21/07/2005 : Les factures manuelles sont soumises � p�nalit�s...
  IF vIdtTypFct NOT IN ('0', '1', '4', '5', '9', '101') THEN
    -- ** trtmsg01.WriteSimpleLogFile('PENALITES', ' <= AplPenxFac() -> 0 (pas ou plus de p�nalit�s � calculer)');
    RETURN 0;
  END IF;
-- Pas de calcul des penalit�s si la facture n'est pas valid�e
-- Attention au test suivant si utilis� avec door-step billing !!
  IF vNumFct = '1' THEN
    RETURN 0;
    -- ** trtmsg01.WriteSimpleLogFile('PENALITES', ' <= AplPenxFac() -> 0 (facture non valid�e)');
  END IF;
-- Recherche de periode de la facture
  BEGIN
    SELECT IdtPrdFac
      INTO vIdtPrdFac
      FROM CTRFAC
      WHERE IdtFac = pIdtFac;
  EXCEPTION
-- S'il n'y a pas CTRFAC, on ne calcul pas
    WHEN NO_DATA_FOUND THEN
      -- ** trtmsg01.WriteSimpleLogFile('PENALITES', ' <= AplPenxFac() -> 0 (pas de CTRFAC / pas de p�riode)');
      RETURN 0;
  END;
-- Si le periode est anterieur a 2002 on ne calcul pas des penalit�s
  IF vIdtPrdFac < '200201' THEN
    -- ** trtmsg01.WriteSimpleLogFile('PENALITES', ' <= AplPenxFac() -> 0 (P�riode ant�rieure � 2002)');
    RETURN 0;
  END IF;
-- Pas de calcul des penalit�s si le solde de la facture
-- est inf�rieur ou �gal � 0
-- SJ 16 nov 2009: pas clcpen si fact. d�j� imprim�e
-- CAL 12/2009 : Non, on ne doit pas tester la date d'impression !
  SELECT IdtOpr, Sld, DatImp
    INTO vIdtOpr, vSld, vDatImp
    FROM OPR
    WHERE Rfr = vNumFct
     AND  IdtTypOpr = 1;
  IF vSld <= 0
    -- or vDatImp is not null
  THEN
    -- ** trtmsg01.WriteSimpleLogFile('PENALITES', ' <= AplPenxFac() -> 0 (Solde = 0)');
    RETURN 0;
  END IF;
-- *******************************************************************************
-- ** Modif CAL 01/12/2009 : cela emp�che la prise en compte des p�nalit�s avec le
-- ** nouvel algo pour le calcul sans stockage dans MVMEXCFCT !!!
-- ** La facture ne se trouve pas dans un lot de collecte non clotur�
-- **   IF OprDansLotRtgAct(vIdtOpr, 2) = 1 THEN
-- **     RETURN 0;
-- **   END IF;
-- *******************************************************************************

-- Le calcul des penalit�s est autoris� pour cette facture
  -- ** trtmsg01.WriteSimpleLogFile('PENALITES', ' <= AplPenxFac() -> 1');
  RETURN 1;
EXCEPTION
  WHEN OTHERS THEN
    -- ** trtmsg01.WriteSimpleLogFile('PENALITES', ' <= AplPenxFac() -> 0 (Erreur !)');
    RETURN 0;
END AplPenxFac;
-----------------------------------------------------------------------------
-----------------------------------------------------------------------------
-----------------------------------------------------------------------------
-- Prix des p�nalit�s
PROCEDURE PrxPen(pIdtRbq    IN     RBQ.IdtRbq%TYPE,
                 pDatDbt    IN     DATE,
                 pDatFin    IN OUT DATE,
                 pModAppPrx IN     VARCHAR2,
                 pPrxUnt       OUT PRX.PrxUnt%TYPE)
IS
  vIdtPrx PRX.IdtPrx%TYPE;
  vPrxUnt PRX.PrxUnt%TYPE;
  vDatPrx DATE;
  vDatFin DATE;
BEGIN
  Trtmsg01.InsertItem(Err_TableName,'PRXPEN');
  ---------------------------------------------------------------------------
  Err_Msg := 'Recherche du prix � la date de d�but de la p�riode ou prorrata';
  ---------------------------------------------------------------------------
  IF pModAppPrx = 'D' OR pModAppPrx = 'P' THEN
    vDatPrx := pDatDbt;
  ---------------------------------------------------------------------------
  Err_Msg := 'Recherche du prix � la date de fin de la p�riode';
  ---------------------------------------------------------------------------
  ELSIF pModAppPrx = 'F' THEN
    vDatPrx := pDatFin;
    -------------------------------------------------------------------------
    Err_Msg := 'Retour d''erreur si le cas n''est pas pris en compte';
    -------------------------------------------------------------------------
  ELSE
    RAISE NO_DATA_FOUND;
  END IF;
--  pPrxUnt := 0.02;
  ---------------------------------------------------------------------------
  Err_Msg := 'Recherche du prix';
  ---------------------------------------------------------------------------
  -- JLD : Recherche du dernier prix
  SELECT MAX(IdtPrx)
    INTO vIdtPrx
    FROM PRXENT
    WHERE IdtRbq = pIdtRbq;
  SELECT PrxUnt, DatFinVld
    INTO pPrxUnt, vDatFin
    FROM TRCPRX a
    WHERE IdtPrx = vIdtPrx
     AND  NumTrn = 1
     AND  DatDbtVld = (SELECT MAX(DatDbtVld)
                          FROM TRCPRX b
                          WHERE b.IdtPrx = a.IdtPrx
                           AND  b.NumTrn = a.NumTrn
                           AND  TRUNC(DatDbtVld) <= TRUNC(vDatPrx)) ;
  IF pModAppPrx = 'P' AND vDatFin IS NOT NULL AND TRUNC(vDatFin) < TRUNC(pDatFin) THEN
    pDatFin := vDatFin;
  END IF;
  Trtmsg01.DeleteItem(Err_TableName);
END PrxPen;
-----------------------------------------------------------------------------
-----------------------------------------------------------------------------
-----------------------------------------------------------------------------
-- Donne la prochaine p�riode de calcul de p�nalit�s pour une facture.
PROCEDURE NxtPrdClcPen(pIdtFac IN     FAC.IdtFac%TYPE,
                       pDatClc IN     DATE,
                       pDatDbt IN     DATE,
                       pDatFin IN OUT DATE,
                       pSldFac IN OUT OPR.Sld%TYPE,
                       pQteFct IN OUT LGNFAC.QteFct%TYPE)
IS
BEGIN
  Trtmsg01.InsertItem(Err_TableName,'NXTPRDCLCPEN');
  -- +=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=
  -- Modif CAL - 31/12/2004
  -- Aujourd'hui le Liban a appel� ! Les p�nalit�s de Janvier sont appliqu�es aujourd'hui...
  -- Argh... Il faut changer le test ci-dessous afin de ne pas calculer avant DEMAIN !
  -- Ci dessous les valeurs au 31/12/04 sont :
  -- pDatDbt = 01/01/2005
  -- pDatClc = 31/12/2004
  -- On vire le "+ 1" du test...
  -- if trunc(pDatDbt) <= trunc(pDatClc + 1) then
  -- +=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=
  -- Modif CAL - 13/09/2005
  -- On veut pouvoir � nouveau lancer les p�nalit�s en soir�e. Mais elles ne doivent
  -- pas apparaitre durant la journ�e de travail !!
  -- Donc on remet le test d'avant mais on restreint l'usage de ceci � une heure
  -- tardive dans la journ�e.
   IF TRUNC(pDatDbt) <= TRUNC(pDatClc) THEN
  -- +=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=
  -- IF TRUNC(pDatDbt) <= TRUNC(pDatClc + 1) THEN
    -- Pas avant 18h SVP !!!!!!!!!!!!!!!!!!
   -- IF SYSDATE > TO_DATE(TO_CHAR(SYSDATE, 'yyyymmdd') || '-1800', 'yyyymmdd-hh24mi') THEN

      -------------------------------------------------------------------------
      Err_Msg := 'Assignation du date de fin';
      -------------------------------------------------------------------------
      --BPZ
      --Factorisation des lignes de p�nalit�s en une ligne
      --pDatFin := LAST_DAY(pDatDbt);
      pDatFin := LAST_DAY(pDatClc);
      --BPZ
      --pQteFct := 1;
      pQteFct :=  ROUND( MONTHS_BETWEEN( pDatFin, pDatDbt ) ) ;
      IF pSldFac IS NULL THEN
      -------------------------------------------------------------------------
      Err_Msg := 'Recherche du solde';
      -------------------------------------------------------------------------
        SELECT Sld
          INTO pSldFac
          FROM OPR, FAC
          WHERE OPR.Rfr = FAC.NUMFCT
           AND  OPR.IdtTypOpr = 1
           AND  FAC.IdtFac = pIdtFac;
      END IF;  -- pSldFac is null
    -- END IF;    -- Apr�s 18h
  END IF;      -- Le bon jour.
  Trtmsg01.DeleteItem(Err_TableName);
END NxtPrdClcPen;
-----------------------------------------------------------------------------
-----------------------------------------------------------------------------
-----------------------------------------------------------------------------
-- Calcul des p�nalit�s par facture.
-- Coeur du programme !!!!
--
-- La difficult� est l'affection en priorit� des paiements sur certaines
-- rubriques (cas de l'OET -> le timbre), dans le cas des fact. migr�es.
PROCEDURE ClcPenxFac(pIdtFac FAC.IdtFac%TYPE, pDatClc DATE, pIdtAgt AGT.IdtAgt%TYPE, pCr OUT NUMBER)
IS
  -- Ici ce sont des TYPES tableaux
  TYPE typIDTRBQ IS TABLE OF RBQ.IdtRbq%TYPE INDEX BY BINARY_INTEGER;
  TYPE typQTEFCT IS TABLE OF MVMEXCFCT.QteFct%TYPE INDEX BY BINARY_INTEGER;
  TYPE typPRXUNT IS TABLE OF MVMEXCFCT.PrxUnt%TYPE INDEX BY BINARY_INTEGER;
  TYPE typDATE   IS TABLE OF NUMBER INDEX BY BINARY_INTEGER;
--  TYPE typMNT    is table of MVMEXCFCT.MntHt%TYPE index by binary_integer;
  TYPE typMNT    IS TABLE OF NUMBER INDEX BY BINARY_INTEGER;
  TYPE typUNTMSR IS TABLE OF MVMEXCFCT.UNTMSR%TYPE INDEX BY BINARY_INTEGER;
  TYPE typNIVPRR IS TABLE OF NUMBER INDEX BY BINARY_INTEGER;
  TYPE typIDTAGT IS TABLE OF AGT.IdtAgt%TYPE INDEX BY BINARY_INTEGER;
  TYPE typNbr    IS TABLE OF NUMBER INDEX BY BINARY_INTEGER;
  -- Ici ce sont les variables d�clar�es avec les types ci-dessus
  tIdtRbq    typIDTRBQ;
  tIdtRbqPen typIDTRBQ;
  tQteFct    typQTEFCT;
  tPrxUnt    typPRXUNT;
  tDatDbt    typDATE;
  tDatFin    typDATE;
  tMntPen    typMNT;
  tMntHt     typMNT;
  tMntTva    typMNT;
  tUntMsr    typUNTMSR;
  tMntBas    typMNT;
  tNivPrr    typNIVPRR;
  tNivPrrRbq typNIVPRR;
  tMntRbq    typMNT;
  tMntNiv    typMNT;
  tSldNiv    typMNT;
  tIdxNiv    typNbr;
  tIdtAgt    typIDTAGT;
  vDatDbt    DATE;
  vDatFin    DATE;
  vMntFac    OPR.Mnt%TYPE;
  vQteFct    MVMEXCFCT.QteFct%TYPE;
  vPrxUnt    MVMEXCFCT.PrxUnt%TYPE;
  vMntPmt    OPR.Mnt%TYPE;
  vMntPmtTmp OPR.Mnt%TYPE;
  vUntMsr    UNTMSR.UNTMSR%TYPE;
  vModAppPrx    RBQ.ModAppPrx%TYPE;
  vDatDebFct    DATE;
  vDatFinFct    DATE;
  vArr          NUMBER;
  vOldIdtRbqPen RBQ.IdtRbq%TYPE := 'zzz';
  vIdtDvs    DVS.IdtDvs%TYPE;
  vSldFac    OPR.Sld%TYPE;
  j          NUMBER;
  k          NUMBER := 0;
  vMntPenDejaFact NUMBER ;
  vTMntPenAjust NUMBER := 0;
  vParamPlafond NUMBER;
  vDiscountPen NUMBER;
  vMntHtFacSansTimbre FAC.MntHt%TYPE;
  vId_oet_pendis_clt CLT.T3%TYPE;
BEGIN
  -- ** trtmsg01.WriteSimpleLogFile('PENALITES', ' => ClcPenxFac(' || to_char(pIdtFac) || ', ' || to_char(pDatClc) || ')');
  Trtmsg01.InsertItem(Err_TableName,'CLCPENXFAC');
  ---------------------------------------------------------------------------
  Err_Msg := 'Aucune penalit� calcul�e';
  ---------------------------------------------------------------------------
  pCr := 0;
  ---------------------------------------------------------------------------
  Err_Msg := 'Si le calcul des penalit�s est autoris�e pour cette facture';
  ---------------------------------------------------------------------------
  IF AplPenxFac(pIdtFac, pDatClc) = 1 THEN
    -------------------------------------------------------------------------
    Err_Msg := 'Recherche des informations de la facture (periode)';
    -------------------------------------------------------------------------
    --SJ 06/06/2018 traitement de la fiche 15990
    SELECT TRUNC(NVL(FAC.DatDrnPen,DatExg)),
           CTRFAC.DatDbtPrd,
           CTRFAC.DatFinPrd,
           FAC.IdtDvs,
           NVL(FAC.MntHt,0)+NVL(FAC.MntTva,0)
      INTO vDatFin,
           vDatDebFct,
           vDatFinFct,
           vIdtDvs,
           vMntFac
      FROM CTRFAC, FAC
      WHERE CTRFAC.IdtFac = FAC.IdtFac
       AND  FAC.IdtFac    = pIdtFac;

     -- On r�cup�re le discount pr�vu pour ce client.
       SELECT NVL(T3,0) INTO vId_oet_pendis_clt
       FROM CLT, FAC
       WHERE CLT.IdtClt = FAC.IdtClt
            AND FAC.IdtFac = pIdtFac;

         -- On r�cup�re le coef de discount en fonction du param lu pour le client
     vDiscountPen := GetDiscountPen(vDatDebFct,vDatFinFct, vId_oet_pendis_clt);

       --24/09/2009 fiche 7692 - param plafond de p�nalit�
     vParamPlafond := GetPlafondPen(vDatDebFct, vDatFinFct, vId_oet_pendis_clt);

            -----------------------------
            -- recherche du montant �ventuellement existant dans les mouvements exceptionnels.
            -----------------------------
            BEGIN
            SELECT SUM(NVL(MntHt,0)+NVL(MntTva,0)) INTO vMntPenDejaFact
            FROM MVMEXCFCT
            WHERE  NVL(FacAnn,0) != 1
              AND DatAnn IS NULL
              AND IdtFacOrg = pIdtFac;

            EXCEPTION WHEN NO_DATA_FOUND
                THEN  vMntPenDejaFact := 0;
            END;

    -------------------------------------------------------------------------
    Err_Msg := 'Recherche du arrondi de la devise';
    -------------------------------------------------------------------------
    SELECT ArrMnn
      INTO vArr
      FROM DVS
      WHERE IdtDvs = vIdtDvs;

    -------------------------------------------------------------------------
    Err_Msg := 'Cursor de montant par rubrique de penalit�';
    -------------------------------------------------------------------------
    SELECT RBQ.IdtRbqPen,
           TO_NUMBER(RBQ.NivPrr),
           SUM(NVL(FAC_LGNFAC_V1.MntHt,0)) MntHt,
           SUM(NVL(FAC_LGNFAC_V1.MntTva,0)) MntTva
      BULK COLLECT INTO tIdtRbqPen, tNivPrrRbq, tMntHt, tMntTva
      FROM RBQ, FAC_LGNFAC_V1
      WHERE RBQ.IdtRbq           = FAC_LGNFAC_V1.IdtRbq
       AND  RBQ.IdtRbqPen       IS NOT NULL
       AND  FAC_LGNFAC_V1.RbqCmm = 0
       AND  FAC_LGNFAC_V1.IdtFac = pIdtFac
      GROUP BY RBQ.IdtRbqPen, TO_NUMBER(RBQ.NivPrr);
    Err_Msg := 'S''il y a des rubriques pour appliquer des penalites';

    -- -- ** trtmsg01.WriteSimpleLogFile('PENALITES', 'Nombre de ligne de rubriques trouv�es : ' || to_char(tIdtRbqPen.Count));

    IF tIdtRbqPen.COUNT > 0 THEN
      -------------------------------------------------------------------------
      Err_Msg := 'Cursor de montant par niveau de priorit�';
      -------------------------------------------------------------------------
      SELECT TO_NUMBER(RBQ.NivPrr),
             SUM(NVL(FAC_LGNFAC_V1.MntHt,0)) + SUM(NVL(FAC_LGNFAC_V1.MntTva,0))
        BULK COLLECT INTO tNivPrr, tMntNiv
        FROM RBQ, FAC_LGNFAC_V1
        WHERE RBQ.IdtRbq           = FAC_LGNFAC_V1.IdtRbq
         AND  FAC_LGNFAC_V1.RbqCmm = 0
         AND  FAC_LGNFAC_V1.IdtFac = pIdtFac
        GROUP BY TO_NUMBER(RBQ.NivPrr)
        ORDER BY NVL(TO_NUMBER(RBQ.NivPrr),99);
      -------------------------------------------------------------------------
      Err_Msg := 'Correspondance entre la rubrique de penalit� et le niveau de priorit�';
      -------------------------------------------------------------------------
      -- -- ** trtmsg01.WriteSimpleLogFile('PENALITES', 'Avant boucle FOR');

      FOR i IN tIdtRbqPen.FIRST..tIdtRbqPen.LAST LOOP
        j := 0;
        LOOP
          j := j+1;
          IF NVL(tNivPrrRbq(i),99) = NVL(tNivPrr(j),99) THEN
            tIdxNiv(i) := j;
            EXIT;
          END IF;
        END LOOP;
      END LOOP; -- tIdtRbqPen.First..tIdtRbqPen.Last
      -------------------------------------------------------------------------
      Err_Msg := 'Loop en tant qu''il y a une periode a calculer des penalit�s';
      -------------------------------------------------------------------------
      -- -- ** trtmsg01.WriteSimpleLogFile('PENALITES', 'Avant boucle LOOP');
        BEGIN

              SELECT SUM(LGNFAC.MntHt) INTO vMntHtFacSansTimbre
                FROM FAC, LGNFAC
                  WHERE FAC.IdtFac = LGNFAC.IdtFac
                    AND LGNFAC.IdtRbq <> 'TIMBRE'
                    AND FAC.IdtFac=pIdtFac;

              EXCEPTION WHEN OTHERS
                  -- La ceinture ...
                  THEN vMntHtFacSansTimbre := 0;

          END ;
          -- et les bretelles...
          IF vMntHtFacSansTimbre IS NULL THEN vMntHtFacSansTimbre := 0; END IF;

      LOOP
        vDatDbt := vDatFin + 1;
        NxtPrdClcPen(pIdtFac, pDatClc, vDatDbt, vDatFin, vSldFac, vQteFct);
        EXIT WHEN vDatDbt > vDatFin OR  vTMntPenAjust < 0 OR NVL(vMntPenDejaFact,0) > NVL(vMntHtFacSansTimbre,0);
        -----------------------------------------------------------------------
        Err_Msg := 'Distribution du solde par raport la priorit� de la rubrique';
        -----------------------------------------------------------------------
        vMntPmt := vMntFac - vSldFac;
        FOR i IN tNivPrr.FIRST..tNivPrr.LAST LOOP
          vMntPmtTmp := LEAST(tMntNiv(i),vMntPmt);
          vMntPmt := vMntPmt - vMntPmtTmp;
          tSldNiv(i) := tMntNiv(i) - vMntPmtTmp;
        END LOOP;
        -----------------------------------------------------------------------
        Err_Msg := 'Aplication des penalit�s';
        -----------------------------------------------------------------------
        FOR i IN tIdtRbqPen.FIRST..tIdtRbqPen.LAST LOOP
          IF vOldIdtRbqPen <> tIdtRbqPen(i) THEN
            -------------------------------------------------------------------
            Err_Msg := 'Recherche du prix pour la rubrique de penalit�';
            -------------------------------------------------------------------
            SELECT ModAppPrx, UNTMSR
              INTO vModAppPrx, vUntMsr
              FROM UNTMSR, RBQ
              WHERE UNTMSR.IdtUntMsr = RBQ.IdtUntMsr
               AND  IdtRbq = tIdtRbqPen(i);
            PrxPen(tIdtRbqPen(i), vDatDebFct, vDatFinFct, vModAppPrx, vPrxUnt);
            vOldIdtRbqPen := tIdtRbqPen(i);
          END IF;
          ---------------------------------------------------------------------
          Err_Msg := 'Preparation de la table pour le mouvement exceptionnel';
          ---------------------------------------------------------------------
          k := k + 1;
          tIdtRbq(k) := tIdtRbqPen(i);
          tQteFct(k) := vQteFct;
          tDatDbt(k) := TO_NUMBER(TO_CHAR(vDatDbt,'J'));
          tDatFin(k) := TO_NUMBER(TO_CHAR(vDatFin,'J'));
          tPrxUnt(k) := vPrxUnt;
          tUntMsr(k) := vUntMsr;
          tIdtAgt(k) := pIdtAgt;
          tMntBas(k) := ROUND(tSldNiv(tIdxNiv(i)) / tMntNiv(tIdxNiv(i)) * (tMntHt(i) * gClcPenHt + tMntTva(i) * gClcPenTva),vArr);

              -- SJ 12 nov 2009 appliquer discount avant plafond
          -- tMntPen(k) := tQteFct(k) * tMntBas(k) * tPrxUnt(k)* vDiscountPen;
              -- CAL 09/12/2009 appliquer le discount APRES le plafond
              tMntPen(k) := tQteFct(k) * tMntBas(k) * tPrxUnt(k);

                  --05/02/2008 fiche 6664 - plafond de p�nalit�
                  --calcule de p�nalit�s d�j� factur�es
                  --24/09/2009 fiche 7692 - param plafond de p�nalit�

          vTMntPenAjust := vMntHtFacSansTimbre * vParamPlafond - NVL(vMntPenDejaFact,0);

                  IF vTMntPenAjust < 0 THEN
                    EXIT;
                  END IF;

                  vMntPenDejaFact := NVL(vMntPenDejaFact,0) + tMntPen(k);
                  IF NVL(vMntPenDejaFact,0) > vMntHtFacSansTimbre * vParamPlafond  THEN
                    tMntPen(k) := vTMntPenAjust;
                    EXIT;
                  END IF;

        END LOOP; -- tIdtRbqPen.First..tIdtRbqPen.Last
      END LOOP; -- EXIT when vDatDbt > vDatFin
      -------------------------------------------------------------------------
      Err_Msg := 'Mise a jour de la facture';
      -------------------------------------------------------------------------
      -- -- ** trtmsg01.WriteSimpleLogFile('PENALITES', 'Mise � jour de la facture');
      UPDATE FAC
        SET DatDrnPen = vDatFin
        WHERE IdtFac = pIdtFac;
      -------------------------------------------------------------------------
      Err_Msg := 'Bulk insert dans la table temporaire';
      -------------------------------------------------------------------------
      -- -- ** trtmsg01.WriteSimpleLogFile('PENALITES', 'tIdtRbq.Count = ' || to_char(tIdtRbq.Count));

      IF tIdtRbq.COUNT > 0 THEN
       -- -- ** trtmsg01.WriteSimpleLogFile('PENALITES', 'Bulk insert dans CLCPEN');
       FORALL i IN tIdtRbq.FIRST..tIdtRbq.LAST

         INSERT INTO CLCPEN (IdtAgt,
                             IdtRbq,
                             QteFct,
                             PrxUnt,
                             DatDbt,
                             DatFin,
                             MntHt,
                             UNTMSR,
                             MntBas)
                     VALUES (pIdtAgt,
                             tIdtRbq(i),
                             tQteFct(i),
                             tPrxUnt(i),
                             tDatDbt(i),
                             tDatFin(i),
                             tMntPen(i) * vDiscountPen,
                             tUntMsr(i),
                             tMntBas(i));


      END IF;  -- tIdtRbq.Count > 0
      -------------------------------------------------------------------------
      Err_Msg := 'Penalit�s calcul�es';
      -------------------------------------------------------------------------
      pCr := 1;
    END IF; -- tIdtRbqPen.Count > 0
  END IF; -- AplPenxFac(pIdtFac, pDatClc) = 1
  Trtmsg01.DeleteItem(Err_TableName);
  -- ** trtmsg01.WriteSimpleLogFile('PENALITES', ' <= ClcPenxFac()');

END ClcPenxFac;
-----------------------------------------------------------------------------
-----------------------------------------------------------------------------
-----------------------------------------------------------------------------
-- Proc�dure externe pouvant etre appel�e pour calculer les p�nalit�s
-- sur une facture. Elle est utilis�e � l'OET � partir de X7_TRTPEN01_SPC.X7_PenAppOpr
-- pour calculer au vol les p�nalit�s d'une facture dans le cas o� :
-- - ses p�nalit�s n'ont pas �t� calcul�es car elle �tait dans un lot lors du chgt de mois
-- - le client vient la payer le jour o� le collecteur la retourne au bureau.
PROCEDURE ClcPen1Fac (pIdtFac FAC.IdtFac%TYPE, pIdtAgt AGT.IdtAgt%TYPE)
IS
  vDatClc DATE;
  vCr NUMBER;
  rMVMEXCFCT MVMEXCFCT%ROWTYPE;
BEGIN
  -- ** trtmsg01.WriteSimpleLogFile('PENALITES', ' => ClcPen1Fac(' || to_char(pIdtFac) || ', ''' || pIdtAgt || ''')');

  Trtmsg01.InsertItem(Err_TableName,'CLCPEN1FAC');
  ChgPrm;
  IF gClcPenAct = 1 THEN
    SELECT sss_DatJou
      INTO vDatClc
      FROM SSS;
    SELECT IdtClt
      INTO rMVMEXCFCT.IdtClt
      FROM FAC
      WHERE IdtFac = pIdtFac;
    ---------------------------------------------------------------------------
    Err_Msg := 'Nettoyage de la table temporaire';
    ---------------------------------------------------------------------------
    DELETE CLCPEN
      WHERE IdtAgt = pIdtAgt;
    IF AplPenxClt(rMVMEXCFCT.IdtClt) = 1 THEN
      BEGIN
        -----------------------------------------------------------------------
        Err_Msg := 'Recherche du contrat de la facture';
        -----------------------------------------------------------------------
        SELECT IdtCtr
          INTO rMVMEXCFCT.IdtCtrDst
          FROM CTRFAC
          WHERE IdtFac = pIdtFac;
      EXCEPTION
        WHEN NO_DATA_FOUND THEN
          ---------------------------------------------------------------------
          Err_Msg := 'Traitement de facture sans contrat';
          ---------------------------------------------------------------------
          rMVMEXCFCT.IdtCtrDst := Trtfac01.X7_IdtCtr_CptClt(rMVMEXCFCT.IdtClt);
      END;
      ClcPenxFac(pIdtFac, vDatClc, pIdtAgt, vCr);
      IF vCr = 1 THEN
        rMVMEXCFCT.DatCrt    := vDatClc;
        rMVMEXCFCT.IdtAgtCrt := pIdtAgt;
        rMVMEXCFCT.IdtFacOrg := pIdtFac;
        -----------------------------------------------------------------------
        Err_Msg := 'Appel a l''insertion du mouvement';
        -----------------------------------------------------------------------
        InsMvmExcFct(rMVMEXCFCT);
        UPDATE CPTCLT
          SET DatMajCptClt = SYSDATE
          WHERE IdtClt    = rMVMEXCFCT.IdtClt
           AND  IdtCptClt = 1;
      END IF; -- vCr = 1
    END IF; -- AplPenxClt(rMVMEXCFCT.IdtClt) = 1
  END IF; -- gClcPenAct = 1
  Trtmsg01.DeleteItem(Err_TableName);
  -- ** trtmsg01.WriteSimpleLogFile('PENALITES', ' <= ClcPen1Fac()');
END ClcPen1Fac;
-----------------------------------------------------------------------------
-----------------------------------------------------------------------------
-----------------------------------------------------------------------------
-- Proc�dure de traitement batch des p�nalit�s. Elle est appel�e par la
-- chaine batch chaque nuit.
PROCEDURE CLCPEN (pIdtAgt AGT.IdtAgt%TYPE)
IS
  TYPE typIDTCLT IS TABLE OF CLT.IdtClt%TYPE;
  TYPE typIDTFAC IS TABLE OF FAC.IdtFac%TYPE;
  tIdtClt typIDTCLT;
  tIdtFac typIDTFAC;
  vIdtClt CLT.IdtClt%TYPE;
  vIdtCtr CTR.IdtCtr%TYPE;
  vDatClc DATE;
  vSwclcPen NUMBER;
  vCr NUMBER;
  rMVMEXCFCT MVMEXCFCT%ROWTYPE;
BEGIN
  Trtmsg01.InsertItem(Err_TableName,'CLCPEN');
  ChgPrm;
  IF gClcPenAct = 1 THEN
    SELECT TRUNC(sss_DatJou)
      INTO vDatClc
      FROM SSS;
    ---------------------------------------------------------------------------
    Err_Msg := 'Nettoyage de la table temporaire';
    ---------------------------------------------------------------------------
    DELETE CLCPEN
      WHERE IdtAgt = pIdtAgt;
--   On prends que les clients pour lesquelles il y a un solde global
--   si la table CPTCLT a ete mise a jour, et s'ils remplisent la condition
    SELECT IdtClt
      BULK COLLECT INTO tIdtClt
      FROM CPTCLT
      WHERE (CPTCLT.Sld01 > 0
             OR CPTCLT.DatMajSld IS NULL
             OR CPTCLT.DatMajSld < CPTCLT.DatMajCptClt)
--       and  IdtClt like '11%'
       AND  AplPenxClt(IdtClt) = 1;
    FOR i IN tIdtClt.FIRST..tIdtClt.LAST LOOP
      Err_IdtClt := tIdtClt(i);
      vSwClcPen := 0;
      vIdtClt := tIdtClt(i);
--      select IdtFac
--        bulk collect into tIdtFac
--        from FAC, OPR
--        where FAC.NumFct    = OPR.Rfr
--         and  OPR.IdtClt    = tIdtClt(i)
--         and  OPR.IdtCptClt = 1;
--   On prends que les factures pour lequelles il n'y a pas eu un calcul de penalit�s pour la periode
      SELECT IdtFac
        BULK COLLECT INTO tIdtFac
        FROM FAC
        WHERE FAC.IdtClt    = tIdtClt(i)
         -- CAL : Modification du test '<=' en '<', sinon on calcule un mois de trop !!!
         AND  TRUNC(NVL(DatDrnPen,DatExg)) < TRUNC(vDatClc)
         -- CAL : Evite de reprendre les factures ant�rieures � 2001 !!!!
         --       (qui ne sont pas soumises � p�nalit�s.)
         AND EXISTS (SELECT IdtFac
                  FROM X7.CTRFAC
                  WHERE CTRFAC.IdtFac = FAC.IdtFac
                   AND  CTRFAC.IdtPrdFac >= '200201')
         -- JLD - 23/12/2009 - on ne prends pas les factures annul�es
         AND fctann!=1;
      IF tIdtFac.COUNT <> 0 THEN
        FOR j IN tIdtFac.FIRST..tIdtFac.LAST LOOP
          Err_IdtFac := tIdtFac(j);
          BEGIN
            ---------------------------------------------------------------------
            Err_Msg := 'Recherche du contrat de la facture';
            ---------------------------------------------------------------------
            SELECT IdtCtr
              INTO rMVMEXCFCT.IdtCtrDst
              FROM CTRFAC
              WHERE IdtFac = tIdtFac(j);
          EXCEPTION
            WHEN NO_DATA_FOUND THEN
              -------------------------------------------------------------------
              Err_Msg := 'Traitement de facture sans contrat';
              -------------------------------------------------------------------
              rMVMEXCFCT.IdtCtrDst := Trtfac01.X7_IdtCtr_CptClt(tIdtClt(i));
          END;
          Err_IdtCtr := rMVMEXCFCT.IdtCtrDst;
          -----------------------------------------------------------------------
          Err_Msg := 'Appel du calcul par facture';
          -----------------------------------------------------------------------
          ClcPenxFac(tIdtFac(j), vDatClc, pIdtAgt, vCr);
          IF vCr = 1 THEN
            rMVMEXCFCT.IdtClt    := tIdtClt(i);
            rMVMEXCFCT.DatCrt    := vDatClc;
            rMVMEXCFCT.IdtAgtCrt := pIdtAgt;
            rMVMEXCFCT.IdtFacOrg := tIdtFac(j);
            ---------------------------------------------------------------------
            Err_Msg := 'Appel de l''insertion dans MVMEXCFCT';
            ---------------------------------------------------------------------
            InsMvmExcFct(rMVMEXCFCT);
            COMMIT;
            ---------------------------------------------------------------------
            Err_Msg := 'Penalit�s calcul�es pour cette facture';
            ---------------------------------------------------------------------
            vSwClcPen := 1;
          END IF; -- vCr = 1
        END LOOP; -- tIdtFac.First..tIdtFac.Last
      END IF;
      IF vSwClcPen = 1 THEN
        UPDATE CPTCLT
          SET DatMajCptClt = SYSDATE
          WHERE IdtClt    = tIdtClt(i)
           AND  IdtCptClt = 1;
        COMMIT;
      END IF; -- vSwClcPen = 1
    END LOOP; -- tIdtClt.First..tIdtClt.Last
  END IF;
  Trtmsg01.DeleteItem(Err_TableName);
  EXCEPTION
    WHEN OTHERS THEN
    ROLLBACK;
    Trtmsg01.Msgerr(
           Err_IdtPck,
           Err_idttrt,
           Err_Msg,
           Err_IdtClt,
           Err_IdtCtr,
           Err_IdtCpr,
           Err_NumCpr,
           Err_IdtFac,
           Err_NumFac,
           Err_IdtOprDbt,
           Err_IdtOprCrt,
           Err_TableName);
END CLCPEN;
-----------------------------------------------------------------------------
-----------------------------------------------------------------------------
-----------------------------------------------------------------------------
-- Creation de la facture pour les penalit�s. Facture cr��e au moment du paiement
-- � partir des mouvements exceptionnels, qui sont alors transform�s en rubriques
-- pour cette nouvelle facture.
-----------------------------------------------------------------------------
-- CAL 12/2009
-- GROSSE MODIFICATION :
-- On n'utilise plus du tout les mouvements exceptionnels (MVMEXCFCT).
-- La facture de p�nalit�s est cr��e directement � partir du montant calcul�
-- par PendingPenality().
-----------------------------------------------------------------------------
PROCEDURE CreFacMvmExc
   (pIdtClt    IN       CLT.IdtClt%TYPE,
    pIdtLotFac IN       LOTFAC.IdtLotFac%TYPE,
    pIdtLotRtg IN       OPR.IdtLotRtg%TYPE,
    pIdtTypRbr IN       TYPRBR.IdtTypRbr%TYPE,
    pIdtTypFct IN       TYPFCT.IdtTypFct%TYPE,
    pIdtAgt    IN       AGT.IdtAgt%TYPE,
    pIdtFacOrg IN       FAC.IdtFac%TYPE,
    pIdtFac    OUT      FAC.IdtFac%TYPE)
IS
  vNumLgnFct NUMBER;
  vIdtDvs    CPTCLT.IdtDvs%TYPE;
  vDatTauCnv TXCNV.DatTauCnv%TYPE;
  vIdtCtgClt CLT.IdtCtgClt%TYPE;
  vIdtCntOpr CLT.IdtCntOpr%TYPE;
  vIdtCodSns CLT.IdtCodSns%TYPE;
  vIdtCtr    CTR.IdtCtr%TYPE;
  vNbrMvmExcFct NUMBER;
  vMntHt     MVMEXCFCT.MntHt%TYPE;
  vMntTva    MVMEXCFCT.MntTva%TYPE;
  vQteFct    MVMEXCFCT.QteFct%TYPE;
  vDatDbt    MVMEXCFCT.DatDbt%TYPE;
  vDatFin    MVMEXCFCT.DatFin%TYPE;
  vUntMsr    MVMEXCFCT.UNTMSR%TYPE;
  vDatJou    DATE;
  vDliDatExg NUMBER;
  vBrdRgr    OPR.BrdRgr%TYPE;
  vDiscountPen OET_PENDIS.DISCOUNT%TYPE;
  vMntHtLgn  MVMEXCFCT.MntHt%TYPE;
  vMntTvaLgn MVMEXCFCT.MntTva%TYPE;
  vMntHtSum  MVMEXCFCT.MntHt%TYPE;
  vMntTvaSum MVMEXCFCT.MntTva%TYPE;
  vDatDbtPrd CTRFAC.DatDbtPrd%TYPE;
  vDatFinPrd CTRFAC.DatFinPrd%TYPE;
  vDatAppPen DATE;
  vDontLoop  NUMBER;
  vOnlyPendingPen NUMBER := 0;
  vId_oet_pendis_clt CLT.T3%TYPE;
  rMvmExcFct MVMEXCFCT%ROWTYPE;

BEGIN
  Trtmsg01.InsertItem(Err_TableName,'CREFACMVMEXC');
  -- ** trtmsg01.WriteSimpleLogFile('PENALITES',' => CreFacMvmExc(''' || pIdtClt || ''', ' || to_char(pIdtLotFac) || ', ' || pIdtLotRtg || ', ' || to_char(pIdtTypRbr) || ', ' || to_char(pIdtFacOrg) || ')');

  ---------------------------------------------------------------------------
  Err_Msg := 'Recherche d''un contrat pour le client';
  ---------------------------------------------------------------------------
  -- ***** Est-ce le bon contrat qui est retourn� ici ? Que se passe-t-il dans le
  -- ***** cas d'un client ayant plusieurs contrats ???????
  vIdtCtr := Trtfac01.X7_IDTCTR_CPTCLT(pidtclt);
  SELECT sss_DatJou
    INTO vDatJou
    FROM SSS;
  SELECT NVL(DliExgFacPen,0)
    INTO vDliDatExg
    FROM PRMGNR;
  IF vIdtCtr IS NULL THEN
    -------------------------------------------------------------------------
    Err_Msg := 'Contrat non trouv�';
    -- ** trtmsg01.WriteSimpleLogFile('PENALITES', 'CreFacMvmExc : contrat non trouv�');
    -------------------------------------------------------------------------
    GOTO fin;
  END IF;
  ---------------------------------------------------------------------------
  Err_Msg := 'Recherche du montant total � facturer';
  ---------------------------------------------------------------------------

  -- Si on est l� c'est qu'on a possiblement des p�nalit�s � calculer.
  -- Au cas o� la facture ferait partie d'un lot de routage/collecte,
  -- on va r�cup�rer la date de cr�ation du dernier lot actif. Cette
  -- date sera la date d'application des p�nalit�s. Si on n'a pas de lot actif
  -- on prend la date du jour.
  BEGIN
    SELECT MAX(DATCRT)
      INTO vDatAppPen
      FROM LOTRTG, RTG, FAC
      WHERE LOTRTG.IdtLotRtg  = RTG.IdtLotRtg
       AND  LOTRTG.DatFinRtg IS NULL
       AND  RTG.IdtCodObsRtg IS NULL
       AND  RTG.IdtTypRtg     = 2
       AND  RTG.Rfr           = FAC.NUMFCT
       AND  FAC.IdtFac        = pIdtFacOrg;

     EXCEPTION WHEN OTHERS
       -- Si on a rien trouv�
       THEN vDatAppPen := SYSDATE;

  END;

  -- S�curit� :
  IF vDatAppPen IS NULL THEN
     vDatAppPen := SYSDATE;
  END IF;

  -- Ici on va donc calculer les p�nalit�s pour la date concern�e.
  GetPendingPenality(pIdtFacOrg, vDatAppPen, CurrentIdtAgt, rMvmExcFct);
  IF NVL(rMvmExcFct.MntHT, 0) = 0 THEN
    -------------------------------------------------------------------------
    Err_Msg := 'Pas de p�nalit� � calculer';
    -- ** trtmsg01.WriteSimpleLogFile('PENALITES', 'CreFacMvmExc : Pas de p�nalit� � calculer -> FIN');
    -------------------------------------------------------------------------
    GOTO FIN;
  END IF;

  SELECT NVL(FAC.BrdRgr,FAC.NUMFCT)
    INTO vBrdRgr
    FROM OPR,FAC
    WHERE OPR.Rfr = FAC.NUMFCT
     AND  OPR.IdtTypOpr = 1
     AND  FAC.IdtFac = pIdtFacOrg;

  -- ** trtmsg01.WriteSimpleLogFile('PENALITES',' => CreFacMvmExc : vBrdRgr = ' || vBrdRgr);

  ---------------------------------------------------------------------------
  Err_Msg := 'On efface des anciennes factures de p�nalit�';
  ---------------------------------------------------------------------------
  DELETE LGNFAC
    WHERE IdtFac IN (SELECT IdtFac
                       FROM FAC
                       WHERE BrdRgr = vBrdRgr
                        AND  NUMFCT = '1'
                        AND  IdtTypFct = cTypFctPen);
  DELETE CTRFAC
    WHERE IdtFac IN (SELECT IdtFac
                       FROM FAC
                       WHERE BrdRgr = vBrdRgr
                        AND  NUMFCT = '1'
                        AND  IdtTypFct = cTypFctPen);
  DELETE FAC
    WHERE BrdRgr = vBrdRgr
     AND  NUMFCT = '1'
     AND  IdtTypFct = cTypFctPen;

  ---------------------------------------------------------------------------
  Err_Msg := 'Attribution du num�ro de facture';
  ---------------------------------------------------------------------------
  SELECT numfac.NEXTVAL
    INTO pIdtfac
    FROM dual;

  -- ** trtmsg01.WriteSimpleLogFile('PENALITES',' => CreFacMvmExc : pIdtfac = ' || to_char(pIdtfac));

  ---------------------------------------------------------------------------
  Err_Msg := 'Recherche du code devise';
  ---------------------------------------------------------------------------
  SELECT idtdvs
    INTO vIdtDvs
    FROM CPTCLT
   WHERE IdtClt    = pIdtClt
    AND  IdtCptClt = 1;
  ---------------------------------------------------------------------------
  Err_Msg := 'Recherche du taux de conversion de la devise';
  ---------------------------------------------------------------------------
  SELECT MAX(TRUNC(dattaucnv))
    INTO vDatTauCnv
    FROM TXCNV
   WHERE IdtDvs = vIdtDvs
    AND  TRUNC(DatTauCnv) <= TRUNC(vDatJou);
  ---------------------------------------------------------------------------
  Err_Msg := 'Recherche des cat�gorie Client, centre op�rationnel, Code sensibilit�';
  ---------------------------------------------------------------------------
  SELECT IdtCtgClt,
         IdtCntOpr,
         IdtCodSns
    INTO vIdtCtgClt,
         vIdtCntOpr,
         vIdtCodSns
    FROM CLT
    WHERE IdtClt    = pIdtClt;

  ---------------------------------------------------------------------------
  Err_Msg := 'Insertion dans la table FAC';
  ---------------------------------------------------------------------------
  INSERT INTO FAC
         (IDTFAC,
          NUMFCT,
          IDTCLT,
          IDTTYPFCT,
          DATCLC,
          DATCNV,
          DATEXG,
          CATCLT,
          IDTDVS,
          MNTHT,
          MNTTVA,
          IDTCODSNS,
          IDTCNTOPR,
          CODVLD,
          FCTANN,
          IDTLOTFAC,
          BrdRgr,
          IDTFACORG)
   VALUES(pIdtFac,
          '1',
          pIdtClt,
          pIdtTypFct,
          TRUNC(vDatJou),
          vDatTauCnv,
          TRUNC(vDatJou) + vDliDatExg,
          vIdtCtgClt,
          vIdtDvs,
          rMvmExcFct.MntHT,
          rMvmExcFct.MntTVA,
          vIdtCodSns,
          vIdtCntOpr,
          1,
          0,
          pIdtLotFac,
          vBrdRgr,
          rMvmExcFct.IdtFacOrg);

      -----------------------------------------------------------------------
      Err_Msg := 'Insertion dans la table LGNFAC';
      -----------------------------------------------------------------------
      -- Modif CAL - 07/12/2003 : Ajout de IdtTax.
      INSERT INTO LGNFAC
             (IDTFAC,
              NUMLGNFCT,
              IDTRBQ,
              QTEFCT,
              PRXUNT,
              DATDBTPRD,
              DATFINPRD,
              MNTHT,
              MNTTVA,
              IDTTAX,
              UNTMSR,
              IDTFACORG,
              MNTBAS)
      VALUES (pidtfac,
              1,
              rMvmExcFct.IdtRbq,
              rMvmExcFct.QteFct,
              rMvmExcFct.PrxUnt,
              rMvmExcFct.DatDbt,
              rMvmExcFct.DatFin,
              rMvmExcFct.MntHT,
              rMvmExcFct.MntTVA,
              rMvmExcFct.IdtTax,
              rMvmExcFct.UNTMSR,
              rMvmExcFct.IdtFacOrg,
              rMvmExcFct.MntBas);

  -- ** trtmsg01.WriteSimpleLogFile('PENALITES',' => CreFacMvmExc : Facture de p�nalit� cr��e - ' || to_char(pIdtfac));
  -----------------------------------------------------------------------
  Err_Msg := 'Ajout de la facture dans CTRFAC';
  -----------------------------------------------------------------------
  CreCtrFac(pIdtFacOrg, pIdtFac);

  -------------------------------------------------------------------------
  Err_Msg := 'Mise a jour de la facture';
  -------------------------------------------------------------------------
  -- ** trtmsg01.WriteSimpleLogFile('PENALITES',' => CreFacMvmExc : Mise � jour de la facture d''origine (DatDrnPen = ' || to_char(rMvmExcFct.DatFin) || ')');
  UPDATE FAC
    SET DatDrnPen = rMvmExcFct.DatFin
    WHERE IdtFac = pIdtFacOrg;


<<FIN>>
  NULL;
  -- ** trtmsg01.WriteSimpleLogFile('PENALITES', ' <= CreFacMvmExc');
  Trtmsg01.DeleteItem(Err_TableName);
END CreFacMvmExc;
-----------------------------------------------------------------------------
-----------------------------------------------------------------------------
-----------------------------------------------------------------------------
-- Cette proc�dure permet de cr�er une ligne dans CTRFAC pour une facture
-- de p�nalit� ou de timbre. Le principe est simple : on va cloner la ligne
-- de CTRFAC concernant la facture � l'origine de la p�nalit� ou du timbre.
-- Si il n'y a rien dans CTRFAC, alors on ne met rien. Sinon, on clone en
-- rempla�ant l'IDTFAC d'origine par l'IDTFAC de la facture de penalit� ou
-- de timbre.
PROCEDURE CreCtrFac(pIdtFacOrg FAC.IdtFac%TYPE, pIdtFacPoT FAC.IdtFac%TYPE)
IS
  rCtrFac CTRFAC%ROWTYPE;
BEGIN
  -- ** trtmsg01.WriteSimpleLogFile('PENALITES', ' => CreCtrFac(' || to_char(pIdtFacOrg) || ', ' || to_char(pIdtFacPoT) || ')');
  -- On r�cup�re les donn�es de CTRFAC
  SELECT
    Idtctr,
    Numavn,
    Idtmsgapl,
    Idtcycfac,
    Idtprdfac,
    Datdbtprd,
    Datfinprd
  INTO
    rCtrFac.Idtctr,
    rCtrFac.Numavn,
    rCtrFac.Idtmsgapl,
    rCtrFac.Idtcycfac,
    rCtrFac.Idtprdfac,
    rCtrFac.Datdbtprd,
    rCtrFac.Datfinprd
  FROM
    X7.CTRFAC
  WHERE IdtFac = pIdtFacOrg;
  -- Et on ins�re en repla�ant juste l'IDTFAC.
  -- (Si le SELECT ci-dessous ne retourne rien,
  -- on sort de la proc. par l'exception finale
  -- sans passer pqr ici
  INSERT INTO X7.CTRFAC
  (
    Idtctr,
    IdtFac,
    Numavn,
    Idtmsgapl,
    Idtcycfac,
    Idtprdfac,
    Datdbtprd,
    Datfinprd
  )
  VALUES
  (
    rCtrFac.Idtctr,
    pIdtFacPoT,
    rCtrFac.Numavn,
    rCtrFac.Idtmsgapl,
    rCtrFac.Idtcycfac,
    rCtrFac.Idtprdfac,
    rCtrFac.Datdbtprd,
    rCtrFac.Datfinprd
  );

  -- ** trtmsg01.WriteSimpleLogFile('PENALITES', ' <= CreCtrFac() : OK');

EXCEPTION
  WHEN NO_DATA_FOUND THEN
    -- on ne fait rien...
    -- ** trtmsg01.WriteSimpleLogFile('PENALITES', ' <= CreCtrFac() : ERREUR NO_DATA_FOUND');
    NULL;
END CreCtrFac;
-----------------------------------------------------------------------------
-- Cette fonction retourne la facture de service � l'origine d'une facture
-- de timbre ou de p�nalit�s.
-- Ceci est utilis� pour l'impression de la facture � partir d'une r�f�rence
-- de facture de timbre ou p�nalit�s.
-----------------------------------------------------------------------------
FUNCTION GetFacOrgxFac(pIdtFac FAC.IdtFac%TYPE, pIdtOpr OPR.IdtOpr%TYPE)
RETURN FAC.IdtFac%TYPE
IS
/*
  On utilise pour cela le bordereau attach� � la facture (FAC.BRDRGR).
  Le principe de fonctionnement est :
  On cherche l'IDTFAC de la facture dont le N� est �gal au n� de bordereau.
  Je ne g�re pas d'exception ici. Je veux que le process plante en cas
  d'erreur (typiquement : pas assez ou trop de donnees.)
*/
vIdtFac FAC.IdtFac%TYPE;
vIdtFacOrg FAC.IdtFac%TYPE;
vNumFct FAC.NUMFCT%TYPE;
vIdtTypFct FAC.IDTTYPFCT%TYPE;
vBrdRgr FAC.BRDRGR%TYPE;
BEGIN
  -- On r�cup�re le n� de bordereau de la facture donn�es en param.
  -- Si pIdtFac est NULL, il faut utiliser pIdtOpr � la place...
  IF pIdtFac IS NULL THEN
      BEGIN
        SELECT NUMFCT, FAC.BrdRgr, IdtFac
          INTO vNumFct, vBrdRgr, vIdtFac
          FROM FAC, OPR
          WHERE OPR.IdtOpr = pIdtOpr
            AND OPR.Rfr = FAC.NUMFCT;
        EXCEPTION
            WHEN NO_DATA_FOUND THEN
                RETURN NULL;
        END;
  ELSE
      vIdtFac := pIdtFac;
    SELECT NUMFCT, BrdRgr, IdtTypFct
      INTO vNumFct, vBrdRgr, vIdtTypFct
      FROM FAC
      WHERE IdtFac = pIdtFac;
  END IF;

  -- Si IdtTypFct vaut 2, c'est une facture d'annulation. Dans ce cas
  -- on doit garder en retour cet IdtFac re�u en param...
  IF vIdtTypFct = '2' THEN
    RETURN vIdtFac;
  END IF;

  -- Si NumFct = BrdRgr, c'est que nous avons d�j� la facture d'origine !
  -- On retourne directement le pIdtFac re�u en param.
  IF vNumFct = vBrdRgr THEN
    RETURN vIdtFac;
  END IF;
  -- Sinon il faut rechercher la facture d'origine, ce
  -- qui n'est pas compliqu�...
  -- Evidemment cela suppose que le n� de bordereau soit d�fini !!!
  SELECT IdtFac
    INTO vIdtFacOrg
    FROM FAC
    WHERE NUMFCT = vBrdRgr;
  -- On retourne directement ceci :
  RETURN vIdtFacOrg;
END;
-----------------------------------------------------------------------------
-- Cette fonction va retourner l'�ventuelle diff�rence de TVA (montant)
-- entre ce qui a �t� calcul� sur la facture X7 en data de validation
-- et ce qui doit etre pay� aujourd'hui par un client de ONDEO-LIBAN.
-- VERSION FILTRANT LES PENALITES
-----------------------------------------------------------------------------
FUNCTION AplTvaxFac (pIdtOpr OPR.IdtOpr%TYPE, pIdtTax TAX.IDTTAX%TYPE)
  RETURN NUMBER
IS
  vMntTva   NUMBER;
BEGIN
  -- Le principe de calcul va �tre simple, encore que...
  -- Au Liban X7 fonctionne avec des bordereaux regroupant diff�rentes
  -- factures. Nous devons prendre tous les �l�ments (lignes de factures)
  -- des factures du bordereau. Le bordereau sera consid�r� dans la requete
  -- comme une grosse facture...

  --SJ 19/02/2010 - cette fonction �tait utilis� que dans la procedure CreFacTimxOpr - pour avoir la TVA recalcul�e
  --le principe change: plus de recalcule de tva; donc cette fonction doit retourner 0 tout le temps
  -- pour cela mise en commentaire le requ�te select suivante
  --SELECT SUM((LGNFAC.MntHt * TAX.Tau / 100) - LGNFAC.MntTva)
  --  INTO vMntTva
  --FROM X7.TAX, X7.LGNFAC, X7.FAC, X7.OPR
  -- WHERE OPR.IdtOpr = pIdtOpr
  --  AND LGNFAC.IdtTax = pIdtTax
  --  AND LGNFAC.IdtRbq <> cIdtRbqPen
  --  AND FAC.FctAnn = 0
  --  AND FAC.NUMFCT <> '1'
  --  AND OPR.BrdRgr = FAC.BrdRgr
  --  AND FAC.IdtFac = LGNFAC.IdtFac
  --  AND TAX.IdtTax = LGNFAC.IdtTax;
   --end SJ 19/02/2010
  RETURN TRUNC(NVL(vMntTva, 0));
END;
-----------------------------------------------------------------------------
-- Cette fonction va retourner l'�ventuelle diff�rence de TVA (montant)
-- entre ce qui a �t� calcul� sur la facture X7 en data de validation
-- et ce qui doit etre pay� aujourd'hui par un client de ONDEO-LIBAN.
-- VERSION NE TRAITANT QUE LES PENALITES
-----------------------------------------------------------------------------
FUNCTION AplTvaPenxFac (pIdtOpr OPR.IdtOpr%TYPE, pIdtTax TAX.IDTTAX%TYPE)
  RETURN NUMBER
IS
  vMntTva   NUMBER;
BEGIN
  -- Le principe de calcul va �tre simple, encore que...
  -- Au Liban X7 fonctionne avec des bordereaux regroupant diff�rentes
  -- factures. Nous devons prendre tous les �l�ments (lignes de factures)
  -- des factures du bordereau. Le bordereau sera consid�r� dans la requete
  -- comme une grosse facture...
  SELECT SUM((LGNFAC.MntHt * TAX.Tau / 100) - LGNFAC.MntTva)
    INTO vMntTva
  FROM X7.TAX, X7.LGNFAC, X7.FAC, X7.OPR
  WHERE OPR.IdtOpr = pIdtOpr
    AND LGNFAC.IdtTax = pIdtTax
    AND LGNFAC.IdtRbq in (cIdtRbqPen, cIdtRbqPenIrr)
    AND FAC.FctAnn = 0
    AND FAC.NUMFCT <> '1'
    AND OPR.BrdRgr = FAC.BrdRgr
    AND FAC.IdtFac = LGNFAC.IdtFac
    AND TAX.IdtTax = LGNFAC.IdtTax;
  RETURN TRUNC(NVL(vMntTva, 0));
END;
-----------------------------------------------------------------------------
-- Cette fonction va retourner l'�ventuelle diff�rence de TVA (montant)
-- entre ce qui a �t� calcul� sur les factures X7 de cet �ch�ancier en date
-- de validation et ce qui doit etre pay� aujourd'hui par un client
-- de ONDEO-LIBAN.
-- Cette fonction est construite donc sur le modele de la pr�c�dente avec
-- une indirection de plus pour l'�ch�ancier.
-----------------------------------------------------------------------------
FUNCTION AplTvaxEch (pIdtOpr OPR.IdtOpr%TYPE, pIdtTax TAX.IDTTAX%TYPE)
  RETURN NUMBER
IS
  vMntTva     NUMBER;   -- TVA diff�rentielle
  vPropEch    NUMBER;   -- Proportion Ech�ance / Ech�ancier
  vMntEch     NUMBER;   -- Mnt Ech�ance
  vMntEchTot  NUMBER;   -- Mnt total de l'Ech�ancier
  vEchPmt     OPR.ECHPMT%TYPE;
BEGIN
  -- Dans le cas d'une �ch�ance, il faut connaitre la proportion de l'�ch�ance
  -- dans l'�ch�ancier.
  -- On r�cup�re les donn�es de l'�ch�ance
  SELECT ECHPMT, Mnt
    INTO vEchPmt, vMntEch
  FROM OPR
  WHERE IdtOpr = pIdtOpr;
  -- et celle de l'�ch�ancier :
  SELECT ABS(Mnt)
    INTO vMntEchTot
  FROM OPR
  WHERE ECHPMT = vEchPmt
    AND IdtTypOpr = 6;
  -- La proportion est donc :
  vPropEch := vMntEch / vMntEchTot;
  -- Le principe de calcul va �tre simple, encore que...
  -- Au Liban X7 fonctionne avec des bordereaux regroupant diff�rentes
  -- factures. Nous devons prendre tous les �l�ments (lignes de factures)
  -- des factures du bordereau. L'�ch�ancier sera consid�r� dans la requete
  -- comme une grosse facture...
  -- La jointure sur la table TAX permet de controler qu'on
  -- appelle une taxe correctement d�finie.
  SELECT SUM((LGNFAC.MntHt * TAX.Tau / 100) - LGNFAC.MntTva)
    INTO vMntTva
  FROM X7.TAX, X7.LGNFAC, X7.FAC, X7.FacturesxEcheancier
  WHERE FacturesxEcheancier.Rfr_Ech = vEchPmt
    AND LGNFAC.IdtTax = pIdtTax
    AND FAC.FctAnn = 0
    AND FAC.NUMFCT <> '1'
    AND FAC.IdtFac = LGNFAC.IdtFac
    AND FacturesxEcheancier.Rfr_Fac = FAC.NUMFCT
    AND TAX.IdtTax = LGNFAC.IdtTax;
  -- apr�s cette requete, vMntTva est le montant TOTAL de TVA
  -- diff�rentielle pour l'ECHEANCIER !
  -- Le resultat final sera en proportion de l'�ch�ance dans
  -- cet �ch�ancier :
  vMntTva := NVL(vMntTva, 0) * vPropEch;
  RETURN TRUNC(NVL(vMntTva, 0));
END;
-----------------------------------------------------------------------------
-- Enfin, dans la suite logique des deux pr�c�dentes, on trouve ici
-- la fonction qui sera appel�e pour savoir si on doit appliquer
-- un diff�rentiel de TVA pour une OPR (les deux pr�c�dentes sont pour
-- une facture et une �ch�ance... Celle-ci sera plus g�n�rale.
-----------------------------------------------------------------------------
FUNCTION AplTvaxOpr (pIdtOpr OPR.IdtOpr%TYPE)
RETURN NUMBER
IS
  vIdtTypOpr    OPR.IdtTypOpr%TYPE;
BEGIN
  -- On r�cup�re juste le type d'op�ration pour faire l'aiguillage
  SELECT IdtTypOpr
    INTO vIdtTypOpr
    FROM OPR
    WHERE IdtOpr = pIdtOpr;
  IF vIdtTypOpr = 1 THEN
    -- C'est une facture :
    IF AplTvaxFac(pIdtOpr, 'TVAF') <> 0 THEN
      RETURN 1;
    END IF;
    IF AplTvaxFac(pIdtOpr, 'TVAM') <> 0 THEN
      RETURN 1;
    END IF;
    RETURN 0;
  END IF;
  IF vIdtTypOpr = 7 THEN
    -- C'est une �ch�ance :
    IF AplTvaxEch(pIdtOpr, 'TVAF') <> 0 THEN
      RETURN 1;
    END IF;
    IF AplTvaxEch(pIdtOpr, 'TVAM') <> 0 THEN
      RETURN 1;
    END IF;
    RETURN 0;
  END IF;
  -- Rien � faire pour toutes les autres op�rations...
  RETURN 0;
END;
-----------------------------------------------------------------------------
-- Le groupe de fonctions ci-dessous permet de simplifier le codage de la vue
-- X7_DIST_OET. Ces fonctions retournent les montants n�cessaires �
-- l'impression de la facture dans les deux cas possibles :
-- 1/ toutes les factures du bordereau existent (TRT2005/EdtEpr01)
-- 2/ les factures du bordereau n'existent pas encore (Carnet de collecte)
--
-- Ces fonctions ne sont applicables qu'aux factures 'principales', elles
-- donneront des r�sultats incoh�rents pour des factures de timbres ou de p�nalit�s.
-----------------------------------------------------------------------------
-----------------------------------------------------------------------------
-- Ceci retourne le montant HT d'une facture, hors timbre, hors p�nalit�s.
-----------------------------------------------------------------------------
FUNCTION MntSvcHtxFac (pIdtFac FAC.IdtFac%TYPE)
RETURN NUMBER
IS
  vMntHT NUMBER;
BEGIN
  SELECT SUM(MntHT)
    INTO vMntHT
  FROM LGNFAC
  WHERE IdtFac = pIdtFac
    AND IdtRbq NOT IN (cIdtRbqPen, cIdtRbqPenIrr, cIdtRbqTim);
  RETURN vMntHT;
END;
-----------------------------------------------------------------------------
-- Ceci retourne le montant de TVA d'une facture, hors timbre, hors p�nalit�s,
-- en utilisant la TVA DU JOUR !!! Pas la TVA de la date de calcul...
-----------------------------------------------------------------------------
FUNCTION MntSvcTvaTodayxFac (pIdtFac FAC.IdtFac%TYPE)
RETURN NUMBER
IS
  vMntTva NUMBER;
BEGIN
/* BPZ Plus de recalcul de TVA
  SELECT SUM(MntHT * TAX.Tau / 100)
    INTO vMntTva
  FROM TAX, LGNFAC
  WHERE IdtFac = pIdtFac
    AND IdtRbq NOT IN (cIdtRbqPen, cIdtRbqTim)
    AND LGNFAC.IdtTax IS NOT NULL
    AND LGNFAC.IdtTax = TAX.IdtTax;

  -- Modif CAL 22/03/2006 :
  -- Il peut y avoir un arrondi au niveau de la TVA et on prend la livre
  -- sup�rieure...
  -- Modif CAL 05/05/2006 : On prend finalement la livre inf�rieure
  vMntTva := NVL(vMntTva,0);
  if vMntTva <> trunc(vMntTva) then
--    vMntTva := trunc(vMntTva) + 1;
    vMntTva := trunc(vMntTva);
  end if;
*/
  vMntTva := MntSvcTvaxFac(pIdtFac);

  RETURN TRUNC( NVL(vMntTva,0) );
END;
-- BPZ
FUNCTION MntSvcTvaxFac (pIdtFac FAC.IdtFac%TYPE)
RETURN NUMBER
IS
  vMntTva NUMBER;
BEGIN
  SELECT SUM(MntTVA)
    INTO vMntTva
  FROM  LGNFAC
  WHERE IdtFac = pIdtFac
    AND IdtRbq NOT IN (cIdtRbqPen, cIdtRbqPenIrr, cIdtRbqTim)
    AND LGNFAC.IdtTax IS NOT NULL;

  RETURN TRUNC( NVL(vMntTva,0) );
END;
-----------------------------------------------------------------------------
-- Cette fonction va retourner le montant de TVA applicables aujourd'hui
-- pour une �ch�ance.
-- Ceci est utilis� pour l'impression de l'�ch�ance.
-- Cette fonction est construite donc sur le modele de AplTvaxEch.
-----------------------------------------------------------------------------
FUNCTION MntTvaxEch (pIdtOpr OPR.IdtOpr%TYPE, pIdtTax TAX.IDTTAX%TYPE)
  RETURN NUMBER
IS
  vMntTva     NUMBER;   -- TVA diff�rentielle
  vPropEch    NUMBER;   -- Proportion Ech�ance / Ech�ancier
  vMntEch     NUMBER;   -- Mnt Ech�ance
  vMntEchTot  NUMBER;   -- Mnt total de l'Ech�ancier
  vEchPmt     OPR.ECHPMT%TYPE;
BEGIN
  -- Dans le cas d'une �ch�ance, il faut connaitre la proportion de l'�ch�ance
  -- dans l'�ch�ancier.
  -- On r�cup�re les donn�es de l'�ch�ance
  SELECT ECHPMT, Mnt
    INTO vEchPmt, vMntEch
  FROM OPR
  WHERE IdtOpr = pIdtOpr;
  -- et celle de l'�ch�ancier :
  SELECT ABS(Mnt)
    INTO vMntEchTot
  FROM OPR
  WHERE ECHPMT = vEchPmt
    AND IdtTypOpr = 6;
  -- La proportion est donc :
  vPropEch := vMntEch / vMntEchTot;
  -- Le principe de calcul va �tre simple, encore que...
  -- Au Liban X7 fonctionne avec des bordereaux regroupant diff�rentes
  -- factures. Nous devons prendre tous les �l�ments (lignes de factures)
  -- des factures du bordereau. L'�ch�ancier sera consid�r� dans la requete
  -- comme une grosse facture...
  -- La jointure sur la table TAX permet de controler qu'on
  -- appelle une taxe correctement d�finie.
  SELECT SUM(LGNFAC.MntHt * TAX.Tau / 100)
    INTO vMntTva
  FROM X7.TAX, X7.LGNFAC, X7.FAC, X7.FacturesxEcheancier
  WHERE FacturesxEcheancier.Rfr_Ech = vEchPmt
    AND LGNFAC.IdtTax = pIdtTax
    AND FAC.FctAnn = 0
    AND FAC.NUMFCT <> '1'
    AND FAC.IdtFac = LGNFAC.IdtFac
    AND FacturesxEcheancier.Rfr_Fac = FAC.NUMFCT
    AND TAX.IdtTax = LGNFAC.IdtTax;
  -- apr�s cette requete, vMntTva est le montant TOTAL de TVA
  -- diff�rentielle pour l'ECHEANCIER !
  -- Le resultat final sera en proportion de l'�ch�ance dans
  -- cet �ch�ancier :
  vMntTva := NVL(vMntTva, 0) * vPropEch;
  RETURN TRUNC(NVL(vMntTva, 0));
END;

--------------------------------------------------------------------
PROCEDURE AnnuPenalites(pNumFct FAC.NUMFCT%TYPE, pDatFin MVMEXCFCT.DATFIN%TYPE, pErrorMsg OUT VARCHAR2)
--------------------------------------------------------------------
-- Proc�dure assurant l'effacement des p�nalit�s d'une facture...
-- Elle demande en param�tre, le N� de la facture d'origine et la
-- date de fin des p�nalit�s � conserver.
-- Cette fonction controle que la facture n'est pas d�j� imprim�e.
-- C.A. LEBRUN 09/2005
--------------------------------------------------------------------
IS
  vImprime NUMBER;
  vIDtFac FAC.IDTFAC%TYPE;

BEGIN
  pErrorMsg := NULL;

  -- On r�cup�re la date d'impression de la facture dans OPR :
  BEGIN
    -- 0 si c'est pas imprim�, 1 dans le cas contraire.
    SELECT DECODE(NVL(OPR.DatImp, TO_DATE('01-JAN-1900')),
                  TO_DATE('01-JAN-1900'), 0,
                  1),
           FAC.IdtFac
      INTO vImprime,
           vIdtFac
    FROM FAC, OPR
    WHERE RFR = pNumFct
      AND FAC.NUMFCT = OPR.Rfr;

  EXCEPTION
    WHEN NO_DATA_FOUND THEN
      pErrorMsg := 'Facture inexistante / Bill does not exist';
      RETURN;
  END;

  -- Si elle est imprim�e, alors ne faisons rien...
  IF vImprime = 1 THEN
    pErrorMsg := 'Facture deja imprimee / Bill already printed';
    RETURN;
  END IF;

  -- On efface les p�nalit�s associ�es ...
  DELETE MVMEXCFCT
    WHERE IdtFacOrg = vIdtFac
      AND DatFin > pDatFin;

EXCEPTION
  WHEN OTHERS THEN
    -- On retourne l'erreur d'Oracle...
    pErrorMsg := SQLERRM;
END;

-----------------------------------------------------------------------------
-- SJ 04 nov 2009 ajouter le montant d'arrondi
-----------------------------------------------------------------------------
FUNCTION MntArr (pIdtFac FAC.IdtFac%TYPE)
  RETURN NUMBER
IS
  vMntHtArr NUMBER;
  vBrdRgr FAC.Brdrgr%TYPE;
BEGIN
  vMntHtArr := 0;

  -- On r�cup�re le bordereau de regroupement de cette facture
  SELECT BrdRgr INTO vBrdRgr
  FROM FAC
  WHERE IdtFac = pIdtFac;

  SELECT LGNFAC.mntht INTO vMntHtArr FROM FAC, LGNFAC WHERE FAC.idtfac=LGNFAC.idtfac AND idttypfct=102 AND brdrgr=vBrdRgr AND idtrbq='ARROND';

  RETURN vMntHtArr;
EXCEPTION WHEN OTHERS THEN vMntHtArr :=0;
 RETURN vMntHtArr;
END;

-----------------------------------------------------------------------------
-- SJ 06 nov 2009 ajouter la fonction pendingpenality -
-- impossible d'utiliser clcpen1fac car on fait des DML qui ne sont pas
-- support�s dans req sql pour afficher le solde en compta client
-----------------------------------------------------------------------------
FUNCTION PendingPenality(pIdtFac FAC.IdtFac%TYPE, pDatClc DATE, pIdtAgt AGT.IdtAgt%TYPE,pAvecOuSansTVA NUMBER)
--pAvecOuSansTVA = 1 signifie mntht + mntTVA
--pAvecOuSansTVA = 0 signifie mntht
--pAvecOuSansTVA = 2 mntTVA
RETURN NUMBER
IS
    rMvmExcFct MVMEXCFCT%ROWTYPE;
    vRetour NUMBER;
	vIdtClt CLT.IdtClt%TYPE;
BEGIN
  -- ** trtmsg01.WriteSimpleLogFile('PENALITES', ' => PendingPenality(' || to_char(pIdtFac) || ', ' || to_char(pDatClc, 'DD-MM-YYYY') || ', ''' || pIdtAgt || ''', ' || to_char(pAvecOuSansTVA) || ')');

 SELECT idtclt INTO vIdtClt FROM FAC WHERE idtfac = pIdtFac;

 IF AplPenxClt(vIdtClt) = 1 THEN
    GetPendingPenality(pIdtFac, pDatClc , pIdtAgt, rMvmExcFct);

    IF pAvecOuSansTVA = 0 THEN
        vRetour := NVL(rMvmExcFct.MntHT, 0);
    ELSE IF pAvecOuSansTVA = 1 THEN
    vRetour := NVL(rMvmExcFct.MntHT, 0) + NVL(rMvmExcFct.MntTVA, 0);
    ELSE IF pAvecOuSansTVA = 2 THEN
        vRetour := NVL(rMvmExcFct.MntTVA, 0);
    END IF;
    END IF;
    END IF;

  -- ** trtmsg01.WriteSimpleLogFile('PENALITES', ' <= PendingPenality() -> ' || to_char(vRetour));
  RETURN vRetour;
 ELSE
  RETURN 0;
 END IF;
END;

----------------------------------------------------------------------------------------
-- Version en proc�dure qui retourne toute une ligne de mouvement exceptionnel.
-- Ceci permet d'avoir tous les d�tails pour enregistrements de la ligne de facture.
----------------------------------------------------------------------------------------
-- Modif : CAL sur le mod�le fourni par SJ
--  Transformation de fonction en proc�dure
--  Ajout du param�tre OUT pMvmExcFct pour transmettre les valeurs
----------------------------------------------------------------------------------------

PROCEDURE GetPendingPenality(
    pIdtFac FAC.IdtFac%TYPE,
    pDatClc DATE,
    pIdtAgt AGT.IdtAgt%TYPE,
    pMvmExcFct IN OUT MVMEXCFCT%ROWTYPE)

IS
 pMntPendingPenality NUMBER;
  -- Ici ce sont des TYPES tableaux
  TYPE typIDTRBQ IS TABLE OF RBQ.IdtRbq%TYPE INDEX BY BINARY_INTEGER;
  TYPE typQTEFCT IS TABLE OF MVMEXCFCT.QteFct%TYPE INDEX BY BINARY_INTEGER;
  TYPE typPRXUNT IS TABLE OF MVMEXCFCT.PrxUnt%TYPE INDEX BY BINARY_INTEGER;
  TYPE typDATE   IS TABLE OF NUMBER INDEX BY BINARY_INTEGER;
--  TYPE typMNT    is table of MVMEXCFCT.MntHt%TYPE index by binary_integer;
  TYPE typMNT    IS TABLE OF NUMBER INDEX BY BINARY_INTEGER;
  TYPE typUNTMSR IS TABLE OF MVMEXCFCT.UNTMSR%TYPE INDEX BY BINARY_INTEGER;
  TYPE typNIVPRR IS TABLE OF NUMBER INDEX BY BINARY_INTEGER;
  TYPE typIDTAGT IS TABLE OF AGT.IdtAgt%TYPE INDEX BY BINARY_INTEGER;
  TYPE typNbr    IS TABLE OF NUMBER INDEX BY BINARY_INTEGER;
  -- Ici ce sont les variables d�clar�es avec les types ci-dessus
  tIdtRbq    typIDTRBQ;
  tIdtRbqPen typIDTRBQ;
  tQteFct    typQTEFCT;
  tPrxUnt    typPRXUNT;
  tDatDbt    typDATE;
  tDatFin    typDATE;
  tMntPen    typMNT;
  tMntHt     typMNT;
  tMntTva    typMNT;
  tUntMsr    typUNTMSR;
  tMntBas    typMNT;
  tNivPrr    typNIVPRR;
  tNivPrrRbq typNIVPRR;
  tMntRbq    typMNT;
  tMntNiv    typMNT;
  tSldNiv    typMNT;
  tIdxNiv    typNbr;
  tIdtAgt    typIDTAGT;
  vDatDbt    DATE;
  vDatFin    DATE;
  vMntFac    OPR.Mnt%TYPE;
  vQteFct    MVMEXCFCT.QteFct%TYPE;
  vPrxUnt    MVMEXCFCT.PrxUnt%TYPE;
  vMntPmt    OPR.Mnt%TYPE;
  vMntPmtTmp OPR.Mnt%TYPE;
  vUntMsr    UNTMSR.UNTMSR%TYPE;
  vModAppPrx    RBQ.ModAppPrx%TYPE;
  vDatDebFct    DATE;
  vDatFinFct    DATE;
  vArr          NUMBER;
  vOldIdtRbqPen RBQ.IdtRbq%TYPE := 'zzz';
  vIdtDvs    DVS.IdtDvs%TYPE;
  vSldFac    OPR.Sld%TYPE;
  j          NUMBER;
  k          NUMBER := 0;
  vMntPen NUMBER;
  vMntPenDejaFact NUMBER := 0;
  vTMntPenAjust NUMBER := 0;
  vParamPlafond NUMBER;
  Err_Msg       VARCHAR2(255):= NULL;

  ri NUMBER;
  vMntTVAPending NUMBER;
  vMntPenMvmExcFct_deja_calcule MVMEXCFCT.MntHt%TYPE := 0;
  vMntHtFacSansTimbre FAC.MntHt%TYPE;
  vDiscountPen NUMBER;
  vId_oet_pendis_clt CLT.T3%TYPE;
  vIdtClt CLT.IdtClt%TYPE;
BEGIN

    -- ** trtmsg01.WriteSimpleLogFile('PENALITES', ' => GetPendingPenality(' || to_char(pIdtFac) || ', ' || to_char(pDatClc, 'DD-MM-YYYY') || ', ''' || pIdtAgt || ''')');

  --maj gClcPenHt et gClcPenTva
  chgprm;
  ---------------------------------------------------------------------------
  Err_Msg := 'Aucune penalit� calcul�e';
  ---------------------------------------------------------------------------
  pMntPendingPenality := 0;
  ---------------------------------------------------------------------------
  Err_Msg := 'Si le calcul des penalit�s est autoris�e pour cette facture';
  ---------------------------------------------------------------------------
--SJ 12 jan 2010 : si pas de contrats ou pas de facture : no datafoud  alors TRTPEN_OET.AplPenxFac(pIdtFac, pDatClc) = 0 donc on fait rien
--SJ 06/06/2018 : traitement de la fiche F15990
  BEGIN
     SELECT TRUNC(NVL(FAC.DatDrnPen,DatExg)),
           CTRFAC.DatDbtPrd,
           CTRFAC.DatFinPrd,
           FAC.IdtDvs,
           NVL(FAC.MntHt,0)+NVL(FAC.MntTva,0), 
		       idtclt
      INTO vDatFin,
           vDatDebFct,
           vDatFinFct,
           vIdtDvs,
           vMntFac,
		       vIdtClt
      FROM CTRFAC, FAC
      WHERE CTRFAC.IdtFac = FAC.IdtFac
       AND  FAC.IdtFac    = pIdtFac;
  EXCEPTION WHEN NO_DATA_FOUND THEN NULL;
  END;


  IF Trtpen_Oet.AplPenxFac(pIdtFac, pDatClc) = 1 AND Trtpen_Oet.AplPenxClt(vIdtClt) = 1 THEN

     SELECT NVL(T3,0) INTO vId_oet_pendis_clt FROM CLT, FAC WHERE CLT.idtclt=FAC.idtclt AND FAC.IdtFac    = pIdtFac;

      vDiscountPen := GetDiscountPen(vDatDebFct,vDatFinFct, vId_oet_pendis_clt);
    -- ** trtmsg01.WriteSimpleLogFile('PENALITES', '* GetPendingPenality: vDiscountPen = : ' || to_char(vDiscountPen));
    --    vDiscountPen := GetDiscountPen(vDatDebFct,vDatFinFct);
    -- 24/09/2009 fiche 7692 - param plafond de p�nalit�
      vParamPlafond := GetPlafondPen(vDatDebFct,vDatFinFct, vId_oet_pendis_clt);
    -- ** trtmsg01.WriteSimpleLogFile('PENALITES', '* GetPendingPenality: vParamPlafond = ' || to_char(vParamPlafond));

-- /\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\
--        -------------------------------------------------------
--        -- Recherche du montant de p�nalit�s dans MVMEXCFCT...
--        -------------------------------------------------------
--        -- CAL 12/2009 : en fait on s'en fout ! Le traitement ignore
--        -- cette table.
--        ---------------------------------------------------------------
--        begin
--
--        select sum(nvl(MntHt,0)+nvl(MntTva,0)) into vMntPenDejaFact
--        from MVMEXCFCT
--        where  nvl(FacAnn,0) !=1
--          and DatAnn is null
--            and IdtFacOrg = pIdtFac;
--
--        exception
--            when no_data_found then
--                vMntPenDejaFact := 0;
--        end;
--   -- ** trtmsg01.WriteSimpleLogFile('PENALITES', 'PendingPenality : vMntPenDejaFact = ' || to_char(vMntPenDejaFact));
-- /\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\

    -------------------------------------------------------------------------
    Err_Msg := 'Recherche du arrondi de la devise';
    -------------------------------------------------------------------------
    SELECT ArrMnn
      INTO vArr
      FROM DVS
      WHERE IdtDvs = vIdtDvs;
    -------------------------------------------------------------------------
    Err_Msg := 'Cursor de montant par rubrique de penalit�';
    -------------------------------------------------------------------------
    SELECT RBQ.IdtRbqPen,
           TO_NUMBER(RBQ.NivPrr),
           SUM(NVL(FAC_LGNFAC_V1.MntHt,0)) MntHt,
           SUM(NVL(FAC_LGNFAC_V1.MntTva,0)) MntTva
      BULK COLLECT INTO tIdtRbqPen, tNivPrrRbq, tMntHt, tMntTva
      FROM RBQ, FAC_LGNFAC_V1
      WHERE RBQ.IdtRbq           = FAC_LGNFAC_V1.IdtRbq
       AND  RBQ.IdtRbqPen       IS NOT NULL
       AND  FAC_LGNFAC_V1.RbqCmm = 0
       AND  FAC_LGNFAC_V1.IdtFac = pIdtFac
      GROUP BY RBQ.IdtRbqPen, TO_NUMBER(RBQ.NivPrr);
    Err_Msg := 'S''il y a des rubriques pour appliquer des penalites';

    -- ** trtmsg01.WriteSimpleLogFile('PENALITES', '* GetPendingPenality: Nombre rubriques = : ' || to_char(tIdtRbqPen.Count));

    IF tIdtRbqPen.COUNT > 0 THEN
      -------------------------------------------------------------------------
      Err_Msg := 'Cursor de montant par niveau de priorit�';
      -------------------------------------------------------------------------
      SELECT TO_NUMBER(RBQ.NivPrr),
             SUM(NVL(FAC_LGNFAC_V1.MntHt,0)) + SUM(NVL(FAC_LGNFAC_V1.MntTva,0))
        BULK COLLECT INTO tNivPrr, tMntNiv
        FROM RBQ, FAC_LGNFAC_V1
        WHERE RBQ.IdtRbq           = FAC_LGNFAC_V1.IdtRbq
         AND  FAC_LGNFAC_V1.RbqCmm = 0
         AND  FAC_LGNFAC_V1.IdtFac = pIdtFac
        GROUP BY TO_NUMBER(RBQ.NivPrr)
        ORDER BY NVL(TO_NUMBER(RBQ.NivPrr),99);
      -------------------------------------------------------------------------
      Err_Msg := 'Correspondance entre la rubrique de penalit� et le niveau de priorit�';
      -------------------------------------------------------------------------
      -- -- ** trtmsg01.WriteSimpleLogFile('PENALITES', 'Avant boucle FOR');

      FOR i IN tIdtRbqPen.FIRST..tIdtRbqPen.LAST LOOP

        j := 0;
        LOOP
          j := j+1;
          IF NVL(tNivPrrRbq(i),99) = NVL(tNivPrr(j),99) THEN
            tIdxNiv(i) := j;
            EXIT;
          END IF;
        END LOOP;
      END LOOP; -- tIdtRbqPen.First..tIdtRbqPen.Last
      -------------------------------------------------------------------------
      Err_Msg := 'Loop en tant qu''il y a une periode a calculer des penalit�s';
      -------------------------------------------------------------------------

            -- On r�cup�re le montant factur� hors timbre et p�nalit�s.
        BEGIN

              SELECT SUM(LGNFAC.mntht) INTO vMntHtFacSansTimbre
              FROM FAC, LGNFAC
                       WHERE FAC.idtfac = LGNFAC.idtfac
                         AND LGNFAC.idtrbq NOT IN ('TIMBRE', 'PENALI')
                         AND FAC.idtfac = pIdtFac;
        EXCEPTION WHEN OTHERS THEN
            vMntHtFacSansTimbre := 0;

          END ;
          IF vMntHtFacSansTimbre IS NULL THEN
              vMntHtFacSansTimbre := 0;
          END IF;

      -- ** trtmsg01.WriteSimpleLogFile('PENALITES', '* GetPendingPenality: vMntHtFacSansTimbre = ' || to_char(vMntHtFacSansTimbre));

      -------------------------------------------------------------------------
      -- On initialise les donn�es des p�nalit�s :
      -------------------------------------------------------------------------
      -- ** trtmsg01.WriteSimpleLogFile('PENALITES', '* GetPendingPenality: Initialisation des valeurs');

      pMvmExcFct.NumLgnFct := 1;
      pMvmExcFct.UNTMSR := '*';
      pMvmExcFct.IdtFacOrg := pIdtFac;
      pMvmExcFct.MntBas := vMntHtFacSansTimbre;
      pMvmExcFct.IdtAgtCrt := pIdtAgt;
      pMvmExcFct.IdtTax := 'TVAF';
      pMvmExcFct.QteFct := 0;
      pMvmExcFct.DatDbt := TO_DATE('31122099', 'DDMMYYYY');
      pMvmExcFct.DatFin := TO_DATE('01011900', 'DDMMYYYY');
            pMvmExcFct.MntTVA := 0;
            pMvmExcFct.MntHT  := 0;

      LOOP
        vDatDbt := vDatFin + 1;
        Trtpen_Oet.NxtPrdClcPen(pIdtFac, pDatClc, vDatDbt, vDatFin, vSldFac, vQteFct);

        -- ** trtmsg01.WriteSimpleLogFile('PENALITES', '* GetPendingPenality: NxtPrdClcPen => ' || to_char(vDatDbt) || ' / ' || to_char(vDatFin));

        EXIT WHEN vDatDbt > vDatFin
         OR  vTMntPenAjust < 0
         OR NVL(vMntPenDejaFact,0) > NVL(vMntHtFacSansTimbre,0);

        -----------------------------------------------------------------------
        Err_Msg := 'Distribution du solde par raport la priorit� de la rubrique';
        -----------------------------------------------------------------------
        vMntPmt := vMntFac - vSldFac;
        FOR i IN tNivPrr.FIRST..tNivPrr.LAST LOOP
          vMntPmtTmp := LEAST(tMntNiv(i),vMntPmt);
          vMntPmt := vMntPmt - vMntPmtTmp;
          tSldNiv(i) := tMntNiv(i) - vMntPmtTmp;
        END LOOP;

        -----------------------------------------------------------------------
        Err_Msg := 'Application des penalit�s';
        -----------------------------------------------------------------------
        FOR i IN tIdtRbqPen.FIRST..tIdtRbqPen.LAST LOOP
          IF vOldIdtRbqPen <> tIdtRbqPen(i) THEN
            -------------------------------------------------------------------
            Err_Msg := 'Recherche du prix pour la rubrique de penalit�';
            -------------------------------------------------------------------
            SELECT ModAppPrx, UNTMSR
              INTO vModAppPrx, vUntMsr
              FROM UNTMSR, RBQ
              WHERE UNTMSR.IdtUntMsr = RBQ.IdtUntMsr
               AND  IdtRbq = tIdtRbqPen(i);

            Trtpen_Oet.PrxPen(tIdtRbqPen(i), vDatDebFct, vDatFinFct, vModAppPrx, vPrxUnt);

                -- ** trtmsg01.WriteSimpleLogFile('PENALITES', '* GetPendingPenality: vPrxUnt pour ' || tIdtRbqPen(i) || ' = ' || to_char(vPrxUnt));

            vOldIdtRbqPen := tIdtRbqPen(i);
          END IF;

          ---------------------------------------------------------------------
          Err_Msg := 'Preparation de la table pour le mouvement exceptionnel';
          ---------------------------------------------------------------------
          k := k + 1;
          -- ** trtmsg01.WriteSimpleLogFile('PENALITES', '* GetPendingPenality: k = ' || to_char(k));
          pMvmExcFct.QteFct := pMvmExcFct.QteFct + vQteFct;
          -- ** trtmsg01.WriteSimpleLogFile('PENALITES', '* GetPendingPenality: pMvmExcFct.QteFct = ' || to_char(pMvmExcFct.QteFct));
          pMvmExcFct.DatDbt := LEAST(vDatDbt, pMvmExcFct.DatDbt);
          -- ** trtmsg01.WriteSimpleLogFile('PENALITES', '* GetPendingPenality: pMvmExcFct.DatDbt = ' || to_char(pMvmExcFct.DatDbt));
          pMvmExcFct.DatFin := GREATEST(vDatFin, pMvmExcFct.DatFin);
          -- ** trtmsg01.WriteSimpleLogFile('PENALITES', '* GetPendingPenality: pMvmExcFct.DatFin = ' || to_char(pMvmExcFct.DatFin));
          -- Ci-dessous cela permet de r�cup�rer un prix unitaire...
          pMvmExcFct.PrxUnt := vPrxUnt;
          -- et la rubrique.
          tIdtRbq(k) :=  tIdtRbqPen(i);
          pMvmExcFct.IdtRbq := tIdtRbqPen(i);
          -- ** trtmsg01.WriteSimpleLogFile('PENALITES', '* GetPendingPenality: pMvmExcFct.IdtRbq = ' || pMvmExcFct.IdtRbq);



          -- Mise en commentaire de l'ancienne formule
          -- (en attente de nettoyage du package pour plus de lisibilit� :
          -- supprimer les fonction et les commentaires qui ne servent � rien ...)
          --  tMntPen(k) := vQteFct
          --              * ROUND(tSldNiv(tIdxNiv(i)) / tMntNiv(tIdxNiv(i)) * (tMntHt(i) * gClcPenHt + tMntTva(i) * gClcPenTva),vArr)
          --              * vPrxUnt ;

          ------------------------------------------------------------------------
          -- SBE - 02/08/2010
          -- Ne pas prendre en compte du solde de la facture de service
          -- Le montant des p�nalit�s doit �tre calcul� sur le montant HT des rubriques
          -- !! � quoi sert la distribution du solde par priorit� de rubrique !!
          ------------------------------------------------------------------------

            tMntPen(k) := vQteFct * ROUND(tMntHt(i) * gClcPenHt + tMntTva(i) * gClcPenTva,vArr) * vPrxUnt ;

          -- Modif de derniere minute : et ben en fait il faut appliquer le discount APRES le plafond !!!!!
          -- Donc on ne prend plus ce coefficient.
          --                             * vDiscountPen;

          -- ** trtmsg01.WriteSimpleLogFile('PENALITES', '* GetPendingPenality: MntPen(k) = ' || to_char(tMntPen(k)));

                  --24/09/2009 fiche 7692 - param plafond de p�nalit�
          vTMntPenAjust := vMntHtFacSansTimbre * vParamPlafond - NVL(vMntPenDejaFact,0);
          -- ** trtmsg01.WriteSimpleLogFile('PENALITES', '* GetPendingPenality: vTMntPenAjust = ' || to_char(vTMntPenAjust));

                  IF vTMntPenAjust < 0 THEN
                    EXIT;
                  END IF;

                  vMntPenDejaFact := NVL(vMntPenDejaFact,0) + tMntPen(k);
          -- ** trtmsg01.WriteSimpleLogFile('PENALITES', '* GetPendingPenality: vMntPenDejaFact = ' || to_char(vMntPenDejaFact));
                  IF NVL(vMntPenDejaFact,0) > (vMntHtFacSansTimbre * vParamPlafond) THEN
                       tMntPen(k) := vTMntPenAjust;
                       EXIT;
                  END IF;

        END LOOP; -- tIdtRbqPen.First..tIdtRbqPen.Last
      END LOOP; -- EXIT when vDatDbt > vDatFin


      -- ** trtmsg01.WriteSimpleLogFile('PENALITES', '* GetPendingPenality: tIdtRbq.Count = ' || to_char(tIdtRbq.Count));

            -- Ici on va calculer le montant total des p�nalit�s...
         IF tIdtRbq.COUNT > 0  THEN
        -- ** trtmsg01.WriteSimpleLogFile('PENALITES', '* GetPendingPenality: Finalisation du calcul');
             ri:= tIdtRbq.FIRST;

           WHILE ri <= tIdtRbq.LAST LOOP
                 BEGIN
                    SELECT NVL(tMntPen(ri) * TAX.TAU / 100, 0) INTO vMntTVAPending
                    FROM TAX, RBQ
                       WHERE RBQ.IdtTax = TAX.IdtTax(+)
                         AND idtrbq = tIdtRbq(ri);

                EXCEPTION
                    WHEN NO_DATA_FOUND THEN
                        vMntTVAPending := 0 ;

                 END;
            pMvmExcFct.MntTVA := TRUNC( NVL(pMvmExcFct.MntTVA + vMntTVAPending,0) );
            pMvmExcFct.MntHT := TRUNC(pMvmExcFct.MntHT + NVL(tMntPen(ri), 0) );
          -- ** trtmsg01.WriteSimpleLogFile('PENALITES', '* GetPendingPenality: calcul de pMvmExcFct.MntHT = ' || to_char(pMvmExcFct.MntHT));

          ri := ri + 1;
                END LOOP;

      END IF;  -- tIdtRbq.Count > 0

      -------------------------------------------------------------------------
      Err_Msg := 'Penalit�s calcul�es';
      -------------------------------------------------------------------------

    END IF; -- tIdtRbqPen.Count > 0
  END IF; -- AplPenxFac(pIdtFac, pDatClc) = 1

  -- ** trtmsg01.WriteSimpleLogFile('PENALITES', '* GetPendingPenality() avant discount :  ' || to_char(pMvmExcFct.MntHT) || ' + ' || to_char(pMvmExcFct.MntTVA));

  -------------------------------------------------------------------------
  Err_Msg := 'Application du discount de p�nalit�';
  -------------------------------------------------------------------------
    pMvmExcFct.MntTVA := TRUNC( NVL(pMvmExcFct.MntTVA * vDiscountPen,0) );
    pMvmExcFct.MntHT := TRUNC( pMvmExcFct.MntHT * vDiscountPen );

-- /\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\
-- CAL 12/2009 : Incoh�rent � mon avis... en plus on m�lange du HT avec du TTC.
--  begin
--  select sum(nvl(mntht,0)) +  sum(nvl(mnttva,0))
--    into vMntPenMvmExcFct_deja_calcule
--    from Rbq,
--         MvmExcFct
--    where Rbq.IdtTypRbr       =  3
--      and Rbq.IdtRbq          =  MvmExcFct.IdtRbq
--      and MvmExcFct.DatAnn    is null
--      and MvmExcFct.IdtFac    is null
--      and MvmExcFct.IdtFacOrg =  pIdtFac;
--
--  exception when others then vMntPenMvmExcFct_deja_calcule :=0;
--  end;
--
--  pMntPendingPenality := pMntPendingPenality + nvl(vMntPenMvmExcFct_deja_calcule,0);
-- /\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\

  -- ** trtmsg01.WriteSimpleLogFile('PENALITES', ' <= GetPendingPenality() -> ' || to_char(pMvmExcFct.MntHT) || ' + ' || to_char(pMvmExcFct.MntTVA));
END ;

----------------------------------------------------------------------------
----------------------------------------------------------------------------
----------------------------------------------------------------------------
FUNCTION CalculArrondi1000(pMnt OPR.MNT%TYPE) RETURN OPR.MNT%TYPE
-- Fonction calculant l'arrondi le montant � ajouter pour avoir
-- un arrondi � 1000 pour un montant donn�.
-- Ex: si pMnt vaut 101234 en entr�e, la fonction doit retourner
--     766 (= 1000 - 234)
----------------------------------------------------------------------------
-- CAL 23/11/2009
----------------------------------------------------------------------------
AS
  vMntTotBrdRgrArr OPR.MNT%TYPE;
BEGIN
  vMntTotBrdRgrArr := 1000 - MOD(pMnt, 1000);
  IF vMntTotBrdRgrArr = 1000 THEN
     vMntTotBrdRgrArr := 0;
  END IF;

  RETURN vMntTotBrdRgrArr;
END;
----------------------------------------------------------------------------
----------------------------------------------------------------------------
----------------------------------------------------------------------------
-- Creation FBE : 21/07/2010
-- Cette procedure realise les taches specifiques lors de la creation d'un
-- echeancier (IdtTypOpr = 6), comme l'annulation des factures de timbre et arrondi
-- creees pour la facture incluse dans l'echeancier
----------------------------------------------------------------------------
PROCEDURE CreEch(pIdtOprEch OPR.IdtOpr%TYPE) IS
  CURSOR cFacTim IS
    SELECT DISTINCT FACTIM.IdtFac
      FROM FAC FACTIM,
           OPR OPRFAC,
           FacturesxEcheancier FacxEch
      WHERE OPRFAC.IdtOpr = FacxEch.IdtOprFac
       AND  OPRFAC.IdtTypOpr = 1
       AND  FACTIM.BrdRgr    = OPRFAC.BrdRgr
       AND  FACTIM.IdtTypFct = cTypFctTim
       AND  FACTIM.FctAnn    = '0'
       AND  FACTIM.NUMFCT   <> '1'
       AND  FacxEch.IdtOprEch = pIdtOprEch;
  vIdtFacAnn FAC.IdtFac%TYPE;
  vIdtAgt AGT.IdtAgt%TYPE;
BEGIN

  SELECT IdtAgt
    INTO vIdtAgt
    FROM AGT
    WHERE NomCnx = USER;
  FOR rFACTIM IN cFACTIM LOOP
    vIdtFacAnn := NULL;
    Trtfac01.AnuFac(rFACTIM.IdtFac,
                    vIdtAgt,
                    1,
                    vIdtFacAnn);
  END LOOP;
END CreEch;

FUNCTION VersionPkg RETURN number
IS
BEGIN
    RETURN 71700.000000;
END VersionPkg;

END Trtpen_Oet;
/