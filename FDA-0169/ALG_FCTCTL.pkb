CREATE OR REPLACE PACKAGE BODY "ALG_FCTCTL" IS
  -- ==========================================================================
  -- Creation : 20/10/2008 10h par AAB
  -- ==========================================================================
  -- Package des fonctions de controle
  -- Cas : SEAAL ALGER
  -----------------------------------------------------------------------------
  -----------------------------------------------------------------------------
  -- Maj     : 20/10/2008 14h 50
  -- Par     : AAB
  -- Contenu :
  -----------------------------------------------------------------------------
  -- Maj     : 23/08/2009
  -- Par     : FBE
  -- Contenu : Probleme: plantage X7 lors de retour d'impaye a cause de
  --           l'insertion des lignes de facture en double.
  --           Correction:
  --           Modification de la procedure FRSIMP. Ajout de la table FACTYPHST
  --           dans la requete pour inserer les ligne de factures.
  -----------------------------------------------------------------------------
  -- Maj : 16/09/2009
  -- Par :LLA
  -- Contenu : modification de la fonction Ctrl_Usg_EmpSeaal
  --            - rajout d'un contrôle entre le coefficient multiplicateur et
  --            - l'usage: si usage <> 'ménage collectif" alors coef = 1.
  --            - message blquant
  -----------------------------------------------------------------------------
  -- Maj     : 30/05/2010
  -- Par     : FBE
  -- Contenu : Controles pour les points de comptage general/divisionnaire
  --           - Ajout de procedure CTLPNTCPG
  --           Autre controle necessaire se trouve dans la procedure ALG_CrFctCtrlCTR
  -----------------------------------------------------------------------------
  -- Maj     : 19/06/2010
  -- Par     : FBE
  -- Contenu : Ajout de control sur la fiche compte client pour la qualite payeur
  -- ==========================================================================
  -----------------------------------------------------------------------------
  -- Maj     : 15/08/2011
  -- Par     : FNE
  -- Contenu : Ajout de controle sur case par défaut sur certaines fiches
  -- ==========================================================================
  -----------------------------------------------------------------------------
  -- Maj     : 15/08/2011
  -- Par     : FNE
  -- Contenu : Procédure de controle sur motif d'extraction des contrats
  -- ==========================================================================
  -- Maj     : 08/02/2011
  -- Par     : FNE
  -- Contenu : Procédure de controle sur ouverture de caisse FDA-0039
  -- ==========================================================================
  -- Maj     : 08/02/2011
  -- Par     : FNE
  -- Contenu : Procédure de controle encaissement en espèce FDA-0082
  -- ==========================================================================
  -- Maj     : 15/02/2011
  -- Par     : FNE
  -- Contenu : Procédure de controle FDA-0092
  -- ==========================================================================
  -- Maj     : 27/02/2011
  -- Par     : FNE
  -- Contenu : Correctif Procédure de controle sur ouverture de caisse FDA-0039
  -- ==========================================================================
  -- Maj     : 11/07/2012
  -- Par     : FNE
  -- Contenu : Correctif Procédure de controle sur ouverture de caisse FDA-0039
  -- 2ème correctif
  -- ==========================================================================
  -- Maj     : 11/07/2012
  -- Par     : FNE
  -- Contenu : Correctif Procédure de controle sur ouverture de caisse FDA-0092
  -- 2ème correctif
  -- ==========================================================================
  -- Maj     : 11/07/2012
  -- Par     : FNE
  -- Contenu : Controle Encaissement par CIB FDA-0123
  -- ==========================================================================
  -- INFORMATION
  -- sTypMsg = '0' si on veux envoyer un msg d'erreur;
  -- sTypMsg = '1' si on veux envoyer un msg d'information;
  -- sTypMsg = '2' si on veux envoyer un msg "warning" - demande de confirmation;

  FUNCTION VersionPkg
  -- A MODIFIER A CHAQUE MODIF DU PACKAGE!!!
    --        --------- Version du package utilisé
   RETURN NUMBER IS
  BEGIN
    RETURN 3.44; -- + FDA-0123
  END;

  -----------------------------------------------------------------------------
  -----------------------------------------------------------------------------
  -- Procédure de controle des frais d'impayé
  -- pour l'insertion des frais dans FAC ET LGNFAC
  -----------------------------------------------------------------------------
  -----------------------------------------------------------------------------

  PROCEDURE FrsImp(pIdtClt    IN CLT.IDTCLT%TYPE,
                   sTypMsg    OUT VARCHAR2,
                   sRetFctCtl OUT VARCHAR2) IS
    vIdtCntOpr Clt.IdtCntOpr%TYPE;
    vIdtCodSns Clt.IdtCodSns%TYPE;
    vIdtFac    FAC.IdtFac%TYPE;
    vIdtAgt    AGT.IdtAgt%TYPE;
    vDli       CNTOPR.Dli%TYPE;
    --  vOrdImp
  BEGIN
    -- récupérer l'IdtCntOpr, IdtCodSns et Délai d'exigibilité à partir de CLT
    SELECT CLT.IdtCntOpr, CLT.IdtCodSns, CNTOPR.Dli
      INTO vIdtCntOpr, vIdtCodSns, vDli
      FROM CNTOPR, CLT
     WHERE CLT.IdtClt = pIdtClt
       and CLT.IdtCntOpr = CNTOPR.IdtCntOpr;
    -- récupérer la vIdtFac
    SELECT NUMFAC.NEXTVAL INTO vIdtFac FROM DUAL;
    --SELECT MAX(RBQAPLFACMAN.Ordimp)+1 INTO vOrdImp FROM RBQAPLFACMAN;
    /* ------------------------------------------------------------------------ */
    /* ------------------------------ insérer en FAC -------------------------- */
    ------------------------------------------------------------------------
    INSERT INTO FAC
      (FAC.IdtFac, --seq_fac.nextvalue
       FAC.IdtClt, -- à récupérer à partir de OPR
       FAC.IdtTypFct, -- à vérifier mais il est NULL
       FAC.NumFct, -- non encore validé alors = '1'
       FAC.DatClc, -- date de calcul sysdate
       FAC.DatExg, -- date exigibilité sysdate + 21
       FAC.CodVld, -- 0
       FAC.FctAnn, -- '0'
       FAC.MntHT, -- pMntFrs
       FAC.MntTva, -- à calculer
       FAC.IdtCntOpr, -- à récupérer à partir de la table CLT
       FAC.IdtCodSns, -- à récupérer à partir de la table CLT
       FAC.IdtDvs, -- 'DA'
       FAC.DatCnv, -- Null
       FAC.TitFac, -- Null
       FAC.TitFac2) -- Null
    VALUES
      (vIdtFac,
       pIdtClt,
       '1',
       '1',
       sysdate,
       sysdate + vDli,
       0,
       '0',
       0,
       0,
       vIdtCntOpr,
       vIdtCodSns,
       'DA',
       NULL,
       NULL,
       NULL);
    /* ------------------------------------------------------------------------ */
    /*---------------------- insertion en LGNFAC -----------------------------*/
    /*------------------------------------------------------------------------*/
    INSERT INTO LGNFAC
      (LGNFAC.IdtFac, --NumFac.nextval
       LGNFAC.NumLgnFct, -- un compteur  ordimp à récupérer
       LGNFAC.IdtFacTyp, -- '100'   'FRSIMP'
       LGNFAC.IdtRbq, -- '  idtrbq
       LGNFAC.IdtTax, -- NULL idttax
       LGNFAC.QteFct, -- 1  qte
       LGNFAC.PrxUnt, -- pMntFrs
       LGNFAC.DatDbtPrd, -- Sysdate
       LGNFAC.DatFinPrd, -- Sysdate
       LGNFAC.MntHT, -- pMntFrs
       LGNFAC.MntTva, -- NULL
       LGNFAC.RbqCmm) -- 0
      select vIdtFac,
             ordimp,
             'FRSIMP',
             IdtRbq,
             TAX.IdtTax,
             Qte,
             PrxUnt,
             TRUNC(sysdate),
             TRUNC(sysdate),
             NVL(Qte * PrxUnt, 0),
             NVL(Qte * PrxUnt * (Tau / 100), 0),
             0
        from TAX, RBQAPLFACMAN, FACTYPHST
       where FACTYPHST.IdtFacTyp = 'FRSIMP'
         and RBQAPLFACMAN.IdtTax = TAX.IdtTax(+)
         and FACTYPHST.IdtFacTyp = RBQAPLFACMAN.IdtFacTyp
         and FACTYPHST.DatDbrVld = RBQAPLFACMAN.DatDbtFacTyp
         and FACTYPHST.DatFinVld is null;
    /* ------------------------------------------------------------------------ */
    /* ---------Update en ce qui concerne les montants Ht et Tva---------------*/
    /*------------------------------------------------------------------------*/
    UPDATE FAC
       SET (FAC.MntHt, FAC.MntTva) =
           (SELECT SUM(LGNFAC.MntHt), SUM(LGNFAC.MntTva)
              FROM LGNFAC
             WHERE LGNFAC.IdtFac = vIdtFac),
           FAC.IDTTYPFCT =
           (select idttypfct from MODFACMAN where idtmodfacman = 'FRSIMP')
     WHERE FAC.IdtFac = vIdtFac;

    /* ------------------------------------------------------------------------ */
    /* ----Validation de la facture en faisant appel à TRTFAC01.VALFAC()------*/
    /*------------------------------------------------------------------------*/
    -- récupérer IdtAgt
    SELECT IdtAgt
      INTO vIdtAgt
      FROM AGT
     WHERE AGT.NomCnx = (SELECT user FROM v$database);
    -- récupérer IdtFacOrg : c'est pas une facture alors c'est Null
    TRTFAC01.VALFAC(vIdtFac, TRUNC(sysdate) + vDli, NULL, vIdtAgt, 1);
    ------------------------------------------------------------------------
    ------------------------------------------------------------------------
    sTypMsg    := '1';
    sRetFctCtl := 'Frais d''impayé inséré avec réussite';
  EXCEPTION
    WHEN OTHERS THEN
      sTypMsg := '0';
      -- renvoyer le message d'erreur de l'exception
      sRetFctCtl := SQLERRM;
  END FrsImp;

  -----------------------------------------------------------------------------
  -----------------------------------------------------------------------------
  -- Procédure de controle des frais de transfert de caisse en banque
  -----------------------------------------------------------------------------
  -----------------------------------------------------------------------------
  PROCEDURE FrsTrsBnq(pIdtModRgl IN VARCHAR2,
                      pIdtCss    IN VARCHAR2,
                      pMntDvs    IN VARCHAR2,
                      pIdtBnq    IN VARCHAR2,
                      pIdtGch    IN VARCHAR2,
                      pIdtDvs    IN VARCHAR2,
                      sTypMsg    OUT VARCHAR2,
                      sRetFctCtl OUT VARCHAR2) IS

    vIdtAgt    AGT.IdtAgt%TYPE;
    vMntDvs    LGNCSS.MntDvs%TYPE;
    vIdtLgnCss LGNCSS.IdtLgnCss%TYPE;

    TYPE typVarchar IS TABLE OF VARCHAR2(250) INDEX BY BINARY_INTEGER;
    TYPE typNumber IS TABLE OF NUMBER INDEX BY BINARY_INTEGER;

    tvIdtModRgl typNumber;
    tvMntDvs    typNumber;
    tvIdtDvs    typVarchar;
    vOldPos     NUMBER;
    i           NUMBER;

  BEGIN
    -- gérer la variable vIdtLgnCss
    X7_TRTSEQ01.X7_AttNumLgnCss(100, vIdtLgnCss);
    --

    -- gérer pIdtModRgl
    i       := 0;
    vOldPos := 1;
    LOOP
      i := i + 1;
      IF INSTR(pIdtModRgl, '|', vOldPos) <> 0 THEN
        tvIdtModRgl(i) := SUBSTR(pIdtModRgl,
                                 vOldPos,
                                 INSTR(pIdtModRgl, '|', vOldPos) - vOldPos);
        vOldPos := INSTR(pIdtModRgl, '|', vOldPos) + 1;
      ELSE
        tvIdtModRgl(i) := SUBSTR(pIdtModRgl,
                                 vOldPos,
                                 LENGTH(pIdtModRgl) - vOldPos + 1);
        EXIT;
      END IF;
    END LOOP;

    -- gérer pMntDvs
    i       := 0;
    vOldPos := 1;
    LOOP
      i := i + 1;
      IF INSTR(pMntDvs, '|', vOldPos) <> 0 THEN
        tvMntDvs(i) := to_number(SUBSTR(pMntDvs,
                                        vOldPos,
                                        INSTR(pMntDvs, '|', vOldPos) -
                                        vOldPos));
        vOldPos := INSTR(pMntDvs, '|', vOldPos) + 1;
      ELSE
        tvMntDvs(i) := to_number(SUBSTR(pMntDvs,
                                        vOldPos,
                                        LENGTH(pMntDvs) - vOldPos + 1));
        EXIT;
      END IF;
    END LOOP;
    -- gérer pIdtDvs
    i       := 0;
    vOldPos := 1;
    LOOP
      i := i + 1;
      IF INSTR(pIdtDvs, '|', vOldPos) <> 0 THEN
        tvIdtDvs(i) := SUBSTR(pIdtDvs,
                              vOldPos,
                              INSTR(pIdtDvs, '|', vOldPos) - vOldPos);
        vOldPos := INSTR(pIdtDvs, '|', vOldPos) + 1;
      ELSE
        tvIdtDvs(i) := SUBSTR(pIdtDvs,
                              vOldPos,
                              LENGTH(pIdtDvs) - vOldPos + 1);
        EXIT;
      END IF;
    END LOOP;

    -- gérer pIdtCss

    -- gérer pIdtBnq

    -- gérer pIdtGch

    /*--------------------------------------------------------------
    --------------------------------------------------------------*/

    --recuperer idtagt
    SELECT IdtAgt
      INTO vIdtAgt
      FROM AGT
     WHERE AGT.NomCnx = (SELECT user FROM v$database);
    --recuperer le nombre de decimal pour l'arrondissement
    --SELECT DVS.ArrMnn INTO vArrMnn FROM DVS WHERE DVS.IdtDvs = pIdtDvs
    -- verifier si le mode de reglement correspond aux 1 ou 100

    if pIdtBnq is not null and pIdtGch is not null then

      FOR i IN tvIdtModRgl.FIRST .. tvIdtModRgl.LAST LOOP

        IF tvIdtModRgl(i) IN (1, 100) THEN
          IF tvIdtModRgl(i) = 1 THEN
            --      vMntDvs := (((pMntDvs-MOD(pMntDvs,5000))/5000)*5);
            vMntDvs := ((ceil(ABS(to_number(tvMntDvs(i))) / 5000)) * 5) + 10;
          ELSIF tvIdtModRgl(i) = 100 THEN
            vMntDvs := LEAST(((ceil(ABS(to_number(tvMntDvs(i))) / 10000)) * 10),
                             100);
          END IF;

          INSERT INTO LGNCSS
            (IdtLgnCss,
             IdtModRgl,
             IdtCss,
             IdtAgt,
             IdtDvs,
             IdtTypMvm,
             IdtCntOpr,
             IdtCodSns,
             Agt_IdtAgt,
             DatCrt,
             MntDvs,
             BnqTrs,
             GchTrs)
          VALUES
            (vIdtLgnCss,
             tvIdtModRgl(i),
             pIdtCss,
             vIdtAgt,
             tvIdtDvs(i),
             100, --type de mouvement
             0,
             0,
             vIdtAgt,
             sysdate,
             -vMntDvs,
             pIdtBnq,
             pIdtGch);

        END IF;

      END LOOP;
      sTypMsg    := '1';
      sRetFctCtl := 'Frais de transfert effectués avec succés';
    else
      sTypMsg    := '0';
      sRetFctCtl := 'la banque ou le guiche inconus';
    end if;
  EXCEPTION
    WHEN OTHERS THEN
      sTypMsg    := '0';
      sRetFctCtl := SQLERRM;
  END FrsTrsBnq;

  ----------------------------------
  ----------------------------------
  -- procedure de tests de fonction CmGetRowEditedColumnValues
  ----------------------------------
  PROCEDURE TEST(pMntCss    IN VARCHAR2,
                 sTypMsg    OUT VARCHAR2,
                 sRetFctCtl OUT VARCHAR2) IS

    TYPE typNumber IS TABLE OF NUMBER INDEX BY BINARY_INTEGER;

    tvMntDvs typNumber;
    vOldPos  NUMBER;
    i        NUMBER;
    nbre     NUMBER;

  BEGIN

    -- gérer pMntCss
    i       := 0;
    vOldPos := 1;
    LOOP
      i := i + 1;
      IF INSTR(pMntCss, '|', vOldPos) <> 0 THEN
        tvMntDvs(i) := to_number(SUBSTR(pMntCss,
                                        vOldPos,
                                        INSTR(pMntCss, '|', vOldPos) -
                                        vOldPos));
        vOldPos := INSTR(pMntCss, '|', vOldPos) + 1;
      ELSE
        tvMntDvs(i) := to_number(SUBSTR(pMntCss,
                                        vOldPos,
                                        LENGTH(pMntCss) - vOldPos + 1));
        EXIT;
      END IF;
    END LOOP;

    FOR i IN tvMntDvs.FIRST .. tvMntDvs.LAST LOOP
      nbre := nbre + 1;
    END LOOP;

    sTypMsg    := '1';
    sRetFctCtl := 'Tests effectués avec succés';

  EXCEPTION
    WHEN OTHERS THEN

      sTypMsg    := '0';
      sRetFctCtl := SQLERRM;

  END TEST;

  -----------------------------------------------------------------------------
  -- controle usage - emplyé_seaal
  -----------------------------------------------------------------------------
  Procedure Ctrl_Usg_EmpSeaal(pIdtAcv    AvtCtr.IdtAcv%type,
                              pChp12     AvtCtr.Chp12%type,
                              pCodTypCtr Ctr.codtypctr%type,
                              pCffmlp    avtctr.cffmlp%type,
                              sTypMsg    OUT VARCHAR2,
                              sRetFctCtl OUT VARCHAR2) is
    -- cMsgReturn Sys_Msg.Msg_Code%type;
  BEGIN
    -- 1er contrôle : entre usage et employé seaal
    if pIdtAcv != 'C1' and pChp12 = 1 then
      -- sTypMsg = '0' si on veux envoyer un msg d'erreur;
      -- sTypMsg = '1' si on veux envoyer un msg d'information;
      -- sTypMsg = '2' si on veux envoyer un msg "warnig" - demande de confirmation;
      sTypMsg := '0';
      select msg_libelle
        into sRetFctCtl
        from sys_msg
       where msg_code = 'MsgUsgES_Err001';
    end if;

    -- 2nd contrôle: entre type contrat et coefficient multiplicateur
    if pCodTypCtr <> 'MENCOL' and pCffMlp <> 1 then
      sTypMsg := '0';
      select msg_libelle
        into sRetFctCtl
        from sys_msg
       where msg_code = 'MsgUsgES_Err002';
    end if;
  END;

  -----------------------------------------------------------------------------
  -- controle numéro de chèque / encaissement
  -----------------------------------------------------------------------------
  -----------------------------------------------------------------------------
  procedure ctrl_enc(pModRglLibAbr modrgl.libabr%type,
                     pNumChq       IN OUT lgncss.numchq%type,
                     ptireur       IN VARCHAR2,
                     pbanque       IN VARCHAR2,
                     pguichet      IN VARCHAR2,
                     pinfo         IN VARCHAR2,
                     sTypMsg       OUT VARCHAR2,
                     sRetFctCtl    OUT varchar2) is
    vIdtModRgl modrgl.idtmodrgl%type;
    vLen       integer;
    vMsg1      varchar2(254) := 'La longueur du numéro de chèque est incorrecte';
    vMsg2      varchar2(254) := 'Numéro de chèque incorrect! Il ne doit contenir que des chiffres';
    vMsg3      varchar2(254) := 'Etes-vous sûr que le numéro de chèque est bien ';
    vMsg4      varchar2(254) := 'Veuillez changer le mode de paiement en chèque';
    --vMsg5      varchar2(254) := 'La longueur du numéro de d''autorisation est incorrecte';
    --vMsg6      varchar2(254) := 'Numéro d''autorisation incorrect! Il ne doit contenir que des chiffres';
    vMsg7 varchar2(254) := 'Etes-vous sûr que le numéro d''autorisation est bien ';
    vMsg5 varchar2(254) := 'Merci de vérifier le numéro d''autorisation';

  BEGIN
    -- ----------------------------------------------------------------------------
    -- Pour SEAAL
    -- En cas de mode de règlement par chèque bancaire ou postal,
    -- vérifie que le numéro de chèque est renseigné
    --   - si chèque bancaire, la longueur doit être de 7 chiffres (sauf 0000000)
    --   - si chèque postal, la longueur est soit de 8 ou 10 chiffres
    --     donc, si la longueur est de 8 caractères, on complète à 10
    -- Bloque le processus si la longueur ne remplit pas les conditions ci-dessus
    -- -------------------------------------------------

    SRetFctCtl := null;
    sTypMsg    := null;

    select idtmodrgl
      into vIdtmodrgl
      from X7.modrgl
     where libabr = pModRglLibAbr;

    case
    -- traitement des chèques bancaires
      when vidtmodrgl = 2 THEN
        case
          when length(nvl(pNumChq, '0')) <> 7 then
            sTypmsg    := '0';
            sRetFctCtl := vMsg1;
          else
            -- Pour vérifier si la chaîne saisie est un chiffre,on transforme
            -- tousles chiffres en espace. Donc, pour éviter qu'un petit rigolo
            -- saisisse que des espaces pour tricher, on contrôle la chaîne sur
            -- ce critère.
            case --when pNumChq = '      ' Then
            --     sTypmsg := '0';
            --     sRetFctCtl := vMsg2;
              when replace(translate(replace(pNumchq, ' ', 'x'),
                                     '0123456789',
                                     '         '),
                           ' ',
                           null) is not null then
                sTypmsg    := '0';
                sRetFctCtl := vMsg2;
              when pNumChq in ('0000000',
                               '1111111',
                               '2222222',
                               '3333333',
                               '4444444',
                               '5555555',
                               '6666666',
                               '7777777',
                               '8888888',
                               '9999999') then
                sTypMsg    := '2';
                sRetFctCtl := vMsg3 || pNumChq || ' ?';
              else
                null;
            end case;
        end case;

    -- traitement des chèques postaux
      when vIdtModRgl = 102 THEN
        vLen := length(nvl(pNumChq, '0'));
        -- on traite chaque longueur
        case
          when vLen <> 10 AND vLen <> 8 THEN
            sTypmsg    := '0';
            sRetFctCtl := vMsg1;
          else
            if replace(translate(replace(pNumchq, ' ', 'x'),
                                 '0123456789 ',
                                 '         '),
                       ' ',
                       null) is not null then
              sTypmsg    := '0';
              sRetFctCtl := vMsg2;
            else
              case
                when pNumChq = '          ' or pNumChq = '        ' Then
                  sTypmsg    := '0';
                  sRetFctCtl := vMsg2;
                else
                  if vLen = 8 then
                    if pNumChq in ('00000000',
                                   '11111111',
                                   '22222222',
                                   '33333333',
                                   '44444444',
                                   '55555555',
                                   '66666666',
                                   '77777777',
                                   '88888888',
                                   '99999999') then
                      pNumChq    := lpad(pNumchq, 10, '0');
                      sTypMsg    := '2';
                      sRetFctCtl := vMsg3 || pNumChq || ' ?';
                    else
                      pNumChq := lpad(pNumchq, 10, '0');
                    end if;
                  else
                    if substr(pNumChq, 3) in
                       ('00000000',
                        '11111111',
                        '22222222',
                        '33333333',
                        '44444444',
                        '55555555',
                        '66666666',
                        '77777777',
                        '88888888',
                        '99999999') then
                      sTypMsg    := '2';
                      sRetFctCtl := vMsg3 || pNumChq || ' ?';
                    else
                      pNumChq := lpad(pNumchq, 10, '0');
                    end if;
                  end if;
              end case;
            end if;
        end case;

    -- traitement des règlmements en espèces
      when vIdtModRgl = 1 THEN
        if trim(pNumChq || ptireur || pbanque || pguichet || pinfo) is not null then
          sTypmsg    := '0';
          sRetFctCtl := vMsg4;
        end if;
        -- traitement des règlements CIB
      when vidtmodrgl = 107 THEN
        case
          when length(nvl(pNumChq, '0')) <> 6 then
            sTypmsg    := '0';
            sRetFctCtl := vMsg5;
          else
            -- Pour vérifier si la chaîne saisie est un chiffre,on transforme
            -- tousles chiffres en espace. Donc, pour éviter qu'un petit rigolo
            -- saisisse que des espaces pour tricher, on contrôle la chaîne sur
            -- ce critère.
            case --when pNumChq = '      ' Then
            --     sTypmsg := '0';
            --     sRetFctCtl := vMsg2;
              when replace(translate(replace(pNumchq, ' ', 'x'),
                                     '0123456789',
                                     '         '),
                           ' ',
                           null) is not null then
                sTypmsg    := '0';
                sRetFctCtl := vMsg5;
              when pNumChq in ('000000',
                               '111111',
                               '222222',
                               '333333',
                               '444444',
                               '555555',
                               '666666',
                               '777777',
                               '888888',
                               '999999') then
                sTypMsg    := '2';
                sRetFctCtl :=  /* vMsg5; --*/
                 vMsg7 || pNumChq || ' ?';
              else
                null;
            end case;
        end case;

      else
        null;
    end case;

  exception
    when NO_DATA_FOUND then
      sRetFctCtl := 'toto';
      sTypMsg    := '0';
    when others then
      sRetFctCtl := '*' ||
                    ltrim(translate(pNumchq, '0123456789', '         ')) || '*';
      sTypMsg    := '0';
  END ctrl_enc;
  -----------------------------------------------------------------------------
  -----------------------------------------------------------------------------
  -- Procédure de controle sur le point de comptage pour les compteurs
  -- general/divisionnaires
  -----------------------------------------------------------------------------
  -----------------------------------------------------------------------------
  PROCEDURE CtlPntCpg(pIdtPntLvr IN PNTLVR.IdtPntLvr%TYPE,
                      pIdtPntCpg IN PNTCPG.IdtPntCpg%TYPE,
                      pTypCpg    IN TYPCPG.TypCpg%TYPE,
                      sTypMsg    OUT VARCHAR2,
                      sRetFctCtl OUT VARCHAR2) is
    vNbr       number;
    vCodMsg    SYS_MSG.MSG_CODE%TYPE;
    vIdtTypCpg TYPCPG.IdtTypCpg%TYPE;
  BEGIN
    sTypMsg    := null;
    sRetFctCtl := null;
    select IdtTypCpg into vIdtTypCpg from TYPCPG where TypCpg = pTypCpg;
    -- En cas de point de comptage normal, on verifie s'il existe un point de comptage general
    -- Si c'est le cas, on fait un warning a l'utilisateur
    if vIdtTypCpg = 2 then
      select count(*)
        into vNbr
        from PNTCPG
       where PNTCPG.IdtPntLvr = pIdtPntLvr
         and PNTCPG.IdtTypCpg = 3;
      if vNbr > 0 then
        vCodMsg := 'ALR_CPGGNR0001';
        sTypMsg := '2';
      end if;
    end if;
    -- Traitement du message
    if vCodMsg is not null then
      sRetFctCtl := TRTMSG01.ChercheMsg(vCodMsg);
    end if;
  END CtlPntCpg;
  -----------------------------------------------------------------------------
  -----------------------------------------------------------------------------
  -- Procédure de controle sur la fiche compte client
  -- pour la qualite payeur
  -----------------------------------------------------------------------------
  -----------------------------------------------------------------------------
  PROCEDURE CTLCPTCLT(pIdtClt    in CLT.IdtClt%TYPE,
                      pQltPyr    in CLT.QltPyr%type,
                      sTypMsg    OUT VARCHAR2,
                      sRetFctCtl OUT VARCHAR2) is
    vOldQltPyr CLT.QltPyr%TYPE;
    vIdtCnt    CNT.IdtCnt%TYPE;
    vIdtAgt    AGT.IdtAgt%TYPE;
  BEGIN
    sTypMsg    := null;
    sRetFctCtl := null;
    select IdtAgt into vIdtAgt from AGT where NomCnx = user;
    select nvl(QltPyr, 'zz'), SqcCnt + 1
      into vOldQltPyr, vIdtCnt
      from CLT
     where IdtClt = pIdtClt;
    if vOldQltPyr <> nvl(pQltPyr, 'zz') then
      -- La nouvelle qualite payeur ne peut pas etre nulle
      if pQltPyr is null then
        sTypMsg    := '0';
        sRetFctCtl := TRTMSG01.ChercheMsg('MSGQLTPYR_ERR0001');
        return;
        -- Seul le passage en 'F' est autorisé
      elsif vOldQltPyr = 'R' and pQltPyr <> 'F' then
        sTypMsg    := '0';
        sRetFctCtl := TRTMSG01.ChercheMsg('MSGQLTPYR_ERR0002');
        sRetFctCtl := replace(sRetFctCtl, ':OldQltPyr', vOldQltPyr);
        sRetFctCtl := replace(sRetFctCtl, ':NewQltPyr', pQltPyr);
        return;
        -- On ne peut pas changer manuellement une fois que l'on est en F
      elsif vOldQltPyr = 'F' then
        sTypMsg    := '0';
        sRetFctCtl := TRTMSG01.ChercheMsg('MSGQLTPYR_ERR0002');
        sRetFctCtl := replace(sRetFctCtl, ':OldQltPyr', vOldQltPyr);
        sRetFctCtl := replace(sRetFctCtl, ':NewQltPyr', pQltPyr);
        return;
        -- si la qualité est 'S', on ne peut passer qu'en 'F'
      elsif vOldQltPyr = 'S' and pQltPyr <> 'F' then
        sTypMsg    := '0';
        sRetFctCtl := TRTMSG01.ChercheMsg('MSGQLTPYR_ERR0002');
        sRetFctCtl := replace(sRetFctCtl, ':OldQltPyr', vOldQltPyr);
        sRetFctCtl := replace(sRetFctCtl, ':NewQltPyr', pQltPyr);
        return;
        -- on interdit toute autre lettre/nombre que A,B,C,D,F,R,S
      elsif pQltPyr not in ('A', 'B', 'C', 'D', 'R', 'S', 'F') then
        sTypMsg    := '0';
        sRetFctCtl := TRTMSG01.ChercheMsg('MSGQLTPYR_ERR0002');
        sRetFctCtl := replace(sRetFctCtl, ':OldQltPyr', vOldQltPyr);
        sRetFctCtl := replace(sRetFctCtl, ':NewQltPyr', pQltPyr);
        return;

      end if;
      ALG_TrtQltPyr.CrCnt(vIdtAgt,
                          pIdtClt,
                          null,
                          vIdtCnt,
                          vOldQltPyr,
                          pQltPyr);
      update CLT set SqcCnt = vIdtCnt where IdtClt = pIdtClt;
    end if;
  END CTLCPTCLT;
  -----------------------------------------------------------------------------
  -----------------------------------------------------------------------------
  -- Procédure de controle sur la facture manuelle
  -- pour interdire montant = 0
  -----------------------------------------------------------------------------
  -----------------------------------------------------------------------------
  PROCEDURE CTLMNTFCTMNL(pMntHt     in fac.mntht%type,
                         sTypMsg    OUT VARCHAR2,
                         sRetFctCtl OUT VARCHAR2) is
  begin
    if pMntHt <= 0 then
      sTypMsg    := '0';
      sRetFctCtl := 'Le montant de la facture doit etre superieur à 0';
    end if;
  end CTLMNTFCTMNL;
  ------------------------------------------------------------------
  -- Agent Affecté obligatoire pour le types de plan INT_E
  ------------------------------------------------------------------
  PROCEDURE CtlTypPlnActAff(pIdtAgtAff in ActCrs.IdtAgtAff%TYPE,
                            pIdtPlnAct in PlnAct.Idtplnact%type,
                            sTypMsg    OUT VARCHAR2,
                            sRetFctCtl OUT VARCHAR2) is
    vTypPln TypPln.Typpln%type;
  begin
    begin
      select TypPln
        into vTypPln
        from typpln, PlnAct
       where TypPln.Idttyppln = PlnAct.Idttyppln
         and PlnAct.Idtplnact = pIdtPlnAct;
    exception
      when others then
        sTypMsg    := '0';
        sRetFctCtl := 'Erreur !!!';
        return;
    end;
    if vTypPln = 'INT_E' and pIdtAgtAff is null then
      sTypMsg    := '0';
      sRetFctCtl := 'L''agent affecté doit etre renseigné pour ce type de plan';
      return;
    end if;
  end;

  ------------------------------------------------------------------
  -- Désactiver case par défaut dans certains filtres
  ------------------------------------------------------------------
  PROCEDURE CHKDFTFLT(pChkBox    in VARCHAR2,
                      sTypMsg    OUT VARCHAR2,
                      sRetFctCtl OUT VARCHAR2) is
  begin
    if pChkBox = '1' then
      sTypMsg    := '0';
      sRetFctCtl := 'L''enregistrement d''un filtre par défaut n''est pas autorisé';
      return;
    end if;
  end CHKDFTFLT;

  -----------------------------------------------------------------------------
  -----------------------------------------------------------------------------
  -- Procédure de controle sur motif d'extraction des contrats
  -----------------------------------------------------------------------------
  -----------------------------------------------------------------------------
  PROCEDURE CTLMTFEXT(pIdtMtfExt in VARCHAR2,
                      sTypMsg    OUT VARCHAR2,
                      sRetFctCtl OUT VARCHAR2) is
  begin
    if pIdtMtfExt is null then
      sTypMsg    := '0';
      sRetFctCtl := 'Le motif d''extraction est obligatoire';
      return;
    end if;
  end CTLMTFEXT;
  -----------------------------------------------------------------------------
  -----------------------------------------------------------------------------
  -- Procédure de controle Accès aux caisses
  -----------------------------------------------------------------------------
  -----------------------------------------------------------------------------
  PROCEDURE CtlChgCss(pIdtCss    in varchar2,
                      sTypMsg    OUT VARCHAR2,
                      sRetFctCtl OUT VARCHAR2) is
    vIdtCntOpr CntOpr.IdtCntOpr%type;
    vAntAgt    Str.Idtstr%type;
    vAntCss    Str.Idtstr%type;
  begin
    begin
      select distinct substr(strAgt.idtstr,
                             1,
                             instr(strAgt.idtstr, '-', 1, 3) - 1) AntAgt,
                      substr(strCss.idtstr,
                             1,
                             instr(strCss.idtstr, '-', 1, 3) - 1) AntCss
        into vAntAgt, vAntCss
        from str stragt, agt, Css, str strcss
       where agt.idtStr = Stragt.idtStr
         and Css.idtCss = pIdtCss
         and css.idtstr = strcss.idtstr
         and nomcnx = USER;
    exception
      when no_data_found then
        sTypMsg    := '0';
        sRetFctCtl := 'Vous n''êtes pas autorisé à ouvrir cette caisse';
    end;
    if (vAntAgt != vAntCss) then
      sTypMsg    := '0';
      sRetFctCtl := 'Vous n''êtes pas autorisé à ouvrir cette caisse';
    end if;
    return;
  end CtlChgCss;

  -----------------------------------------------------------------------------
  PROCEDURE CtlActAff(pIdtAgtAff in ActCrs.IdtAgtAff%TYPE,
                      pIdtPlnAct in PlnAct.Idtplnact%type,
                      pIdtAff    in Aff.IdtAff%Type,
                      pIdtACtCrs in ACtCrs.IdtActCrs%Type,
                      pIdtRet    ActCrs.Idtret%Type,
                      sTypMsg    OUT VARCHAR2,
                      sRetFctCtl OUT VARCHAR2) is
    vTypPln    TypPln.Typpln%type;
    vIdtAgt    Agt.IdtAgt%type;
    vIdtStr    Str.Idtstr%type;
    vIdtStrAgt Str.Idtstr%type;
    vIdtRet    Ret.Idtret%type;
    vIdtRetCol Ret.Idtret%type;
    vLibAction varchar2(50);
    vdrnact    boolean := false;
    vIdtActcrs ActCrs.Idtactcrs%Type;
    vTypCnt    Typcnt.Typcnt%Type;
  begin
    --------------------------------------------------------------------------------
    --- Controle sur l'agent affecté pour les plans du type INT_E / sur fenetre Action
    --------------------------------------------------------------------------------
    begin
      select TypPln
        into vTypPln
        from typpln, PlnAct
       where TypPln.Idttyppln = PlnAct.Idttyppln
         and PlnAct.Idtplnact = pIdtPlnAct;
    exception
      when others then
        sTypMsg    := '0';
        sRetFctCtl := 'Erreur !!!';
        return;
    end;
    if vTypPln = 'INT_E' and pIdtAgtAff is null then
      sTypMsg    := '0';
      sRetFctCtl := 'L''agent affecté doit etre renseigné pour ce type de plan';
      return;
    end if;

    --------------------------------------------------------------------------------
    --- Controle sur Ignorer l'action initiée PRC par un autre agent non PRC
    --------------------------------------------------------------------------------
    SELECT IdtStr INTO vIdtStrAgt FROM AGT WHERE nomcnx = USER;

    begin
      Select IdtStr, TypCnt
        INTO vIdtStr, vTypCnt
        from Agt, Cnt, Aff, typCnt
       where Cnt.IdtClt = aff.Idtclt
         and Cnt.IdtCnt = aff.idtcnt
         and Agt.IdtAgt = Cnt.IdtAgt
         and Aff.Idtaff = pIdtAff
         and Cnt.Idttypcnt = Typcnt.Idttypcnt;
    exception
      /* cas de l'enregistrement initial de l'affaire*/
      when no_data_found then
        null;
      when others then
        sTypMsg    := '0';
        sRetFctCtl := 'Erreur inconnue:' || sqlerrm;
    end;
    begin
      select idtactcrs
        into vIdtActcrs
        from actcrs
       where idtactcrs =
             (select idtactcrs
                from actcrs
               where idtaff = pIdtAff
                 and actcrs.numord =
                     (select max(numord) from actcrs where idtaff = pIdtAff));
      if vIdtActcrs = pIdtActCrs then
        vdrnact := true;
      end if;
    exception
      when no_data_found then
        vdrnact := false;
    end;

    case
      when pidtRet in (0, 1) then
        vLibAction := 'terminer';

      when pidtRet in (2, 3) then
        vLibAction := 'forcer';

      when pidtRet = 6 then
        vLibAction := 'ignorer';

      when pidtRet = 7 then
        vLibAction := 'abandonner';
      else
        vLibAction := '';
    end case;
    if vIdtStr = 'DC-PRC' and vIdtStr != vIdtStrAgt and
       substr(vTypCnt, 1, 2) = 'C_' and pidtRet in (0, 1, 2, 3, 6, 7) and
       vdrnact then
      sTypMsg    := '0';
      sRetFctCtl := 'Vous n''êtes pas autorisé à ' || vLibAction ||
                    ' une action dont le contact de l''affaire a été créé par un agent du Pôle RC';

    end if;
    return;
  end CtlActAff;

  -----------------------------------------------------------------------------
  -----------------------------------------------------------------------------
  -- Procédure de controle sur la cloture des contacts initiés
  -- par des agents PRC
  -----------------------------------------------------------------------------
  -----------------------------------------------------------------------------
  PROCEDURE CtlCntPrc(pIdtClt    IN VARCHAR2,
                      pIdtCnt    IN VARCHAR2,
                      pDatFinCnt IN DATE,
                      pCntTld    in Cnt.Cnttld%Type,
                      sTypMsg    OUT VARCHAR2,
                      sRetFctCtl OUT VARCHAR2) is
    vIdtAgt    Agt.IdtAgt%type;
    vIdtStr    Str.Idtstr%type;
    vIdtStrAgt Str.Idtstr%type;
    err        boolean := false;
    vTypCnt    Typcnt.Typcnt%Type;
  begin

    SELECT IdtStr INTO vIdtStrAgt FROM AGT WHERE nomcnx = USER;
    begin
      Select IdtStr, TypCnt
        INTO vIdtStr, vTypCnt
        from Agt, Cnt, typCnt
       where Cnt.IdtClt = pIdtClt
         and Cnt.IdtCnt = pIdtCnt
         and Agt.IdtAgt = Cnt.IdtAgt
         and Cnt.Idttypcnt = Typcnt.Idttypcnt;
    exception
      when NO_DATA_FOUND then
        null;
    end;

    if pDatFinCnt is not null and vIdtStr = 'DC-PRC' and
       vIdtStr != vIdtStrAgt and substr(vTypCnt, 1, 2) = 'C_' then
      sTypMsg    := '0';
      sRetFctCtl := 'Vous n''êtes pas autorisé à clore un contact créé par un agent du Pôle RC';
      return;
    end if;
    if pCntTld is not null then
      case
        when length(pCntTld) = 12 and fmtnumtel(pCntTld) = pCntTld and
             substr(pCntTld, 1, 2) in ('02', '03', '04') then
          err := true;
        when fmtnumtel(pCntTld) = pCntTld and length(pCntTld) = 13 and
             substr(pCntTld, 1, 2) in ('05', '06', '07') then
          err := true;
        else
          sTypMsg    := '0';
          sRetFctCtl := 'Format du numéro de téléphone du contact : ' ||
                        chr(13) || '          02x-xx-xx-xx' || chr(13) ||
                        '          03x-xx-xx-xx' || chr(13) ||
                        '          04x-xx-xx-xx' || chr(13) ||
                        '          05xx-xx-xx-xx' || chr(13) ||
                        '          06xx-xx-xx-xx' || chr(13) ||
                        '          07xx-xx-xx-xx';
          err        := true;
      end case;
    end if;
    if err then
      return;
    end if;
  end CTLCNTPRC;
  -----------------------------------------------------------------------------
  -----------------------------------------------------------------------------
  -----------------------------------------------------------------------------
  -- Procédure de controle sur la cloture des affaires dont les contacts initiés
  -- par des agents PRC
  -----------------------------------------------------------------------------
  -----------------------------------------------------------------------------
  PROCEDURE CTLAffCntPrc(pidtAff    in varchar2,
                         pidtmtffin in varchar2,
                         pColVal    in varchar2,
                         sTypMsg    OUT VARCHAR2,
                         sRetFctCtl OUT VARCHAR2) is

    vIdtAgt    Agt.IdtAgt%type;
    vIdtStr    Str.Idtstr%type;
    vIdtStrAgt Str.Idtstr%type;
    vIdtRet    Ret.Idtret%type;
    vIdtRetCol Ret.Idtret%type;
    vLibAction varchar2(50);
    vTypCnt    Typcnt.Typcnt%Type;
		vIdtTypPln TypPln.Idttyppln%type;
  begin
    SELECT IdtStr INTO vIdtStrAgt FROM AGT WHERE nomcnx = USER;
    begin
      Select IdtStr, TypCnt
        INTO vIdtStr, vTypCnt
        from Agt, Cnt, Aff, TypCnt
       where Cnt.IdtClt = aff.Idtclt
         and Cnt.IdtCnt = aff.idtcnt
         and Agt.IdtAgt = Cnt.IdtAgt
         and Aff.Idtaff = pIdtAff
         and Cnt.Idttypcnt = Typcnt.Idttypcnt;
    exception
      /* cas de l'enregistrement initial de l'affaire*/
      when no_data_found then
        null;
      when others then
        sTypMsg    := '0';
        sRetFctCtl := 'Erreur inconnue:' || sqlerrm;
    end;
    if pidtmtffin is not null and vIdtStr = 'DC-PRC' and
       vIdtStr != vIdtStrAgt and substr(vTypCnt, 1, 1) = 'C' then
      sTypMsg    := '0';
      sRetFctCtl := 'Vous n’êtes pas autorisé à abandonner une affaire dont le contact a été créé par un agent du Pôle RC';
      return;
    end if;
    begin
      select nvl(idtRet, -1)
        into vIdtRet
        from actcrs
       where idtactcrs =(select idtactcrs
                from actcrs
               where idtaff = pIdtAff
                 and actcrs.numord =
                     (select max(numord) from actcrs where idtaff = pIdtAff));
    exception
      /* cas de l'enregistrement initial de l'affaire*/
      when no_data_found then
        null;
      when others then
        sTypMsg    := '0';
        sRetFctCtl := 'Erreur inconnue:' || sqlerrm;
    end;

    vidtRetCol := to_number(substr(pColVal, instr(pColVal, '|', -1, 1) + 1));

    if (vidtret in (-1, 4, 8)) and (vidtRetCol in (0, 6, 7)) and
       vIdtStr = 'DC-PRC' and vIdtStr != vIdtStrAgt and substr(vTypCnt, 1, 1) = 'C' then

      case
        when vidtRetCol = 0 then
          vLibAction := 'terminer';
        when vidtRetCol = 6 then
          vLibAction := 'ignorer';
        when vidtRetCol = 7 then
          vLibAction := 'abandonner';
      end case;
      sTypMsg    := '0';
      sRetFctCtl := 'Vous n''êtes pas autorisé à ' || vLibAction ||
                    ' une action dont le contact de l''affaire a été créé par un agent du Pôle RC';
    end if;
		/* Controle sur le motif de fin d'affaire*/
    begin
      Select TypPln.IdttypPln
        into vIdtTypPln
        from aff, plnact, typpln
       where aff.idtplnact = plnact.idtPlnAct
         and PlnAct.Idttyppln = TypPln.Idttyppln
         and Aff.Idtaff = pidtAff;

    exception
      when no_data_found then
        null;
    end;

    if (pidtmtffin not in ('NVIS', 'RAI', 'ACAC', 'CIMP', 'RECEC', 'BLPDAR', 'CMADM') and
       vIdtTypPln = '4') or
       (pidtmtffin in ('NVIS', 'RAI', 'ACAC', 'CIMP', 'RECEC') and
       vIdtTypPln != '4') then
      sTypMsg    := '0';
      sRetFctCtl := 'Vous n''avez pas le droit de choisir ce motif pour abandonner ce type de PDA';
    end if;
    return;
  end CTLAFFCNTPRC;

  PROCEDURE CtlClt(pIdtClt    in Clt.IdtClt%type,
                   pTlp       in Clt.Tlp%type,
                   pTld       in Clt.Tld%type,
                   pTlb       in Clt.Tlb%type,
                   sTypMsg    OUT VARCHAR2,
                   sRetFctCtl OUT VARCHAR2) is
    err boolean := false;
  begin
    ----------------- Controle N° Téléphones ------------------------------------
    if pTlp is not null then
      if fmtnumtel(ptlp) != pTlp or length(ptlp) != 13 or
         substr(pTlp, 1, 2) not in ('05', '06', '07') then
        sTypMsg    := '0';
        sRetFctCtl := 'Format du numéro de téléphone portable : ' ||
                      chr(13) || '          05xx-xx-xx-xx' || chr(13) ||
                      '          06xx-xx-xx-xx' || chr(13) ||
                      '          07xx-xx-xx-xx';
        err        := true;
      end if;
    end if;
    if pTlb is not null then
      case
        when length(ptlb) = 12 and fmtnumtel(ptlb) = pTlb and
             substr(pTlb, 1, 2) in ('02', '03', '04') then
          err := true;
        when fmtnumtel(ptlb) = pTlb and length(ptlb) = 13 and
             substr(pTlb, 1, 2) in ('05', '06', '07') then
          err := true;
        else
          sTypMsg    := '0';
          sRetFctCtl := 'Format du numéro de téléphone du bureau : ' ||
                        chr(13) || '          02x-xx-xx-xx' || chr(13) ||
                        '          03x-xx-xx-xx' || chr(13) ||
                        '          04x-xx-xx-xx' || chr(13) ||
                        '          05xx-xx-xx-xx' || chr(13) ||
                        '          06xx-xx-xx-xx' || chr(13) ||
                        '          07xx-xx-xx-xx';
          err        := true;
      end case;
    end if;
    if pTld is not null then
      if fmtnumtel(ptld) != pTld or length(ptld) != 12 or
         substr(pTld, 1, 2) not in ('02', '04', '03') then
        sTypMsg    := '0';
        sRetFctCtl := 'Format du numéro de téléphone du domicile : ' ||
                      chr(13) || '          02x-xx-xx-xx' || chr(13) ||
                      '          03x-xx-xx-xx' || chr(13) ||
                      '          04x-xx-xx-xx';
        err        := true;
      end if;
    end if;
    if err then
      return;
    end if;
  end CTLCLT;

  PROCEDURE CtlAgtSml(pIdtAgtSui IN VARCHAR2,
                      sTypMsg    OUT VARCHAR2,
                      sRetFctCtl OUT VARCHAR2) is
    vIdtAgt Agt.IdtAgt%type;
  begin
    begin
      Select Idtagt into vIdtAgt from agt where idtagt = pIdtAgtSui;
    exception
      when NO_DATA_FOUND then
        sTypMsg    := '0';
        sRetFctCtl := 'Le Code de l''agent est erroné';
    end;
    return;
  end CtlAgtSml;
  -------------------------------------------------------------------------------------------------
  PROCEDURE CTLInt(pIdtInt    in X7.Int.idtInt%TYPE,
                   pAct       CtlAct.Act%Type,
                   pCodMotif  Typostd.Typostd%Type,
                   sTypMsg    OUT VARCHAR2,
                   sRetFctCtl OUT VARCHAR2) is
    vTypPln    TypPln.Typpln%type;
    vIdtAgtAff actcrs.idtagtaff%type;
    vIdtAgt    Agt.IdtAgt%type;
    vIdtStr    Str.Idtstr%type;
    vIdtStrAgt Str.Idtstr%type;
    vSta       staint.idtsta%type;
  begin
    /*Affactation obligatoire de l'agent pour le TypPln INT_E*/
    begin
      select TypPln, idtagtaff
        into vTypPln, vIdtAgtAff
        from typpln, PlnAct, actcrs, aff, int
       where TypPln.Idttyppln = PlnAct.Idttyppln
         and actcrs.idtaff = aff.idtaff
         and aff.idtplnact = Plnact.Idtplnact
         and actcrs.idtint = int.idtInt
         and int.idtInt = pIdtInt;
    exception
      when no_data_found then
        null;
      when others then
        sTypMsg    := '0';
        sRetFctCtl := 'Erreur !!!';
        return;
    end;
    if vTypPln = 'INT_E' and vIdtAgtAff is null then
      sTypMsg    := '0';
      sRetFctCtl := 'L''agent affecté doit etre renseigné pour ce type de plan';
      return;
    end if;
    /* Controle Reconnexion*/
    if pAct = 'RECONN' and pCodMotif not in ('SuCoDC', 'SuCoIm') then
      sTypMsg    := '0';
      sRetFctCtl := 'Motif incompatible avec Nature';
      return;
    else
      if pAct = 'RECONN' and pCodMotif is null then
        sTypMsg    := '0';
        sRetFctCtl := 'le motif doit être renseigné';
        return;
      end if;
    end if;

  end CTLInt;
  -----------------------------------------------------------------------------
  PROCEDURE ctlcri(pact IN ctlact.act%TYPE,
									 pIdtpntlvr    IN pntlvr.idtpntlvr%TYPE,
									 pidtpntcpg IN pntcpg.idtpntcpg%TYPE,
                   stypmsg    OUT VARCHAR2,
                   sretfctctl OUT VARCHAR2) IS
    nbrcpr number;
  BEGIN
    IF pact = 'POSCPR' THEN
      SELECT nvl(COUNT(*), 0)
        INTO nbrcpr
        FROM cprpntcpg
       WHERE idtpntlvr = pidtpntlvr
         AND idtpntcpg = pidtpntcpg
         AND datdps IS NULL;

      IF nbrcpr > 1 THEN
        stypmsg    := '0';
        sretfctctl := 'Vous ne nous pouvez pas poser plus d 1 compteur sur un point de comptage' ;
                     --sretfctctl := pAct || ' - ' || pIdtPntLvr ||' / '||pidtpntcpg ||' noombre de compteurs: '||nbrcpr;
		     --sretfctctl:='Ce Point de comptage possède déja un compteur posé';
        RETURN;
      END IF;
    END IF;
  END ctlcri;

PROCEDURE ctlfacinter(pidtctr    in Varchar2,
                        datdebprd  in Varchar2,
                        stypmsg    OUT VARCHAR2,
                        sretfctctl OUT VARCHAR2) IS
    vcopr varchar2(7);
  BEGIN
    select idtcntopr into vcopr from ctr where idtctr = pidtctr;
    if (datdebprd > sysdate and vcopr <> '43') then
      sTypMsg    := '0';
      sRetFctCtl := 'Vous n’êtes pas autorisés à lancer la facturation en avance !';
    end if;

  END ctlfacinter;

PROCEDURE CtlSviLot(pIdtTypTche IN VARCHAR2,
                      pPrm1       in varchar2,
                      sTypMsg     OUT VARCHAR2,
                      sRetFctCtl  OUT VARCHAR2) is
    vIdtTypTche typtche.idttyptche%type;
    vPrm1       tche.prm1%type;
    vDateDebLot Date;
    vIdtCntOpr  CntOpr.Idtcntopr%type;

  begin
    /*vIdtTypTche := substr(substr(pIdtTypTche,
           instr(pIdtTypTche, '|', -1, 2) + 1),
    1,
    instr(substr(pIdtTypTche,
                 instr(pIdtTypTche, '|', -1, 2) + 1),
          '|',
          1,
          1) - 1);*/
    vIdtTypTche := substr(pIdtTypTche, instr(pIdtTypTche, '|', -1, 1) + 1);
    /*vPrm1       := substr(substr(pPrm1, instr(pPrm1, '|', -1, 2) + 1),
    1,
    instr(substr(pPrm1, instr(pPrm1, '|', -1, 2) + 1),
          '|',
          1,
          1) - 1);*/
    vPrm1 := substr(pPrm1, instr(pPrm1, '|', -1, 1) + 1);
    begin
      select to_date(substr(to_char(prmjou, '09'), 2) ||
                     substr(to_char(prmmoi, '09'), 2) || ann,
                     'DDMMYYYY'),
             Lotfac.Idtcntopr
        into vDateDebLot, vIdtCntOpr
        from lotfac, prdfac
       where idtlotfac = vPrm1
         and lotfac.idtprdfac = prdfac.idtprdfac
         and lotfac.idtcycfac = prdfac.idtcycfac;
    exception
      when no_data_found then
        null;
      when others then
        sTypMsg    := '0';
        sRetFctCtl := 'Erreur !!! ' || sqlerrm || ' prm1=' || vPrm1 ||
                      ' TypTche=' || vIdtTypTche;
    end;
        if vIdtTypTche in ( 'TRT2018', 'TRT2019','TRT2008','TRT2012', 'TRT2005', 'TRT2030') and vIdtCntOpr!='43'
    and sysdate < vDateDebLot then
    sTypMsg    := '0';
    /* pour débogage*/
		/*sRetFctCtl := 'Type Tache: ' || vIdtTypTche || ' Lot: ' || vPrm1 ||
                  'Date Lot: ' || vDateDebLot;*/
    sRetFctCtl := 'Vous n’êtes pas autorisés à lancer la facturation en avance!';
        end if;
    return;
  end CtlSviLot;

Procedure CtlCpr(pIdtTypCpr in Varchar2,
                   pNumCpr    in varchar2,
                   sTypMsg    OUT VARCHAR2,
                   sRetFctCtl OUT VARCHAR2) is
    vDmt typcpr.Dmt%type;
    vMrq typcpr.mrq%type;
  begin
    select Dmt, mrq
      into vDmt, VMrq
      from TypCpr
     where idtTypCpr = pIdtTypCpr;

    if vMrq = 'SENSUS' then
      case
        when vDmt = 15 then
          if not
              regexp_like(pnumcpr, '^(1|x)[[:digit:]]{2}PA[[:digit:]]{6}$') then
            sTypMsg    := '0';
            sRetFctCtl := 'Format du numéro de compteur incorrect : ' ||
                          chr(13) ||
                          'voici un exemple de nom de compteur pour le diamètre 15 ' ||
                          chr(13) || '          114PAxxxxxx' || chr(13) ||
                          'Sachant que xxxxxx est le numéro de série du compteur en question';
          end if;
        when vDmt = 20 then
          if not regexp_like(pnumcpr, '^1[[:digit:]]{2}PB[[:digit:]]{6}$') then
            sTypMsg    := '0';
            sRetFctCtl := 'Format du numéro de compteur incorrect : ' ||
                          chr(13) ||
                          'voici un exemple de nom de compteur pour le diamètre 15 ' ||
                          chr(13) || '          114PBxxxxxx' || chr(13) ||
                          'Sachant que xxxxxx est le numéro de série du compteur en question';
          end if;
        when vDmt = 25 then
          if not regexp_like(pnumcpr, '^1[[:digit:]]{2}PC[[:digit:]]{6}$') then
            sTypMsg    := '0';
            sRetFctCtl := 'Format du numéro de compteur incorrect : ' ||
                          chr(13) ||
                          'voici un exemple de nom de compteur pour le diamètre 15 ' ||
                          chr(13) || '          114PCxxxxxx' || chr(13) ||
                          'Sachant que xxxxxx est le numéro de série du compteur en question';
          end if;
        when vDmt = 30 then
          if not regexp_like(pnumcpr, '^1[[:digit:]]{2}PD[[:digit:]]{6}$') then
            sTypMsg    := '0';
            sRetFctCtl := 'Format du numéro de compteur incorrect : ' ||
                          chr(13) ||
                          'voici un exemple de nom de compteur pour le diamètre 15 ' ||
                          chr(13) || '          114PDxxxxxx' || chr(13) ||
                          'Sachant que xxxxxx est le numéro de série du compteur en question';
          end if;
        when vDmt = 40 then
          if not regexp_like(pnumcpr, '^1[[:digit:]]{2}PE[[:digit:]]{6}$') then
            sTypMsg    := '0';
            sRetFctCtl := 'Format du numéro de compteur incorrect : ' ||
                          chr(13) ||
                          'voici un exemple de nom de compteur pour le diamètre 15 ' ||
                          chr(13) || '          114PExxxxxx' || chr(13) ||
                          'Sachant que xxxxxx est le numéro de série du compteur en question';
          end if;
        when vDmt > 40 then

          if not
              regexp_like(pnumcpr,
                          '^E[[:digit:]]{2}(X|S)(F|G|H|I|J|K|L|M|N)[[:digit:]]{6}([[:upper:]]|[[:digit:]])$') then
            sTypMsg    := '0';
            sRetFctCtl := 'Format du numéro de compteur incorrect : ' ||
                          chr(13) ||
                          'voici un exemple de nom de compteur pour le diamètre > 40 ' ||
                          chr(13) || ' de marque SENUS  E14Y?xxxxxxC' ||
                          chr(13) ||
                          'Sachant que Y peut prendre soit X ou S majuscule' ||
                          chr(13) ||
                          'et ? représente l''une des lettres suivantes: F, G, H, I, J, K, L, M , N' ||
                          chr(13) ||
                          'ainsi xxxxxx est le numéro de série du compteur en question, finalement C est alphanumérique';
          end if;

        else
          sTypMsg    := '0';
          sRetFctCtl := 'Format du numéro de compteur incorrect : ' ||
                        chr(13) ||
                        'ce type ou diamètre de compteur n''est pas prise en charge';
      end case;
    end if;
    if vMrq = 'ARAD' then
      case
        when vDmt > 40 then
          if not
              regexp_like(pnumcpr,
                          '^WSTsb-[[:digit:]]{1}"-[[:digit:]]{2}-[[:digit:]]{5}$') then
            sTypMsg    := '0';
            sRetFctCtl := 'Format du numéro de compteur incorrect : ' ||
                          chr(13) ||
                          'voici un exemple de nom de compteur pour le diamètre > 40 ' ||
                          chr(13) ||
                          ' de marque ARAD commence par WSTsb-y"-14-xxxxx' ||
                          chr(13) ||
                          'Sachant que y représente le diamètre sélectionné (de 0 à 9) suivi de deux apostrophes " (touche 3)' ||
                          chr(13) ||
                          'et 14 l''année de fabrication du compteur' ||
                          chr(13) ||
                          'ainsi xxxxx est le numéro de série du compteur en question sans oublier le tiret de 6 entre eux';
          end if;
        else
          sTypMsg    := '0';
          sRetFctCtl := 'Format du numéro de compteur incorrect : ' ||
                        chr(13) ||
                        'ce type ou diamètre de compteur n''est pas prise en charge';
      end case;
    end if;
  exception
    when NO_DATA_FOUND then
      sTypMsg    := '0';
      sRetFctCtl := 'Le numéro ou le type de compteur sélectionné est erroné';
    when others then
      sTypMsg    := '0';
      sRetFctCtl := 'compteur erroné';

  end CtlCpr;
PROCEDURE "ALG_CRFCTCTRLCTR" (pIdtCtr          IN CTR.IdtCtr%TYPE,
                                               pIdtAcv          AvtCtr.IdtAcv%type,
                                               pChp12           AvtCtr.Chp12%type,
                                               pChp01           AvtCtr.Chp01%type,
                                               pDatRsl          CTR.DatRsl%type,
                                               pCodTypCtr       Ctr.codtypctr%type,
                                               pCffMlp          avtctr.cffmlp%type,
                                               pIdtDcpGgrNumOrd varchar2,
                                               pIdtPntCpg       PNTCPG.IdtPntCpg%TYPE,
                                               pChp02           AVTCTR.Chp02%TYPE,
                                               pChp03           AVTCTR.Chp03%TYPE,
                                               pIdtFacTyp       AVTCTR.Idtfactyp%TYPE,
                                               pT5              Ctr.T5%Type,
                                               pdatscr          Ctr.datScr%type,
                                               pidttrf          AVTCTR.IDTTRF%type,
                                               pT1              Ctr.T1%type,
                                               pC1        IN VARCHAR2,
                                               pC2        IN VARCHAR2,
                                               pC3        IN VARCHAR2,
                                               pC4        IN VARCHAR2,
                                               sTypMsg          OUT VARCHAR2,
                                               sRetFctCtl       OUT VARCHAR2) IS
  --Création    : SJ
  --Date        : 23/06/2009
  --Description : Controles sur la fiche contrat:
  --1. controle usage catégorie C1- employé_seaal
  --2. Un seul contrat ayant la catégorie I et Emplyé SEAAL est autorisé pour le client.
  --3. Le nombre de locataires ne doit pas être supérieur à 1 pour les usages autres que menage collectif.
  --4. controle de la dette du client dest ou sousc en fonct où on comptabilise ces dettes de prmgnr => si positif impossible de résilier le ctr
  --5. controle de l'origine du contrat: ne doit pas être classique

  -- sTypMsg = '0' si on veux envoyer un msg d'erreur;
  -- sTypMsg = '1' si on veux envoyer un msg d'information;
  -- sTypMsg = '2' si on veux envoyer un msg "warning" - demande de confirmation;
  -- BPZ 26/02/15
  -- mantis 12414

  cMsgReturn  Sys_Msg.Msg_Code%type;
  vIdtCltSsc  CTR.IdtCltSsc%type;
  vDft        PRMGNR.Dft%type;
  vSld        OPR.sld%type;
  vNbrCtrC1ES number;
  vIdtClt     CLT.IdtClt%type;
  vIdtTypCpg  TYPCPG.IdtTypCpg%TYPE;
  vIdtPntLvr  PNTLVR.IdtPntLvr%TYPE;
  vNbr        number;
  vT5         Ctr.T5%Type;
  vForfait    AvtCtr.Chp12%type;
  NbrCpr      number;
  vC1         Ctr.C1%type;
  vC2         Ctr.C2%type;
  vC3         Ctr.C3%type;
  vC4         Ctr.C4%type;

BEGIN

  -- BPZ 12414
  if pIdtPntCpg is null or pIdtDcpGgrNumOrd is null then
    return;
  end if;

  -- controle usage - emplyé_seaal
  if pIdtAcv != 'C1' and pChp12 = 1 then
    sTypMsg    := '0';
    cMsgReturn := 'MsgUsgES_Err001';
    select msg_libelle
      into sRetFctCtl
      from sys_msg
     where msg_code = cMsgReturn;
  end if;

  --Un seul contrat ayant la catégorie I et Emplyé SEAAL est autorisé pour un client.
  BEGIN
    select dft into vDft from prmgnr;
    select IdtCltSsc into vIdtCltSsc from ctr where idtctr = pIdtCtr;

    vNbrCtrC1ES := 0;
    select count(*)
      into vNbrCtrC1ES
      from ctr, avtctr
     where ctr.idtctr = avtctr.idtctr
       and sqcavn = numavn
       and datrsl is null
       and decode(vDft, 0, CTR.IdtCltSsc, CTR.IdtCltDst) = vIdtCltSsc
       and IdtAcv = 'C1'
       and Chp12 = 1;

    if pIdtAcv = 'C1' and pChp12 = 1 then
      vNbrCtrC1ES := vNbrCtrC1ES + 1;
    end if;

  Exception
    when no_data_found then
      vNbrCtrC1ES := 1;
  END;

  if vNbrCtrC1ES > 1 then
    sTypMsg    := '0';
    cMsgReturn := 'MsgUsgES_Err002';
    select msg_libelle
      into sRetFctCtl
      from sys_msg
     where msg_code = cMsgReturn;
  end if;

  --Le nombre de locataires ne doit pas être supérieur à 1 pour les usages autres que menage collectif.
  if pIdtAcv != 'C1' and pChp01 > 1 then
    sTypMsg    := '0';
    cMsgReturn := 'MsgNbrLoc_Err001';
    select msg_libelle
      into sRetFctCtl
      from sys_msg
     where msg_code = cMsgReturn;
  end if;

  -- 2nd contrôle: entre type contrat et coefficient multiplicateur
  if pCodTypCtr <> 'MENCOL' and pCffMlp <> 1 and pDatRsl is null then
    sTypMsg := '0';
    select msg_libelle
      into sRetFctCtl
      from sys_msg
     where msg_code = 'MsgUsgES_Err003';
  end if;

  -- On sort si erreur
  if sRetFctCtl is not null then
    return;
  end if;

  -- Recherche du type de comptage
  select PNTCPG.IdtPntLvr, PNTCPG.IdtTypCpg
    into vIdtPntLvr, vIdtTypCpg
    from PNTCPG, PNTLVR
   where PNTCPG.IdtPntLvr = PNTLVR.IdtPntLvr
     and PNTLVR.IdtDcpGgr =
         substr(pIdtDcpGgrNumOrd, 1, instr(pIdtDcpGgrNumOrd, '-', -1) - 1)
     and PNTLVR.NumOrd =
         substr(pIdtDcpGgrNumOrd, instr(pIdtDcpGgrNumOrd, '-', -1) + 1)
     and PNTCPG.IdtPntCpg = pIdtPntCpg;
  -- Recherche s'il existe un point de comptage general
  select count(*)
    into vNbr
    from PNTCPG
   where IdtPntLvr = vIdtPntLvr
     and IdtTypCpg = 3;

  -- Controles pour le comptage standar
  if vIdtTypCpg = 2 then
    if pCodTypCtr in ('REPEGL', 'REPPRR') then
      -- Erreur : pas possible d'avoir ce type de contrat s'il n'est pas general/divisionnaire
      sTypMsg    := '0';
      sRetFctCtl := TRTMSG01.ChercheMsg('ERR_CPGGNR0003');
      -- !!!! ERREUR, on s'arrete
      return;
    end if;
  elsif vIdtTypCpg = 3 then
    -- Controle : Le pourcentage de repartition sur le compteur general
    --            doit etre entre 0 et 100
    if pChp03 < 0 or pChp03 > 100 then
      sRetFctCtl := TRTMSG01.ChercheMsg('ERR_CPGGNR0002');
      sTypMsg    := '0';
      -- !!! ERREUR, on s'arrete
      return;
    end if;
    if pCodTypCtr not in ('REPEGL', 'REPPRR') then
      -- Erreur : Pas possible d'avoir ce type de contrat pour le compteur general
      sRetFctCtl := TRTMSG01.ChercheMsg('ERR_CPGGNR0004');
      sTypMsg    := '0';
      -- !!! ERREUR, on s'arrete
      return;
    end if;
  elsif vIdtTypCpg = 4 then
    -- Il y a un compteur general
    if vNbr > 0 then
      if pCodTypCtr not in ('REPEGL', 'REPPRR') then
        -- Alerte: Le contrat n'est pas tenu en compte pour la repartition
        sTypMsg    := '2';
        sRetFctCtl := TRTMSG01.ChercheMsg('ALR_CPGGNR0002');
      end if;
    end if;
  end if;
  -- Les points de comptage general et divisionnaire doivent avoir le meme type de
  -- contrat s'il y a une repartition a faire
  if vIdtTypCpg = 3 or
     (vIdtTypCpg = 4 and pCodTypCtr in ('REPEGL', 'REPPRR')) then
    -- On verifie s'ils existent des contrats actifs avec un type de contrat de repartition
    -- autre que celui renseigne
    select count(*)
      into vNbr
      from CTR
     where IdtPntLvr = vIdtPntLvr
       and CodTypCtr in ('REPEGL', 'REPPRR')
       and DatRsl is null
       and CodTypCtr <> pCodTypCtr
       and IdtCtr <> nvl(pIdtCtr, '0');
    if vNbr > 0 then
      -- Erreur: Pas possible d'avoir plusieurs regles de repartition
      sTypMsg    := '0';
      sRetFctCtl := TRTMSG01.ChercheMsg('ERR_CPGGNR0001');
      -- !!! ERREUR, on s'arrete
      return;
    end if;
  end if;

  /* LL: 20/12/09: SEAAL ne veut plus de ce contrôle
  --controle de la dette du client dest ou sousc en fonct où on comptabilise ces dettes de prmgnr

    if vDft=0 then
      select IdtCltSsc into vIdtClt from ctr where idtctr=pIdtCtr;
     else
      select IdtCltDst into vIdtClt from ctr where idtctr=pIdtCtr;
    end if;

    select sum(sld) into vSld from opr where sld!=0 and idtclt=vIdtClt;

    if vSld>0 and pDatRsl is not null then
     sTypMsg := '0';
     cMsgReturn :='MsgDetPos_Err001';
     select msg_libelle || to_char(vSld, '9999999.99') into sRetFctCtl from sys_msg where msg_code=cMsgReturn;
    end if;
    */
  begin
    select T5 into vT5 from Ctr where IdtCtr = pIdtCtr;
  exception
    when no_data_found then
      vT5 := null;
  end;
  if pT5 = 'OC_008' and (vT5 <> pT5 or vT5 is null) then
    sTypMsg    := 0;
    sRetFctCtl := TRTMSG01.ChercheMsg('MsgUsgES_Err004');
    return;
  end if;
-- A ajouter dans procedure ALG_CRFCTCTRLCTR
-- vérification Forfait:
  -- 54M3 pour C1 Trimestriel Forfaitaire coefficient 1
  -- 30M3 pour C1 Trimestriel Forfaitaire coefficient 1 pour 3 communes
  --
  begin
    select case
             when PntCpg.Adrstr10 in ('1635', '1637', '1656') then
              30
             else
              54
           end
      into vForfait
      from Ctr, pntcpg
     where Ctr.idtPntlvr = PntCpg.idtPntLvr
       and Ctr.idtPntCpg = PntCpg.idtPntCpg
       and Ctr.idtCtr = pIdtCtr;
  exception
    when others then
      null;
      if (vForfait <> pChp02 and pIdtFacTyp like 'TRMFRF' and pCffMlp = 1 and
         pIdtAcv = 'C1') then
        sTypMsg    := 0;
        sRetFctCtl := TRTMSG01.ChercheMsg('ERR_CTR0006');
        return;
      end if;
end;

/* Controle Champs Remontées*/
begin
    -- Récupérer les valeurs depuis la table
    begin
      Select C1, C2, C3, C4 into vC1, vC2, vC3, vC4 from Ctr where IdtCtr = pIdtCtr;
    exception
      when no_data_found then
        /* cas d'un nouveau contrat */
        begin
          case
          /* ne pas décocher C1 et C2 et C3 et C4*/
            when (pC1 + pC2 + pC3+ pC4 = 0) then
              sTypMsg    := '0';
              sRetFctCtl := 'Vous devez choisir un type de Remonté';
              /* ne pas cocher plus d'un choix*/
            when (pC1 + pC2 + pC3+ pC4 > 1) then
              sTypMsg    := '0';
              sRetFctCtl := 'Vous ne pouvez pas choisir plus d''un type de Remonté';
              /* ne pas cocher C3*/
            when pC3 = 1 then
              sTypMsg    := '0';
              sRetFctCtl := 'Vous ne pouvez pas choisir Remontée Classique';
            else
              null;
          end case;
        end;
      when others then
        sTypMsg    := '0';
        sRetFctCtl := 'Erreur';
    end;
    case
    /* ne pas décocher C1 et C2 et C3 et C4*/
      when (pC1 + pC2 + pC3 +pC4 = 0) then
        sTypMsg    := '0';
        sRetFctCtl := 'Vous devez choisir un type de Remonté';
        /* ne pas cocher C3*/
      when (vC3 = 0 and pC3 = 1) then
        sTypMsg    := '0';
        sRetFctCtl := 'Vous ne pouvez pas choisir Remontée Classique';
        /* ne pas cocher plus d'un choix*/
      when (pC1 + pC2 + pC3 + pC4 > 1) then
        sTypMsg    := '0';
        sRetFctCtl := 'Vous ne pouvez pas choisir plus d''un type de Remonté';
      else
        sTypMsg := '0';
    end case;


    /* Interdir l'incohérence entre tarif et USAGE  et Usage détaille*/

   begin

   case
    /* tarif =CAT01 et usage <> C1*/
      when  pidttrf= 'CAT01' and pidtacv <> 'C1'  then
        sTypMsg    := '0';
        sRetFctCtl := 'Seul l''usage C1 est autorisé pour ce Tarif';
       /* tarif =CAT02 et usage <> C2 ou C3*/
      when  pidttrf= 'CAT02' and pidtacv not in ('C2','C3') then
        sTypMsg    := '0';
        sRetFctCtl := 'Seul l''usage C2 ou C3 est autorisé pour ce Tarif';
       /* tarif =CAT03 et usage <> C4*/
      when  pidttrf= 'CAT03' and pidtacv <> 'C4'  then
        sTypMsg    := '0';
        sRetFctCtl := 'Seul l''usage C4 est autorisé pour ce Tarif';

        /*  interdir l'incoherence entre usage est usage détaillé

      /* tarif =CAT01 et usage = C1 et  usage detaille <> C1_xxx  */
      when  pidttrf= 'CAT01' and pidtacv = 'C1' and substr(pT1,1,2)<> 'C1' then
        sTypMsg    := '0';
        sRetFctCtl := 'Seul l''usage détaillé qui commence par C1 est autorisé pour cet Usage';

       /* tarif =CAT02 et usage = C2 et  usage detaille <> C2_xxx  */
      when  pidttrf= 'CAT02' and pidtacv = 'C2'and substr(pT1,1,2)<>'C2'then
        sTypMsg    := '0';
        sRetFctCtl := 'Seul l''usage détaillé qui commence par C2 est autorisé pour cet Usage';
         /* tarif =CAT02 et usage = C3 et  usage detaille <> C3_xxx  */
      when  pidttrf= 'CAT02' and pidtacv = 'C3' and substr(pT1,1,2)<> 'C3' then
        sTypMsg    := '0';
        sRetFctCtl := 'Seul l''usage détaillé qui commence par  C3 est autorisé pour cet Usage';

      /* tarif =CAT03 et usage = C4 et  usage detaille <> C4_xxx  */
      when  pidttrf= 'CAT03' and pidtacv = 'C4' and substr(pT1,1,2)<> 'C4' then
        sTypMsg    := '0';
        sRetFctCtl := 'Seul l''usage détaillé qui commence par C4 est autorisé pour cet Usage';


     else
        sTypMsg := '0';
    end case;

   end;

  /* le régime de facturation et l'existence d'un compteur*/


       SELECT  nvl( count(*) , 0) into NbrCpr
       FROM cprpntcpg , pntlvr
       WHERE
        cprpntcpg.idtpntlvr=pntlvr.idtpntlvr
        And pntlvr.idtdcpggr||'-'||pntlvr.numord=pidtdcpggrnumord
        AND idtpntcpg = pidtpntcpg
        AND datdps IS NULL;


     if substr(pidtfactyp, 4,3)= 'RLV' and NbrCpr =0 then

       sTypMsg    := '0';
        sRetFctCtl := 'Facture type choisie n''est pas adéquate ';
      else
          if substr(pidtfactyp, 4,3)= 'FRF' and NbrCpr >0 then

        sTypMsg    := '0';
        sRetFctCtl := 'Facture type choisie n''est pas adéquate ';

         else
          sTypMsg := '0';

         end if;

       end if;

 end;


  /*     control DAF */
begin
    -- Récupérer les valeurs depuis la table
    begin
      Select  C4, T5 into  vC4, vT5 from Ctr where IdtCtr = pIdtCtr;



          exception
      when no_data_found then
        -- cas d'un nouveau contrat
        /* ne coche pas remonté DAF  si origine client est différent du DAF*/
        begin

            case

          when pT5 <> 'OC_012' and pC4= 1 then
            sTypMsg    := '0';
            sRetFctCtl := 'L''Origine client ne correspond pas à la Remonté choisie1';

          when pT5 = 'OC_012' and pC4= 0 then
            sTypMsg    := '0';
            sRetFctCtl := 'L''Origine client ne correspond pas à la Remonté choisie2';
          else
              null;
            end case;


        end;
      when others then
        sTypMsg    := '0';
        sRetFctCtl := 'Erreur';
    end;



    /* cas d'ancien contrat */

    if vT5 is not null then
    begin
      if  vT5 = 'OC_012' then

     /* ne pas changer l'origine client de DAF vers un autre origine client dans ancien contrat */

       if vC4 =1 and (pT5 <>'OC_012' or pC4 = 0) then
             sTypMsg    := '0';
            sRetFctCtl := 'Veuillez remettre l''Origine Client DAF et la Remontée DAF ';
            return;
       end if;

     else

     /*  pour ancien contrat non DAF  on les changera pas a DAF*/
       if pT5 ='OC_012' or pC4 =1  then
            sTypMsg    := '0';
            sRetFctCtl := 'Vous ne pourrez pas choisir l''Origine Client DAF et la Remontée DAF ';
            return;
        end if;
          end if;

    end;
   end if;

  end;
    return;
  end;
END ALG_FctCtl;
/