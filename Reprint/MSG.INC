! -------------------------------------------------------------------
! msg.inc
! -------------------------------------------------------------------
! 17 avril 1996
! -------------------------------------------------------------------
! Fonction de gestion des messages d'information et d'erreurs
! -------------------------------------------------------------------
! Liste des procedures
!  MSG_DefinirUtilisateur( $Utilisateur )
!  MSG_DefinirTraitement( $Traitement )
!  MSG_DefinirLocalisation( $Localisation )
!  MSG_DefinirRequeteCourante( $Requete )
!  MSG_Ecrire( $Cste, :#CodeRetour )
!  MSG_EcrireErreurSQL( $ErrSql, :#CodeRetour )
!  MSG_EcrireProgression( #Prg, :#CodeRetour )
!  MSG_LireMessage( $Ctse, :$Message )
!  MSG_EcrireChaine( $Cste, $Locale, :#CodeRetour)
! -------------------------------------------------------------------
! Historique de maintenance
!	Loïc LAURENT, 17 avril 1996, Creation
! -------------------------------------------------------------------
#include 'dft_cste.h'

Begin-Procedure MSG_Init

Let $MSG_NomUtilisateur=''
Let $MSG_NomTraitement=''
Let $MSG_Date=''
Let $MSG_CodeMessage=''
Let $MSG_Texte=''
Let #MSG_Progression=0
Let $MSG_NomLocalisation=''
Let $MSG_NomRequete=''

Let $MSG_FicBuffer=''

End-Procedure

!
! ----- MSG_DefinirUtilisateur --------------------------------------
! -----   Définit, pour le message, le nom de l'utilisateur ---------
!
Begin-Procedure MSG_DefinirUtilisateur( $Utilisateur )

  Let $_MSG_NomUtilisateur = $Utilisateur

End-Procedure

! ----- MSG_DefinirTraitement ---------------------------------------
! -----   Définit, pour le message, le nom du traitement ------------
!
Begin-Procedure MSG_DefinirTraitement( $Traitement )

  Let $_MSG_NomTraitement = $Traitement

End-Procedure

! ----- MSG_DefinirLocalisation -------------------------------------
! -----   Définit, pour le message, le nom de la localisation -------
!
Begin-Procedure MSG_DefinirLocalisation( $Localisation )

  Let $_MSG_NomLocalisation = $Localisation

End-Procedure

! ----- MSG_DefinirRequeteCourante -------------------------------------
! -----   Définit, pour le message, le nom de la requête en cours-------
!
Begin-Procedure MSG_DefinirRequeteCourante( $Requete )

  Let $_MSG_NomRequete = $Requete

End-Procedure

! ----- MSG_Ecrire -----------------------------------------------------
! -----   Ecrit un message prédéfini dans le fichier d'historique ------
! -----   dans la table SYS_HST_MSG                                   --
!
Begin-Procedure MSG_Ecrire( $Cste, :#CodeRetour )

  Do MSG_DefinirCodeEtTexte( $Cste )

  Let #_MSG_Progression = 0

  Do MSG_DefinirDate()
  
  If substr( $Cste, 1, 7 ) = 'MSG_ERR'
     ROLLBACK
  end-if

  Do MSG_EcrireDansFichier(#MSG_CodeErreur)

! If NOT isnull($_MSG_NomUtilisateur)
  Do MSG_EcrireDansBase()
! End-If
  
  If $Cste = 'MSG_DEBUT'
     COMMIT
  else
    If substr( $Cste, 1, 7 ) = 'MSG_ERR'
       do MSG_Ecrire( 'MSG_FIN_ANORMALE', #inutile )
    Else 
      If substr( $Cste, 1, 16 ) = 'MSG_FIN_ANORMALE'
        Let #return-status = {SORTIE_ERREUR}
        STOP
      Else
        Let #CodeRetour = #MSG_CodeErreur
      End-If
    End-If
  End-if

End-Procedure


! ----- MSG_EcrireDansFichier ------------------------------------------
! -----   Ecrit tous les messages du buffer dans le fichier d'historique
!
Begin-Procedure MSG_EcrireDansFichier( :#CodeRetour )
  
  Let $MSGProgression = to_char(#_MSG_Progression) 
  Let $_MSG_FicBuffer = $_MSG_FicBuffer || $_MSG_NomUtilisateur || {TAB} ||
	$_MSG_NomTraitement || {TAB} || $_MSG_Date || {TAB} ||
	$_MSG_CodeMessage || {TAB} || $_MSG_Texte || {TAB} || 
	$MSGProgression || {TAB} || $_MSG_NomLocalisation ||
	$MSG_NomRequete || {CR}

  If $_MSG_CodeMessage='MSG_FIN' OR $_MSG_CodeMessage='MSG_FIN_ANORMALE' OR $_MSG_CodeMessage='MSG_FIN_ANORMALE_SQL'
    ! --- Ecriture physique dans le fichier ---
    Open {MSG_FICHIER_HISTORIQUE} as 99 Record=1024:Vary For-Reading Status=#ResultOpen
    If #ResultOpen != 0
      LET $DateDuJour = $_MSG_Date
    else
      LET $DateDuJour = ''
    end-if
    Close 99
    
    Open {MSG_FICHIER_HISTORIQUE} as 99 Record=1024:Vary For-Append Status=#ResultOpen
    If #ResultOpen != 0
      Open {MSG_FICHIER_HISTORIQUE} as 99 Record=1024:Vary For-Writing Status=#ResultOpen
      If #ResultOpen != 0
	     Let #CodeRetour = {MSG_ERR_OUVRIR_FICHIER}
      End-If
    End-If

    ! CAL - 13/08/2002
    ! Write in the file ONLY if the file is open. This prevent Brio to stop the batch
    ! when this file is not available. In this case, Brio can't write the message anyway...
    if #ResultOpen = 0
       Write 99 From $DateDuJour Status=#ResultWrite
   
       While length($_MSG_FicBuffer) > 0
   
         Let #FinDeLigne = Instr($_MSG_FicBuffer,'\n',1)-1
         Let #Longueur = Length($_MSG_FicBuffer) - #FinDeLigne + 2
         Let $UneLigne = substr($_MSG_FicBuffer,1,#FinDeLigne)
   
         Write 99 From $UneLigne Status=#ResultWrite
   
         Let #FinDeLigne=#FinDeLigne+3
         Let $_MSG_FicBuffer=substr($_MSG_FicBuffer,#FinDeLigne,#Longueur)
   
       End-While 
   
       If #ResultWrite !=0
         Let #CodeRetour = {MSG_ERR_ECRITURE_FICHIER}
       Else
         Let #CodeRetour = #ResultWrite   
       End-If
       
       Close 99
       Let $_MSG_FicBuffer = ''
    end-if
  End-If ! --- Ecriture physique dans le fichier ---

End-Procedure

! ----- MSG_EcrireDansBase----------------------------------------------
! -----   Ecrit le message courant dans la table SYS_HST_MSG -----------
!
Begin-Procedure MSG_EcrireDansBase

!  If $MSG_CodeMessage = 'MSG_DEBUT'
!    ! --- On efface tous les messages de cet utilisateur 
!    ! --- concernant ce traitement

!Begin-Sql On-Error=SQL_Erreur
!DELETE	SYS_HST_MSG
!WHERE	NOM_UTILISATEUR = $MSG_NomUtilisateur 
!AND	NOM_TRAITEMENT = $MSG_NomTraitement 
!End-Sql
!COMMIT 

!  End-If

Begin-Sql On-Error=SQL_Erreur
INSERT INTO SYS_HST_MSG
(NOM_UTILISATEUR, NOM_TRAITEMENT, DAT_COURANTE, MSG_CODE, MSG_LIBELLE,
NUM_PROGRESSION, NOM_LOCALISATION, NOM_REQUETE)
VALUES
($MSG_NomUtilisateur, $MSG_NomTraitement,
To_Date($MSG_Date,'DD/MM/YYYY HH24:MI:SS'),
$MSG_CodeMessage,
$MSG_Texte, #MSG_Progression, $MSG_NomLocalisation , $MSG_NomRequete)
End-Sql
! COMMIT
   
End-Procedure

! ----- MSG_EcrireErreurSql --------------------------------------------
! -----   Ecrit le message d'erreur renvoye par le moteur SQL ----------
! -----   d'ORACLE dans le fichier d'historique, et seulement ----------
! -----   dans ce fichier ----------------------------------------------
!
Begin-Procedure MSG_EcrireErreurSql($MsgErr, :#CodeRetour )

  Let $_MSG_CodeMessage = 'MSG_ERREUR_SQL'
  Let #_MSG_Progression = 0

  Let $_MSG_Texte = $MsgErr

  Do MSG_EcrireDansFichier( #CodeRetour1 )
  Do MSG_EcrireDansBase()
  
  Let $_MSG_CodeMessage = 'MSG_FIN_ANORMALE_SQL'
  Let $_MSG_Texte = '*** DECONNEXION ***********'

  Do MSG_EcrireDansFichier( #CodeRetour2 )

  Do MSG_EcrireDansBase()
  
  COMMIT
  Let #CodeRetour = #CodeRetour1 OR #CodeRetour2 

End-Procedure

! ----- MSG_EcrireProgression --------------------------------------------
! -----   Ecrit un message de progression dans la base et dans -----------
! -----   le fichier d'historique ----------------------------------------
!
Begin-Procedure MSG_EcrireProgression(#Prg, :#CodeRetour )

  Let $_MSG_CodeMessage = 'MSG_PROGRESSION'
  Let #_MSG_Progression = #Prg

  Do MSG_DefinirDate()

  Do MSG_EcrireDansFichier( #CodeRetour1 )
  
  Do MSG_EcrireDansBase()
  
  Let #CodeRetour = #CodeRetour1

End-Procedure

! ----- MSG_DefinirCodeEtTexte -----------------------------------------
! -----   Ecrit un message prédéfini dans le fichier d'historique ------
! -----   et si un utilisateur est définit, dans la table SYS_HST_MSG --
!
Begin-Procedure MSG_DefinirCodeEtTexte( $Cste )

  Let $_MSG_CodeMessage = $Cste

Begin-Select On-Error=SQL_Erreur
MSG_LIBELLE
FROM  SYS_MSG
WHERE MSG_CODE = $Cste
End-Select

  Let $_MSG_Texte = &MSG_LIBELLE

End-Procedure

! ----- MSG_DefinirDate --------------------------------------------
! -----   Positionne la date du serveur dans le message ----------------
!
Begin-Procedure MSG_DefinirDate LOCAL

Begin-Select On-Error=SQL_Erreur
TO_Char(SYSDATE,'DD/MM/YYYY HH24:MI:SS') &dtDateJour
FROM  SYS.DUAL
End-Select

  Let $_MSG_Date = &dtDateJour

End-Procedure


! ----- MSG_LireMessage --------------------------------------------
! -----  Recupere le texte du message associe a la constante ------- 
!
Begin-Procedure MSG_LireMessage($Cste, :$MSG_Message)

  Do MSG_DefinirCodeEtTexte($Cste)
  Let $MSG_Message = $_MSG_Texte 

End-Procedure


! ----- MSG_EcrireChaine -------------------------------------------
! -----   Ecrit dans le fichier le message dont la constante -------
! -----   ET le texte sont passees en parametre -------------------- 
!
Begin-Procedure MSG_EcrireChaine( $Cste, $Locale, :#CodeRetour)
  
  Let $_MSG_CodeMessage = $Cste

  Let $_MSG_Texte = $Locale 

  Let #_MSG_Progression = 0

  Do MSG_DefinirDate()
  Do MSG_EcrireDansFichier(#MSG_CodeErreur)

  Do MSG_EcrireDansBase()
 
  If $Cste = 'MSG_ERR'
    Do MSG_Ecrire('MSG_FIN_ANORMALE',#MSG_CodeErreur1)
    Let #CodeRetour = #MSG_CodeErreur OR #MSG_CodeErreur1
  Else
    Let #CodeRetour = #MSG_CodeErreur
  End-If
  
End-Procedure

