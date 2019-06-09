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
   ('Nombre de tourn�es');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Num�ro de lot');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('P�riode');
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
   ('Relev�');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Date d''�dition');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Rel�ve');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Date de d�but');
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
   ('Etape num�ro');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Code retour');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Date d''ex�cution');
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
   ('Num�ro de caisse');
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
   ('Usage d�taill� du client');
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
   ('Solde d�but de journ�e :');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Solde fin de journ�e :');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('R�capitulatif des encaissements');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Points de comptage � couper');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Point de comptage');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('N� client');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Nom et pr�nom du client');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Total des points de comptage � couper');
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
   ('Extraction du contrat N�');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('du lot de facturation N�');
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
   ('Num�ro de tourn�e');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('P�riode concern�e');
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
   ('Liste de contr�le');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Erreur syst�me');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('(Aucun)');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('(Plus d''�l�ments...)');
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
   ('Crit�res de s�lection de la liste');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Page');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('R�parties');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Regroup�es');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Avance');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Echu sur date de rel�ve');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Echu sur date th�orique');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Ouverture de caisse');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('R�-ouverture de caisse');
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
   ('D�verrouillage de caisse');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Encaissement');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Transfert de caisse � caisse');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Contr�le de caisse');
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
   ('For�age de fermeture de caisse');
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
   ('Tous les modes de r�glement');
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
   ('Ech�ancier');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Op�ration');
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
   ('Type de p�riode');
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
   ('Motif de retour d''impay�');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Anomalie');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Document identit�');
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
   ('Capacit� (Quantit� nominale)');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Etat du recensement');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Nature de r�glement');
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
   ('Priorit� de l''appel');
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
   ('Affiche les donn�es de l''enregistrement pr�c�dent');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Affiche les donn�es de l''enregistrement suivant');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('En cours de cr�ation d''avenant');
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
   ('N''est pas renseign�');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Est renseign�');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Sup�rieur ou �gal �');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Sup�rieur �');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Inf�rieur ou �gal �');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Inf�rieur �');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Diff�rent de');
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
   ('Egal �');
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
   ('Num�ro');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Nom');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Pr�nom');
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
   ('R�f�rence');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Exigible');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('D�bit');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Cr�dit');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Solde');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Non affect�');
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
   ('Cr�� le / par');
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
   ('Liste r�pondant aux conditions de recherche');
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
   ('D�but');
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
   ('Propri�t�');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Entit�');
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
   ('N� Etape');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Auto');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Libell�');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Niveau');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Liste des clients � relancer');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Solde exigible');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Derni�re relance');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Nombre de contrats � relancer');
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
   ('Modes de r�glement');
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
   ('r�glement');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Montants');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Encaiss�s/transf�r�s');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('en caisse');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Suivi du carnet de rel�ve');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Tourn�e');
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
   ('Contrats de fourniture d�pendants');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('nGNumberTmp1 :');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Recensements d�pendants');
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
   ('� enregistrement affich� en');
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
   ('Num�rique');
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
   ('D�passement de capacit� de combobox :');
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
   ('La cl� est incorrecte.');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('La cl� ne correspond pas au programme X7.exe.');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Pas assez d''espace disque pour cr�er le fichier de protection.');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('L''ex�cution du programme n�cessite une licence r�seau.');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Erreur du syst�me d''exploitation.');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Les librairies crp95*.dll sont introuvables.');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Ce programme ne peut �tre lanc� � partir d''une disquette.');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Le fichier de protection est inaccessible.');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Le programme n''est pas autoris�.');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Le programme � �t� d�plac� ou le mot de passe est incorrect.');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Le fichier de protection est endommag�.');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('La date et/ou l''heure ont �t� modifi�es.');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('La licence a expir� : date d''utilisation d�pass�e.');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('La licence a expir� : nombre maximum d''ex�cutions atteint.');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Le fichier de restriction (.rst) a �t� effac�.');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Le fichier de restriction (.rst) est endommag�.');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Le fichier de restriction (.rst) a �t� d�plac� ou �cras�.');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('La cl� a �t� r�utilis�e.');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('La table des utilsateurs est illisible.');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Le nombre maximum d''utilisateurs connect�s � �t� atteint.');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Vous n''�tes pas autoris� � lancer le programme en tant que serveur.');
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
   ('Avant pliage / d�pliage d''un niveau');
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
   ('Aper�u avant impression - [ {P0} ]');
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
   ('R�tablir');
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
   ('Gestion des t�ches');
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
   ('Param�tres des traces');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Th�me');
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
   ('Window D�faut');
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
   ('Pr�c�dent');
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
   ('Informations li�es');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Clients d�pendants');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Contrats d�pendants');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Contrats d�pendants (client souscripteur)');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Contrats d�pendants (client destinataire)');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Points de livraison d�pendants');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Points de comptage d�pendants');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Compteurs d�pendants');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Contacts d�pendants');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Affaires en cours d�pendantes');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Interventions d�pendantes');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Comptes client d�pendants');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Recherche directe');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Remettre � z�ro les crit�res de recherche');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Rechercher');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Liste compl�te');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Donn�es');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Point de livraison');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Synth�se');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Centre op�rationnel');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Structure du distributeur');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Adresse g�ographique');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Information technique');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Gestion des compteurs g�n�raux et divisionnaires');
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
   ('Param�tres client');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Qualit�');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Cat�gorie');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Sensibilit�');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Param�tres contrat');
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
   ('Catalogue des champs param�trables');
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
   ('Param�tres techniques');
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
   ('Diam�tre');
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
   ('Unit� de mesure');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Rattachement');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Dispositif �metteur');
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
   ('Param�tres structure');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Param�tres de l''adresse structur�e');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Param�tres g�n�raux');
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
   ('Param�tres');
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
   ('Tourn�e de rel�ve');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Tourn�e type');
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
   ('Code rel�ve');
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
   ('Matrice de d�cision');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Planification de la rel�ve seule');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Suivi de la rel�ve seule');
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
   ('Facture interm�diaire');
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
   ('R�gles de facturation');
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
   ('Mod�le de facture manuelle');
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
   ('Formule de r�vision des prix');
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
   ('Mod�le de lot');
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
   ('Op�ration sur caisse');
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
   ('For�age de la fermeture');
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
   ('Mode de r�glement');
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
   ('Demande de pr�l�vement');
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
   ('R�gularisation');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Saisie d''une op�ration');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Transfert de r�glement');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Affectation');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('D�saffectation');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Retour d''impay�');
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
   ('Type d''op�ration');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Nature d''op�ration');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Situation');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('P�riodicit� des �ch�ances');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Banque');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Calendrier de pr�l�vement');
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
   ('D�finition des groupements');
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
   ('D�finition d''un rapport de publipostage');
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
   ('Tourn�e de recensement');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Document d''identit�');
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
   ('Priorit�s');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Gestion des interventions');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Interventions � traiter');
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
   ('Informations syst�me');
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
   ('Localit�/code postal');
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
   ('Rel�ve seule');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('LireTaux');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Date d''exigibilit�');
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
   ('Facture d''annulation avec d�sempilage');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Facture d''annulation SANS d�sempilage');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Facture annul�e avec d�sempilage');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Facture annul�e SANS d�sempilage');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Facture rectifi�e');
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
   ('Nombre d''op�rations au');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Idc');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Le nom de variable doit �tre diff�rent du nom de variable de r�f�rence.');
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
   ('Lot de rel�ve');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('La clause whr du LOTFAC');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Nombre d''enqu�tes');
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
   ('Op�ration d''annulation');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Re�u de');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Transf�r� vers');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('{P0} op�rations vont �tre modifi�s. Confirmez-vous ?');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('{P0} op�ration va �tre modifi�. Confirmez-vous ?');
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
   ('Le montant pay� n''est pas �gal � la somme des montants aff�ct�s + le montant rendu/avance + frais.');
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
   ('connect� �');
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
   ('Entr�e dans ImpRptC');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Impression diff�r�e');
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
   ('Apr�s pliage / d�pliage d''un niveau');
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
   ('Ce code d''estimation ne peut pas �tre saisi manuellement, il doit �tre d�clench� par un code d''observation.');
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
   ('sur factures les plus r�centes');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('sur factures les plus anciennes');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Ce num�ro doit �tre compris entre 1 et 4.');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Ce num�ro doit �tre compris entre 1 et 6.');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Le niveau du centre op�rationnel doit �tre compris entre 1 et');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Les �carts doivent �tre rentr�s par ordre croissant.');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Le montant maximum doit �tre � vide sur la derni�re ligne.');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Il est obligatoire de d�finir une borne �gale � 0.');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Entr�e');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Configuration des champs param�trables - Choix de la fiche');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Configuration des champs param�trables - Choix du champ d�pendant');
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
   ('Positionnement par d�faut');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Positionnement initial � gauche');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Positionnement initial � droite');
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
   ('Compl�ment de requ�te g�n�r� par le filtre');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Compl�ment de requ�te modifi�');
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
   ('F�vrier');
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
   ('Ao�t');
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
   ('D�cembre');
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
   ('connect�');
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
   ('Passe en mode cr�ation sur le document actif');
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
   ('D�but de p�riode');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Fin de p�riode');
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
   ('Ech�ances');
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
   ('R�glements');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Relev� de compte');
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
   ('Liste de toutes les op�rations');
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
   ('Compt�');
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
   ('Exc�dent');
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
   ('Ferm�e');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Verouill�e');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Lecture de la table :');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Mise � jour des lignes de la table :');
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
   ('�');
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
   ('N� de caisse');
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
   ('Total encaiss�');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Montant pay�');
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
   ('Caisse �mettrice');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Caisse R�ceptrice');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Total contr�le');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Agent contr�leur');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Total r�gularisation');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Cr�e un nouvel enregistrement');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Enregistre les donn�es du document actif');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Imprime les donn�es du document actif');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Imprimer en masse');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Imprime les donn�es des �l�ments r�sultant de la recherche');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Aper�u avant impression');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Visualisation du document actif avant impression');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Afficher pr�c�dent');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Afficher suivant');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Afficher liste compl�te');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Affiche la totalit� des enregistrements dans la liste');
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
   ('Enregistre les donn�es du document actif en masse');
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
   ('Remet � z�ro les crit�res de recherche sur le document actif');
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
   ('Navigation sur les erreurs - F7 : erreur pr�c�dente - F8 : erreur suivante');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Normal');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('En cours de cr�ation');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('En cours de r�siliation');
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
   ('En cours de facturation p�riodique');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('En cours de facturation p�riodique avec un lot en rel�ve seule');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('En recensement lot n�:');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Recens�');
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
   ('Mise � jour X7');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('�');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('�');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('�');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('�');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('�');
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
   ('Al�atoire');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('La formule est correcte.');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Facturation avec rel�ve');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Facturation sans rel�ve');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Abandonn�e');
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
   ('Termin�e');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Rubriques du mod�le de facture manuelle');
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
   ('La p�riode doit �tre inf�rieure �12');
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
   ('Fen�tre');
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
   ('Choisir un mod�le de rapport');
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
   ('Tourn�e
type');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Rang');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Calendrier de pr�l�vement');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Date de
R�glement');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Date de d�but
de d�p�t');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Date de fin de
d�p�t FRST');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Date de fin de
d�p�t RCUR');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Pr�l�vements enregistr�s');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Nombre de pr�l�vements');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Montant total des pr�l�vements');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Traitement demand� le');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Ex�cuter =>');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Demande de pr�l�vement SEPA');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Date de r�glement pr�vu');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('&Simuler');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Date de r�glement interbancaire');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Date de d�p�t');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Date d�but');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Date fin');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Avec coordonn�es bancaires');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Sans coordonn�es bancaires');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Liste des clients � rembourser');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Remboursement
� effectuer');
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
   ('R�f�rence
op�ration');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Montant
rembous�');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Date de
remboursement');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Op�ration
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
   ('Num�ro
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
op�ration');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Liste des clients � pr�lever');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Pr�l�vement
� effectuer');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Montant
pr�l�vement');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Date de
pr�l�vement');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Identifiant du recouvrement
 actuel du contrat');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Recherche des clients � pr�lever');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Conditions d''application des p�nalit�s');
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
   ('Fr�quence');
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
   ('Alertes et contr�les...');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Alertes et contr�les');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Routage des documents');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Fichiers attach�s');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Taille maximale autoris�e');
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
   ('R�initialisation p�riodique');
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
   ('Diff�rent du pr�c�dent');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Nombre minimal de caract�res');
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
   ('Passer en cr�ation (avec confirmation)');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Passer en cr�ation (automatiquement)');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Mode de fonctionnement des caisses');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Impression syst�matique des tickets de caisse');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Tickets de caisse Crystal Report');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Aper�u avant impression des tickets de caisse');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Transfert de fond obligatoire avant fermeture');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Transfert de fond (vers caisse) �gal au montant en caisse');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Transfert de fond (vers banque) �gal au montant en caisse');
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
   ('&Mode d''acc�s...');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Fr�quence de rafra�chissement en secondes');
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
   ('&D�finition des champs...');
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
   ('Client d�pendant par d�faut');
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
   ('Num�rotation');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('D�finition des &s�quences...');
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
   ('Estimation sur mois pr�c�dents');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Estimation sur m�mes mois des ann�es pr�c�dentes');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Nombre de mois ou d''ann�es � prendre en compte');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Nombre d''�valuations successives');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('&Tol�rances sur consommation...');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Calcul et validation des factures');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Validation manuelle de la date d''exigibilit� des factures');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Regroupement sur une m�me facture des contrats d''un m�me client');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Nombre de d�cimales pour l''arrondi des dur�es');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Seuil de tol�rance pour le calcul des lots');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Nombre maximum de contrats en erreur');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Electricit� moyenne tension');
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
   ('Contr�le ligne par ligne');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Activer le bouton de contr�le');
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
   ('Facture d''abonnement ou de d�p�t de garantie');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Mise � jour automatique des prix');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Avant');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Apr�s');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Donn�es Comptables');
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
   ('P�nalit�s de retard');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Site');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('D�lai de carence en jours');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('D�lai d''exigibilit� des factures de p�nalit� en jours');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('D�lai de constitution des mensualisations en jours');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Pr�l�vement');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Format du fichier de pr�l�vement...');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Nombre maximum de retour d''impay�s');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Nombre de pr�sentations maximum');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('D�lai minimum entre deux pr�sentations (en jours)');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('D�lai de transmission du support (en jours)');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Ne pas consid�rer les pr�l�vements avant le');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Date de d�pot � consid�rer :');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Date de d�p�t comptoir');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Date d''�change interbancaire');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Hi�rarchie de la Soci�t�');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Nombre de niveaux (1 � 6)');
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
   ('Niveau du centre op�rationnel');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('D�coupage g�ographique');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Niveau de la tourn�e type');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('S�parateur');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Adresses structur�es');
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
   ('Donn�es techniques');
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
   ('D�lai avant fermeture du contact (en jours)');
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
   ('Contr�le de la cl� R.I.B.');
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
   ('Cr�ation de contrat');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Affichage du d�p�t de garantie');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Affichage du compte client');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Affichage de la date de cr�ation');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Affichage de la date de valeur');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Interface g�ographique');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Synchronisation...');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Interface agendas �lectroniques');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Microsoft Outlook');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Date par d�faut du rendez-vous');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('(Nombre de jours apr�s la date du jour)');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Heure par d�faut du rendez-vous');
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
   ('Contr�le des messages...');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Interface rel�ve portable');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Interface tr�sorerie');
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
   ('Activer la messagerie �lectronique');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Adresse du serveur');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Nom de l''exp�diteur');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Adresse de l''exp�diteur');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Rel�ve et Facturation');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Donn�es commerciales');
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
   ('L''�cart est �gal au montant � payer moins le montant pay� (Ecart positif=Perte, Ecart n�gatif=Profit)');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Ecart borne sup�rieure');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Mode d''acc�s pour encaissement');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Contr�le des messages');
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
   ('(Pour saisir des caract�res sp�ciaux, utilisez la touche "Ctrl". Exemple: "Ctrl"+"Entr�e" pour un retours � la ligne)');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Param�trage des soldes');
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
nombre d''op�rations');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Utilis� dans
compte client');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Utilis� dans
facture');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('D�finition des champs param�trables');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Utilisable');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Configuration des Champs param�trables');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Obligatoire');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Proc�dure de contr�le');
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
   ('< &Pr�c�dent');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Fiche selectionn�e :');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Champ d�pendant :');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Tol�rances sur consommation');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Moyenne jusqu''�');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Moyenne pour un mois jusqu''�');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Tol�rance minimum (%)');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Tol�rance maximum (%)');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Format de fichier de pr�l�vement');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Type de format');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Ordonnancement des points de comptage de la tourn�e type');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Libell� long');
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
   ('Type de rel�ve');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Agent releveur');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Agent pr�vu');
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
   ('&Contr�ler...');
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
rel�ve');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Passage
par z�ro');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Agent
releveur');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Date
rel�ve');
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
   ('Pr�vu');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Ex�cut�');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Compteur avant');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Compteur apr�s');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Dispositif avant');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Dispositif apr�s');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Tourn�es');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Rel�ve
pr�vue');
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
   ('Constitution des tourn�es de rel�ve');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Statut de
la tourn�e');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Nombre de
compteurs');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Compteurs de la tourn�e...');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Compteurs d''une tourn�e de rel�ve');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Affectation des tourn�es');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Diviser');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Anuler G�n�ration');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Rel�ve
pr�c�dente');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Code de l''agent');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Code contr�leur');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Nom contr�leur');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Regrouper
les tourn�es');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Dvision d''une tourn�e');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Nombre de compteurs � diviser');
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
pr�l�vement');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('% de
paiement');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Nombre de mois
de r�gularisation');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Nombre minimum
de mensualit�s');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Montant minimum
des mensualit�s');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Montant par d�faut
de la mensualisation');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Ech�ance
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
   ('Donn�es accessibles');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Centre op�rationnel...');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Code sensibilit�...');
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
   ('Sous-syst�me - Traitement');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Visualisation
Acc�s');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Cr�ation');
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
   ('Codes sensibilit� de l''agent');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Autoris�');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Centres op�rationnels de l''agent');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('D�lai d''exigibilit�
des factures');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('D�lai d''expiration
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
   ('D�pannage');
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
   ('Accueil t�l.');
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
   ('Type de soci�t�');
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
   ('Date de rel�ve');
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
   ('&T�l�rel�ve');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Date rel�ve');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Factur�');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Invalid� le');
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
   ('Pour modifier le dernier index non factur�, s�lectionnez le dans l''historique ci-dessous :');
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
   ('Entr� le');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Pos� le');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('D�pos� le');
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
   ('Libell� du point
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
   ('Libell� du motif
de mouvement');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Entr�/Pos� le');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Sorti/D�pos� le');
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
   ('Rang dans la tourn�e');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Client souscripteur actif');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Propri�taire');
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
   ('Compteurs install�s');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Connect� le');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('D�connect� le');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Coup� le');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('R�tabli le');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Gestion des points de comptage inactifs');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('D�but de la derni�re p�riode de rel�ve');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Fin de la derni�re p�riode de rel�ve');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Section');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('mm�');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('R�glage');
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
   ('Synchronis�s');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Non synchronis�s');
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
   ('Afficher les branchements d�j� synchronis�s');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Synchronis�');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Num�ro de
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
   ('Afficher les points de comptage d�j� synchronis�s');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Date de d�pose');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Date de garantie');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Date de r�vision');
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
   ('Modification du num�ro de compteur');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Cr�ation de compteur en masse');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Pr�fixe');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('De');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Remplissage � gauche');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Longueur de s�quence');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Compl�ments');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Etat parcelle');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Occup�');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Vide');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Raccord� assainissement');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Mat�riau');
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
   ('R�serves');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Conforme');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Enqu�te');
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
   ('Etat de la tourn�e');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('D�charg� le');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Date enqu�te');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Enqu�teur');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Date contr�le');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Agent contr�le');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Date validation');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Agent qualit�');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('D�livr� le');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Irr�gularit�');
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
   ('Robinet arr�t');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Emplacement');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Capacit�s r�s.');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Nb foyers aliment�s');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Nb personnes aliment�es');
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
   ('Compteur pr�sent');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Num�ro de s�rie');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Date Fabrication');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Capacit�');
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
   ('Usage d�taill�');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Point de Livraison');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Recherche des enqu�tes de recensement');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Liste des enqu�tes');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Etat
enqu�te');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Aucune intervention s�lectionn�e.');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('1 intervention s�lectionn�e.');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('interventions s�lectionn�es.');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Code client
souscripteur');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Date mise � jour
enqu�te de visite');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Adresse du point de comptage');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Num�ro de compteur');
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
   ('Valider SANS ex�cuter les plans d''action');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Mis � jour le');
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
   ('Cat�gorie client');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Sensibilit� du client');
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
   ('R�glage du
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
   ('Type d''unit�');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Consommation
calcul�e');
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
rel�ve');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('For�age');
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
   ('Catalogue des champs param�trables de l''avenant au contrat');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Type de
champ');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Unit� de
mesure');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Prorat�');
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
   ('Champs param�trables du type de contrat');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Factures types du type de contrat');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Autoris�e');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('D�p�t de
garantie');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Facture
d''abonnement');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('R�gime
compt�');
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
de rel�ve');
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
   ('Monophas�');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Triphas�');
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
   ('Lots cr��s de moins d''un an');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Cl�tur�');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Cr��
par');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Cl�tur� le');
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
   ('Date de cl�ture');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Date pr�vu');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Date fin sous lot');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('R�f�rence
document');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Adresse point
de comptage');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Ex�cut� le');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Ex�cut�
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
   ('Ancienne r�f�rence
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
   ('R�f�rence document');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Historique du routage');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Ex�cut�
le');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Choisir une structure � importer');
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
   ('Annule la derni�re op�ration');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Co&pier');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Copie la s�lection dans le presse-papiers');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Co&ller');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Ins�re le contenu du presse-papiers � l''endroit s�lectionn�');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('&R�p�ter');
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
   ('Trier par ordre &d�croissant');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Tri la colonne par ordre d�croissant');
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
   ('&S�lectionner tout');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Supprimer');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Supprime la s�lection en cours');
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
   ('Voir requ�te SQL associ�e');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('&Couper');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Coupe la s�lection et la place dans le presse-papiers');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Historique donn�es');
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
   ('Facture interm�diaire...');
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
   ('D�saffectation...');
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
   ('D�poser un compteur...');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Changer un dispositif �metteur...');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Poser un dispostif �metteur...');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('D�poser un dispositif �metteur...');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Imm�diatement');
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
   ('Affaires d�pendantes');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Actions d�pendantes');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Op�rations d�pendantes');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Synth�ses d�pendantes');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Ex�cut� par');
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
   ('Documents enregistr�s');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Liste des documents � router');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Document
� router');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Identifiant
du client');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('R�f�rence
de l''op�ration');
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
   ('Recherche des documents � router');
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
   ('Cr�� par');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Cl�tur� par');
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
documents � traiter');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Nombre de
documents trait�s');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Date de
traitement pr�vue');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Code de
l''agent pr�vu');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Nom de
l''agent pr�vu');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Montant
� traiter');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Montant
trait�');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('&Saisie de masse...');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Estimation
autoris�e');
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
   ('Retours d''impay�s');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Facture �lectronique');
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
   ('Derni�re p�riode factur�e du');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('/ Solde exigible');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Derni�re relance le');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Derni�re facture');
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
   ('Nombre d''affaires li�es au client');
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
   ('Liste des clients pour synth�se');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Recherche des clients pour �cran de synth�se');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Action en cours');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Termin�e le');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('D�but pr�vu le');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('D�but r�el le');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Fin r�elle le');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Dur�e pr�vue');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Dur�e r�elle');
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
   ('Ajout� par');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Affect� �');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Trait� par');
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
   ('Param�trage des traces des tables');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Masquer les tables non utilis�es');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Masquer les tables utilis�es');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Propri�taires');
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
   ('Recensement d�pendants');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Fe&n�tre');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('R�organise les fen�tres ou active les fen�tres sp�cifi�es');
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
   ('Arrange les documents ouverts en mosa�que verticale');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Arrange les documents ouverts en mosa�que horizontale');
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
   ('&Ranger les ic�nes');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Arrange les documents minimis�s');
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
   ('Derni�res demandes');
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
   ('Lancer la rel�ve');
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
   ('D�charger');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Lancer le recensement');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Anomalies de rel�ve');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Suivi de la rel�ve');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Entit�s');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Propri�t�s');
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
   ('D�faut');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Priv�');
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
   ('Libell� abr�g�');
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
   ('Param�trage des traces des colonnes');
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
   ('Dur�e de la pile (ann�es)');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Mouvements...');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Cr�er en masse');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Modification du num�ro de dispositif');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Cr�ation de dispositif en masse');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Historique des mouvements du dispositif');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Libell� du point
de rattachement
ou num�ro
de compteur');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Historique des dispositifs sur le compteur');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Ev�nements');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Ev�nement');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Date de Fin');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Liste des �v�nements');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('D�tail de FAQ');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('R�ponse');
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
   ('R�f�rence de l''appel');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('D�tail de l''appel');
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
   ('Cr�er contact');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Identifiant de l''enregistrement');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('R�f�rence enregistrement');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Dur�e de l''appel (min)');
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
   ('R�f�rence appel');
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
pr�vu');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('S�lectionner tout');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('S�lectionner aucun');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Affecter �:');
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
   ('Historique des interventions trait�es');
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
compteur apr�s');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Date
ex�cution');
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
compteur apr�s');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Index apr�s');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Code
observation avant');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Index
forc� avant');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Index
compteur apr�s');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Code
observation apr�s');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Index
forc� apr�s');
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
   ('Soci�t�');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('T�l�phone domicile');
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
   ('Tiers li�s au client');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Tiers li�s au point de comptage');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Tier');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Tiers li�s');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Tiers li�s au contrat');
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
   ('Associ� �');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Jeu de caract�res');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Caract�re enfermant');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('S�parateur d�cimal');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('S�parateur de milliers');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Symbole mon�taire');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Inclure en-t�te');
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
   ('Donn�es � extraire');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Donn�es Cach�es');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Type
de
donn�es');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Type donn�e Src');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Masque');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Type d''�l�ment');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Alignement
�
droite');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Carat�re
de
remplissage');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Donn�e');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Ordre');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Conditions de s�lection des lignes de la table du mod�le');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('S�lection du mod�le');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Nom de fichier');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('S�lection de la table');
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
   ('&R�tablir');
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
   ('Informations compl�mentaires');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Actuel');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Inf�rieur');
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
   ('< Pr�c�dent');
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
   ('Libell� court');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Chemin du rapport');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Aper�u avant impression...');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Impression diff�r�e...');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Entit� d''origine');
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
   ('Adresse structur�e');
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
   ('Localit�');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Ajouter avant');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Ajouter apr�s');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Note...');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Cr��e le');
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
   ('&D�tail...');
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
   ('Dur�e
pr�vue');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('D�but
pr�vu le');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('D�but
r�el le');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Fin
r�elle le');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Dur�e
r�elle');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Statut');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Affect�
�');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Trait�
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
relanc�');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Type
d''op�ration');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Action
ajout�e');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Processus
li�');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('&Ex�cuter...');
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
   ('S�lection d''un compteur');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Adresse g�ographique...');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('S�lection d''un point de comptage');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('S�lection d''un point de livraison');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Liste des op�rations du compte client');
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
   ('Enregistr� le');
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
   ('Nom Pr�nom');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('T�l�phone');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('D�tail');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Client concern�');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Fourniture');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('T�l�phone du domicile');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('T�l�phone du bureau');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Qualit� payeur');
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
   ('Total des actions/�tapes');
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
   ('D�lai');
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
   ('Actions de l''�tape');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Utilis�');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Condition d''application du plan');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Conditions d''application de l''�tape');
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
   ('Annuler la facture SANS d�sempilage');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Les index et consommations associ�s resteront marqu�s comme factur�s, la derni�re p�riode de facturation restera inchang�e.');
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
   ('Inclure les en-t�tes de colonnes');
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
   ('S�lection des colonnes');
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
   ('Libell� interne');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Activ�e');
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
   ('Type de diam�tre');
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
   ('Ev�nements');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Recherche des �v�nements');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Actions par jour');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Dur�e');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Automatique');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Utilis�e');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Avancement automatique');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Code origine par d�faut');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Processus li�');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Prot�g�e');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Auto.');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Dur�e (min.)');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Code origine d�faut');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Mode de coupure par service');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Prot�g�');
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
   ('P�riode du');
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
   ('Agent �metteur');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('&Routage...');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('&Facture interm�diaire...');
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
   ('Annul�e');
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
   ('Quantit�');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Unit�');
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
   ('D�&tails de ligne...');
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
   ('Conditions de s�lection des factures');
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
   ('Estim�');
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
   ('&Graphe des consommations factur�es...');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Historique des consommations factur�es par p�riode');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('D�tail de la ligne de facture');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Soldes de la facture');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Nombre d''op�rations');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Charges additionnelles � facturer');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Identifiant interne du mouvement');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('P�riode de
facturation');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Ann�e de
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
   ('Mod�le syst�me');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('D�p�t de garantie');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Facture d''abonnement');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('R�gime compt�');
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
   ('Devise de r�f�rence');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Rubriques de la facture type');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Date de cr�ation');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('&Historique');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Rang d''
�dition');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Rang de
calcul');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Quantit�
par d�faut');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Code
de la taxe');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Date de d�but
de validit�');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Date de fin
de validit�');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Quantit�s');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Impression
d�tail de ligne');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Visualisation
d�tail de ligne');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('&Rubriques...');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('&P�riodes...');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Modifier l''ordre');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Rang d''�dition');
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
   ('P�riodes d''application de la rubrique');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Rubrique appliqu�e');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('P�riode
1');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('P�riode
2');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('P�riode
3');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('P�riode
4');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('P�riode
5');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('P�riode
6');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('P�riode
7');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('P�riode
8');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('P�riode
9');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('P�riode
10');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('P�riode
11');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('P�riode
12');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('P�riodes de facturation');
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
   ('Types de rubrique s�lectionn�s');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Facture type compt�e');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Facture =>');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Rel�ve
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
   ('D�finition du calendrier du lot');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Jour planifi�');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Mois planifi�');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Date planifi�e');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Ann�e');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Trait�');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Non trait�');
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
   ('Libell�
lot type');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Planifi�
le');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Date
pr�vue');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Avec
rel�ve');
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
   ('Conditions de s�lection des contrats');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('&T�ches...');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('T�ches du mod�le de lot');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Traitement');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Validit�');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Lignes du message');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Identifiant cach�');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Condition d''application du message');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Messages appliqu�s');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Date de r�siliation');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Mod�le');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Titre');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Agent de cr�ation');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Date de validit�');
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
de d�but');
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
Monnaie autoris�');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Devise de
r�f�rence');
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
Autoris�e');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Validation de la date d''exigibilit�');
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
   ('Rubrique de p�nalit� associ�e');
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
   ('Unit� de
Quantit�');
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
   ('Date de changement ou de fin de validit� d''un prix');
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
   ('Fin de validit�');
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
   ('D�but
de validit�');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Derni�re
mise � jour');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Variable indice
de r�f�rence');
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
   ('Mise � jour
de validit�');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Syst�me');
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
   ('P0= Prix de r�f�rence');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Indices...');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Liste des formules de r�vision');
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
   ('Fin de &validit�');
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
P�riodes');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Nbre d''ann�es
de d�calage');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('P�riodes...');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('P�riodes du cycle de facturation');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Code / Libell�');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Code p�riode');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Jour de d�but');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Mois de d�but');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Date de D�but');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('D�but du cycle');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('P�riodes existantes / demand�es');
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
   ('Libell� abr�g�
rubrique');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Libell� abr�g�
du prix');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('D�but de
validit�');
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
validit�');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Date d�but
de validit�');
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
   ('Tourn�e =>');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('&Mod�le de lot...');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('T�ches du lot');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('T�che');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Pr�vue le');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Trait�e le');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Nombre de contrats');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Demand�e le');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('&Constituer');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Rel�ve =>');
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
   ('Date de d�marrage');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Lot de recensement');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Num�ro
de visite');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Nombre
d''enqu�tes');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('T�che
en cours');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Date de
mise � jour');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('D�tail...');
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
   ('Cr�� le');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('P�riode de facturation');
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
   ('Pr�fixe du
num�ro de facture');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Num�rotation
automatique');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Identifiant
de s�quence');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Longueur de
la s�quence');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Caract�re de
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
   ('1 - S�lectionner client');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('2 - S�lectionner cr�dits � affecter');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('3- S�lectionner d�bit non sold�');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Montant � affecter');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Montant affect�');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Solde � affecter');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('4 - &Affecter le cr�dit � la ligne de d�bit s�lectionn�e');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('&Remise � z�ro');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Nom - Pr�nom');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Op�ration � d�saffecter');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Op�ration correspondante');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Solde apr�s
d�saffection');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Clients ayant un cr�dit non affect�');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Civilit�');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Nombre de clients � couper');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Nombre de points de livraison � couper');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Nombre de points de comptage � couper');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Solde exigible associ�');
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
   ('Recherche des points de comptage � couper');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Liste des points de comptage � couper');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('&Point de comptage s�lectionn�');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Date de derni�re relance');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Code sensibilit�');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Ech�ancier en cours');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('&Tr�sorerie...');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('&Graphe');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Op�rations');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Avec affectation');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Sold�e');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Non sold�e');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('&Ech�ancier...');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('&R�gularisation =>');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('P�nalit�s =>');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Exigibilit�');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Valeur');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('D�but p�riode fac');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Fin p�riode fac');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Sld');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('D�but p�riode fac.');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Fin p�riode fac.');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Code obs. du routage');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Non Affect�');
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
   ('D�tail d''un r�glement');
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
   ('Ch�que');
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
   ('Compl�ment');
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
   ('Nombre d''op�rations
actuel');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Solde
 au 10/01/00');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Nombre d''op�rations
au');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Nombre d''�ch�ance');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('P�riodicit�');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Date de premi�re �ch�ance');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Date seconde �ch�ance');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Montant de la premi�re �ch�ance');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Montant des �ch�ances');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('&Calculer');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('D�bits');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Sold�es par l''�ch�ancier');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Montant dans
l''�ch�ancier');
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
   ('S�&lectionner');
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
   ('&D�tail');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Modifi�');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Num�ro Ch�que');
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
   ('Modification d''�ch�ancier');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Ech�ance');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Nombre d''�ch�ances');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Montant 1 er �ch�ance');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('N� Ech');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('MontantSV');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Date �xigible');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Montant total saisi');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Solde � r�partir');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('R�initialiser');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('D�tail rubrique');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Selecttionner');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Consultation d''un �ch�ancier');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('0 note...');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Factures sold�es par l''�ch�ancier');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Solde avant �ch�ancier');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Paiement');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Impay�');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Motif');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('R�glement');
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
s�lectionn�');
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
   ('Num�ro de mensualisation');
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
   ('Nombre de mensualit�s');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Cr�� le / Modifi�e le / par');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Montant total initial');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Date de la premi�re mensualit�');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Montant total des mensualit�s');
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
   ('Mensualit�s');
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
   ('Affect�');
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
   ('Transfert de r�glement');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Code et nom');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Liste des op�rations');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Recherche des op�rations');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Pr�fixe de la r�f�rence');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Mode d''imputation');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Type de routage par d�faut');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Type d''op�ration annul�e');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Identifiant s�quence');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Longueur s�quence');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Caract�re de remplissage');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Donn�e prot�g�e');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Affich�e');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Utilisable en saisie directe dans compte client');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Utilisable en gestion des �carts sur encaissement');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Repr�sentation interne');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Repr�sentation externe');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Liste des types d''op�ration');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Uitlis�');
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
   ('Financi�re');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Impacte le solde du client');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Format du fichier de
pr�l�vement export');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Format du fichier de
pr�l�vement import');
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
   ('P�riodicit� d''�ch�ance');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Affectation
autoris�e');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Transfert de R�glement');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Mode de r�glement');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Montant transf�r�');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Montant du transfert');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('&S�lectionner');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Nouvelle situation');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Nombre de clients � relancer');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Recherche des clients � relancer');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('T�l�phone portable');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Messagerie �lectronique');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Caract�ristiques');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('cat�gorie');
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
   ('Client regroup�');
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
   ('Nombre de retours d''impay�s');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Domiciliation bancaire');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Mode de r�glement habituel');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Ancienne r�f�rence');
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
   ('Cr�er un avenant avec facturation');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Cr�er un avenant sans facturation');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Annuler l''avenant');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('R�silier avec facture');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('R�silier sans facture');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Annuler la r�siliation');
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
   ('R�sili� le');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Date de derni�re facture');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('D�but de la derni�re p�riode factur�e');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Fin de la derni�re p�riode factur�e');
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
   ('Exon�r� de TVA');
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
   ('Exon�r�
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
   ('Centre op�rationel');
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
   ('Informations g�n�riques');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('R�vision des prix');
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
   ('Formule de r�vision');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('P�riodicit� d''actualisation (mois)');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Derni�re actualisation');
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
   ('Date d''entr�e');
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
   ('Mod�le associ�');
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
Mise � jour');
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
r�siliation');
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
cr�ation');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Taille');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Cr�er mandat');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Cr�er');
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
   ('Exon�r� TVA');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Date de mise � jour');
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
   ('Historique des facturations par p�riode');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Affichage des colonnes');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Valeur par d�faut');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Table');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Libell� de colonne');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('S�lection');
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
   ('Crit�res de s�lection');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Devises');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Modes de R�glement');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Appliquer');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('N� ticket');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Annul� le');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Mode de
r�glement');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Montants
encaiss�s / transf�r�s');
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
   ('Num�ro
Ch�que');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Num�ro
Compte');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Consignation');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('R�f�rence additionnelle');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Ligne de paiement de consignation');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('R�f�rence additionnelle ligne de consignation');
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
   ('Caissier connect�');
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
   ('Transf�rer =>');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Contr�ler =>');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Montant en caisse par devise');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('R�partition par mode de r�glement');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Montant en devise');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Num�ro de ch�que');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Num�ro de compte');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Montant encaiss�');
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
   ('R�gularis�');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Transfert de caisse � banque');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Verrouill�e le');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Code confidentiel');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Acc�s');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Solde p�nalit�s');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('p�nalit�s =>');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Exigible au');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('&S�lection');
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
   ('Pay� en');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Nature');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Montant total affect�');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('A payer');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Pay�');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Confirmation d''encaissement');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Montant � payer');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Montant � rendre');
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
   ('Saisie de la p�riode de traitement');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Transfert de banque � caisse');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Montant en caisse par Fond de caisse');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('&Mode de r�glement...');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Devises autoris�es');
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
   ('Temps r�el');
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
   ('Modes de r�glement de la caisse');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Mode de r�glement de la caisse');
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
d''impay�');
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
 diff�r�');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Identifiant
Fen�tre');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Fen�tre rattach�e');
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
   ('Aper�u avant
impression');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Libell�
1er param�tre');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Libell�
2�me param�tre');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Libell�
3�me param�tre');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Libell�
4�me param�tre');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Libell�
5�me param�tre');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Mod�le
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
   ('El�ments constitutifs');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Modele d''export');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Disponibilit�');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Liste des mod�les');
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
   ('Imprimable en diff�r�');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Catalogue de typologie des champs param�trables');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Propri�taire du compte');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Cl� RIB');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Liste des filtres');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Tr�sorerie');
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
   ('Total � payer');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Num�ro d''ordre');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Saisie manuelle');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('S�quence');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('S�quence absolue');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Date pr�vue');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Date de demande');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Date de r�alisation');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Mode de d�clenchement');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Adresse de l''imprimante');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Recherche des t�ches');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Gestion des compteurs g�n�raux / divisionnaires');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Afficher les divisionnaires');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Point de comptage
g�n�reaux / divisionnaires');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Pts Comptage');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Type Contrat cach�');
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
   ('Points de comptage attach�s au g�n�ral');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('G�n�ral');
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
   ('Ex�cut�e le');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Avant intervention');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('R�glage du disjoncteur');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Calibre');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Apr�s intervention');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Date de fabrication');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Type de compteur � facturer');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Date d''�talonnage');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Date d''agr�ment');
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
   ('Edit�e le');
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
   ('&Arr�ter');
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
   ('Monophas� (2 fils)');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Triphas� (4 fils)');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Disjoncteur');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Cr�ation de l''intervention dans Outlook');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Vous allez cr�er un rendez vous dans Outlook.');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('S�lection du calendrier d''intervention :');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Recherche des interventions');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Impression imm�diate');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Choisissez le type d''impression.');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Code g�ographique');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Type
d''information');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Type
de p�riode');
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
   ('Saisie de la p�riode d''extraction');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Code du journal');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Libell� long du type de journal');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Num�ro de r�le');
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
   ('Affectation du type d''op�ration');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Types d''op�ration s�lectionn�s');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Priorit�');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Nature de r�glement affect�');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Type de facture affect�');
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
   ('D�finition des s�quences');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Identifiant de
la s�quence');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Valeur de la
s�quence');
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
   ('Base de donn�es');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Notes');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Documents attach�s');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Clause "From" de la liste associ�e et du filtre modifi�');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('&R�initialier');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('&Tester...');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Nombre de clients � contacter');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Recherche des clients � contacter');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Liste des clients � contacter');
Insert into X7.CHN
   (DATA_CHN)
 Values
   ('Centre
Op�rationel');
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
