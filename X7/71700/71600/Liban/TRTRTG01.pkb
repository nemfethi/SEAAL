CREATE OR REPLACE PACKAGE BODY X7.TRTRTG01
IS
-- ==========================================================================
-- Creation : 10/06/2003 par HNG
-- ==========================================================================
-----------------------------------------------------------------------------
-- Maj     : 19/03/2004
-- Par     : HNG
-- Contenu : Ajout de la proc�dure DELLOTRTG du traitement de suppression
--           d'un lot de routage.
-----------------------------------------------------------------------------
-----------------------------------------------------------------------------
-- Maj     : 07/12/2004
-- Par     : HNG
-- Contenu : Modification de la r�cup�ration de l'identifiant du routage
--           Fiche 3430
-----------------------------------------------------------------------------
-- Maj     : 17/12/2014
-- Par     : SJ 
-- Contenu : TRaitement de la fiche #11386 - routage des op�rations en produit pour r�pondre au besoin de SEPA
-- ==========================================================================
-- Maj     : 08/07/2014
-- Par     : SJ 
-- Contenu : Traitement de la fiche #11859 - �volutions pour SEPA + ajouter fonction versionpkg
-- correction n� fiche sur ma pr�cedente  modification! Il y a des doublons de code et il faudrait trouver le temps de faire plus propre mais mainteant je le fais pour que �a marche � partir de ce qui existait; je n'ai pas le temps de recrire plus soign�!
-- ==========================================================================
-- Maj     : 18/07/2014
-- Par     : SJ 
-- Contenu : Traitement de la fiche #11892- ajouter la fonction CtrMdtVldxOpr (la variable vSld a �t� ajout� par BPZ le 16/07/2014, je ne modifi� pas)
-- car  trtfac01.X7_IdtCtr_CptClt(opr.idtclt) retourne in contrat al�atoire du client
-- ==========================================================================
-- MAJ     : 31/07/2014 
-- PAR     : SJ
-- Contenu : traitement de la fiche 11923 : appel le  sp�cifique meme si pas des coordonn�es bancaires sur opr et dans sp�cifique je test sur les coordonnes bancaires du contrats et non pas des op�arations si x7.cltbtc01.CtlCptBnq (IdtBnq,IdtGch,NumCptBnc,CleRib,IBAN,BIC)=1;
-----------------------------------------------------------------------------
-- MAJ     : 14/08/2014 
-- PAR     : SJ
-- Contenu : traitement de la fiche 11955 : souslotrtg.datprv=trunc(opr.datexg), rtg.datdmd=sysdate + enl�ver les controle des coord bancaires pour le traitements de rmb; 
-----------------------------------------------------------------------------
-----------------------------------------------------------------------------
-- version : 70608
-- maj     : 20/08/2014
-- par     : BPZ
-- contenu : 11958: Gestion mandat changement nom, pr�nom, banque, num�ro de compte. 
-- mantis  :
-----------------------------------------------------------------------------
---
-----------------------------------------------------------------------------
-----------------------------------------------------------------------------

-- A MODIFIER A CHAQUE MODIF DU PACKAGE!!!
FUNCTION VersionPkg
--        --------- Version du package utilis�
  RETURN NUMBER
IS
BEGIN
  RETURN 71300.010;
END;

-- ==========================================================================
-----------------------------------------------------------------------------
-----------------------------------------------------------------------------
-----------------------------------------------------------------------------

FUNCTION ESTTRTRTGACT
RETURN NUMBER
IS
--
  nRtgDoc PRMGNR.RTGDOC%TYPE;
BEGIN

    SELECT RtgDoc INTO nRtgDoc FROM PRMGNR;

    IF nRtgDoc = 1
    THEN
        RETURN 1;
    ELSE
        RETURN 0;
    END IF;

    EXCEPTION
    WHEN NO_DATA_FOUND
    THEN
         RETURN 0;
    WHEN OTHERS THEN
        X7.GEST_ERREUR_CENTURA(VersionPkg(),
                              0,
                              'TRTRTG01',
                              'ESTTRTRTGACT',
                              to_char(SQLERRM),
                              sqlcode,
                              DBMS_UTILITY.FORMAT_ERROR_BACKTRACE);
        Raise;

END ESTTRTRTGACT;
-----------------------------------------------------------------------------
-----------------------------------------------------------------------------
-----------------------------------------------------------------------------
PROCEDURE GNRRTGOPR (
          pIdtOpr IN OPR.IDTOPR%TYPE,
          pIdtClt IN CLT.IDTCLT%TYPE,
          pIdtCptClt IN OPR.IDTCPTCLT%TYPE,
          pIdtTypOpr IN OPR.IDTTYPOPR%TYPE,
          pIdtAgt IN AGT.IDTAGT%TYPE )
IS
-- D�claration des variables
   vIdtTypRtg TYPRTG.IDTTYPRTG%TYPE;
   vIdtAgt    AGT.IDTAGT%TYPE;
   vCtrPrlMdtVld number;
BEGIN

    -- Si le routage de documents est activ�
    IF ESTTRTRTGACT() = 1 THEN
        --    Recherche de l'identifiant de l'agent
        vIdtAgt := pIdtAgt;
        IF vIdtAgt IS NULL THEN
            SELECT IdtAgt
            INTO vIdtAgt
            FROM AGT
            WHERE AGT.NomCnx = USER;
        END IF;
        --    Recherche du type de routage
        --SJ 21/01/2014 - fiche #11394 : r�cuperer le type de routage dans une table qui donne la correspondance idttypopr - idttyprtg et si rien touv� alors idttyprtg=typopr.idttyprtg
        
        begin 
         select nvl(typrtgtypopr.idttyprtg, typopr.idttyprtg) into vIdtTypRtg 
            from typrtgtypopr, opr, typopr 
            where opr.idtopr=pIdtOpr and 
                opr.idttypopr=typopr.idttypopr and 
                opr.idttypopr=typrtgtypopr.idttypopr(+) and
                 ((opr.idtmodrgl is null and typrtgtypopr.idtmodrgl is null) or opr.idtmodrgl=typrtgtypopr.idtmodrgl);
         select count(*) into  vCtrPrlMdtVld 
           from opr, mdt
            where idtmodrgl in (3,4) and 
                mdt.idtctr = CtrMdtVldxOpr(pIdtOpr) and 
                opr.idtopr = pIdtOpr and
                --mdt.hst=0 and
				mdt.datssc is not null and
                mdt.datrsl is null;  
                    
        exception when no_data_found then vCtrPrlMdtVld:= null;
        end;
        
        if vIdtTypRtg is null then
         SELECT IdtTypRtg
          INTO vIdtTypRtg
         FROM TYPOPR
         WHERE TYPOPR.IdtTypOpr = pIdtTypOpr;
        end if;
        --    Type de routage = Distribution de facture (IdtTypRtg = 1 et TypRtg = DTBFAC)
        --verif si vIdttypRtg  in SDD, SCT alors ctr en pr�l�vement et mandat valid ( !!! atention on ne sais pas encore qu'est ce que "mandant valid"
                
        --SJ 17/01/2014 - traitement de la fiche #11386
		-- bpz scp liban
        --IF vIdtTypRtg < 100 THEN
        IF vIdtTypRtg = 1 THEN
            if vIdtTypRtg != 5 then --si pas de pr�l�vement je lance la cr�ation du routage sans mdt valid
            -- G�n�ration des op�ration de distribution des op�ration qui ne sont pas en SEPA 
             GNRRTGOPRDTB( pIdtOpr, pIdtClt, pIdtCptClt, pIdtTypOpr, vIdtAgt, vIdtTypRtg );
            elsif nvl(vCtrPrlMdtVld,0)=1 then 
             -- si sepa et mdt vld et opr en prl alors g�n rtg
             GNRRTGOPRDTB( pIdtOpr, pIdtClt, pIdtCptClt, pIdtTypOpr, vIdtAgt, vIdtTypRtg );
             --siono n'exista pas car on fait rien
            end if;
        END IF;

        -- Implementation d'un autre type de routage ici
        -- IF vIdtTypRtg = ... THEN
        -- END IF;
        -- ...
        -- ...

    END IF;

END GNRRTGOPR;
-----------------------------------------------------------------------------
-----------------------------------------------------------------------------
-----------------------------------------------------------------------------
PROCEDURE GNRRTGOPRDTB (
          pIdtOpr OPR.IDTOPR%TYPE,
          pIdtClt CLT.IDTCLT%TYPE,
          pIdtCptClt OPR.IDTCPTCLT%TYPE,
          pIdtTypOpr OPR.IDTTYPOPR%TYPE,
          pIdtAgt AGT.IDTAGT%TYPE,
          pIdtTypRtg TYPRTG.IDTTYPRTG%TYPE )
IS
-- D�claration des variables
   vRfr           OPR.RFR%TYPE;
   vIdtLotFac     FAC.IDTLOTFAC%TYPE;
   vIdtLotRtg     LOTRTG.IDTLOTRTG%TYPE;
   vDatClcStr     VARCHAR2(11);
   vDatPrlSEPA    VARCHAR2(11);
   vIdtCtr        CTR.IDTCTR%TYPE;
   vIdtFac        FAC.IDTFAC%TYPE;
   vIdtPntCpg     CTR.IDTPNTCPG%TYPE;
   vIdtPntLvr     CTR.IDTPNTLVR%TYPE;
   vIdtTrnTyp     PNTCPG.IDTTRNTYP%TYPE;
   vIdtSousLotRtg SOUSLOTRTG.IDTSOUSLOTRTG%TYPE;
   vIdtRtg        RTG.IDTRTG%TYPE;
   vRng           RTG.RNG%TYPE;
   vSqcRngGnr     SOUSLOTRTG.SQCRNGGNR%TYPE;
   vNbElement     INTEGER;
   vIDTTYPPMT     MDT.IDTTYPPMT%type:=null;
   vIdtOprAnl     OPR.IdtOpr%type;
   vSLD           OPR.SLD%type;
   vDatRmbSEPA    DATE:=null;
   vIdtPys        PRMGNR.IdtPys%type;
   vExistCoordBnq number;
   vNote          RTG.Note%type;
   vDatExgOPR        OPR.DatExg%type;
BEGIN
    -- NB:
    -- La distribution de facture est r�duite aux op�rations de facturation
    -- ie: Facture(IdtTypOpr = 1), Annulation de facture(IdtTypOpr = 3) ,
    -- Avoir(IdtTypOpr = 4) et Annulation d'avoir (IdtTypOpr = 26).

    IF pIdtTypRtg is not null then  --SJ 08 juillet 2014 traitement de la fiche #11859 
									--au lieu  pIdtTypOpr IN (1, 3, 4, 26) THEN
        -- Recherche des informations de l'op�ration
      case 
      when pIdtTypOpr IN (1, 3, 4, 26) and pIdtTypRtg !=5 THEN -- factures mais pas pr�l�vement SEPA = ancien traitement
        SELECT OPR.Rfr,OPR.SLD
        INTO vRfr,vSLD
        FROM OPR
        WHERE OPR.IDTCLT = pIdtClt
            AND OPR.IDTCPTCLT = pIdtCptClt
            AND OPR.IDTOPR = pIdtOpr;

        BEGIN
            -- Recherche des informations sur la facture
            SELECT FAC.IdtFac, FAC.IdtLotFac, TO_CHAR(FAC.DATCLC,'DD/MM/YYYY'), CTRFAC.IdtCtr
            INTO vIdtFac, vIdtLotFac, vDatClcStr, vIdtCtr
            FROM CTRFAC, FAC
            WHERE FAC.IdtClt = pIdtClt
                  AND FAC.NumFct = vRfr
                  AND FAC.FctAnn = '0'
                  AND FAC.Numfct <> '1'
                  AND FAC.IdtFac = CTRFAC.IdtFac(+);

            -- Recherche des infos du contrat, de la tourn�e type et du rang
            IF vIdtCtr IS NOT NULL THEN
                SELECT CTR.IdtPntCpg, CTR.IdtPntLvr, PNTCPG.IdtTrnTyp, PNTCPG.Rng1
                INTO vIdtPntCpg, vIdtPntLvr, vIdtTrnTyp, vRng
                FROM PNTCPG, CTR
                WHERE CTR.IDTCTR = vIdtCtr
                    AND CTR.IDTPNTCPG = PNTCPG.IDTPNTCPG
                    AND CTR.IDTPNTLVR = PNTCPG.IDTPNTLVR;
            END IF;

            -- Recherche du sous-lot de routage(la tourn�e)
            IF vIdtLotFac IS NOT NULL THEN
                vIdtLotRtg := vIdtLotFac;
                vIdtSousLotRtg := vIdtTrnTyp;
            ELSE
                vIdtLotRtg := vDatClcStr;
                vIdtSousLotRtg := vDatClcStr;
                vIdtTrnTyp := null;
            END IF;
            -- Gestion de l'exception absence de donn�es
            EXCEPTION
            WHEN NO_DATA_FOUND
            THEN
                IF vIdtFac IS NOT NULL THEN
                    IF vIdtLotFac IS NULL THEN
                        vIdtLotRtg := vDatClcStr;
                        vIdtSousLotRtg := vDatClcStr;
                        vIdtTrnTyp := null;
                    END IF;
                END IF;
                vSLD := null;
        END;

        IF vIdtFac IS NOT NULL and vSLD > 0 THEN
            -- Cr�ation du lot de routage
            vNbElement := 0;
            SELECT COUNT(*)
            INTO vNbElement
            FROM LOTRTG
            WHERE LOTRTG.IDTLOTRTG = vIdtLotRtg;
            IF vNbElement = 0 THEN
                -- Cr�ation d'un nouveau lot de routage
                INSERT INTO LOTRTG(
                    IDTLOTRTG,
                    IDTLOTFAC,
                    LIB,
                    LIBABR,
                    DATCRT,
                    IDTAGTCRT,
                    DATMAJ,
                    IDTAGTMAJ)
                VALUES(
                    vIdtLotRtg,
                    vIdtLotFac,
                    vIdtLotRtg,
                    vIdtLotRtg,
                    Sysdate,
                    pIdtAgt,
                    Sysdate,
                    pIdtAgt);
            END IF;

            -- Cr�ation du sous lot de routage
            vNbElement := 0;
            SELECT COUNT(*)
            INTO vNbElement
            FROM SOUSLOTRTG
            WHERE SOUSLOTRTG.IDTSOUSLOTRTG = vIdtSousLotRtg
                  AND SOUSLOTRTG.IDTLOTRTG = vIdtLotRtg;
            IF vNbElement = 0 THEN
                -- Affectation de la s�quence du rang dans le sous lot
                IF  vIdtLotFac IS NULL THEN
                    -- Correspond � un sous lot de routage g�n�r�(Date de calcul de la facture)
                    vSqcRngGnr := 1;
                    vRng := vSqcRngGnr;
                ELSE
                    -- Correspond � un sous lot �gale � la tourn�e de facturation
                    vSqcRngGnr := 0;
                END IF;
                -- Cr�ation d'un nouveau sous lot de routage
                INSERT INTO SOUSLOTRTG(
                    IDTSOUSLOTRTG,
                    IDTLOTRTG,
                    LIB,
                    LIBABR,
                    DATCRT,
                    IDTAGTCRT,
                    DATMAJ,
                    IDTAGTMAJ,
                    SQCRNGGNR )
                VALUES(
                    vIdtSousLotRtg,
                    vIdtLotRtg,
                    vIdtSousLotRtg,
                    vIdtSousLotRtg,
                    Sysdate,
                    pIdtAgt,
                    Sysdate,
                    pIdtAgt,
                    vSqcRngGnr );
            ELSE
                -- La s�quence du rang ne change que si le lot de facturation est non nulle
                IF  vIdtLotFac IS NULL THEN
                    -- Recherche de la s�quence du rang dans le sous lot
                    SELECT NVL(SOUSLOTRTG.SqcRngGnr, 0) + 1
                    INTO vSqcRngGnr
                    FROM SOUSLOTRTG
                    WHERE SOUSLOTRTG.IDTSOUSLOTRTG = vIdtSousLotRtg
                          AND SOUSLOTRTG.IDTLOTRTG = vIdtLotRtg;
                    --
                    vRng := vSqcRngGnr;
                    -- Mise � jour de la s�quence du rang
                    UPDATE SOUSLOTRTG
                    SET SqcRngGnr = vSqcRngGnr,
                        IdtAgtMaj = pIdtAgt,
                        DatMaj = sysdate
                    WHERE SOUSLOTRTG.IDTSOUSLOTRTG = vIdtSousLotRtg
                          AND SOUSLOTRTG.IDTLOTRTG = vIdtLotRtg;
                END IF;
            END IF;
            -- Recherche de l'identifiant du l'op�ration de routage
            SELECT NVL(MAX(RTG.IdtRtg),0) + 1
            INTO vIdtRtg
            FROM RTG
            WHERE RTG.IDTOPR = pIdtOpr;
            -- Cr�ation de l'op�ration de routage
            -- Insertion d'une nouvelle op�ration de routage
            INSERT INTO RTG(
                IDTRTG,
                IDTOPR,
                IDTTYPRTG,
                IDTLOTRTG,
                IDTSOUSLOTRTG,
                IDTTRNTYP,
                RNG,
                RFR,
                IDTCLT,
                IDTCTR,
                IDTPNTCPG,
                IDTPNTLVR,
                DATDMD,
                IDTAGTDMD,
                MNT)
            VALUES(
                vIdtRtg,
                pIdtOpr,
                pIdtTypRtg,
                vIdtLotRtg,
                vIdtSousLotRtg,
                vIdtTrnTyp,
                vRng,
                vRfr,
                pIdtClt,
                vIdtCtr,
                vIdtPntCpg,
                vIdtPntLvr,
                sysdate,
                pIdtAgt,
                vSLD);
            -- Mise � jour de l'op�ration dans la table OPR
            UPDATE OPR
            SET IdtTypRtg = pIdtTypRtg
            WHERE OPR.IDTCLT = pIdtClt
                AND OPR.IDTCPTCLT = pIdtCptClt
                AND OPR.IDTOPR = pIdtOpr;
         
        END IF;
      when pIdtTypOpr IN (1, 3, 4, 26) and pIdtTypRtg =5 THEN -- factures et pr�l�vement SEPA 
       if pIdtTypOpr in (3,26) then 
            if pIdtTypOpr = 3 then 
                select idtoprdbt into vIdtOprAnl from opr, ltt where  ltt.idtoprcrt=opr.idtopr and idtopr=pIdtOpr;
            else 
                select idtoprcrt into vIdtOprAnl from opr, ltt where  ltt.idtoprdbt=opr.idtopr and idtopr=pIdtOpr; 
            end if;
            -- Suppression des routages associ�es
            delete rtg where idtopr=vIdtOprAnl and idtlotrtg=(select idtlotrtg from lotrtg where datfinrtg is null and idtlotrtg=rtg.idtlotrtg);
       else
        SELECT OPR.Rfr,OPR.SLD
        INTO vRfr,vSLD
        FROM OPR
        WHERE OPR.IDTCLT = pIdtClt
            AND OPR.IDTCPTCLT = pIdtCptClt
            AND OPR.IDTOPR = pIdtOpr;

          BEGIN
            -- Recherche des informations sur la facture
            SELECT FAC.IdtFac, FAC.IdtLotFac,CTRFAC.IdtCtr, TO_CHAR(opr.DATEXG,'YDDD')
            INTO vIdtFac, vIdtLotFac, vIdtCtr,  vDatPrlSEPA
            FROM CTRFAC, FAC, opr
            WHERE FAC.IdtClt = pIdtClt
                  and fac.numfct=opr.rfr
                  and opr.idttypopr in (1, 3, 4, 26)
                  AND FAC.NumFct = vRfr
                  AND FAC.FctAnn = '0'
                  AND FAC.Numfct <> '1'
                  AND FAC.IdtFac = CTRFAC.IdtFac(+);
              
           --r�cuperation des informations du mandat:           
           select trim(mdt.IDTTYPPMT), OPR.SLD, opr.DatExg into  vIDTTYPPMT ,vSLD, vDatExgOpr
            from opr, mdt
            where idtmodrgl in (3,4) and 
                mdt.idtctr = CtrMdtVldxOpr(pIdtOpr) and 
                opr.idtopr=pIdtOpr and 
                --mdt.hst = 0 and 
				mdt.datssc is not null and
                mdt.datrsl is null;      

            -- Recherche des infos du contrat, de la tourn�e type et du rang
            IF vIdtCtr IS NOT NULL and vIDTTYPPMT is not null  and vSLD > 0 THEN
                SELECT CTR.IdtPntCpg, CTR.IdtPntLvr, PNTCPG.IdtTrnTyp, PNTCPG.Rng1
                INTO vIdtPntCpg, vIdtPntLvr, vIdtTrnTyp, vRng
                FROM PNTCPG, CTR
                WHERE CTR.IDTCTR = vIdtCtr
                    AND CTR.IDTPNTCPG = PNTCPG.IDTPNTCPG
                    AND CTR.IDTPNTLVR = PNTCPG.IDTPNTLVR;
                
                vIdtLotRtg := substr(vIDTTYPPMT,1,1) ||vDatPrlSEPA;
                vIdtSousLotRtg := vIDTTYPPMT || vDatPrlSEPA;
                vIdtTrnTyp := null;
                    
            END IF;

            -- Gestion de l'exception absence de donn�es
          EXCEPTION
            WHEN NO_DATA_FOUND THEN 
                vSLD := null;
          END;

        IF vIdtFac IS NOT NULL and vIDTTYPPMT is not null and vSLD > 0 THEN
            -- Cr�ation du lot de routage
            vNbElement := 0;
            SELECT COUNT(*)
            INTO vNbElement
            FROM LOTRTG
            WHERE LOTRTG.IDTLOTRTG = vIdtLotRtg;
            IF vNbElement = 0 THEN
                -- Cr�ation d'un nouveau lot de routage
                INSERT INTO LOTRTG(
                    IDTLOTRTG,
                    IDTLOTFAC,
                    LIB,
                    LIBABR,
                    DATCRT,
                    IDTAGTCRT,
                    DATMAJ,
                    IDTAGTMAJ)
                VALUES(
                    vIdtLotRtg,
                    vIdtLotFac,
                    vIdtLotRtg,
                    vIdtLotRtg,
                    Sysdate,
                    pIdtAgt,
                    Sysdate,
                    pIdtAgt);
            END IF;

            -- Cr�ation du sous lot de routage
            vNbElement := 0;
            SELECT COUNT(*)
            INTO vNbElement
            FROM SOUSLOTRTG
            WHERE SOUSLOTRTG.IDTSOUSLOTRTG = vIdtSousLotRtg
                  AND SOUSLOTRTG.IDTLOTRTG = vIdtLotRtg;
            IF vNbElement = 0 THEN
                -- Affectation de la s�quence du rang dans le sous lot
                IF  vIdtLotFac IS NULL THEN
                    -- Correspond � un sous lot de routage g�n�r�(Date de calcul de la facture)
                    vSqcRngGnr := 1;
                    vRng := vSqcRngGnr;
                ELSE
                    -- Correspond � un sous lot �gale � la tourn�e de facturation
                    vSqcRngGnr := 0;
                END IF;
                -- Cr�ation d'un nouveau sous lot de routage
                INSERT INTO SOUSLOTRTG(
                    IDTSOUSLOTRTG,
                    IDTLOTRTG,
                    LIB,
                    LIBABR,
                    DATCRT,
                    IDTAGTCRT,
                    DATMAJ,
                    IDTAGTMAJ,
                    SQCRNGGNR,
                    datprv )
                VALUES(
                    vIdtSousLotRtg,
                    vIdtLotRtg,
                    vIdtSousLotRtg,
                    vIdtSousLotRtg,
                    Sysdate,
                    pIdtAgt,
                    Sysdate,
                    pIdtAgt,
                    vSqcRngGnr,
                    trunc(vDatExgOpr));
            ELSE
                    -- Recherche de la s�quence du rang dans le sous lot
                    SELECT NVL(SOUSLOTRTG.SqcRngGnr, 0) + 1
                    INTO vSqcRngGnr
                    FROM SOUSLOTRTG
                    WHERE SOUSLOTRTG.IDTSOUSLOTRTG = vIdtSousLotRtg
                          AND SOUSLOTRTG.IDTLOTRTG = vIdtLotRtg;
                    --
                    vRng := vSqcRngGnr;
                    -- Mise � jour de la s�quence du rang
                    UPDATE SOUSLOTRTG
                    SET SqcRngGnr = vSqcRngGnr,
                        IdtAgtMaj = pIdtAgt,
                        DatMaj = sysdate
                    WHERE SOUSLOTRTG.IDTSOUSLOTRTG = vIdtSousLotRtg
                          AND SOUSLOTRTG.IDTLOTRTG = vIdtLotRtg;
            END IF;
            -- Recherche de l'identifiant du l'op�ration de routage
            SELECT NVL(MAX(RTG.IdtRtg),0) + 1
            INTO vIdtRtg
            FROM RTG
            WHERE RTG.IDTOPR = pIdtOpr;
            -- Cr�ation de l'op�ration de routage
            -- Insertion d'une nouvelle op�ration de routage
            vNote := 'Pr�l�vement ' ||vRfr;
            INSERT INTO RTG(
                IDTRTG,
                IDTOPR,
                IDTTYPRTG,
                IDTLOTRTG,
                IDTSOUSLOTRTG,
                IDTTRNTYP,
                RNG,
                RFR,
                IDTCLT,
                IDTCTR,
                IDTPNTCPG,
                IDTPNTLVR,
                DATDMD,
                IDTAGTDMD,
                MNT,
                Note)
            VALUES(
                vIdtRtg,
                pIdtOpr,
                pIdtTypRtg,
                vIdtLotRtg,
                vIdtSousLotRtg,
                vIdtTrnTyp,
                vRng,
                vRfr,
                pIdtClt,
                vIdtCtr,
                vIdtPntCpg,
                vIdtPntLvr,
                sysdate, -- SJ 14/08/2014 traitement de la fiche 11955 :au lieu de vDAtexg mettre sysdate, vDatExg,-- sysdate  SJ 07/08/2014  au lieu de sysdate mettre vDatExg- traitement de la fiche 11948
                pIdtAgt,
                vSLD,
                vNote);
            -- Mise � jour de l'op�ration dans la table OPR
            UPDATE OPR SET 
            IdtTypRtg = pIdtTypRtg,
            IdtLotRtg = vIdtLotRtg
            WHERE OPR.IDTCLT = pIdtClt
                AND OPR.IDTCPTCLT = pIdtCptClt
                AND OPR.IDTOPR = pIdtOpr;
         
         END IF; 
        end if;       
     when pIdtTypOpr IN (19,21) and pIdtTypRtg =5 THEN -- mensualit� + msn r�gl
        SELECT OPR.Rfr, TO_CHAR(DATEXG,'YDDD'), idtctr,OPR.SLD
        INTO vRfr,vDatPrlSEPA, vIdtCtr,vSLD
        FROM OPR, echpmt 
        WHERE OPR.echpmt=echpmt.echpmt
            and OPR.IDTCLT = pIdtClt
            AND OPR.IDTCPTCLT = pIdtCptClt
            AND OPR.IDTOPR = pIdtOpr
            and idttypopr in (19,21);

          BEGIN
            
           --r�cuperation des informations du mandat:         
           select ltrim(rtrim(mdt.IDTTYPPMT)), opr.DatExg into  vIDTTYPPMT, vDatExgOpr
            from opr, mdt
            where idtmodrgl in (3,4) and 
                mdt.idtctr = CtrMdtVldxOpr(pIdtOpr) and 
                opr.idtopr=pIdtOpr and 
                --mdt.hst = 0 and 
				mdt.datssc is not null and
                mdt.datrsl is null; 
      

            -- Recherche des infos du contrat, de la tourn�e type et du rang
            IF vIdtCtr IS NOT NULL and vIDTTYPPMT is not null  and vSLD > 0 THEN
                SELECT CTR.IdtPntCpg, CTR.IdtPntLvr, PNTCPG.IdtTrnTyp, PNTCPG.Rng1
                INTO vIdtPntCpg, vIdtPntLvr, vIdtTrnTyp, vRng
                FROM PNTCPG, CTR
                WHERE CTR.IDTCTR = vIdtCtr
                    AND CTR.IDTPNTCPG = PNTCPG.IDTPNTCPG
                    AND CTR.IDTPNTLVR = PNTCPG.IDTPNTLVR;
                --SJ 14/08/2014 - traitement de la fiche 11955 : seulement la premi�re mesnualit� est first les autres sont RCUR ( en trtsepa a changer si changement ult�rieur de mdt
                select decode( to_number(substr(vrfr,instr(vrfr,'-',1,2)+1,2)), 1, vIDTTYPPMT, 'RCUR') into vIDTTYPPMT from dual; 
                
                vIdtLotRtg := substr(vIDTTYPPMT,1,1) || vDatPrlSEPA;
                vIdtSousLotRtg := vIDTTYPPMT || vDatPrlSEPA;
                vIdtTrnTyp := null;
                    
            END IF;

            -- Gestion de l'exception absence de donn�es
          EXCEPTION
            WHEN NO_DATA_FOUND THEN
                vSLD := null;
          END;

        IF vIDTTYPPMT is not null and vSLD > 0 THEN
            -- Cr�ation du lot de routage
            vNbElement := 0;
            SELECT COUNT(*)
            INTO vNbElement
            FROM LOTRTG
            WHERE LOTRTG.IDTLOTRTG = vIdtLotRtg;
            IF vNbElement = 0 THEN
                -- Cr�ation d'un nouveau lot de routage
                INSERT INTO LOTRTG(
                    IDTLOTRTG,
                    IDTLOTFAC,
                    LIB,
                    LIBABR,
                    DATCRT,
                    IDTAGTCRT,
                    DATMAJ,
                    IDTAGTMAJ)
                VALUES(
                    vIdtLotRtg,
                    vIdtLotFac,
                    vIdtLotRtg,
                    vIdtLotRtg,
                    Sysdate,
                    pIdtAgt,
                    Sysdate,
                    pIdtAgt);
            END IF;

            -- Cr�ation du sous lot de routage
            vNbElement := 0;
            SELECT COUNT(*)
            INTO vNbElement
            FROM SOUSLOTRTG
            WHERE SOUSLOTRTG.IDTSOUSLOTRTG = vIdtSousLotRtg
                  AND SOUSLOTRTG.IDTLOTRTG = vIdtLotRtg;
            IF vNbElement = 0 THEN
                -- Affectation de la s�quence du rang dans le sous lot
                IF  vIdtLotFac IS NULL THEN
                    -- Correspond � un sous lot de routage g�n�r�(Date de calcul de la facture)
                    vSqcRngGnr := 1;
                    vRng := vSqcRngGnr;
                ELSE
                    -- Correspond � un sous lot �gale � la tourn�e de facturation
                    vSqcRngGnr := 0;
                END IF;
                -- Cr�ation d'un nouveau sous lot de routage
                INSERT INTO SOUSLOTRTG(
                    IDTSOUSLOTRTG,
                    IDTLOTRTG,
                    LIB,
                    LIBABR,
                    DATCRT,
                    IDTAGTCRT,
                    DATMAJ,
                    IDTAGTMAJ,
                    SQCRNGGNR, 
                    datprv )
                VALUES(
                    vIdtSousLotRtg,
                    vIdtLotRtg,
                    vIdtSousLotRtg,
                    vIdtSousLotRtg,
                    Sysdate,
                    pIdtAgt,
                    Sysdate,
                    pIdtAgt,
                    vSqcRngGnr,
                    trunc(vDatexgOpr) );
            ELSE
                    -- Recherche de la s�quence du rang dans le sous lot
                    SELECT NVL(SOUSLOTRTG.SqcRngGnr, 0) + 1
                    INTO vSqcRngGnr
                    FROM SOUSLOTRTG
                    WHERE SOUSLOTRTG.IDTSOUSLOTRTG = vIdtSousLotRtg
                          AND SOUSLOTRTG.IDTLOTRTG = vIdtLotRtg;
                    --
                    vRng := vSqcRngGnr;
                    -- Mise � jour de la s�quence du rang
                    UPDATE SOUSLOTRTG
                    SET SqcRngGnr = vSqcRngGnr,
                        IdtAgtMaj = pIdtAgt,
                        DatMaj = sysdate
                    WHERE SOUSLOTRTG.IDTSOUSLOTRTG = vIdtSousLotRtg
                          AND SOUSLOTRTG.IDTLOTRTG = vIdtLotRtg;
            END IF;
            -- Recherche de l'identifiant du l'op�ration de routage
            SELECT NVL(MAX(RTG.IdtRtg),0) + 1
            INTO vIdtRtg
            FROM RTG
            WHERE RTG.IDTOPR = pIdtOpr;
            -- Cr�ation de l'op�ration de routage
            -- Insertion d'une nouvelle op�ration de routage
            vNote := 'Pr�l�vement ' ||vRfr;
            INSERT INTO RTG(
                IDTRTG,
                IDTOPR,
                IDTTYPRTG,
                IDTLOTRTG,
                IDTSOUSLOTRTG,
                IDTTRNTYP,
                RNG,
                RFR,
                IDTCLT,
                IDTCTR,
                IDTPNTCPG,
                IDTPNTLVR,
                DATDMD,
                IDTAGTDMD,
                MNT,
                Note )
            VALUES(
                vIdtRtg,
                pIdtOpr,
                pIdtTypRtg,
                vIdtLotRtg,
                vIdtSousLotRtg,
                vIdtTrnTyp,
                vRng,
                vRfr,
                pIdtClt,
                vIdtCtr,
                vIdtPntCpg,
                vIdtPntLvr,
                sysdate, -- SJ 14/08/2014 traitement de la fiche 11955 :au lieu de vDAtexg mettre sysdate, vDatExg,-- sysdate  SJ 07/08/2014  au lieu de sysdate mettre vDatExg- traitement de la fiche 11948
                pIdtAgt,
                vSLD,
                vNote);
            -- Mise � jour de l'op�ration dans la table OPR
            UPDATE OPR SET 
            IdtTypRtg = pIdtTypRtg,
            IdtLotRtg = vIdtLotRtg
            WHERE OPR.IDTCLT = pIdtClt
                AND OPR.IDTCPTCLT = pIdtCptClt
                AND OPR.IDTOPR = pIdtOpr;
         
        END IF;        
    when pIdtTypOpr IN (23,24) and pIdtTypRtg =5 THEN -- anulation de menualit� et mensu de regul et pr�l�vement SEPA 
                
        if pIdtTypOpr = 23 then 
         select idtoprdbt into vIdtOprAnl from opr, ltt where  ltt.idtoprcrt=opr.idtopr and idtopr=pIdtOpr;
        else 
         select idtoprcrt into vIdtOprAnl from opr, ltt where  ltt.idtoprdbt=opr.idtopr and idtopr=pIdtOpr; 
        end if;
        
        -- Suppression des routages associ�es
        delete rtg where idtopr=vIdtOprAnl and idtlotrtg=(select idtlotrtg from lotrtg where datfinrtg is null and idtlotrtg=rtg.idtlotrtg);

     when pIdtTypOpr = 30 and pIdtTypRtg =4 then -- rembouresement
      -- produit on v�rifie just que il y a des coordon�nes bancaires et � la cr�ation on les preds sur opr car auparavant � la cr�ation on v�rifi� o� il faut sur le contrat ou manadat etc
      begin 
       --SJ 14/08/2014 - traitement de la fiche 11955 : ne plus faire le controle des cocordonn�es bancaires
       --SELECT OPR.Rfr,DATCRT, x7.cltbtc01.CtlCptBnq(IdtBnq,IdtGch,NumCptBnc,CleRib,IBAN,BIC)
       -- INTO vRfr,vDatRmbSEPA, vExistCoordBnq
       -- FROM OPR
       -- WHERE OPR.IDTOPR = pIdtOpr;
         --   and idttypopr =30;
            
        if  pIdtTypOpr = 30  --vExistCoordBnq=1 and
        then          
          X7.TRTRTG01_spc.GNRRTGOPRDTB( pIdtOpr, pIdtClt, pIdtCptClt, pIdtTypOpr, pIdtAgt, pIdtTypRtg, vDatRmbSEPA ); 
        else         
          -- ici j'appel quand m�me le si le site FRANCE et dans sp�cifique je test sur les coordonnes bancaires du contrats et non pas des op�arations si x7.cltbtc01.CtlCptBnq (IdtBnq,IdtGch,NumCptBnc,CleRib,IBAN,BIC)=1; 
          select IdtPys into vIdtPys from x7.prmgnr;
          if vIdtPys='FRANCE' then         
           X7.TRTRTG01_spc.GNRRTGOPRDTB( pIdtOpr, pIdtClt, pIdtCptClt, pIdtTypOpr, pIdtAgt, pIdtTypRtg, vDatRmbSEPA );
          end if;
 
        end if;
      exception when no_data_found then 
       
       dbms_output.put_line('pas des coordon�es bancaires!');
      end;     
     when pIdtTypOpr = 36 and pIdtTypRtg=4 then -- rembouresement
     
        select idtoprdbt into vIdtOprAnl from opr, ltt where  ltt.idtoprcrt=opr.idtopr and idtopr=pIdtOpr;
        -- Suppression des routages associ�es
        delete rtg where idtopr=vIdtOprAnl and idtlotrtg=(select idtlotrtg from lotrtg where datfinrtg is null and idtlotrtg=rtg.idtlotrtg);
             
     else 
      --apel du package sp�cifique pour cr�et et/ou modifier les routages des type op�rations sp�ciques
      --trtrtg01_spc.gnrrtgopr(pIdtOpr,pIdtClt,pIdtCptClt,pIdtTypOpr,pIdtAgt,pIdtTypRtg);
                select IdtPys into vIdtPys from x7.prmgnr;
          if vIdtPys='FRANCE' then         
           X7.TRTRTG01_spc.GNRRTGOPRDTB( pIdtOpr, pIdtClt, pIdtCptClt, pIdtTypOpr, pIdtAgt, pIdtTypRtg, vDatRmbSEPA );
          end if;
     end case;
    END IF;
    -- Gestion des exceptions
    EXCEPTION
    WHEN OTHERS THEN
        X7.GEST_ERREUR_CENTURA(VersionPkg(),
                              0,
                              'TRTRTG01',
                              'GNRRTGOPRDTB',
                              to_char(SQLERRM),
                              sqlcode,
                              DBMS_UTILITY.FORMAT_ERROR_BACKTRACE);
        Raise;

END GNRRTGOPRDTB;
-----------------------------------------------------------------------------
-----------------------------------------------------------------------------
-----------------------------------------------------------------------------
PROCEDURE DELLOTRTG (
          pIdtLotRtg IN LOTRTG.IDTLOTRTG%TYPE )
IS
BEGIN

    -- Mise � jour des op�rations de routage : Table OPR
    UPDATE OPR
    SET IdtLotRtg = NULL
    WHERE IdtLotRtg = pIdtLotRtg;

    -- Suppression des opr�rations de routage : Table RTG
    DELETE FROM RTG
    WHERE IdtLotRtg = pIdtLotRtg;

    -- Suppression des sous lots de routage : Table SOUSLOTRTG
    DELETE FROM SOUSLOTRTG
    WHERE IdtLotRtg = pIdtLotRtg;

    -- Suppression du lot de routage : Table LOTRTG
    DELETE FROM LOTRTG
    WHERE IdtLotRtg = pIdtLotRtg;

    -- Gestion des exceptions
    EXCEPTION
    WHEN OTHERS THEN
        X7.GEST_ERREUR_CENTURA(VersionPkg(),
                              0,
                              'TRTRTG01',
                              'DELLOTRTG',
                              to_char(SQLERRM),
                              sqlcode,
                              DBMS_UTILITY.FORMAT_ERROR_BACKTRACE);
        Raise;

END DELLOTRTG;


--cette fonction retourn le contrat (de l'idtopr pass�e en param�tre) ayant un mandat valid  si il y a un, sinon retoun null
FUNCTION CtrMdtVldxOpr  (pIdtOpr IN OPR.IDTOPR%TYPE)
RETURN varchar2 is
 vIdtTypOpr OPR.IdtTypOpr%type;
 vIdtCtr CTR.IdtCtr%type;
begin 

  select IdtTypOpr into vIdtTypOpr from opr where IdtOpr=pIdtOpr;
 if vIdtTypOpr in (1,4,3,26) then 
     select ctrfac.idtctr into  vIdtCtr 
            from opr, mdt, ctr, ctrfac, fac
            where idtmodrgl in (3,4) and 
                fac.numfct=opr.rfr and 
                fac.idtfac = ctrfac.idtfac and 
                ctr.idtctr = ctrfac.idtctr and  
                mdt.idtctr = ctr.idtctr and 
                mdt.datrsl is null and 
                --nvl(mdt.datmaj, trunc(sysdate)) = (select max(nvl(mdt.datmaj, trunc(sysdate))) from mdt where idtctr=ctr.idtctr) and
                --mdt.hst=0 and           
				mdt.datssc is not null and
                opr.idtopr=pIdtOpr;
 
  elsif vIdtTypOpr in (19,21,23,24) then 
       select echpmt.idtctr into  vIdtCtr 
            from opr, mdt, echpmt, ctr
            where opr.idtmodrgl in (3,4) and 
                echpmt.echpmt=opr.echpmt and 
                mdt.idtctr = echpmt.idtctr and 
                ctr.idtctr=mdt.idtctr and 
                mdt.datrsl is null and 
                --nvl(mdt.datmaj, trunc(sysdate)) = (select max(nvl(mdt.datmaj, trunc(sysdate))) from mdt where idtctr=ctr.idtctr) and       
                --mdt.hst=0 and
				mdt.datssc is not null and
                mdt.datrsl is null and 
                opr.idtopr=pIdtOpr; 
  
 end if;
 
  return vIdtCtr;
exception when NO_DATA_FOUND then 
    return null;
   -- when others then  return null; -- a enl�ver 
end;

END TRTRTG01;
/
