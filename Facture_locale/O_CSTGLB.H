!-----------------------------------------------------------------------
! Fichier de definition des constantes globales
!-----------------------------------------------------------------------

!-----------------------------------------------------------------------
! pour Etats SQR
!-----------------------------------------------------------------------
#define EXTRA_LINE 66 ! Longeur utile +1 (65 Max)
#define EXTRA_COL 160
#define EXTRA_OR landscape
#define EXTRA_CHAR_WIDTH 4.8
#define EXTRA_LINE_HEIGHT 8
#define EXTRA_TOP_MARGIN 0.4
#define EXTRA_LEFT_MARGIN 0.5
#define EXTRA_SYMBOL_SET 19U  ! pour HP
#define EXTRA_PITCH 15

#define WIDE_LINE 66 ! Longeur utile +1 (65 Max)
#define WIDE_COL 132
#define WIDE_OR landscape
#define WIDE_CHAR_WIDTH 4.8
#define WIDE_LINE_HEIGHT 8
#define WIDE_TOP_MARGIN 0.4
#define WIDE_LEFT_MARGIN 1
#define WIDE_SYMBOL_SET 19U  ! pour HP
#define WIDE_PITCH 15

#define MEDIUM_LINE 96 ! Longeur utile +1 (95 Max)
#define MEDIUM_COL 120 ! (118 Max pour HP)
#define MEDIUM_OR portrait
#define MEDIUM_CHAR_WIDTH 4.8
#define MEDIUM_LINE_HEIGHT 8
#define MEDIUM_TOP_MARGIN 0.4
#define MEDIUM_LEFT_MARGIN 0
#define MEDIUM_SYMBOL_SET 19U  ! pour HP
#define MEDIUM_PITCH 15

#define SHORT_LINE 67 ! Longeur utile +1 (66 Max)
#define SHORT_COL 80
#define SHORT_OR portrait
#define SHORT_CHAR_WIDTH 6
#define SHORT_LINE_HEIGHT 12
#define SHORT_TOP_MARGIN 0.5
#define SHORT_LEFT_MARGIN 0.5
#define SHORT_SYMBOL_SET 19U  ! pour HP
#define SHORT_PITCH 12

! Format des montants numériques
#define FMTMNT '99999999990.99' ! Max 16 char

! Gestion des tâches
#define STTTCH_ENCOURS 'C'
#define STTTCH_FINI 'F'

! Nom de l'utilisateur batch
#define BATCH_USER BATCH
#define MAX_USER_LEN 20 ! longueur max du nom de l'utilisateur

! Identifiants internes
#define IDTRET_ENCOURS 4 ! Code retour "en cours"
#define IDTRET_OK 0 ! Code retour "OK terminé"
#define IDTRET_FORCEOK 2 ! Code retour "Forcé OK"
#define IDTCTLACT_COUP 4 ! Action coupure
#define IDTPLNACT_COUP 4 ! Type de plan de coupure
#define IDTCTLACT_LETTRERELAN 9 ! Action lettre de relance pour CLTLTR01.SQR
#define IDTTYPACT_RELAN 2 ! Type d'action relance pour CLTLTR01.SQR
#define IDTPLNACT_RELAN 3 ! Type de plan relance pour CLTLTR01.SQR
#define IDTCTLACT_LETTRERELAN2 123 ! Action lettre de relance pour CLTLTR02.SQR
#define IDTTYPACT_RELAN2 2 ! Type d'action relance pour CLTLTR02.SQR
#define IDTPLNACT_RELAN2 3 ! Type de plan relance pour CLTLTR02.SQR
#define IDTCTLACT_LETTRERELAN3 125 ! Action lettre de relance mise en demeure  pour CLTLTR03.SQR
#define IDTTYPACT_RELAN3 2 ! Type d'action relance mise en demeure pour CLTLTR03.SQR
#define IDTPLNACT_RELAN3 3 ! Type de plan relance mise en demeure  pour CLTLTR03.SQR
#define IDTCTLACT_LETTRERELAN4 124 ! Action lettre de relance commandement de payer  pour CLTLTR04.SQR
#define IDTTYPACT_RELAN4 2 ! Type d'action relance commandement de payer pour CLTLTR04.SQR
#define IDTPLNACT_RELAN4 3 ! Type de plan relance commandement de payer  pour CLTLTR04.SQR
#define IDTCTLACT_LETTRERELAN5 127 ! Action lettre de relance accusé de reception  pour CLTLTR05AR.SQR
#define IDTTYPACT_RELAN5 2 ! Type d'action relance accusé de reception pour CLTLTR05AR.SQR
#define IDTPLNACT_RELAN5 3 ! Type de plan relance accusé de reception  pour CLTLTR05AR.SQR

#define IDTCTLACT_LETTRERELAN6 128 ! Action Avis de coupure  pour CLTLTR06.SQR
#define IDTTYPACT_RELAN6 2 ! Type d'action relance accusé de reception pour CLTLTR06.SQR
#define IDTPLNACT_RELAN6 3 ! Type de plan relance accusé de reception  pour CLTLTR06.SQR

!de aici incep insert
#define IDTCTLACT_LETTRERELAN7 129 ! Action poursuite par saisie pour CLTLTR07.SQR
#define IDTTYPACT_RELAN6 2 ! Type d'action relance poursuite par saisie pour CLTLTR07.SQR
#define IDTPLNACT_RELAN6 3 ! Type de plan relance poursuite par saisie pour CLTLTR07.SQR

#define IDTCTLACT_LETTRERELAN8 130 ! Action poursuite exterieure pour CLTLTR08.SQR
#define IDTTYPACT_RELAN6 2 ! Type d'action relance poursuite exterieure pour CLTLTR08.SQR
#define IDTPLNACT_RELAN6 3 ! Type de plan relance poursuite exterieure pour CLTLTR08.SQR
! aici termin

#define IDTSRV_EAU 1 ! Service eau
#define IDTSRV_BT 2 ! Service BT

!-----------------------------------------------------------------------
! pour Etat CLTPCC01
!-----------------------------------------------------------------------
#ifdef CLTPCC01
   #define MDL CLTPCC01 ! Nom du module
   #define TRT TRT2000 ! Code traitement
#endif

!-----------------------------------------------------------------------
! pour Etat CLTLTR01
!-----------------------------------------------------------------------
#ifdef CLTLTR01
   #define MDL CLTLTR01 ! Nom du module
   #define LTR_FIC cltltr01 ! Nom du fichier Lettre (extension .txt)
   #define TRT TRT2001 ! Code traitement
#endif
!-----------------------------------------------------------------------
! pour Etat CLTLTR02
!-----------------------------------------------------------------------
#ifdef CLTLTR02
   #define MDL CLTLTR02 ! Nom du module
   #define LTR_FIC cltltr02 ! Nom du fichier Lettre (extension .txt)
   #define TRT TRT2001 ! Code traitement
#endif
!-----------------------------------------------------------------------
! pour Etat CLTLTR03
!-----------------------------------------------------------------------
#ifdef CLTLTR03
   #define MDL CLTLTR03 ! Nom du module
   #define LTR_FIC cltltr03 ! Nom du fichier Lettre (extension .txt)
   #define TRT TRT2001 ! Code traitement
#endif
!-----------------------------------------------------------------------
! pour Etat CLTLTR04
!-----------------------------------------------------------------------
#ifdef CLTLTR04
   #define MDL CLTLTR04 ! Nom du module
   #define LTR_FIC cltltr04 ! Nom du fichier Lettre (extension .txt)
   #define TRT TRT2001 ! Code traitement
#endif
!-----------------------------------------------------------------------
! pour Etat CLTLTR05AR
!-----------------------------------------------------------------------
#ifdef CLTLTR05AR
   #define MDL CLTLTR05AR ! Nom du module
   #define LTR_FIC cltltr05AR ! Nom du fichier Lettre (extension .txt)
   #define TRT TRT2001 ! Code traitement
#endif
!-----------------------------------------------------------------------
! pour Etat CLTLTR06
!-----------------------------------------------------------------------
#ifdef CLTLTR06
   #define MDL CLTLTR06 ! Nom du module
   #define LTR_FIC cltltr06 ! Nom du fichier Lettre (extension .txt)
   #define TRT TRT2001 ! Code traitement
   #define avis_coupure 'ADC'
#endif
!-----------------------------------------------------------------------
! pour Etat CLTLTR07
!-----------------------------------------------------------------------
#ifdef CLTLTR07
   #define MDL CLTLTR07 ! Nom du module
   #define LTR_FIC cltltr07 ! Nom du fichier Lettre (extension .txt)
   #define TRT TRT2001 ! Code traitement
   #define poursuite_saisie 'PVS'
#endif
!-----------------------------------------------------------------------
! pour Etat CLTLTR08
!-----------------------------------------------------------------------
#ifdef CLTLTR08
   #define MDL CLTLTR08 ! Nom du module
   #define LTR_FIC cltltr08 ! Nom du fichier Lettre (extension .txt)
   #define TRT TRT2001 ! Code traitement
   #define poursuite_exterieure 'PEX'
#endif
!-----------------------------------------------------------------------
! pour Etat INTBON01
!-----------------------------------------------------------------------
#ifdef INTBON01
   #define MDL INTBON01 ! Nom du module
   #define TRT TRT2002 ! Code traitement
   #define STA_GENERE 2 ! Etat généré
   #define STA_EDITE 3 ! Etat édité
   #define IDTTYPTCHE_EDT_BONINT 'TRT2002'
#endif
!-----------------------------------------------------------------------
! pour Etat INTBON02
!-----------------------------------------------------------------------
#ifdef INTBON02
   #define MDL INTBON02 ! Nom du module
   #define TRT TRT2002 ! Code traitement
   #define STA_GENERE 2 ! Etat généré
   #define STA_EDITE 3 ! Etat édité
   #define IDTTYPTCHE_EDT_BONINT 'TRT2002'
#endif


!-----------------------------------------------------------------------
! pour Etat RLVBAT06
!-----------------------------------------------------------------------
#ifdef RLVBAT06
   #define MDL RLVBAT06 ! Nom du module
   #define TRT TRT2003 ! Code traitement
   #define EXTRA_LINE 45 ! Longeur utile +1 (66 Max)
   #define EXTRA_LINE_HEIGHT 12
   #define ETTTRN_EDITE '2'
   #define IDTTYPTCHE_EDT_CARNET 'TRT2003'
#endif

!-----------------------------------------------------------------------
! pour Etat RLVBAT08
!-----------------------------------------------------------------------
#ifdef RLVBAT08
   #define MDL RLVBAT08 ! Nom du module
   #define TRT TRT2004 ! Code traitement
   #define IDTTYPTCHE_EDT_ANO_RLV 'TRT2004'
#endif

!-----------------------------------------------------------------------
! pour Etat EDTEPR01
!-----------------------------------------------------------------------
#ifdef EDTEPR01
   #define MDL EDTEPR01 ! Nom du module
   #define TRT TRT2005 ! Code traitement
   #define IDTTYPTCHE_EDT_FAC 'TRT2005'
   #define FMTQTE '99999999990.99'
   #define FMTPRX '99990.99'
   #define FMTPRXUNT '99990.9999'
   #define FMTMNT '99999990.99'
   #define FMTMNTTOT '999999999990.99'
   #define FMTMNTTVA '99999990.99'
#endif

!-----------------------------------------------------------------------
! pour Etat EDTEPR01_FRCMM
!-----------------------------------------------------------------------
#ifdef EDTEPR01_FRCMM
   #define MDL EDTEPR01_frcmm ! Nom du module
   #define TRT TRT2010 ! Code traitement
   #define IDTTYPTCHE_EDT_FAC 'TRT2010'
   #define FMTQTE '99999999990.99'
   #define FMTPRX '99990.99'
   #define FMTPRXUNT '99990.9999'
   #define FMTMNT '99999990.99'
   #define FMTMNTTOT '999999999990.99'
   #define FMTMNTTVA '99999990.99'
#endif

!-----------------------------------------------------------------------
! pour Etat EDTEPR02
!-----------------------------------------------------------------------
#ifdef EDTEPR02
   #define MDL EDTEPR02 ! Nom du module
   #define TRT TRT2006 ! Code traitement
   #define IDTTYPTCHE_EDT_FAC 'TRT2006'
   #define IDTTCHCMP_MAXIGRAPHE 3
   #define FMTQTE '99999999990.99'
   #define FMTPRX '99990.99'
   #define FMTPRXUNT '99990.9999'
   #define FMTMNT '999999990.99'
   #define FMTMNTTOT '999999999990.99'
   #define FMTMNTTVA '99999990.99'
#endif

!-----------------------------------------------------------------------
! pour Etat EDTVNT01
!-----------------------------------------------------------------------
#ifdef EDTVNT01
   #define MDL EDTVNT01 ! Nom du module
   #define TRT TRT2005 ! Code traitement
   #define IDTTYPTCHE_EDT_VNT 'TRT2005'
   #define FMTQTE '99999999.99'
   #define FMTMNT '999999999999.99'
   #define FMTMNTTVA '9999999999.99'
   #define FMTMNTTTC '9999999999999.99'
#endif

#ifdef CTRCNG
   #define MDL CTRCNG  ! Nom du module
   #define TRT TRT9999 ! Code traitement
#endif

#ifdef INTCNG
   #define MDL INTCNG  ! Nom du module
   #define TRT TRT9999 ! Code traitement
#endif

!-----------------------------------------------------------------------
! pour Etat CMMCTR01
!-----------------------------------------------------------------------
#ifdef CMMCTR01
   #define MDL CMMCTR01 ! Nom du module
   #define TRT TRT2033  ! Code traitement
   #define IDTTYPTCHE_EDT_CTR 'TRT2033'
#endif
!-----------------------------------------------------------------------
! pour Etat EDTLFC01
!-----------------------------------------------------------------------
#ifdef EDTLFC01
   #define MDL EDTLFC01 ! Nom du module
   #define TRT TRT2040  ! Code traitement
   #define IDTTYPTCHE_LIS_FAC 'TRT2040'
#endif

#ifdef AFFCNT01
   #define MDL AFFCNT01  ! Nom du module
   #define TRT TRT9999 ! Code traitement
#endif
!-----------------------------------------------------------------------
! pour Etat GD_LIVRE_CLT
!-----------------------------------------------------------------------
#ifdef GD_LIVRE_CLT
   #define MDL GD_LIVRE_CLT ! Nom du module
   #define TRT TRT2036  ! Code traitement
   #define GRAND_LIVRE_CLIENT 'TRT2036'
   #define HCOL1 'Date'
   #define HCOL2 'Type opération'
   #define HCOL3 'N° pièce'
   #define HCOL4 'Débit'
   #define HCOL5_1 'Affecté'
   #define HCOL5_2 '/ débit'
   #define HCOL5_3 'le'
   #define HCOL6_1 'Non'
   #define HCOL7 'Solde'
   #define TITRE 'Compte Client'
   #define TTL_CLT  'Total abonné'
   #define HDG_CTR1 'Sur contrat  '
   #define HDG_CTR0 'Sur compte client'
   #define TTL_CTR1 'Total contrat '
   #define TTL_CTR0 'Reste compte client'
   #define INTDSC 'Montant opération: '
#endif
!-----------------------------------------------------------------------
! pour Etat GD_LIVRE_CLT_CNTOPR
!-----------------------------------------------------------------------
#ifdef GD_LIVRE_CLT_CNTOPR
   #define MDL GD_LIVRE_CLT_CNTOPR ! Nom du module
   #define TRT TRT5000  ! Code traitement
   
#endif
!-----------------------------------------------------------------------
! pour Etat BALANCE_CLIENT
!-----------------------------------------------------------------------
#ifdef BALANCE_CLIENT
   #define MDL BALANCE_CLIENT ! Nom du module
   #define TRT TRT2101  ! Code traitement
   
#endif
!-----------------------------------------------------------------------
! pour Etat EDTRCF01
!-----------------------------------------------------------------------
#ifdef EDTRCF01
   #define MDL EDTRCF01 ! Nom du module
   #define TRT TRT4005  ! Code traitement
   #define IDTTYPTCHE_EDTRCF01 'TRT4005'
#endif
!-----------------------------------------------------------------------
! pour Etat HOPRET01
!-----------------------------------------------------------------------
#ifdef HOPRET01
  #define MDL HOPRET01 ! Nom du module
  #define TRT TRT5003  ! Code traitement
  #define IDTTYPTCHE_TRT 'TRT5003'
#endif

!-----------------------------------------------------------------------
! pour Etat TRTPRL01
!-----------------------------------------------------------------------
#ifdef TRTPRL01
   #define MDL TRTPRL01 ! Nom du module
   #define TRT TRT2041  ! Code traitement
   #define IDTTYPTCHE_TRTPRL01 'TRT2041'
#endif

!--------------------------------------------------------------------
! pour Etat HOPAYRA
!--------------------------------------------------------------------
#ifdef HOPAYRA
  #define MDL HOPAYRA ! Nom du module
  #define TRT TRT5001  ! Code traitement
  #define IDTTYPTCHE_HOPAYRA 'TRT5001'
  #define MODRPT 1
  #define codcol 'W086'
  #define codges 'AAAAA'
#endif

!-----------------------------------------------------------------------
! pour Etat MAJ_COORDBNC
!-----------------------------------------------------------------------
#ifdef MAJ_COORDBNC
  #define MDL MAJ_COORDBNC! Nom du module
  #define TRT TRT5004  ! Code traitement
  #define IDTTYPTCHE_TRT 'TRT5004'
#endif

!-----------------------------------------------------------------------
! pour Etat BRLOPR01
!-----------------------------------------------------------------------
#ifdef BRLOPR01
  #define MDL BRLOPR01! Nom du module
  #define TRT TRT5005  ! Code traitement
  #define IDTTYPTCHE_TRT 'TRT5006'
#endif
 
