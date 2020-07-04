CREATE OR REPLACE PROCEDURE ALG_CTRLCTR (pIdtCtr          IN CTR.IdtCtr%TYPE,
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
                                          pchp05           AVTCTR.CHP05%type,
                                          pt3              Ctr.T3%type,
                                          pC1              IN VARCHAR2,
                                          pC2              IN VARCHAR2,
                                          pC3              IN VARCHAR2,
                                          pC4              IN VARCHAR2,
                                          pC5              IN VARCHAR2,
                                          pidtcltssc       ctr.idtcltssc%type,
                                          sTypMsg          OUT VARCHAR2,
                                          sRetFctCtl       OUT VARCHAR2) IS
  --Creation    : SJ
  --Date        : 23/06/2009
  --Description : Controles sur la fiche contrat:
  --1. controle usage categorie C1- employe_seaal
  --2. Un seul contrat ayant la cat?gorie I et Emplye SEAAL est autorise pour le client.
  --3. Le nombre de locataires ne doit pas etre superieur ? 1 pour les usages autres que menage collectif.
  --4. controle de la dette du client dest ou sousc en fonct o on comptabilise ces dettes de prmgnr => si positif impossible de r?silier le ctr
  --5. controle de l'origine du contrat: ne doit pas ?tre classique

  -- sTypMsg = '0' si on veux envoyer un msg d'erreur;
  -- sTypMsg = '1' si on veux envoyer un msg d'information;
  -- sTypMsg = '2' si on veux envoyer un msg "warning" - demande de confirmation;
  -- BPZ 26/02/15
  -- mantis 12414

  Procedure CtrlTypEmp(p1IdtCtr IN CTR.IdtCtr%TYPE,
                       p1IdtAcv AvtCtr.IdtAcv%type,
                       p1Chp12  AvtCtr.Chp12%type,
                       p1chp05  AVTCTR.CHP05%type) is

    vIdtCltSsc  CTR.IdtCltSsc%type;
    vDft        PRMGNR.Dft%type;
    vNbrCtrC1ES number;
    vNbrM    number;
    vchp05     avtctr.CHP05%type;

  begin
    -- controle usage - employe seaal
    if p1IdtAcv != 'C1' and p1Chp12 = 1 then
      sTypMsg    := '0';
      sRetFctCtl := TRTMSG01.ChercheMsg('MsgUsgES_Err001');
      return;
    end if;
    --Un seul contrat ayant la cat?gorie I et Employ? SEAAL est autoris? pour un client.
    BEGIN
      select dft into vDft from prmgnr;
      select IdtCltSsc into vIdtCltSsc from ctr where idtctr = p1IdtCtr;
      vNbrCtrC1ES := 0;
      select count(*)
        into vNbrCtrC1ES
        from ctr, avtctr
       where ctr.idtctr = avtctr.idtctr
         and sqcavn = numavn
         and datrsl is null
         and decode(vDft, 0, CTR.IdtCltSsc, CTR.IdtCltDst) = vIdtCltSsc
         and IdtAcv = 'C1'
         and Chp12 = 1
         and ctr.idtCtr<>p1IdtCtr ;
      if p1IdtAcv = 'C1' and p1Chp12 = 1 then
        vNbrCtrC1ES := vNbrCtrC1ES + 1;
      end if;
     Exception
      when no_data_found then
        vNbrCtrC1ES := 1;
     END;
    if vNbrCtrC1ES > 1 then
      sTypMsg    := '0';
      sRetFctCtl := TRTMSG01.ChercheMsg('MsgUsgES_Err002');
      return;
    end if;

    begin
      if p1chp12 = 1 then
        if nvl(length(p1chp05), 0) = 0 then
          sTypMsg    := '0';
          sRetFctCtl := 'Veuillez remplir le champ Matricule RH sous la forme :
                            1XXXXX :Employe SEAAL
                            2XXXXX :Employe ONA
                            3XXXXX :Employe ADE
                            4XXXXX :Employe ministere
                            5XXXXX :Autres

   XXXXX designe le matricule RH de l''agent.';

        else
          if nvl(length(p1chp05), 0) <> 6 then
            sTypMsg    := '0';
            sRetFctCtl := 'le matricule RH doit comporter 6 chiffres entiers.';

          else
            if nvl(length(p1chp05), 0) = 6 and
               substr(p1chp05, 1, 1) not in ('1', '2', '3', '4', '5') then
              sTypMsg    := '0';
              sRetFctCtl := 'le champ Matricule RH sous la forme :
                                1XXXXX :Employe SEAAL
                                2XXXXX :Employe ONA
                                3XXXXX :Employe ADE
                                4XXXXX :Employe ministere
                                5XXXXX :Autres

   XXXXX designe le matricule RH de l''agent';
            end if;
          end if;
        end if;
      else
        if nvl(length(p1chp05), 0) <> 0 then
          sTypMsg    := '0';
          sRetFctCtl := 'Veuillez cocher Employe SEAAL.';
        end if;
      end if;
     -- return;
    end;

    /* Le matricule ne peut ?tre utilis? qu'une fois pour un contrat actif*/


     begin
          Select chp05 into vchp05 from AvtCtr where IdtCtr = p1IdtCtr and datfin is null;

           if vchp05 is null then
            begin
              select count(*)    into vnbrm
                from avtctr, ctr
               where avtctr.idtctr = ctr.IDTCTR
             and datrsl is null
             and datfin is null
             and chp05 = p1chp05;

              if vnbrm <>0 then
                   sTypMsg    := '0';
                  sRetFctCtl := 'Matricule RH deja utilise dans un autre contrat agent SEAAL.';
               end if;
             return;

            end;
          end if;
         Exception /* cas de nouvelle contrat*/
         when no_data_found then
         if vchp05 is null then
            begin
              select count(*)    into vnbrm
                from avtctr, ctr
               where avtctr.idtctr = ctr.IDTCTR
             and datrsl is null
             and chp05 = p1chp05;

              if vnbrm <>0 then
                   sTypMsg    := '0';
                  sRetFctCtl := 'Matricule RH deja utilise dans un autre contrat agent SEAAL.';
               end if;
             return;

            end;
          end if;



      END;

   end;
  Procedure CtrlTypMng(p1IdtAcv AvtCtr.IdtAcv%type,
                       p1Chp01  AvtCtr.Chp12%type) is
  begin
    -- Le nombre de locataires ne doit pas ?tre sup?rieur ? 1 pour les
    -- usages autres que menage collectif.
    if p1IdtAcv != 'C1' and p1Chp01 > 1 then
      sTypMsg    := '0';
      sRetFctCtl := TRTMSG01.ChercheMsg('MsgNbrLoc_Err001');
      return;
    end if;
  end;

  Procedure CtrlCoeff(p1DatRsl    CTR.DatRsl%type,
                      p1CodTypCtr Ctr.codtypctr%type,
                      p1CffMlp    avtctr.cffmlp%type) is
  begin
    -- 2nd controle: entre type contrat et coefficient multiplicateur
    if p1CodTypCtr <> 'MENCOL' and p1CffMlp <> 1 and p1DatRsl is null then
      sTypMsg    := '0';
      sRetFctCtl := TRTMSG01.ChercheMsg('MsgUsgES_Err003');
      return;
    end if;
  end;

  Procedure CtrlTypCpg(p1IdtCtr          Ctr.IdtCtr%Type,
                       p1IdtDcpGgrNumOrd varchar2,
                       p1CodTypCtr       Ctr.codtypctr%type,
                       p1IdtPntCpg       PNTCPG.IdtPntCpg%TYPE) is
    vIdtTypCpg TYPCPG.IdtTypCpg%TYPE;
    vIdtPntLvr PNTLVR.IdtPntLvr%TYPE;
    vNbr     number;
  begin
    -- Recherche du type de comptage
    select PNTCPG.IdtPntLvr, PNTCPG.IdtTypCpg
      into vIdtPntLvr, vIdtTypCpg
      from PNTCPG, PNTLVR
     where PNTCPG.IdtPntLvr = PNTLVR.IdtPntLvr
       and PNTLVR.IdtDcpGgr =
           substr(p1IdtDcpGgrNumOrd,
                  1,
                  instr(p1IdtDcpGgrNumOrd, '-', -1) - 1)
       and PNTLVR.NumOrd =
           substr(p1IdtDcpGgrNumOrd, instr(p1IdtDcpGgrNumOrd, '-', -1) + 1)
       and PNTCPG.IdtPntCpg = p1IdtPntCpg;

    -- Recherche s'il existe un point de comptage general
    select count(*)
      into vNbr
      from PNTCPG
     where IdtPntLvr = vIdtPntLvr
       and IdtTypCpg = 3;

    -- Controles pour le comptage standard
    if vIdtTypCpg = 2 then
      if p1CodTypCtr in ('REPEGL', 'REPPRR') then
        -- Erreur : pas possible d'avoir ce type de contrat s'il n'est pas general/divisionnaire
        sTypMsg    := '0';
        sRetFctCtl := TRTMSG01.ChercheMsg('ERR_CPGGNR0003');
        return;
      end if;

    elsif vIdtTypCpg = 3 then
      -- Controle : Le pourcentage de repartition sur le compteur general
      --            doit etre entre 0 et 100
      if pChp03 < 0 or pChp03 > 100 then
        sRetFctCtl := TRTMSG01.ChercheMsg('ERR_CPGGNR0002');
        sTypMsg    := '0';
        return;
      end if;
      if p1CodTypCtr not in ('REPEGL', 'REPPRR') then
        -- Erreur : Pas possible d'avoir ce type de contrat pour le compteur general
        sRetFctCtl := TRTMSG01.ChercheMsg('ERR_CPGGNR0004');
        sTypMsg    := '0';
        return;
      end if;
    elsif vIdtTypCpg = 4 then
      -- Il y a un compteur general
      if vNbr > 0 then
        if p1CodTypCtr not in ('REPEGL', 'REPPRR') then
          -- Alerte: Le contrat n'est pas tenu en compte pour la repartition
          sTypMsg    := '2';
          sRetFctCtl := TRTMSG01.ChercheMsg('ALR_CPGGNR0002');
        end if;
      end if;
    end if;

    -- Les points de comptage general et divisionnaire doivent avoir le meme type de
    -- contrat s'il y a une repartition a faire
    if vIdtTypCpg = 3 or
       (vIdtTypCpg = 4 and p1CodTypCtr in ('REPEGL', 'REPPRR')) then
      -- On verifie s'ils existent des contrats actifs avec un type de contrat de repartition
      -- autre que celui renseigne
      select count(*)
        into vNbr
        from CTR
       where IdtPntLvr = vIdtPntLvr
         and CodTypCtr in ('REPEGL', 'REPPRR')
         and DatRsl is null
         and CodTypCtr <> p1CodTypCtr
         and IdtCtr <> nvl(p1IdtCtr, '0');

      -- Erreur: Pas possible d'avoir plusieurs regles de repartition
      if vNbr > 0 then
        sTypMsg    := '0';
        sRetFctCtl := TRTMSG01.ChercheMsg('ERR_CPGGNR0001');
        return;
      end if;
    end if;
  end;

  Procedure CtrlOrgCtr(p1IdtCtr Ctr.IdtCtr%Type, p1T5 Ctr.T5%Type) is
  vT5      Ctr.T5%Type;
  begin
    begin
      select T5 into vT5 from Ctr where IdtCtr = p1IdtCtr;
    exception
      when no_data_found then
        vT5 := null;
    end;

    if p1T5 = 'OC_008' and (vT5 <> p1T5 or vT5 is null) then
      sTypMsg    := 0;
      sRetFctCtl := TRTMSG01.ChercheMsg('MsgUsgES_Err004');
      return;
    end if;
  end;

  Procedure CtrlFrf(p1IdtCtr    Ctr.IdtCtr%Type,
                    p1Chp02     AVTCTR.Chp02%TYPE,
                    p1IdtFacTyp AVTCTR.Idtfactyp%TYPE,
                    p1IdtAcv    Avtctr.Idtacv%type,
                    p1CffMlp    avtctr.cffmlp%type,
                    p1IdtDcpGgrNumOrd varchar2,
                    p1IdtPntCpg       PNTCPG.IdtPntCpg%TYPE) is
 vForfait AvtCtr.Chp02%type;
 vAdrStr10 PntCpg.Adrstr10%type;
 vFrfAlger number:=54;
 vFrfTipaza number:=33;

  begin
    begin
    select PntCpg.Adrstr10
      into vAdrStr10
      from PNTCPG, PNTLVR
     where PNTCPG.IdtPntLvr = PNTLVR.IdtPntLvr
       and PNTLVR.IdtDcpGgr =
           substr(p1IdtDcpGgrNumOrd,
                  1,
                  instr(p1IdtDcpGgrNumOrd, '-', -1) - 1)
       and PNTLVR.NumOrd =
           substr(p1IdtDcpGgrNumOrd, instr(p1IdtDcpGgrNumOrd, '-', -1) + 1)
       and PNTCPG.IdtPntCpg = p1IdtPntCpg;
       Exception
         when others then
           sTypMsg    := 0;
           sRetFctCtl := 'Erreur inconnue';
           return;
        end;
        case substr(vAdrStr10,1,2)
          when '16' then vForfait:=vFrfAlger ;
          when '42' then vForfait:=vFrfTipaza ;
          else vForfait:= vFrfAlger;
        end case;
        if (
          vForfait > nvl(p1Chp02,0)
          and p1IdtFacTyp = 'TRMFRF'
          and p1CffMlp = 1
          and p1IdtAcv = 'C1') then
          sTypMsg    := 0;
          sRetFctCtl := TRTMSG01.ChercheMsg('ERR_CTR0006');
          return;
        end if;
        /* begin
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
         and Ctr.idtCtr = p1IdtCtr;
    exception
      when No_Data_Found then
        if (vForfait <> 54 and p1IdtFacTyp like 'TRMFRF' and
           p1CffMlp = 1 and pIdtAcv = 'C1') then
          sTypMsg    := 0;
          sRetFctCtl := TRTMSG01.ChercheMsg('ERR_CTR0006');
          return;
        end if;
      when others then
        if (vForfait <> p1Chp02 and p1IdtFacTyp like 'TRMFRF' and
           p1CffMlp = 1 and pIdtAcv = 'C1') then
          sTypMsg    := 0;
          sRetFctCtl := TRTMSG01.ChercheMsg('ERR_CTR0006');
          return;
        end if;
    end;*/
  end;

  Procedure CtrlTypFac(p1IdtDcpGgrNumOrd varchar2,
                       p1IdtPntCpg       PNTCPG.IdtPntCpg%TYPE,
                       p1IdtFacTyp       AVTCTR.Idtfactyp%TYPE) is
NbrCpr   number;
    /* le r?gime de facturation et l'existence d'un compteur*/
  begin
    SELECT nvl(count(*), 0)
      into NbrCpr
      FROM cprpntcpg, pntlvr
     WHERE cprpntcpg.idtpntlvr = pntlvr.idtpntlvr
       And pntlvr.idtdcpggr || '-' || pntlvr.numord = p1idtdcpggrnumord
       AND idtpntcpg = p1idtpntcpg
       AND datdps IS NULL;

    if substr(pidtfactyp, 4, 3) = 'RLV' and NbrCpr = 0 then

      sTypMsg    := '0';
      sRetFctCtl := 'Facture type choisie n''est pas adequate ';
    else
      if substr(p1idtfactyp, 4, 3) = 'FRF' and NbrCpr > 0 then
        sTypMsg    := '0';
        sRetFctCtl := 'Facture type choisie n''est pas adequate ';
      else
        sTypMsg := '0';
      end if;
    end if;
    return;
  end;

  Procedure CtrlUsgTrf(p1IdtAcv AvtCtr.IdtAcv%type,
                       p1idttrf AVTCTR.IDTTRF%type,
                       p1T1     Ctr.T1%type) is
  begin
    /* Interdire l'incoh?rence entre tarif et USAGE  et Usage d?taille*/
    begin
      case
      /* tarif =CAT01 et usage <> C1*/
        when p1idttrf = 'CAT01' and p1idtacv <> 'C1' then
          sTypMsg    := '0';
          sRetFctCtl := 'Seul l''usage C1 est autorise pour ce Tarif';
          /* tarif =CAT02 et usage <> C2 ou C3*/
        when p1idttrf = 'CAT02' and p1idtacv not in ('C2', 'C3') then
          sTypMsg    := '0';
          sRetFctCtl := 'Seul l''usage C2 ou C3 est autorise pour ce Tarif';
          /* tarif =CAT03 et usage <> C4*/
        when p1idttrf = 'CAT03' and p1idtacv <> 'C4' then
          sTypMsg    := '0';
          sRetFctCtl := 'Seul l''usage C4 est autorise pour ce Tarif';

      /*  interdire l'incoherence entre usage est usage d?taill?
      /* tarif =CAT01 et usage = C1 et  usage detaille <> C1_xxx  */
        when p1idttrf = 'CAT01' and p1idtacv = 'C1' and
             substr(pT1, 1, 2) <> 'C1' then
          sTypMsg    := '0';
          sRetFctCtl := 'Seul l''usage detaille qui commence par C1 est autorise pour cet Usage';

      /* tarif =CAT02 et usage = C2 et  usage detaille <> C2_xxx  */
        when p1idttrf = 'CAT02' and p1idtacv = 'C2' and
             substr(pT1, 1, 2) <> 'C2' then
          sTypMsg    := '0';
          sRetFctCtl := 'Seul l''usage detaille qui commence par C2 est autorise pour cet Usage';
          /* tarif =CAT02 et usage = C3 et  usage detaille <> C3_xxx  */
        when p1idttrf = 'CAT02' and p1idtacv = 'C3' and
             substr(p1T1, 1, 2) <> 'C3' then
          sTypMsg    := '0';
          sRetFctCtl := 'Seul l''usage detaille qui commence par  C3 est autorise pour cet Usage';

      /* tarif =CAT03 et usage = C4 et  usage detaille <> C4_xxx  */
        when pidttrf = 'CAT03' and pidtacv = 'C4' and
             substr(p1T1, 1, 2) <> 'C4' then
          sTypMsg    := '0';
          sRetFctCtl := 'Seul l''usage detaille qui commence par C4 est autorise pour cet Usage';

        else
          sTypMsg := '0';
      end case;
    end;
  end;

  Procedure CtrlRmntClt(p1IdtCtr IN CTR.IdtCtr%TYPE,
                        p1C1     IN VARCHAR2,
                        p1C2     IN VARCHAR2,
                        p1C3     IN VARCHAR2,
                        p1C4     IN VARCHAR2,
                        p1C5     IN VARCHAR2,
                        p1T5     Ctr.T5%Type) is
    vC1 Ctr.C1%type;
    vC2 Ctr.C2%type;
    vC3 Ctr.C3%type;
    vC4 Ctr.C4%type;
    vC5 Ctr.C5%type;
    vT5      Ctr.T5%Type;
    vT5anc Ctr.T5%Type;
    vIdtCltSsc  CTR.IdtCltSsc%type;
    vIdtCtr  CTR.IdtCtr%TYPE ;
    vIdtsqcgnr CTR.idtsqcgnr%TYPE ;
    vIdtCtrprec  CTR.IdtCtr%TYPE ;
  begin
    /* Controle Champs Remont?es*/
    begin
      -- R?cup?rer les valeurs depuis la table
      begin
        Select C1, C2, C3, C4, C5
          into vC1, vC2, vC3, vC4, vC5
          from Ctr
         where IdtCtr = p1IdtCtr;
      exception
        when no_data_found then
          /* cas d'un nouveau contrat */
          begin
            case
            /* ne pas d?cocher C1 et C2 et C3 et C4*/
              when (p1C1 + p1C2 + p1C3 + p1C4+ p1C5 = 0) then
                sTypMsg    := '0';
                sRetFctCtl := 'Vous devez choisir un type de Remonte';
                /* ne pas cocher plus d'un choix*/
              when (p1C1 + p1C2 + p1C3 + p1C4+ p1C5 > 1) then
                sTypMsg    := '0';
                sRetFctCtl := 'Vous ne pouvez pas choisir plus d''un type de Remonte';
                /* ne pas cocher C3*/
              when p1C3 = 1 then
                sTypMsg    := '0';
                sRetFctCtl := 'Vous ne pouvez pas choisir Remontee Classique';
              else
                null;
            end case;
          end;
        when others then
          sTypMsg    := '0';
          sRetFctCtl := 'Erreur';
      end;
      case
      /* ne pas d?cocher C1 et C2 et C3 et C4*/
        when (p1C1 + p1C2 + p1C3 + p1C4+ p1C5 = 0) then
          sTypMsg    := '0';
          sRetFctCtl := 'Vous devez choisir un type de Remonte';
          /* ne pas cocher C3*/
        when (vC3 = 0 and p1C3 = 1) then
          sTypMsg    := '0';
          sRetFctCtl := 'Vous ne pouvez pas choisir Remontee Classique';
          /* ne pas cocher plus d'un choix*/
        when (p1C1 + p1C2 + p1C3 + p1C4 + p1C5> 1) then
          sTypMsg    := '0';
          sRetFctCtl := 'Vous ne pouvez pas choisir plus d''un type de Remonte';
        else
          sTypMsg := '0';
      end case;
       begin
        -- R?cup?rer les valeurs depuis la table
        begin
          Select C4, T5 into vC4, vT5 from Ctr where IdtCtr = p1IdtCtr;
        exception
          when no_data_found then
            -- cas d'un nouveau contrat
            /* ne coche pas remont? DAF  si origine client est diff?rent du DAF*/
            begin
              case
                when p1T5 <> 'OC_012' and p1C4 = 1 then
                  sTypMsg    := '0';
                  sRetFctCtl := 'L''Origine client ne correspond pas a la Remonte choisie';
                when p1T5 = 'OC_012' and p1C4 = 0 then
                  sTypMsg    := '0';
                  sRetFctCtl := 'L''Origine client ne correspond pas a la Remonte choisie';
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
            if vT5 = 'OC_012' then
              /* ne pas changer l'origine client de DAF vers un autre origine client dans ancien contrat */
              if vC4 = 1 and (p1T5 <> 'OC_012' or p1C4 = 0) then
                sTypMsg    := '0';
                sRetFctCtl := 'Veuillez remettre l''Origine Client DAF et la Remontee DAF ';
                return;
              end if;
            else
              /*  pour ancien contrat non DAF  on les changera pas a DAF*/
              if p1T5 = 'OC_012' or p1C4 = 1 then
                sTypMsg    := '0';
                sRetFctCtl := 'Vous ne pourrez pas choisir l''Origine Client DAF et la Remontee DAF ';
                return;
              end if;
            end if;
          end;
        end if;
      end;
      
     begin 
      begin
      --------   FDR 121
        -- R?cup?rer les valeurs depuis la table
        
         select max(idtsqcgnr) into vIdtsqcgnr from ctr where 
         IdtCltSsc=pidtcltssc 
         and datrsl is null
          ;
        
        Select  T5 ,idtctr into  vT5anc , vIdtCtrprec from Ctr where idtsqcgnr=vIdtsqcgnr ;
         exception
          when no_data_found then
            --pour chaque remontée les origines client qui conviennent 
            begin
              case
                when p1T5 not in ('OC_009','OC_005','OC_014') and p1C1 = 1 then
                  sTypMsg    := '0';
                  sRetFctCtl := 'L''Origine client ne correspond pas a la Remonte choisie  FDR 121  agence '||vIdtsqcgnr;
                  when p1T5 not in ('OC_003 ','OC_010') and p1C4 = 1 then
                  sTypMsg    := '0';
                  sRetFctCtl := 'L''Origine client ne correspond pas a la Remonte choisie  FDR 121  DAF';
                when p1T5 not in ('OC_006','OC_003') and p1C5 = 1 then
                  sTypMsg    := '0';
                  sRetFctCtl := 'L''Origine client ne correspond pas a la Remonte choisie  FDR 121  DEC';
                else
                  null;
              end case;
            end;
          when others then
            sTypMsg    := '0';
            sRetFctCtl := 'Erreur';
        end;
        /* cas le client possede déja des contrats */
        if vT5anc <> p1T5 and pidtctr is null  then
        sTypMsg    := '0';
        sRetFctCtl := 'la nouvelle contrats doit avoir le meme code origine client que la précédente'||vIdtsqcgnr||'  '||vIdtCtrprec;
         else
            case 
                when p1T5 not in ('OC_009','OC_005','OC_014') and p1C1 = 1 then
                  sTypMsg    := '0';
                  sRetFctCtl := 'L''Origine client ne correspond pas a la Remonte choisie  FDR 121 agence plus '||vIdtsqcgnr||'  '||pidtctr||'  '||vIdtCtrprec||'  '||p1T5||'  '||vT5anc;
                  when p1T5 not in ('OC_003 ','OC_010') and p1C4 = 1 then
                  sTypMsg    := '0';
                  sRetFctCtl := 'L''Origine client ne correspond pas a la Remonte choisie  FDR 121   DAF  ';
                when p1T5 not in ('OC_006','OC_003') and p1C5 = 1 then
                  sTypMsg    := '0';
                  sRetFctCtl := 'L''Origine client ne correspond pas a la Remonte choisie  FDR 121   DEC';
                else
                  null;
              end case;
          
        end if;
      end;
      
      
      
      
      
      
    end;
    return;
  end;

BEGIN
  -- BPZ 12414
  if pIdtPntCpg is null or pIdtDcpGgrNumOrd is null then
    return;
  end if;
  ---------------------------------------------------------------------------------
  -- Appel de procedure de controles pour chaque cas
  ---------------------------------------------------------------------------------
  CtrlTypEmp(pIdtCtr, pIdtAcv, pChp12, pchp05);
  CtrlTypCpg(pIdtCtr, pIdtDcpGgrNumOrd, pCodTypCtr, pIdtPntCpg);
  CtrlCoeff(pDatRsl, pCodTypCtr, pCffMlp);
  CtrlTypCpg(pIdtCtr, pIdtDcpGgrNumOrd, pCodTypCtr, pIdtPntCpg);
  CtrlOrgCtr(pIdtCtr, pT5);
    CtrlFrf(pIdtCtr, pChp02, pIdtFacTyp, pIdtAcv, pCffMlp, pIdtDcpGgrNumOrd, pIdtPntCpg);
  CtrlTypFac(pIdtDcpGgrNumOrd, pIdtPntCpg, pIdtFacTyp);
  CtrlUsgTrf(pIdtAcv, pidttrf, pT1);
  CtrlRmntClt(pIdtCtr, pC1, pC2, pC3, pC4,pC5, pT5);
  ---------------------------------------------------------------------------------
  if sRetFctCtl is not null then
    return;
  end if;
end;
/
