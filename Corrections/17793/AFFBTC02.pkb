CREATE OR REPLACE PACKAGE BODY X7.AFFBTC02
IS
/***************************************************************************
* AFFBTC02 Avance automatique des actions dans affaire                     *
*
-----------------------------------------------------------------------------

-----------------------------------------------------------------------------------------
-- Maj     : 23/09/2009
-- Par     : JCD
-- Contenu :
-----------------------------------------------------------------------------------------
-- Maj     : 20/11/2009
-- Par     : FBE
-- Contenu : - Correction AvancementAutoAffaire: Pour les actions "En attente", la date de debut reelle
--             ne doit pas etre renseignee
-----------------------------------------------------------------------------------------
-- Maj     : 24/11/2009
-- Par     : FBE
-- Contenu : - Correction AvancementAutoAffaire: L'avancement automatique ne respecte pas
--             le delai de l'etape
-----------------------------------------------------------------------------------------
-- Maj     : 08/12/2009
-- Par     : FBE
-- Contenu : - Probleme: La generation de l'intervention ferme l'action, or elle doit
--                       etre fermee par l'execution de l'intervention.
--             Correction: modification de l'update pour ne pas fermer l'action
-----------------------------------------------------------------------------------------
-- Maj     : 13/12/2009
-- Par     : FBE
-- Contenu : - La generation d'une intervention du niveau point de livraison ou point de comptage
--             ou compteur genere une erreur s'il n'y a pas de contrat. Il peut etre normal de ne pas y avoir
--             un contrat.
--             Modification de la requete pour faire un outer join sur la table contrat
--           - La procedure AvancementAutoAffaire est basee sur le statut. Dans X7 il est possible
--             d'avoir des statuts specifiques. Modification de la condition pour faire avancer
--             l'affaire en se basant sur la date de fin de l'action precedente
--           - Dans certains cas, l'avancement automatique genere des interventions en double (appel
--             en double de la procedure AvancementAutoAffaire???).
--             Correction: La mise a jour de l'action suivante est fait que si l'action suivante
--                         a un IdtRet = null
--           - La procedure CreationAutoIntervention fait la creation d'une intervention, meme
--             si l'intervention est deja creee (en utilisant le bouton executer sur la fenetre action plusieurs fois).
--             Ajout d'un controle pour creer l'intervention seulement si l'intervention
--             n'est pas deja creee.
-----------------------------------------------------------------------------------------
-- Maj     : 19/02/2010
-- Par     : JCD
-- Contenu : complément sur correctiond e FBE le 13/12
--           - La procedure AvancementAutoAffaire est basee sur le statut. Dans X7 il est possible
--             d'avoir des statuts specifiques. Modification de la condition pour faire avancer
--             l'affaire en se basant sur la date de fin de l'action precedente
--          --> Comme on ne passe plus par les statuts, gérer si action n'est pas abandonnée,
--              sinon, c'est X7 qui se charge de terminer affaire (abandon)
-----------------------------------------------------------------------------------------
-- Maj     : 31/03/2010
-- Par     : JCD
-- Contenu :  - Agent de traitement ne doit pas être mis à jour par intervention
--            - Mauvais test pour client obligatoire en création d'intervention commerciale
-----------------------------------------------------------------------------------------
-- Maj     : 22/06/2010
-- Par     : FBE
-- Contenu :  - Dans le cas ou l'action est mise "En erreur", la date de fin doit
--              etre nulle. La modification en masse (Centura) met la date de fin avant
--              de lancer l'avancement de l'affaire
-----------------------------------------------------------------------------------------
-- Maj     : 02/07/2010
-- Par     : JCD
-- Contenu :  - Propagationd es information sur l'action suivante
-----------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------
-- Maj     : 01/09/2011
-- Mantis  : 7543
-- Par     : BPZ
-- Contenu :  - alimentation de INT.IDTSML
-----------------------------------------------------------------------------------------

-----------------------------------------------------------------------------------------
-- Maj     : 25/03/2014
-- Mantis  : 11556
-- Par     : BPZ
-- Contenu : 1556: Ouverture générique de fenetre sur actions liées
-----------------------------------------------------------------------------------------

-----------------------------------------------------------------------------------------
-- Maj     : 25/03/2014
-- Mantis  : 11202
-- Par     : BPZ
-- Contenu : 11202: Le batch avancement automatique des affaires se bloque
-----------------------------------------------------------------------------------------
-- Maj     : 12/07/2014
-- Mantis  : 11884
-- Par     : BPZ
-- Contenu : 11884: Compatibilité avec la nouvelle gestion des processus liés
-----------------------------------------------------------------------------------------
-- Maj     : 02/10/2014
-- Mantis  : 12097
-- Par     : FBE
-- Contenu : 12097: Ajout du contrat de fourniture et un 2eme client sur ACTCRS.
--                  Prise en compte des 2 informations dans la propagation des infos sur les actions de l'affaire
-----------------------------------------------------------------------------------------
-- Maj     : 13/11/2014
-- Mantis  : 12210 - 12211
-- Par     : FBE
-- Contenu : 12210: La fonction Verrou_ACTCRS fait planter la procedure, car la condition est IdtAff = pIdtActCrs
--                  changement de la condition a: IdtActCrs = pIdtActCrs
--           12211 : La fonction DateToContinue ne doit pas etre dans l'avancement de l'affaire,
--                   car si on est la, le delai de l'etape a ete respecte.
--                   DateToContinue recalcul le delai pour chaque action d'une etape, or
--                   le calcul doit se faire seulement pour la premiere action de l'etape
-----------------------------------------------------------------------------------------
-- Maj     : 18/11/2014
-- Mantis  : 12213 - 12214
-- Par     : FBE
-- Contenu : 12213: Dans le cas d'un plantage non gere dans ACTCRS01_SPC, l'action anterieur est
--                  marquee en erreur, or X7 doit marquer l'action en cours en erreur.
--                  Solution: - Gestion d'une exception lors de l'appel a ACTCRS01_SPC, dans le 
--                              cas ou elle ne soit pas geree. Modification a chaque appel a ACTCRS01_SPC
--                            - Augmentation de la taille de la variable qui garde le message d'erreur (255->4000)
--           12214: Impossible de faire avancer un affaire si une action avec processus lié spécifique tombe en erreur.
--                  Solution: Modification de AFFBTC02.AvancementAutoAffaire pour essayer de refaire systématiquement 
--                            les actions qui sont en erreur
-----------------------------------------------------------------------------------------
-- Maj     : 19/05/2015
-- Mantis  : 12577
-- Par     : FBE
-- Contenu : 12577: La première étape d'un plan d'actions n'est pas ignorée
--                  Modification de la procedure AvancementAutoAffaire, lorsque l'action est "En cours", on evalue s'il s'agit
--                  de la premiere action de l'etape, si c'est le cas, on lance la procedure pour ignorer l'etape s'il le faut.
--           12717: Probleme de performance sur l'avancement des affaires
--                  Modification de la requete de selection des affaires dans AvancementAutoAffaire. On ne prenne
--                  que les affaires qui n'ont pas des actions "En cours" ou "En attente" et qu'on des actions non traitees
--           Correction de la procedure ActionEnCourApresEcran et ProcessusLieApresAffaire. On utilise la fonction X7UTIL.CurrentIdtAgt pour
--           renseigner l'agent de traitement au lieu de "user"
-----------------------------------------------------------------------------------------

-----------------------------------------------------------------------------
-----------------------------------------------------------------------------
-----------------------------------------------------------------------------*/

-- A MODIFIER A CHAQUE MODIF DU PACKAGE!!!
FUNCTION VersionPkg
--        --------- Version du package utilisé
  RETURN NUMBER
IS
BEGIN
  RETURN 71200.038;
END;


PROCEDURE ProcessusLieApresClient( pIDTACTCRS      IN  ACTCRS.IDTACTCRS%TYPE,
                                    pIDTCLT         IN  CLT.IDTCLT%type,
                                  sTypMsg          OUT VARCHAR2,
                                  sRetFctCtl       OUT VARCHAR2)
is
begin

    UPDATE    ACTCRS SET
    IDTCLT    = pIDTCLT
    WHERE    ACTCRS.IDTAFF = (SELECT IDTAFF FROM ACTCRS WHERE IDTACTCRS = pIDTACTCRS)
    AND    ACTCRS.NUMORD >= (SELECT NUMORD FROM ACTCRS WHERE IDTACTCRS = pIDTACTCRS);

EXCEPTION
    WHEN OTHERS THEN
        X7.GEST_ERREUR_CENTURA(VersionPkg(),
                              0,
                              'AFFBTC02',
                              'ProcessusLieApresClient',
                              to_char(SQLERRM),
                              sqlcode,
                              DBMS_UTILITY.FORMAT_ERROR_BACKTRACE);
        Raise;

end ProcessusLieApresClient;


PROCEDURE ProcessusLieApresPtsLvr( pIDTACTCRS      IN  ACTCRS.IDTACTCRS%TYPE,
                                     pIDTPNTLVR    IN  PNTLVR.IDTPNTLVR%type,
                                  sTypMsg          OUT VARCHAR2,
                                  sRetFctCtl       OUT VARCHAR2)
is
begin

    UPDATE    ACTCRS SET
    IDTPNTLVR =    pIDTPNTLVR,
    IDTPNTCPG =    NULL
    WHERE    ACTCRS.IDTAFF = (SELECT IDTAFF FROM ACTCRS WHERE IDTACTCRS = pIDTACTCRS)
    AND    ACTCRS.NUMORD >= (SELECT NUMORD FROM ACTCRS WHERE IDTACTCRS = pIDTACTCRS);

EXCEPTION
    WHEN OTHERS THEN
        X7.GEST_ERREUR_CENTURA(VersionPkg(),
                              0,
                              'AFFBTC02',
                              'ProcessusLieApresPtsLvr',
                              to_char(SQLERRM),
                              sqlcode,
                              DBMS_UTILITY.FORMAT_ERROR_BACKTRACE);
        Raise;

end ProcessusLieApresPtsLvr;

PROCEDURE ProcessusLieApresPtsCpg( pIDTACTCRS      IN  ACTCRS.IDTACTCRS%TYPE,
                                     pIDTPNTLVR    IN  PNTLVR.IDTPNTLVR%type,
                                     pIDTPNTCPG    IN  PNTCPG.IDTPNTCPG%type,
                                  sTypMsg          OUT VARCHAR2,
                                  sRetFctCtl       OUT VARCHAR2)
is
begin

    UPDATE    ACTCRS SET
    IDTPNTLVR =    pIDTPNTLVR,
    IDTPNTCPG =    pIDTPNTCPG
    WHERE    ACTCRS.IDTAFF = (SELECT IDTAFF FROM ACTCRS WHERE IDTACTCRS = pIDTACTCRS)
    AND    ACTCRS.NUMORD >= (SELECT NUMORD FROM ACTCRS WHERE IDTACTCRS = pIDTACTCRS);

EXCEPTION
    WHEN OTHERS THEN
        X7.GEST_ERREUR_CENTURA(VersionPkg(),
                              0,
                              'AFFBTC02',
                              'ProcessusLieApresPtsCpg',
                              to_char(SQLERRM),
                              sqlcode,
                              DBMS_UTILITY.FORMAT_ERROR_BACKTRACE);
        Raise;

end ProcessusLieApresPtsCpg;


PROCEDURE ProcessusLieApresAffaire( pIDTACTCRS      IN  ACTCRS.IDTACTCRS%TYPE,
                                     pIDTAFF       IN  AFF.IDTAFF%type,
                                  sTypMsg          OUT VARCHAR2,
                                  sRetFctCtl       OUT VARCHAR2)
is
begin

    --X7UTIL.TRACE('ProcessusLieApresAffaire:'||to_char(pIDTACTCRS)||' '||to_char(pIDTAFF) );

    UPDATE    ACTCRS SET
    IDTAFF2 =    pIDTAFF,
    IDTAGTTRT =  X7UTIL.CurrentIdtAgt,
    IDTRET =     0,
    DATFIN =     SYSDATE
    WHERE    ACTCRS.IDTACTCRS =  pIDTACTCRS;

EXCEPTION
    WHEN OTHERS THEN
        X7.GEST_ERREUR_CENTURA(VersionPkg(),
                              0,
                              'AFFBTC02',
                              'ProcessusLieApresAffaire',
                              to_char(SQLERRM),
                              sqlcode,
                              DBMS_UTILITY.FORMAT_ERROR_BACKTRACE);
        Raise;

end ProcessusLieApresAffaire;

PROCEDURE ProcessusLieApresDevis( pIDTACTCRS      IN  ACTCRS.IDTACTCRS%TYPE,
                                    pIDTFAC       IN  FAC.IDTFAC%type,
                                  sTypMsg          OUT VARCHAR2,
                                  sRetFctCtl       OUT VARCHAR2)
is
    --vidtopr opr.idtopr%type;
begin

--    X7UTIL.TRACE('ProcessusLieApresDevis:'||to_char(pIDTACTCRS)||' '||to_char(pIDTFAC) );
--
--    SELECT OPR.IDTOPR
--    into vidtopr
--    FROM OPR,FAC
--    WHERE IDTFAC = pIDTFAC AND FAC.NUMFCT = OPR.RFR;
--
--    X7UTIL.TRACE('ProcessusLieApresDevis vidtopr:'||to_char(vidtopr) );

    UPDATE    ACTCRS SET
    IDTOPR=    (SELECT OPR.IDTOPR
                FROM OPR,FAC
                WHERE IDTFAC = pIDTFAC AND FAC.NUMFCT = OPR.RFR),
    IDTTYPOPR =    (SELECT OPR.IDTTYPOPR
                    FROM OPR,FAC
                    WHERE IDTFAC =pIDTFAC AND FAC.NUMFCT = OPR.RFR)
    WHERE    ACTCRS.IDTAFF = (SELECT IDTAFF FROM ACTCRS WHERE IDTACTCRS = pIDTACTCRS )
    AND    ACTCRS.NUMORD = (SELECT NUMORD FROM ACTCRS WHERE IDTACTCRS = pIDTACTCRS );

--    X7UTIL.TRACE('ProcessusLieApresDevis:'||to_char(SQL%ROWCOUNT) );

EXCEPTION
    WHEN OTHERS THEN
        X7.GEST_ERREUR_CENTURA(VersionPkg(),
                              0,
                              'AFFBTC02',
                              'ProcessusLieApresDevis',
                              to_char(SQLERRM),
                              sqlcode,
                              DBMS_UTILITY.FORMAT_ERROR_BACKTRACE);
        Raise;
end ProcessusLieApresDevis;


PROCEDURE ProcessusLieApresContrat( pIDTACTCRS      IN  ACTCRS.IDTACTCRS%TYPE,
                                    pIDTCTR         IN  CTR.IDTCTR%type,
                                  sTypMsg          OUT VARCHAR2,
                                  sRetFctCtl       OUT VARCHAR2)
is
begin

    UPDATE    ACTCRS SET
    IDTCTR = pIDTCTR
    WHERE    ACTCRS.IDTAFF = (SELECT IDTAFF FROM ACTCRS WHERE IDTACTCRS = pIDTACTCRS)
    AND    ACTCRS.NUMORD >= (SELECT NUMORD FROM ACTCRS WHERE IDTACTCRS = pIDTACTCRS);

EXCEPTION
    WHEN OTHERS THEN
        X7.GEST_ERREUR_CENTURA(VersionPkg(),
                              0,
                              'AFFBTC02',
                              'ProcessusLieApresContrat',
                              to_char(SQLERRM),
                              sqlcode,
                              DBMS_UTILITY.FORMAT_ERROR_BACKTRACE);
        Raise;
end ProcessusLieApresContrat;


PROCEDURE ActionEnCourApresEcran( pIDTACTCRS       IN  ACTCRS.IDTACTCRS%TYPE)
is
  vIdtAgt AGT.IdtAgt%TYPE;
begin
    vIdtAgt := X7UTIL.CurrentIdtAgt;
    UPDATE    ACTCRS SET
        IDTRET =     0,
        DATFIN =     SYSDATE,
        IDTAGTTRT =  vIdtAgt
    WHERE    ACTCRS.IDTACTCRS = pIDTACTCRS;

    X7.AFFBTC02.AvancementAutoAffaire ( pIDTACTCRS , vIdtAgt );

EXCEPTION
    WHEN OTHERS THEN
        X7.GEST_ERREUR_CENTURA(VersionPkg(),
                              0,
                              'AFFBTC02',
                              'ActionEnCourApresEcran',
                              to_char(SQLERRM),
                              sqlcode,
                              DBMS_UTILITY.FORMAT_ERROR_BACKTRACE);
        Raise;

end ActionEnCourApresEcran;


PROCEDURE AvancementAutoAffaire(pIdtActCrs NUMBER, pIdtAgt VARCHAR2)
IS

  vAvancementAuto Number(1);
  vAvancementAutoSuivante Number(1);
  vIdtPlnAct PLNACT.IdtPlnAct%TYPE;
  vStatutAction   Number(3);
  vActionSuivante Number(12);
  vExecutionAuto Number(1);
  vActionSuivanteFermee Number(1);
  vExecutionAutoNext Number(1);
  vinterventionCreee Number(1);
  vAffairesEnCours Number(3);
  vAffaire Number(12);
  vDateReelle Date;
  vDelaiEtape number;
  vDelaiEcoule number;
  vEtape ACTCRS.IdtEtp%TYPE;
  vEtapeSuivante ACTCRS.IdtEtp%TYPE;
  vEtapeIgnoree number;
  vDateFinAction date;
  vNbr number;
  vIdtRetActionSuivante RET.IdtRet%TYPE;
  vMsg varchar2(4000);
  vProcessusLie CTLACT.PRCACT%TYPE;
  vProcessusLieSuivant CTLACT.PRCACT%TYPE;
  vDerniereActionEtapeIgnoree ACTCRS.IdtActCrs%TYPE;
  vIdtTypCal number;
  e_exit EXCEPTION;
  PRAGMA     EXCEPTION_INIT(e_exit , -20999);

begin
/* Gestion de l'avancement automatique des affaires
  JCD le 17/09/09
  */

  X7UTIL.TRACE(' pIdtActCrs ' || to_char(pIdtActCrs) || ' pIdtAgt ' || pIdtAgt );

  if pIdtactCrs is null then
    X7UTIL.TRACE('ERREUR AFFBTC02.AvancementAutoAffaire');
    X7UTIL.TRACE('ERREUR Parametre vide');
    return;
  end if;

  SAVEPOINT AvancementAutoAffaire_ROLLBACK;

  -- On récupère del'action
    -- avancement automatique
    -- statut
    -- exécution automatique
    -- si elle est liée a une intervention
    -- l'affaire correspondante
    BEGIN
      SELECT
        ACTCRS.IdtPlnAct,
        CTLACT.AVCAUT,
        ACTCRS.IdtRet,
        TYPACT.AUT,
        DECODE(ACTCRS.IdtInt,NULL,0,1),
        ACTCRS.IdtAff,
        ACTCRS.DATREE,
        ACTCRS.IdtEtp,
        ACTCRS.DatFin
      INTO
        vIdtPlnAct,
        vAvancementAuto,
        vStatutAction,
        vExecutionAuto,
        vinterventionCreee,
        vAffaire,
        vDateReelle,
        vEtape,
        vDateFinAction
      FROM CTLACT,TYPACT,ACTCRS
      WHERE CTLACT.IdtCtlAct  = ActCrs.IdtCtlAct
        AND ACTCRS.IdtActCrs  = pIdtActCrs
        AND TYPACT.IDTTYPACT  = CTLACT.IDTTYPACT;
    EXCEPTION
    WHEN NO_DATA_FOUND THEN
      X7UTIL.TRACE('ERREUR AFFBTC02.AvancementAutoAffaire');
      X7UTIL.TRACE('ERREUR sur SELECT Pour recuperer de l''action ('  || pIdtActCrs || '): avancement automatique, statut, exécution automatique, si elle est liée a une intervention, l''affaire correspondante, date reelle');
      RETURN;
    END;

    -- FBE: 24/11/2009 : Correction: Les affaires ne respectent pas le delai de l'etape.
    -- Recherche du nombre d'actions non finies pour l'etape
    select count(*)
      into vNbr
      from ACTCRS
      where IdtAff = vAffaire
       and  IdtEtp = vEtape
       and  (DatFin is null or IdtRet = 9); -- Si l'etape est ignore, on ne prend pas en compte le delai
    -- Si toutes les actions de l'etape sont finies, l'action envoyee est
    -- la derniere de l'etape. On cherche le delai de l'etape
    -- On ne tient pas compte si l'etape est ignoree
    if vNbr = 0 then
      SELECT NVL(Delai, 0),
             IdtTypCal
        INTO vDelaiEtape,
             vIdtTypCal
        FROM ETP, AFF
        where ETP.IdtPlnAct = AFF.IdtPlnAct
         and  ETP.IdtEtp = vEtape
         and  AFF.IdtAff = vAffaire;
      -- Calcul du delai ecoule
--      vDelaiEcoule := sysdate - vDateFinAction;
      vDelaiEcoule := TRTCAL01.NombreJoursOuvres(vIdtTypCal, vDateFinAction, sysdate);
      -- Test si le delai de l'etape est ecoulee
      if vDelaiEcoule < vDelaiEtape then
        -- Rien a faire, on attend que le delai soit ecoule, on sort
        return;
      end if;
    end if;
    -- Fin FBE: 24/11/2009

  -- On récupère l'action suivante dans le plan d'action
    BEGIN
      SELECT
        IdtActCrs,
        DECODE(ACTCRS.DATFIN,NULL,0,1),
        TYPACT.AUT,
        CTLACT.AVCAUT,
        IdtRet,
        ACTCRS.IdtEtp
      INTO
        vActionSuivante,
        vActionSuivanteFermee,
        vExecutionAutoNext,
        vAvancementAutoSuivante,
        vIdtRetActionSuivante,
        vEtapeSuivante
      FROM CTLACT,TYPACT,ACTCRS
      WHERE ACTCRS.IdtAff = vAffaire
        AND ACTCRS.numord = (SELECT NumOrd+1 FROM ACTCRS WHERE IdtActCrs  = pIdtActCrs)
        AND CTLACT.IdtCtlAct = ACTCRS.IdtCtlAct
        AND TYPACT.IDTTYPACT  = CTLACT.IDTTYPACT;
    EXCEPTION
    WHEN NO_DATA_FOUND THEN
      vActionSuivante:=-1;
      vActionSuivanteFermee:=0;
      vExecutionAutoNext:=0;
    END;

    -- On recupere les processus lies si il y en a un sur l'action et l'action suivante
    BEGIN
      SELECT    CTLACT.PRCACT
        INTO
          vProcessusLieSuivant
        FROM    ACTCRS , CTLACT
          WHERE    ACTCRS.IDTACTCRS = vActionSuivante
           AND    ACTCRS.IDTCTLACT = CTLACT.IDTCTLACT;
      EXCEPTION
    WHEN NO_DATA_FOUND THEN
      vProcessusLieSuivant := '';
      END;

    BEGIN
        SELECT    CTLACT.PRCACT
        INTO
          vProcessusLie
        FROM    ACTCRS , CTLACT
          WHERE    ACTCRS.IDTACTCRS = pIdtActCrs
           AND    ACTCRS.IDTCTLACT = CTLACT.IDTCTLACT;
      EXCEPTION
    WHEN NO_DATA_FOUND THEN
      vProcessusLie := '';
      END;


  -- Si l'action est fermée (statut ignorée(6), Terminée Ok(0), Terminée Ko(1), Forcée Ok(2), Forcée KO(3))
  -- FBE : 13/12/2009
--  IF  vStatutAction in (6,0,1,2,3) AND vActionSuivanteFermee=0 THEN
  IF  vDateFinAction is not null AND vActionSuivanteFermee=0 THEN
    -- Si l'action est la dernière du plan d'action
    IF vActionSuivante=-1 THEN
      -- On ferme l'affaire
      -- Si action abandonnée(7), affaire abandonnée dans interactif, docn ne pas marquer terminé.
      -- BPZ 11863 même abandonnée
      --IF vStatutAction <> 7 THEN
        UPDATE AFF SET STT='T', MTRAGT=pIdtAgt, DATFIN=SYSDATE WHERE IdtAff = vAffaire and DATFIN is null;
      --END IF;

      -- JCD : doit être fait à partir du batch...
      -- On ferme également le contact si plus d'affaires en cours...
      --SELECT count(*)
      --INTO vAffairesEnCours
      -- FROM AFF
      --   WHERE AFF.IDTCNT= (SELECT AFF.IDTCNT FROM AFF WHERE AFF.IDTAFF=vAffaire)
      --       AND AFF.IDTCLT=(SELECT IdtClt FROM AFF WHERE IdtAff = vAffaire)
      --            AND AFF.DATFIN IS NULL;
      -- IF vAffairesEnCours=0 THEN
      --   UPDATE CNT SET DATFIN=SYSDATE WHERE IdtCnt = (SELECT IdtCnt FROM AFF WHERE IdtAff = vAffaire) AND IdtClt=(SELECT IdtClt FROM AFF WHERE IdtAff = vAffaire) ;
      -- END IF;

    -- Si l'action n'est pas la dernière, on regarde si la suivante est en avancement automatique
    ELSE
      -- JCD le 02/08/2010: on propage l'information:
      PropagationInfos(pIdtActCrs, vActionSuivante);
      vEtapeIgnoree := 0;
      -- Traitement pour ignorer une etape
      if vEtape <> vEtapeSuivante then
        vDerniereActionEtapeIgnoree := AFFBTC01.IgnorerEtape(vAffaire,vIdtPlnAct,vEtapeSuivante);
        if vDerniereActionEtapeIgnoree is not null then
          vEtapeIgnoree := 1;
        else
          vEtapeIgnoree := 0;
        end if;
      end if;
      if vEtapeIgnoree = 0 then
        -- FBE: 13/11/2014: 12211: La fonction DateToContinue ne doit pas etre utilisee ici,
        --                  car si on est ici, le delai de l'etape a ete respecte.
        --                  DateToContinue recalcul le delai pour chaque action d'une etape, or
        --                  le calcul doit se faire seulement pour la premiere action de l'etape
        -- FBE: 18/11/2014: 12214: Dans le cas ou l'action tombe en erreur, on doit essayer de la faire
        --                  Si elle tombe en erreur, on ignore l'avancement automatique car on avait
        --                  essaye de la faire
        IF vAvancementAutoSuivante=1 or vIdtRetActionSuivante = 5 /*AND DateToContinue(vActionSuivante)<=SYSDATE*/ THEN
          -- La date de début réelle de l'action suivante est renseignée à la date et heure système
          -- Le statut de l'action suivante est passé à "en cours" (4)
          -- FBE: 13/12/2009: L'execution automatique est fait que si l'action n'est pas entamee.
          -- Dans certains cas, l'execution de l'action est fait en double et X7 genere 2 interventions
          -- FBE: 18/11/2014: 12214: On essaie de faire l'action si elle est tombee en erreur
          if vIdtRetActionSuivante is null or vIdtRetActionSuivante = 5 then
            UPDATE ACTCRS SET IDTRET=4, DATREE=SYSDATE WHERE ACTCRS.IdtActCrs=vActionSuivante ;

            -- Dans le cas d'une action liée à une intervention, l'intervention est générée avec l statut "générée"  (execution automatique)
            IF vExecutionAutoNext=1 THEN
              CreationAutoIntervention(vActionSuivante, pIdtAgt);
            END IF;

            -- Execution automatique également dans le cas d'un processus lié spécifique

            select count(*)
              into vNbr
              from PRCACT
              where PrcAct = vProcessusLieSuivant
               and  IdtHwd is not null;
            --IF vProcessusLieSuivant NOT IN ('CLIENT','CONTRA','PNTLVR','PNTCPG','AFFAIR','DEVIS','FACTUR','PUBLI','VLDDVS') THEN
            IF vNbr = 0 and vProcessusLieSuivant <> 'PUBLI' THEN
              X7.AFFBTC02.ProcessusSPC( vActionSuivante,  vMSG, pIdtAgt);
            END IF;
          end if;

        ELSE
          -- FBE : 13/12/2009: Meme correction que pour l'avancement automatique pour question de homogeneite
          IF /*DateToContinue(vActionSuivante)<=SYSDATE and*/ vIdtRetActionSuivante is null THEN
            -- MODE avancement manuel
            -- La date de début réelle de l'action suivante est renseignée à la date et heure système
            -- Le statut de l'action suivante est passé à "en attente" (8)
            -- FBE: Pas de date reelle si statut en attente
            -- FBE: UPDATE ACTCRS SET IDTRET=8, DATREE=SYSDATE WHERE ACTCRS.IdtActCrs=vActionSuivante;
            UPDATE ACTCRS SET IDTRET=8 WHERE ACTCRS.IdtActCrs=vActionSuivante;
          -- Dans le cas d'une action liée à une intervention, l'intervention est générée avec l statut "générée"
          END IF;
        END IF;
      end if;
    END IF;
  END IF;

  -- Si l'action est en cours
  IF  vStatutAction = 4 THEN
  
    -- FBE: Traitement de la fiche 12577: La premiere etape d'un plan d'actions n'est pas ignoree
    -- Par defaut, on considere que l'etape n'est pas ignoree
    vEtapeIgnoree := 0;
    -- Verification s'il s'agit de la premiere action de l'etape
    select count(*)
      into vNbr
      from ACTCRS
      where IdtAff = vAffaire
       and  IdtEtp = vEtape
       and  (DatFin is not null); 
    if vNbr = 0 then
      -- Il s'agit de la premiere action de l'etape. On doit verifier si l'etape doit etre ignoree
      vDerniereActionEtapeIgnoree := AFFBTC01.IgnorerEtape(vAffaire,vIdtPlnAct,vEtape);
      if vDerniereActionEtapeIgnoree is not null then
        vEtapeIgnoree := 1;
      else
        vEtapeIgnoree := 0;
      end if;
    end if;
    -- Si l'etape est ignoree on ne doit rien faire
    if vEtapeIgnoree = 0 then
      -- Dans le cas d'une action liée à une intervention, l'intervention est générée avec l statut "générée"  (execution automatique)
      IF vExecutionAuto=1  AND vinterventionCreee=0 THEN
        CreationAutoIntervention(pIdtActCrs,pIdtAgt);
      END IF;
  
      -- Execution automatique également dans le cas d'un processus lié spécifique
      select count(*)
        into vNbr
        from PRCACT
        where PrcAct = vProcessusLie
         and  IdtHwd is not null;
  --    IF vProcessusLie NOT IN ('CLIENT','CONTRA','PNTLVR','PNTCPG','AFFAIR','DEVIS','FACTUR','PUBLI','VLDDVS') THEN
      if vNbr = 0 and vProcessusLie <> 'PUBLI' then
            X7.AFFBTC02.ProcessusSPC( pIdtActCrs,  vMSG, pIdtAgt);
      END IF;
  
      -- Si la date réelle n'est pas encore renseignée, on la renseigne
      IF vDateReelle is NULL THEN
        UPDATE ACTCRS SET DATREE=SYSDATE WHERE ACTCRS.IdtActCrs=pIdtActCrs;
      END IF;
    end if;

  END IF;

  -- Si l'action est abandonnée
  IF  vStatutAction = 7 THEN
  -- On ferme également le contact si plus d'affaires en cours...
    SELECT count(*)
    INTO vAffairesEnCours
       FROM AFF
       WHERE AFF.IDTCNT= (SELECT AFF.IDTCNT FROM AFF WHERE AFF.IDTAFF=vAffaire)
           AND AFF.IDTCLT=(SELECT IdtClt FROM AFF WHERE IdtAff = vAffaire)
                AND AFF.DATFIN IS NULL;
    -- IF vAffairesEnCours=0 THEN
    --   UPDATE CNT SET DATFIN=SYSDATE WHERE IdtCnt = (SELECT IdtCnt FROM AFF WHERE IdtAff = vAffaire) AND IdtClt=(SELECT IdtClt FROM AFF WHERE IdtAff = vAffaire) ;
    -- END IF;
    
  END IF;

  RecalculDatesPrevues(pIdtActCrs);

  BalayageIncoherences(pIdtActCrs);
  -- Si l'etape a ete ignoree on doit faire avancer l'affaire
  if vEtapeIgnoree = 1 then
    AvancementAutoAffaire(vDerniereActionEtapeIgnoree,pIdtAgt);
  end if;

    -- Si erreur , car impossible de faire mise à jour action suivante ou impossible exécuter intervention, le statut de l'action en cours passe en erreur (5)
    EXCEPTION
    WHEN OTHERS THEN
      ROLLBACK TO AvancementAutoAffaire_ROLLBACK;
      X7UTIL.TRACE('ERREUR AFFBTC02.AvancementAutoAffaire');
      X7UTIL.TRACE('ERREUR non gérée...');
      UPDATE ACTCRS SET IDTRET=5, DatFin = null WHERE ACTCRS.IDTACTCRS= pIdtActCrs;
      DBMS_OUTPUT.Put_Line(SqlErrM || chr(13) || chr(10) || DBMS_UTILITY.FORMAT_ERROR_BACKTRACE);

      X7.GEST_ERREUR_CENTURA(VersionPkg(),
                              0,
                              'AFFBTC02',
                              'AvancementAutoAffaire',
                              to_char(SQLERRM),
                              sqlcode,
                              DBMS_UTILITY.FORMAT_ERROR_BACKTRACE);
      --COMMIT;

END AvancementAutoAffaire;


PROCEDURE CreationAutoIntervention(pIdtActCrs NUMBER,pIdtAgt VARCHAR2)
IS
  vIdtNivAct Number(2);
  vIdtInt Number(8);
  vinterventionCreee number;
  vIDTSML AFF.IDTSML%TYPE;

begin

  -- On regarde le type d'inetrevention à traiter
    -- 1= point de livraison (technique)
    -- 2= point de comptage (technique)
    -- 3= compteur (technique)
    -- 4= compte client (commercial)
    -- 5= contrat (commercial)
    -- 6= aucun (commercial)

  SAVEPOINT CreationAutoIntervention_ROLL;

  SELECT
      CTLACT.IdtNivAct,
      DECODE(ACTCRS.IdtInt,NULL,0,1)
  INTO
      vIdtNivAct,
      vinterventionCreee
  FROM
      ACTCRS,CTLACT
  WHERE
      ACTCRS.IdtActCrs= pIdtActCrs
    AND ACTCRS.IdtCtlAct=CTLACT.IdtCtlAct;

  -- On s'assure que tous les éléments pour créer l'intervention soient bien présents
  -- FBE: 13/12/2009: L'intervention est creee si elle n'est pas encore creee
  IF CreationPossibleIntervention(pIdtActCrs,vIdtNivAct)=1 and vinterventionCreee = 0 THEN

    ---------------------------------------------------
    -- Interventions de type technique

    SELECT SEQ_INT.NEXTVAL INTO vIdtInt FROM DUAL;

    -- BPZ 7543
    -- IDTSML
    SELECT AF.IDTSML
    INTO vIDTSML
    FROM AFF af,ACTCRS ac
    WHERE ac.IDTACTCRS = pIdtActCrs
      AND AC.IDTAFF = Af.IDTAFF
      AND ROWNUM < 2;

    X7UTIL.TRACE('IDTSML :' || vIDTSML);

    -- Compteur
    If vIdtNivAct = 3 THEN
      INSERT INTO INT
         (
         INT.IdtInt,
         INT.IdtCtlAct,
         INT.Sta,
         INT.IdtClt,
          INT.IdtPntLvr,
       INT.IdtPntCpg,
         INT.IdtSrv,
         INT.NbrCnd,
         INT.ClbMinDsj,
         INT.ClbMaxDsj,
         INT.DmtPntCpg,
         INT.IdtUntMsrDmtPntCpg,
         INT.IdtCtr,
         INT.IdtCprAvn,
         INT.RglDsjAvn,
         INT.DatExePrv,
         INT.DatDem,
         INT.IDTSML
         )
         SELECT
           vIdtInt,
           ACTCRS.IDTCTLACT,
           '1',
           ACTCRS.IDTCLT,
           ACTCRS.IDTPNTLVR,
           ACTCRS.IDTPNTCPG,
           PNTCPG.IdtSrv,
           PNTCPG.NbrCnd,
           PNTCPG.ClbMinDsj,
           PNTCPG.ClbMaxDsj,
           PNTCPG.Dmt,
           PNTCPG.IdtUntMsrDmt,
         ACTCRS.IDTCTR,
         ACTCRS.IDTCPR,
         PSSSSC.RglDsj,
           NVL(ACTCRS.DATREE, ACTCRS.DATPRE),
         SYSDATE,
         vIDTSML
        FROM ACTCRS,
               PSSSSC,
             AVTCTR,
             CTR,
             UNTMSR,
             PNTCPG
        WHERE
          UNTMSR.IdtUntMsr(+) = PNTCPG.IdtUntMsrDmt
        AND    PNTCPG.IdtPntLvr(+) = ACTCRS.IdtPntLvr
        AND    PNTCPG.IdtPntCpg(+) = ACTCRS.IdtPntCpg
        AND PSSSSC.IdtPssSsc(+) = AVTCTR.IdtPssSsc
        AND    CTR.IdtCtr(+) = ACTCRS.IdtCtr
        AND    AVTCTR.IdtCtr(+) = CTR.IdtCtr
        AND    AVTCTR.DatFin(+) IS NULL
        AND ACTCRS.IDTACTCRS = pIdtActCrs;

    END IF;

    -- Point de comptage
    If vIdtNivAct = 2 THEN
      INSERT INTO INT
         (
         INT.IdtInt,
         INT.IdtCtlAct,
         INT.Sta,
         INT.IdtClt,
         INT.IdtPntLvr,
         INT.IdtPntCpg,
         INT.IdtSrv,
         INT.NbrCnd,
         INT.ClbMinDsj,
         INT.ClbMaxDsj,
         INT.DmtPntCpg,
         INT.IdtUntMsrDmtPntCpg,
         INT.IdtCtr,
         INT.IdtCprAvn,
         INT.RglDsjAvn,
         INT.DatExePrv,
         INT.DatDem,
         INT.IDTSML
         )
         SELECT
           vIdtInt,
           ACTCRS.IDTCTLACT,
           '1',
           ACTCRS.IDTCLT,
           ACTCRS.IDTPNTLVR,
           ACTCRS.IDTPNTCPG,
           PNTCPG.IdtSrv,
           PNTCPG.NbrCnd,
           PNTCPG.ClbMinDsj,
           PNTCPG.ClbMaxDsj,
           PNTCPG.Dmt,
           PNTCPG.IdtUntMsrDmt,
         ACTCRS.IDTCTR,
           NULL,
         PSSSSC.RglDsj,
           NVL(ACTCRS.DATREE, ACTCRS.DATPRE),
         SYSDATE,
         vIDTSML
        FROM ACTCRS,
               PSSSSC,
             AVTCTR,
             CTR,
             UNTMSR,
             PNTCPG
        WHERE
          UNTMSR.IdtUntMsr(+) = PNTCPG.IdtUntMsrDmt
        AND    PNTCPG.IdtPntLvr(+) = ACTCRS.IdtPntLvr
        AND    PNTCPG.IdtPntCpg(+) = ACTCRS.IdtPntCpg
        AND PSSSSC.IdtPssSsc(+) = AVTCTR.IdtPssSsc
        AND    CTR.IdtCtr(+) = ACTCRS.IdtCtr
        AND    AVTCTR.IdtCtr(+) = CTR.IdtCtr
        AND    AVTCTR.DatFin(+) IS NULL
        AND ACTCRS.IDTACTCRS = pIdtActCrs;

    END IF;

    -- Point de livraison
    If vIdtNivAct = 1 THEN
      INSERT INTO INT
         (
         INT.IdtInt,
         INT.IdtCtlAct,
         INT.Sta,
         INT.IdtClt,
         INT.IdtPntLvr,
         INT.IdtPntCpg,
         INT.IdtSrv,
         INT.NbrCnd,
         INT.ClbMinDsj,
         INT.ClbMaxDsj,
         INT.DmtPntCpg,
         INT.IdtUntMsrDmtPntCpg,
         INT.IdtCtr,
         INT.IdtCprAvn,
         INT.RglDsjAvn,
         INT.DatExePrv,
         INT.DatDem,
         INT.IDTSML
         )
      SELECT
         vIdtInt,
         ACTCRS.IDTCTLACT,
         '1',
         ACTCRS.IDTCLT,
         ACTCRS.IDTPNTLVR,
         ACTCRS.IDTPNTCPG,
         PNTCPG.IdtSrv,
         NULL,
         NULL,
         NULL,
         NULL,
         NULL,
         NULL,
         NULL,
         NULL,
         NVL(ACTCRS.DATREE, ACTCRS.DATPRE),
       SYSDATE,
       vIDTSML
    FROM ACTCRS,
            PSSSSC,
         AVTCTR,
           CTR,
           UNTMSR,
           PNTCPG
    WHERE
          UNTMSR.IdtUntMsr(+) = PNTCPG.IdtUntMsrDmt
        AND    PNTCPG.IdtPntLvr(+) = ACTCRS.IdtPntLvr
        AND    PNTCPG.IdtPntCpg(+) = ACTCRS.IdtPntCpg
        AND PSSSSC.IdtPssSsc(+) = AVTCTR.IdtPssSsc
        AND    CTR.IdtCtr(+) = ACTCRS.IdtCtr
        AND    AVTCTR.IdtCtr(+) = CTR.IdtCtr
        AND    AVTCTR.DatFin(+) IS NULL
        AND ACTCRS.IDTACTCRS = pIdtActCrs;

    END IF;

    ---------------------------------------------------
    -- Interventions de type commercial

    -- Compte client ou Aucun
    If vIdtNivAct = 4 OR vIdtNivAct = 6 THEN
      INSERT INTO INT
         (
         INT.IdtInt,
         INT.IdtCtlAct,
         INT.Sta,
         INT.IdtClt,
          INT.IdtPntLvr,
       INT.IdtPntCpg,
         INT.IdtSrv,
         INT.NbrCnd,
         INT.ClbMinDsj,
         INT.ClbMaxDsj,
         INT.DmtPntCpg,
         INT.IdtUntMsrDmtPntCpg,
         INT.IdtCtr,
         INT.IdtCprAvn,
         INT.RglDsjAvn,
         INT.DatExePrv,
         INT.DatDem,
         INT.IDTSML
         )
         SELECT
           vIdtInt,
           ACTCRS.IDTCTLACT,
           '1',
           ACTCRS.IDTCLT,
           NULL,
           NULL,
           NULL,
           NULL,
           NULL,
           NULL,
           NULL,
           NULL,
         NULL,
         NULL,
         NULL,
           NVL(ACTCRS.DATREE, ACTCRS.DATPRE),
         SYSDATE,
         vIDTSML
        FROM ACTCRS
        WHERE ACTCRS.IDTACTCRS = pIdtActCrs;

    END IF;

    -- Contrat
    If vIdtNivAct = 5 THEN
      INSERT INTO INT
         (
         INT.IdtInt,
         INT.IdtCtlAct,
         INT.Sta,
         INT.IdtClt,
         INT.IdtPntLvr,
         INT.IdtPntCpg,
         INT.IdtSrv,
         INT.NbrCnd,
         INT.ClbMinDsj,
         INT.ClbMaxDsj,
         INT.DmtPntCpg,
         INT.IdtUntMsrDmtPntCpg,
         INT.IdtCtr,
         INT.IdtCprAvn,
         INT.RglDsjAvn,
         INT.DatExePrv,
         INT.DatDem,
         INT.IDTSML
         )
         SELECT
           vIdtInt,
           ACTCRS.IDTCTLACT,
           '1',
           ACTCRS.IDTCLT,
           ACTCRS.IDTPNTLVR,
           ACTCRS.IDTPNTCPG,
           PNTCPG.IdtSrv,
           PNTCPG.NbrCnd,
           PNTCPG.ClbMinDsj,
           PNTCPG.ClbMaxDsj,
           PNTCPG.Dmt,
           PNTCPG.IdtUntMsrDmt,
         ACTCRS.IDTCTR,
           NULL,
         PSSSSC.RglDsj,
           NVL(ACTCRS.DATREE, ACTCRS.DATPRE),
         SYSDATE,
         vIDTSML
        FROM ACTCRS,
               PSSSSC,
             AVTCTR,
             CTR,
             UNTMSR,
             PNTCPG
        WHERE
          UNTMSR.IdtUntMsr(+) = PNTCPG.IdtUntMsrDmt
        AND    PNTCPG.IdtPntLvr(+) = CTR.IdtPntLvr
        AND    PNTCPG.IdtPntCpg(+) = CTR.IdtPntCpg
        AND PSSSSC.IdtPssSsc(+) = AVTCTR.IdtPssSsc
        AND    AVTCTR.DatFin IS NULL
        AND    AVTCTR.IdtCtr = ACTCRS.IdtCtr
        AND    CTR.IdtCtr(+) = ACTCRS.IdtCtr
        AND ACTCRS.IDTACTCRS = pIdtActCrs;

    END IF;

    -- Mise a jour de l'action avec l'intervention créée
    If vIdtNivAct in (1,2,3,4,5,6) THEN
      -- FBE: 08/12/2009 : La generation de l'intervention ne doit pas fermer l'action
      -- JCD: 31/03/2010
      UPDATE ACTCRS SET IDTINT=vIdtInt
             -- DATFIN=SYSDATE,
             -- IDTAGTTRT=pIdtAgt
             -- IDTRET=0
        WHERE ACTCRS.IdtACtCrs=pIdtActCrs;
    END IF;

  ELSIF vinterventionCreee = 0 then
    UPDATE ACTCRS SET IDTRET=5, DatFin = null WHERE ACTCRS.IDTACTCRS= pIdtActCrs;

  END IF;

  AvancementAutoAffaire(pIdtActCrs,pIdtAgt);

EXCEPTION
WHEN OTHERS THEN
    ROLLBACK TO CreationAutoIntervention_ROLL;

    X7UTIL.TRACE('ERREUR NON GEREE lors de la création de l''intervention ' || vIdtInt || ' de type (IDTNIVACT):' || vIdtNivAct || ', pour l''action ' || pIdtActCrs);
    UPDATE ACTCRS SET IDTRET=5, DatFin = null WHERE ACTCRS.IDTACTCRS= pIdtActCrs;
    X7.GEST_ERREUR_CENTURA(VersionPkg(),
                              0,
                              'AFFBTC02',
                              'CreationAutoIntervention',
                              to_char(SQLERRM),
                              sqlcode,
                              DBMS_UTILITY.FORMAT_ERROR_BACKTRACE);
    --COMMIT;

END CreationAutoIntervention;


FUNCTION CreationPossibleIntervention(pIdtActCrs NUMBER,pIdtNivAct VARCHAR2)
RETURN NUMBER
IS
  vOK Number(1);
  vManqueClt Number(1);
  vManquePntCpg Number(1);
  vManquePntLvr Number(1);
  vManqueNtr Number(1);
  vManqueDatPrv Number(1);

BEGIN

     SELECT
         DECODE(ACTCRS.IDTCLT,NULL,1,0),
         DECODE(ACTCRS.IDTPNTLVR,NULL,1,0),
         DECODE(ACTCRS.IDTPNTCPG,NULL,1,0),
       DECODE(CTLACT.ACT,NULL,1,0),
       DECODE(NVL(ACTCRS.DATREE, ACTCRS.DATPRE),NULL,1,0)
    INTO
      vManqueClt,
      vManquePntCpg,
      vManquePntLvr,
      vManqueNtr,
      vManqueDatPrv
    FROM ACTCRS,
         CTLACT
    WHERE
         CTLACT.IDTCTLACT(+)= ACTCRS.IDTCTLACT
         AND ACTCRS.IDTACTCRS = pIdtActCrs;

  vOK:=1;


  -- Valeurs obligatoires: "nature", "prévue le"
  IF vManqueNtr=1 THEN
    X7UTIL.TRACE('Création de l''intervention de type (IDTNIVACT):' || pIdtNivAct || ' , pour l''action ' || pIdtActCrs || 'impossible, il manque la nature d''intervention.');
    vOK:=0;
  END IF;

  IF vManqueDatPrv=1 THEN
    X7UTIL.TRACE('Création de l''intervention de type (IDTNIVACT):' || pIdtNivAct || ' , pour l''action ' || pIdtActCrs || 'impossible, il manque la date prévue.');
    vOK:=0;
  END IF;

  -- Si intervention technique: valeur obligatoire supplémentaire: point de comptage
  IF pIdtNivAct in (1,2,3) THEN
    IF vManquePntCpg=1 OR vManquePntLvr=1 THEN
      X7UTIL.TRACE('Création de l''intervention de type (IDTNIVACT):' || pIdtNivAct || ' , pour l''action ' || pIdtActCrs || 'impossible, il manque le point de comptage.');
      vOK:=0;
    END IF;
  -- Si intervention commerciale: valeur obligatoire supplémentaire: client
  -- Client obligatoirement renseigné pourf aire une affaire...
  -- JCD: 31/03/2010
  -- ELSE
  --  IF vManquePntCpg=1 OR vManquePntLvr=1 THEN
  --    X7UTIL.TRACE('Création de l''intervention de type (IDTNIVACT):' || pIdtNivAct || ' , pour l''action ' || pIdtActCrs || 'impossible, il manque le point de comptage.');
  --    vOK:=0;
  --  END IF;

  END IF;

  RETURN vOK;
END CreationPossibleIntervention;

PROCEDURE RecalculDatesPrevues(pIdtActCrs NUMBER)
IS

  vDateToContinue Date;
  --vMaxDelaiDurMin Number(5);)

  CURSOR cActCrs IS
          SELECT
            ACTCRS.DatPre DatPre,
            --DECODE(ACTCRS.IDTRET,6,0,ACTCRS.Delai),
            NVL(DECODE(ACTCRS.IDTRET,6,0,9,0,CTLACT.Durmin)/(60*24),0),
            ACTCRSNEXT.IdtActCrs,
        ACTCRSNEXT.Datpre DatPreNext
        FROM ACTCRS, CTLACT, ACTCRS ACTCRSNEXT
      WHERE ACTCRS.IDTAFF =  ACTCRSNEXT.IDTAFF(+)
        AND ACTCRS.NUMORD+1 = ACTCRSNEXT.NUMORD(+)
        AND ACTCRS.IDTCTLACT = CTLACT.IDTCTLACT
        AND ACTCRS.IdtAff = (SELECT IdtAff FROM ACTCRS WHERE IdtActCrs = pIdtActCrs)
        AND ACTCRS.numord >= (SELECT NumOrd FROM ACTCRS WHERE IdtActCrs  = pIdtActCrs)
      order by ACTCRS.NUMORD;

  type t_DatPre is table of ACTCRS.DatPre%type index by binary_integer;
  tc_DatPre t_DatPre;
  type t_Delai is table of NUMBER(14,10) index by binary_integer;
  tc_Delai t_Delai;
  type t_IdtActCrs is table of ACTCRS.IdtActCrs%type index by binary_integer;
  tc_IdtActCrs t_IdtActCrs;
  type t_DatPreNext is table of ACTCRS.Datpre%type index by binary_integer;
  tc_DatPreNext t_DatPreNext;
  --type t_Durmin is table of CTLACT.Durmin%type index by binary_integer;
  --tc_Durmin t_Durmin;

--  prenext date;
--  pre     date;

BEGIN

  open cActCrs;
  fetch cActCrs bulk collect into tc_DatPre,tc_Delai,tc_IdtActCrs,tc_DatPreNext;

  for i in 1..tc_DatPre.count loop

    --vDateToContinue := DateToContinue(tc_IdtActCrs(i));

--    prenext := tc_DatPreNext(i);
--    pre     := tc_DatPre(i);

    -- Si date prévue suivante < delai + date prévue -> date prévue suivante = date prévue + delai
--    IF tc_DatPreNext(i) <= tc_DatPre(i)  + tc_Delai(i) THEN
--      if i + 1 <= tc_DatPre.count then
--         tc_DatPre(i + 1) := tc_DatPre(i)  + tc_Delai(i);
--      end if;
--      UPDATE ACTCRS
--         SET DatPre = tc_DatPre(i+1)  ---+ tc_Delai(i)
--      WHERE IdtActCrs = tc_IdtActCrs(i);
--    END IF;
    -- FBE: Prise en compte du calendrier de jours ouvres
    IF tc_DatPreNext(i) <= TRTCAL01.JourOuvreSuivant(1,tc_DatPre(i),tc_Delai(i)) THEN
      if i + 1 <= tc_DatPre.count then
         tc_DatPre(i + 1) := TRTCAL01.JourOuvreSuivant(1,tc_DatPre(i), tc_Delai(i));
      end if;
      UPDATE ACTCRS
         SET DatPre = tc_DatPre(i+1)  ---+ tc_Delai(i)
      WHERE IdtActCrs = tc_IdtActCrs(i);
    END IF;
  end loop;

  close cActCrs;

END RecalculDatesPrevues;

FUNCTION DateToContinue(pIdtActCrs NUMBER)
RETURN DATE
IS
-- Retourne la date a partir de laquelle on peut passer l'action en cours.

  vDateToCOntinue DATE;
  vDelaiMax NUMBER(4,2);
  vDateFinAct DATE;
  vDerniereActTrtNonIgnoree Number(12);
  vPremiereActionEtape Number(12);

BEGIN

    BEGIN
      SELECT IDTACTCRS
      INTO vDerniereActTrtNonIgnoree
      FROM(
        SELECT ACTCRS.IDTACTCRS
          FROM ACTCRS
          WHERE ACTCRS.DATFIN IS NOT NULL
            AND ACTCRS.IDTRET not in (6,9)
            AND ACTCRS.IdtAff = (SELECT ACTCRS.IdtAff FROM ACTCRS WHERE ACTCRS.IdtActCrs=pIdtActCrs)
            ORDER BY NUMORD DESC)
      WHERE ROWNUM=1;
    EXCEPTION
    WHEN NO_DATA_FOUND THEN
      vDerniereActTrtNonIgnoree := -1;
    END;

    IF vDerniereActTrtNonIgnoree = -1 THEN
      vDateToContinue := SYSDATE;
      RETURN vDateToContinue;
    END IF;

    BEGIN

      -- JCD TODO: pourquoi ce max???

      --SELECT MAX(DELAI)
      --  INTO vDelaiMax
      --  FROM(
      --    SELECT SUM(ACTCRS.Delai) DELAI
      --         FROM ACTCRS
      --         WHERE ACTCRS.IdtAff=(SELECT ACTCRS.IdtAff FROM ACTCRS WHERE ACTCRS.IdtActCrs=vDerniereActTrtNonIgnoree)
      --           AND ACTCRS.IdtEtp= (SELECT ACTCRS.IdtEtp FROM ACTCRS WHERE ACTCRS.IdtActCrs=vDerniereActTrtNonIgnoree)
      --        GROUP BY ACTCRS.IdtEtp
      --     UNION
      --     SELECT ETP.Delai DELAI
      --         FROM ETP
      --         WHERE  ETP.IdtEtp= (SELECT ACTCRS.IdtEtp FROM ACTCRS WHERE ACTCRS.IdtActCrs=vDerniereActTrtNonIgnoree)
      --           AND  ETP.IdtPlnAct=(SELECT ACTCRS.IdtPlnAct FROM ACTCRS WHERE ACTCRS.IdtActCrs=vDerniereActTrtNonIgnoree));

        SELECT ETP.Delai DELAI
       INTO vDelaiMax
          FROM ETP
          WHERE  ETP.IdtEtp= (SELECT ACTCRS.IdtEtp FROM ACTCRS WHERE ACTCRS.IdtActCrs=vDerniereActTrtNonIgnoree)
       AND  ETP.IdtPlnAct=(SELECT ACTCRS.IdtPlnAct FROM ACTCRS WHERE ACTCRS.IdtActCrs=vDerniereActTrtNonIgnoree);

    EXCEPTION
    WHEN NO_DATA_FOUND THEN
      X7UTIL.TRACE('ERREUR AFFBTC02.DateToContinue');
      X7UTIL.TRACE('ERREUR sur SELECT Pour recuperer de l''action ('  || pIdtActCrs || '): le delai max');
      RETURN NULL;
    END;

    BEGIN
      SELECT IDTACTCRS
        INTO vPremiereActionEtape
        FROM
        (SELECT ACTCRS.IdtActCrs IDTACTCRS
          FROM  ACTCRS
          WHERE ACTCRS.IdtAff=(SELECT ACTCRS.IdtAff FROM ACTCRS WHERE ACTCRS.IdtActCrs=vDerniereActTrtNonIgnoree)
            AND ACTCRS.IdtEtp= (SELECT ACTCRS.IdtEtp FROM ACTCRS WHERE ACTCRS.IdtActCrs=vDerniereActTrtNonIgnoree)
            ORDER BY ACTCRS.NumOrd ASC)
        WHERE ROWNUM=1;
    EXCEPTION
    WHEN NO_DATA_FOUND THEN
      X7UTIL.TRACE('ERREUR AFFBTC02.DateToContinue');
      X7UTIL.TRACE('ERREUR sur SELECT Pour recuperer de l''action ('  || pIdtActCrs || '): la premiere action de l''etape');
      RETURN NULL;
    END;

    BEGIN
      SELECT ACTCRS.DatFin
        INTO  vDateFinAct
        FROM  ACTCRS WHERE ACTCRS.IdtActCrs=vPremiereActionEtape;
    EXCEPTION
    WHEN NO_DATA_FOUND THEN
      X7UTIL.TRACE('ERREUR AFFBTC02.DateToContinue');
      X7UTIL.TRACE('ERREUR sur SELECT Pour recuperer de l''action ('  || pIdtActCrs || '): la date de fin de l''action');
      RETURN NULL;
    END;

--    vDateToContinue := vDateFinAct + vDelaiMax;
    vDateToContinue := TRTCAL01.JourOuvreSuivant(1,vDateFinAct, vDelaiMax);

    RETURN vDateToContinue;

END DateToContinue;


FUNCTION Verrou_AFF(pIDTAFF AFF.IDTAFF%type)
--        --------- Version du package utilisé
  RETURN NUMBER
IS
    verrou  exception;
    pragma  exception_init ( verrou, -54 ) ;
    var     number;
BEGIN

    BEGIN
        Select 1 into var from aff where idtaff = pIDTAFF for update nowait;
    EXCEPTION
        WHEN verrou THEN
            RETURN 0;
    END;

    RETURN 1;

END Verrou_AFF;

FUNCTION Verrou_ACTCRS(pIDTACTCRS ACTCRS.IDTACTCRS%type)
--        --------- Version du package utilisé
  RETURN NUMBER
IS
    verrou  exception;
    pragma  exception_init ( verrou, -54 ) ;
    var     number;
BEGIN

    BEGIN
        -- FBE: 12210:
        Select 1 into var from actcrs where IdtActCrs = pIDTACTCRS for update nowait;
    EXCEPTION
        WHEN verrou THEN
            RETURN 0;
    END;

    RETURN 1;

END Verrou_ACTCRS;

FUNCTION Verrou_CNT(pROWID rowid)
--        --------- Version du package utilisé
  RETURN NUMBER
IS
    verrou  exception;
    pragma  exception_init ( verrou, -54 ) ;
    var     number;
BEGIN

    BEGIN
        Select 1 into var from cnt where rowid = pROWID for update nowait;
    EXCEPTION
        WHEN verrou THEN
            RETURN 0;
    END;

    RETURN 1;

END Verrou_CNT;


PROCEDURE AvancementBatch
IS

  vIdtActCrs Number(12);

  --Liste des contacts non fermés sans affaires ouvertes, mais avec au moins une affaire
--  CURSOR cCnt IS
--    -- Contacts ouverts ayant des affaires fermées
--     SELECT CNT.IdtClt,CNT.IdtCnt,CNT.DatEnr,  CNT.rowid
--      FROM CNT
--      WHERE CNT.DATFIN IS NULL
--      AND NOT EXISTS (SELECT 1 FROM aff where idtclt = cnt.idtclt and idtcnt = cnt.idtcnt and datfin is null)
--     minus
--     -- Contacts ouverts ayant des affaires ouvertes
--     SELECT CNT.IdtClt,CNT.IdtCnt,CNT.DatEnr,  CNT.rowid
--      FROM CNT
--      WHERE CNT.DATFIN IS NULL
--      AND EXISTS (SELECT 1 FROM aff where idtclt = cnt.idtclt and idtcnt = cnt.idtcnt and datfin is not null);

--      --bpz 11863 11530: Contacts sans affaires non clôturés au bout de 24H 
  --Liste des contacts non fermés sans affaires ouvertes, mais avec au moins une affaire
  CURSOR cCnt IS
     SELECT CNT.IdtClt,CNT.IdtCnt,CNT.DatEnr,  CNT.rowid
--     ,(SELECT count(*) FROM aff where idtclt = cnt.idtclt and idtcnt = cnt.idtcnt) count
--     ,(SELECT count(*) FROM aff where idtclt = cnt.idtclt and idtcnt = cnt.idtcnt and datfin is null) OUV
--     ,(SELECT count(*) FROM aff where idtclt = cnt.idtclt and idtcnt = cnt.idtcnt and datfin is not null) FERME
      FROM CNT
      WHERE CNT.DATFIN IS NULL
      -- and (SELECT count(*) FROM aff where idtclt = cnt.idtclt and idtcnt = cnt.idtcnt) > 0
      AND
      (SELECT count(*) FROM aff where idtclt = cnt.idtclt and idtcnt = cnt.idtcnt)
      - (SELECT count(*) FROM aff where idtclt = cnt.idtclt and idtcnt = cnt.idtcnt and datfin is not null)
      = 0;


  vIdtClt CNT.IdtClt%TYPE;
  vIdtCnt CNT.IdtCnt%TYPE;
  vDatEnr CNT.DatEnr%TYPE;
  vRowid  rowid;

  --Liste des affaires commencées a faire avancer
--  CURSOR cAff IS
--      SELECT * FROM AFF
--        WHERE AFF.DATFIN IS NULL
--        AND IDTAFF IN (SELECT IDTAFF FROM ACTCRS
--                        WHERE ACTCRS.DATFIN IS NOT NULL
--                        GROUP BY IDTAFF
--                        HAVING COUNT(*) > 0) ;

  CURSOR cAff IS
    select IdtAff from ACTCRS where DatFin is null
    minus
    select IdtAff from ACTCRS where IdtRet in (4,8);

  rAff cAff%ROWTYPE;
  vIdtAff AFF.IdtAff%TYPE;

  vAffairesEnCours Number(3);
  vAffairesSurContact Number(3);

  vDelaiAvantFermetureContact Number(3);
  vFermetureAutoContact Number(1);

BEGIN

  -- Délai avant fermeture du contact
  SELECT NVL(SPRCNT,0),DELSPRCNT
    INTO  vFermetureAutoContact,
          vDelaiAvantFermetureContact
    FROM PRMGNR;

  --JCD le 04/06/2012 #9903
  -- Ancien emplacement de la fermeture des conatcts (déplacer après avancement des affaires)

  OPEN cAff;
  LOOP
    FETCH cAff INTO rAff;
    EXIT WHEN cAff%NOTFOUND;
    vIdtAff := rAff.IdtAff;

    if Verrou_AFF(rAFF.idtaff) = 1 then

        BEGIN

            -- On recupere la derniere action traitée
            SELECT IDTACTCRS
            INTO  vIdtActCrs
              FROM (
                SELECT ACTCRS.IDTACTCRS
                  FROM ACTCRS
                  WHERE ACTCRS.DATFIN IS NOT NULL   -- Correction FBE: La derniere action traitee est avec DatFin not null
                  AND ACTCRS.IDTAFF=vIdtAff
                  ORDER BY NUMORD DESC)
                  WHERE ROWNUM=1;

            if Verrou_ACTCRS(vIdtActCrs) = 1 then

                -- On lance la procedure d'avancement de l'affaire
                AvancementAutoAffaire(vIdtActCrs, 'BATCH');

                -- On ferme le contact si plus d'affaires en cours...
                --JCD le 04/06/2012 #9903   (traité après...)
                --SELECT count(*)
                --INTO vAffairesEnCours
                --FROM AFF
                --  WHERE AFF.IDTCNT= (SELECT AFF.IDTCNT FROM AFF WHERE AFF.IDTAFF=vIdtAff)
                --      AND AFF.IDTCLT=(SELECT IdtClt FROM AFF WHERE IdtAff = vIdtAff)
                --           AND AFF.DATFIN IS NULL;
                --IF vAffairesEnCours=0 THEN
                --  UPDATE CNT SET DATFIN=SYSDATE WHERE IdtCnt = (SELECT IdtCnt FROM AFF WHERE IdtAff = vIdtAff) AND IdtClt=(SELECT IdtClt FROM AFF WHERE IdtAff = vIdtAff) ;
                --END IF;

                COMMIT;
            end if;

        EXCEPTION
        WHEN OTHERS THEN
          X7UTIL.TRACE('ERREUR AFFBTC02.AvancementBatch');
          X7UTIL.TRACE('ERREUR sur SELECT Pour recuperer la derniere action terminée de l''affaire ' || vIdtAff ||'.');
          X7.GEST_ERREUR_CENTURA(VersionPkg(),
                              0,
                              'AFFBTC02',
                              'AvancementBatch',
                              to_char(SQLERRM),
                              sqlcode,
                              DBMS_UTILITY.FORMAT_ERROR_BACKTRACE);
        END;
    end if;

  END LOOP;
  CLOSE cAff;

  --JCD le 04/06/2012 #9903
  -- On ratisse tous les contacts qui n'ont plus d'affaire en cours et on les ferme.
  OPEN cCnt;
  LOOP
    FETCH cCnt INTO vIdtClt,vIdtCnt,vDatEnr , vRowid;
    EXIT WHEN cCnt%NOTFOUND;

      BEGIN
         /* -- Il faut que le contact ait au moins eu une affaire pour etre cloturé
          -- On compte le nombre d'affaires fermées
          SELECT count(*)
            INTO  vAffairesSurContact
            FROM AFF
            WHERE AFF.IdtClt = vIdtClt
            AND   AFF.IdtCnt = vIdtCnt;

          -- On ferme le contact si plus d'affaires en cours...
          SELECT count(*)
            INTO vAffairesEnCours
            FROM AFF
            WHERE AFF.IDTCNT= vIdtCnt
              AND AFF.IDTCLT= vIdtClt
              AND AFF.DATFIN IS NULL;

            --JCD le 04/06/2012 #9903
            IF vAffairesEnCours=0 AND vAffairesSurContact>0 AND vDatEnr+vDelaiAvantFermetureContact<=SYSDATE AND vFermetureAutoContact=1 THEN
                if Verrou_CNT(vRowid) = 1 then
                  UPDATE CNT SET
                  DATFIN=SYSDATE
                  WHERE IdtCnt = vIdtCnt
                    AND IdtClt= vIdtClt;
                end if;
            END IF;
            */

            IF vDatEnr+vDelaiAvantFermetureContact<=SYSDATE AND vFermetureAutoContact=1 THEN
                if Verrou_CNT(vRowid) = 1 then
                  UPDATE CNT SET
                  DATFIN=SYSDATE
                  WHERE IdtCnt = vIdtCnt
                    AND IdtClt= vIdtClt;
                end if;
            END IF;

          --If (vAffairesFermees>0) OR (vAffairesFermees=0 AND vDatEnr+vDelaiAvantFermetureContact<=SYSDATE AND vFermetureAutoContact=1) THEN
          --  UPDATE CNT SET DATFIN=SYSDATE WHERE IdtCnt = vIdtCnt AND IdtClt = vIdtClt;
          --END IF;

      EXCEPTION
      WHEN OTHERS THEN
        X7UTIL.TRACE('ERREUR AFFBTC02.AvancementBatch');
        X7UTIL.TRACE('ERREUR sur UPDATE pour fermeture des contacts sans affaire contact: IDTCLT=' || vIdtClt ||', IDTCNT = ' || vIdtCnt ||'.');
        X7.GEST_ERREUR_CENTURA(VersionPkg(),
                              0,
                              'AFFBTC02',
                              'AvancementBatch',
                              to_char(SQLERRM),
                              sqlcode,
                              DBMS_UTILITY.FORMAT_ERROR_BACKTRACE);
      END;

  END LOOP;
  CLOSE cCnt;
  COMMIT;

EXCEPTION
    WHEN OTHERS THEN
        X7.GEST_ERREUR_CENTURA(VersionPkg(),
                              0,
                              'AFFBTC02',
                              'AvancementBatch',
                              to_char(SQLERRM),
                              sqlcode,
                              DBMS_UTILITY.FORMAT_ERROR_BACKTRACE);
        Raise;

END AvancementBatch;

--******************************************************************************

PROCEDURE ProcessusSPC( pIdtActCrs IN NUMBER,
                        pErrorMsg OUT VARCHAR2,
                        pIdtAgt IN VARCHAR2)
IS
  vMsg varchar2(4000);
  vDatReeAct DATE;
  vInter ACTCRS.IDTINT%TYPE;
BEGIN

  SAVEPOINT ProcessusSPC_ROLLBACK;

  -- Appel de la procedure du processus lié spécifique: ACTCRS01_SPC
  -- FBE: 12213: Gestion d'exception lors de l'appel au cas ou les erreurs ne sont pas geres dans ACTCRS01_SPC
  BEGIN
    X7.ACTCRS01_SPC(pIdtActCrs, vMsg);
    pErrorMsg:= vMsg;
  EXCEPTION
    when others then
      pErrorMsg := SQLERRM || chr(13) || chr(10) || DBMS_UTILITY.FORMAT_ERROR_BACKTRACE;
  END;


  -- En cas de message d'erreur on arrete le traitement et on ajoute l'erreur dans la note de la fiche action
  IF pErrorMsg IS NOT NULL THEN
    pErrorMsg := substr(pErrorMsg,1,2000);
    -- On rollback le traitement effectué dans ACTCRS01_SPC
    ROLLBACK TO ProcessusSPC_ROLLBACK;
    -- On insere le message d'erreur dans la note
    INSERT INTO NOTE (
        IDTNOTE,
        IDTSQCGNR,
        TXT,
        DATCRT,
        IDTAGT)
      VALUES (
        SEQ_NOTE.nextval,
        (select IDTSQCGNR from x7.ACTCRS where IdtActCRs = pIdtActCrs),
        pErrorMsg,
        sysdate,
        pIdtAgt
        );
    -- On marque l'acion en erreur
    UPDATE ACTCRS SET IDTRET=5, DatFin = null WHERE ACTCRS.IDTACTCRS= pIdtActCrs;
    -- On commit ces modifications
    --COMMIT;
  -- Si le traitement s'est bien passé,
  ElSE
    -- On s'assure que l'action ait bien été passée à "en cours" en cas d'avancement automatique
    SELECT DATREE INTO vDatReeAct FROM ACTCRS WHERE ACTCRS.IDTACTCRS= pIdtActCrs;
    IF vDatReeAct IS NULL THEN
      UPDATE ACTCRS SET DATREE=SYSDATE
       WHERE ACTCRS.IDTACTCRS= pIdtActCrs;
    END IF;
    -- On marque l'action comme terminée
    -- JCD le 04/06/2014
    BEGIN
        SELECT    ACTCRS.IDTINT
        INTO
          vInter
        FROM    ACTCRS
          WHERE    ACTCRS.IDTACTCRS = pIdtActCrs;
      EXCEPTION
    WHEN NO_DATA_FOUND THEN
      vInter := 0;
      END;

    if vInter IS NULL then
      UPDATE ACTCRS SET IDTRET=0, DATFIN=SYSDATE, IDTAGTTRT=pIdtAgt
         WHERE ACTCRS.IDTACTCRS= pIdtActCrs;
    END IF;
    -- Il faut faire le commit au cas ou le suivant est a nouveau en automatique
    --COMMIT;
    -- On fait avancer l'affaire
    X7.AFFBTC02.AvancementAutoAffaire(pIdtActCrs, pIdtAgt);
  END IF;

EXCEPTION
    WHEN OTHERS THEN
        X7.GEST_ERREUR_CENTURA(VersionPkg(),
                              0,
                              'AFFBTC02',
                              'ProcessusSPC',
                              to_char(SQLERRM),
                              sqlcode,
                              DBMS_UTILITY.FORMAT_ERROR_BACKTRACE);
        Raise;
END ProcessusSPC;

--******************************************************************************

PROCEDURE BalayageIncoherences( pIdtActCrs IN NUMBER )
IS
  vMsg varchar2(255);
  vDatReeAct DATE;
  vIdtAff AFF.IdtAff%TYPE;
  vIdtActCrs ACTCRS.IdtACtCrs%TYPE;
  vIdtRet ACTCRS.IdtRet%TYPE;

  vRowNum Number :=0;

  vAVCAUT  CTLACT.AVCAUT%type;

  CURSOR cActCrs IS
    SELECT
      ACTCRS.IdtRet,
      ACTCRS.IdtActCrs,
      --ROWNUM Ligne,
      CTLACT.AVCAUT
      FROM ACTCRS,  CTLACT
      WHERE ACTCRS.IDTAFF =  vIdtAff
        AND ACTCRS.DatFin IS NULL
        AND CTLACT.IdtCtlAct  = ActCrs.IdtCtlAct
      order by  ACTCRS.NUMORD;
BEGIN
-- On balaie l'affaire en cours pour vérifier qu'il n'y a pas d'inchérences entre les actions.
-- Si c'est le cas , on logue l'erreur. (voir par la suite a renvoyer un emssage d'erreur voire ajouter une note)

 -- BEGIN
    SELECT IdtAff INTO vIdtAff FROM ACTCRS WHERE IdtActCrs = pIdtActCrs;
 -- END;

  -- On recupere la premiere action non terminée, et on parcours les suivantes
  OPEN cActCrs;

  LOOP
    FETCH cActCrs INTO vIdtRet,vIdtActCrs,vAVCAUT;

     vRowNum := vRowNum + 1 ;
    EXIT WHEN cActCrs%NOTFOUND;

  -- On exclut la premiere ligne qui est soit en cours soit en attente, soit NULL
  IF vRowNum <> 1 THEN
     --update actcrs set idtret=decode(vAVCAUT, 1, 4, 8) where idtactcrs = vIdtActCrs; -- and nvl(vidtret,999)!=decode(vAVCAUT, 1, 4, 8);
  --else
    -- Si le statut est en attente, on le passe à NULL
    IF vIdtRet='8' THEN
      UPDATE ACTCRS SET IDTRET=NULL WHERE IDTACTCRS=vIdtActCrs;
    -- Sinon message d'erreur
    ELSIF (vIdtRet IS NOT NULL) THEN
      X7UTIL.TRACE('L''action n''est pas dans état normal son statut aurait dû être null, l''action précédente n''est pas traitée');
    END IF;
   END IF;
  END LOOP;
  CLOSE cActCrs;
END BalayageIncoherences;

PROCEDURE PropagationInfos( pIdtActCrs IN NUMBER, pIdtActCrsSvi IN NUMBER )
IS
BEGIN
-- La propagation des informations Référence et type d?opération est seulement pour les actions avec le processus lié « Validation du devis »
-- Fait dans l'interactif...

 -- Si pas d'action suivante, pas d'information à propager.
 IF pIdtActCrsSvi<>-1 THEN
  UPDATE ACTCRS SET
              (ACTCRS.IDTCLT,ACTCRS.IDTCTR,ACTCRS.IDTPNTLVR,ACTCRS.IDTPNTCPG,ACTCRS.IDTCPTCLT,ACTCRS.IDTCPR, ACTCRS.IdtClt2, ACTCRS.IdtCtrFrn)
              =
              (SELECT ACTCRS.IDTCLT,ACTCRS.IDTCTR,ACTCRS.IDTPNTLVR,ACTCRS.IDTPNTCPG,ACTCRS.IDTCPTCLT,ACTCRS.IDTCPR, ACTCRS.IdtClt2, ACTCRS.IdtCtrFrn
                FROM ACTCRS
                WHERE ACTCRS.IDTACTCRS= pIdtActCrs)
    WHERE ACTCRS.IDTACTCRS= pIdtActCrsSvi ;
  END IF;
END PropagationInfos;

PROCEDURE ProcessusLieApresEcheancier( pIDTACTCRS      IN  ACTCRS.IDTACTCRS%TYPE,
                                    pEchPmt       IN  ECHPMT.EchPmt%type,
                                  sTypMsg          OUT VARCHAR2,
                                  sRetFctCtl       OUT VARCHAR2)
is
    --vidtopr opr.idtopr%type;
begin

--    X7UTIL.TRACE('ProcessusLieApresDevis:'||to_char(pIDTACTCRS)||' '||to_char(pIDTFAC) );
--
--    SELECT OPR.IDTOPR
--    into vidtopr
--    FROM OPR,FAC
--    WHERE IDTFAC = pIDTFAC AND FAC.NUMFCT = OPR.RFR;
--
--    X7UTIL.TRACE('ProcessusLieApresDevis vidtopr:'||to_char(vidtopr) );

    UPDATE    ACTCRS SET
    IDTOPR=    (SELECT OPR.IDTOPR
                FROM OPR
                WHERE EchPmt = pEchPmt AND OPR.IdtTypOpr = 6),
    IDTTYPOPR =    6
    WHERE    ACTCRS.IdtActCrs = pIDTACTCRS;

--    X7UTIL.TRACE('ProcessusLieApresDevis:'||to_char(SQL%ROWCOUNT) );

EXCEPTION
    WHEN OTHERS THEN
        X7.GEST_ERREUR_CENTURA(VersionPkg(),
                              0,
                              'AFFBTC02',
                              'ProcessusLieApresEcheancier',
                              to_char(SQLERRM),
                              sqlcode,
                              DBMS_UTILITY.FORMAT_ERROR_BACKTRACE);
        Raise;
end ProcessusLieApresEcheancier;


END Affbtc02;
/