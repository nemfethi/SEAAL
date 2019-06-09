CREATE OR REPLACE package body X7.TRTEXP01 is
-----------------------------------------------------------------------------
-- Version : 70603.004
-- Maj     : 15/06/2014
-- Par     : BPZ
-- Contenu : 11739: Pouvoir choisir le format de sortie du publipostage
-----------------------------------------------------------------------------
-- Version : 70608.025
-- Maj     : 12/07/2014
-- Par     : FBE
-- Contenu : - 11870: Gestion de la langue des dates sur les rapports de publipostage
--           - 11871: Problemes de Timeout dans le publipostage
--           - 11873: Mise en commentaire des instruction dans le traitement d'export
--           - 11880: Envoyer la condition et le nom du fichier dans le traitement spécifique de publipostage
-----------------------------------------------------------------------------
-----------------------------------------------------------------------------
-- Version : 71600.042
-- Maj     : 19/07/2018
-- Par     : BPZ
-- Contenu : nls_instance
-----------------------------------------------------------------------------

--***************************************************************************************
-- Variables
--***************************************************************************************
  gProgression boolean := TRUE;
--***************************************************************************************
-- VersionPkg :
-- Retourne la version du package
-- A CHANGER A CHAQUE MODIFICATION DU PACKAGE
--***************************************************************************************
FUNCTION VersionPkg RETURN NUMBER
IS
BEGIN
  RETURN 71600.042;
END VersionPkg;
--***************************************************************************************
-- GenMsq
--***************************************************************************************
FUNCTION GenMsq  (pMsq varchar2,
                  pTypDon varchar2,
                  pSymMon varchar2,
                  pChrDec varchar2,
                  pChrMil varchar2)
  RETURN varchar2 is
  vRet varchar2(200);
  vValN number;
  vValD date;
  vChrDec varchar2(1);
  vChrMil varchar2(1);
  vStrNls varchar2(2000);
  vStr1 varchar2(100);
  vStr2 varchar2(100);
BEGIN
  vValN := 1234.5;
  vValD := to_date('01/12 13:41:30','DD/MM HH24:MI:SS');
  if upper(pTypDon) not in ('N','D') then
    return null;
  end if;
  if upper(pTypDon) = 'N' then
    if pChrDec is null or pChrMil is null then
      select coalesce(pChrDec,ChrDec,cDEFAUT_CARACTERE_DECIMAL), coalesce(pChrMil,ChrMil,cDEFAUT_CARACTERE_MILLIER)
        into vChrDec, vChrMil
        from PRMGNR;
    else
      vChrDec := pChrDec;
      vChrMil := pChrMil;
    end if;
    if vChrDec is not null and vChrMil is not null then
      vStrNls := 'NLS_NUMERIC_CHARACTERS=''' || vChrDec || vChrMil || '''';
    end if;
    if pSymMon is not null then
      if vStrNls is not null then
        vStrNls := vStrNls || ' ';
      end if;
      vStrNls := vStrNls || 'NLS_CURRENCY=''' || pSymMon || '''';
    end if;
    -- Utilisation de SQL au lieu de PL/SQL car les espaces sont supprimes en PL
    if vStrNls is not null then
      select to_char(vValN,pMsq,vStrNls)
        into vStr1
        from dual;
      select to_char(-vValN,pMsq,vStrNls)
        into vStr2
        from dual;
    else
      select to_char(vValN,pMsq)
        into vStr1
        from dual;
      select to_char(-vValN,pMsq)
        into vStr2
        from dual;
    end if;
  elsif upper(pTypDon) = 'D' then
    select to_char(vValD,pMsq)
      into vStr1
      from dual;
  end if;
  vRet := '"' || vStr1 || '"';
  if vStr2 is not null then
    vRet := vRet || '|"' || vStr2 || '"';
  end if;
  return vRet;
END GenMsq;
--***************************************************************************************
-- ValiderModele
--***************************************************************************************
PROCEDURE ValiderMasque(pIdtTypExp number,
                        pTypDonSrc varchar2,
                        pTypDonSrt varchar2,
                        pSymMon varchar2,
                        pChrDec varchar2,
                        pChrMil varchar2,
                        pMsq varchar2,
                        pMsg OUT varchar2,
                        pTypMsg OUT varchar2) is
  vValN number;
  vValN2 number;
  vValD date;
  vVal  varchar2(200);
  vVal1  varchar2(200);
  vVal2  varchar2(200);
  vMsq1   varchar2(200);
  vMsq2   varchar2(200);
  vCodMsg varchar2(20);
  vMsg    varchar2(4000);
  eErreur EXCEPTION;
BEGIN
  pMsg := null;
  pTypMsg := null;
  --------------------------------------------------------------------------------
  -- Si la masque n'est pas saisie, il n'y a rien a controler, on sors
  --------------------------------------------------------------------------------
  if pMsq is null then
    return;
  end if;
  --------------------------------------------------------------------------------
  -- Pas de masque possible si le type de donnee source est alphanumerique
  --------------------------------------------------------------------------------
  if pTypDonSrc = 'A' then
    vCodMsg := 'ERR_TRTEXP0005';
    raise eErreur;
  end if;
  --------------------------------------------------------------------------------
  -- Validation du masque numerique
  --------------------------------------------------------------------------------
  if pTypDonSrc = 'N' then
    vValN := 9;
    BEGIN
      vVal := to_char(vValN,pMsq);
    EXCEPTION
      when others then
        vCodMsg := 'ERR_TRTEXP0003'; -- Masque numerique non valide
        raise eErreur;
    END;
    --------------------------------------------------------------------------------
    -- Validation de la coherence de la masque par rapport le type de donnee de sortie
    --------------------------------------------------------------------------------
    if pTypDonSrt = 'D' then
      vCodMsg := 'ERR_TRTEXP0008'; -- Un nombre ne genere pas une date
      raise eErreur;
    end if;
  end if;
  --------------------------------------------------------------------------------
  -- Validation du masque date
  --------------------------------------------------------------------------------
  if pTypDonSrc = 'D' then
    vValD := sysdate;
    BEGIN
      vVal := to_char(vValD,pMsq);
      EXCEPTION
        when others then
          vCodMsg := 'ERR_TRTEXP0001';  -- Masque de date non valid
          raise eErreur;
    END;
    --------------------------------------------------------------------------------
    -- Validation du masque date pour les fichiers XML
    --------------------------------------------------------------------------------
    if pTypDonSrt = 'D' and pIdtTypExp = cTYPE_FICHIER_XML then
      vValD := to_date('31/12/2099 23:59:59','DD/MM/YYYY HH24:MI:SS');
      vMsq1 := upper(replace(pMsq,' ',null));
      vMsq1 := upper(replace(vMsq1,'.',null));
      vMsq1 := upper(replace(vMsq1,'c',null));
      vMsq1 := upper(replace(vMsq1,'"T"',null));
      if instr(vMsq1,'MM') > 0 then
        -- Si le masque contient la date le format est strict
        vMsq2 := 'YYYY-MM-DD';
      end if;
      if instr(vMsq1,'HH') > 0 then
        vMsq2 := vMsq2 || 'HH24:MI:SS';
      end if;
      vVal1 := to_char(vValD,vMsq1);
      vVal2 := to_char(vValD,vMsq2);
      -- Les valeurs doivent etre identiques si le masque est correct
      if vVal1 <> vVal2 then
        vCodMsg := 'ERR_TRTEXP0002';  -- Masque XML non valide pour les dates
        raise eErreur;
      end if;
    end if;
    --------------------------------------------------------------------------------
    -- Validation de la coherence de la masque par rapport le type de donnee de sortie
    --------------------------------------------------------------------------------
    if pTypDonSrt = 'N' then
      vValD := sysdate;
      BEGIN
        vValN := to_number(to_char(vValD,pMsq));
      EXCEPTION
        when others then
          vCodMsg := 'ERR_TRTEXP0007'; -- Le masque ne genere pas un nombre
          raise eErreur;
      END;
    end if;
  end if;
EXCEPTION
  when eErreur then
    vMsg := TRTMSG01.ChercheMsg(vCodMsg);
    vMsg := REGEXP_Replace(vMsg,':Val1',vVal1,1,0,'i');
    vMsg := REGEXP_Replace(vMsg,':Val2',vVal2,1,0,'i');
    vMsg := REGEXP_Replace(vMsg,':Masque',pMsq,1,0,'i');
    pMsg:= vMsg;
    pTypMsg := 0;
--  when others then
--    raise;
END ValiderMasque;
--***************************************************************************************
-- ValiderModele
--***************************************************************************************
PROCEDURE ValiderModele(pIdtExpMdl number,
                        pMsg OUT varchar2,
                        pTypMsg OUT varchar2) is
  cursor cMDL is
    select EXPMDL.IdtTypExp,
           EXPMDL.Ent,
           EXPMDL.LngFix,
           EXPMDL.SymMon,
           EXPMDL.ChrDec,
           EXPMDL.ChrMil,
           nvl(EXPMDL.StrImp,0) StrImp,
           EXPCOL.TypDon TypDonSrc,
           EXPMDLDET.*
      from EXPMDLDET,
           EXPMDL,
           EXPCOL
      where EXPMDL.IdtExpMdl   = EXPMDLDET.IdtExpMdl
       and  EXPCOL.IdtExpCol(+) = EXPMDLDET.IdtExpCol
       and  EXPMDLDET.IdtExpMdl = pIdtExpMdl
      order by Ord;
  type typTABMDL is table of cMDL%ROWTYPE index by binary_integer;
  type typRECERREUR is record (Lgn number,
                               Texte varchar2(4000));
  type typTABERREUR is table of typRECERREUR index by binary_integer;
  tMDL typTABMDL;
  tERR typTABERREUR;
  vOldLgn number;
  vMinNiv number;
  vLimitErreur number := 10;
  vMsg varchar2(32767);
  j number;
BEGIN
  pMsg := null;
  pTypMsg := null;
  open cMDL;
    fetch cMDL
      bulk collect into tMDL;
  close cMDL;
  if tMDL.Count = 0 then
    return;
  end if;
  j := 0;
  for i in 1..tMDL.Count loop
    --------------------------------------------------------------------------------
    -- Validations pour les fichiers XML
    --------------------------------------------------------------------------------
    if tMDL(i).IdtTypExp = cTYPE_FICHIER_XML then
      tMDL(i).LngFix := 0;
      if tMDL(i).Niv is null then
        j := j + 1;
        tERR(j).Lgn := i;
        tERR(j).Texte := TRTMSG01.ChercheMsg('ERR_TRTEXP0009'); -- Le niveau est obligatoire
        if j > vLimitErreur then
          exit;
        end if;
      end if;
      if i = 1 then
        vMinNiv := tMDL(i).Niv;
        if tMDL(i).IdtExpTypEle = TRTXML01.cTYPE_ELEMENT_ATTRIBUT then
          j := j + 1;
          tERR(j).Lgn := i;
          tERR(j).Texte := TRTMSG01.ChercheMsg('ERR_TRTEXP0011'); -- Un attribut ne peut pas être au niveau de la racine
          tERR(j).Texte := REGEXP_Replace(tERR(j).Texte,':Niv',vMinNiv,1,0,'i');
          if j > vLimitErreur then
            exit;
          end if;
        end if;
      else
        if tMDL(i).Niv <= vMinNiv then
          j := j + 1;
          tERR(j).Lgn := i;
          tERR(j).Texte := TRTMSG01.ChercheMsg('ERR_TRTEXP0010'); -- Un seul element dans la racine
          tERR(j).Texte := REGEXP_Replace(tERR(j).Texte,':Niv',vMinNiv,1,0,'i');
          if j > vLimitErreur then
            exit;
          end if;
        end if;
      end if;
      if tMDL(i).IdtExpTypEle is null then
        j := j + 1;
        tERR(j).Lgn := i;
        tERR(j).Texte := TRTMSG01.ChercheMsg('ERR_TRTEXP0015'); -- Type d'element obligatoire
        if j > vLimitErreur then
          exit;
        end if;
      end if;
    end if;
    --------------------------------------------------------------------------------
    -- Validations generales
    --------------------------------------------------------------------------------
    if tMDL(i).Ent = 1 or tMDL(i).IdtTypExp = cTYPE_FICHIER_XML then
      if tMDL(i).CodCol is null then
        j := j + 1;
        tERR(j).Lgn := i;
        tERR(j).Texte := TRTMSG01.ChercheMsg('ERR_TRTEXP0012'); -- Le nom de la colonne est obligatoire
        if j > vLimitErreur then
          exit;
        end if;
      end if;
    end if;
    if tMDL(i).LngFix = 1 then
      if tMDL(i).Lng is null then
        j := j + 1;
        tERR(j).Lgn := i;
        tERR(j).Texte := TRTMSG01.ChercheMsg('ERR_TRTEXP0013'); -- Longueur obligatoire si longueur fixe
        if j > vLimitErreur then
          exit;
        end if;
      end if;
      if tMDL(i).IdtExpChrPad is null then
        j := j + 1;
        tERR(j).Lgn := i;
        tERR(j).Texte := TRTMSG01.ChercheMsg('ERR_TRTEXP0014'); -- Caractere de remplissage obligatoire
        if j > vLimitErreur then
          exit;
        end if;
      end if;
    end if;
    ValiderMasque(tMDL(i).IdtTypExp, tMDL(i).TypDonSrc, tMDL(i).TypDon, tMDL(i).Msq, tMDL(i).SymMon, tMDL(i).ChrDec, tMDL(i).ChrMil, vMsg, pTypMsg);
    if vMsg is not null then
      j := j + 1;
      tERR(j).Lgn := i;
      tERR(j).Texte := vMsg;
      if j > vLimitErreur then
        exit;
      end if;
    end if;
  end loop;
  vMsg := null;
  vOldLgn := 0;
  for j in 1..tERR.Count loop
    if tERR(j).Lgn <> vOldLgn then
      vOldLgn := tERR(j).Lgn;
      if vMsg is not null then
        vMsg := vMsg || chr(13) || chr(10);
      end if;
      vMsg := vMsg || '==> ' || TRTMSG01.ChercheMsg('ERR_TRTEXP0016');
      vMsg := REGEXP_Replace(vMsg,':Lgn',tERR(j).Lgn,1,0,'i');
    end if;
    vMsg := vMsg || chr(13) || chr(10) || '    ' || tERR(j).Texte;
  end loop;
  -- Si le modele est correct, on met a jour le XSD si type de fichier XML et
  -- si le XSD n'a pas ete importe
  if tMDL(1).IdtTypExp = cTYPE_FICHIER_XML and tMDL(1).StrImp = 0 and vMsg is null then
    update EXPMDL
      set Str = TRTXML01.GenererXsd(pIdtExpMdl)
      where IdtExpMdl = pIdtExpMdl;
  end if;
  if vMsg is not null then
    pMsg := vMsg;
    pTypMsg := 0;
  end if;
END ValiderModele;
-- ==========================================================================
-- Fonction Tri_To_OrderBy
-- Objet:       Realise la transformation du tri stocke en clause Order by Oracle
-- Retour     : Clause order by
-- Parametres : pIdtExpMdl:      Id du modele d'exportation
-----------------------------------------------------------------------------
function Tri_To_OrderBy(pIdtExpMdl number)
  return varchar2 is
  vOrd varchar2(2000);               -- Clause order by
  -- La requete suivante donne priorite aux colonnes utilisees dans le modele
  -- comme "pere", dans le cas de sortie XML
  cursor cCur is
    select EXPCOL.NOM || decode(nvl(EXPMDLTRI.TRI,'A'),'A', ' ASC','D',' DESC') TRI
      from EXPCOL,
           (select EXPMDLTRI.IdtExpMdl, EXPMDLTRI.IdtExpCol, 1 Ord1, IdtExpMdlTri Ord2, EXPMDLTRI.Tri
              from EXPMDLTRI
            union all
            select EXPMDL.IdtExpMdl, IdtExpColPere, 2 Ord1, min(OrdPere) Ord2, to_char(null) Tri
             from X7_EXPMDLDET_VIEW1, EXPMDL
             where X7_EXPMDLDET_VIEW1.IdtExpMdl = EXPMDL.IdtExpMdl
              and  EXPMDL.IdtTypExp = 2
              and  IdtExpTypEle <> 2
              and  IdtExpColPere is not null
              and  decode(nvl(EXPMDL.Pub,0),0,NivPere,0) <> NivRcn
              and  (EXPMDL.IdtExpMdl, IdtExpColPere) not in (select IdtExpMdl, IdtExpCol from EXPMDLTRI where IdtExpMdl = pIdtExpMdl)
             group by EXPMDL.IdtExpMdl, IdtExpColPere) EXPMDLTRI
      where EXPCOL.IDTEXPCOL = EXPMDLTRI.IDTEXPCOL
       and  EXPMDLTRI.IDTEXPMDL = pIdtExpMdl
      order by Ord1, Ord2;
BEGIN
  vOrd := null;
  for rCur in cCur loop
    if vOrd is null then
      vOrd := 'order by ';
    else
      vOrd := vOrd || ',';
    end if;
    vOrd := vOrd || rCUR.TRI;
  end loop;
  return vOrd;
END Tri_To_OrderBy;
--***************************************************************************************
-- EcrireFichierTexte
-------------------------------------------------------------
-- Realise l'ecriture d'un fichier texte a partir des donnees
-- deja extraites dans la table tampon. Ce procedure est
-- appelee par la procedure GenererFichier, s'il s'agit de la
-- generation d'un fichier texte, elle doit etre appellee apres d'avoir genere les donnees
--***************************************************************************************
procedure EcrireFichierTexte(pIdtExpMdl number,
                             pNomFichier varchar2) is
  cursor cEXPDON is
    select Lgn, Val
      from EXPDON
      order by Ord;
  type typTABDON is table of cEXPDON%ROWTYPE index by binary_integer;
  tDON typTABDON;
  vFichier UTL_FILE.File_Type;
  vCheminFichier varchar2(200);
  vNomFichier varchar2(200);
  vChrSep varchar2(1);
  vLimit number := 100000;
  vOldLgn number := -1;
  vStr varchar2(32767);
  vCol number;
  vDEBUG_vDatDeb date;
  vDEBUG_vDatFin date;
  vDEBUG_StrInfo varchar2(2000);
BEGIN
  if gTrace then
    DBMS_APPLICATION_INFO.READ_CLIENT_INFO(vDEBUG_StrInfo);
    DBMS_APPLICATION_INFO.SET_CLIENT_INFO(vDEBUG_StrInfo || '/EcrireFichierTexte');
  end if;
  select EXPCHR.ExpChr
    into vChrSep
    from EXPMDL,
         EXPCHR
    where EXPCHR.IdtExpChr(+) = EXPMDL.IdtExpChrSep
     and  EXPMDL.IdtExpMdl = pIdtExpMdl;
  vNomFichier    := pNomFichier;
  -- Extraction du repertoire et du nom du fichier
  vCheminFichier := substr(vNomFichier, 1, instr(vNomFichier,'\',-1)-1);
  --vCheminFichier := 'TEMPLATEXDOC';
  vNomFichier    := substr(vNomFichier,instr(vNomFichier,'\',-1)+1);
  -- Ouverture du fichier
  vFichier := UTL_FILE.FOpen(vCheminFichier,vNomFichier,'w',32767);
  vDEBUG_vDatDeb := sysdate;
  open cEXPDON;
    loop
      fetch cEXPDON
        bulk collect into tDON;
      if tDON.Count = 0 then
        exit;
      end if;
      -- Parcours de l'information
      for i in 1..tDON.Count loop
        -- Si changement de ligne, on ecrit l'information
        if tDON(i).Lgn <> vOldLgn then
          if vOldLgn <> -1 then
            UTL_FILE.Put_Line(vFichier,vStr);
          end if;
          vStr := null;
          vOldLgn := tDON(i).Lgn;
          vCol := 1;
        end if;
        if vCol > 1 then
          vStr := vStr || vChrSep;
        end if;
        vStr := vStr || tDON(i).Val;
        vCol := vCol + 1;
      end loop;
      UTL_FILE.Put_Line(vFichier,vStr);
      UTL_FILE.FFlush(vFichier);
    end loop;
  close cEXPDON;
  UTL_FILE.FClose(vFichier);
  vDEBUG_vDatFin := sysdate;
  if gTrace then
    DBMS_OUTPUT.Put_Line('Ecriture fichier:' || NumToDSInterval(vDEBUG_vDatFin-vDEBUG_vDatDeb,'DAY'));
  end if;
  if gTrace then
    DBMS_APPLICATION_INFO.SET_CLIENT_INFO(vDEBUG_StrInfo);
  end if;
END EcrireFichierTexte;
--***************************************************************************************
-- GenererXML
-------------------------------------------------------------
-- Realise la generation du corps du XML a partir des donnees
-- deja extraites dans la table tampon. Ce procedure doit etre
-- appellee apres d'avoir genere les donnees
--***************************************************************************************
procedure GenererXML(pIdtExpMdl number,
                     pDoc IN OUT NOCOPY DBMS_XMLDOM.DOMDocument) is
  -- Definition des constants
  cStrSiNul CONSTANT varchar2(10) := 'zzz';
  cNumSiNul CONSTANT number := -1;
  cATTRIBUT_SUR_NOEUD number := 1;
  cATTRIBUT_SUR_ELEMENT number := 0;
  cursor cCurDon is
    select Lgn,
--           trim(Val) Val
           Val Val
--           null val
      from EXPDON
--      where Lgn <= 10
      order by Ord;
  subtype typIDXCHAR is varchar2(2000);
  type typTABCOL is table of number index by binary_integer;          -- Type de tableau pour contenir les numeros de colonnes
  type typTABPERE is table of typTABCOL index by binary_integer;      -- Type de tableau pour contenir les noueds peres et ses fils
  type typTABVALELE is table of number index by typIDXCHAR;           -- L'index de ce tableau contient les valeurs des elements, pour empecher d'ecrire 2 fois la meme valeur
                                                                      -- d'un element a l'interieur d'un meme noeud
  type typRECVALELE is record (DrnEle number,                         -- Stockage du dernier element ecrit
                               LstVal typTABVALELE);                  -- Liste de valeurs peres
  type typTABVALELE2 is table of typRECVALELE index by typIDXCHAR;    -- Tableau contenant les valeurs des elements pour les peres
  type typTABELE is table of typTABVALELE index by binary_integer;    -- Tableau contenant les valeurs des elements pour chaque colonne qui n'est pas un noeud pere
  type typNODE is record(Node DBMS_XMLDOM.DOMNode,                    -- Stocke l'information du dernier noeud cree pour une colonne qui n'est pas un attribut
                         EstRup number,                               -- Etabli s'il y a eu une rupture a niveau de ce noeud pere
                         Chemin varchar2(2000),                       -- Garde la derniere valeur du noeud, avec toutes les valeures des peres precedents separes par /
                         LstChemin typTABVALELE2);                        -- Tableau avec tous les valeurs deja ecrites pour les noueds: (pere)(noeud). Permet de savoir si la valeur
                                                                      -- du noeud a deja ete traite sur un pere, dans le cas ou les donnees ne soient pas tries dans le bon ordre.
                                                                      -- Cette information est alimentee seulement pour les noeuds peres d'elements
  type typTABNODE is table of typNODE index by binary_integer;        -- Stockage des noeuds
  type typCUR is REF CURSOR return EXPDON%ROWTYPE;
  type typMDL is record (Lgn number,                                  -- Derniere ligne traitee
                         Ord number,                                  -- Numero d'ordre de la ligne
                         CodCol varchar2(30),                         -- Code de la colonne, utilise comme nom de la balise
                         BlsObl number,                               -- Ecriture de balise obligatoire si la valeur est nulle
                         NumColPere number,                           -- Numero de la colonne du pere dans le meme tableau (index)
                         NumColSvn number,                            -- Numero de la colonne du "frere" suivant (non attribut) a l'interieur du tableau (index)
                         TypEle  number,                              -- Type d'element: Element; Attibut; CDATA, ...
                         TypAtr  number,                              -- Type d'attribut: Sur noued pere ou sur element simple
                         AAtr number,                                 -- Etabli si l'element a au moins un attribut
                         Niv number,                                  -- Niveau de la colonne d'apres le parametrage
                         Val varchar2(2000),                          -- Stocke le dernier valeur pour la colonne
                         EstPere number,                              -- Etabli s'il s'agit d'un noued pere ou non. Un noued pere est un element avec elements fils (hormis les attributs)
                         Ecr number);                                 -- Signale si l'element doit etre ecrire
  type typTABMDL is table of typMDL index by binary_integer;
  type typTABEXPDON is table of cCurDon%ROWTYPE index by binary_integer;
  tPERE typTABPERE;           -- Tableau pour les noueds peres et ses fils
  tTabColNul typTABCOL;       -- Valeur nulle pour le type de tableau de colonnes
  tDON typTABEXPDON;          -- Tableau pour les donnees a ecrire
  tMDL typTABMDL;             -- Tableau pour le parametrage des colonnes
  tEle  typTABELE;            -- Tableau pour les elements simples
  vLimit number := 100000;    -- Limit de lecture de donnes par block. On recupere seule 3 colonnes, donc, la valeur peut etre haute
  vRoot DBMS_XMLDOM.DOMNode;  -- Noeud racine
  vNode DBMS_XMLDOM.DOMNode;  -- Variable tampon pour un noeud
  vNodeTmp DBMS_XMLDOM.DOMNode;  -- Variable temporaire pour un noeud
  vNodePere DBMS_XMLDOM.DOMNode;   -- Variable tampon pour un noeud pere
  vColElePrc number;          -- Variable qui garde le dernier element traite
  vLgn number;
  vCol number;                -- Numero de la colonne en cours de traitement
  vVal EXPDON.Val%TYPE;
  vColPere number;            -- Numero de la colonne pere de la colonne en cours de traitement
  vColSvn number;             -- Numero de la colonne "soeur" suivante de la colonne en cours de traitement
  vIdxEle typIDXCHAR;         -- Index du tableau des elements.
  tNode typTABNODE;           -- Tableau de noueds
  vNumColRoot number;         -- Numero de la colonne qui contient le noeud racine
                              -- NOTE: Attention lors du parcours du tableau tMDL, il faut le parcourir de 1..tMDL.Last. Il ne faut pas utiliser tMDL.Count, car on a cree
                              --       l'element zero, donc il y a une ligne de plus
  vStr varchar2(2000);        -- Variable tampon pour les traitement des chaines
  vChrSet varchar2(20);       -- Character set
  vCodExpMdl EXPMDL.CodExpMdl%TYPE; -- Code externe du modele. Valeur utilisee dans la signature du fichier XML extrait pour tracage
  vNomXsd varchar2(1000);     -- Nom du fichier XSD pour le XML genere
  vXsd    clob;
  vPathXsd varchar2(1000);    -- Chemin d'access pour le fichier XSD
  vPub number;                -- Indicateur de publipostage
  vCodRoot varchar2(30);      -- Code pour le noeud root
  vNbr number;
  vEnt number;                -- Faut il generer l'entete?
  vIdxVal typIDXCHAR;         -- Chemin des valeurs pour le noeud
  vIdxValPere typIDXCHAR;     -- Chemin des valeurs pour le pere du noeud
  vNumEle number;             -- Numero d'ordre de l'element du meme nom dans son pere
  vStrTmp varchar2(2000);
  vDEBUG_vDatDeb date;
  vDEBUG_vDatFin date;
  vDEBUG_StrInfo varchar2(2000);
  n number;
  l number;
  vDEBUG_Total number;
  vDEBUG_Step number:=1000;
  vDEBUG_Progression number;
  vDEBUG_Id number;
  vClobTmp varchar2(4000);
  vLob clob;
  vSwDon number:= 0; -- Flag pour indiquer si on a traite des donnees. Si pas de donnees pour la requete, on ajout une ligne a vide pour generer la structure XML si les balises
                     -- sont obligatoires
    --vVerOracle varchar2(100);
    vVerOracle number;
  ---------------------------------------------------------------
  procedure SupprimerSiVide(pCol number) is
    tPERETMP typTABCOL;
    tSUP typTABCOL;
    vColTmp number;
    vColPereTmp number;
    vNodeTmp DBMS_XMLDOM.DOMNode;
    i number;
    vTmp number;
    vBuf varchar2(2000);
  BEGIN
    if NOT tPERE.Exists(pCol) then
      return;
    end if;
    if tMDL(pCol).EstPere = 1 then
      tPERETMP(pCol) := 1;
    end if;
    vColTmp := tPERETMP.First;
    -- Ajout dans le tableau de suppression des tous les fils en cascade
    while vColTmp is not null loop
      i := tPERE(vColTmp).First;
      while i is not null loop
        tSUP(i) := 0;
        if tMDL(i).EstPere = 1 then
          tPERETMP(i) := 1;
        end if;
        i := tPERE(vColTmp).Next(i);
      end loop;
      vColTmp := tPERETMP.Next(vColTmp);
    end loop;
    -- Suppression des noeuds, on commence pour le nivau le plus bas
    vColTmp := tSUP.Last;
    while vColTmp is not null loop
      vColPereTmp := tMDL(vColTmp).NumColPere;
      if tMDL(vColTmp).BlsObl = 0 and vColTmp <> vNumColRoot and tPERE(vColPereTmp).Exists(vColTmp) then
        if TRTXML01.EstNoeudVide(tNODE(vColTmp).Node) = 1 then
          -- On peut effacer le noeud
          tSUP(vColTmp) := 1;
          DBMS_XMLDOM.FreeNode(vNodeTmp);
          vNodeTmp := DBMS_XMLDOM.RemoveChild(tNode(vColPereTmp).Node,tNODE(vColTmp).Node);
          -- Suppresion des donnees en memoire
          tPERE(vColPereTmp)(vColTmp) := tPERE(vColPereTmp)(vColTmp) - 1;
          if tPERE(vColPereTmp)(vColTmp) <= 0 then
            tPERE(vColPereTmp).Delete(vColTmp);
          end if;
          if tMDL(vColTmp).EstPere = 0 then
            tELE(vColTmp).Delete(nvl(tMDL(vColTmp).Val,cStrSiNul));
          else
            tNODE(vColTmp).LstChemin(tNODE(vColPereTmp).Chemin).LstVal.Delete(nvl(tMDL(vColTmp).Val,cStrSiNul));
            tNODE(vColTmp).LstChemin(tNODE(vColPereTmp).Chemin).DrnEle := tNODE(vColTmp).LstChemin(tNODE(vColPereTmp).Chemin).DrnEle - 1;
          end if;
        end if;
      end if;
      if tSUP(vColTmp) = 0 then
        tSUP.Delete(vColPereTmp);
      end if;
      vColTmp := tSUP.Prior(vColTmp);
    end loop;
  END;
  ---------------------------------------------------------------
BEGIN
  if gTrace then
    DBMS_APPLICATION_INFO.READ_CLIENT_INFO(vDEBUG_StrInfo);
    DBMS_APPLICATION_INFO.SET_CLIENT_INFO(vDEBUG_StrInfo || '/GenererXML');
  end if;
  -- FBE: Gestion de la version Oracle (deplacement des instructions d'obtention de la version)
  -- BPZ
  vVerOracle := 0;
  SELECT count(*) into vVerOracle FROM PRODUCT_COMPONENT_VERSION where product like 'PL/SQL%' and version like '11%';
  -- Date de debut du traitement pour afficher le temps du traitement
  vDEBUG_vDatDeb := sysdate;
  if gProgression then
    select max(Lgn)
      into vDEBUG_TOTAL
      from EXPDON;
  end if;
  vDEBUG_vDatFin := sysdate;
  if gTrace then
    DBMS_OUTPUT.Put_Line('Count XML:' || NumToDSInterval(vDEBUG_vDatFin-vDEBUG_vDatDeb,'DAY'));
  end if;
  vDEBUG_vDatDeb := sysdate;
  -- Recherche des information sur le modele
  select nvl(ChrSet,TRTXML01.cDEFAULT_CHARSET), CodExpMdl, NomStr, Str, nvl(Ent,1), nvl(Pub,0)
    into vChrSet, vCodExpMdl, vNomXsd, vXsd, vEnt, vPub
    from EXPMDL
    where IdtExpMdl = pIdtExpMdl;
  vChrSet := UTL_I18N.Map_CharSet(vChrSet,UTL_I18N.GENERIC_CONTEXT,UTL_I18N.IANA_TO_ORACLE);
  -- Extraction du path du chemin de fichier a generer
--  vPathXsd := REGEXP_Replace(pNomFichier,'\\?(\w+[^\]*)*$',null,1,1,'i');
--  vNomXsd := vPathXsd || '\' || vNomXsd;
--  vNomXsd := TRTXML01.PathToUri(vNomXsd);
  -- Creation du document
  pDoc := DBMS_XMLDOM.newDOMDocument;
  -- Definition de la version et du character set
  DBMS_XMLDOM.SetVersion(pDoc,'1.0');
  DBMS_XMLDOM.SetCharSet(pDoc,vChrSet);
  if vEnt = 0 then
    DBMS_XMLDOM.SetStandAlone(pDoc,'yes');
  end if;
  -- Insertion de la signature X7
  vStr := 'XML file generated by X7 Software. XMLGenerator v' || VersionPKG || '. Model ' || vCodExpMdl || '. Generated at ' || to_char(sysdate,'DD/MM/YYYY HH24:MI:SS');
  vNode := TRTXML01.CreerCommentaire(pDoc,null,vStr);
  -- Recuperation de l'information concernant les colonnes du modele
  select cNumSiNul Lgn,
         Ord,
         CodCol,
         nvl(BlsObl,0) BlsObl,
         null NumColPere,
         null NumColSvn,
         nvl(IdtExpTypEle,TRTXML01.cTYPE_ELEMENT_ELEMENT) TypEle,
         null TypAtr,
         0 AAtr,
         Niv,
         cStrSiNul Val,
         0 EstPere,  -- Par defaut, on initialise comme etant non pere
         0 Ecr
    bulk collect into tMDL
    from EXPMDLDET
    where IdtExpMdl = pIdtExpMdl
    order by Ord;
  -- Dans le cas de publipostage, on doit generer le root du document
  if vPub = 1 then
    vNumColRoot := 0;
    vCodRoot := 'documentdatas';
  else
    vNumColRoot := tMDL.First;
    vCodRoot := tMDL(vNumColRoot).CodCol;
  end if;
  -- Noeud principal
  -- Insertion du noeud racine du document
--  vRoot := TRTXML01.CreerNoeudRacine(pDoc,vNomXsd, vXsd);
  vRoot := TRTXML01.CreerNoeudRacine(pDoc,vNomXsd, vXsd,vCodRoot,vEnt);
  -- Stockage des informations du noeud racine dans le tableau de noeuds
  tNode(vNumColRoot).Node    := vRoot;
  tNODE(vNumColRoot).EstRup  := 1;
  tNODE(vNumColRoot).Chemin  := '/';
  tPERE(vNumColRoot) := tTabColNul;
  tPERE(vNumColRoot).Delete;

  tMDL(vNumColRoot).EstPere := 1;
  tMDL(vNumColRoot).Ecr := 1;
  tMDL(vNumColRoot).BlsObl := 1;
  tMDL(vNumColRoot).CodCol := vCodRoot;
  -- Recherche du pere pour chaque colonne
  for i in 1..tMDL.Last loop
    -- Correction du parametrage:
    -- Dans le cas du publipostage, toutes les balises sont obligatoires
    if vPub = 1 then
      tMDL(i).BlsObl := 1;
    end if;
    -- Recherche du pere
    for j in REVERSE 1..i loop
      -- Le pere est le dernier de la liste de niveau anterieur
      if tMDL(j).Niv < tMDL(i).Niv then
        -- La gestion des numero des colonnes est basee sur la position de la colonne dans le tableau tMDL
        -- ceci evite le probleme de possibles doublons
        tMDL(i).NumColPere := j;
        -- Si le fils est un element le pere est un noeud pere
        -- Si le fils est un attribut, le pere n'est pas forcement un noued pere
        if tMDL(i).TypEle <> TRTXML01.cTYPE_ELEMENT_ATTRIBUT then
          tMDL(j).EstPere := 1;
        else
          -- Il s'agit d'un attribut, on signale sur le pere qu'il y a au moins 1 attribut
          tMDL(j).AAtr := 1;
        end if;
        -- On a trouve le pere, on sors
        exit;
      end if;
    end loop;
    -- Si on n'a pas touve le pere, le pere est le node root
    if tMDL(i).NumColPere is null then
      tMDL(i).NumColPere := vNumColRoot;
    end if;
    -- S'il s'agit d'un element, on initialise la table des elements
    if tMDL(i).EstPere = 0 and tMDL(i).TypEle <> TRTXML01.cTYPE_ELEMENT_ATTRIBUT then
      vIdxEle := tMDL(i).CodCol;
      tELE(i)(vIdxEle) := 1;
    end if;
    -- Initialisation du tableau de noeuds
    vCol := i;
  end loop;
  -- Recherche de la colonne "frere" suivante
  for i in 1..tMDL.Last loop
    if tMDL(i).TypEle <> TRTXML01.cTYPE_ELEMENT_ATTRIBUT then
      for j in i+1..tMDL.Last loop
        if tMDL(j).Niv = tMDL(i).Niv and tMDL(j).TypEle <> TRTXML01.cTYPE_ELEMENT_ATTRIBUT then
          tMDL(i).NumColSvn := j;
          exit;
        end if;
      end loop;
    end if;
    tNODE(i).Node := null;
  end loop;
  vNode := null;
  -- Parcours sur les donnees
  open cCurDon;
    loop
      fetch cCurDon
        bulk collect into tDON LIMIT vLimit;
      -- Pas de donnees, on sors
      if tDON.Count = 0 then
        if vSwDon = 0 then
          -- Pas de donnees traites, on va creer des donnees nuls pour generer la structure XML
          -- s'il y a des balises obligatoires.
          for i in 1..tMdl.Last loop
            tDon(i).Lgn := 1;
          end loop;
        else
          exit;
        end if;
      end if;
      for i in 1..tDon.Count loop
        vSwDon := 1; -- On signale qu'il y a des donnees traitees
        vLgn := tDon(i).Lgn;
        if gProgression then
          if mod(vLgn,vDEBUG_Step) = 0  or (vLgn = vDEBUG_Total and i = tDON.Count) then
            X7UTIL.Progression(vDEBUG_Id,'GenererXML',least(vLgn,vDEBUG_Total),vDEBUG_TOTAL);
          end if;
       end if;
        -- Changement d'enregistrement, reinitialisation du compteur de colonnes
        if tMDL(1).Lgn <> vLgn then
          -- Apres le traitement de la premiere ligne, on marque qu'il n'y a pas de
          -- rupture a niveau du noeud root, car il n'y aura plus jamais une rupture pour le root
          -- Il faut faire attention que on ne traite le premier enregistrement du tableau
          if tMDL(1).Lgn <> cNumSiNul then
            tNODE(vNumColRoot).EstRup := 0;
          end if;
          tMDL(1).Lgn := vLgn;
          vCol := 0;
        end if;
        vCol := vCol + 1;
        -- Initialisation des indexes
        vColPere := tMDL(vCol).NumColPere;
        vColSvn   := nvl(tMDL(vCol).NumColSvn,0);
        -- Neutralisation de la valeur si la colonne est le root au caus ou
        if vCol = vNumColRoot then
          tDON(i).Val := null;
        end if;
        vVal := tDON(i).Val;
        vIdxEle := nvl(tDON(i).Val,cStrSiNul);
        if vCol = vNumColRoot then
          vIdxVal := '/';
          vIdxValPere := '/';
        else
          vIdxVal := nvl(tDON(i).Val,cStrSiNul);
          vIdxValPere := tNODE(vColPere).Chemin;
        end if;
        -- Par defaut, on assume que l'element ne doit pas s'ecrire
        tMDL(vCol).Ecr := 0;
        -- Si la colonne est un attribut, on etabli s'il s'agit d'un attribut sur
        -- un noued pere ou sur un element
        -- Si le pere se trouve dans le tableau de peres, alors c'est un attribut sur
        -- un noued pere
        if tMDL(vCol).TypEle = TRTXML01.cTYPE_ELEMENT_ATTRIBUT then
          if tMDL(vCol).EstPere = 1 then
            tMDL(vCol).TypAtr := cATTRIBUT_SUR_NOEUD;
          else
            tMDL(vCol).TypAtr := cATTRIBUT_SUR_ELEMENT;
          end if;
        end if;
        -- Traitement du noeud pere
        -- Traitement particulier pour les noeuds peres:
        --  - La valeur ne se ecrit pas
        --  - L'ecriture du node est faite si la valeur change ou la valeur du pere a change (rupture a niveau du pere)
        if tMDL(vCol).EstPere = 1 then
          -- Verification s'il y a une rutpture pour ce noeud ou le noeud n'existe pas dans le tableau de son pere
          if nvl(tMDL(vCol).Val,cStrSiNul) <> nvl(tDON(i).Val,cStrSiNul) /*or NOT tPERE(vColPere).Exists(vCol)*/ then
            -- On marque la rupture pour la colonne
            tNODE(vCol).EstRup := 1;
            ----------------------------------------------
            -- Suppression des noueds vides
            ----------------------------------------------
            SupprimerSiVide(vCol);
          else
            -- Pas de rupture a niveau du node, on herite l'information du pere
            tNODE(vCol).EstRup := tNODE(vColPere).EstRup;
          end if;
          if tNODE(vCol).EstRup = 1 then
            -- Initialisation du tableau des peres
            tPERE(vCol) := tTabColNul;
            tPERE(vCol).Delete;
            -- On signale s'il faut ecrire ce node
            tMDL(vCol).Ecr := 1;
            ----------------------------------------------
            -- Gestion au cas ou les donnees ne sont pas triees selon les ruptures
            ----------------------------------------------
            -- L'information a changee, on doit verifier si la nouvelle valeur
            -- a ete deja traitee. Pour cela, on verifie les valeurs stockees en memoire.
            -- Dans le cas ou l'information a ete deja traitee, on doit charger l'information
            -- du noued et ses fils en memoire et on etabli que l'information ne doit pas s'ecrire.
            if tNODE(vCol).LstChemin.Exists(vIdxValPere) then
              if tNODE(vCol).LstChemin(vIdxValPere).LstVal.Exists(vIdxVal) then
                -- L'information existe en memoire, donc l'information a deja ete traitee.
                tMDL(vCol).Ecr := 0;
                -- Chargement de l'information en memoire.
                -- Le numero de l'element est stockee dans l'element meme
                vNumEle := tNODE(vCol).LstChemin(vIdxValPere).LstVal(vIdxVal);
                vNumEle := nvl(vNumEle,0);
                n := -1;
                l := 0;
                -----------------------------------------------------------
                -- Recuperation du n-ieme element
                -----------------------------------------------------------
                vNode := DBMS_XMLDOM.GetFirstChild(tNODE(vColPere).Node);
                loop
                  l := l + 1;
                  if l > 100000 then
                    DBMS_OUTPUT.Put_Line('Boucle infini');
                    exit;
                  end if;
                  if DBMS_XMLDOM.GetNodeType(vNode) <> DBMS_XMLDOM.ELEMENT_NODE then
                    vNode := DBMS_XMLDOM.GetNextSibling(vNode);
                  end if;
                  if DBMS_XMLDOM.GetNodeName(vNode) = tMDL(vCol).CodCol then
                    n := n + 1;
                  end if;
                  if n = vNumEle then
                    exit;
                  end if;
                  vNode := DBMS_XMLDOM.GetNextSibling(vNode);
                end loop;
                DBMS_XMLDOM.FreeNode(tNODE(vCol).Node);
                tNODE(vCol).Node := vNode;
                tNODE(vCol).Chemin := vIdxValPere || '/' || vIdxVal;
                -- Chargement des valeurs des elements fils
                for j in vCol+1..tMDL.Last loop
                  if tMDL(j).NumColPere = vCol then
                    if tMDL(j).TypEle <> TRTXML01.cTYPE_ELEMENT_ATTRIBUT then
                      if tMDL(j).EstPere = 0 then
                        if tELE.Exists(j) then
                          tELE(j).Delete;
                        end if;
                      end if;
                      -----------------------------------------------------------
                      -- Recuperation des noeuds pour la colonne j
                      -----------------------------------------------------------
                      l := 0;
                      n := -1;
                      DBMS_XMLDOM.FreeNode(vNodeTmp);
                      vNodeTmp := DBMS_XMLDOM.GetFirstChild(tNODE(vCol).Node);
                      loop
                        if DBMS_XMLDOM.IsNull(vNodeTmp) then
                          exit;
                        end if;
                        if DBMS_XMLDOM.GetNodeType(vNodeTmp) <> DBMS_XMLDOM.ELEMENT_NODE then
                          vNodeTmp := DBMS_XMLDOM.GetNextSibling(vNodeTmp);
                        end if;
                        if DBMS_XMLDOM.GetNodeName(vNodeTmp) = tMDL(j).CodCol then
                          n := n + 1;
                          vNode := vNodeTmp;
                          if tMDL(j).EstPere = 0 then
                            vStrTmp := TRTXML01.ValeurDuNoeud(vNode);
                            vStrTmp := nvl(vStrTmp,cStrSiNul);
                            tELE(j)(vStrTmp) := j;
                          end if;
                        end if;
                        vNodeTmp := DBMS_XMLDOM.GetNextSibling(vNodeTmp);
                      end loop;
                      vNbr := n + 1;
                      if vNbr > 0 then
                        tPERE(tMDL(j).NumColPere)(j) := vNbr;
                        if tMDL(j).EstPere = 0 then
                          DBMS_XMLDOM.FreeNode(tNODE(j).Node);
                          tNODE(j).Node := vNode;
                        end if;
                      end if;
                    end if;
                  end if;
                end loop;
              end if;
            end if;
            ----------------------------------------------
            -- Fin gestion au cas ou les donnees ne sont pas triees selon les ruptures
            ----------------------------------------------
          else
            tMDL(vCol).Ecr := 0;
          end if;
          -- La valeur du noeud ne s'ecrit pas
          vVal := null;
        end if;
        if tMDL(vCol).EstPere = 0 then
          -- Il s'agit d'un element sans fils ou un attribut
          -- Traitement pour les attributs
          if tMDL(vCol).TypEle = TRTXML01.cTYPE_ELEMENT_ATTRIBUT then
            -- Il faut l'ecrire si le pere a ete ecrit. L'information se trouve su le tableau de colonnes pour la colonne pere
            if tMDL(vColPere).Ecr = 1 then
              tMDL(vCol).Ecr := 1;
            else
              -- L'attribut n'a pas ete ecrit
              tMDL(vCol).Ecr := 0;
            end if;
          else
            -- Traitement des elements
            -- Si le pere a ete ecrit, on doit reinitialiser le tableau d'elements pour cette colonne
            if tMDL(vColPere).Ecr = 1 then
              tELE(vCol).Delete;
            end if;
            -- Si la valeur de la colonne n'existe pas dans le tableau d'elements, la valeur n'a pas ete ecrite, il faut donc l'ecrire
            if NOT tELE(vCol).Exists(vIdxEle) then
              tMDL(vCol).Ecr := 1;
            else
              tMDL(vCol).Ecr := 0;
            end if;
          end if;
          -- On n'ecrit pas la balise si la valeur est nulle et la balise n'est pas obligatoire et que l'element n'a pas des attributs
          if vVal is null and tMDL(vCol).BlsObl = 0 and tMDL(vCol).AAtr = 0 then
            tMDL(vCol).Ecr := 0;
          end if;
        end if;
        -- Ecriture de l'attribut s'il faut l'ecrire
        if tMDL(vCol).TypEle = TRTXML01.cTYPE_ELEMENT_ATTRIBUT then
          if tMDL(vCol).Ecr = 1 then
            TRTXML01.CreerAttribut(tNode(vColPere).Node,tMDL(vCol).CodCol,vVal);
            -- On signale que l'attribut a ete ecrit
            tMDL(vCol).Ecr := 1;
          else
            -- L'attribut n'a pas ete ecrit
            tMDL(vCol).Ecr := 0;
          end if;
        end if;
        -- Ecriture du noeud s'il s'agit d'un element ou un node pere, pas d'un attribut
        if tMDL(vCol).TypEle <> TRTXML01.cTYPE_ELEMENT_ATTRIBUT then
          -- On ecrit le noeud s'il faut l'ecrire
          if tMDL(vCol).Ecr = 1 then
            -- On n'ecrit pas noeud root, car il a deja ete ecrit
            if vCol <> vNumColRoot then
              if tMDL(vCol).TypEle = TRTXML01.cTYPE_ELEMENT_ELEMENT then
                vNode := TRTXML01.CreerNoeud(pDoc,tNode(vColPere).Node,tMDL(vCol).CodCol,vVal );
              elsif tMDL(vCol).TypEle = TRTXML01.cTYPE_ELEMENT_CDATA then
                vNode := TRTXML01.CreerCDATA(pDoc,tNode(vColPere).Node,tMDL(vCol).CodCol,vVal );
              end if;
            else
              vNode := vRoot;
            end if;
            -- On ecrit le noeud dans le tableau de noeuds
            if not DBMS_XMLDOM.IsNull(tNode(vCol).Node) then
              -- BPZ
              -- FBE: Le select a ete deplace au debut de la procedure pour des raisons de performance
--              vVerOracle := 0;
--              SELECT count(*) into vVerOracle FROM PRODUCT_COMPONENT_VERSION where product like 'PL/SQL%' and version like '11%';
              if vVerOracle = 1 then
                DBMS_XMLDOM.FreeNode(tNode(vCol).Node);
              end if;
            end if;
            tNode(vCol).Node := vNode;
            -- Insertion de la colonne dans le tableau des peres
            vNbr := 0;
            if tPERE(vColPere).Exists(vCol) then
              vNbr := tPERE(vColPere)(vCol);
            end if;
            tPERE(vColPere)(vCol) := vNbr + 1;
            -- Il se peut que le noued soit mal positionne par rapport l'ordre de colonnes
            -- On verifie si le dernier fils du pere est posterieur a l'element qu'on a ecrit
            if vCol < nvl(tPERE(vColPere).Last,0) and vCol <> vNumColRoot then
              vColSvn := tPERE(vColPere).Next(vCol);
              -- Le dernier fils ecrit est posterieur a l'element qu'on vient d'ecrire, on le repositionne au bon endroit
              -- On cherche le premier noeud suivant pour la colonne
--              DBMS_XMLDOM.FreeNode(vNodeTmp);
              vNodeTmp := tNODE(vColSvn).Node;
              LOOP
                if DBMS_XMLDOM.GetNodeName(vNodeTmp) = DBMS_XMLDOM.GetNodeName(DBMS_XMLDOM.GetPreviousSibling(vNodeTmp)) then
                  vNodeTmp := DBMS_XMLDOM.GetPreviousSibling(vNodeTmp);
                else
                  exit;
                end if;
              end loop;

--              vNode := DBMS_XMLDOM.InsertBefore(tNODE(vColPere).Node,vNode,tNODE(vColSvn).Node);
              vNode := DBMS_XMLDOM.InsertBefore(tNODE(vColPere).Node,vNode,vNodeTmp);

            end if;
            -- Pour les elements qui ne sont pas des noeuds peres, on ajout la valeur dans le tableau des elements
            if tMDL(vCol).EstPere = 0 then
              tELE(vCol)(vIdxEle) := vCol;
            else
              if NOT tNODE(vCol).LstChemin.Exists(vIdxValPere) then
                vNumEle := 0;
              else
                vNumEle := nvl(tNODE(vCol).LstChemin(vIdxValPere).DrnEle,0) + 1;
              end if;
              tNODE(vCol).Chemin := vIdxValPere || '/' || vIdxVal;
              tNODE(vCol).LstChemin(vIdxValPere).LstVal(vIdxVal) := vNumEle;
              tNODE(vCol).LstChemin(vIdxValPere).DrnEle := vNumEle;
            end if;
          end if;
        end if;
        -- Stockage de la derniere valeur pour l'element
        tMDL(vCol).Val := tDON(i).Val;
        -- Stockage de la colonne traitee s'il s'agit d'un element
        if tMDL(vCol).TypEle <> TRTXML01.cTYPE_ELEMENT_ATTRIBUT then
          vColElePrc := vCol;
        end if;
      end loop;
    end loop;
    -- On a fini le traitement, il faut effacer les nodes vides s'il en restent
    SupprimerSiVide(vNumColRoot);
  close cCurDon;
  -- Traitement de la fiche 11649: Le XML genere es echape, on doit enlever l'echapement
  -- Pour cela, la seul metode est de transformer en clob, enleve l'echapement et reconvertir en document
--  DBMS_LOB.CreateTemporary(vLob,false,DBMS_LOB.CALL);
--  DBMS_XMLDOM.WriteToClob(pDoc,vLob);
--  vLob := DBMS_XMLGEN.Convert(vLob,DBMS_XMLGEN.ENTITY_DECODE);
--  -- Transformation en document XML
--  pDoc := DBMS_XMLDOM.NewDomDocument(vLob);
  vDEBUG_vDatFin := sysdate;
  -- Suppression des tableaux
  tPERE.Delete;
  tDON.Delete;
  tMDL.Delete;
  tEle.Delete;
  -- Liberation de la memoire pour les noeuds
  
  DBMS_XMLDOM.FreeNode(vRoot);
  -- BPZ
  --DBMS_XMLDOM.FreeNode(vNode);
  -- FBE: Le select a ete deplace au debut de la procedure pour des raisons de performance
--  vVerOracle := 0;
--  SELECT count(*) into vVerOracle FROM PRODUCT_COMPONENT_VERSION where product like 'PL/SQL%' and version like '11%';
  if vVerOracle = 1 then
    DBMS_XMLDOM.FreeNode(vNode);
  end if;
  
--  DBMS_XMLDOM.FreeNode(vNodeTmp);
  DBMS_XMLDOM.FreeNode(vNodePere);
  -- Liberation de la memoire
  DBMS_SESSION.FREE_UNUSED_USER_MEMORY;
  if gTrace then
    DBMS_OUTPUT.Put_Line('Generation XML:' || NumToDSInterval(vDEBUG_vDatFin-vDEBUG_vDatDeb,'DAY'));
  end if;
  if gTrace then
    DBMS_APPLICATION_INFO.SET_CLIENT_INFO(vDEBUG_StrInfo);
  end if;
END GenererXML;
--***************************************************************************************
--***************************************************************************************
--***************************************************************************************
procedure GenererXDoc(pIdtExpMdl number,
                      pLob IN OUT NOCOPY clob) is
  vDoc  DBMS_XMLDOM.DOMDocument;   -- Document XML
  vLob     clob;                      -- Lob du document
  vDEBUG_vDatDeb date;
  vDEBUG_vDatFin date;
  vVal varchar2(2000);
  vNode DBMS_XMLDOM.DOMNode;
  vNodePere DBMS_XMLDOM.DOMNode;
  vNodePrc DBMS_XMLDOM.DOMNode;
  vNodeSvn DBMS_XMLDOM.DOMNode;
  vNodeList DBMS_XMLDOM.DOMNodeList;
  vNodeTmp DBMS_XMLDOM.DOMNode;
  vNodeTmp2 DBMS_XMLDOM.DOMNode;
  vStrTmp clob;
  vNbr number;
  vEstNodePere number;
  vEstNodeSvnPere number;
  vEstListe number;
  vPereEstListe number;
  vDEBUG_StrInfo varchar2(2000);
  vDEBUG_rIndex number;
  vDEBUG_Progression number := 0;
  vDebug_Step number := 1000;
  j number;
    --vVerOracle varchar2(100);
    vVerOracle number;
BEGIN
  if gTrace then
    DBMS_APPLICATION_INFO.READ_CLIENT_INFO(vDEBUG_StrInfo);
    DBMS_APPLICATION_INFO.SET_CLIENT_INFO(vDEBUG_StrInfo || '/GenererXDoc');
  end if;
  vVerOracle := 0;
  SELECT count(*) into vVerOracle FROM PRODUCT_COMPONENT_VERSION where product like 'PL/SQL%' and version like '11%';
  -- Generation du XML
  GenererXml(pIdtExpMdl,vDoc);
  vDEBUG_vDatDeb := sysdate;
  vNode := DBMS_XMLDOM.MakeNode(DBMS_XMLDOM.GetDocumentElement(vDoc));
  vNodeList := DBMS_XMLDOM.GetElementsByTagName(vDoc,'*');
  vNbr := DBMS_XMLDOM.GetLength(vNodeList)-1;
  vStrTmp := '{';
  pLob := pLob || vStrTmp;
  for i in 0..vNbr loop
    if gProgression then
      if mod(i,vDEBUG_Step) = 0 then
        vDEBUG_Progression := vDEBUG_Progression + vDEBUG_Step;
--        DBMS_OUTPUT.Put_Line('-->' || vDEBUG_TotalWork || ':' || vDEBUG_SoFar);
        X7UTIL.Progression(vDEBUG_rIndex,'GenererXDoc',least(vDEBUG_Progression,vNbr),vNbr);
      end if;
    end if;
    DBMS_XMLDOM.FreeNode(vNode);
    DBMS_XMLDOM.FreeNode(vNodePere);
    if vVerOracle = 1 then
      DBMS_XMLDOM.FreeNode(vNodePrc);
    end if;
    DBMS_XMLDOM.FreeNode(vNodeSvn);
    vNode := DBMS_XMLDOM.Item(vNodeList,i);
    vNodePere := DBMS_XMLDOM.GetParentNode(vNode);
    vNodePrc := DBMS_XMLDOM.GetPreviousSibling(vNode);
    vNodeSvn := DBMS_XMLDOM.GetNextSibling(vNode);
    vEstNodePere := TRTXML01.EstNoeudPere(vNode);
    vEstListe := 0;
    vEstNodeSvnPere := 0;
    vPereEstListe := 0;
    vStrTmp := null;
    -- Un noeud liste est un noeud pere qui n'est pas le fils du noued racine. Le noeud racine est aussi une liste
    if vEstNodePere = 1 then
      vEstListe := 1;
    end if;
    if DBMS_XMLDOM.GetNodeType(DBMS_XMLDOM.GetParentNode(vNodePere)) = DBMS_XMLDOM.DOCUMENT_NODE and DBMS_XMLDOM.GetNodeType(DBMS_XMLDOM.GetParentNode(vNode)) <> DBMS_XMLDOM.DOCUMENT_NODE then
      vEstListe := 0;
    end if;
    if vEstNodePere = 1 then
    -- Gestion particuliere du fils de "documentdatas". Ce noeud est pere mais il n'est pas une liste
    -- dans ce cas on doit ouvrir avec {
      if vEstListe = 0 then
        vStrTmp := vStrTmp || '{';
      end if;
      if vEstListe = 0 or DBMS_XMLDOM.GetNodeName(vNodePrc) <> DBMS_XMLDOM.GetNodeName(vNode) or DBMS_XMLDOM.IsNull(vNodePrc) then
        vStrTmp := vStrTmp || '"' || DBMS_XMLDOM.GetNodeName(vNode) || '": ';
        if vEstListe = 1 then
          vStrTmp := vStrTmp || '[';
        end if;
      end if;
      -- Traitement particulier pour les fils de "documentdatas"
      -- Dans ce cas, le { est gere par le fils
      if DBMS_XMLDOM.GetNodeName(vNode) <> 'documentdatas' then
        vStrTmp := vStrTmp || '{';
      end if;
    else
      vStrTmp := vStrTmp || '"' || DBMS_XMLDOM.GetNodeName(vNode) || '"';
      vStrTmp := vStrTmp || ': ';
      vVal := TRTXML01.ValeurDuNoeud(vNode);
      -- Echapement de la valeur
      -- Backslash
      vVal := replace(vVal,'\','\\');
--'
      -- Retour chariot
      vVal := replace(vVal,chr(13) || chr(10),'\n');
      -- TAB
      vVal := replace(vVal,chr(9),'\t');
      -- Guillemets
      vVal := replace(vVal,'"','\"');
      vStrTmp := vStrTmp || '"' || vVal || '"';
      j := 0;
      -- Fermeture des ] et }
      loop
        if NOT DBMS_XMLDOM.IsNull(vNodeSvn) then
          if vEstNodePere = 0 then
            vNode := DBMS_XMLDOM.GetParentNode(vNode);
            vNodePere := DBMS_XMLDOM.GetParentNode(vNode);
            vEstNodePere := TRTXML01.EstNoeudPere(vNode);
            vEstListe := 0;
            if vEstNodePere = 1 then
              vEstListe := 1;
            end if;
            if DBMS_XMLDOM.GetNodeType(DBMS_XMLDOM.GetParentNode(vNodePere)) = DBMS_XMLDOM.DOCUMENT_NODE and DBMS_XMLDOM.GetNodeType(DBMS_XMLDOM.GetParentNode(vNode)) <> DBMS_XMLDOM.DOCUMENT_NODE then
              vEstListe := 0;
            end if;
            if TRTXML01.EstNoeudPere(vNodeSvn) = 1 and vEstListe = 0 then
              vStrTmp := vStrTmp || '}';
            end if;
          end if;
          vStrTmp := vStrTmp || ',';
          exit;
        else
          if vEstListe = 0 then
            vStrTmp := vStrTmp || '}';
          end if;
          vNode := DBMS_XMLDOM.GetParentNode(vNode);
          vNodeSvn := DBMS_XMLDOM.GetNextSibling(vNode);
          vNodePere := DBMS_XMLDOM.GetParentNode(vNode);
          vEstNodePere := TRTXML01.EstNoeudPere(vNode);
          vEstListe := 0;
          if vEstNodePere = 1 then
            vEstListe := 1;
          end if;
          if DBMS_XMLDOM.GetNodeType(DBMS_XMLDOM.GetParentNode(vNodePere)) = DBMS_XMLDOM.DOCUMENT_NODE and DBMS_XMLDOM.GetNodeType(DBMS_XMLDOM.GetParentNode(vNode)) <> DBMS_XMLDOM.DOCUMENT_NODE then
            vEstListe := 0;
          end if;
          if vEstListe = 1 and (DBMS_XMLDOM.GetNodeName(vNodeSvn) <> DBMS_XMLDOM.GetNodeName(vNode) or DBMS_XMLDOM.IsNull(vNodeSvn)) then
            vStrTmp := vStrTmp || ']';
          end if;
          if vEstListe = 1 and DBMS_XMLDOM.IsNull(vNodeSvn) then
            if DBMS_XMLDOM.GetNodeType(DBMS_XMLDOM.GetParentNode(DBMS_XMLDOM.GetParentNode(vNodePere))) <> DBMS_XMLDOM.DOCUMENT_NODE then
              vStrTmp := vStrTmp || '}';
            end if;
          end if;
          -- Traitement particulier du fils de documentdatas, celui ci est pere mais pas une liste
          -- dans ce cas, il faut fermer le {
          if vEstNodePere = 1 and vEstListe = 0 and not DBMS_XMLDOM.IsNull(vNodeSvn) then
            vStrTmp := vStrTmp || '}';
          end if;
        end if;
        -- on s'arrete s'on arrive au noeud racine
        if DBMS_XMLDOM.GetNodeType(vNodePere) = DBMS_XMLDOM.DOCUMENT_NODE then
          exit;
        end if;
        j := j + 1;
        -- Pour eviter un loop infinit
        if j >= 1000 then
          Raise_Application_Error(-20101,'Loop infinit');
        end if;
      end loop;
    end if;
    pLob := pLob || vStrTmp;
  end loop;
  vStrTmp := '}';
  pLob := pLob || vStrTmp;
  -- Liberation de la memoire
  DBMS_XMLDOM.FreeDocument(vDoc);
  vDEBUG_vDatFin := sysdate;
  if gTrace then
    DBMS_OUTPUT.Put_Line('Transformation JSon:' || NumToDSInterval(vDEBUG_vDatFin-vDEBUG_vDatDeb,'DAY'));
  end if;
  if gTrace then
    DBMS_APPLICATION_INFO.SET_CLIENT_INFO(vDEBUG_StrInfo);
  end if;
--  DBMS_LOB.FreeTemporary(vLob);
END GenererXDoc;
--***************************************************************************************
-- EcrireFichierXML
-------------------------------------------------------------
-- Realise l'ecriture d'un fichier XML. Utilise la procedure GenererXml
--***************************************************************************************
procedure EcrireFichierXml(pIdtExpMdl number,
                           pNomFichier varchar2) is
  vDoc  DBMS_XMLDOM.DOMDocument;   -- Document XML a generer
  vChrSet varchar2(20);       -- Character set
  vDEBUG_vDatDeb date;
  vDEBUG_vDatFin date;
  vDEBUG_StrInfo varchar2(2000);
BEGIN
  if gTrace then
    DBMS_APPLICATION_INFO.READ_CLIENT_INFO(vDEBUG_StrInfo);
    DBMS_APPLICATION_INFO.SET_CLIENT_INFO(vDEBUG_StrInfo || '/EcrireFichierXml');
  end if;
  -- Recherche des information sur le modele
  select nvl(ChrSet,TRTXML01.cDEFAULT_CHARSET)
    into vChrSet
    from EXPMDL
    where IdtExpMdl = pIdtExpMdl;
  vChrSet := UTL_I18N.Map_CharSet(vChrSet,UTL_I18N.GENERIC_CONTEXT,UTL_I18N.IANA_TO_ORACLE);
  -- Extraction du path du chemin de fichier a generer
--  vPathXsd := REGEXP_Replace(pNomFichier,'\\?(\w+[^\]*)*$',null,1,1,'i');
--  vNomXsd := vPathXsd || '\' || vNomXsd;
--  vNomXsd := TRTXML01.PathToUri(vNomXsd);
  -- Generation du XML
  GenererXml(pIdtExpMdl,vDoc);
  -- Ecriture du fichier
  vDEBUG_vDatDeb := sysdate;
  DBMS_XMLDOM.WriteToFile(vDoc,pNomFichier,vChrSet);
  vDEBUG_vDatFin := sysdate;
  if gTrace then
    DBMS_OUTPUT.Put_Line('Ecriture fichier:' || NumToDSInterval(vDEBUG_vDatFin-vDEBUG_vDatDeb,'DAY'));
  end if;
--  DBMS_XMLDOM.WriteToFile(vDoc,pNomFichier);
  DBMS_XMLDOM.FreeDocument(vDoc);
  if gTrace then
    DBMS_APPLICATION_INFO.SET_CLIENT_INFO(vDEBUG_StrInfo);
  end if;
END EcrireFichierXml;
--***************************************************************************************
-- EcrireFichierXDoc
-- Realise l'ecriture de fichier .json pour XDocReport
--***************************************************************************************
procedure EcrireFichierXDoc(pIdtExpMdl number,
                            pNomFichier varchar2) is
  vLob     clob;                      -- Json
  vChemin varchar2(200);
  vNomFichier varchar2(200);
  vChrSet varchar2(20);       -- Character set
  vDEBUG_vDatDeb date;
  vDEBUG_vDatFin date;
  vDEBUG_StrInfo varchar2(2000);
BEGIN
  if gTrace then
    DBMS_APPLICATION_INFO.READ_CLIENT_INFO(vDEBUG_StrInfo);
    DBMS_APPLICATION_INFO.SET_CLIENT_INFO(vDEBUG_StrInfo || '/EcrireFichierXDoc');
  end if;
--  -- Generation du XML
--  GenererXml(pIdtExpMdl,vXmlDoc);
--  -- Recuperation de la feuille de style pour la transformation en json
--  select Str
--    into vXsl
--    from EXPMDL
--    where IdtExpMdl = 1;
  -- Initialisation du lob pour garder le fichier converti
  DBMS_LOB.CreateTemporary(vLob,false,DBMS_LOB.CALL);
  -- Recuperation de l'information au format json XDoc
  GenererXDoc(pIdtExpMdl,vLob);
  -- Decomposition du nom de fichier en path et nom
  vChemin := REGEXP_Replace(pNomFichier,'\\?(\w+[^\]*)*$',null,1,1,'i');
  vChemin := rtrim(vChemin,'\');
  --vChemin := 'TEMPLATEXDOC';
  vNomFichier := REGEXP_Substr(pNomFichier,'\\?(\w+[^\]*)*$',1,1,'i');
  vNomFichier := ltrim(vNomFichier,'\');
  -- Enregistrement du fichier en UTF-8
  vDEBUG_vDatDeb := sysdate;
  DBMS_XSLPROCESSOR.CLob2File(vLob,vChemin,vNomFichier,nls_charset_id('AL32UTF8'));
  vDEBUG_vDatFin := sysdate;
  if gTrace then
    DBMS_OUTPUT.Put_Line('Generation JSon:' || NumToDSInterval(vDEBUG_vDatFin-vDEBUG_vDatDeb,'DAY'));
  end if;
  -- Liberation des variables
  DBMS_LOB.FreeTemporary(vLob);
  if gTrace then
    DBMS_APPLICATION_INFO.SET_CLIENT_INFO(vDEBUG_StrInfo);
  end if;
END EcrireFichierXDoc;
--***************************************************************************************
-- GenererDonnees
--***************************************************************************************
procedure GenererDonnees(pIdtExpMdl number, pWhr varchar2 default null) is
  type typTABEX is table of EXPDON%ROWTYPE index by binary_integer;
  vQuery varchar2(4000);   -- Requete de selection de donnees
  vNom_Table EXPTAB.NOM%TYPE; -- Nom de la table
  vStrTmp varchar2(32767);
  vWhere    varchar2(500); -- clause where du modèle
  tExport typTABEX;        -- Tableau pour les donnees a inserer dans EXPDON
  vLigne number;           -- Numero de la ligne pour le fichier
  vOrd number;             -- Numero d'ordre dans la table EXPDON
  vMasque EXPMDLDET.MSQ%TYPE; -- Masque de donnees
  vValN  number;           -- Variable pour les valeurs numeriques
  vValD  date;             -- Variable pour les valeurs Date
  vValA  varchar2(2000);   -- Variable pour les valeurs alphanumeriques
  vCursor number;          -- Id du cursor dynamique
  vRetCursor number;       -- Retour du cursor dynamique
  vStrNls varchar2(200);   -- Parametres NLS pour les separateurs de chiffres et la symbol monetaire
  vStrNLSLang varchar2(2000); -- Langue pour les formats de date
  cursor cEX is
    select  EXPMDL.IDTTYPEXP IDTTYPEXP,
            EXPMDL.CHRENF CHRENF,
            nvl(EXPMDL.LNGFIX,0) LNGFIX,
            nvl(EXPMDL.ENT,1) ENT,
            EXPMDL.Whr,
            coalesce(EXPMDL.ChrDec,PRMGNR.ChrDec,cDEFAUT_CARACTERE_DECIMAL) ChrDec,
            coalesce(EXPMDL.ChrMil,PRMGNR.ChrMil,cDEFAUT_CARACTERE_MILLIER) ChrMil,
            EXPMDL.SymMon,
            EXPTAB.NOM Nom_Table,
            EXPCOL.NOM Nom_Colonne,
            EXPCOL.LIB Lib_Colonne,
            EXPCOL.TYPDON TypDonSrc,
            EXPMDLDET.TYPDON TypDonDst,
            EXPCHR.ExpChr ChrPad,
            EXPMDLDET.CODCOL CODCOL,
            EXPMDLDET.Lng Lng,
            EXPMDLDET.MSQ MSQ,
            nvl(EXPMDLDET.AlgDrt,0) AlgDrt
      from  PRMGNR,
            EXPMDL,
            EXPMDLDET,
            EXPTAB,
            EXPCOL,
            EXPCHR
      where EXPMDLDET.IDTEXPMDL     = EXPMDL.IDTEXPMDL
       and  EXPTAB.IDTEXPTAB        = EXPMDL.IDTEXPTAB
       and  EXPCOL.IDTEXPCOL        = EXPMDLDET.IDTEXPCOL
       and  EXPCHR.IdtExpChr(+)     = EXPMDLDET.IdtExpChrPad
       and  EXPMDL.IDTEXPMDL        = pIdtExpMdl
      order by EXPMDLDET.Ord;
  type typEX is table of cEX%ROWTYPE index by binary_integer;
  rEX typEX;
  vDEBUG_vDatDeb date;
  vDEBUG_vDatFin date;
  vDEBUG_StrInfo varchar2(2000);
BEGIN
  if gTrace then
    DBMS_APPLICATION_INFO.READ_CLIENT_INFO(vDEBUG_StrInfo);
    DBMS_APPLICATION_INFO.SET_CLIENT_INFO(vDEBUG_StrInfo || '/GenererDonnees');
  end if;
  vDEBUG_vDatDeb := sysdate;
  -- Suppression des donnees
  delete EXPDON;
  vLigne := 0;
  vOrd := 0;
  -- Recuperation de la langue pour les dates
  select Value
    into vStrNLSLang
    --BPZ 
    --from NLS_INSTANCE_PARAMETERS
    from NLS_DATABASE_PARAMETERS
    where Parameter = 'NLS_DATE_LANGUAGE';
  if vStrNLSLang is null then
    vStrNLSLAng := UserEnv('LANGUAGE');
  end if;
  open cEX;
    fetch cEX
      bulk collect into rEX;
  close cEX;
  -- S'il n'y a pas de colonnes a exporter on sors
  if rEX.Count = 0 then
    return;
  end if;
  for i in 1..rEX.Count loop
    -----------------------------------------------------------------
    -- Creation de la chaine des parametres NLS
    -----------------------------------------------------------------
    if i = 1 then
      vStrNls := null;
      if rEX(i).ChrDec is not null and rEX(i).ChrMil is not null then
        vStrNls := 'NLS_NUMERIC_CHARACTERS=''' || rEX(i).ChrDec || rEX(i).ChrMil || '''';
      end if;
      if rEX(i).SymMon is not null then
        if vStrNls is not null then
          vStrNls := vStrNls || ' ';
        end if;
        vStrNls := vStrNls || 'NLS_CURRENCY=''' || rEX(i).SymMon || '''';
      end if;
    end if;
    -----------------------------------------------------------------
    -- Correction des donnees de parametrage incoherents
    -----------------------------------------------------------------
    if rEX(i).IdtTypExp <> cTYPE_FICHIER_TEXTE then
      rEX(i).Ent := 0;
      rEX(i).LngFix := 0;
      rEX(i).ChrEnf := null;
    end if;
    if rEX(i).LngFix = 0 then
      rEX(i).ChrPad := null;
      rEX(i).AlgDrt := 0;
    else
      rEX(i).ChrPad := nvl(rEX(i).ChrPad,' ');
    end if;
    if rEX(i).TypDonDst <> 'A' then
      rEX(i).ChrEnf := null;
    end if;
    if rEX(i).TypDonSrc not in ('N','D') then
      rEX(i).Msq := null;
    end if;
    if rEX(i).TypDonSrc = 'D' then
      if rEX(i).Msq is null then
        if rEX(i).IdtTypExp = cTYPE_FICHIER_XML then
          rEX(i).Msq := 'YYYY-MM-DD';
        elsif rEX(i).IdtTypExp = cTYPE_FICHIER_TEXTE then
          rEX(i).Msq := 'DD/MM/YYYY';
        end if;
      end if;
      -- Gestion des formats de date/heur pour les fichiers XML si le format de sortie est date
      -- Le format d'ecriture des dates et heures XML est sctrict
      -- il faut le respecter
      if rEX(i).IdtTypExp = cTYPE_FICHIER_XML and rEX(i).TypDonDst = 'D' then
        rEX(i).Msq := replace(upper(rEX(i).Msq),' ',null);
        if instr(rEX(i).Msq,'MM') > 0 and instr(rEX(i).Msq,'HH') > 0 then
          -- Format dateType, il faut ajouter la lettre T
          if instr(rEX(i).Msq,'THH') = 0 then
            rEX(i).Msq := replace(rEX(i).Msq,'HH','"T"HH');
          end if;
        end if;
      end if;
    end if;
      -- Gestion des formats numerique pour les fichiers XML si le format de sortie est numerique
      -- Le format d'ecriture des nombres XML est sctrict
      -- il faut le respecter
    if rEX(i).IdtTypExp = cTYPE_FICHIER_XML and rEX(i).TypDonSrc = 'N' and rEX(i).TypDonDst = 'N' then
      -- Le separateur decimal est un point
      rEX(i).ChrDec := '.';
      rEX(i).ChrMil := ','; -- juste pour completer
      if instr(upper(rEX(i).Msq),'S') > 0 then -- on respecte le signe, mais il doit etre au debut
        rEX(i).Msq := 'S';
      else
        rEX(i).Msq := null;
      end if;
      -- On met un masque compacte
      rEX(i).Msq := rEX(i).Msq || 'TM';
    end if;
    -----------------------------------------------------------------
    vNom_Table := rEX(i).Nom_Table;
    vWhere := rEX(i).Whr;
    -----------------------------------------------------------------
    -- Construction de l'entete
    -----------------------------------------------------------------
    if rEX(i).ENT = 1 then
      vLigne := 1;
      vOrd := vOrd + 1;
      tExport(i).IDTEXPMDL := pIdtExpMdl;
      tExport(i).Ord := vOrd;
      tExport(i).LGN := vLigne;
      tExport(i).VAL := nvl(rEX(i).CODCOL,rEX(i).Lib_Colonne);
    end if;
    -----------------------------------------------------------------
    -- Construction de la clause select
    -----------------------------------------------------------------
    if vStrTmp is not null then
      vStrTmp := vStrTmp || ',';
    end if;
    -- On nomme les colonnes COL1, COL2, COLn en cas de doublons dans le nom de colonnes
    vStrTmp := vStrTmp || rEX(i).Nom_Colonne || ' COL' || i;
  end loop; -- rEX in cEX
  -- Insertion des donnees dans la table
  forall i in 1..tExport.Count
    insert into EXPDON values tExport(i);
  tExport.Delete;
  -----------------------------------------------------------------
  -- Construction de la requete
  -----------------------------------------------------------------
  vQuery := 'select ' || vStrTmp;
  vQuery := vQuery || ' from ' || vNom_Table;
  -- Construction de la clause where, on elimine le mot "where" si
  -- elle est donnee comme premier mot.
  vWhere := trim(REGEXP_Replace(vWhere, '^\W*where',null,1,1,'i'));
  -- Ajout de la clause where passee en parametre s'il y en a
  if pWhr is not null then
    -- ajout de "and" s'il y a deja une condition
    if vWhere is not null then
      vWhere := vWhere || ' and ';
    end if;
    -- Suppression du mot "where" si elle est donnee comme premiere mot
    vWhere := vWhere || trim(REGEXP_Replace(pWhr, '^\W*where',null,1,1,'i'));
  end if;
  if vWhere is not null then
    vWhere := ' where ' || vWhere;
  end if;
  vStrTmp := vWhere;
  vQuery := vQuery || vStrTmp || ' ';
  vStrTmp := Tri_To_OrderBy(pIdtExpMdl);
  vQuery := vQuery || vStrTmp;
--  DBMS_OUTPUT.Put_Line(vQuery);
  -----------------------------------------------------------------
  -- Gestion du cursor dynamique
  -----------------------------------------------------------------
  vCursor := DBMS_SQL.Open_Cursor;
  DBMS_SQL.Parse(vCursor, vQuery, DBMS_SQL.Native);
  -- Definition dynamique des colonnes et types de donnees pour le cursor
  for i in 1..rEX.Count loop
    if rEX(i).TypDonSrc = 'A' then
      DBMS_SQL.Define_Column(vCursor,i,vValA,2000);
    elsif rEX(i).TypDonSrc = 'D' then
      DBMS_SQL.Define_Column(vCursor,i,vValD);
    elsif rEX(i).TypDonSrc = 'N' then
      DBMS_SQL.Define_Column(vCursor,i,vValN);
    end if;
  end loop;
  -- Execution et fetch des donnees
  vRetCursor := DBMS_SQL.Execute(vCursor);
  -- Fetch des donnees
  LOOP
    vRetCursor := DBMS_SQL.Fetch_Rows(vCursor);
    if vRetCursor = 0 then
      exit;
    end if;
    -- Recuperation des donnees. On doit inserer une ligne pour chaque colonne des donnees recuperees
    vLigne := vLigne + 1;
    for i in 1..rEX.Count loop
      vOrd := vOrd + 1;
      tExport(i).IDTEXPMDL := pIdtExpMdl;
      tExport(i).Ord := vOrd;
      tExport(i).LGN := vLigne;
      -----------------------------------------------------------------
      -- Transformation des donnees sous format alphanumerique
      -----------------------------------------------------------------
      if rEX(i).TypDonSrc = 'A' then
        DBMS_SQL.Column_Value(vCursor,i,vValA);
        tExport(i).VAL := vValA;
      elsif rEX(i).TypDonSrc = 'D' then
        DBMS_SQL.Column_Value(vCursor,i,vValD);
        if rEX(i).Msq is not null then
          -- Ajout du parametre NLS pour sortir la date selon la langue definie dans la instance
          tExport(i).VAL := to_char(vValD,rEX(i).Msq,'NLS_DATE_LANGUAGE=''' || vStrNLSLAng);
        else
          tExport(i).VAL := to_char(vValD);
        end if;
      elsif rEX(i).TypDonSrc = 'N' then
        DBMS_SQL.Column_Value(vCursor,i,vValN);
        if rEX(i).Msq is not null then
          if rEX(i).LngFix = 1 then
            vValN := nvl(vValN,0);
          end if;
          if vStrNls is not null then
            -- !! ATENTION !!
            -- On utilise SQL (requete) plutot que PL/SQL pour la conversion, car dans PL/SQL
            -- le fm model est active. Cela veut dire que les spaces sont systematiquement
            -- supprimes, lorsque on utilise des parametres NLS. Ici, on veut garder les spaces
--            tExport(i).VAL := to_char(vValN,rEX(i).Msq,vStrNls);
            select to_char(vValN,rEX(i).Msq,vStrNls)
              into tExport(i).VAL
              from dual;
          else
            tExport(i).VAL := to_char(vValN,rEX(i).Msq);
          end if;
          if rEX(i).TypDonDst = 'N' then
            null;
            tExport(i).Val := trim(tExport(i).Val);
          end if;
        else
          tExport(i).VAL := to_char(vValN);
        end if;
      end if;
      -----------------------------------------------------------------
      -- Application des regles de transformation
      -----------------------------------------------------------------
      tExport(i).Val := nvl(tExport(i).Val,rEX(i).ChrPad);
      if rEX(i).Lng is not null then
        -- Dans le cas de tronquer une information numerique, on met le symbole #
        if rEX(i).TypDonSrc = 'N' and rEX(i).Lng < length(tExport(i).VAL) then
          tExport(i).VAL := '#';
          tExport(i).VAL := lpad(tExport(i).VAL,rEX(i).Lng,'#');
        end if;
        if rEX(i).ChrPad is not null then
          if rEX(i).AlgDrt = 1 then
            tExport(i).VAL := lpad(tExport(i).VAL,rEX(i).Lng,rEX(i).ChrPad);
          else
            tExport(i).VAL := rpad(tExport(i).VAL,rEX(i).Lng,rEX(i).ChrPad);
          end if;
        else
          tExport(i).VAL := substr(tExport(i).VAL,1,rEX(i).Lng);
        end if;
      end if;
      tExport(i).VAL := rEX(i).ChrEnf || tExport(i).VAL || rEX(i).ChrEnf;
    end loop; -- i in 1..rEX.Count
    -- Insertion des donnees dans la table
    forall i in 1..tExport.Count
      insert into EXPDON values tExport(i);
    tExport.Delete;
  end loop; -- Loop
  if DBMS_SQL.Is_Open(vCursor) then
    DBMS_SQL.Close_Cursor(vCursor);
  end if;
  vDEBUG_vDatFin := sysdate;
  if gTrace then
    DBMS_OUTPUT.Put_Line('Generation donnees:' || NumToDSInterval(vDEBUG_vDatFin-vDEBUG_vDatDeb,'DAY'));
  end if;
  if gTrace then
    DBMS_APPLICATION_INFO.SET_CLIENT_INFO(vDEBUG_StrInfo);
  end if;
--EXCEPTION
--    WHEN OTHERS THEN
--        X7.GEST_ERREUR_CENTURA(VersionPkg(),
--                              0,
--                              'TRTEXP01',
--                              'GenererDonnees',
--                              to_char(SQLERRM),
--                              sqlcode,
--                              DBMS_UTILITY.FORMAT_ERROR_BACKTRACE);
--        Raise;

END GenererDonnees;
--***************************************************************************************
-- GenererXDocTemplate (fichier)
--***************************************************************************************
procedure GenererXDocTemplate(pIdtExpMdl number,pChemin varchar2 default null) is
  cursor cCur is
    select NomFic
      from EXPMDL
      where IdtExpMdl = pIdtExpMdl
       and  nvl(Pub,0) = 1;
  vNomFichier varchar2(200);
  vChemin varchar2(200);
BEGIN
  -- Récuperation du chemin dans la directory TemplateXDoc

  for rCur in cCur loop
    vNomFichier := trim(rCUR.NomFic);
    vNomFichier := REGEXP_Replace(vNomFichier,'.fields.xml$',null,1,1,'i');
    vNomFichier := REGEXP_Replace(vNomFichier,'.xml$',null,1,1,'i');
    vNomFichier := vNomFichier || '.fields.xml';
    vChemin := nvl(trim(pChemin),'TEMPLATEXDOC');
--    vChemin := rtrim(vChemin,'\');
    --vChemin := 'TEMPLATEXDOC';
    GenererFichier(1,vChemin || '\' || vNomFichier,' IdtExpMdl = ' || pIdtExpMdl);
--'
  end loop;
END GenererXDocTemplate;
--***************************************************************************************
-- GenererXDocTemplate (CLOB)
--***************************************************************************************
procedure GenererXDocTemplate(pIdtExpMdl number,
                              pLob IN OUT NOCOPY clob) is
BEGIN
  GenererCLob(1,pLob,' IdtExpMdl = ' || pIdtExpMdl);
END GenererXDocTemplate;
--***************************************************************************************
-- GenererFichier
--***************************************************************************************
procedure GenererFichier(pIdtExpMdl number,
                         pNomFichier varchar2 default null,
                         pWhr varchar2 default null,
                         pValider number default 0) is
  PRAGMA AUTONOMOUS_TRANSACTION;
  vIdtTypExp EXPMDL.IdtTypExp%TYPE;
  vNomFichier EXPMDL.NomFic%TYPE;
  vPub number;
BEGIN
  select IdtTypExp, NomFic, nvl(Pub,0)
    into vIdtTypExp, vNomFichier, vPub
    from EXPMDL
    where IdtExpMdl = pIdtExpMdl;
  -- Extraction des donnees
  GenererDonnees(pIdtExpMdl, pWhr);
  -- En priorite, le nom du fichier est celui passe en parametre, sinon,
  -- on utilise le nom du fichier stockee dans le modele.
  -- !!!! IMPORTANT !!! : Le nom du fichier doit contenir le chemin
  vNomFichier := nvl(pNomFichier,vNomFichier);
  -- Generation du fichier, selon le type de fichier
  if vIdtTypExp = cTYPE_FICHIER_TEXTE then
    -- Generation de fichier XML
    EcrireFichierTexte(pIdtExpMdl, vNomFichier);
  elsif vIdtTypExp = cTYPE_FICHIER_XML then
    if vPub = 0 or nvl(gJsonAsXml,0) = 1 then -- Fichier XML
      -- Generation de fichier XML
      EcrireFichierXml(pIdtExpMdl, vNomFichier);
    else  -- Fichier json pour le publipostage XDocReport
      EcrireFichierXDoc(pIdtExpMdl, vNomFichier);
    end if;
  end if;
  -- Liberation de la memoire
  DBMS_SESSION.FREE_UNUSED_USER_MEMORY;
  -- Le commit efface les donnees temporaires. En plus, cette procedure
  -- est en autonomous transaction
  commit;
--EXCEPTION
--    WHEN OTHERS THEN
--        X7.GEST_ERREUR_CENTURA(VersionPkg(),
--                              0,
--                              'TRTEXP01',
--                              'GenererFichier',
--                              to_char(SQLERRM),
--                              sqlcode,
--                              DBMS_UTILITY.FORMAT_ERROR_BACKTRACE);
--        Raise;
END GenererFichier;
--***************************************************************************************
-- GenererCLob
-- Genere les donnees dans un clob plutot qu'un fichier
--***************************************************************************************
procedure GenererCLob(pIdtExpMdl number,
                      pLob IN OUT NOCOPY clob,
                      pWhr varchar2 default null,
                      pValider number default 0) is
  PRAGMA AUTONOMOUS_TRANSACTION;
  vIdtTypExp EXPMDL.IdtTypExp%TYPE;
  vPub number;
  vDoc DBMS_XMLDOM.DOMDocument;
  vChrSet varchar2(100);
  vDEBUG_StrInfo varchar2(2000);
  vNbr number;
BEGIN
  if gTrace then
    DBMS_APPLICATION_INFO.READ_CLIENT_INFO(vDEBUG_StrInfo);
    DBMS_APPLICATION_INFO.SET_CLIENT_INFO(vDEBUG_StrInfo || '/GenererCLob');
  end if;
  select count(*)
    into vNbr
    from EXPMDL
    where IdtExpMdl = pIdtExpMdl;
  select IdtTypExp, nvl(Pub,0), ChrSet
    into vIdtTypExp, vPub, vChrSet
    from EXPMDL
    where IdtExpMdl = pIdtExpMdl;
  -- Extraction des donnees
  GenererDonnees(pIdtExpMdl, pWhr);
  -- Generation du lob, selon le type de fichier
  -- Les fichiers texte ne sont pas passes en lob
  -- Initialisation du lob
  DBMS_LOB.CreateTemporary(pLob,FALSE,DBMS_LOB.CALL);
  if vIdtTypExp = cTYPE_FICHIER_XML then
    -- Initialisation du document
    vDoc := DBMS_XMLDOM.NewDOMDocument;
    if vPub = 0 then -- Fichier XML
      -- Generation du XML
      GenererXml(pIdtExpMdl, vDoc);
      DBMS_XMLDOM.WriteToClob(vDoc,pLob);
    else  -- Fichier json pour le publipostage XDocReport
      GenererXDoc(pIdtExpMdl, pLob);
    end if;
    DBMS_XMLDOM.FreeDocument(vDoc);
  end if;
  -- Liberation de la memoire
  DBMS_SESSION.FREE_UNUSED_USER_MEMORY;
  -- Le commit efface les donnees temporaires. En plus, cette procedure
  -- est en autonomous transaction
  commit;
  if gTrace then
    DBMS_APPLICATION_INFO.SET_CLIENT_INFO(vDEBUG_StrInfo);
  end if;
--EXCEPTION
--    WHEN OTHERS THEN
--        X7.GEST_ERREUR_CENTURA(VersionPkg(),
--                              0,
--                              'TRTEXP01',
--                              'GenererFichier',
--                              to_char(SQLERRM),
--                              sqlcode,
--                              DBMS_UTILITY.FORMAT_ERROR_BACKTRACE);
--        Raise;
END GenererCLob;
--***************************************************************************************
-- EcrireLob
-- Ecrit un lob binaire dans la requete HTTP
--***************************************************************************************
procedure EcrireLob(pReq IN OUT NOCOPY UTL_HTTP.Req,
                     pLob IN OUT NOCOPY blob) is
  vDonnees raw(32767);
  vLenBuffer number;
  vLenLob number;
  vAmmount number;
  vOffSet number;
  vDEBUG_StrInfo varchar2(2000);
BEGIN
  if gTrace then
    DBMS_APPLICATION_INFO.READ_CLIENT_INFO(vDEBUG_StrInfo);
    DBMS_APPLICATION_INFO.SET_CLIENT_INFO(vDEBUG_StrInfo || '/EcrireLob');
  end if;
  vLenLob := DBMS_LOB.GetLength(pLob);
  if nvl(vLenLob,0) = 0 then
    return;
  end if;
  vOffSet := 1;
  vLenBuffer := 2000;
  while vOffSet < vLenLob loop
    vAmmount := least(vLenBuffer,vLenLob-vOffSet+1);
    if vAmmount > 0 then
      vDonnees := DBMS_LOB.substr(pLob,vAmmount,vOffSet);
      UTL_HTTP.Write_Raw(pReq,vDonnees);
    end if;
    vOffSet := vOffSet + vAmmount;
  end loop;
  UTL_HTTP.Write_Line(pReq,null);
  if gTrace then
    DBMS_APPLICATION_INFO.SET_CLIENT_INFO(vDEBUG_StrInfo);
  end if;
END EcrireLob;
--***************************************************************************************
-- EcrireLob
-- Ecrit un lob caractere dans la requete HTTP
--***************************************************************************************
procedure EcrireLob(pReq IN OUT NOCOPY UTL_HTTP.Req,
                     pLob IN OUT NOCOPY clob) is
  vDonnees varchar2(32767);
  vLenBuffer number;
  vLenLob number;
  vAmmount number;
  vOffSet number;
  vDEBUG_StrInfo varchar2(2000);
BEGIN
  if gTrace then
    DBMS_APPLICATION_INFO.READ_CLIENT_INFO(vDEBUG_StrInfo);
    DBMS_APPLICATION_INFO.SET_CLIENT_INFO(vDEBUG_StrInfo || '/EcrireLob');
  end if;
  vLenLob := DBMS_LOB.GetLength(pLob);
  if nvl(vLenLob,0) = 0 then
    return;
  end if;
  vOffSet := 1;
  vLenBuffer := 2000;
  while vOffSet < vLenLob loop
    vAmmount := least(vLenBuffer,vLenLob-vOffSet+1);
    if vAmmount > 0 then
      vDonnees := DBMS_LOB.substr(pLob,vAmmount,vOffSet);
      UTL_HTTP.Write_Text(pReq,vDonnees);
    end if;
    vOffSet := vOffSet + vAmmount;
  end loop;
  UTL_HTTP.Write_Line(pReq,null);
  if gTrace then
    DBMS_APPLICATION_INFO.SET_CLIENT_INFO(vDEBUG_StrInfo);
  end if;
END EcrireLob;
--***************************************************************************************
-- EcrireFichierPDF
-- Ecrit le fichier PDF
--***************************************************************************************
procedure EcrireFichierPDF(pLob IN OUT NOCOPY blob,
                           pChemin varchar2,
                           pNomFichier varchar2) is
  vFile UTL_FILE.FILE_TYPE;
  vBuffer raw(32767);
  vLenBuffer number;
  vLenLob number;
  vOffSet number;
  vAmmount number;
  vDEBUG_StrInfo varchar2(2000);
BEGIN
  if gTrace then
    DBMS_APPLICATION_INFO.READ_CLIENT_INFO(vDEBUG_StrInfo);
    DBMS_APPLICATION_INFO.SET_CLIENT_INFO(vDEBUG_StrInfo || '/EcrireFichierPDF');
  end if;
  vLenLob := DBMS_LOB.GetLength(pLob);
  vOffSet := 1;
  vLenBuffer := 32767;
--  DBMS_OUTPUT.Put_line(pChemin || '\' || pNomFichier);
--'
  vFile := UTL_FILE.FOpen(pChemin,pNomFichier,'wb',vLenBuffer);
  while vOffSet < vLenLob loop
    vAmmount := least(vLenBuffer,vLenLob-vOffSet+1);
    if vAmmount > 0 then
      vBuffer := DBMS_LOB.substr(pLob,vAmmount,vOffSet);
      UTL_FILE.Put_Raw(vFile,vBuffer,TRUE);
    end if;
    vOffSet := vOffSet + vAmmount;
  end loop;
  UTL_FILE.FClose(vFile);
  if gTrace then
    DBMS_APPLICATION_INFO.SET_CLIENT_INFO(vDEBUG_StrInfo);
  end if;
END EcrireFichierPDF;
--***************************************************************************************
-- GenererRapportXDoc
-- Genere le rapport (.pdf) pour le publipostage avec XDOCReport
-- La procedure fait appel a un service WEB
--***************************************************************************************
procedure GenererRapportXDoc(pIdtMdlXdr number,
                             pNomFichier varchar2,
                             pTypSrt CTLRPT.TYPSRT%type,
                             pWhr varchar2,
                             pMsgErr OUT varchar2) is
  -----------------------------------------------
  -- Constants
  -----------------------------------------------
  cHTTP_VERSION CONSTANT varchar2(20) := UTL_HTTP.HTTP_VERSION_1_1;
  cENCODING     CONSTANT varchar2(20) := 'chunked';
  cMETHOD       CONSTANT varchar2(10) := 'POST';
  -----------------------------------------------
  -- Variables HTTP
  -----------------------------------------------
  vUrl varchar2(2000);
  vProxy varchar2(2000);
  vReq UTL_HTTP.Req;
  vRep UTL_HTTP.Resp;
  vStrContentType varchar2(200);
  vStrContentDisposition varchar2(200);
  vStrPart varchar2(200);
  vBoundary varchar2(200);
  vTimeOut number;
  -----------------------------------------------
  -- Variables pour le rapport
  -----------------------------------------------
  eErreur_Reponse EXCEPTION;
  eErreur EXCEPTION;
  vTemplate clob;
  vDonnees clob;
  vRaw raw(32767);
  vFichierDoc blob;
  vFichierPdf blob;
  vIdtExpMdl number;
  vFormatSortie varchar2(10);
  vNomFichierDoc varchar2(2000);
  vNomFichierPdf varchar2(2000);
  vChemin varchar2(2000);
  vLenDonnees number;
  vChrSet varchar2(200);
  -- Temporaire pour tests
  vStr varchar2(32000);
  vStr2 varchar2(32000);
  vDat1 date;
  vDat2 date;
  vDEBUG_StrInfo varchar2(2000);
  vLenDoc number; -- Taille du fichier doc
  vNbrEnr number; -- Nombre d'enregistrements a traiter
  vVolxMin number := 2000000; -- Volume de bytes traites dans 60 secondes
BEGIN
  if gTrace then
    DBMS_APPLICATION_INFO.READ_CLIENT_INFO(vDEBUG_StrInfo);
    DBMS_APPLICATION_INFO.SET_CLIENT_INFO(vDEBUG_StrInfo || '/GenererRapportXDoc');
  end if;
  -----------------------------------------------
  -- Initialisation des variables
  -----------------------------------------------
  pMsgErr := null;
  DBMS_LOB.CreateTemporary(vTemplate,false,DBMS_LOB.CALL);
  DBMS_LOB.CreateTemporary(vDonnees,FALSE,DBMS_LOB.CALL);
  DBMS_LOB.CreateTemporary(vFichierPDF,false,DBMS_LOB.CALL);
  DBMS_LOB.CreateTemporary(vFichierDoc,false,DBMS_LOB.CALL);
  vStrContentDisposition := 'Content-Disposition: form-data;';
  -- Frontiere aleatoire
  vBoundary := 'Part_=' || rawtohex(UTL_RAW.Cast_to_Raw(DBMS_RANDOM.String('x',8))) || '.' || rawtohex(UTL_RAW.Cast_to_Raw(DBMS_RANDOM.String('x',8))) || '=';
  vStrContentType := 'multipart/form-data; boundary=' || vBoundary;
  vBoundary := '--' || vBoundary;

  -- BPZ 11739
  if pTypSrt is null then
    vFormatSortie := 'PDF';
  else
    vFormatSortie := pTypSrt;
  end if;

  -- Nom et chemin du fichier
  -- Recuperation du chemin pour l'ecriture du fichier
  vChemin := REGEXP_Replace(trim(pNomFichier),'\\?(\w+[^\]*)*$',null,1,1,'i');
  vChemin := rtrim(vChemin,'\');
  --'
  -- vChemin := 'TEMPLATEXDOC';
  -- Recuperation du nom du fichier sans le chemin
  vNomFichierDoc := REGEXP_Substr(trim(pNomFichier),'\\?(\w+[^\]*)*$',1,1,'i');
  vNomFichierDoc := ltrim(vNomFichierDoc,'\');
  -- Suppression de l'extension .doc, .docx ou .pdf
  vNomFichierDoc := REGEXP_Replace(trim(vNomFichierDoc),'\.((docx?)|(pdf))$',null,1,1,'i');
  vNomFichierDoc := rtrim(vNomFichierDoc,'.');
  -- Ajout de l'extension selon le cas
  vNomFichierPdf := vNomFichierDoc || '.' || vFormatSortie;
  vNomFichierDoc := vNomFichierDoc || '.docx';
  -----------------------------------------------
  -- Recuperation des donnees
  -----------------------------------------------
--  vUrl := 'http://172.16.77.135:8080/x7webservice/x7rest/publisher/report';
--  vUrl := 'http://75.101.143.131';
--  vIdtExpMdl := 103;
--  vProxy := 'http://172.16.35.1:8080';
  select trim(XDocSrv), trim(XDocPxy)
    into vUrl, vProxy
    from PRMGNR;
  if vUrl is null then
    pMsgErr := 'ERR_TRTPUB0007';  -- Pas de serveur
    raise eErreur;
  end if;
  select Fch, IdtExpMdl
    into vFichierDoc, vIdtExpMdl
    from MDLXDR
    where IdtMdlXdr = pIdtMdlXdr;
  vLenDonnees := DBMS_LOB.GetLength(vFichierDoc);
  vLenDoc := vLenDonnees;
  if nvl(vLenDonnees,0) = 0 then
    pMsgErr := 'ERR_TRTPUB0006';  -- Le modele est vide
    raise eErreur;
  end if;
  select coalesce(ChrSet,TRTXML01.cDEFAULT_CHARSET,'UTF-8')
    into vChrSet
    from EXPMDL
    where IdtExpMdl = vIdtExpMdl;
  GenererXDocTemplate(vIdtExpMdl,vTemplate);
  GenererClob(vIdtExpMdl,vDonnees,pWhr);
  vLenDonnees := DBMS_LOB.GetLength(vDonnees);
  -- On assume que un enregistrement son 512 bytes
  vNbrEnr := vLenDonnees / 512;
  if nvl(vLenDonnees,0) = 0 then
    pMsgErr := 'ERR_TRTPUB0008';  -- Pas de donnees
    raise eErreur;
  end if;
  -----------------------------------------------
  -- Connexion au service WEB
  -----------------------------------------------
  -- Etablissement du delai de reponse
  -- La valeur du timeout est calculee: Nombre d'enregistrements * Taille fichierDoc / Volume traite dans 60 sec
  vTimeOut := trunc(vNbrEnr * vLenDoc / vVolxMin) * 60;
--  vTimeOut := trunc(60 * (vLenDonnees/50000));
  vTimeOut := greatest(60,vTimeOut);
  if gTrace then
    DBMS_OUTPUT.Put_Line('Len:' || vLenDonnees);
    DBMS_OUTPUT.Put_Line('TimeOut:' || vTimeOut);
  end if;
--  return;
  UTL_HTTP.Set_Transfer_Timeout(vTimeOut);
  UTL_HTTP.Set_Response_Error_Check(false);
  UTL_HTTP.Set_Detailed_Excp_Support(true);
  -- Si proxy on utilise le proxy
  if vProxy is not null then
    UTL_HTTP.Set_Proxy(vProxy);
  end if;
  -- Caracter set a utiliser pour tous les echanges (requete/reponse)
  UTL_HTTP.Set_Body_CharSet(vChrSet);
  vReq := UTL_HTTP.Begin_Request(vUrl,cMETHOD,cHTTP_VERSION);
  -- Ecriture de l'entete Content-Type, en envoyant la frontiere
  UTL_HTTP.Set_Header(vReq,'Content-Type',vStrContentType);
  -- Autres entetes
  UTL_HTTP.Set_Header(vReq,'Transfer-Encoding',cENCODING);
  UTL_HTTP.Write_Line(vReq,null);
  -----------------------------------------------
  -- Envoie de donnees
  -----------------------------------------------
  -----------------------------------------------
  -- Parametre 1: templateDocument
  -----------------------------------------------
  UTL_HTTP.Write_Line(vReq,vBoundary);
  vStrPart := vStrContentDisposition || ' name="templateDocument"';
  UTL_HTTP.Write_Line(vReq,vStrPart);
  UTL_HTTP.Write_Line(vReq,'Content-Type: application/octet-stream' || UTL_TCP.CrLf);
--  UTL_HTTP.Write_Line(vReq,null);
  EcrireLob(vReq,vFichierDoc);
  -----------------------------------------------
  -- Parametre 2: templateEngineKind
  -----------------------------------------------
  UTL_HTTP.Write_Line(vReq,UTL_TCP.CrLf || vBoundary);
  vStrPart := vStrContentDisposition || ' name="templateEngineKind"';
  UTL_HTTP.Write_Line(vReq,vStrPart);
  UTL_HTTP.Write_Line(vReq,'Content-Type: text/plain; charset=' || vChrSet || UTL_TCP.CrLf);
--  UTL_HTTP.Write_Line(vReq,null);
  UTL_HTTP.Write_Line(vReq,'Freemarker');
  -----------------------------------------------
  -- Parametre 3: metadata
  -----------------------------------------------
  UTL_HTTP.Write_Line(vReq,vBoundary);
  vStrPart := vStrContentDisposition || ' name="metadata"';
  UTL_HTTP.Write_Line(vReq,vStrPart);
  UTL_HTTP.Write_Line(vReq,'Content-Type: text/xml; charset=' || vChrSet || UTL_TCP.CrLf);
--  UTL_HTTP.Write_Line(vReq,null);
  EcrireLob(vReq,vTemplate);
  -----------------------------------------------
  -- Parametre 4: data
  -----------------------------------------------
  UTL_HTTP.Write_Line(vReq,UTL_TCP.CrLf || vBoundary);
  vStrPart := vStrContentDisposition || ' name="data"';
  UTL_HTTP.Write_Line(vReq,vStrPart);
  UTL_HTTP.Write_Line(vReq,'Content-Type: text/x-json; charset=' || vChrSet || UTL_TCP.CrLf);
--  UTL_HTTP.Write_Line(vReq,null);
  vDat1 := sysdate;
  EcrireLob(vReq,vDonnees);
  vDat2 := sysdate;
  if gTrace then
    DBMS_OUTPUT.Put_Line('Envoie donnees:' || NumToDSInterval(vDat2-vDat1,'DAY'));
  end if;
  -----------------------------------------------
  -- Parametre 5: dataType
  -----------------------------------------------
  UTL_HTTP.Write_Line(vReq,UTL_TCP.CrLf || vBoundary);
  vStrPart := vStrContentDisposition || ' name="dataType"';
  UTL_HTTP.Write_Line(vReq,vStrPart);
  UTL_HTTP.Write_Line(vReq,'Content-Type: text/plain; charset=' || vChrSet || UTL_TCP.CrLf);
--  UTL_HTTP.Write_Line(vReq,null);
  UTL_HTTP.Write_Line(vReq,'json');
  -----------------------------------------------
  -- Parametre 6: outFileName
  -----------------------------------------------
  UTL_HTTP.Write_Line(vReq,vBoundary);
  vStrPart := vStrContentDisposition || ' name="outFileName"';
  UTL_HTTP.Write_Line(vReq,vStrPart);
  UTL_HTTP.Write_Line(vReq,'Content-Type: text/plain; charset=' || vChrSet || UTL_TCP.CrLf);
--  UTL_HTTP.Write_Line(vReq,null);

  -- BPZ 11739
  --if pTypSrt is null
  --or pTypSrt = 'PDF' then
  --  UTL_HTTP.Write_Line(vReq,vNomFichierPDF);
  --else
  --  UTL_HTTP.Write_Line(vReq,vNomFichierDOC);
  --end if;

  UTL_HTTP.Write_Line(vReq,vNomFichierPDF);

  -----------------------------------------------
  -- Parametre 7: outFormat
  -----------------------------------------------
  UTL_HTTP.Write_Line(vReq,vBoundary);
  vStrPart := vStrContentDisposition || ' name="outFormat"';
  UTL_HTTP.Write_Line(vReq,vStrPart);
  UTL_HTTP.Write_Line(vReq,'Content-Type: text/plain; charset=' || vChrSet || UTL_TCP.CrLf);
--  UTL_HTTP.Write_Line(vReq,null);
  UTL_HTTP.Write_Line(vReq,vFormatSortie);

  -----------------------------------------------
  -- Fin de l'envoie des parts
  -----------------------------------------------
  UTL_HTTP.Write_Line(vReq,vBoundary || '--');
  -----------------------------------------------
  -- Obtention de la reponse
  -----------------------------------------------
  vDat1 := sysdate;
  vRep := UTL_HTTP.Get_Response(vReq);
  vDat2 := sysdate;
  if gTrace then
    DBMS_OUTPUT.Put_Line('Reponse:' || NumToDSInterval(vDat2-vDat1,'DAY'));
  end if;
  vDat1 := sysdate;
  BEGIN
    loop
      UTL_HTTP.Read_Raw(vRep,vRaw,32767);
      DBMS_LOB.WriteAppend(vFichierPDF,UTL_RAW.Length(vRaw), vRaw);
    end loop;
  EXCEPTION
    when UTL_HTTP.END_OF_BODY then
      UTL_HTTP.End_Response(vRep);
  END;
  vDat2 := sysdate;
  if gTrace then
    DBMS_OUTPUT.Put_Line('Recuperation reponse:' || NumToDSInterval(vDat2-vDat1,'DAY'));
  end if;
  if vREP.Status_Code <> UTL_HTTP.HTTP_OK then
    raise eErreur_Reponse;
  end if;
  -----------------------------------------------
  -- Ecriture du fichier PDF
  -----------------------------------------------
  vDat1 := sysdate;
  EcrireFichierPDF(vFichierPDF,vChemin,vNomFichierPDF);
  vDat2 := sysdate;
  if gTrace then
    DBMS_OUTPUT.Put_Line('Ecriture PDF:' || NumToDSInterval(vDat2-vDat1,'DAY'));
  end if;
  DBMS_LOB.FreeTemporary(vTemplate);
  DBMS_LOB.FreeTemporary(vDonnees);
  DBMS_LOB.FreeTemporary(vFichierPDF);
  if gTrace then
    DBMS_APPLICATION_INFO.SET_CLIENT_INFO(vDEBUG_StrInfo);
  end if;
  EXCEPTION
    when eErreur_Reponse then
      X7.GEST_ERREUR_CENTURA(VersionPkg(),
                      0,
                      'TRTEXP01',
                      'GenererRapportXDoc',
                      to_char(SQLERRM),
                      sqlcode,
                      DBMS_UTILITY.FORMAT_ERROR_BACKTRACE);

      -- Transformation de la reponse binaire en varchar2
      vStr := substr(UTL_RAW.Cast_To_Varchar2(DBMS_LOB.Substr(vFichierPDF)),1,2000);
      -- Dans le cas de reponse HTML, on recupere juste le body
      if REGEXP_Instr(vStr,'<body>',1,1,1,'i') > 0 then
        vStr := REGEXP_Substr(vStr,'<body>(<\w+>)?(\w+\W*[^<]*)*',1,1,'i');
        -- Suppresion des balises XML
        vStr := REGEXP_Replace(vStr,'<\w+>',null);
      end if;
      pMsgErr := TRTMSG01.ChercheMsg('ERR_TRTPUB0001');  -- Erreur avec reponse du serveur
      pMsgErr := pMsgErr || chr(13) || chr(10);
      -- Concatenation des informations recues.
      pMsgErr := pMsgErr || vREP.Status_Code || ' - ' || vREP.Reason_Phrase || chr(13) || chr(10) || vStr;
    when eErreur then
      X7.GEST_ERREUR_CENTURA(VersionPkg(),
                      0,
                      'TRTEXP01',
                      'GenererRapportXDoc',
                      to_char(SQLERRM),
                      sqlcode,
                      DBMS_UTILITY.FORMAT_ERROR_BACKTRACE);

      pMsgErr := TRTMSG01.ChercheMsg(pMsgErr);
    when others then
      X7.GEST_ERREUR_CENTURA(VersionPkg(),
                      0,
                      'TRTEXP01',
                      'GenererRapportXDoc',
                      to_char(SQLERRM),
                      sqlcode,
                      DBMS_UTILITY.FORMAT_ERROR_BACKTRACE);
      if SQLCODE = -12543 then
        pMsgErr := TRTMSG01.ChercheMsg('ERR_TRTPUB0003');  -- Serveur non trouve
      elsif SQLCODE = -24247 then
        pMsgErr := TRTMSG01.ChercheMsg('ERR_TRTPUB0004');  -- Autorisations ACL
      elsif SQLCODE = -29276 then
        pMsgErr := TRTMSG01.ChercheMsg('ERR_TRTPUB0005');  -- TimeOut
      else
        pMsgErr := TRTMSG01.ChercheMsg('ERR_TRTPUB0002'); -- Erreur non gere
        pMsgErr := pMsgErr || chr(13) || chr(10);
        pMsgErr := pMsgErr || SQLERRM;
        pMsgErr := pMsgErr || chr(13) || chr(10);
        pMsgErr := pMsgErr || DBMS_UTILITY.Format_Error_BackTrace;
      end if;
END GenererRapportXDoc;

--***************************************************************************************
-- GenererRapportXDoc avec trigger Avant/Après
--
-- Traitement avant éxécution rapport
-- Genere le rapport (.pdf) pour le publipostage avec XDOCReport
-- Traitement après éxécution du rapport
--***************************************************************************************
procedure GenererRapportXDocTrt(pIdtMdlXdr number,
                             pNomFichier varchar2,
                             pTypSrt CTLRPT.TYPSRT%type,
                             pWhr varchar2,
                             pMsgErr OUT varchar2,
                             pPrm1 varchar2,
                             pPrm2 varchar2,
                             pPrm3 varchar2,
                             pPrm4 varchar2,
                             pPrm5 varchar2,
                             pPrm6 varchar2,
                             pPrm7 varchar2,
                             pPrm8 varchar2,
                             pPrm9 varchar2,
                             pPrm10 varchar2) is

  vPub NUMBER(1);
  vIdtExpMdl NUMBER(5);

BEGIN

-- Appel des traitements avant génération du rapport
  TrtExp01_SPC.TrtAvtRpt(pIdtMdlXdr,pPrm1,pPrm2,pPrm3,pPrm4,pPrm5,pPrm6,pPrm7,pPrm8,pNomFichier,pWhr);


  BEGIN
    SELECT nvl(Pub,0),EXPMDL.IdtExpMdl
      INTO vPub,vIdtExpMdl
      FROM EXPMDL,MdlXdr
      WHERE MDLXDR.IdtMdlXdr      = pIdtMdlXdr
            AND MDLXDR.IdtExpMdl  = EXPMDL.IdtExpMdl;
  END;

-- Si publipostage: Generation du rapport
  IF vPub=1 THEN
    GenererRapportXDoc(pIdtMdlXdr,pNomFichier,pTypSrt,pWhr,pMsgErr);
  ELSE
-- Sinon, impression XML
    GenererFichier(vIdtExpMdl,pNomFichier,pWhr,0);
  END IF;

-- Si la generation du rapport a echoue, on ne fait pas le traitement de fin
  TrtExp01_SPC.TrtAprRpt(pMsgErr,pIdtMdlXdr,pPrm1,pPrm2,pPrm3,pPrm4,pPrm5,pPrm6,pPrm7,pPrm8,pNomFichier,pWhr);

EXCEPTION
    WHEN OTHERS THEN
        X7.GEST_ERREUR_CENTURA(VersionPkg(),
                              0,
                              'TRTEXP01',
                              'GenererRapportXDocTrt',
                              to_char(SQLERRM),
                              sqlcode,
                              DBMS_UTILITY.FORMAT_ERROR_BACKTRACE);
        Raise;


END GenererRapportXDocTrt;
--***************************************************************************************
-- GenExpCol
--
-- Genere ou complete la table EXPCOL
procedure GenExpCol(pIdtExpTab number) is
BEGIN
  insert into EXPCOL (IdtExpTab, IdtExpCol, Nom, Lib, TypDon, Utl)
    select pIdtExpTab,
           SEQ_EXPCOL.NextVal,
           Column_Name,
           Lib,
           TypDon,
           1
      from (select USER_TAB_COLUMNS.Column_Name,
                   case
                     when USER_TAB_COLUMNS.Data_Type in ('VARCHAR2','CHAR') then 'A'
                     when USER_TAB_COLUMNS.Data_Type = 'NUMBER' then 'N'
                     when USER_TAB_COLUMNS.Data_Type = 'DATE' then 'D'
                   end TypDon,
                   nvl(USER_COL_COMMENTS.Comments,USER_TAB_COLUMNS.Column_Name) Lib
              from EXPTAB,
                   USER_TAB_COLUMNS,
                   USER_COL_COMMENTS
              where USER_COL_COMMENTS.Table_Name(+) = USER_TAB_COLUMNS.Table_Name
               and  USER_COL_COMMENTS.Column_Name(+) = USER_TAB_COLUMNS.Column_Name
               and  USER_TAB_COLUMNS.Table_Name = upper(EXPTAB.Nom)
               and  EXPTAB.IdtExpTab = pIdtExpTab
               and  USER_TAB_COLUMNS.Column_Name not in (select upper(Nom) from EXPCOL
                                                           where IdtExpTab = pIdtExpTab)
              order by Column_Id);
END GenExpCol;
--***************************************************************************************
--
END TRTEXP01;
/