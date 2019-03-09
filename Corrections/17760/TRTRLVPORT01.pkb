CREATE OR REPLACE PACKAGE BODY X7.TRTRLVPORT01 IS
/************************************************************************************\
* RlvPortable                                        *
* Création     : 22/10/2005 par SJ                                                  *
*                                                 *
\************************************************************************************/
-----------------------------------------------------------------------------
-- Maj     : 06/02/2006
-- Par     : SJ
-- Contenu : traitement de la fiche 4093 - remplir le champ idtcodobs lors de l'import
-----------------------------------------------------------------------------
-----------------------------------------------------------------------------
-- Maj     : 21/03/2006
-- Par     : SJ
-- Contenu : fiche 4205 - Adaptation des procédures Oracle pour bfex: utilise les champs paramètrables du pntcpg
--                       Evolutions: renommer la vue rlv_portable_cpr_anb en rlv_portable_cpr,
--modifier la calcule pour la colonne nbrmois_cf, utiliser rlvbat06 dans la fonction cnshstjouhst,
--mise à jour de la table pntcpg à partir de la relève portable, etc
-----------------------------------------------------------------------------
-----------------------------------------------------------------------------
-- Maj     : 14/06/2006
-- Par     : SJ
-- Contenu : Regroupement par tournées pour plusieurs lot - pas de fiche tracker  -
--fiche mantis 4459
-----------------------------------------------------------------------------
-----------------------------------------------------------------------------
-- Maj     : 09/08/2006
-- Par     : FP
-- Contenu :   garder les indexes des contrats extraits dans la table rlv_extctr- pas de fiche tracker  - 4441
-----------------------------------------------------------------------------
-----------------------------------------------------------------------------
-- Maj     : 30/08/2006
-- Par     : SJ
-- Contenu : récupere prmgnr.sprcdf à l'import car il n'est pas utilisé dans rlvport.exe (pour ne pas grandir la taille de fichier à l'export)
-- dans le cas d'interrruption du batch pendant que la tache est en L - reprendre la tache en L pareil comme les tache en C
-- fiche 4461
-----------------------------------------------------------------------------
-----------------------------------------------------------------------------
-- Maj     : 22/11/2006
-- Par     : FP
-- Contenu : Modification du package Rlvportable, procédure DCHINDRLVPORT
-- pour permettre l'utilisation de la colonne BCHINC
-----------------------------------------------------------------------------
-----------------------------------------------------------------------------
-- Maj     : 25/10/2006
-- Par     : SJ
-- rendre la création des tournées de relève possible si le nombre des compteurs dans la tournée dépoasse 353
-- fiche 4584.
-- VERSION 10201
-----------------------------------------------------------------------------
-----------------------------------------------------------------------------
-- Maj     : 31/10/2006
-- Par     : SJ
-- utiliser une table temporaire pour créer l'hst des indexes
-- fiche 4584.
-- VERSION 10201
-----------------------------------------------------------------------------
-----------------------------------------------------------------------------
-- Maj     : 14/12/2006
-- Par     : FP
-- Contenu : Ajout de la fonction retournant la version de la releve portable
-----------------------------------------------------------------------------
-----------------------------------------------------------------------------
-- Maj     : 20/02/2007
-- Par     : SJ
-- Contenu : Ajouter de la procedure controler_daterlv - fiche 4843
-----------------------------------------------------------------------------
-----------------------------------------------------------------------------
-- Maj     : 16/03/2007
-- Par     : SJ
-- Contenu : Correction maj pntcpg - fiche 4873
-----------------------------------------------------------------------------
-----------------------------------------------------------------------------
-- Maj     : 07/09/2007
-- Par     : SJ
-- Contenu : Correction maj pntcpg - fiche #6679 - il faudrait maj aussi le pntcpg.idtt1..pntcpg.idtt5
-- car si non les libelles de typologies ne sont pas visible en x7
-----------------------------------------------------------------------------

-- A MODIFIER A CHAQUE MODIF DU PACKAGE!!!
-----------------------------------------------------------------------------
-- FUNCTION VersionPkg
-- Retourne la version de la releve portable
-----------------------------------------------------------------------------
-----------------------------------------------------------------------------
-- Maj     : 07/04/2009
-- Par     : SJ
-- Contenu : mettre idtcodorg à 4 si il est null
-----------------------------------------------------------------------------

-----------------------------------------------------------------------------
-- Maj     : 18/04/2009
-- Par     : BPZ
-- Contenu : Dans certain cas les infos complémentaires ne sont pas transférées dans X7
-----------------------------------------------------------------------------

-----------------------------------------------------------------------------
-- Maj     : 28/08/2009
-- Par     : SJ
-- Contenu : Fiche 7700 - Erreur de mise à jours de taches au cas o?¹ lots non regroupé
-----------------------------------------------------------------------------

-----------------------------------------------------------------------------
-- Maj     : 30/11/2009
-- Par     : FP
-- Contenu : utilisation de DBMS_XMLGEN à la place de system.xmlgen
-----------------------------------------------------------------------------
-----------------------------------------------------------------------------
-- Maj     : 27/01/2010
-- Par     : SJ
-- Contenu : modifier le nom des fichiers de parametrage et agt = préfix 'typo_' fiche 7867
-----------------------------------------------------------------------------
-----------------------------------------------------------------------------
-- Maj     : 27/01/2010
-- Par     : FP
-- Contenu : - génération de 2 fichiers : résumé de la tournée TRNxxxx et données de la tournée
--           - gestion des directories
-----------------------------------------------------------------------------
-----------------------------------------------------------------------------
-- Maj     : 26/05/2010
-- Par     : FP
-- Contenu : - modification du directory TMP_XML en TMP_XML_RLVPORT
--           - dans la fonction TrnHstIndExport, on enlève le FOR UPDATE (qui fonctionne mal en oracle 10) du cursor c_lot
-----------------------------------------------------------------------------
-----------------------------------------------------------------------------
-- Maj     : 01/06/2010
-- Par     : SJ
-- Contenu : - traitement de la fiche 8425 - enlever temporairement le controle date et heure de relève (jusqu'au moment quand la syncronisation de la date et
--         l'heure sera faite lors de modification du module de transfert); laisser que le controle date (trunc(date) ) procedure controler_daterlv
-----------------------------------------------------------------------------
-----------------------------------------------------------------------------
-- Maj     : 02/06/2010
-- Par     : SJ
-- Contenu : - traitement partie 1 de la fiche 8427: correction package rlvportable - log d'import
-----------------------------------------------------------------------------

-----------------------------------------------------------------------------
-- Maj     : 11/08/2010
-- Par     : FP
-- Contenu : - modification de la requête pour la création du fichier de résumé des tournées de manière à supprimer
--             les apostrophes des libabr
-----------------------------------------------------------------------------

-----------------------------------------------------------------------------
-- Maj     : 18/08/2010 - 20101.008
-- Par     : FP
-- Contenu : - on essaye de réduire les temps de génération des fichiers, pour ce faire :
--                * ajout d'une fonction exp_file récupérée du recensement
--                * utilisation de cette fonction pour créer les fichiers xml
-----------------------------------------------------------------------------
-----------------------------------------------------------------------------
-- Maj     : 04/08/2011 - 20204.009
-- Par     : SJ
-- Contenu : - le nombre total de compteurs de la tournée vNbrCprTrn = TRNTYPRLV.nbrcpr - le nombre des compteurs extraits du lot aux moment de l'export
--       +   exporter tous les données des compteurs qui sont dans RLV même sans ctr car il est possible de vouloir lire les cpr inactif (si prmgrn.pntcpginc=1 alors dans la table rlv on peut avoir cpr inactifs, ça c'est déjà fait dans calslf01 et rlvbat01)
-- Note FP: on corrige dans cette version une erreur apparue le 09/05/2012 car j'ai oublié d'envoyé ce package lors de la livraison de la relève portable
--          voir fiche 0010111
-----------------------------------------------------------------------------
-----------------------------------------------------------------------------
-- Maj     : 03/07/2012 - 20205.010
-- Par     : FP
-- Contenu : - fiche 10071 : on utilise à présent 2 directories seulement
-- NB : on ne peut pas se passer de celui pointant vers un rep local, pb avec bfile
-----------------------------------------------------------------------------
-----------------------------------------------------------------------------
-- Maj     : 03/07/2012 - 20502.011
-- Par     : JCD
-- Contenu : - fiche 0010743: RLVBAT06_SPC
-----------------------------------------------------------------------------
-----------------------------------------------------------------------------
-- Maj     : 12/12/2013 - 20506.015
-- Par     : FP
-- Contenu : mise à plat de version
-----------------------------------------------------------------------------
-----------------------------------------------------------------------------
-- Maj     : 11/04/2014
-- VERSION : 30102.017
-- Par     : FBE
-- Contenu : - Package renomme a TRTRLVPORT01
--           - Compatibilite avec la version 3 de la releve portable
--           - Utilisation du module d'Export X7 pour la generation des fichiers
--           - La table DCHINDRLVPORT n'est pas effacee par le traitement
--           - Ajout de la procedure pour generer un rapport sur l'integration des releves
-----------------------------------------------------------------------------
-- Maj     : 11/06/2014
-- VERSION : 30102.018
-- Par     : BPZ
-- Mantis    11735: Division de tournées
-----------------------------------------------------------------------------
-- Maj     : 12/07/2014
-- VERSION : 30200.026
-- Par     : FBE
-- Contenu : - 11874: Adresses longues tronquées sur le PDA
--           - 11875: Problèmes de dates lorsque le dépasse minuit
--           - 11877: Gestion de la division de tournées
--           - 11878: Possibilité d'annuler la génération de fichiers relève en état 4
--           - 11879: Modification du système d'historisation des fichiers de la relève portable
-----------------------------------------------------------------------------
-----------------------------------------------------------------------------
-- Maj     : 05/03/2015
-- Par     : SJ
-- VERSION : 30204.027
-- Contenu : - traitement de la fiche 12407: FNemir d'Alger signale que :
--  - Le point d’entrée des taches de génération est STT=’L’, àhors que nous sur le carnet de relève nous mettons les STT=’T’ s’il y au moins nue TRN portable sur le lot.
--  - Sur le package TRTRLVPORT01 on met à jour IdtEtTrn à 5 avant de générer le fichier XML (voir lign 441)...
--  --SJ : gestion des taches comme avant et meilleurs gestion des erreurs: si pb à la génération on ne mets pas à jour l'état de la tournée trn

-----------------------------------------------------------------------------
-----------------------------------------------------------------------------
-- Maj     : 17/03/2015
-- Par     : SJ
-- VERSION : 30204.028
-- Contenu : - traitement de la fiche 12466: reprise des modifications de FNE sauf la maj de la tache à null si la tache est à 'T'
-- Ci-dessous le fonctionnement des changement des état de la tache TRT2003:
--signification des états L, T, C, F pour idttyptche=2003 qui a été connstruit pour la Roumanie et repris en version produit:
--
-- 1. le carnet de relève est imprimé par un état brio lancé avant l'appel de la procédure d'exp de la relève portable

--Ce carnet de relève à la fin du traitement de la tournée met la tache en F si toutes les tournées sont en portable ou si on imprime que le carnet de relève même pour les tournées en portable. Le traitement d'export de la relève portable ne doit rien faire dans ce cas. Lorsque le carnet de relève commence le traitement la tache est mise à C (en cours).
--A la fin du traitement le carnet de relève met l'état de la tâche à F ou à T comme suite:

--    if #NbrTrnPortab = 0 or $prm3='1'
--     do Maj_Tche (, 'F', #NbrPntCpgTraites)
--    else
--     do Maj_Tche (, 'T', #NbrPntCpgTraites)
--    end-if

--2.le traitement de l'export de la relève portable prend la tache qui a stt=null ou T et la passe en L (lancement de l'exp portable) qui est équivalent de C "en cours" pour le carnet de relève ou autre type de tâche).
--Si le traitement est intrerrompu , le traitement de la relève portable doit reprendre les taches qui sont en état null ou L (commencé mais pas fini par l'exp portable) et en état T ( traité par le carnet de relève des tournées pas en portable et disponible pour l'export des autres tournées)


-----------------------------------------------------------------------------
-- Maj     : 15/08/2015
-- Par     : BPZ
-- VERSION : 30204.029
-- Contenu : 12609: blocage du Batch facturation dans le cas de lancement un lot de facturation mixe
-----------------------------------------------------------------------------
-----------------------------------------------------------------------------
-- Maj     : 03/03/2019
-- Par     : FNE
-- VERSION : 30204.030
-- Contenu : 17760: Gestion des coefficients des Compteurs (TYPCPR.CFF) lors de la décharge
-----------------------------------------------------------------------------

--FUNCTION VersionPkg RETURN VersionPackage
----NUMBER
--IS
--pour le cas où on veux liverer en double mais je pense que il ne faut pas faire ça car risque d'err et necessaire d'autre modif sur traccage

--  VersionNumberP_RP VersionPackage;
--
--BEGIN
-- -- RETURN 30200.027;
-- VersionNumberP_RP(1):=30200.027;
-- VersionNumberP_RP(2):=70902.01;
--RETURN VersionNumberP_RP;
--END;

FUNCTION VersionPkg RETURN NUMBER
IS
BEGIN
  RETURN 30204.029;
END;
---------------------------------------------------------------------------
---------------------------------------------------------------------------
---------------------------------------------------------------------------
PROCEDURE ExporterParametres IS
--NB : pPath n'est plus utilisé, on utilise les directories
--répertoire de destination sur le serveur de base de données (il faut ULT_FILE_DIR=* ou alors ajouter les droits
--en écriture sur le répertoire)
-- Cursor pour recuperer les parametres pour la generation des fichiers
  cursor cMDL is
    select IdtExpMdl,
           CodExpMdl,
           NomFic
      from EXPMDL
      where IdtExpMdl in ( 8,   -- Codes d'observation
                           9,   -- Codes d'origine
                          10,   -- Codes de releve
                          11,   -- Parametres de tolerance de consommation
                          12,   -- Typologie PNTCPG.T1
                          13,   -- Typologie PNTCPG.T2
                          14,   -- Typologie PNTCPG.T3
                          15,   -- Typologie PNTCPG.T4
                          16,   -- Typologie PNTCPG.T5
                          17);  -- Agents
vPath VARCHAR2(512):= 'XMLFILES_RLVPORT';
vNomFic EXPMDL.NomFic%TYPE;
vCodExpMdl EXPMDL.CodExpMdl%TYPE;
vCodMsg SYS_MSG.Msg_Code%TYPE;
vMsgErr varchar2(4000);
eErreur EXCEPTION;
BEGIN
  for rMDL in cMDL loop
    vNomFic := rMDL.NomFic;
    vCodExpMdl := rMDL.CodExpMdl;
    if vNomFic is null then
      vCodMsg := 'ERR_RLVPORT002'; -- Nom du fichier non renseigne
      raise eErreur;
    end if;
    TRTEXP01.GenererFichier(rMDL.IdtExpMdl, vPath || '\' || vNomFic);
--'
  end loop;
EXCEPTION
    when eErreur then
      vMsgErr := TRTMSG01.ChercheMsg(vCodMsg);
      vMsgErr := REGEXP_Replace(vMsgErr,':NomFic',vNomFic,1,0,'i');
      vMsgErr := REGEXP_Replace(vMsgErr,':CodExpMdl',vCodExpMdl,1,0,'i');
     X7.GEST_ERREUR_CENTURA(VersionPkg(),
                             0,
                             'TRTRLVPORT01',
                             'getParameters',
                             to_char(SQLERRM),
                             sqlcode,
                             vMsgErr);
      RAISE_APPLICATION_ERROR(X7UTIL.Erreur_X7_centura,vMsgErr);
   WHEN OTHERS THEN
      vMsgErr := TRTMSG01.ChercheMsg('ERR_RLVPORT001');  -- Erreur non gere
      vMsgErr := REGEXP_Replace(vMsgErr,':NomFic',vNomFic,1,0,'i');
      vMsgErr := REGEXP_Replace(vMsgErr,':CodExpMdl',vCodExpMdl,1,0,'i');
      vMsgErr := vMsgErr || chr(13) || chr(10);
      vMsgErr := vMsgErr || SQLERRM;
      vMsgErr := vMsgErr || chr(13) || chr(10);
      vMsgErr := vMsgErr || DBMS_UTILITY.Format_Error_BackTrace;
      X7.GEST_ERREUR_CENTURA(VersionPkg(),
                             0,
                             'TRTRLVPORT01',
                             'getParameters',
                             to_char(SQLERRM),
                             sqlcode,
                             vMsgErr);
      RAISE_APPLICATION_ERROR(X7UTIL.Erreur_X7_centura,vMsgErr);
END;
---------------------------------------------------------------------------
---------------------------------------------------------------------------
---------------------------------------------------------------------------
procedure Exporter
  is
  vIdtLotFacRgr LOTFAC.IdtLotFacRgr%TYPE;
    erreur boolean:=false;
  cursor cLot is
    select LOTFAC.IdtLotFac,
           nvl(LOTFAC.IdtLotFacRgr,LOTFAC.IdtLotFac) IdtLotFacRgr
           ,TCHE.rowid tcherowid
       from TCHE,
            LOTFAC
            , RLV, TRN
       where LOTFAC.IdtLotFac = TCHE.Prm2
        and  TCHE.IdtTypTche  = 'TRT2003'
        --and  (TCHE.Stt is null)
        and (TCHE.Stt is null or TCHE.Stt = 'T' or TCHE.Stt = 'L') -- SJ 05/03/2015 traitement de la fiche 12407 : pour des raison de comptaibilité Alger lance les carnet de relève et à la fin si il reset au moins une tournée en "portable" la tcahe est mise à T
        and  TCHE.DatPrv <= SysDate
          -- BPZ
          AND RLV.IdtLotFac = LOTFAC.IdtLotFac
          AND TRN.IdtTrn = RLV.IdtTrn
          AND TRN.Sqc = RLV.Sqc
          AND TRN.IdtTypRlv = 'PORTAB'
          AND TRN.IdtEttTrn <> 5
          AND RLV.EttRlv = 1
       group by LOTFAC.IdtLotFac,
           nvl(LOTFAC.IdtLotFacRgr,LOTFAC.IdtLotFac)
           ,TCHE.rowid
       order by nvl(LOTFAC.IdtLotFacRgr, LOTFAC.IdtLotFac);
  cursor cTRN is
    select LOTFAC.IdtLotFac,
           TRN.IdtTrn,
           TRN.Sqc,
           nvl(LOTFAC.IdtLotFacRgr,LOTFAC.IdtLotFac) IdtLotFacRgr,
           RLV.IdtTrnTyp,
           nvl(TRN.IdtAgt,'none') IdtAgt,
           to_char(nvl(TRN.DatPrvRlv,SSS_DatJou),'dd-mm-yyyy') DatPrvRlv,
           count(*) NbrEnt
       from SSS,
            LOTFAC,
            RLV,
            TRN,
            PRMGNR
       where nvl(LOTFAC.IdtLotFacRgr,LOTFAC.IdtLotFac) = vIdtLotFacRgr
        and  RLV.IdtLotFac    = LOTFAC.IdtLotFac

        and  TRN.IdtTrn       = RLV.IdtTrn
        and  TRN.Sqc          = RLV.Sqc
        and  TRN.IdtTypRlv = 'PORTAB'
        and  TRN.IdtEttTrn <> 5
        and  RLV.EttRlv = 1
       group by LOTFAC.IdtLotFac,
                nvl(LOTFAC.IdtLotFacRgr,LOTFAC.IdtLotFac),
                RLV.IdtTrnTyp,
                TRN.IdtTrn,
                TRN.Sqc,
                nvl(TRN.IdtAgt,'none'),
                nvl(TRN.DatPrvRlv,SSS_DatJou);
  subtype typIDXCHR is varchar2(20);
  type typTABLOT is table of number index by typIDXCHR;
  type typTABROWID is table of ROWID index by binary_integer;
--  type typTABLOT is table of cLOT%ROWTYPE index by binary_integer;
  type typTABNUMBER is table of number index by binary_integer;
  type typTABVARCHAR is table of varchar2(20) index by binary_integer;
--  tLOT typTABLOT;
  tLOTTCHE typTABLOT; -- garde l'information du nombre d'index par tournee par lot dans TCHE
  tLOTTRN  typTABLOT; -- garde le nombre de compteurs par tournee en releve portable
  rLOT cLOT%ROWTYPE;
  tIdRow typTABROWID;
  tIdtLotFac typTABVARCHAR;
  tIdtLotFacTche typTABVARCHAR;
  tNbr       typTABNUMBER;
--  vOldIdtLotFacRgr LOTFAC.IdtLotFacRgr%TYPE;
  vPath VARCHAR2(512):= 'XMLFILES_RLVPORT';
  vNomFic varchar2(2000);
  vSlc varchar2(2000) := 'select IdtLotFac, count(1)';
  vFrm varchar2(2000);
  vWhr varchar2(2000);
  vWhrIni varchar2(2000);
  vGrp varchar2(2000) := 'group by IdtLotFac';
  vReq varchar2(4000);
  vStrTmp varchar2(2000);
  vWhrTrn varchar2(200) := 'IdtLotFacRgr = ''<IdtLotFacRgr>'' and IdtTrnTyp = ''<IdtTrnTyp>'' and IdtAgt = ''<IdtAgt>''';
  j number;
  vNbr number;
  ErrMsg varchar2(1600);
BEGIN
  -- SJ 17/03/2015 -non reprise de la modif FNE mais pas importante car on traite TCHE.Stt is null or TCHE.Stt = 'T' or TCHE.Stt = 'L') FNE: Mise a jour des taches en etat L (T dans le cas SEAAL)
  update TCHE
    set Stt = null
    where IdtTypTche = 'TRT2003'
     and  Stt = 'L';
  commit;
  -- Recuperation de la requete du fichier d'exportation pour prendre en compte les specificites.
  -- On recupere seulement le from et le where.
  -- Ceci permet de compter par lot de facturation les nombre d'index a envoyer
  select EXPTAB.Nom, EXPMDL.Whr
    into vFrm, vWhrIni
    from EXPMDL, EXPTAB
    where EXPTAB.IdtExpTab = EXPMDL.IdtExpMdl
     and  EXPMDL.IdtExpMdl = cMODELE_EXPORT_RELEVE;
     --and EXPMDL.DATCRT = (select max(datcrt) from EXPMDL where EXPMDL.IdtExpMdl = cMODELE_EXPORT_RELEVE);
  vFrm := 'from ' || vFrm;
  -- Suppression du mot where s'il existe
  vWhrIni := trim(REGEXP_Replace(vWhrIni, '^\W*where',null,1,1,'i'));
  LOOP
    open cLOT;
      fetch cLOT into rLOT;
      if cLOT%NOTFOUND then
        exit;
      end if;
    close cLOT;
    -- Stockage des lots qui composent le lot de regroupement
    vIdtLotFacRgr := rLOT.IdtLotFacRgr;
    select LOTFAC.IdtLotFac, TCHE.RowId
      bulk collect into tIdtLotFacTche, tIdRow
      from TCHE,
          LOTFAC
      where LOTFAC.IdtLotFac = TCHE.Prm2
       and  TCHE.IdtTypTche  = 'TRT2003'
       and  (TCHE.Stt is null or TCHE.Stt = 'T' or TCHE.Stt = 'L')
       and  TCHE.DatPrv <= SysDate
       and  nvl(LOTFAC.IdtLotFacRgr,LOTFAC.IdtLotFac) = vIdtLotFacRgr;
    -- Recuperation du nombre de compteurs par tournee
    vStrTmp := 'select LOTFAC.IdtLotFac, count(*)';
    vStrTmp := vStrTmp || ' from LOTFAC, TRN, RLV';
    vStrTmp := vStrTmp || ' where TRN.IdtTrn like LOTFAC.IdtLotFac || ''-%''';
    vStrTmp := vStrTmp || ' and RLV.IdtLotFac = LOTFAC.IdtLotFac';
    vStrTmp := vStrTmp || ' and RLV.IdtTrn = TRN.IdtTrn';
    vStrTmp := vStrTmp || ' and RLV.Sqc = TRN.Sqc';
    vStrTmp := vStrTmp || ' and nvl(LOTFAC.IdtLotFacRgr,LOTFAC.IdtLotFac) = :Lot';
    vStrTmp := vStrTmp || ' and TRN.IdtTypRlv = ''PORTAB''';
    vStrTmp := vStrTmp || ' group by LOTFAC.IdtLotFac';
    execute immediate vStrTmp
      bulk collect into tIdtLotFac, tNbr
      using vIdtLotFacRgr;
    for i in 1..tIdtLotFac.Count loop
      tLOTTRN(tIdtLotFac(i)) := tNbr(i);
    end loop;
    for rTRN in cTRN loop
      tLOTTCHE.Delete;
      -- Construction de la requete pour connaitre les index a envoyer
      vWhr := vWhrIni;
      if vWhr is null then
        vWhr := 'where ';
      else
        vWhr := ' where ' || vWhr || ' and ';
      end if;
      vStrTmp := vWhrTrn;
      vStrTmp := replace(vStrTmp,'<IdtLotFacRgr>',vIdtLotFacRgr);
      vStrTmp := replace(vStrTmp,'<IdtTrnTyp>',rTRN.IdtTrnTyp || '_' || rTRN.Sqc);
      vStrTmp := replace(vStrTmp,'<IdtAgt>',rTRN.IdtAgt);
      vWhr := vWhr || vStrTmp;
      vReq := vSlc || ' ' || vFrm || ' ' || vWhr || ' ' || vGrp;
      --DBMS_OUTPUT.Put_Line(vReq);
      tIdtLotFac.delete;
      tNbr.Delete;
      execute immediate vReq
        bulk collect into tIdtLotFac, tNbr;
      -- Stockage du nombre de compteurs par lot TCHE
      for i in 1..tIdtLotFac.Count loop
        vNbr := 0;
        if tLOTTCHE.Exists(tIdtLotFac(i)) then
          vNbr := tLOTTCHE(tIdtLotFac(i));
        end if;
        tLOTTCHE(tIdtLotFac(i)) := vNbr + tNbr(i);
                --FNE:
                vNbr := tLOTTCHE(tIdtLotFac(i));
        -- Le nombre de compteurs traites ne peut pas etre superieur au nombre de compteurs dans les tournees
        if tLOTTCHE(tIdtLotFac(i)) > tLOTTRN(tIdtLotFac(i)) then
          tLOTTCHE(tIdtLotFac(i)) := tLOTTRN(tIdtLotFac(i));
        end if;
      end loop;
--      -- Mise a jour de l'etat des lots dans TCHE
--      for i in 1..tIdtLotFac.Count loop
--        update TCHE
--          set Stt = 'L',
--              NbrEnt = least(nvl(NbrEnt,0) + tLOTTCHE(tIdtLotFac(i)), tLOTTRN(tIdtLotFac(i)))
--          where IdtTypTche = 'TRT2003'
--           and  (Stt = 'L' or Stt is null or Stt = 'T')
--           and  Prm2 = tIdtLotFac(i);
--      end loop;


      vNomFic := rTRN.IdtAgt || '-' || vIdtLotFacRgr || '-' || rTRN.IdtTrnTyp || '_' || rTRN.Sqc || '-' || rTRN.DatPrvRlv || '-0.xml';

--      -- Mise a jour de l'etat de la tournee
--      forall i in 1..tIdtLotFac.Count
--        update TRN
--          set IdtEttTrn = 5,
--              Fch = vNomFic
--          where IdtTrn = tIdtLotFac(i) || '-' || rTRN.IdtTrnTyp
--           and  Sqc = rTRN.Sqc;

    --SJ 05/03/2015, traitement de la fiche 12407 -éviter la création d'un fichier vide : à bien tester cela car je ne suis pas trop d'acc avec le code ci-dessus

      if vNbr != 0 then
           -- FNE: 12466 gestion de l'export
 -- ça empêche la génération des trn vides
            begin
                erreur:=false;
      -----------------------------------------------------------
      -- Generation du fichier de releve
      -----------------------------------------------------------

      begin
            TRTEXP01.GenererFichier(cMODELE_EXPORT_RELEVE,vPath || '\' || vNomFic,vStrTmp);
            --null;
            exception when others then erreur:=true;
                  DBMS_OUTPUT.PUT_LINE('Error in TRTRLVPORT.export = ' || (to_char(sqlcode) ||' '|| to_char(SQLERRM)));
                  DBMS_OUTPUT.PUT_LINE('*************************************************************************');
                  DBMS_OUTPUT.PUT_LINE(DBMS_UTILITY.FORMAT_ERROR_BACKTRACE);
                  DBMS_OUTPUT.PUT_LINE('*************************************************************************');
                X7.GEST_ERREUR_CENTURA(VersionPkg(),
                                      0,
                                      'TRTRLVPORT01',
                                      'Exporter',
                                      to_char(SQLERRM),
                                      sqlcode,
                                      DBMS_UTILITY.FORMAT_ERROR_BACKTRACE);
            end;
--'
      -----------------------------------------------------------
      -- Generation du fichier de resume de la tournee
      -----------------------------------------------------------
       begin
            vNomFic := 'Hst-' || rTRN.IdtAgt || '-' || vIdtLotFacRgr || '-' || rTRN.IdtTrnTyp || '_' || rTRN.Sqc || '-' || rTRN.DatPrvRlv || '-0.xml';
        TRTEXP01.GenererFichier(cMODELE_EXPORT_HST_RELEVE,vPath || '\' || vNomFic,vStrTmp);
        --null;
            exception when others then erreur:=true;
                  DBMS_OUTPUT.PUT_LINE('Error in TRTRLVPORT.export = ' || (to_char(sqlcode) ||' '|| to_char(SQLERRM)));
                  DBMS_OUTPUT.PUT_LINE('*************************************************************************');
                  DBMS_OUTPUT.PUT_LINE(DBMS_UTILITY.FORMAT_ERROR_BACKTRACE);
                  DBMS_OUTPUT.PUT_LINE('*************************************************************************');
                X7.GEST_ERREUR_CENTURA(VersionPkg(),
                                      0,
                                      'TRTRLVPORT01',
                                      'Exporter',
                                      to_char(SQLERRM),
                                      sqlcode,
                                      DBMS_UTILITY.FORMAT_ERROR_BACKTRACE);
            end;
--'
      -----------------------------------------------------------
      -- Generation du fichier historique de la tournee
      -----------------------------------------------------------
      begin
      vNomFic := 'TRN' || rTRN.IdtAgt || '-' || vIdtLotFacRgr || '-' || rTRN.IdtTrnTyp || '_' || rTRN.Sqc || '-' || rTRN.DatPrvRlv || '-0.xml';
      TRTEXP01.GenererFichier(cMODELE_EXPORT_RESTRN_RELEVE,vPath || '\' || vNomFic,vStrTmp);
      --null;
      exception when others then erreur:=true;
                  DBMS_OUTPUT.PUT_LINE('Error in TRTRLVPORT.export = ' || (to_char(sqlcode) ||' '|| to_char(SQLERRM)));
                  DBMS_OUTPUT.PUT_LINE('*************************************************************************');
                  DBMS_OUTPUT.PUT_LINE(DBMS_UTILITY.FORMAT_ERROR_BACKTRACE);
                  DBMS_OUTPUT.PUT_LINE('*************************************************************************');
                X7.GEST_ERREUR_CENTURA(VersionPkg(),
                                      0,
                                      'TRTRLVPORT01',
                                      'Exporter',
                                      to_char(SQLERRM),
                                      sqlcode,
                                      DBMS_UTILITY.FORMAT_ERROR_BACKTRACE);
      end;
            end;
     else

      Insert into sys_hst_msg (NOM_UTILISATEUR,NOM_TRAITEMENT,DAT_COURANTE,MSG_CODE,MSG_LIBELLE,NUM_PROGRESSION,NOM_LOCALISATION,CPT,NOM_REQUETE )
                      values    (user, 'TRTRLVPORT.export',sysdate, 'MSG_INF2002', '', 0,'TRTRLVPORT.export',null, 'pas de données pour la tournnée ' || rTRN.IdtAgt || '-' || vIdtLotFacRgr || '-' || rTRN.IdtTrnTyp || '_' || rTRN.Sqc || '-' || rTRN.DatPrvRlv   );

      DBMS_OUTPUT.PUT_LINE('pas de données pour la tournnée ' || rTRN.IdtAgt || '-' || vIdtLotFacRgr || '-' || rTRN.IdtTrnTyp || '_' || rTRN.Sqc || '-' || rTRN.DatPrvRlv);

     end if;
--'
  --SJ 05/03/2015 - traitement de la fiche 12407 : vérif que l'export est bien fait avant de maj de l'état de la tournée
      -- Mise a jour de l'etat de la tournee
if not erreur then
forall i in 1..tIdtLotFac.Count
        update TRN
          set IdtEttTrn = 5,
              Fch = vNomFic
          where IdtTrn = tIdtLotFac(i) || '-' || rTRN.IdtTrnTyp
           and  Sqc = rTRN.Sqc;
      commit;
else
  ErrMsg := to_char(sqlcode)||' '|| to_char(SQLERRM);
  insert into sys_hst_msg
    (NOM_UTILISATEUR,
     NOM_TRAITEMENT,
     DAT_COURANTE,
     MSG_CODE,
     MSG_LIBELLE,
     NUM_PROGRESSION,
     NOM_LOCALISATION,
     CPT,
     NOM_REQUETE)
  values
    (user,
     'TRTRLVPORT.export',
     sysdate,
     'MSG_FIN_ANORMALE',
     '',
     0,
     'TRTRLVPORT.export',
     null,
     ErrMsg);

        --BPZ
        DBMS_OUTPUT.PUT_LINE('La tache est mise en erreur = ' || rLOT.IdtLotFacRgr);
        UPDATE TCHE
        SET Stt = 'C'
        WHERE ROWID = rLOT.tcherowid;

  commit;
      DBMS_OUTPUT.PUT_LINE('Error in TRTRLVPORT.export = ' || (to_char(sqlcode) ||' '|| to_char(SQLERRM)));
      DBMS_OUTPUT.PUT_LINE('*************************************************************************');
      DBMS_OUTPUT.PUT_LINE(DBMS_UTILITY.FORMAT_ERROR_BACKTRACE);
      DBMS_OUTPUT.PUT_LINE('*************************************************************************');

  end if;

      -- Mise a jour de l'etat des lots dans TCHE
      for i in 1..tIdtLotFac.Count loop
        update TCHE
          set Stt = 'L',
              NbrEnt = least(nvl(NbrEnt,0) + tLOTTCHE(tIdtLotFac(i)), tLOTTRN(tIdtLotFac(i)))
          where IdtTypTche = 'TRT2003'
           and  (Stt = 'L' or Stt is null or Stt = 'T')
           and  Prm2 = tIdtLotFac(i);
      end loop;

      commit;
--end;
    end loop;
    -- On a fini de traiter les tournees du lot de regroupement, nous allons verifier si toutes les tournees sont traitees
    for j in 1..tIdtLotFacTche.Count loop
      select count(*)
        into vNbr
        from TRN,RLV
        where RLV.IdtTrn = TRN.IdtTrn
         and  RLV.Sqc    = RLV.Sqc
         and  TRN.IdtTrn like tIdtLotFacTche(j) || '-%'
         and  TRN.IdtEttTrn in (1,2,4)
         and  RLV.EttRlv = 1;
      -- Si toutes les tournees sont traitees, on fini la tache
      if vNbr = 0  then
        update TCHE
          set Stt = 'F',
              DatRls = sysdate
          where RowId = tIdRow(j);
        commit;
      end if;
    end loop;
    tIdRow.Delete;
    tIdtLotFacTche.Delete;
  end loop;
--SJ 05/03/2015 - traitement de la fiche 12407
exception
      WHEN OTHERS THEN
       ROLLBACK;
       ErrMsg := to_char(sqlcode)||' '|| to_char(SQLERRM);
      insert into sys_hst_msg (NOM_UTILISATEUR,NOM_TRAITEMENT,DAT_COURANTE,MSG_CODE,MSG_LIBELLE,NUM_PROGRESSION,NOM_LOCALISATION,CPT,NOM_REQUETE )
                      values    (user, 'TRTRLVPORT.export',sysdate, 'MSG_FIN_ANORMALE', '', 0,'TRTRLVPORT.export',null, ErrMsg );
       commit;
      DBMS_OUTPUT.PUT_LINE('Error in TRTRLVPORT.export = ' || (to_char(sqlcode) ||' '|| to_char(SQLERRM)));
      DBMS_OUTPUT.PUT_LINE('*************************************************************************');
      DBMS_OUTPUT.PUT_LINE(DBMS_UTILITY.FORMAT_ERROR_BACKTRACE);
      DBMS_OUTPUT.PUT_LINE('*************************************************************************');
        X7.GEST_ERREUR_CENTURA(VersionPkg(),
                              0,
                              'TRTRLVPORT01',
                              'Exporter',
                              to_char(SQLERRM),
                              sqlcode,
                              DBMS_UTILITY.FORMAT_ERROR_BACKTRACE);
        --Raise;

END Exporter;
---------------------------------------------------------------------------
---------------------------------------------------------------------------
---------------------------------------------------------------------------
procedure Importer(pFile varchar2) is
  vXml        clob;
  vFile       BFILE;
  vCsId       number;         -- Character Set Id pour Oracle
  vChrSet     varchar2(100);  -- Character set du fichier
  eException EXCEPTION;
  vMsg varchar2(2000);
  vMsgErr varchar2(2000);
  vErr_NumCpr varchar2(100);
  vChamp varchar2(100);
  vCodMsg SYS_MSG.Msg_Code%TYPE;
  vNomFicFin varchar2(200);
  vIdtTrnTyp TRNTYP.IdtTrnTyp%TYPE;
  vSqc number;
  vNomFile varchar2(200);
  vFileSrc varchar2(2000);
  vFileDst varchar2(2000);
  vRepDst varchar2(2000);
  vCff TypCpr.Cff%type;
  -- Cursor pour parcourir les donnees
  cursor cXML is
    select trim(ExtractValue(value(ct),'/TRN/IDTLOTFAC')) IdtLotFac,
           trim(ExtractValue(value(ct),'/TRN/IDTTRNTYP')) IdtTrnTyp,
           trim(ExtractValue(value(ct),'/TRN/RNG1')) Rng1,
           trim(ExtractValue(value(ct),'/TRN/IDTCLT')) IdtClt,
           trim(ExtractValue(value(ct),'/TRN/NOM')) Nom,
           trim(ExtractValue(value(ct),'/TRN/PRN')) Prn,
           trim(ExtractValue(value(ct),'/TRN/IDTPNTLVR')) IdtPntLvr,
           trim(ExtractValue(value(ct),'/TRN/IDTPNTCPG')) IdtPntCpg,
           trim(ExtractValue(value(ct),'/TRN/IDTCPR')) IdtCpr,
           trim(ExtractValue(value(ct),'/TRN/NUMCPR')) NumCpr,
           trim(ExtractValue(value(ct),'/TRN/NUMCDR')) NumCdr,
           trim(ExtractValue(value(ct),'/TRN/IDTAGT')) IdtAgt,
           trim(ExtractValue(value(ct),'/TRN/MTRAGT')) MtrAgt,
           trim(ExtractValue(value(ct),'/TRN/IND')) Ind,
           trim(ExtractValue(value(ct),'/TRN/CNS')) Cns,
           trim(ExtractValue(value(ct),'/TRN/IDTCODOBSINT')) IdtCodObsInt,
           trim(ExtractValue(value(ct),'/TRN/FRC')) Frc,
           trim(ExtractValue(value(ct),'/TRN/DATLCTIND')) DatLctInd,
           trim(ExtractValue(value(ct),'/TRN/IDTCODRLV')) IdtCodRlv,
           trim(ExtractValue(value(ct),'/TRN/IDTCODORG')) IdtCodOrg,
           trim(ExtractValue(value(ct),'/TRN/IDTCODOBS')) IdtCodObs,
           trim(ExtractValue(value(ct),'/TRN/IDTCODOBS2')) IdtCodObs2,
           trim(ExtractValue(value(ct),'/TRN/IDTCODOBS3')) IdtCodObs3,
           trim(ExtractValue(value(ct),'/TRN/NOTE')) Note
       from table(XMLsequence(Extract(XmlType(vFile,vCsId),'/TOURNEE/TRN'))) ct;
  type typTABXML is table of cXML%ROWTYPE index by binary_integer;
  type typTABDCH is table of X7.DCHINDRLVPORT%ROWTYPE index by binary_integer;
  tXML typTABXML;
  tDCH typTABDCH;
  vSqcTrt number;
BEGIN
  ----------------------------------------------------
  -- Initialisation des variables;
  ----------------------------------------------------
  select Seq_TrtRlvPort.NextVal into vSqcTrt from dual;
  -- Recherche du character set du fichier exporte
  select ChrSet
    into vChrSet
    from EXPMDL
    where IdtExpMdl = cMODELE_EXPORT_RELEVE;
  -- Conversion au CSID Oracle
  vChrSet := UTL_I18N.Map_CharSet(vChrSet,UTL_I18N.GENERIC_CONTEXT,UTL_I18N.IANA_TO_ORACLE);
  vCsId := Nls_CharSet_Id(vChrSet);
  vCsId := nvl(vCsId,0); -- Si null on utilise le default de la base de donnees
  ----------------------------------------------------
  -- Ouverture du fichier
  ----------------------------------------------------
  -- Verification que le fichier existe
  vFile       := bFileName('XMLFILES_RLVPORT',pFile);
  if DBMS_LOB.FileExists(vFile) = 0 then
    vCodMsg := 'ERR_RLVPORT003'; -- Le fichier n'existe pas
    raise eException;
  end if;
  -- Deplacement du fichier pour pouvoir le gerer avec DBMS_LOB
  BEGIN
    UTL_File.fCopy('XMLFILES_RLVPORT',pfile,'TEMP_LOCAL_RLVPORT',pfile);
  EXCEPTION
    when OTHERS then
      vCodMsg := 'ERR_RLVPORT004';  -- Erreur de deplacement du fichier dans le repertoire temporaire
      vMsg := SQLERRM || chr(13) || chr(10);
      vMsg := DBMS_UTILITY.Format_Error_BackTrace;
      raise eException;
  END;
  vFile       := bFileName('TEMP_LOCAL_RLVPORT',pFile);
  ----------------------------------------------------
  -- Chargement d'information dans la table DCHINDRLVPORT
  ----------------------------------------------------
  -- Ouverture du cursor
  BEGIN
    open cXML;
      fetch cXML
        bulk collect into tXML;
    close cXML;
  EXCEPTION
    when others then
      vCodMsg := 'ERR_RLVPORT005';  -- Erreur de lecture fichier XML
      vMsg := SQLERRM || chr(13) || chr(10);
      vMsg := vMsg || DBMS_UTILITY.Format_Error_BackTrace;
--      DBMS_OUTPUT.Put_Line(vCodMsg || '-' || vMsg);
      raise eException;
  END;
  -- Suppression du fichier du repertoire temporaire, en cas d'erreur
  -- On envoie juste un message sans faire planter le programme
  BEGIN
    UTL_FILE.fRemove('TEMP_LOCAL_RLVPORT',pFile);
  EXCEPTION
    when others then
      vCodMsg := 'ERR_RLVPORT008';
      vMsgErr := TRTMSG01.ChercheMsg(vCodMsg);
      vMsgErr := REGEXP_Replace(vMsgErr,':NomFic',pFile,1,0,'i');
      vMsgErr := REGEXP_Replace(vMsgErr,':Champ',vChamp,1,0,'i');
      vMsgErr := REGEXP_Replace(vMsgErr,':TmpDir','TEMP_LOCAL_RLVPORT',1,0,'i');
      vMsgErr := REGEXP_Replace(vMsgErr,':RlvDir','XMLFILES_RLVPORT',1,0,'i');
      vMsgErr := REGEXP_Replace(vMsgErr,':NumCpr',vErr_NumCpr,1,0,'i');
      vMsgErr := vMsgErr || chr(13) || chr(10) || SQLERRM;
      vMsgErr := vMsgErr || DBMS_UTILITY.Format_Error_Backtrace;
      DBMS_OUTPUT.Put_Line(vMsgErr);
  END;
  -- Transformation des donnees
  for i in 1..tXML.Count loop
    vErr_NumCpr := tXML(i).NumCpr;
    BEGIN
      tDCH(i).NomFic       := pFile;
      tDCH(i).EttMaj       := 0;
      tDCH(i).EttTrt       := 0;
      tDCH(i).IdtTrt       := vSqcTrt;
      -- Correction du code d'origine
      if tXML(i).IdtCodOrg is null then
        tXML(i).IdtCodOrg := 4;
      end if;
      -- FNE: 12466 ajouté, gestion des valeurs Varchar2: null
      ------------------------------------------
      vChamp := 'IdtLotFac';
      tDCH(i).IdtLotFac    := tXML(i).IdtLotFac;
      ------------------------------------------
      vChamp := 'IdtTrnTyp';
      vIdtTrnTyp := substr(tXML(i).IdtTrnTyp,1,instr(tXML(i).IdtTrnTyp,'_')-1);
      tDCH(i).IdtTrnTyp    := vIdtTrnTyp;
      ------------------------------------------
      vChamp := 'Sqc';
      vSqc := substr(tXML(i).IdtTrnTyp,instr(tXML(i).IdtTrnTyp,'_')+1);
      tDCH(i).Sqc    := vSqc;
      ------------------------------------------
      vChamp := 'IdtClt';
      tDCH(i).IdtClt       := tXML(i).IdtClt;
      ------------------------------------------
      vChamp := 'Nom';
      tDCH(i).Nom          := tXML(i).Nom;
      ------------------------------------------
      vChamp := 'Prn';
      tDCH(i).Prn          := tXML(i).Prn;
      ------------------------------------------
      vChamp := 'IdtCpr';
      tDCH(i).IdtCpr       := to_number(tXML(i).IdtCpr);
      ------------------------------------------
      vChamp := 'NumCdr';
      tDCH(i).NumCdr       := to_number(tXML(i).NumCdr);
      ------------------------------------------
      vChamp := 'IdtAgt';
      tDCH(i).IdtAgt       := tXML(i).IdtAgt;
      ------------------------------------------
      vChamp := 'MtrAgt';
      tDCH(i).MtrAgt       := tXML(i).MtrAgt;
      ------------------------------------------
      vChamp := 'Ind';
      -- FNE: 12466
            if tXML(i).Ind='null' then
                tDCH(i).Ind := to_number(null) ;
            else
        tDCH(i).Ind          := to_number(tXML(i).Ind);
            end if;
      ------------------------------------------
      vChamp := 'Cns';
            -- FNE: 12466 : correction si CNS null
            -- FNE: 17760 : Correction Coefficient
            
            select Cff into vCff 
            from Cpr, TypCpr 
            where Cpr.IdtCpr = tDCH(i).IdtCpr
            and Cpr.IDtTypCpr = TypCpr.IdtTypCpr;
            
            if tXML(i).Cns='null' then
                tDCH(i).Cns := to_number(null);
            else
              tDCH(i).Cns          := to_number(tXML(i).Cns)*vCff;
            end if;
      ------------------------------------------
      vChamp := 'IdtCodObsInt';
            -- FNE: 12466
            if tXML(i).IdtCodObsInt='null' then
                tDCH(i).IdtCodObsInt := to_number(null);
            else
        tDCH(i).IdtCodObsInt := to_number(tXML(i).IdtCodObsInt);
            end if;
      ------------------------------------------
      vChamp := 'Frc';
      tDCH(i).Frc          := to_number(tXML(i).Frc);
      ------------------------------------------
      vChamp := 'DatLctInd';
            -- FNE: 12466
            if tXML(i).DatLctInd='null' then
            tDCH(i).DatLctInd:= to_date(null);
            else
      tDCH(i).DatLctInd    := to_date(tXML(i).DatLctInd,'DD-MM-YYYY HH24:MI:SS');
            end if;
      ------------------------------------------
      vChamp := 'IdtCodRlv';
            -- FNE: 12466
            if tXML(i).IdtCodRlv='null' then
                tDCH(i).IdtCodRlv := to_number(null);
            else
        tDCH(i).IdtCodRlv := to_number(tXML(i).IdtCodRlv);
            end if;
      ------------------------------------------
      vChamp := 'IdtCodOrg';
            -- FNE: 12466
            if tXML(i).IdtCodOrg='null' then
               tDCH(i).IdtCodOrg:=    to_number(null);
            else
         tDCH(i).IdtCodOrg    := to_number(tXML(i).IdtCodOrg);
            end if;
      ------------------------------------------
      vChamp := 'IdtCodObs';
            -- FNE: 12466
            if tXML(i).IdtCodObs='null' then
                tDCH(i).IdtCodObs:=to_number(null);
            else
        tDCH(i).IdtCodObs    := to_number(tXML(i).IdtCodObs);
            end if;
      ------------------------------------------
      vChamp := 'IdtCodObs2';
      -- FNE: 12466
            if tXML(i).IdtCodObs2='null' then
                tDCH(i).IdtCodObs2:=to_number(null);
            else
        tDCH(i).IdtCodObs2    := to_number(tXML(i).IdtCodObs2);
            end if;
      ------------------------------------------
      vChamp := 'IdtCodObs3';
            -- FNE: 12466
            if tXML(i).IdtCodObs3='null' then
                tDCH(i).IdtCodObs3 :=to_number(null);
            else
        tDCH(i).IdtCodObs3 := to_number(tXML(i).IdtCodObs3);
            end if;
      ------------------------------------------
      vChamp := 'Note';
      tDCH(i).Note         := tXML(i).Note;
      ------------------------------------------
    EXCEPTION
      when others then
        vCodMsg := 'ERR_RLVPORT006'; -- Erreur dans la transformation des donnees
        vMsg := SQLERRM || chr(13) || chr(10);
        vMsg := vMsg || DBMS_UTILITY.Format_Error_BackTrace;
        raise eException;
    END;
    vChamp := null;
  end loop;
  -- Insertion dans la table DCHINDRLVPORT
  forall i in 1..tDCH.Count
    insert into X7.DCHINDRLVPORT values tDCH(i);
  commit;
  -- Mise a jour de RLV
  MajRLV(vSqcTrt);
  -------------------------------------
  -- Historisation des fichiers
  -------------------------------------
  -- Nous avons fini le traitement, il faut renomer les fichiers
  -- On fait un loop sur les etats possibles pour historiser et on doit exclure les etats 3 et 4
  -- On utilise le caracter _ pour reconnaitre les fichiers que peuvent etre historises
  for i in 1..4 loop
    BEGIN
      if i not in (3) then
        vFileSrc := REGEXP_Replace(pFile,'4\.xml',i || '.xml',1,1,'i');
        if i = 4 then
          vFileDst := REGEXP_Replace(pFile,'4\.xml','5.xml_' || vSqcTrt,1,1,'i');
        else
          vFileDst := REGEXP_Replace(pFile,'4\.xml',i || '.xml_' || vSqcTrt,1,1,'i');
        end if;
        UTL_FILE.fRename('XMLFILES_RLVPORT', vFileSrc,'XMLFILES_RLVPORT',vFileDst,TRUE);
      end if;
    EXCEPTION
      when others then
        null;
    END;
    if i = 4 then
      -- Historisation des fichiers historiques
      vFileSrc := REGEXP_Replace(pFile,'4\.xml','1.xml',1,1,'i');
      vFileSrc := 'Hst-' || vFileSrc;
      vFileDst := REGEXP_Replace(vFileSrc,'1\.xml','5.xml_' || vSqcTrt,1,1,'i');
      BEGIN
        UTL_FILE.fRename('XMLFILES_RLVPORT', vFileSrc,'XMLFILES_RLVPORT',vFileDst,TRUE);
      EXCEPTION
        when others then
        null;
      END;
      -- Historisation des fichiers de tournees
      vFileSrc := REGEXP_Replace(pFile,'4\.xml','1.xml',1,1,'i');
      vFileSrc := 'Trn' || vFileSrc;
      vFileDst := REGEXP_Replace(vFileSrc,'1\.xml','5.xml_' || vSqcTrt,1,1,'i');
      BEGIN
        UTL_FILE.fRename('XMLFILES_RLVPORT', vFileSrc,'XMLFILES_RLVPORT',vFileDst,TRUE);
      EXCEPTION
        when others then
        null;
      END;
    end if;
  end loop;
--  -- Traitement du fichier historique
--  vNomFicFin := REGEXP_Replace('HST-' || pFile,'4\.xml','5.xml.' || vSqcTrt,1,1,'i');
--  BEGIN
--    UTL_FILE.fRename('XMLFILES_RLVPORT', 'HST-' || pFile,'XMLFILES_RLVPORT',vNomFicFin,TRUE);
--  EXCEPTION
--    when others then
--      null;  --FP 10/07/2012 le fichier historique n'est plus censé exister depuis la version 20500 et donc on ne fait rien si exception
--  END;
-- Gestion des exceptions globales
EXCEPTION
  when eException then
    vMsgErr := TRTMSG01.ChercheMsg(vCodMsg);
    vMsgErr := REGEXP_Replace(vMsgErr,':NomFic',pFile,1,0,'i');
    vMsgErr := REGEXP_Replace(vMsgErr,':Champ',vChamp,1,0,'i');
    vMsgErr := REGEXP_Replace(vMsgErr,':TmpDir','TEMP_LOCAL_RLVPORT',1,0,'i');
    vMsgErr := REGEXP_Replace(vMsgErr,':RlvDir','XMLFILES_RLVPORT',1,0,'i');
    vMsgErr := REGEXP_Replace(vMsgErr,':NumCpr',vErr_NumCpr,1,0,'i');
    if vErr_NumCpr is not null then
      vMsgErr := vMsgErr || chr(13) || Chr(10) || 'NumCpr:' || vErr_NumCpr;
    end if;
    if vMsg is not null then
      vMsgErr := vMsgErr || chr(13) || chr(10) || vMsg;
    end if;
    X7.GEST_ERREUR_CENTURA(VersionPkg(),
                           0,
                           'TRTRLVPORT01',
                           'Importer',
                           to_char(SQLERRM),
                           sqlcode,
                           vMsgErr);
    RAISE_APPLICATION_ERROR(X7UTIL.Erreur_X7_centura,vMsgErr);
  WHEN OTHERS THEN
    vMsgErr := TRTMSG01.ChercheMsg('ERR_RLVPORT001');  -- Erreur non gere
    vMsgErr := REGEXP_Replace(vMsgErr,':NomFic',pFile,1,0,'i');
    vMsgErr := REGEXP_Replace(vMsgErr,':Champ',vChamp,1,0,'i');
    vMsgErr := REGEXP_Replace(vMsgErr,':TmpDir','TEMP_LOCAL_RLVPORT',1,0,'i');
    vMsgErr := REGEXP_Replace(vMsgErr,':RlvDir','XMLFILES_RLVPORT',1,0,'i');
    vMsgErr := REGEXP_Replace(vMsgErr,':NumCpr',vErr_NumCpr,1,0,'i');
    if vMsg is not null then
      vMsgErr := vMsgErr || chr(13) || chr(10) || vMsg;
    end if;
    if vErr_NumCpr is not null then
      vMsgErr := vMsgErr || chr(13) || Chr(10) || 'NumCpr:' || vErr_NumCpr;
    end if;
    vMsgErr := vMsgErr || chr(13) || chr(10);
    vMsgErr := vMsgErr || SQLERRM;
    vMsgErr := vMsgErr || chr(13) || chr(10);
    vMsgErr := vMsgErr || DBMS_UTILITY.Format_Error_BackTrace;
    X7.GEST_ERREUR_CENTURA(VersionPkg(),
                           0,
                           'TRTRLVPORT01',
                           'Importer',
                           to_char(SQLERRM),
                           sqlcode,
                           vMsgErr);
    RAISE_APPLICATION_ERROR(X7UTIL.Erreur_X7_centura,vMsgErr);
END Importer;
----------------------------------------------------------------------------------
----------------------------------------------------------------------------------
----------------------------------------------------------------------------------
procedure Controler(pIdtTrt number) is
   type typTABNUMBER is table of number index by binary_integer;
   type typVARCHAR is table of varchar2(20) index by binary_integer;
   tIdtLotFac typVARCHAR;
   tIdtCpr typTABNUMBER;
   tNumCdr typTABNUMBER;
   vCodMsg SYS_MSG.Msg_Code%TYPE;
   vMsg varchar2(2000);
BEGIN
  -------------------------------------------------------
  -- Controle : Date de releve posterieure a la date d'impression du carnet de releve
  -------------------------------------------------------
  select DCHINDRLVPORT.IdtLotFac, DCHINDRLVPORT.IdtCpr, DCHINDRLVPORT.NumCdr
    bulk collect into tIdtLotFac, tIdtCpr, tNumCdr
    from DCHINDRLVPORT,
         TRN,
         PRMGNR
    where TRN.IdtTrn = DCHINDRLVPORT.IdtLotFac || PRMGNR.SprCdf || DCHINDRLVPORT.IdtTrnTyp
     and  trunc(DCHINDRLVPORT.DatLctInd) < trunc(TRN.DatImpRlv)
     and  DCHINDRLVPORT.IdtTrt = pIdtTrt;
  -- Mise a jour des compteurs pour marquer l'erreur
  vCodMsg := 'CTL_RLVPORT001';
  vMsg := TRTMSG01.ChercheMsg(vCodMsg);
  forall i in 1..tIdtCpr.Count
    update DCHINDRLVPORT
      set EttMaj = 2,
          Msg    = vMsg
      where IdtTrt    = pIdtTrt
       and  IdtLotFac = tIdtLotFac(i)
       and  IdtCpr = tIdtCpr(i)
       and  NumCdr = tNumCdr(i);
  tIdtLotFac.Delete;
  tIdtCpr.Delete;
  tNumCdr.Delete;
  -------------------------------------------------------
  -- Controle : Les index ne sont pas saisies dans RLV
  -------------------------------------------------------
  select DCHINDRLVPORT.IdtLotFac, DCHINDRLVPORT.IdtCpr, DCHINDRLVPORT.NumCdr
    bulk collect into tIdtLotFac, tIdtCpr, tNumCdr
    from DCHINDRLVPORT,
         RLV
    where RLV.IdtLotFac = DCHINDRLVPORT.IdtLotFac
     and  RLV.IdtCpr    = DCHINDRLVPORT.IdtCpr
     and  RLV.RngCdr    = DCHINDRLVPORT.NumCdr
     and  RLV.EttRlv   <> 1
     and  DCHINDRLVPORT.IdtTrt = pIdtTrt;
  -- Mise a jour des compteurs pour marquer l'erreur
  vCodMsg := 'CTL_RLVPORT002';
  vMsg := TRTMSG01.ChercheMsg(vCodMsg);
  forall i in 1..tIdtCpr.Count
    update DCHINDRLVPORT
      set EttMaj = 2,
          Msg    = substr(Msg || decode(Msg,null,null,chr(13) || chr(10)) || vMsg,1,2000)
      where IdtTrt = pIdtTrt
       and  IdtLotFac = tIdtLotFac(i)
       and  IdtCpr = tIdtCpr(i)
       and  NumCdr = tNumCdr(i);
  tIdtLotFac.Delete;
  tIdtCpr.Delete;
  tNumCdr.Delete;
  -------------------------------------------------------
  -- Controle : Les index sont saisies dans le PDA
  -------------------------------------------------------
  -- Mise a jour des compteurs pour marquer l'erreur
  vCodMsg := 'CTL_RLVPORT003';
  vMsg := TRTMSG01.ChercheMsg(vCodMsg);
  update DCHINDRLVPORT
    set EttMaj = 2,
        Msg    = substr(Msg || decode(Msg,null,null,chr(13) || chr(10)) || vMsg,1,2000)
    where IdtTrt = pIdtTrt
     and  (IND is null or CNS is null);
  tIdtLotFac.Delete;
  tIdtCpr.Delete;
  tNumCdr.Delete;
  -------------------------------------------------------
  -- Controle : Informations insuffisantes
  -------------------------------------------------------
  -- Mise a jour des compteurs pour marquer l'erreur
  vCodMsg := 'CTL_RLVPORT004';
  vMsg := TRTMSG01.ChercheMsg(vCodMsg);
  update DCHINDRLVPORT
    set EttMaj = 2,
        Msg    = substr(Msg || decode(Msg,null,null,chr(13) || chr(10)) || vMsg,1,2000)
    where IdtTrt = pIdtTrt
     and  (IdtCodRlv is null or IdtCodOrg is null or IdtAgt is null or DatLctInd is null);
  commit;
END Controler;
----------------------------------------------------------------------------------
----------------------------------------------------------------------------------
----------------------------------------------------------------------------------
procedure MajRlv(pIdtTrt number) is
   type typTABNUMBER is table of number index by binary_integer;
   type typVARCHAR is table of varchar2(20) index by binary_integer;
   tIdtLotFac typVARCHAR;
   tIdtCpr typTABNUMBER;
   tNumCdr typTABNUMBER;
   vFile varchar2(200);
   vNbr number;
BEGIN
  Controler(pIdtTrt);
  ----------------------------------------------------
  -- Mise a jour de la table RLV
  ----------------------------------------------------
  update RLV
    set (IdtAgt,
         Ind,
         EttRlv,
         Cns,
         IdtCodRlv,
         IdtCodOrg,
         IdtCodObsInt,
         IdtCodObs,
         IdtCodObs2,
         IdtCodObs3,
         Note,
         Frc,
         DatRlv,
         MtrAgt,
         DatMaj) = (select DCH.IdtAgt,
                           DCH.Ind,
                           decode(DCH.Ind,null,RLV.EttRlv,cEttRlv_Releve),
                           DCH.Cns,
                           DCH.IdtCodRlv,
                           DCH.IdtCodOrg,
                           DCH.IdtCodObsInt,
                           DCH.IdtCodObs,
                           DCH.IdtCodObs2,
                           DCH.IdtCodObs3,
                           DCH.Note,
                           DCH.Frc,
                           DCH.DatLctInd,
                           DCH.MtrAgt,
                           sysdate
                      from DCHINDRLVPORT DCH
                      where DCH.IdtLotFac = RLV.IdtLotFac
                       and  DCH.IdtCpr    = RLV.IdtCpr
                       and  DCH.NumCdr    = RLV.RngCdr
                       and  DCH.IdtTrt    = pIdtTrt)
    where (IdtLotFac, IdtCpr, RngCdr) in (select IdtLotFac,
                                                 IdtCpr,
                                                 NumCdr
                                            from  DCHINDRLVPORT DCH
                                            where IdtTrt = pIdtTrt
                                             and  EttMaj = 0)
    returning IdtLotFac, IdtCpr, RngCdr
      bulk collect into tIdtLotFac, tIdtCpr, tNumCdr;
  -- Mise a jour de la table temporaire
  forall i in 1..tIdtCpr.Count
    update DCHINDRLVPORT
      set EttMaj = 1
      where IdtTrt = pIdtTrt
       and  IdtLotFac = tIdtLotFac(i)
       and  IdtCpr    = tIdtCpr(i)
       and  NumCdr    = tNumCdr(i);
  -- Mise a jour de la table RLV_EXTCTR
  update RLV_EXTCTR
    set (IdtAgt,
         Ind,
         EttRlv,
         Cns,
         IdtCodRlv,
         IdtCodOrg,
         IdtCodObsInt,
         IdtCodObs,
         IdtCodObs2,
         IdtCodObs3,
         Note,
         Frc,
         DatRlv,
         MtrAgt,
         DatMaj) = (select DCH.IdtAgt,
                           DCH.Ind,
                           decode(DCH.Ind,null,RLV_EXTCTR.EttRlv,cEttRlv_Releve),
                           DCH.Cns,
                           DCH.IdtCodRlv,
                           DCH.IdtCodOrg,
                           DCH.IdtCodObsInt,
                           DCH.IdtCodObs,
                           DCH.IdtCodObs2,
                           DCH.IdtCodObs3,
                           DCH.Note,
                           DCH.Frc,
                           DCH.DatLctInd,
                           DCH.MtrAgt,
                           sysdate
                      from DCHINDRLVPORT DCH
                      where DCH.IdtLotFac = RLV_EXTCTR.IdtLotFac
                       and  DCH.IdtCpr    = RLV_EXTCTR.IdtCpr
                       and  DCH.NumCdr    = RLV_EXTCTR.RngCdr
                       and  DCH.IdtTrt    = pIdtTrt)
    where (IdtLotFac, IdtCpr, RngCdr) in (select IdtLotFac,
                                                 IdtCpr,
                                                 NumCdr
                                            from  DCHINDRLVPORT DCH
                                            where IdtTrt = pIdtTrt
                                             and  EttMaj = 0)
    returning IdtLotFac, IdtCpr, RngCdr
      bulk collect into tIdtLotFac, tIdtCpr, tNumCdr;
  -- Mise a jour de la table temporaire
  forall i in 1..tIdtCpr.Count
    update DCHINDRLVPORT
      set EttMaj = 1
      where IdtTrt = pIdtTrt
       and  IdtLotFac = tIdtLotFac(i)
       and  IdtCpr    = tIdtCpr(i)
       and  NumCdr    = tNumCdr(i);
  -- Mise a jour de la note pour les enregistrements sans saisie d'index
  update RLV
    set  Note = (select DCH.Note
                   from DCHINDRLVPORT DCH
                   where DCH.IdtLotFac = RLV.IdtLotFac
                    and  DCH.IdtCpr    = RLV.IdtCpr
                    and  DCH.NumCdr    = RLV.RngCdr
                    and  DCH.IdtTrt    = pIdtTrt)
    where (IdtLotFac, IdtCpr, RngCdr) in (select IdtLotFac,
                                                 IdtCpr,
                                                 NumCdr
                                            from  DCHINDRLVPORT DCH
                                            where IdtTrt = pIdtTrt
                                             and  EttMaj <> 1);
  update RLV_EXTCTR
    set  Note = (select DCH.Note
                   from DCHINDRLVPORT DCH
                   where DCH.IdtLotFac = RLV_EXTCTR.IdtLotFac
                    and  DCH.IdtCpr    = RLV_EXTCTR.IdtCpr
                    and  DCH.NumCdr    = RLV_EXTCTR.RngCdr
                    and  DCH.IdtTrt    = pIdtTrt)
    where (IdtLotFac, IdtCpr, RngCdr) in (select IdtLotFac,
                                                 IdtCpr,
                                                 NumCdr
                                            from  DCHINDRLVPORT DCH
                                            where IdtTrt = pIdtTrt
                                             and  EttMaj <> 1);
  -- Mise a jour de la tournee
  -- On met a jour les tournees traitees meme s'il n'y a pas eu une maj
  update TRN
    set IdtEttTrn = 2,
        DatImpRlv = trunc(sysdate)-1,
        Fch = null
    where (IdtTrn,Sqc) in (select IdtLotFac || PRMGNR.SprCdf || IdtTrnTyp, Sqc
                             from DCHINDRLVPORT, PRMGNR
                             where IdtTrt = pIdtTrt);
  -- Mise a jour de TCHE s'il y a des index a exporter
--  select count(*)
--    into vNbr
--    from RLV
--    where IdtLotFac = (select IdtLotFac
--                         from DCHINDRLVPORT
--                         where IdtTrt = pIdtTrt
--                          and  EttMaj = 1)
--     and  EttRlv = 1;
--  if vNbr > 0 then
    update TCHE
      set Stt = 'L'
      where IdtTypTche = 'TRT2003'
       and  Prm2 in (select LOTFAC.IdtLotFac
                       from LOTFAC,
                            TRN,
                            RLV
                       where TRN.IdtTrn like LOTFAC.IdtLotFac || '-%'
                        and  RLV.IdtLotFac = LOTFAC.IdtLotFac
                        and  RLV.IdtTrn    = TRN.IdtTrn
                        and  RLV.Sqc       = TRN.Sqc
                        and  RLV.EttRlv    = 1
                        and  TRN.IDTTYPRLV = 'PORTAB'
                        and  TRN.IdtEttTrn = 2
                        and  LOTFAC.IdtLotFac in (select IdtLotFac from DCHINDRLVPORT where IdtTrt =pIdtTrt)
                       group by LOTFAC.IdtLotFac
                       having count(*) > 0)
       and  RowId = (select max(RowId)
                       from TCHE b
                       where b.IdtTypTche = 'TRT2003'
                        and  b.Prm2 = TCHE.Prm2);
--  end if;
  -- Mise a jour de l'etat global du traitement
  update DCHINDRLVPORT
    set EttTrt = 1,
        DatTrt = sysdate
    where IdtTrt = pIdtTrt;
  commit;
END MajRlv;
----------------------------------------------------------------------------------
----------------------------------------------------------------------------------
----------------------------------------------------------------------------------
procedure GenererRapport(pIdtMdlXdr number, pNomFic varchar2) is
  vWhr varchar2(2000);
  vMsgErr varchar2(2000);
BEGIN
  -- Ajout de la condition pour generer le rapport seulement s'il n'est pas deja genere
  vWhr := 'DatImp is null';
  TRTEXP01.GenererRapportXDocTrt(pIdtMdlXdr,
                                 pNomFic,
                                 'PDF',
                                 vWhr,
                                 vMsgErr,
                                 null,
                                 null,
                                 null,
                                 null,
                                 null,
                                 null,
                                 null,
                                 null,
                                 null,
                                 null);
  if vMsgErr is null then
    update DCHINDRLVPORT
      set DatImp = sysdate
      where DatImp is not null;
    commit;
  end if;
END GenererRapport;
----------------------------------------------------------------------------------
----------------------------------------------------------------------------------
----------------------------------------------------------------------------------
function CnsMoyJou (pIdtCpr number,
                    pIdtPntLvr number,
                    pIdtPntCpg number,
                    pNumCdr number,
                    pIdtCtr number,
                    pDatDbtEst date,
                    pDatFinEst date)
  return number is
  vCns number;
  vDatDbtEst date;
  vDatFinEst date;
  vInd number;
  vIdtCodRlvEst number;
  vCr number;
  vNbrJou number;
BEGIN
  vDatDbtEst := trunc(pDatDbtEst);
  vDatFinEst := trunc(pDatFinEst);
  -- Appel a la procedure standard de calcul de la moyenne
  RLVBAT06_SPC.EstIndCnsxCdr(pIdtCpr,
                             pIdtPntLvr,
                             pIdtPntCpg,
                             pNumCdr,
                             null,
                             4,  -- Code d'origine releve portable
                             vDatDbtEst,
                             vDatFinEst,
                             2,
                             vInd,
                             vCns,
                             vIdtCodRlvEst,
                             vCr);
  -- Calcul du nombre de jours pour l'estimation
  vNbrJou := vDatFinEst - vDatDbtEst;
  -- Calcul de la moyenne journaliere
  if vNbrJou = 0 then
    vNbrJou := 1;
  end if;
  vCns := vCns / vNbrJou;
  return vCns;
END;
--------------------------------------------------------------------------
--------------------------------------------------------------------------
--------------------------------------------------------------------------
function CodRlvEst (pIdtCpr number,
                    pIdtPntLvr number,
                    pIdtPntCpg number,
                    pNumCdr number,
                    pIdtCtr number,
                    pDatDbtEst date,
                    pDatFinEst date)
  return number is
  vCns number;
  vDatDbtEst date;
  vDatFinEst date;
  vInd number;
  vIdtCodRlvEst number;
  vCr number;
  vNbrJou number;
BEGIN
  vDatDbtEst := trunc(pDatDbtEst);
  vDatFinEst := trunc(pDatFinEst);
  -- Appel a la procedure standard de calcul de la moyenne
  RLVBAT06_SPC.EstIndCnsxCdr(pIdtCpr,
                             pIdtPntLvr,
                             pIdtPntCpg,
                             pNumCdr,
                             null,
                             4,  -- Code d'origine releve portable
                             vDatDbtEst,
                             vDatFinEst,
                             2,
                             vInd,
                             vCns,
                             vIdtCodRlvEst,
                             vCr);
  return vIdtCodRlvEst;
END;

-----------------------------------------
-----------------------------------------
-----------------------------------------

Procedure EstTrnDivisible( pIdtTrn TRN.IDTTRN%type,
                           pSqc    TRN.SQC%type,
                           pMsg    out VARCHAR2)
IS
    vEtat Number;
    vFic  Varchar2(250);
BEGIN

    pMsg := null;

    select IDTETTTRN, FCH
    into vEtat,vFic
    from TRN
    where IDTTRN = pIdtTrn
    and SQC = pSqc;

    if vEtat > 8
    or vFic is not null then
        pMsg := 'E635';
        return;
    end if;

EXCEPTION
    WHEN NO_DATA_FOUND THEN
        pMsg := 'E635';
        RETURN;
    WHEN OTHERS THEN
        X7.GEST_ERREUR_CENTURA(VersionPkg(),
                              0,
                              'TRTRLVPORT01',
                              'EstTrnDivisible',
                              to_char(SQLERRM),
                              sqlcode,
                              DBMS_UTILITY.FORMAT_ERROR_BACKTRACE);
        Raise;

END EstTrnDivisible;

-----------------------------------------
-----------------------------------------
-----------------------------------------
Procedure AnulerGeneration( pIdtTrn TRN.IDTTRN%type,
                            pSqc    TRN.SQC%type,
                            pMsg    out VARCHAR2)
IS
    vEtat Number;
    vFic  Varchar2(250);
    vFic4  Varchar2(250);
    vFicTmp varchar2(250);
    vFileSrc varchar2(2000);
    vFileDst varchar2(2000);
    eException EXCEPTION;
    vCodMsg SYS_MSG.Msg_Code%TYPE;
    vFile bfile;
    vFichierExiste number;
    vIdtLotFac LOTFAC.IdtLotFac%TYPE;
    vLob clob;
    vXml XMLTYPE;
    vNbrRlv number;
    vNbrxRlv number;
    vSqcTrt number;
    vEtt number;
BEGIN
  -- On peut annuler la generation si la tournee n'est pas chargee dans le PDA (Fichier avec ett=1)
  -- ou si la tournee est dechargee du PDA (Fichier avec l'etat 4) et il n'y a pas des index lus
  pMsg := null;
  select IDTETTTRN, FCH
  into vEtat,vFic
  from TRN
  where IDTTRN = pIdtTrn
  and SQC = pSqc;
  if vFic is null then
    vCodMsg := 'ERR_RLVPORT013'; -- La tournee n'a pas ete generee
    raise eException;
  end if;
  -- Si la tournee a ete dechargee on ne peut pas la modifier
--  if vEtat = 4 then
--    vCodMsg := 'ERR_RLVPORT011'; -- Tournee dechargee
--    raise eException;
--  end if;
  -- Verification si la tournee a ete dechargee du PDA
  vFic4 := REGEXP_Replace(vFic,'0\.xml','4.xml',1,1,'i');
  vFile       := bFileName('XMLFILES_RLVPORT',vFic4);
  vFichierExiste := DBMS_LOB.FileExists(vFile);
  if vFichierExiste = 1 then
    DBMS_LOB.CreateTemporary(vLob,TRUE);
    -- Vefification s'il y a des index releves
    DBMS_LOB.FileOpen(vFile);
    DBMS_LOB.LoadFromFile(vLob,
                          vFile,
                          DBMS_LOB.LobMaxSize,
                          1,
                          1);
    vXml := XMLTYPE(vLob);
    DBMS_LOB.FileClose(vFile);
    select sum(decode(Ind,null,0,1)) NbrRlv
      into vNbrRlv
      from (select ExtractValue(value(ct),'/TRN/IND') Ind
              from table(XMLsequence(Extract(vXml,'/TOURNEE/TRN'))) ct);
    if vNbrRlv > 0 then
      vCodMsg := 'ERR_RLVPORT012'; -- Il y a des index lus
      raise eException;
    end if;
    vEtt := 4; -- On signale que le fichier est en etat 4
  else
  -- Pas de fichier en etat 4, verification si le fichier existe en etat 0 (pour charger)
    -- Vefification si le fichier existe
    vFile       := bFileName('XMLFILES_RLVPORT',vFic);
    vFichierExiste := DBMS_LOB.FileExists(vFile);
    -- Si le fichier n'existe pas, il a ete synchronise et il est en cours de releve,
    -- on ne peut pas diviser la tournee
    if vFichierExiste = 0 then
      vCodMsg := 'ERR_RLVPORT009'; -- Le fichier n'existe pas
      raise eException;
    end if;
    vEtt := 0; -- On signale que le fichier est en etat 0
  end if;
  -- On efface les fichiers en etat 0, les autres on doit les renommer.
  -- Si on ne peut pas effacer les fichiers en cas de etat 0, on genere un message
  -- d'erreur. Pour les autres, on ne fait rien
  if vEtt = 0 then
    if vFichierExiste = 1 then
      BEGIN
        vFicTmp := 'TRN' || vFic;
        UTL_FILE.fRemove('XMLFILES_RLVPORT',vFicTmp);
        vFicTmp := 'Hst-' || vFic;
        UTL_FILE.fRemove('XMLFILES_RLVPORT',vFicTmp);
        vFicTmp := vFic;
        UTL_FILE.fRemove('XMLFILES_RLVPORT',vFicTmp);
      EXCEPTION
        when others then
          vCodMsg := 'ERR_RLVPORT010'; -- Impossible effacer le fichier
          raise eException;
      END;
    end if;
  end if;
  -- Renommage des fichiers dans un autre etat
  select Seq_TrtRlvPort.NextVal into vSqcTrt from dual;
  for i in 1..4 loop
    BEGIN
      if i not in (3) then
        vFileSrc := REGEXP_Replace(vFic,'0\.xml',i || '.xml',1,1,'i');
        vFileDst := REGEXP_Replace(vFic,'0\.xml',i || '.xml_' || vSqcTrt,1,1,'i');
        UTL_FILE.fRename('XMLFILES_RLVPORT', vFileSrc,'XMLFILES_RLVPORT',vFileDst,TRUE);
      end if;
    EXCEPTION
      when others then
        null;
    END;
  end loop;
  -- Les fichiers on ete effaces, on doit retablir la tache pour pouvoir la relancer
  -- On cherche le lot de facturation
  vIdtLotFac := substr(pIdtTrn,1,instr(pIdtTrn,'-')-1);
  -- mise a jour de la tache
  update TCHE
    set Stt = 'L'
    where IdtTypTche = 'TRT2003'
     and  Prm2 = vIdtLotFac;
  -- Mise a jour de l'etat de la tournee
  update TRN
    set IdtEttTrn = 2,
        Fch = null
    where IdtTrn = pIdtTrn
     and  Sqc = pSqc;
  -- On doit faire commit, car les fichiers ont ete effaces
  commit;
EXCEPTION
    WHEN eException THEN
        pMsg := TRTMSG01.ChercheMsg(vCodMsg);
        pMsg := replace(pMsg,':NomFile', vFicTmp);
        pMsg := replace(pMsg,':NbrRlv',vNbrRlv);
    WHEN NO_DATA_FOUND THEN
        pMsg := 'E635';
        RETURN;
    WHEN OTHERS THEN
        pMsg := SQLERRM || chr(13) || chr(10);
        pMsg := DBMS_UTILITY.FORMAT_ERROR_BACKTRACE;
        GEST_ERREUR_CENTURA(VersionPkg(),
                              0,
                              'TRTRLVPORT01',
                              'AnulerGeneration',
                              to_char(SQLERRM),
                              sqlcode,
                              DBMS_UTILITY.FORMAT_ERROR_BACKTRACE);
END AnulerGeneration;

-----------------------------------------
-----------------------------------------
-----------------------------------------
Procedure DiviserTournee( pIdtTrn TRN.IDTTRN%type,
                          pSqc    TRN.SQC%type,
                          pNbrCpr Number,
                          pIdtAgt AGT.IDTAGT%type,
                          pMsg    out VARCHAR2)
IS
  vSqcNew number;
BEGIN

    select max(sqc) + 1
    into vSqcNew
    from TRN
    where IDTTRN = pIdtTrn;

    insert into trn (IDTTRN, IDTAGT, IDTETTTRN, DATIMPRLV, DATPRVRLV, LIBABR, IDTTYPRLV, LIBINT, IDTTRNRGP, FCH, IDTAGTCTL, SQC)
    select IDTTRN, pIdtAgt, IDTETTTRN, DATIMPRLV, DATPRVRLV, LIBABR, IDTTYPRLV, LIBINT, IDTTRNRGP, FCH, IDTAGTCTL, vSqcNew
    from trn
    where IDTTRN = pIdtTrn
    and SQC = pSqc;

    insert into trntyprlv (IDTLOTFAC, NBRCPR, IDTTRNTYP, IDTTRN, SQC)
    select IDTLOTFAC, pNbrCpr, IDTTRNTYP, IDTTRN, vSqcNew
    from trntyprlv
    where IDTTRN = pIdtTrn
    and SQC = pSqc;

    update rlv set
    SQC = vSqcNew --,
    -- Il ne faut pas mettre a jour l'agent
--    IDTAGT = pIdtAgt
    where IDTTRN = pIdtTrn
    and SQC = pSqc
    and IDTSQCGNR not in (
        select idtsqcgnr from (
            select idtsqcgnr from rlv
            where IDTTRN = pIdtTrn
            and SQC = pSqc
            order by IDTLOTFAC, IDTCPR, RNGCDR
            )
        where rownum <= (select count(*) - pNbrCpr from rlv
                        where IDTTRN = pIdtTrn
                        and SQC = pSqc)
        );

    update trntyprlv set
    NBRCPR = (select count(*) from rlv
                where IDTTRN = pIdtTrn
                and SQC = pSqc)
    where IDTTRN = pIdtTrn
    and SQC = pSqc;

EXCEPTION
    WHEN OTHERS THEN
        X7.GEST_ERREUR_CENTURA(VersionPkg(),
                              0,
                              'TRTRLVPORT01',
                              'DiviserTournee',
                              to_char(SQLERRM),
                              sqlcode,
                              DBMS_UTILITY.FORMAT_ERROR_BACKTRACE);
        Raise;

END DiviserTournee;
-----------------------------------------
-----------------------------------------
-----------------------------------------
function WrapText(pTxt varchar2, pLen number)
  return varchar2 is
  vReturn varchar2(4000);
  vStr varchar2(4000);
  vStrTmp varchar2(4000);
  vPos number;
BEGIN
  if length(pTxt) <= pLen then
    return pTxt;
  end if;
  vStr := pTxt;
  LOOP
    vStrTmp := substr(vStr,1,pLen);
    if nvl(length(vStrTmp),0) = 0 then
      exit;
    end if;
    if length(vStrTmp) <> length(vStr) then
      -- Recherche du dernier espace avant la longueur envoyee
      vPos := instr(vStrTmp,' ',-1);
      -- Si on trouve le space, on coupe la chaine a cet endroit
      if vPos > 0 then
        vStrTmp := substr(vStrTmp,1,vPos);
      end if;
    end if;
    if vReturn is not null then
      -- Ajout du retour a la ligne
      vReturn := vReturn || chr(13) || chr(10);
    end if;
    vReturn := vReturn || trim(vStrTmp);
    vStr := trim(substr(vStr,length(vStrTmp)+1));
  end loop;
  return vReturn;
END WrapText;
END TRTRLVPORT01;
/
