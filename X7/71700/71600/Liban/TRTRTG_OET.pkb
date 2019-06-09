CREATE OR REPLACE PACKAGE BODY X7.Trtrtg_Oet AS
--
--
--
  cTypTcheRtg CONSTANT TYPTCHE.IdtTypTche%TYPE := 'TRT2047';
--
--
-----------------------------------------------------------------------------
-----------------------------------------------------------------------------
-----------------------------------------------------------------------------
PROCEDURE CrtLotRtgMnl(pIdtAgt AGT.IdtAgt%TYPE, pModDcl TCHE.ModDcl%TYPE)
IS
  TYPE typCUR IS REF CURSOR;
--
  vIdtSousLotRtg SOUSLOTRTG.IdtSousLotRtg%TYPE;
  cLstRtg     typCUR;
  vReqStc     SML.REQSTC%TYPE;
  vIdtLotRtg  LOTRTG.IdtLotRtg%TYPE;
  vIdtSml     SML.IdtSml%TYPE;
  vIdtTypRtg  TYPRTG.IdtTypRtg%TYPE;
  vIdtRtg     RTG.IdtRtg%TYPE;
  vTypRtgSml  TYPRTG.IdtTypRtg%TYPE;
  vIdtFacPen  FAC.IdtFac%TYPE;
  vIdtOpr     OPR.IdtOpr%TYPE;
  vDatJou     DATE;
  CURSOR cTCHE IS
    SELECT ROWID,
           DatDmd,
           Prm1 IdtSml
      FROM TCHE
      WHERE IdtTypTche = cTypTcheRtg
       AND  IdtAgt     = pIdtAgt
       AND  ModDcl     = pModDcl
       AND  Stt       IS NULL
       AND  DatRls    IS NULL;
  CURSOR cFAC IS
    SELECT OPR.ROWID,
           OPR.Sld,
           FAC.IdtFac,
           PNTCPG.IdtTrnTyp,
           PNTCPG.Rng1,
           FAC.NUMFCT,
           OPR.IdtClt,
           CTR.IdtCtr,
           PNTCPG.IdtPntLvr,
           PNTCPG.IdtPntCpg
      FROM PNTCPG, CTR, CTRFAC, FAC, OPR
      WHERE OPR.IdtOpr       = vIdtOpr
       AND  FAC.FctAnn       = 0
       -- Ajout CAL - 11/12/2004 :
       -- Il ne faut prendre que les opérations non soldées !!!
       -- On a eu le cas d'une facture incluse dans la simulation du lot
       -- payée PENDANT la simulation, avant la validation et constitution 
       -- du lot !!! Pfff... j'vous jure....
       AND  OPR.Sld          > 0
       AND  FAC.NUMFCT       = OPR.Rfr
       AND  CTRFAC.IdtFac    = FAC.IdtFac
       AND  CTR.IdtCtr       = CTRFAC.IdtCtr
       AND  PNTCPG.IdtPntLvr = CTR.IdtPntLvr
       AND  PNTCPG.IdtPntCpg = CTR.IdtPntCpg
       ;
BEGIN
  INSERT INTO SYS_HST_MSG
           (nom_utilisateur,
            nom_traitement,
            dat_courante,
            msg_code,
            msg_libelle)
    VALUES (pIdtAgt,
            'TRT2047',
            SYSDATE,
            'MSG_DEBUT',
            Trtmsg01.concat_msg('MSG_DEBUT',NULL,NULL,NULL,NULL));
  SELECT SSS_DatJou
    INTO vDatJou
    FROM SSS;
  FOR rTche IN cTche LOOP
    UPDATE TCHE
      SET Stt = 'C'
      WHERE ROWID = rTche.ROWID;
    COMMIT;
    vIdtLotRtg := rTCHE.IdtSml;
    vIdtSousLotRtg := 1;
    vIdtSml := rTCHE.IdtSml;
/*
    select ReqStc, IdtTypRtg
      into vReqStc, vTypRtgSml
      from SML
      where IdtSml = vIdtSml;
    vReqStc := vReqStc || ' INTERSECT
*/
    vReqStc := ' select IdtOpr, nvl(:IdtTypRtg,IdtTypRtg)
                 FROM LSTRTG
                 WHERE IdtSml = :IdtSml
                   AND  RtgEff = 1';
-- Création du lot de routage
    INSERT INTO LOTRTG (IdtLotRtg,
                        Lib,
                        LibAbr,
                        DatCrt,
                        IdtAgtCrt,
                        DatMaj,
                        IdtAgtMaj)
                VALUES (vIdtLotRtg,
                        vIdtLotRtg,
                        vIdtLotRtg,
                        vDatJou,
                        pIdtAgt,
                        vDatJou,
                        pIdtAgt);
-- Création du sous lot de routage
    INSERT INTO SOUSLOTRTG (IdtSousLotRtg,
                            IdtLotRtg,
                            Lib,
                            LibAbr,
                            DatCrt,
                            IdtAgtCrt,
                            DatMaj,
                            IdtAgtMaj,
                            SqcRngGnr)
                    VALUES (vIdtSousLotRtg,
                            vIdtLotRtg,
                            vIdtSousLotRtg,
                            vIdtSousLotRtg,
                            vDatJou,
                            pIdtAgt,
                            vDatJou,
                            pIdtAgt,
                            1);
    OPEN cLSTRTG FOR vReqStc USING vTypRtgSml, vIdtSml;
      LOOP
        FETCH cLSTRTG INTO vIdtOpr, vIdtTypRtg;
        EXIT WHEN cLSTRTG%NOTFOUND;
        FOR rFAC IN cFAC LOOP
-- Facturation des penalités pour la facture
--          TRTPEN_OET.CreFacMvmExc(rFAC.IdtClt,
--                                  null,
--                                  TRTPEN_OET.cTypRbrPen,
--                                  TRTPEN_OET.cTypFctPen,
--                                  pIdtAgt,
--                                  rFAC.IdtFac,
--                                  vIdtFacPen);
-- Validation de la facture de penalités
--          TRTFAC01.Val1Fac(vIdtFacPen,
--                           vDatJou,
--                           null,
--                           pIdtAgt);
-- Insertion du document dans la table Routage
----------------------------------------------------------------------------
-------------------------modifie le 06 aout 2009----------------------------
------------si le lot est supprime, on pourra avoir un count(*)+1----------- 
-------qui sera egale a la  valeur existante => primary key violation-------
-----------------c'est pourquoi on a modifie le select---------------------- 
----------------------------------------------------------------------------

-- SJ 22 jan 2010 
-- OLD
--          SELECT COUNT(*) + 1
--            INTO vIdtRtg
--            FROM RTG
--            WHERE IdtOpr = vIdtOpr;

-- NEW
begin 

SELECT nvl(max(idtrtg), 0) + 1 INTO vIdtRtg FROM RTG WHERE IdtOpr = vIdtOpr;

Exception when no_data_found then vIdtRtg :=1;

End;

-- Charly : Apres la ceinture, les bretelles...
if vIdtRtg is null then
  vIdtRtg := 0;
end if;

TrtMsg01.WriteSimpleLogFile('ROUTAGE','TrtRtg_OET.CrtLotRtgMnl() : vIdtRtg = ' || to_char(vIdtRtg) || '   vIdtOpr = ' || to_char(vIdtOpr));

-- end SJ 22 jan 2010 

-- sj 06 aout 2009
-- mais ca a arrete la sortie de tous les autres lots

--BEGIN 
--	  SELECT  MAX(NVL(idtrtg,0)) + 1 
--	  INTO vIdtRtg 
--	  FROM RTG 
--	  WHERE IdtOpr = vIdtOpr;
--	  EXCEPTION WHEN NO_DATA_FOUND THEN vIdtRtg;  
--END;
-- sj 06 aout 2009
          INSERT INTO RTG (IdtRtg,
                           IdtOpr,
                           IdtTypRtg,
                           IdtLotRtg,
                           IdtSousLotRtg,
                           Rng,
                           Rfr,
                           IdtClt,
                           IdtCtr,
                           IdtPntCpg,
                           IdtPntLvr,
                           DatDmd,
                           IdtAgtDmd,
                           Mnt)
                   VALUES (vIdtRtg,
                           vIdtOpr,
                           vIdtTypRtg,
                           vIdtLotRtg,
                           vIdtSousLotRtg,
                           rFAC.Rng1,
                           rFAC.NUMFCT,
                           rFAC.IdtClt,
                           rFAC.IdtCtr,
                           rFAC.IdtPntCpg,
                           rFAC.IdtPntLvr,
                           vDatJou,
                           pIdtAgt,
                           -- *** Modif CAL 10-02-2004 ***
                           -- Ancienne version...
                           -- TRTPEN_OET.SldPenFacxFac(rFAC.IdtFac)+TRTPEN_OET.SldPenNonFacxFac(rFAC.IdtFac)+ rFAC.Sld
                           -- On veut maintenant le montant de l'opération en tenant compte d'un éventuel changement de
                           -- TVA !! Ceci nous empeche de prendre en compte le solde de la facture. On reprendra
                           -- donc le montant réel recalculé du BORDEREAU complet de la facture (avec timbre, pénalités
                           -- et TVA différentielle si il y a lieu...)
                           Mntdocrtg(vIdtOpr)
                           );
          UPDATE OPR
            SET IdtTypRtg = vIdtTypRtg,
                IdtLotRtg = vIdtLotRtg
            WHERE ROWID = rFAC.ROWID;
        END LOOP;
      END LOOP;
    CLOSE cLSTRTG;
    UPDATE TCHE
      SET Stt = 'F',
          DatRls = SYSDATE
      WHERE ROWID = rTche.ROWID;
    DELETE LSTRTG
      WHERE IdtSml = rTCHE.IdtSml;
    COMMIT;
  END LOOP;
  INSERT INTO SYS_HST_MSG
           (nom_utilisateur,
            nom_traitement,
            dat_courante,
            msg_code,
            msg_libelle)
    VALUES (pIdtAgt,
            'TRT2047',
            SYSDATE,
            'MSG_FIN',
            Trtmsg01.concat_msg('MSG_FIN',NULL,NULL,NULL,NULL));
END CrtLotRtgMnl;
END Trtrtg_Oet;
/
