! -------------------------------------------------------------------
! sql.inc
! -------------------------------------------------------------------
! 17 avril 1996
! -------------------------------------------------------------------
! SQL Error handling function.
! -------------------------------------------------------------------
! History :
!	Loïc LAURENT, 17 avril 1996 : Creation
!   Charles-Albert LEBRUN, 16/05/2002 :
!            Add QUIET option
!            Add SQL error logging with query name in $SQLQueryName.
! -------------------------------------------------------------------
!
! To use this :
! - add the option on-error=SQL_Erreur for all your BEGIN-SELECT or
!   BEGIN-SQL statements
! - Additionaly, add a line just before your statement like :
!   Let $SQLQueryName='<The message that identify your query>'
!
! In case of SQL error, you will have in SQR.LOG (and so in BATCH.LOG
! for X7) the following result :
!
! ######################################################################
!
! SQL Query : <The message that identify your query>
!
! SQL Error : <Description of the error given by Oracle>
!
! ######################################################################
!
! And the Brio program exit quietly without waiting for user input.
!
! -------------------------------------------------------------------
#include 'd:\utils\dft_cste.h'

! ----- SQL_Erreur : Procedure de traitement des erreurs SQL --------
!
! Cette procedure doit figurer dans toute instruction "on error"
! Elle interrompt le traitement

Begin-Procedure SQL_Erreur

  ! OK. We got an error, cancel previous actions.
  ROLLBACK

  ! Show the error in the regular output, so we get it into the BATCH.LOG file.
  show '######################################################################'
  show ' '
  show 'SQL Query : ' $SQLQueryName
  show ' '
  show 'SQL Error : ' $Sql-Error
  show ' '
  show 'Other info: ' $ErrorDescMessage
  show ' '
  show '######################################################################'
  
  
  Let $Erreur_Sql=Substr($Sql-Error,5,5)
  If $Erreur_Sql != '00000'

    Do MSG_EcrireErreurSQL ( $Sql-Error, #CodeRetour )
    Let #return-status = {SORTIE_ERREUR_SQL}

    ! **** DO NOT STOP THE WHOLE BATCH.BAT PLEASE ! ****
    ! WE SET THE QUIET OPTION TO AVOID THIS.
    STOP QUIET

  End-If
End-Procedure

! ----- SQL_SignalFin ------------------------------------------------
!
! Positionne le booleen de fin de boucle
Begin-Procedure SignalFin

  Let $_bSQLFin = {VRAI}
  
End-Procedure
