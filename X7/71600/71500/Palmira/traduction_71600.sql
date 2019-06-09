set time on 
set echo on 
set define off 
spool CHN.log 


DROP TABLE CHN purge;
DROP SEQUENCE SEQ_IDTCHN;
CREATE TABLE CHN (
	IDTCHN  NUMBER NOT NULL , 
	DATA_CHN VARCHAR2( 4000 ),
	PRIMARY KEY ( IDTCHN )
);

CREATE SEQUENCE SEQ_IDTCHN
	START WITH 1
	MAXVALUE 999999999999999999999999
	MINVALUE 1
	NOCYCLE
	NOCACHE
	NOORDER;

CREATE TRIGGER TBI_IdtDimUntMsr
	BEFORE INSERT
	ON CHN
	FOR EACH ROW
BEGIN
	SELECT SEQ_IDTCHN.NEXTVAL
    INTO :NEW.IDTCHN 
    FROM DUAL;
END;
/




SET DEFINE OFF;
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Nombre de tournées');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Numéro de lot');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Période');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Nombre de');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('compteurs');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Relevé');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Date d''édition');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Relève');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Date de début');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Date de fin');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('% avancement');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Situation de l''affaire');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('CODE');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Etape numéro');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Code retour');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Date d''exécution');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Intervention');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Compte client');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Contrat');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Point de livraison / comptage');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Compteur');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Caissier');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Structure');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Numéro de caisse');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Heure');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Code et nom client');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Mode');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Nom de l''agence');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Nom de la caisse');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Usage détaillé du client');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Montant du timbre');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Nombre de factures');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Solde début de journée :');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Solde fin de journée :');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Récapitulatif des encaissements');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Points de comptage à couper');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Point de comptage');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('N° client');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Nom et prénom du client');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Total des points de comptage à couper');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('pour un montant de');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Cpr');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Extraction d''un contrat d''un lot');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Agent');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Extraction du contrat N°');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('du lot de facturation N°');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Code client');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Nom du client');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Numéro de tournée');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Période concernée');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Question');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Information');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Informations');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Erreur');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Erreurs');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Liste de contrôle');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Erreur système');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('(Aucun)');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('(Plus d''éléments...)');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Continuer');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Annuler');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Critères de sélection de la liste');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Page');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Réparties');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Regroupées');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Avance');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Echu sur date de relève');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Echu sur date théorique');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Ouverture de caisse');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Ré-ouverture de caisse');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Fermeture de caisse');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Verrouillage de caisse');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Déverrouillage de caisse');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Encaissement');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Transfert de caisse à caisse');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Contrôle de caisse');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Ecart de caisse');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Annulation de mouvement');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Forçage de fermeture de caisse');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Toutes les devises');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Tous les mouvements');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Tous les modes de règlement');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Client');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Facture');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Regroupement');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Echéancier');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Opération');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Tous les types de journaux comptables');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Motif d''intervention');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Motif de mouvement');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Point de rattachement');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Type d''information');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Type de période');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Limitation');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Motif d''invalidation');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Motif de retour d''impayé');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Anomalie');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Document identité');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Document officiel');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Document remis');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Capacité (Quantité nominale)');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Etat du recensement');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Nature de règlement');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Origine du contact');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Motif de fin de contact');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Motif de fin d''intervention');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Motif de fin d''action');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Motif de fin d''affaire');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Observations du dispositif');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Priorité de l''appel');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Type de tiers');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Lecture de l''index :');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('traitement de l''index :');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Environnement de simulation');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Nouveau');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Affiche les données de l''enregistrement précédent');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Affiche les données de l''enregistrement suivant');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('En cours de création d''avenant');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Historique D');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Historique D parent');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Entre');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Pas entre');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('N''est pas renseigné');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Est renseigné');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Supérieur ou égal à');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Supérieur à');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Inférieur ou égal à');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Inférieur à');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Différent de');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Contient');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Commence par');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Ne commence pas par');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Egal à');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Comme');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Pas comme');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Dans la liste');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Adresse');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Numéro');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Nom');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Prénom');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Solde global');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('dont exigible');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Au');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Devise');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Date');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Type');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Référence');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Exigible');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Débit');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Crédit');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Solde');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Non affecté');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('CLIENT');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('ADRESSE');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Montant total');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Créé le / par');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Montant');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Liste des affaires');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Liste répondant aux conditions de recherche');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Contact');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Plan d''actions');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Début');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Fin');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Nombre de lignes :');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Propriété');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Entité');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Valeur 1');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Condition');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Conditions de recherche');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Plans d''actions');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('N° Etape');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Auto');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Libellé');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Niveau');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Liste des clients à relancer');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Solde exigible');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Dernière relance');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Nombre de contrats à relancer');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Total exigible');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Liste des mouvements de caisse');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Matricule');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Du');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Mouvements');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Modes de règlement');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Caisse');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Mode de');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('règlement');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Montants');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Encaissés/transférés');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('en caisse');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Suivi du carnet de relève');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Tournée');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('SalHideWindow');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('SalPostMsg CAM_Traduction');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Contrats de fourniture dépendants');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('nGNumberTmp1 :');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Recensements dépendants');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Par :');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('CAM_Traduction');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Cadre tableau');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('SalShowWindow CAM_Traduction');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('| Fiche');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('SalPostMsg cgForm CAM_Traduction');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('° enregistrement affiché en');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('s. Moyenne');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('s depuis');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Numérique');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('DEB Sauvegarde');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('FIN Sauvegarde');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('DEB Tri');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('FIN Tri');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('DEB Restaure');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('FIN Restaure');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('sTab');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('cgFilterTable WM_PASTE');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Click bouton historique');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Historique =>');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Historique');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('{0} Historiques');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('{0} Historique');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('nIndex != LB_Err');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('nSelection SalNumberLow SalNumberHigh');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Dépassement de capacité de combobox :');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('SalShowWindow MNC_ChangeEntity');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Avant Changement');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Apres Changement');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Facture de rectification');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Impossible de localiser X7.exe.');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('La clé est incorrecte.');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('La clé ne correspond pas au programme X7.exe.');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Pas assez d''espace disque pour créer le fichier de protection.');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('L''exécution du programme nécessite une licence réseau.');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Erreur du système d''exploitation.');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Les librairies crp95*.dll sont introuvables.');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Ce programme ne peut être lancé à partir d''une disquette.');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Le fichier de protection est inaccessible.');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Le programme n''est pas autorisé.');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Le programme à été déplacé ou le mot de passe est incorrect.');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Le fichier de protection est endommagé.');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('La date et/ou l''heure ont été modifiées.');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('La licence a expiré : date d''utilisation dépassée.');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('La licence a expiré : nombre maximum d''exécutions atteint.');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Le fichier de restriction (.rst) a été effacé.');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Le fichier de restriction (.rst) est endommagé.');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Le fichier de restriction (.rst) a été déplacé ou écrasé.');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('La clé a été réutilisée.');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('La table des utilsateurs est illisible.');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Le nombre maximum d''utilisateurs connectés à été atteint.');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Vous n''êtes pas autorisé à lancer le programme en tant que serveur.');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('dd/MM/yyyy hhhh:mm:ss');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Retour');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Retablir');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('AffChpPrm nMiroir');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('nHorizontal1');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('nY');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Contrat de fourniture');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Affiche l''aide sur le document courant');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Affiche l''index de l''aide');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Avant pliage / dépliage d''un niveau');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('notes...');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('note...');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Notes...');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Informations...');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Information...');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Fichiers...');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Fichier...');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Application');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Class');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Session');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Parent');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Assistant');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Name');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Version');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Logon');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Dial');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Selection');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Actions');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Importance');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Description');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Index');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Visible');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Aperçu avant impression - [ {P0} ]');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('MDIX7Max');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('MDIX7Hauteur');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('MDIX7Large');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Fonction');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Enregistrer');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Enregistrer en masse');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Fermer');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Rétablir');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Imprimer');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Configuration de l''impression');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Exploitation');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Gestion des tâches');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Chargement');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Lancement du batch');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Historique des modifications');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Paramètres des traces');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Thème');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Window 2010 Noir');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Window 2010 Argent');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Window 2010 Bleu');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Window 2010');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Window 2007 Argent R3');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Window 2007 Obsidian R3');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Window 2007 Bleu R3');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Window 2007 Argent R2');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Window 2007 Obsidian R2');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Window 2007 Bleu R');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Window 2007');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Window XP');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Window Studio 2008');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Window Studio 2005');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Window Office 2003 ST');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Window Office 2003');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Window Office XP');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Window Office 2000');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Window Défaut');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Langue');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Fermer la session');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Quitter');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Recherche');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Précédent');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Suivant');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Premier');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Dernier');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Informations liées');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Clients dépendants');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Contrats dépendants');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Contrats dépendants (client souscripteur)');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Contrats dépendants (client destinataire)');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Points de livraison dépendants');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Points de comptage dépendants');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Compteurs dépendants');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Contacts dépendants');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Affaires en cours dépendantes');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Interventions dépendantes');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Comptes client dépendants');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Recherche directe');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Remettre à zéro les critères de recherche');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Rechercher');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Liste complète');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Données');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Point de livraison');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Synthèse');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Centre opérationnel');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Structure du distributeur');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Adresse géographique');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Information technique');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Gestion des compteurs généraux et divisionnaires');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Profil');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Mot de passe');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Paramètres client');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Qualité');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Catégorie');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Sensibilité');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Paramètres contrat');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Usage');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Puissance souscrite');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Type de contrat');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Motif d''extraction');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Catalogue des champs paramétrables');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Mode de recouvrement');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Recouvrement type');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Paramètres techniques');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Type d''habitation');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Type de compteur');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Diamètre');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Type de cadran');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Type de comptage');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Technique de comptage');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Usage du compteur');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Unité de mesure');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Rattachement');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Dispositif émetteur');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Observation du dispositif');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Synchronisation');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Paramètres structure');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Paramètres de l''adresse structurée');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Paramètres généraux');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Demande');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Affaire');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Action');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Compte rendu d''intervention');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Relance');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Coupure');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Gestion');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Suivi des agents d''accueil');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Suivi des agents d''intervention');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Messagerie');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Plan d''action commercial massif');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Plan d''action technique massif');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Paramètres');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Type de contact');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Type de plan');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Type d''action');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Plan d''action');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Catalogue d''actions');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Mode de coupure');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Suivi de la facturation');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Saisie des index');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Tournée de relève');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Tournée type');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Ordonnancement');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Suivi des releveurs');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Code origine');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Code relève');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Code observation');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Type de releve');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Matrice de décision');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Planification de la relève seule');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Suivi de la relève seule');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Lot type');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Lot type manuel');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Suivi des lots manuels');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Devis');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Facture manuelle');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Facture intermédiaire');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Charge additionnelle');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Visualisation de facture');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Règles de facturation');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Cycle de facturation');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Facture type');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Modèle de facture manuelle');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Tarif');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Rubrique');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Regroupement de rubrique');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Taxe');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Indice');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Formule de révision des prix');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Message');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Tiers');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Service');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Type de facture');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Type de rubrique');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Modèle de lot');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Motif d''annulation de facture');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Planification de la facturation');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Opération sur caisse');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Changement de caisse');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Suivi des caisses');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Forçage de la fermeture');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Seuil de fond de caisse');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Seuil de caisse');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Mode de règlement');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Type de mouvement');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Nature de mouvement');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Motif d''annulation d''encaissement');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Compte');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Visualisation');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Demande de prélèvement');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Demande de remboursement');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Changement de situation');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Régularisation');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Saisie d''une opération');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Transfert de réglement');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Affectation');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Désaffectation');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Retour d''impayé');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Interface comptable');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Extraction comptable');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Gestion des journaux comptables');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Type d''opération');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Nature d''opération');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Situation');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Périodicité des échéances');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Banque');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Calendrier de prélévement');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Documents');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Impression des rapports');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Routage');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Constitution du lot de routage');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Gestion du routage par lot');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Saisie de masse');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Définition des groupements');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Catalogue des rapports');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Type de routage');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Code d''observation du routage');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Export');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Définition d''un rapport de publipostage');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Recensement');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Suivi du recensement');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Tournée de recensement');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Document d''identité');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Centre d''appel');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Tableau blanc');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Administration');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Changement de poste');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Priorités');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Gestion des interventions');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Interventions à traiter');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Interventions en traitement');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Liste des affectations');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('A propos de');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Informations système');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('ActionMenu avant droit');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('ActionMenu avant action');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Enter');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Control');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Localité/code postal');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Telephone');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Facturation');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Relève seule');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('LireTaux');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Date d''exigibilité');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Date d''expiration');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Visualisation de devis');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Expire');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Facture d''annulation avec désempilage');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Facture d''annulation SANS désempilage');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Facture annulée avec désempilage');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Facture annulée SANS désempilage');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Facture rectifiée');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('sCtr');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Graphe');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Vous n''avez pas le droit de faire cette annulation.');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Solde au');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Nombre d''opérations au');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Idc');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Le nom de variable doit être différent du nom de variable de référence.');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('FmlRvs');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Suivi des Lots manuels');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Lot de relève');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('La clause whr du LOTFAC');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Nombre d''enquêtes');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Suivi des Lots de recensement');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Suivi des Lots');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('PB_Facture');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('DoubleClickTableau nMntOprTot');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Code agent');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Opération d''annulation');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Reçu de');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Transféré vers');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('{P0} opérations vont être modifiés. Confirmez-vous ?');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('{P0} opération va être modifié. Confirmez-vous ?');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Tiers...');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('L''agent qui fait l''encaissement n''est pas celui qui a ouvert la caisse.');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Le montant payé n''est pas égal à la somme des montants afféctés + le montant rendu/avance + frais.');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('environment');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('sNomFichier');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('retour lecture');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('lg lu FCH sBlobRech');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Ouverture fichier');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Ecriture fichier');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('A rendre');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('sMonThousandSep');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('sMonDecimalSep');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('sCurrency');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('iCurrency');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('connecté à');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Nouveau Fichier');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Nombre lu');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Position');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('From');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('XDocReport');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Entrée dans ImpRptC');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Impression différée');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('CrystalReportsViewer.exe');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Avant Impression');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Apercu Impression');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Apercu Impression SQT');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('.docx');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Impression');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Impression SQT');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Creation tache SQT');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('PcLAnce');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('X7.AFFBTC01.TrtActCrsXDoc (');
Insert into X7.CHN
   (DATA_CHN)
 Values
   (''', :sRetFctCtl )');
Insert into X7.CHN
   (DATA_CHN)
 Values
   (''', :sRetFctCtl,');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Après pliage / dépliage d''un niveau');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('cGenDiv');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('ChargeNormaux Deb');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('ChargeNormaux Fin');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('ChangerDivEnGen');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('DeplacerAttchesNormaux Question');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('DeplacerAttchesNormaux Question Fin');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('DeplacerAttchesNormaux Fin');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Trier');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('DetacherVersNormaux');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Ce code d''estimation ne peut pas être saisi manuellement, il doit être déclenché par un code d''observation.');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Inactif');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Actif');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('sur factures les plus récentes');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('sur factures les plus anciennes');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Ce numéro doit être compris entre 1 et 4.');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Ce numéro doit être compris entre 1 et 6.');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Le niveau du centre opérationnel doit être compris entre 1 et');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Les écarts doivent être rentrés par ordre croissant.');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Le montant maximum doit être à vide sur la dernière ligne.');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Il est obligatoire de définir une borne égale à 0.');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Entrée');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Configuration des champs paramétrables - Choix de la fiche');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Configuration des champs paramétrables - Choix du champ dépendant');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Afficher Erreur');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('PreparerControle');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('ValiderEtape');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Positionnement par défaut');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Positionnement initial à gauche');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Positionnement initial à droite');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Modification du code point de livraison');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Transfert du point de comptage');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Point de livraison de destination');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Complément de requête généré par le filtre');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Complément de requête modifié');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Telephones');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Client destinataire');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Client souscripteur');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Action impossible, aucun appel en cours sur votre poste.');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Action impossible, plusieurs appels en cours sur votre poste.');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('L''appel est toujours en cours, vous devez terminer l''appel avant de pouvoir enregistrer');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Prev');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Last');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Index...');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Janvier');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Février');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Mars');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Avril');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Mai');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Juin');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Juillet');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Août');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Septembre');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Octobre');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Novembre');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Décembre');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Dimanche');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Lundi');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Mardi');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Mercredi');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Jeudi');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Vendredi');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Samedi');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Utilisateur');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('connecté');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Outlook');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('TailleMenuX7');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Nouveau document');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Passe en mode création sur le document actif');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Ferme le document actif');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Enregistre les modifications sur le document actif');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Au prorata');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Début de période');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Fin de période');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Pas de tranche');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Tranches fixes');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Tranches variables');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Echéances');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Mensualisation');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Factures');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Règlements');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Relevé de compte');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Toutes');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('avec lettrage');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Liste de toutes les opérations');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Oui');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Non');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Compté');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Forfaitaire');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Total facture');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Excédent');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Fixe');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Ouverte');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Fermée');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Verouillée');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Lecture de la table :');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Mise à jour des lignes de la table :');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Insertion de lignes dans la table :');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Suppression de lignes de la table :');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Table :');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('traitement de la table :');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Lecture de la vue :');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('traitement de la vue :');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Lecture de la contrainte :');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('traitement de la contrainte :');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('de');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('à');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Lecture du trigger :');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('traitement du trigger :');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('de la table');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Lecture');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('traitement');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('N° de caisse');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Authentification');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Ticket de caisse');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Total en caisse');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Total du transfert');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Total encaissé');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Montant payé');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Montant rendu');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Guichet');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Caisse émettrice');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Caisse Réceptrice');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Total contrôle');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Agent contrôleur');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Total régularisation');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Crée un nouvel enregistrement');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Enregistre les données du document actif');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Imprime les données du document actif');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Imprimer en masse');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Imprime les données des éléments résultant de la recherche');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Aperçu avant impression');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Visualisation du document actif avant impression');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Afficher précédent');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Afficher suivant');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Afficher liste complète');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Affiche la totalité des enregistrements dans la liste');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Ouvrir filtre');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Ouvre le filtre du document actif');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Ouvre le document client');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Ouvre le document contrat');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Ouvre le document point de livraison');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Ouvre le document point de comptage');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Ouvre le document compteur');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Enregistre les données du document actif en masse');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Ouvre le document contact');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Ouvre le document affaire');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Ouvre le document action');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Ouvre le document intervention');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Ouvre le document compte client');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Ouvre le document caisse');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Afficher fiche');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Affiche la fiche du document actif');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Afficher liste');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Affiche la liste du document actif');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Permettre la recherche directe');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Permet la recherche directe sur le document actif');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Remet à zéro les critères de recherche sur le document actif');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Test de performance');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Mettre en mode test de performance');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Navigation sur les erreurs - F7 : erreur précédente - F8 : erreur suivante');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Normal');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('En cours de création');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('En cours de résiliation');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('En attente de calcul');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('En attente de validation');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('En cours de facturation périodique');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('En cours de facturation périodique avec un lot en relève seule');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('En recensement lot n°:');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Recensé');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('inclus dans un lot de facturation');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Fichier import');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Fichier export');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Mise à jour X7');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('â');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('î');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('ô');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('û');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('ç');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('installation');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('dd/MM/yyyy hhhh:mm:ss:mmmmmm');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Qxxx');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Sxxx');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Ixxx');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Exxx');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Aléatoire');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('La formule est correcte.');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Facturation avec relève');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Facturation sans relève');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Abandonnée');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Min.');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('En cours');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Terminée');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Rubriques du modèle de facture manuelle');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Nouvelle ligne');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('CAISSIER');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('PERIODE');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('TOTAL');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('DEVISE');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('DEBIT');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('-t');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Ouvrir un Fichier');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Tous les fichiers');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('client');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('contrat');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('La période doit être inférieure à12');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('inclus dans un lot');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Fichier');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Choisir un mandat');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('System');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Contextuel');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Fenêtre');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Autres');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Brio');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('BI Publisher');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('DocX Files');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('*.docx');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Fichiers');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Choisir un modèle de rapport');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('
 -usrX7/
 -srv
 -ZIV
');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Manuel');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Sequence');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('CodObs');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Curseur');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Registre');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('actif');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('inactif');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Nombre de points de livraison');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Nombre de points de comptage');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Recherche des points de comptage');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Liste des points de comptage');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Tournée
type');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Rang');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Calendrier de prélèvement');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Date de
Règlement');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Date de début
de dépôt');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Date de fin de
dépôt FRST');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Date de fin de
dépôt RCUR');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Prélèvements enregistrés');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Nombre de prélèvements');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Montant total des prélèvements');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Traitement demandé le');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Exécuter =>');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Demande de prélèvement SEPA');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Date de règlement prévu');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('&Simuler');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Date de règlement interbancaire');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Date de dépôt');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Date début');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Date fin');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Avec coordonnées bancaires');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Sans coordonnées bancaires');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Liste des clients à rembourser');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Remboursement
à effectuer');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Identifiant
client');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Identifiant
compte client');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Référence
opération');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Montant
rembousé');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Date de
remboursement');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Opération
d''origine');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Identifiant
devise');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Identifiant
banque');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Identifiant
guichet');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Numéro
compte bancaire');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Clef RIB');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Nom
compte bancaire');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Identifiant
opération');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Liste des clients à prélever');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Prélèvement
à effectuer');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Montant
prélèvement');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Date de
prélèvement');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Identifiant du recouvrement
 actuel du contrat');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Recherche des clients à prélever');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Conditions d''application des pénalités');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Performances');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Mode test de performances');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Fréquence');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Secondes');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Activer');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Autres modules');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Alertes et contrôles...');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Alertes et contrôles');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Routage des documents');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Fichiers attachés');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Taille maximale autorisée');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Ko');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Gestion des mots de passes');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Réinitialisation périodique');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Jours');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Au moins 1 lettre et 1 chiffre');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Différent du précédent');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Nombre minimal de caractères');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('En cas de recherche infructueuse');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Ne rien faire');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Passer en création (avec confirmation)');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Passer en création (automatiquement)');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Mode de fonctionnement des caisses');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Impression systématique des tickets de caisse');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Tickets de caisse Crystal Report');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Aperçu avant impression des tickets de caisse');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Transfert de fond obligatoire avant fermeture');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Transfert de fond (vers caisse) égal au montant en caisse');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Transfert de fond (vers banque) égal au montant en caisse');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Mode de gestion de caisse');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('&Ecarts sur encaissements...');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('&Mode d''accès...');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Fréquence de rafraîchissement en secondes');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Affichage');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Informations obligatoires');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('&Définition des champs...');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('&Configuration des champs...');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('&Catalogue de typologie...');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Client dépendant par défaut');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Enregistrement des factures sur le compte du client');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Couleur actuelle');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Numérotation');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Définition des &séquences...');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Ascenseur horizontal');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Autre couleur...');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Listes');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Estimation des index');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Estimation sur mois précédents');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Estimation sur mêmes mois des années précédentes');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Nombre de mois ou d''années à prendre en compte');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Nombre d''évaluations successives');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('&Tolérances sur consommation...');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Calcul et validation des factures');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Validation manuelle de la date d''exigibilité des factures');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Regroupement sur une même facture des contrats d''un même client');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Nombre de décimales pour l''arrondi des durées');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Seuil de tolérance pour le calcul des lots');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Nombre maximum de contrats en erreur');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Electricité moyenne tension');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Tangente Phi forfaitaire');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Forfait Phi primaire');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Pertes Fer');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Pertes Joules');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Saisie de masse des index');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Contrôle ligne par ligne');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Activer le bouton de contrôle');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Point de comptages inactifs');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Mode d''enregistrement de la facture d''avenant');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Facture d''avenant');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Facture d''abonnement ou de dépôt de garantie');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Mise à jour automatique des prix');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Avant');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Après');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Données Comptables');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Affectation automatique');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Remboursement automatique');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Pénalités de retard');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Site');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Délai de carence en jours');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Délai d''exigibilité des factures de pénalité en jours');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Délai de constitution des mensualisations en jours');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Prélèvement');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Format du fichier de prélèvement...');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Nombre maximum de retour d''impayés');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Nombre de présentations maximum');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Délai minimum entre deux présentations (en jours)');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Délai de transmission du support (en jours)');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Ne pas considérer les prélèvements avant le');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Date de dépot à considérer :');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Date de dépôt comptoir');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Date d''échange interbancaire');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Hiérarchie de la Société');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Nombre de niveaux (1 à 6)');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Longueur du niveau 1');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Longueur du niveau 2');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Longueur du niveau 3');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Longueur du niveau 4');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Longueur du niveau 5');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Longueur du niveau 6');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Niveau du centre opérationnel');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Découpage géographique');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Niveau de la tournée type');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Séparateur');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Adresses structurées');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Report automatique des modifications de l''adresse');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Gestion automatique des identifiants');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Ordonnancement automatique des points de comptage');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Données techniques');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Borne minimum');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Fermeture des contacts sans affaires');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Fermeture automatique des contacts');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Délai avant fermeture du contact (en jours)');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Identifiant du client');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Identifiant du contrat');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Contrôle de la clé R.I.B.');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Impression de la fiche compte client');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Etat de type QRP');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Etat de type SQT');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Visualiseur externe');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Création de contrat');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Affichage du dépôt de garantie');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Affichage du compte client');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Affichage de la date de création');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Affichage de la date de valeur');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Interface géographique');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Synchronisation...');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Interface agendas électroniques');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Microsoft Outlook');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Date par défaut du rendez-vous');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('(Nombre de jours après la date du jour)');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Heure par défaut du rendez-vous');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Interface GMAO et stocks');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Traduction');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Traduction...');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Contrôle des messages...');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Interface relève portable');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Interface trésorerie');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Fichier Fluor');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Fluor client');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Fluor titre');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Interface messagerie');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Activer la messagerie électronique');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Adresse du serveur');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Nom de l''expéditeur');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Adresse de l''expéditeur');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Relève et Facturation');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Données commerciales');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Interfaces');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Ecarts sur encaissements');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('L''écart est égal au montant à payer moins le montant payé (Ecart positif=Perte, Ecart négatif=Profit)');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Ecart borne supérieure');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Mode d''accès pour encaissement');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Contrôle des messages');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Traductions');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Recherche sensitive');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('(Pour saisir des caractères spéciaux, utilisez la touche "Ctrl". Exemple: "Ctrl"+"Entrée" pour un retours à la ligne)');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Paramétrage des soldes');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Fonction de calcul du solde');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Fonction de
calcul du solde');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Fonction de calcul du
nombre d''opérations');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Utilisé dans
compte client');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Utilisé dans
facture');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Définition des champs paramétrables');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Utilisable');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Configuration des Champs paramétrables');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Obligatoire');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Procédure de contrôle');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Fiche :');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Service :');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('&Suivant >');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('< &Précédent');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Fiche selectionnée :');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Champ dépendant :');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Tolérances sur consommation');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Moyenne jusqu''à');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Moyenne pour un mois jusqu''à');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Tolérance minimum (%)');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Tolérance maximum (%)');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Format de fichier de prélèvement');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Type de format');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Ordonnancement des points de comptage de la tournée type');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Libellé long');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Rang ds
la base');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Nombre de compteurs');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Points de comptage');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Compteurs
par jour');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Type de relève');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Agent releveur');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Agent prévu');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Premier compteur');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('&Intervention...');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('&Validation');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('&Contrôler...');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Technique
comptage');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Codeorigine interne');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Code
origine');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Code
relève');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Passage
par zéro');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Agent
releveur');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Date
relève');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Note');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Type de
cadran');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Recherche des index');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Prévu');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Exécuté');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Compteur avant');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Compteur après');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Dispositif avant');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Dispositif après');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Tournées');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Relève
prévue');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Code de
l''agent');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Nom de l''agent');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Constitution des tournées de relève');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Statut de
la tournée');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Nombre de
compteurs');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Compteurs de la tournée...');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Compteurs d''une tournée de relève');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Affectation des tournées');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Diviser');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Anuler Génération');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Relève
précédente');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Code de l''agent');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Code contrôleur');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Nom contrôleur');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Regrouper
les tournées');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Dvision d''une tournée');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Nombre de compteurs à diviser');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Cycle de
facturation');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Mode de
recouvrement');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Jour de
prélèvement');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('% de
paiement');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Nombre de mois
de régularisation');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Nombre minimum
de mensualités');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Montant minimum
des mensualités');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Montant par défaut
de la mensualisation');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Echéance
arrondie');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Montant minimum
de remboursement');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Courriel');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Code de
connexion');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Ne pas coder le mot de passe');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Structure de l''agent');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Habilitations');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Données accessibles');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Centre opérationnel...');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Code sensibilité...');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Liste des agents');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('&Habilitations...');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Habilitations du profil');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Sous-système - Traitement');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Visualisation
Accès');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Création');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Modification');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Suppression');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Codes sensibilité de l''agent');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Autorisé');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Centres opérationnels de l''agent');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Délai d''exigibilité
des factures');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Délai d''expiration
des devis');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Type/niveau');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Contacts');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Renseignement');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Dépannage');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Site web');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Horaires');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Accueil');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Accueil tél.');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Informations bancaires');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Administratif');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Type de société');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Capital');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Saisie d''index d''un compteur');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Date de relève');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Code observation 2');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Code observation 3');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Technique
de comptage');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('&Annuler Index');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('&Télérelève');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Date relève');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Facturé');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Invalidé le');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Index
facturable');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Consommation
facturable');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Pour modifier le dernier index non facturé, sélectionnez le dans l''historique ci-dessous :');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Historique des index');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Consommation moyenne');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Releveur');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Compteurs d''un point de rattachement');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Fabricant');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Entré le');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Posé le');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Déposé le');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Sorti le');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Dispositifs d''un point de rattachement');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Historique des mouvements du compteur');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Code du point
de rattachement');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Libellé du point
de rattachement
ou de comptage');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Code du motif
de mouvement');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Libellé du motif
de mouvement');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Entré/Posé le');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Sorti/Déposé le');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Transfert...');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Gen/Div...');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Rang dans la tournée');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Client souscripteur actif');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Propriétaire');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('X7 Map...');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Cartographie...');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Coord X');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Coord Y');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Locataire');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Inconnu');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Compteurs installés');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Connecté le');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Déconnecté le');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Coupé le');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Rétabli le');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Gestion des points de comptage inactifs');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Début de la dernière période de relève');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Fin de la dernière période de relève');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Section');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('mm²');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Réglage');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Enregistrement');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Historique des compteurs du point de comptage');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Compteurs d''un point de comptage');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Synchronisation des branchements SIG');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Code SIG');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Synchroniser l''adresse client');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Synchroniser l''adresse du point de comptage');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Synchroniser l''adresse du point de livraison');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Synchroniser automatiquement les correspondances 1 pour 1');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Synchronisés');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Non synchronisés');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Branchements et raccords SIG');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Branchements');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Raccords d''assainissement');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Afficher les branchements déjà synchronisés');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Synchronisé');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Numéro de
compteur');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Nombre
de roues');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Marque');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Points de comptage X7');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Afficher les points de comptage déjà synchronisés');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Date de dépose');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Date de garantie');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Date de révision');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Notes pour le releveur');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('&Saisie...');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Dispositif emetteur');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Liste des compteurs');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Recherche des compteurs');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Modification du numéro de compteur');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Création de compteur en masse');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Préfixe');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('De');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Remplissage à gauche');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Longueur de séquence');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Compléments');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Etat parcelle');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Occupé');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Vide');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Raccordé assainissement');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Matériau');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Ilot');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('District');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Réserves');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Conforme');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Enquête');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Cloturer');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('En attente');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Identifiants');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Visite en cours');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Etat de la tournée');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Déchargé le');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Date enquête');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Enquêteur');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Date contrôle');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Agent contrôle');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Date validation');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Agent qualité');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Délivré le');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Irrégularité');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Docs. remis');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Note recensement');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Anomalie 1');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Anomalie 2');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Robinet arrêt');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Emplacement');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Capacités rés.');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Nb foyers alimentés');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Nb personnes alimentées');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Alim. palia.');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Surpresseur');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Compteur présent');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Numéro de série');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Date Fabrication');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Capacité');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Classe');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Nombre de roues');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Coefficient de lecture');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Niche');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Regard');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Usage détaillé');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Point de Livraison');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Recherche des enquêtes de recensement');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Liste des enquêtes');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Etat
enquête');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Aucune intervention sélectionnée.');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('1 intervention sélectionnée.');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('interventions sélectionnées.');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Code client
souscripteur');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Date mise à jour
enquête de visite');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Adresse du point de comptage');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Numéro de compteur');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Date de validation
de visite');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Confirmer l''annulation');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Valider SANS exécuter les plans d''action');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Mis à jour le');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Liste des points de livraison');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Recherche des points de livraison');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Adresses...');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Catégorie client');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Sensibilité du client');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Motif d''extraction du contrat');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Nombre de
conducteurs');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Puissance
disponible (kW)');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Réglage du
disjoncteur (A)');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Calibre minimum
du disjoncteur (A)');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Calibre maximum
du disjoncteur (A)');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Conversion');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Type d''unité');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Consommation
calculée');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Intervention
obligatoire');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Estimation
d''index');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Estimation de
consommation');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Anomalie
relève');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Forçage');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Saisie de
Consommation');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Plan
d''action');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('&Matrice ...');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Catalogue des champs paramétrables de l''avenant au contrat');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Type de
champ');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Unité de
mesure');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Proraté');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('&Champs...');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Factures &types...');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Champs paramétrables du type de contrat');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Factures types du type de contrat');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Autorisée');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Dépôt de
garantie');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Facture
d''abonnement');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Régime
compté');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Code obs.');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Code
obs. -1');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Code obs. -1');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Code
obs. -2');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Code obs. -2');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Anomalie
de relève');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Liste des contrats de fourniture.');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Contrat fourniture');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Nombre de cadrans');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Longueur');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Monophasé');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Triphasé');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Cadran1');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Cadran2');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Cadran3');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Liste des types de compteurs');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Coefficient
de lecture');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Nombre
de cadrans');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Code observation du routage');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Type de
routage');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Type de
rejet');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Lots de routage');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Lots créés de moins d''un an');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Clôturé');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Créé
par');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Clôturé le');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Sous-lots de routage');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Sous lot');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Saisie de masse du routage');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Date de clôture');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Date prévu');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Date fin sous lot');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Référence
document');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Adresse point
de comptage');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Exécuté le');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Exécuté
par');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Nom du
receveur');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Commentaires');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Ancienne référence
du client');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Saisir code');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Saisi en masse de code observation');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Ecraser tous les codes');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Visualisation du routage');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Référence document');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Historique du routage');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Exécuté
le');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Choisir une structure à importer');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Fichiers CSV (.csv)');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Fichiers HTML (.html)');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('*.html');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('.html');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Fichiers texte (.txt)');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('*.txt');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('.txt');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Exporter');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('<LINK HREF=
 rel=
 type=
 />');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Data');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('&Edition');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('&Annuler');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Annule la dernière opération');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Co&pier');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Copie la sélection dans le presse-papiers');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Co&ller');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Insère le contenu du presse-papiers à l''endroit sélectionné');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('&Répéter');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Copie le contenu de la cellule dans les cellules vides du dessous');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Trier par ordre &croissant');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Tri la colonne par ordre croissant');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Trier par ordre &décroissant');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Tri la colonne par ordre décroissant');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('&Ajuster la colonne');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Ajuste la largeur de la colonne en fonction du texte');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Ajuster &toutes les colonnes');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Ajuste la largeur des colonnes en fonction du texte');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('&Sélectionner tout');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Supprimer');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Supprime la sélection en cours');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('&Exporter...');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('&Imprimer la liste');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('&Affichage des colonnes');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Voir requête SQL associée');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('&Couper');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Coupe la sélection et la place dans le presse-papiers');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Historique données');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Historique complet');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Calculer');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Calculer et valider');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Voir...');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Valider');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Invalider');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Facture intermédiaire...');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Facture manuelle...');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Rectification...');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('&Affectation...');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Désaffectation...');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Duplicata');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Original');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Imprimer...');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Avec saisie CRI');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Sans saisie CRI');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Changer un compteur...');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Poser un compteur...');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Déposer un compteur...');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Changer un dispositif émetteur...');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Poser un dispostif émetteur...');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Déposer un dispositif émetteur...');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Immédiatement');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('En batch');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Souscripteurs');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Destinataires');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Affaires dépendantes');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Actions dépendantes');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Opérations dépendantes');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Synthèses dépendantes');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Exécuté par');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Nom du receveur');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Nombre de documents');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Montant total des documents');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Documents enregistrés');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Liste des documents à router');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Document
à router');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Identifiant
du client');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Référence
de l''opération');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Montant
du routage');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Adresse du client');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Recherche des documents à router');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Lot de routage');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('&Constitution du lot...');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('F&in de routage');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Créé par');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Clôturé par');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Sous lot de routage');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Date
d''impression');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Nombre de
documents à traiter');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Nombre de
documents traités');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Date de
traitement prévue');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Code de
l''agent prévu');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Nom de
l''agent prévu');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Montant
à traiter');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Montant
traité');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('&Saisie de masse...');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Estimation
autorisée');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Technique');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Domicile');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Portable');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Bureau');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Mail');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Retours d''impayés');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Facture électronique');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Recouvrement');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('/ Destinataire');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Avenant le');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Dernière période facturée du');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('/ Solde exigible');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Dernière relance le');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Dernière facture');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Emise le');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Dernier paiement');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Emis le');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Branchement');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Dernier index');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Conso. moy.');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Conso.');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Contact / Affaire');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Nombre d''affaires liées au client');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Nombre d''affaires');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('/ Fin');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Liste des clients pour synthèse');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Recherche des clients pour écran de synthèse');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Action en cours');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Terminée le');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Début prévu le');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Début réel le');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Fin réelle le');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Durée prévue');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Durée réelle');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Montant relance');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('&Executer');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Suivi de l''action');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Ajouté par');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Affecté à');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Traité par');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Liste des actions');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Retard');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Recherche des actions');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Alerte');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Nom
de la table');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Nom
de la colonne');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Type de
modification');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Ancienne
valeur');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Nouvelle
 valeur');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Le');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Machine');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Utilisateur
windows');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Filtres des traces');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Paramétrage des traces des tables');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Masquer les tables non utilisées');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Masquer les tables utilisées');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Propriétaires');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('souscripteurs');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('destinataires');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Recensement dépendants');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Fe&nêtre');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Réorganise les fenêtres ou active les fenêtres spécifiées');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Mode &fiche');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Affiche le document courant sous forme de fiche');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Mode &liste');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Affiche le document courant sous forme de liste');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Arrange les documents ouverts en mosaïque verticale');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Arrange les documents ouverts en mosaïque horizontale');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('&Cascade');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Arrange les documents ouverts en cascade');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('&Ranger les icônes');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Arrange les documents minimisés');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('&A propos de...');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Affiche des informations sur le produit X7');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Dernières demandes');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Lot');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Constitution...');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Affectation...');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Lancer la relève');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Estimer');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Saisie des index...');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Décharger');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Lancer le recensement');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Anomalies de relève');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Suivi de la relève');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Entités');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Propriétés');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Conditions');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Valeur1');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Valeur2');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Filtre');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Défaut');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Privé');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Effacer');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Code');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Libellé abrégé');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('&Nouveau');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('&Supprimer');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Aide');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Paramétrage des traces des colonnes');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Observations');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Date installation pile');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Durée de la pile (années)');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Mouvements...');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Créer en masse');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Modification du numéro de dispositif');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Création de dispositif en masse');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Historique des mouvements du dispositif');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Libellé du point
de rattachement
ou numéro
de compteur');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Historique des dispositifs sur le compteur');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Evènements');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Evènement');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Date de Fin');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Liste des évènements');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Détail de FAQ');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Réponse');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Liste de FAQ');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Foire aux questions');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Référence de l''appel');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Détail de l''appel');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Date appel');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Nombre d''appels');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Créer contact');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Identifiant de l''enregistrement');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Référence enregistrement');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Durée de l''appel (min)');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Ecouter');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Champs additionnels');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Liste des appels');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Référence appel');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Recherche des appels');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Poste');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Administration FAQ');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Code
intervention');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Code
simulation');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Etat de l''intervention');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Agent
prévu');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Sélectionner tout');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Sélectionner aucun');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Affecter à:');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Etat de
l''intervention');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Importer');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Filtre des interventions en attente');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Filtre des interventions en traitement');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Erreur de traitement de l''intervention');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Code
erreur');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Historique des interventions traitées');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Point de
livraison');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Code
compteur avant');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Code
compteur après');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Date
exécution');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Mode de
coupure');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Motif
d''intervention');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Usage du
compteur après');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Index après');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Code
observation avant');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Index
forcé avant');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Index
compteur après');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Code
observation après');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Index
forcé après');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Etat XML');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Code erreur');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Code PPC');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Date
d''export');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Date
historisation');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Agent de traitement');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Société');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Téléphone domicile');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Fax');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Mel');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Tiers liés au client');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Tiers liés au point de comptage');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Tier');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Tiers liés');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Tiers liés au contrat');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Ajout');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Export fichier');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Structure XML');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Source');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Type sortie');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Associé à');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Jeu de caractères');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Caractère enfermant');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Séparateur décimal');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Séparateur de milliers');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Symbole monétaire');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Inclure en-tête');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Longeur fixe');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Exporter champs');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Import.');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Export.');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Suppr.');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Données à extraire');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Données Cachées');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Type
de
données');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Type donnée Src');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Masque');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Type d''élément');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Alignement
à
droite');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Caratère
de
remplissage');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Donnée');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Ordre');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Conditions de sélection des lignes de la table du modèle');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Sélection du modèle');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Nom de fichier');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Sélection de la table');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Questionnaire');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('&Fermer');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('&Enregistrer');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('&Rétablir');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('&Modifier');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Intervention =>');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Informations complémentaires');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Actuel');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Inférieur');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Terminer');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Suivant >');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('< Précédent');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('&Notes...');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('&Information...');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('&Fichier...');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Calendrier');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Ligne');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Objet');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Lancement des Batchs');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Identifiant');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Nom du Batch');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Libellé court');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Chemin du rapport');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Aperçu avant impression...');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Impression différée...');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Entité d''origine');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Code de typologie');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Lote');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Adresse structurée');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Adresse libre');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Utiliser l''adresse libre');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Code ville');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Localité');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Ajouter avant');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Ajouter après');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Note...');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Créée le');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Simulation');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Motif de fin');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Simulation...');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('&Détail...');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Par');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Abandonner');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Etape');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Durée
prévue');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Début
prévu le');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Début
réel le');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Fin
réelle le');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Durée
réelle');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Statut');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Affecté
à');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Traité
par');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Point
de Livraison');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Point de
comptage');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Compte
 client');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Montant
relancé');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Type
d''opération');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Action
ajoutée');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Processus
lié');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('&Exécuter...');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Ajouter =>');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('&Ignorer');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('&Voir...');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('&Action...');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Sélection d''un compteur');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Adresse géographique...');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Sélection d''un point de comptage');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Sélection d''un point de livraison');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Liste des opérations du compte client');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Liste des contacts');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Interne');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Externe');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Client/Contact');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Enregistré le');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Origine');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Motif de
contact');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Nom Prénom');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Téléphone');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Détail');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Client concerné');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Fourniture');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Téléphone du domicile');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Téléphone du bureau');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Qualité payeur');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Suivi du contact');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Agent d''accueil');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Agent de suivi');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Fiche');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Total des actions/étapes');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('jours');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('heures');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('minutes');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('&Conditions...');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Etapes du plan d''actions');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Délai');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('N&ouveau');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('S&upprimer');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Con&ditions...');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Actions de l''étape');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Utilisé');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Condition d''application du plan');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Conditions d''application de l''étape');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('CodValRep');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('fonction de control');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Signature');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Annuler la facture SANS désempilage');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Les index et consommations associés resteront marqués comme facturés, la dernière période de facturation restera inchangée.');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Format');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Tout');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Inclure les en-têtes de colonnes');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Inclure un titre');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Presse papier');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Parcourir...');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Sélection des colonnes');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Id colonne');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Aucune');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Libellé interne');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Activée');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Code de connexion');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Nouveau mot de passe');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Confirmer mot de passe');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Type de diamètre');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Liste de contact du client');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Type de Contact');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Plan Action');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Liste des affaires du contact');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Evénements');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Recherche des évènements');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Actions par jour');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Durée');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Automatique');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Utilisée');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Avancement automatique');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Code origine par défaut');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Processus lié');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Protégée');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Auto.');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Durée (min.)');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Code origine défaut');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Mode de coupure par service');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Protégé');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Agence en
ligne');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Motif ...');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Motif de contact');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Contacts
par jour');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Recherche des affaires');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Recherche des contacts');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Visualisation de facture/devis');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Période du');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('au');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Emission');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Agent émetteur');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('&Routage...');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('&Facture intermédiaire...');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('&Soldes...');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('&Annulation...');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Annulée');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('le');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('par');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('&Voir');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Rubriques');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Base de calcul');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Commentaire');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Quantité');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Unité');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Prix unitaire');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Montant HT');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('&Index...');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Dé&tails de ligne...');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Imprimer =>');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('&Modifier...');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Conditions de sélection des factures');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Cycle');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Montant TTC');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Nouvel index');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Nouvel
index');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Ancien
index');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Coefficient');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Consommation');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Estimé');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Code
obs.');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Code
obs. 2');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Code
obs. 3');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Code
anomalie');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('&Historique...');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('&Graphe des consommations facturées...');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Historique des consommations facturées par période');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Détail de la ligne de facture');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Soldes de la facture');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Nombre d''opérations');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Charges additionnelles à facturer');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Identifiant interne du mouvement');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Période de
facturation');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Année de
facturation');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Forcer');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Montant
HT');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Code de
la taxe');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Montant
TTC');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Arrondi');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Modèle système');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Dépôt de garantie');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Facture d''abonnement');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Régime compté');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Rubrique...');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Monnaie locale');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Devise de référence');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Rubriques de la facture type');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Date de création');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('&Historique');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Rang d''
édition');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Rang de
calcul');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Quantité
par défaut');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Code
de la taxe');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Date de début
de validité');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Date de fin
de validité');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Quantités');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Impression
détail de ligne');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Visualisation
détail de ligne');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('&Rubriques...');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('&Périodes...');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Modifier l''ordre');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Rang d''édition');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Rang de calcul');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Mo&difier');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Périodes d''application de la rubrique');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Rubrique appliquée');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Période
1');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Période
2');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Période
3');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Période
4');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Période
5');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Période
6');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Période
7');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Période
8');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Période
9');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Période
10');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Période
11');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Période
12');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Périodes de facturation');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Conditions d''application de la rubrique');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Rubrique de la facture type');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Affectation du type de Rubrique');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Types de rubrique sélectionnés');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Facture type comptée');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Facture =>');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Relève
seule');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Compteur
inactif');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Frm');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Calendrier...');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Définition du calendrier du lot');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Jour planifié');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Mois planifié');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Date planifiée');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Année');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Traité');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Non traité');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Tous');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Aucun');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Constituer');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('A
constituer');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Lot
type');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Libellé
lot type');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Planifié
le');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Date
prévue');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Avec
relève');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Fil de
l''eau');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Type de
condition');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Compteurs
inactifs');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('TypCal');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Conditions de sélection des contrats');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('&Tâches...');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Tâches du modèle de lot');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Traitement');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Validité');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Lignes du message');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Identifiant caché');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Condition d''application du message');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Messages appliqués');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Date de résiliation');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Modèle');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Titre');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Agent de création');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Date de validité');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Approuver');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('&Appliquer');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Date
de début');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Date
de fin');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Montants HT / Taxe / Total');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Approuver le devis');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Taux de
conversion');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Monnaie
locale');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Rendu
Monnaie autorisé');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Devise de
référence');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Arrondi
Monnaie');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Historique...');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Historique de la devise');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Fluide');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Coupure
Autorisée');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Validation de la date d''exigibilité');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Application de la rubrique');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Appliquer sur rubrique');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Rubrique de pénalité associée');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Prix');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Application du prix');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Type de tranche');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('&Prix...');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Liste des rubriques');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Base de
calcul');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Type de
rubrique');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Application
de la rubrique');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Application
du prix');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Appliquer
sur rubrique');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Unité de
Quantité');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Initialiser les prix au');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('&Initialiser');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Date de changement ou de fin de validité d''un prix');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Pourcentage');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Changement de prix');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Fin de validité');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Conditions...');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Indices');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Début
de validité');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Dernière
mise à jour');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Variable indice
de référence');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Variable indice');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Valeur
indice');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Historique des indices');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Mise à jour
de validité');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Système');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Description des variables');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Formule');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('P0= Prix de référence');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Indices...');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Liste des formules de révision');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Tranche de prix');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Nouveau &prix');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('C&hangement de prix');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Fin de &validité');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('toto');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Tranche');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Nouvelle &tranche');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('&Supprimer tranche');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Conditions d''application du prix');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Nbre de
Périodes');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Nbre d''années
de décalage');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Périodes...');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Périodes du cycle de facturation');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Code / Libellé');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Code période');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Jour de début');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Mois de début');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Date de Début');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Début du cycle');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Périodes existantes / demandées');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Prix...');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Prix du tarif');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Code
rubrique');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Libellé abrégé
rubrique');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Libellé abrégé
du prix');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Début de
validité');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Taux');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('&Taux...');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Taux de la taxe');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Fin de
validité');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Date début
de validité');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Suivi des lots');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Lot de facturation');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Lot en cours uniquement');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Type de
regroupement');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('En
cours');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('En
erreur');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Avancement');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Compteurs
Inactifs');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('&Lot type...');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Tournée =>');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('&Modèle de lot...');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Tâches du lot');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Tâche');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Prévue le');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Traitée le');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Nombre de contrats');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Demandée le');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('&Constituer');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Relève =>');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Mensualisation =>');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Facturation =>');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Abandon =>');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Edition =>');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Recherche des lots de facturation');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Recherche des lots de recensement');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Plannification du lot');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Date de démarrage');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Lot de recensement');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Numéro
de visite');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Nombre
d''enquêtes');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Tâche
en cours');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Date de
mise à jour');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Détail...');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Recensement =>');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Factures du lot de facturation');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Créé le');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Période de facturation');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('&Extraire...');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Facture manuelle
utilisateur');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Préfixe du
numéro de facture');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Numérotation
automatique');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Identifiant
de séquence');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Longueur de
la séquence');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Caractère de
remplissage');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Titre de
la facture');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Type rubrique...');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('1 - Sélectionner client');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('2 - Sélectionner crédits à affecter');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('3- Sélectionner débit non soldé');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Montant à affecter');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Montant affecté');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Solde à affecter');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('4 - &Affecter le crédit à la ligne de débit sélectionnée');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('&Remise à zéro');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Nom - Prénom');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Opération à désaffecter');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Opération correspondante');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Solde après
désaffection');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Clients ayant un crédit non affecté');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Civilité');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Nombre de clients à couper');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Nombre de points de livraison à couper');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Nombre de points de comptage à couper');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Solde exigible associé');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('&Simuler...');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('&Lister...');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('&Etapes...');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Recherche des points de comptage à couper');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Liste des points de comptage à couper');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('&Point de comptage sélectionné');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Date de dernière relance');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Code sensibilité');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Echéancier en cours');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('&Trésorerie...');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('&Graphe');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Opérations');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Avec affectation');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Soldée');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Non soldée');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('&Echéancier...');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('&Régularisation =>');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Pénalités =>');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Exigibilité');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Valeur');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Début période fac');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Fin période fac');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Sld');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Début période fac.');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Fin période fac.');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Code obs. du routage');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Non Affecté');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Liste des comptes client');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Recherche des comptes client');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Détail d''un règlement');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Mouvement');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Ticket');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Chèque');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Code banque');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Code guichet');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Tireur');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Complément');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Motif d''annulation');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Soldes');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Solde actuel');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Nombre d''opérations
actuel');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Solde
 au 10/01/00');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Nombre d''opérations
au');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Nombre d''échéance');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Périodicité');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Date de première échéance');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Date seconde échéance');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Montant de la première échéance');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Montant des échéances');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('&Calculer');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Débits');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Soldées par l''échéancier');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Montant dans
l''échéancier');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Identifiant
de la devise');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Date de
conversion');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Sé&lectionner');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('&Toutes');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('&Aucune');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('&Détail');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Modifié');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Numéro Chèque');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Code Banque');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Code Guichet');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Modifier');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Modification d''échéancier');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Echéance');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Nombre d''échéances');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Montant 1 er échéance');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('N° Ech');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('MontantSV');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Date éxigible');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Montant total saisi');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Solde à répartir');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Réinitialiser');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Détail rubrique');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Selecttionner');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Consultation d''un échéancier');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('0 note...');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Factures soldées par l''échéancier');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Solde avant échéancier');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Paiement');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Impayé');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Motif');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Règlement');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Nombre de clients destinataires');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Recherche des clients destinataires');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Liste des clients destinataires');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Client
sélectionné');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('E-Mail');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Parcourir');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Texte');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Fichier joint');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Numéro de mensualisation');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Type de mensualisation');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Statut de la mensualisation');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Nombre de mensualités');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Créé le / Modifiée le / par');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Montant total initial');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Date de la première mensualité');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Montant total des mensualités');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Date d''impression');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('&Valider');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Code Contrat');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Mensualités');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Sens');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Affecter');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Affecté');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Tous Affecter');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Tous Desaffecter');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Transfert de règlement');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Code et nom');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Liste des opérations');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Recherche des opérations');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Préfixe de la référence');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Mode d''imputation');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Type de routage par défaut');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Type d''opération annulée');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Identifiant séquence');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Longueur séquence');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Caractère de remplissage');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Donnée protégée');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Affichée');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Utilisable en saisie directe dans compte client');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Utilisable en gestion des écarts sur encaissement');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Représentation interne');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Représentation externe');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Liste des types d''opération');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Uitlisé');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Affichage D/C');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Prfx');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Financière');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Impacte le solde du client');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Format du fichier de
prélèvement export');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Format du fichier de
prélèvement import');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('&Guichets...');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Guichets de la banque');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Périodicité d''échéance');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Affectation
autorisée');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Transfert de Règlement');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Mode de réglement');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Montant transféré');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Montant du transfert');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('&Sélectionner');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Nouvelle situation');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Nombre de clients à relancer');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Recherche des clients à relancer');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Téléphone portable');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Messagerie électronique');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Caractéristiques');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('catégorie');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Souscripteur');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Multi-Devises');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Client regroupé');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Destinataire');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Interdit bancaire');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Nombre de retours d''impayés');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Domiciliation bancaire');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Mode de règlement habituel');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Ancienne référence');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Liste des clients');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Recherche des clients');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Historique des consommations...');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Historique des facturations...');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Créer un avenant avec facturation');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Créer un avenant sans facturation');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Annuler l''avenant');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Résilier avec facture');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Résilier sans facture');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Annuler la résiliation');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Muter');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Extraire');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Puissance souscrite
(heures de pointe)');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Puissance souscrite
(heures pleines, creuses)');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Souscrit le');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Résilié le');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Date de dernière facture');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Début de la dernière période facturée');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Fin de la dernière période facturée');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Graphe =>');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Contrat =>');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Domiciliation bancaire...');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Mandat...');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('&Mensualisation...');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Avenant');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Valide au');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Exonéré de TVA');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Coefficient multiplicateur');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Eau');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Liste des contrats');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Exonéré
de TVA');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Recherche des contrats de fourniture');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Liste des contrats de fourniture');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Lot facturation');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Centre opérationel');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Souscri le');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Saisie directe 0/1');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Informations génériques');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Révision des prix');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Cycle de facturations');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Modifier destinataire');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Formule de révision');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Périodicité d''actualisation (mois)');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Dernière actualisation');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Prochaine actualisation');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Liste des contrats du groupement');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Code contrat');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Historique du contrat de fourniture');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Date d''entrée');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Date de sortie');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Mandat');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Modèle associé');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Ouvrir...');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Date de souscription');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Raison');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Verrou');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Attente banque');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Type de paiement');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Date
Mise à jour');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Date
impression');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Date
souscription');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Date
résiliation');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Type de
paiement');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Nom fichier');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Date
création');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Taille');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Créer mandat');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Créer');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Sup. erreur');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Historique des avenants au contrat');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Exonéré TVA');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Date de mise à jour');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Liste des avenants au contrat');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Recherche des contrats');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Historique des facturations par période');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Affichage des colonnes');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Valeur par défaut');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Table');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Libellé de colonne');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Sélection');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Tri');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Titre de colonne');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Date d''encaissement');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Seuil de Fond de caisse');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Fond de caisse');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Mini');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Maxi');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Moyenne');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Performance');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Nombre');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Agent(s)');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Ouverte le');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Total');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Cumul');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Critères de sélection');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Devises');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Modes de Règlement');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Appliquer');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('N° ticket');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Annulé le');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Mode de
règlement');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Montants
encaissés / transférés');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Montant
en Caisse');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Code
Client');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Code
Banque');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Code
Guichet');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Numéro
Chèque');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Numéro
Compte');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Consignation');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Référence additionnelle');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Ligne de paiement de consignation');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Référence additionnelle ligne de consignation');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('&Rechercher...');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Recherche des mouvements de caisse');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Caissier connecté');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Dernier mouvement le');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Seuils de caisse');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Transfert vers &Caisse');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Transfert vers &Banque');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Transfert depuis Banque');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Brouillard');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Dernier ticket');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('O&uvrir');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('&Verrouiller...');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('&Encaisser...');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Transférer =>');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Contrôler =>');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Montant en caisse par devise');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Répartition par mode de règlement');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Montant en devise');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Numéro de chèque');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Numéro de compte');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Montant encaissé');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Montant en caisse');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Ecart');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Régularisé');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Transfert de caisse à banque');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Verrouillée le');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Code confidentiel');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Accès');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Solde pénalités');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('pénalités =>');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Exigible au');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('&Sélection');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Divers');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Montant de l''avance');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Payé en');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Nature');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Montant total affecté');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('A payer');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Payé');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Confirmation d''encaissement');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Montant à payer');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Montant à rendre');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Liste des caisses');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Supervision');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Code de l''utilisateur');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Confirmation du mot de passe');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Saisie de la période de traitement');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Transfert de banque à caisse');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Montant en caisse par Fond de caisse');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('&Mode de règlement...');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Devises autorisées');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Caisse ouverte');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Impression des tickets');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Caisse principale');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Agent habituel');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Temps réel');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Etat');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Active');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Inactive');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Localisation');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Ecran');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Modes de règlement de la caisse');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Mode de règlement de la caisse');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Nature de mouvement de caisse');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Type de mouvement de caisse');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Impression
des tickets');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Domiciliation
bancaire');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Retour
d''impayé');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Visible
en caisse');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Calcul
de frais');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Groupement');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Identifiant
du rapport');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Identifiant
type');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Type de
rapport');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Imprimable en
 différé');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Identifiant
Fenêtre');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Fenêtre rattachée');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Nom du fichier');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Identifiant
type de fichier');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Type de
fichier');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Aperçu avant
impression');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Libellé
1er paramètre');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Libellé
2ème paramètre');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Libellé
3ème paramètre');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Libellé
4ème paramètre');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Libellé
5ème paramètre');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Modèle
de rapport');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Publipostage');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Chemin de sortie');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Type de
sortie');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Eléments constitutifs');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Modele d''export');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Disponibilité');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Liste des modèles');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Liste des rapports de publipostage');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Nom du rapport');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Type de rapport');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Imprimable en différé');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Catalogue de typologie des champs paramétrables');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Propriétaire du compte');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Clé RIB');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Liste des filtres');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Trésorerie');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Role');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Majorations et frais');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Total à payer');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Numéro d''ordre');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Saisie manuelle');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Séquence');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Séquence absolue');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Date prévue');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Date de demande');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Date de réalisation');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Mode de déclenchement');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Adresse de l''imprimante');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Recherche des tâches');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Gestion des compteurs généraux / divisionnaires');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Afficher les divisionnaires');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Point de comptage
généreaux / divisionnaires');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Pts Comptage');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Type Contrat caché');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Type Contrat');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Points de comptage normaux');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Points de comptage attachés au général');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Général');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Index Nor');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Abandon');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Exécutée le');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Avant intervention');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Réglage du disjoncteur');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Calibre');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Après intervention');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Date de fabrication');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Type de compteur à facturer');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Date d''étalonnage');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Date d''agrément');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Commercial');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Liste des interventions');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Editée le');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Produire un devis');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Produire une facture');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('&Annuler CRI...');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('&Arrêter');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Date de pose');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('&Type...');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Dispositif');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Conducteur');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Monophasé (2 fils)');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Triphasé (4 fils)');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Disjoncteur');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Création de l''intervention dans Outlook');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Vous allez créer un rendez vous dans Outlook.');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Sélection du calendrier d''intervention :');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Recherche des interventions');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Impression immédiate');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Choisissez le type d''impression.');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Code géographique');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Type
d''information');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Type
de période');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Date de
fin');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Descriptif');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Recherche des informations techniques');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Saisie de la période d''extraction');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Code du journal');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Libellé long du type de journal');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Numéro de rôle');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Imprimable');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Extractible');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('E&xtraire');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('I&mprimer');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Affectation du type d''opération');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Types d''opération sélectionnés');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Priorité');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Nature de règlement affecté');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Type de facture affecté');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Affectation
manuelle');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Affectation
automatique');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Définition des séquences');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Identifiant de
la séquence');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Valeur de la
séquence');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('A Propos de...');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Connexion');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Base de données');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Notes');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Documents attachés');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Clause "From" de la liste associée et du filtre modifié');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('&Réinitialier');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('&Tester...');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Nombre de clients à contacter');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Recherche des clients à contacter');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Liste des clients à contacter');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Centre
Opérationel');
COMMIT;


EXEC X7.TRADUCTION.Alim_Brut_Produit;

EXEC X7.TRADUCTION.Insertion_DicMsgX7Def ;
update dicwiz set utl = 1;
EXEC X7.TRADUCTION.Maj_Donnees_Avec_Clef;
EXEC X7.TRADUCTION.Nouvelle_Chaines_a_traduire;
EXEC X7.TRADUCTION.Chaines_non_utilisees_dans_x7;

EXEC X7.TRADUCTION.Completer_Anglais;

commit;

spool off
