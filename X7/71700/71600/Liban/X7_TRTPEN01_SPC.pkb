CREATE OR REPLACE PACKAGE BODY X7.X7_Trtpen01_Spc IS
     /*********************************************************
     *                                                        *
     *    A T T E N T I O N :                                 *
     *                                                        *
     *    Ce package est utilis� depuis le progr. X7 !        *
     *                                                        *
     *    Ne pas modifier les entr�es/sorties des fonctions   *
     *    et proc�dures ci-dessous sous peine de plantages.   *
     *                                                        *
     *                                                        *
     *********************************************************/
--------------------------------------------------------------------------------------------
-- Maj     : 03/07/2008
-- Par     : SJ
-- Contenu : traitement fiche 6934 - Am�lioration de X7 2.3.1 Arrondi du total de la facture
--------------------------------------------------------------------------------------------
-- Maj     : 21/07/2010
-- Par     : FBE
-- Contenu : Prise en compte de la gestion des echeanciers avec plusieurs echeances
--------------------------------------------------------------------------------------------
-- Maj     : 21/08/2018
-- Par     : SJ
-- Contenu : Prise en compte du nouveau parametre demande en IHM sources centura X7_PenAppOpr.pRetFctCtl  OUT VARCHAR2
--------------------------------------------------------------------------------------------


FUNCTION X7_PenAppClt (pIdtclt IN   CLT.IdtClt%TYPE)
  RETURN  NUMBER
IS
--------------------------------------------------------------------------------
-- Indique si il y a des p�nalit�s/timbres � appliquer pour ce client (1) ou non (0).
-- Cette fonction sert � griser ou non le bouton de p�nalit�...
--------------------------------------------------------------------------------
BEGIN
--  return Sld03Nbr(pIdtClt, 1);
--   if TRTPEN_OET.AplPenxClt(pIdtClt) = 1 or TRTPEN_OET.AplTimxClt(pIdtClt) = 1 then
--     return 1;
--   else
--     return 0;
--   end if;

  RETURN 1;

END;
-----------------------------------------------------------------------------
-- Cette fonction est appel�e par l'interactif pour voir si on doit
-- appliquer un timbre pour cette op�ration
-- pCr : 0 ==> Message "Aucune penalite pour cette operation"
--       1 ==> X7 lance la procedure X7_ClcPen
--       2 ==> X7 imprime la facture directement
-----------------------------------------------------------------------------
PROCEDURE X7_penappopr(
    pIdtclt IN  CLT.idtclt%TYPE,
    pIdtOpr IN  OPR.idtopr%TYPE,
    pSource IN    VARCHAR2,
    pCr     OUT NUMBER,
    pRetFctCtl  OUT VARCHAR2
    )
IS
--------------------------------------------------------------------------------
--- Indique si il y a des p�nalit�s/timbres � appliquer pour cette op�ration (1) ou non (0).
--------------------------------------------------------------------------------
  vIdtFac FAC.IdtFac%TYPE;
  vDatImp OPR.DatImp%TYPE;
  vReturn NUMBER;
  vIdtAgt AGT.IdtAgt%TYPE;
  -- Modif CAL 12/2009 :
  vMntArr LGNFAC.MNTHT%TYPE;
  vMntFac FAC.MNTHT%TYPE;
  vIdtTypFct FAC.IdtTypFct%TYPE;
  -- FBE 21/07/2010
  vIdtTypOpr TYPOPR.IdtTypOpr%TYPE;
BEGIN
/*
  -- Charly 12/01/2004
  -- Si on a aucune facture de p�nalit�s ou de timbre, on veut imprimer quand meme...
  -- Il s'agit des factures migr�es assez r�centes pour ne pas avoir de p�nalit�s par exemple...
  -- X7 appelera alors X7_ClcPen(). Voir la suite dans cette fonction.
  return 1;
*/
--  vReturn := 1 / 0;
  -- ** trtmsg01.WriteSimpleLogFile('PENALITES', ' => X7_PenAppOpr(' || pIdtClt || ', ' || to_char(pIdtOpr) || ', ''' || pSource || ''')');
  BEGIN
    -- On ouvre la jointure sur la table des factures car ceci
    -- permet de tester aussi la date d'impression sur les �ch�ances.
    -- Modif CAL 12/2009 : On a besoin d'info pour le test sur les arrondis.
    SELECT FAC.IdtFac, OPR.DatImp, NVL(FAC.MntHt,0) + NVL(FAC.MntTVA,0), FAC.IdtTypFct, OPR.IdtTypOpr
      INTO vIdtFac, vDatImp, vMntFac, vIdtTypFct, vIdtTypOpr
      FROM FAC, OPR
      WHERE OPR.IdtOpr    = pIdtOpr
       AND  FAC.NUMFCT(+) = OPR.Rfr;
  EXCEPTION
    WHEN NO_DATA_FOUND THEN
      vIdtFac := NULL;
  END;

--SJ provoquer une erreur d'exection lors de calcul ech F15185 le temps que je mets � jours les donn�es !!!  ATTENTION je dois revenir sur cette modif
-- SJ 02/02/2018 blocage enlev� : if vIdtTypOpr = 7 then vIdtFac:= 1/0; end if;
 
  -- Si la facture est d�j� imprim�, on doit de toute fa�on RIEN FAIRE !
  -- Exceptions :
  -- 1. Seul le compte G peut passer outre pour tests et d�veloppements.
  -- 2. Depuis la caisse il ne faut pas tenir compte de ce test !!!!!!!!!
  IF     vDatImp IS NOT NULL
     AND USER NOT IN ('G')
     AND pSource <> 'dlgCSSOPE08'
  THEN
    -- ** trtmsg01.WriteSimpleLogFile('PENALITES', ' <= X7_PenAppOpr() : pCr = 0 (DatImp is not null)');
    pCr := 0;
    RETURN;
  END IF;

  IF vIdtFac IS NOT NULL THEN
    -- Si c'est bien une facture et non une �ch�ance, et qu'elle n'est pas dans un lot de routage actif
    -- alors on appelle la fonction qui calcule les p�nalit�s. Ansi, si une facture n'est pas �
    -- jour, elle le sera...
    -- (ajout CAL en r�ponse � demande OET/ONL - 30/08/2004)
    -- ** trtmsg01.WriteSimpleLogFile('PENALITES', ' X7_PenAppOpr() : Facture dans un lot actif ?');
    IF Trtpen_Oet.OprDansLotRtgAct(pIdtOpr, NULL) = 0 THEN
      Trtmsg01.WriteSimpleLogFile('PENALITES', ' X7_PenAppOpr() : Facture dans un lot actif => NON');
			-- CAL 12/2009 : CET APPEL N'EST PLUS UTILE !
      -- TRTPEN_OET.ClcPen1Fac(vIdtFac, TrtPen_Oet.CurrentIdtAgt);
    ELSE
    	-- ** trtmsg01.WriteSimpleLogFile('PENALITES', ' X7_PenAppOpr() : Facture dans un lot actif => OUI');
			-- Si en outre nous ne sommes pas appel�s depuis la caisse, alors on refuse.
			IF pSource <> 'dlgCSSOPE08' THEN
	      -- ** trtmsg01.WriteSimpleLogFile('PENALITES', ' <= X7_PenAppOpr() : pCr = 1 (Facture en collecte + appel depuis compte client)');
  	    pCr := 0;
    	  RETURN;
    	END IF;
    END IF;

    -- ** trtmsg01.WriteSimpleLogFile('PENALITES', ' X7_PenAppOpr() : P�nalit�s en attente ?');
    -- on regarde si il y a des p�nalit�s en attente pour cette facture.
    IF Trtpen_Oet.SldPenNonFacxFac(vIdtFac) > 0 THEN
      -- ** trtmsg01.WriteSimpleLogFile('PENALITES', ' <= X7_PenAppOpr() : pCr = 1 (SldPenNonFacxFac > 0)');
      pCr := 1;
      RETURN;
    END IF;
  END IF;

  -- Modifi� par CAL 20/10/2003
  -- Avant : TRTPEN_OET.AplTimxOpr(pIdtOpr) = 1 then
  -- Maintenant la AplTimxOpr retourne la valeur du timbre et non 1.
  IF Trtpen_Oet.AplTimxOpr(pIdtOpr) <> 0 THEN
    -- ** trtmsg01.WriteSimpleLogFile('PENALITES', ' <= X7_PenAppOpr() : pCr = 1 (AplTimxOpr <> 0)');
    pCr := 1;
    RETURN;
  END IF;

  -- Modif CAL 12/2009 : On va v�rifier qu'il n'y a pas un arrondi pour cette facture.
	-- On va regarder le montant d'arrondi pour cette facture
	-- FBE: 21/07/2010: On sera ici seulement dans le cas de re-impression. Le timbre est exclu de la facture, donc,
	--                  il faut toujours calculer le timbre si l'operation n'a pas ete imprimee

	SELECT DECODE(vIdtTypFct, 5, Trtpen_Oet.calcularrondi1000(vMntFac) ,
				Trtpen_Oet.calcularrondi1000(Trtpen_Oet.mntsvchtxfac (vIdtFac)
                                    + Trtpen_Oet.mntsvctvatodayxfac(vIdtFac)
                                    + Trtpen_Oet.sldpennonfacxfac(vIdtFac)
                                    + Trtpen_Oet.MntPenFacxFac(vIdtFac)
                                    ))
  INTO vMntArr
  FROM dual;

  IF vMntArr <> 0 THEN
    -- ** trtmsg01.WriteSimpleLogFile('PENALITES', ' <= X7_PenAppOpr() : pCr = 1 (vMntArr <> 0)');
    pCr := 1;
    RETURN;
  END IF;

  -- Ajout� par CAL 07/12/2003
  -- Avant de retourner 0, il faut v�rifier si oui ou non on doit
  -- g�rer une diff�rence de TVA !
  IF Trtpen_Oet.AplTvaxOpr(pIdtOpr) <> 0 THEN
    -- ** trtmsg01.WriteSimpleLogFile('PENALITES', ' <= X7_PenAppOpr() : pCr = 1 (AplTvaxOpr <> 0)');
    pCr := 1;
    RETURN;
  END IF;
  -- Modif CAL 21/01/2004
  -- Dans le cas de l'OET, on retourne 2 => cela permet l'impression de
  -- de la facture de p�nalit�s meme si il n'y en a pas. On d�porte le
  -- pb du controle dans le programme SQR de la facture
  -- Ancien retour : 0
  -- Note : Faisons croire � X7 qu'une facture a �t� valid�e
  Trtmsg01.insert_msg ('TRT2009',
      'MSG_FIN',
       Trtmsg01.concat_msg('MSG_FIN',NULL,NULL,NULL,NULL));

  -- ** trtmsg01.WriteSimpleLogFile('PENALITES', ' <= X7_PenAppOpr() : pCr = 2');
  pCr := 2;
END X7_PenAppOpr;
-----------------------------------------------------------------------------
-----------------------------------------------------------------------------
-----------------------------------------------------------------------------
FUNCTION X7_InsTchePen (pIdtTypTche TYPTCHE.IdtTypTche%TYPE, pModDcl TCHE.ModDcl%TYPE)
  RETURN NUMBER IS
--------------------------------------------------------------------------------
--- Insertion d'une t�che pour les p�nalit�s ?
--------------------------------------------------------------------------------
BEGIN
  RETURN 0;
END;
-----------------------------------------------------------------------------
-----------------------------------------------------------------------------
-----------------------------------------------------------------------------
FUNCTION X7_SldPen (pIdtClt CLT.IdtClt%TYPE, pIdtCptClt CPTCLT.IdtCptClt%TYPE)
  RETURN NUMBER IS
--------------------------------------------------------------------------------
--- Retourne le solde de p�nalit�s (et timbres ?).
--------------------------------------------------------------------------------
BEGIN
  RETURN Sld03(pIdtClt, pIdtCptClt);
END;
-----------------------------------------------------------------------------
-----------------------------------------------------------------------------
-----------------------------------------------------------------------------
FUNCTION X7_MdlPenRglIns
   RETURN NUMBER IS
--------------------------------------------------------------------------------
---
--------------------------------------------------------------------------------
BEGIN
  RETURN 0;
END X7_MdlPenRglIns;
-----------------------------------------------------------------------------
-----------------------------------------------------------------------------
-----------------------------------------------------------------------------
PROCEDURE X7_ClcPen (pIdtClt    IN    CLT.IdtClt%TYPE,
                     pIdtOpr    IN    OPR.idtopr%TYPE,
                     pIdtAgt    IN    AGT.IdtAgt%TYPE,
                     pIdtFac    OUT   FAC.IdtFac%TYPE,
                     pCr        OUT   NUMBER)
IS
--------------------------------------------------------------------------------
--- Calcul des p�nalit�s
--------------------------------------------------------------------------------
  vBrdRgr    OPR.BrdRgr%TYPE;
  vIdtLotRtg OPR.BrdRgr%TYPE;
  vIdtFac    FAC.IdtFac%TYPE;
  -- Ajout CAL 15/12/2004
  -- Il faut garder m�moire, sur les factures de timbre et de p�nalit�s,
  -- des lots de facturation et de routage de la facture d'origine.
  vIdtFacTim FAC.IdtFac%TYPE;
  vIdtLotFac FAC.IdtLotFac%TYPE;
BEGIN
  -- ** trtmsg01.WriteSimpleLogFile('PENALITES', ' => X7_ClcPen(''' || pIdtClt || ''', ' || to_char(pIdtOpr));

  Trtmsg01.insert_msg
   (
    Trtpen_Oet.gvIdtTrt_CalCul_Penalites,
    'MSG_DEBUT',
    Trtmsg01.concat_msg('MSG_DEBUT',NULL,NULL,NULL,NULL)
    );
  pCr := 0;
  BEGIN
    SELECT FAC.IdtFac, OPR.IdtLotRtg, FAC.IdtLotFac
      INTO vIdtFac, vIdtLotRtg, vIdtLotFac
      FROM FAC, OPR
      WHERE FAC.NUMFCT = OPR.Rfr
       AND  OPR.IdtOpr = pIdtOpr;
  EXCEPTION
    WHEN NO_DATA_FOUND THEN
      vIdtFac := NULL;
  END;

  -- ** trtmsg01.WriteSimpleLogFile('PENALITES', ' X7_ClcPen : vIdtFac = ' || nvl(to_char(vIdtFac), '<NULL>'));

  -- On cr�e le mouvement exceptionnel correspondant aux p�nalit�s
  -- si echeancier vIdtFac is null alors pas de p�nalit�s
  IF vIdtFac IS NOT NULL THEN
    Trtpen_Oet.CreFacMvmExc(pIdtClt,
                           vIdtLotFac,
                           vIdtLotRtg,
                           Trtpen_Oet.cTypRbrPen,
                           Trtpen_Oet.cTypFctPen,
                           pIdtAgt,
                           vIdtFac,    -- Facture p�riodique
                           pIdtFac);   -- Facture de p�nalit� (param. retour)
  END IF;
  -- On cr�e la facture de timbres
  Trtpen_Oet.CreFacTimxOpr(pIdtOpr,
                           vIdtFac,
                           vIdtLotFac,
                           vIdtLotRtg,
                           vIdtFacTim);



  pIdtFac := NVL(pIdtFac, vIdtFacTim);
  -- Charly 12/01/2004
  -- Si on a aucune facture de p�nalit�s ou de timbre, on veut imprimer quand meme...
  -- Il s'agit des factures migr�es assez r�centes pour ne pas avoir de p�nalit�s par exemple...
  -- Pour cela on trompe X7 en lui redonnant l'IdtFac de la facture d'origine... Il
  -- va donc lancer la validation et l'impression !
  -- La suite se trouve dans X7_ValPen()...
/* ** D�sactiv� **
  pIdtFac := nvl(PIdtFac, vIdtFac);
*/
  --SJ 03/07/2008 - traitement fiche 6934 - arr supp�rieure mnt global facture + pen + timbre � 1000LL
  --On cr�er une ligne d'arrondi du bordereau de regropement soit dans la facture de timbre :
  --m�me si pas des ligne dans la fact de timbre si il y a un arrondi � faire on va cr�er la facture de timbre
  --cela pour �viter sitation complexe:
  -- si existe fact timbre alors la ligne arr dans la fact timbre,
  -- si non on demande si il y a fact de p�n et si oui ligne arr dans fact pen
  -- si pas de fact pen alors soit on cr�e un autre type de facture (d�v complexe � modifier trtfac_spc) soit on modifie la fact de service
  -- pour ajouter la ligne d'arr :
  --If pIdtFac is null then
  --pIdtFac := nvl(PIdtFac, vIdtFac);
  -- TRTPEN_OET.CreArrMntTotFacSrv(pIdtFac);
  --End If;
  --sol choisie ajouter ligne ARR dans la fact "timbre"

  Trtmsg01.insert_msg (Trtpen_Oet.gvIdtTrt_CalCul_Penalites,
                     'MSG_FIN',
                     Trtmsg01.concat_msg('MSG_FIN',NULL,NULL,NULL,NULL));
  pCr := 1;
  -- ** trtmsg01.WriteSimpleLogFile('PENALITES', ' <= X7_ClcPen()');

END X7_CLCPEN;
-----------------------------------------------------------------------------
-----------------------------------------------------------------------------
-----------------------------------------------------------------------------
PROCEDURE X7_CreMvmExcPenRgl
   (pIdtOprDbt IN       OPR.IdtOpr%TYPE,
    pIdtOprCrt IN       OPR.IdtOpr%TYPE,
    pMnt       IN       OPR.Mnt%TYPE,
    pIdtAgt    IN       AGT.IdtAgt%TYPE,
    pCr        OUT      NUMBER) IS
-----------------------------------------------------------------------------
--
-----------------------------------------------------------------------------
BEGIN
  pCr := 0;
END X7_CreMvmExcPenRgl;
-----------------------------------------------------------------------------
-----------------------------------------------------------------------------
-----------------------------------------------------------------------------
PROCEDURE X7_AnlMvmExcPenRgl
   (pIdtLgnCss IN       LGNCSS.IdtLgnCss%TYPE,
    pIdtAgt    IN       AGT.IdtAgt%TYPE,
    pCr        OUT      NUMBER) IS
-----------------------------------------------------------------------------
--
-----------------------------------------------------------------------------
BEGIN
  pCr := 0;
END X7_AnlMvmExcPenRgl;
-----------------------------------------------------------------------------
-----------------------------------------------------------------------------
-----------------------------------------------------------------------------
PROCEDURE X7_ValPen (pnIdtFac           IN  FAC.IdtFac%TYPE,
                     pdtDateExigibilite IN  FAC.DatExg%TYPE,
                     pnIdtFacOrg        IN  FAC.IdtFac%TYPE,
                     pIdtAgt            IN  AGT.IdtAgt%TYPE)
  IS
-----------------------------------------------------------------------------
-- Validation des factures de p�nalit�s et timbres non valid�es, appartenant
-- au borderau de la facture principale (la p�riodique) pass�e en param.
-----------------------------------------------------------------------------
  vBrdRgr OPR.BrdRgr%TYPE;
  vNbr    NUMBER;
  CURSOR cFac IS
    SELECT IdtFac, BrdRgr
      FROM FAC
      WHERE BrdRgr = (SELECT BrdRgr
                        FROM FAC
                        WHERE IdtFac = pnIdtFac)
       AND  NUMFCT = '1';
  -- CAL - 19/12/2004
  -- Report de IdtLotRtg de l'op�ration d'origine sur les op�rations filles
  -- (factures de timbre et de p�nalit�s)
  vIdtLotRtg OPR.IdtLotRtg%TYPE;

BEGIN
  -- ** trtmsg01.WriteSimpleLogFile('PENALITES', ' => X7_ValPen('|| nvl(to_char(pnIdtFac), '<NULL>') || ', ' || to_char(pdtDateExigibilite) || ', ' || nvl(to_char(pnIdtFacOrg), '<NULL>'));
  -- Charly 12/01/2004
  -- Si on a aucune facture de p�nalit�s ou de timbre, on veut imprimer quand meme...
  -- Il s'agit des factures migr�es assez r�centes pour ne pas avoir de p�nalit�s par exemple...
  -- On va utiliser le flag vNbr. On le fixe � 0 avant la boucle de validation des factures
  vNbr := 0;
  FOR rFAC IN cFAC LOOP
    Trtfac01.Val1Fac(rFAC.IdtFac,
                     pdtDateExigibilite,
                     pnIdtFacOrg,
                     pIdtAgt);
    -- Charly 12/01/2004
    -- Si on passe ici alors on a valid� une facture
    vNbr := vNbr + 1;
  END LOOP;
  -- Charly 12/01/2004
  -- Si on a au moins une facture valid�e, alors on n'ins�re pas le leure suivant,
  -- destiner � permettre � X7 de lancer l'impression.
  IF vNbr = 0 THEN
    Trtmsg01.insert_msg ('TRT2009',
      'MSG_FIN',
       Trtmsg01.concat_msg('MSG_FIN',NULL,NULL,NULL,NULL));
  ELSE
    -- Modif CAL  19/12/2004
    -- On a donc valid� des factures. On va devoir �ventuellement reporter
    -- l'IdtLotRtg de l'op�ration de la facture de service sur les nouvelles
    -- factures valid�es ici...

    -- On recherche la facture de service : C'est celle dont la n� de bordereau
    -- vaut le n� de facture.
    SELECT OPR.IdtLotRtg, OPR.BrdRgr
      INTO vIdtLotRtg, vBrdRgr
    FROM x7.OPR, x7.FAC
    WHERE FAC.IdtFac = pnIdtFac
      AND OPR.Rfr = FAC.BrdRgr;

    -- On met � jour les op�rations filles. (n� de bordereau <> Rfr)
    UPDATE X7.OPR
      SET IdtLotRtg = vIdtLotRtg
      WHERE BrdRgr = vBrdRgr
        AND Rfr <> BrdRgr;

  END IF;
--  select count(*)
--    into vNbr
--    from OPR
--    where Rfr = vBrdRgr
--     and  IdtTypOpr = 37;
--  if vNbr = 0 then
--    TRTPEN_OET.InsBrdRgr(vBrdRgr);
--  end if;
  -- ** trtmsg01.WriteSimpleLogFile('PENALITES', ' <= X7_ValPen()');
END X7_ValPen;
-----------------------------------------------------------------------------
-----------------------------------------------------------------------------
-----------------------------------------------------------------------------

PROCEDURE X7_InvalPen (pnIdtFac           IN  FAC.IdtFac%TYPE)
  IS
-----------------------------------------------------------------------------
-- Invalidation des factures appartenant au bordereau de la facture pass�e
-- en param�tre
-----------------------------------------------------------------------------
  vBrdRgr OPR.BrdRgr%TYPE;
  CURSOR cFac IS
    SELECT IdtFac, BrdRgr, IdtFacOrg
      FROM FAC
      WHERE BrdRgr = (SELECT BrdRgr
                        FROM FAC
                        WHERE IdtFac = pnIdtFac)
       AND  NUMFCT = '1';
gvIdtTrt_Invalidation         CONSTANT TYPTCHE.idttyptche%TYPE := 'TRT2023';	   
BEGIN

Trtmsg01.insert_msg (gvIdtTrt_Invalidation,
                     'MSG_DEBUT',
                     Trtmsg01.concat_msg('MSG_DEBUT',NULL,NULL,NULL,NULL));


  FOR rFAC IN cFAC LOOP
    Trtfac01.Inval1Fac(rFAC.IdtFac);
    -- Il faut aussi remettre la derni�re date de calcul des p�nalit�s � NULL
    -- sur la facture d'origine.
    -- CAL 06/12/2009
    IF rFAC.IdtFacOrg IS NOT NULL THEN
       UPDATE FAC
         SET DatDrnPen = NULL
         WHERE IdtFac = rFAC.IdtFacOrg;
    END IF;
  END LOOP;
--  select count(*)
--    into vNbr
--    from OPR
--    where Rfr = vBrdRgr
--     and  IdtTypOpr = 37;
--  if vNbr = 0 then
--    TRTPEN_OET.InsBrdRgr(vBrdRgr);
--  end if;


Trtmsg01.insert_msg (gvIdtTrt_Invalidation,
                     'MSG_FIN',
                     Trtmsg01.concat_msg('MSG_FIN',NULL,NULL,NULL,NULL));

					 
END X7_InvalPen;
-----------------------------------------------------------------------------
-----------------------------------------------------------------------------
-----------------------------------------------------------------------------
FUNCTION X7_VOIRFACPEN(pIdtFacPen FAC.IdtFac%TYPE)
  RETURN NUMBER IS
-----------------------------------------------------------------------------
--
-----------------------------------------------------------------------------
BEGIN
  RETURN pIdtFacPen;
END X7_VOIRFACPEN;
---
END X7_Trtpen01_Spc;
/