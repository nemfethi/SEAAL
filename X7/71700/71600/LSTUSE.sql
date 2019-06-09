SET DEFINE OFF;
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('1844', 'frmListeTCHPCG01', 'PNTCPG', 'IDTLOTFAC', 6, 
    'Lot de facturation', 'Lot de facturation', 0, 1, 0, 
    'PNTCPG.IDTLOTFAC', 0, NULL, 'Lot de facturation');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('1845', 'frmListeTCHPCG01', 'PNTCPG', 'DEBDRNPRDRLV', 7, 
    'Début de période', 'Début de période', 0, 1, 0, 
    'TO_CHAR(PNTCPG.DEBDRNPRDRLV,''DD/MM/YYYY'')', 0, NULL, 'Début de période');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('1846', 'frmListeCMMCLT01', 'CLT', 'IDTCLT', 6, 
    'Code', 'Code', 1, 1, 0, 
    'CLT.IDTCLT', 0, NULL, 'Code');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('1847', 'frmListeCMMCLT01', 'CLT', 'IDTQLT', 6, 
    'Qualité client', 'Type of customer ID', 0, 1, 0, 
    'CLT.IDTQLT', 0, NULL, 'Type of customer ID');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('1848', 'frmListeCMMCLT01', 'CLT', 'IDTCTGCLT', 6, 
    'Categorie de client', 'Categorie de client', 0, 1, 0, 
    'CLT.IDTCTGCLT', 0, NULL, 'Categorie de client');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('1849', 'frmListeCMMCLT01', 'CLT', 'IDTCNTOPR', 6, 
    'Centre operationnel', 'Centre operationnel', 0, 1, 1, 
    'CLT.IDTCNTOPR', 3, NULL, 'Centre operationnel');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('1850', 'frmListeCMMCLT01', 'CLT', 'IDTCODSNS', 6, 
    'Sensibilité client', 'Sensibilite client', 0, 1, 1, 
    'CLT.IDTCODSNS', 4, NULL, 'Sensibilite client');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('1851', 'frmListeCMMCLT01', 'CLT', 'IDTCTR', 10, 
    'Contract ID', 'Contract ID', 0, 1, 0, 
    'CLT.IDTCTR', 0, NULL, 'Contract ID');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('1852', 'frmListeCMMCLT01', 'CLT', 'NUMAVN', 22, 
    'Numéro d''avenant', 'avenant', 0, 1, 0, 
    'CLT.NUMAVN', 0, NULL, 'avenant');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('1853', 'frmListeCMMCLT01', 'CLT', 'AVT_IDTCTR', 10, 
    'NOT USED !!!', 'NOT USED !!!', 0, 0, 0, 
    'CLT.AVT_IDTCTR', 0, NULL, 'NOT USED !!!');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('1854', 'frmListeCMMCLT01', 'CLT', 'AVT_NUMAVN', 22, 
    'NOT USED!!!', 'NOT USED!!!', 0, 0, 0, 
    'CLT.AVT_NUMAVN', 0, NULL, 'NOT USED!!!');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('1855', 'frmListeCMMCLT01', 'CLT', 'MTRAGT', 6, 
    'Agent', 'Agent', 0, 1, 0, 
    'CLT.MTRAGT', 0, NULL, 'Agent');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('1856', 'frmListeCMMCLT01', 'CLT', 'DATMAJ', 7, 
    'Date de mise a jour', 'Date de mise a jour', 0, 1, 0, 
    'TO_CHAR(CLT.DATMAJ,''DD/MM/YYYY'')', 0, NULL, 'Date de mise a jour');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('1857', 'frmListeCMMCLT01', 'CLT', 'NOM', 40, 
    'Nom', 'Nom', 1, 1, 0, 
    'CLT.NOM', 1, NULL, 'Nom');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('1858', 'frmListeCMMCLT01', 'CLT', 'PRN', 40, 
    'Prenom', 'Prenom', 1, 1, 0, 
    'CLT.PRN', 2, NULL, 'Prenom');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('1859', 'frmListeCMMCLT01', 'CLT', 'TLB', 20, 
    'Telephone du bureau', 'Telephone du bureau', 0, 1, 0, 
    'CLT.TLB', 0, NULL, 'Telephone du bureau');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('1860', 'frmListeCMMCLT01', 'CLT', 'FLB', 20, 
    'Fax du bureau', 'Fax du bureau', 0, 1, 0, 
    'CLT.FLB', 0, NULL, 'Fax du bureau');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('1861', 'frmListeCMMCLT01', 'CLT', 'TLD', 20, 
    'Telephone du domicile', 'Telephone du domicile', 0, 1, 0, 
    'CLT.TLD', 0, NULL, 'Telephone du domicile');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('1862', 'frmListeCMMCLT01', 'CLT', 'FLD', 20, 
    'Fax du domicile', 'Fax du domicile', 0, 1, 0, 
    'CLT.FLD', 0, NULL, 'Fax du domicile');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('1863', 'frmListeCMMCLT01', 'CLT', 'ANCRFR', 20, 
    'Ancienne reference', 'Ancienne reference', 0, 1, 0, 
    'CLT.ANCRFR', 0, NULL, 'Ancienne reference');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('1864', 'frmListeCMMCLT01', 'CLT', 'QLTPYR', 2, 
    'Qualite payeur', 'Qualite payeur', 0, 1, 0, 
    'CLT.QLTPYR', 0, NULL, 'Qualite payeur');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('1865', 'frmListeCMMCLT01', 'CLT', 'FRD', 22, 
    'Fraudeur', 'Fraudeur', 0, 1, 0, 
    'CLT.FRD', 0, NULL, 'Fraudeur');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('1866', 'frmListeCMMCLT01', 'CLT', 'ADRLBR', 2000, 
    'Adresse', 'Adresse', 0, 1, 1, 
    'SUBSTR(REPLACE(REPLACE(CLT.ADRLBR,CHR(10),'' ''),CHR(13),'' ''),1,254)', 0, NULL, 'REPLACE(REPLACE(CLT.ADRLBR,CHR(10),'' ''),CHR(13),'' '')');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('1867', 'frmListeCMMCLT01', 'CLT', 'PMTLTG', 22, 
    'Nombre de paiements litigieux', 'Nombre de paiements litigieux', 0, 1, 0, 
    'CLT.PMTLTG', 0, NULL, 'Nombre de paiements litigieux');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('1868', 'frmListeCMMCLT01', 'CLT', 'RGR', 22, 
    'Client regroupe', 'Client regroupe', 0, 1, 0, 
    'CLT.RGR', 0, NULL, 'Client regroupe');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('1869', 'frmListeCMMCLT01', 'CLT', 'INTBNC', 22, 
    'Interdit bancaire', 'Ineligible', 0, 1, 0, 
    'CLT.INTBNC', 0, NULL, 'Ineligible');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('1870', 'frmListeTCHCPR01', 'CPR', 'IDTCPR', 22, 
    'Identifiant interne', 'Identifiant interne', 0, 1, 0, 
    'CPR.IDTCPR', 0, NULL, 'Identifiant interne');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('1871', 'frmListeTCHCPR01', 'CPR', 'IDTTYPCPR', 6, 
    'Type de compteur', 'Type de compteur', 0, 1, 1, 
    'CPR.IDTTYPCPR', 2, NULL, 'Type de compteur');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('1872', 'frmListeCMMCLT01', 'CLT', 'IDTPRMCTR', 10, 
    'Code du premier contrat', 'Code du premier contrat', 0, 1, 0, 
    'CLT.IDTPRMCTR', 0, NULL, 'Code du premier contrat');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('1873', 'frmListeCMMCLT01', 'CLT', 'RTRIPY', 22, 
    'Nombre de retours d''impaye', 'Nombre de retours d''impaye', 0, 1, 0, 
    'CLT.RTRIPY', 0, NULL, 'Nombre de retours d''impaye');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('1874', 'frmListeCMMCLT01', 'CLT', 'CHPLIB1', 30, 
    '1st free field', '1st free field', 0, 0, 0, 
    'CLT.CHPLIB1', 0, NULL, '1st free field');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('1875', 'frmListeCMMCLT01', 'CLT', 'CHPLIB2', 30, 
    '2nd free field', '2nd free field', 0, 0, 0, 
    'CLT.CHPLIB2', 0, NULL, '2nd free field');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('1876', 'frmListeCMMCLT01', 'CLT', 'CHPLIB3', 30, 
    '3rd free field', '3rd free field', 0, 0, 0, 
    'CLT.CHPLIB3', 0, NULL, '3rd free field');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('1877', 'frmListeCMMCLT01', 'CLT', 'CHPLIB4', 30, 
    '4th free field', '4th free field', 0, 0, 0, 
    'CLT.CHPLIB4', 0, NULL, '4th free field');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('1878', 'frmListeCMMCLT01', 'CLT', 'IDTSQCGNR', 22, 
    'General identifier', 'General identifier', 0, 0, 0, 
    'CLT.IDTSQCGNR', 0, NULL, 'General identifier');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('1879', 'frmListeCMMCLT01', 'CLT', 'T1', 6, 
    'Adaptable field typology 1', 'Adaptable field typology 1', 0, 0, 0, 
    'CLT.T1', 0, NULL, 'Adaptable field typology 1');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('1880', 'frmListeCMMCLT01', 'CLT', 'IDTT1', 6, 
    'Associated typology ID 1', 'Associated typology ID 1', 0, 0, 0, 
    'CLT.IDTT1', 0, NULL, 'Associated typology ID 1');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('1881', 'frmListeCMMCLT01', 'CLT', 'T2', 6, 
    'Adaptable field typology 2', 'Adaptable field typology 2', 0, 0, 0, 
    'CLT.T2', 0, NULL, 'Adaptable field typology 2');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('1882', 'frmListeCMMCLT01', 'CLT', 'IDTT2', 6, 
    'Associated typology ID 2', 'Associated typology ID 2', 0, 0, 0, 
    'CLT.IDTT2', 0, NULL, 'Associated typology ID 2');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('1883', 'frmListeCMMCLT01', 'CLT', 'T3', 6, 
    'Adaptable field typology 3', 'Adaptable field typology 3', 0, 0, 0, 
    'CLT.T3', 0, NULL, 'Adaptable field typology 3');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('1884', 'frmListeCMMCLT01', 'CLT', 'IDTT3', 6, 
    'Associated typology ID 3', 'Associated typology ID 3', 0, 0, 0, 
    'CLT.IDTT3', 0, NULL, 'Associated typology ID 3');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('1885', 'frmListeCMMCLT01', 'CLT', 'T4', 6, 
    'Adaptable field typology 4', 'Adaptable field typology 4', 0, 0, 0, 
    'CLT.T4', 0, NULL, 'Adaptable field typology 4');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('1886', 'frmListeCMMCLT01', 'CLT', 'IDTT4', 6, 
    'Associated typology ID 4', 'Associated typology ID 4', 0, 0, 0, 
    'CLT.IDTT4', 0, NULL, 'Associated typology ID 4');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('1887', 'frmListeCMMCLT01', 'CLT', 'T5', 6, 
    'Adaptable field typology 5', 'Adaptable field typology 5', 0, 0, 0, 
    'CLT.T5', 0, NULL, 'Adaptable field typology 5');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('1888', 'frmListeCMMCLT01', 'CLT', 'IDTT5', 6, 
    'Associated typology ID 5', 'Associated typology ID 5', 0, 0, 0, 
    'CLT.IDTT5', 0, NULL, 'Associated typology ID 5');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('1889', 'frmListeCMMCLT01', 'CLT', 'A1', 40, 
    'Adaptable field string 1', 'Adaptable field string 1', 0, 0, 0, 
    'CLT.A1', 0, NULL, 'Adaptable field string 1');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('1890', 'frmListeCMMCLT01', 'CLT', 'A2', 40, 
    'Adaptable field string 2', 'Adaptable field string 2', 0, 0, 0, 
    'CLT.A2', 0, NULL, 'Adaptable field string 2');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('1891', 'frmListeCMMCLT01', 'CLT', 'A3', 40, 
    'Adaptable field string 3', 'Adaptable field string 3', 0, 0, 0, 
    'CLT.A3', 0, NULL, 'Adaptable field string 3');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('1892', 'frmListeCMMCLT01', 'CLT', 'A4', 40, 
    'Adaptable field string 4', 'Adaptable field string 4', 0, 0, 0, 
    'CLT.A4', 0, NULL, 'Adaptable field string 4');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('1893', 'frmListeCMMCLT01', 'CLT', 'A5', 40, 
    'Adaptable field string 5', 'Adaptable field string 5', 0, 0, 0, 
    'CLT.A5', 0, NULL, 'Adaptable field string 5');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('1894', 'frmListeCMMCLT01', 'CLT', 'N1', 22, 
    'Adaptable field number 1', 'Adaptable field number 1', 0, 0, 0, 
    'CLT.N1', 0, NULL, 'Adaptable field number 1');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('1895', 'frmListeCMMCLT01', 'CLT', 'N2', 22, 
    'Adaptable field number 2', 'Adaptable field number 2', 0, 0, 0, 
    'CLT.N2', 0, NULL, 'Adaptable field number 2');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('1896', 'frmListeCMMCLT01', 'CLT', 'N3', 22, 
    'Adaptable field number 3', 'Adaptable field number 3', 0, 0, 0, 
    'CLT.N3', 0, NULL, 'Adaptable field number 3');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('1897', 'frmListeCMMCLT01', 'CLT', 'N4', 22, 
    'Adaptable field number 4', 'Adaptable field number 4', 0, 0, 0, 
    'CLT.N4', 0, NULL, 'Adaptable field number 4');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('1898', 'frmListeCMMCLT01', 'CLT', 'N5', 22, 
    'Adaptable field number 5', 'Adaptable field number 5', 0, 0, 0, 
    'CLT.N5', 0, NULL, 'Adaptable field number 5');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('1899', 'frmListeCMMCLT01', 'CLT', 'C1', 22, 
    'Adaptable field check-box 1', 'Adaptable field check-box 1', 0, 0, 0, 
    'CLT.C1', 0, NULL, 'Adaptable field check-box 1');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('1900', 'frmListeCMMCLT01', 'CLT', 'C2', 22, 
    'Adaptable field check-box 2', 'Adaptable field check-box 2', 0, 0, 0, 
    'CLT.C2', 0, NULL, 'Adaptable field check-box 2');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('1901', 'frmListeCMMCLT01', 'CLT', 'C3', 22, 
    'Adaptable field check-box 3', 'Adaptable field check-box 3', 0, 0, 0, 
    'CLT.C3', 0, NULL, 'Adaptable field check-box 3');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('1902', 'frmListeCMMCLT01', 'CLT', 'C4', 22, 
    'Adaptable field check-box 4', 'Adaptable field check-box 4', 0, 0, 0, 
    'CLT.C4', 0, NULL, 'Adaptable field check-box 4');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('1903', 'frmListeCMMCLT01', 'CLT', 'C5', 22, 
    'Adaptable field check-box 5', 'Adaptable field check-box 5', 0, 0, 0, 
    'CLT.C5', 0, NULL, 'Adaptable field check-box 5');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('1904', 'frmListeCMMCLT01', 'CLT', 'D1', 7, 
    'Adaptable field date 1', 'Adaptable field date 1', 0, 0, 0, 
    'TO_CHAR(CLT.D1,''DD/MM/YYYY'')', 0, NULL, 'Adaptable field date 1');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('1905', 'frmListeCMMCLT01', 'CLT', 'D2', 7, 
    'Adaptable field date 2', 'Adaptable field date 2', 0, 0, 0, 
    'TO_CHAR(CLT.D2,''DD/MM/YYYY'')', 0, NULL, 'Adaptable field date 2');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('1906', 'frmListeCMMCLT01', 'CLT', 'D3', 7, 
    'Adaptable field date 3', 'Adaptable field date 3', 0, 0, 0, 
    'TO_CHAR(CLT.D3,''DD/MM/YYYY'')', 0, NULL, 'Adaptable field date 3');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('1907', 'frmListeCMMCLT01', 'CLT', 'D4', 7, 
    'Adaptable field date 4', 'Adaptable field date 4', 0, 0, 0, 
    'TO_CHAR(CLT.D4,''DD/MM/YYYY'')', 0, NULL, 'Adaptable field date 4');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('1908', 'frmListeCMMCLT01', 'CLT', 'D5', 7, 
    'Adaptable field date 5', 'Adaptable field date 5', 0, 0, 0, 
    'TO_CHAR(CLT.D5,''DD/MM/YYYY'')', 0, NULL, 'Adaptable field date 5');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('1909', 'frmListeCMMCLT01', 'CLT', 'ADRSTR1', 50, 
    'Description of structured address 1', 'Description of structured address 1', 0, 0, 0, 
    'CLT.ADRSTR1', 0, NULL, 'Description of structured address 1');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('1910', 'frmListeCMMCTR01', 'PNTLVR', 'N5', 22, 
    'Adaptable field number 5', 'Adaptable field number 5', 0, 0, 0, 
    'PNTLVR.N5', 0, NULL, 'Adaptable field number 5');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('1911', 'frmListeCMMCTR01', 'PNTLVR', 'C1', 22, 
    'Adaptable field check-box 1', 'Adaptable field check-box 1', 0, 0, 0, 
    'PNTLVR.C1', 0, NULL, 'Adaptable field check-box 1');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('1912', 'frmListeCMMCTR01', 'PNTLVR', 'C2', 22, 
    'Adaptable field check-box 2', 'Adaptable field check-box 2', 0, 0, 0, 
    'PNTLVR.C2', 0, NULL, 'Adaptable field check-box 2');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('1913', 'frmListeCMMCTR01', 'PNTLVR', 'C3', 22, 
    'Adaptable field check-box 3', 'Adaptable field check-box 3', 0, 0, 0, 
    'PNTLVR.C3', 0, NULL, 'Adaptable field check-box 3');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('1591', 'frmListeCMMCTR01', 'CLT', 'T5', 6, 
    'Adaptable field typology 5', 'Adaptable field typology 5', 0, 0, 0, 
    'CLT.T5', 0, NULL, 'Adaptable field typology 5');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('1592', 'frmListeCMMCTR01', 'CLT', 'IDTT5', 6, 
    'Associated typology ID 5', 'Associated typology ID 5', 0, 0, 0, 
    'CLT.IDTT5', 0, NULL, 'Associated typology ID 5');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('1593', 'frmListeCMMCTR01', 'CLT', 'A1', 40, 
    'Adaptable field string 1', 'Adaptable field string 1', 0, 0, 0, 
    'CLT.A1', 0, NULL, 'Adaptable field string 1');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('1594', 'frmListeCMMCTR01', 'CLT', 'A2', 40, 
    'Adaptable field string 2', 'Adaptable field string 2', 0, 0, 0, 
    'CLT.A2', 0, NULL, 'Adaptable field string 2');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('1595', 'frmListeCMMCTR01', 'CLT', 'A3', 40, 
    'Adaptable field string 3', 'Adaptable field string 3', 0, 0, 0, 
    'CLT.A3', 0, NULL, 'Adaptable field string 3');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('1596', 'frmListeCMMCTR01', 'CLT', 'A4', 40, 
    'Adaptable field string 4', 'Adaptable field string 4', 0, 0, 0, 
    'CLT.A4', 0, NULL, 'Adaptable field string 4');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('1597', 'frmListeCMMCTR01', 'CLT', 'A5', 40, 
    'Adaptable field string 5', 'Adaptable field string 5', 0, 0, 0, 
    'CLT.A5', 0, NULL, 'Adaptable field string 5');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('1598', 'frmListeCMMCTR01', 'CLT', 'N1', 22, 
    'Adaptable field number 1', 'Adaptable field number 1', 0, 0, 0, 
    'CLT.N1', 0, NULL, 'Adaptable field number 1');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('1599', 'frmListeCMMCTR01', 'CLT', 'N2', 22, 
    'Adaptable field number 2', 'Adaptable field number 2', 0, 0, 0, 
    'CLT.N2', 0, NULL, 'Adaptable field number 2');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('1600', 'frmListeCMMCTR01', 'CLT', 'N3', 22, 
    'Adaptable field number 3', 'Adaptable field number 3', 0, 0, 0, 
    'CLT.N3', 0, NULL, 'Adaptable field number 3');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('1601', 'frmListeCMMCTR01', 'CLT', 'N4', 22, 
    'Adaptable field number 4', 'Adaptable field number 4', 0, 0, 0, 
    'CLT.N4', 0, NULL, 'Adaptable field number 4');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('1602', 'frmListeCMMCTR01', 'CLT', 'N5', 22, 
    'Adaptable field number 5', 'Adaptable field number 5', 0, 0, 0, 
    'CLT.N5', 0, NULL, 'Adaptable field number 5');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('1603', 'frmListeCMMCTR01', 'CLT', 'C1', 22, 
    'Adaptable field check-box 1', 'Adaptable field check-box 1', 0, 0, 0, 
    'CLT.C1', 0, NULL, 'Adaptable field check-box 1');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('1604', 'frmListeCMMCTR01', 'CLT', 'C2', 22, 
    'Adaptable field check-box 2', 'Adaptable field check-box 2', 0, 0, 0, 
    'CLT.C2', 0, NULL, 'Adaptable field check-box 2');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('1605', 'frmListeCMMCTR01', 'CLT', 'C3', 22, 
    'Adaptable field check-box 3', 'Adaptable field check-box 3', 0, 0, 0, 
    'CLT.C3', 0, NULL, 'Adaptable field check-box 3');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('1606', 'frmListeCMMCTR01', 'CLT', 'C4', 22, 
    'Adaptable field check-box 4', 'Adaptable field check-box 4', 0, 0, 0, 
    'CLT.C4', 0, NULL, 'Adaptable field check-box 4');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('1607', 'frmListeCMMCTR01', 'CLT', 'C5', 22, 
    'Adaptable field check-box 5', 'Adaptable field check-box 5', 0, 0, 0, 
    'CLT.C5', 0, NULL, 'Adaptable field check-box 5');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('1608', 'frmListeCMMCTR01', 'CLT', 'D1', 7, 
    'Adaptable field date 1', 'Adaptable field date 1', 0, 0, 0, 
    'TO_CHAR(CLT.D1,''DD/MM/YYYY'')', 0, NULL, 'Adaptable field date 1');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('1609', 'frmListeCMMCTR01', 'CLT', 'D2', 7, 
    'Adaptable field date 2', 'Adaptable field date 2', 0, 0, 0, 
    'TO_CHAR(CLT.D2,''DD/MM/YYYY'')', 0, NULL, 'Adaptable field date 2');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('1610', 'frmListeCMMCTR01', 'CLT', 'D3', 7, 
    'Adaptable field date 3', 'Adaptable field date 3', 0, 0, 0, 
    'TO_CHAR(CLT.D3,''DD/MM/YYYY'')', 0, NULL, 'Adaptable field date 3');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('1611', 'frmListeCMMCTR01', 'CLT', 'D4', 7, 
    'Adaptable field date 4', 'Adaptable field date 4', 0, 0, 0, 
    'TO_CHAR(CLT.D4,''DD/MM/YYYY'')', 0, NULL, 'Adaptable field date 4');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('1612', 'frmListeCMMCTR01', 'CLT', 'D5', 7, 
    'Adaptable field date 5', 'Adaptable field date 5', 0, 0, 0, 
    'TO_CHAR(CLT.D5,''DD/MM/YYYY'')', 0, NULL, 'Adaptable field date 5');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('1613', 'frmListeTCHPCG01', 'PNTCPG', 'DATMAJ', 7, 
    'Date de mise à jour', 'Date de mise à jour', 0, 1, 0, 
    'TO_CHAR(PNTCPG.DATMAJ,''DD/MM/YYYY'')', 0, NULL, 'Date de mise à jour');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('1614', 'frmListeTCHPCG01', 'PNTCPG', 'DMT', 22, 
    'Diamètre', 'Diametre', 0, 1, 0, 
    'PNTCPG.DMT', 0, NULL, 'Diametre');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('1615', 'frmListeTCHPCG01', 'PNTCPG', 'CLBMINDSJ', 22, 
    'Minimum calibre circuit breaker', 'Minimum calibre circuit breaker', 0, 0, 0, 
    'PNTCPG.CLBMINDSJ', 0, NULL, 'Minimum calibre circuit breaker');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('1616', 'frmListeTCHPCG01', 'PNTCPG', 'CLBMAXDSJ', 22, 
    'Maximum calibre of circuit breaker', 'Maximum calibre of circuit breaker', 0, 0, 0, 
    'PNTCPG.CLBMAXDSJ', 0, NULL, 'Maximum calibre of circuit breaker');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('1617', 'frmListeTCHPCG01', 'PNTCPG', 'NBRCND', 22, 
    'Number of conductors', 'Number of conductors', 0, 0, 0, 
    'PNTCPG.NBRCND', 0, NULL, 'Number of conductors');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('1618', 'frmListeTCHPCG01', 'PNTCPG', 'SCTCND', 22, 
    'Conductors section', 'Conductors section', 0, 1, 0, 
    'PNTCPG.SCTCND', 0, NULL, 'Conductors section');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('1619', 'frmListeTCHPCG01', 'PNTCPG', 'RGLDSJ', 22, 
    'Circuit breaker setting', 'Circuit breaker setting', 0, 1, 0, 
    'PNTCPG.RGLDSJ', 0, NULL, 'Circuit breaker setting');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('1620', 'frmListeTCHPCG01', 'PNTCPG', 'PSSTRS', 22, 
    'Puissance du transformateur', 'Puissance du transformateur', 0, 0, 0, 
    'PNTCPG.PSSTRS', 0, NULL, 'Puissance du transformateur');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('1621', 'frmListeTCHPCG01', 'PNTCPG', 'DATCNN', 7, 
    'Date de connexion', 'Date de connexion', 0, 1, 0, 
    'TO_CHAR(PNTCPG.DATCNN,''DD/MM/YYYY'')', 0, NULL, 'Date de connexion');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('1622', 'frmListeTCHPCG01', 'PNTCPG', 'DATDCN', 7, 
    'Date de deconnexion', 'Date de deconnexion', 0, 1, 0, 
    'TO_CHAR(PNTCPG.DATDCN,''DD/MM/YYYY'')', 0, NULL, 'Date de deconnexion');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('1623', 'frmListeTCHPCG01', 'PNTCPG', 'ADRLBR', 254, 
    'Adresse', 'Adresse', 0, 1, 1, 
    'SUBSTR(REPLACE(REPLACE(PNTCPG.ADRLBR,CHR(10),'' ''),CHR(13),'' ''),1,254)', 8, NULL, 'Adresse');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('1624', 'frmListeTCHPCG01', 'PNTCPG', 'DATCOU', 7, 
    'Date de coupure', 'Date de coupure', 0, 1, 0, 
    'TO_CHAR(PNTCPG.DATCOU,''DD/MM/YYYY'')', 0, NULL, 'Date de coupure');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('1625', 'frmListeTCHPCG01', 'PNTCPG', 'DATRMS', 7, 
    'Date de retablissement', 'Date de retablissement', 0, 1, 0, 
    'TO_CHAR(PNTCPG.DATRMS,''DD/MM/YYYY'')', 0, NULL, 'Date de retablissement');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('1626', 'frmListeTCHPCG01', 'PNTCPG', 'RNG1', 22, 
    'Rang', 'Rang', 0, 1, 1, 
    'PNTCPG.RNG1', 6, NULL, 'Rang');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('1627', 'frmListeTCHPCG01', 'PNTCPG', 'IDTUNTMSRDMT', 22, 
    'Diameter unit of measure ID', 'Diameter unit of measure ID', 0, 1, 0, 
    'PNTCPG.IDTUNTMSRDMT', 0, NULL, 'Diameter unit of measure ID');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('1628', 'frmListeTCHPCG01', 'PNTCPG', 'IDTSQCGNR', 22, 
    'General sequence ID', 'General sequence ID', 0, 0, 0, 
    'PNTCPG.IDTSQCGNR', 0, NULL, 'General sequence ID');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('1629', 'frmListeTCHPCG01', 'PNTCPG', 'IDTTYPCPG', 22, 
    'Type de métrage', 'Type de métrage', 0, 1, 0, 
    'PNTCPG.IDTTYPCPG', 0, NULL, 'Type de métrage');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('1630', 'frmListeTCHPCG01', 'PNTCPG', 'T1', 6, 
    'Adaptable field typologie 1', 'Adaptable field typologie 1', 0, 0, 0, 
    'PNTCPG.T1', 0, NULL, 'Adaptable field typologie 1');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('1631', 'frmListeTCHPCG01', 'PNTCPG', 'IDTT1', 6, 
    'Associated typology ID 1', 'Associated typology ID 1', 0, 0, 0, 
    'PNTCPG.IDTT1', 0, NULL, 'Associated typology ID 1');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('1632', 'frmListeTCHPCG01', 'PNTCPG', 'T2', 6, 
    'Adaptable field typologie 2', 'Adaptable field typologie 2', 0, 0, 0, 
    'PNTCPG.T2', 0, NULL, 'Adaptable field typologie 2');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('1633', 'frmListeTCHPCG01', 'PNTCPG', 'IDTT2', 6, 
    'Associated typology ID 2', 'Associated typology ID 2', 0, 0, 0, 
    'PNTCPG.IDTT2', 0, NULL, 'Associated typology ID 2');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('1634', 'frmListeTCHPCG01', 'PNTCPG', 'T3', 6, 
    'Adaptable field typologie 3', 'Adaptable field typologie 3', 0, 0, 0, 
    'PNTCPG.T3', 0, NULL, 'Adaptable field typologie 3');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('1635', 'frmListeTCHPCG01', 'PNTCPG', 'IDTT3', 6, 
    'Associated typology ID 3', 'Associated typology ID 3', 0, 0, 0, 
    'PNTCPG.IDTT3', 0, NULL, 'Associated typology ID 3');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('1636', 'frmListeTCHPCG01', 'PNTCPG', 'T4', 6, 
    'Adaptable field typologie 4', 'Adaptable field typologie 4', 0, 0, 0, 
    'PNTCPG.T4', 0, NULL, 'Adaptable field typologie 4');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('1637', 'frmListeTCHPCG01', 'PNTCPG', 'IDTT4', 6, 
    'Associated typology ID 4', 'Associated typology ID 4', 0, 0, 0, 
    'PNTCPG.IDTT4', 0, NULL, 'Associated typology ID 4');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('1638', 'frmListeTCHPCG01', 'PNTCPG', 'T5', 6, 
    'Adaptable field typologie 5', 'Adaptable field typologie 5', 0, 0, 0, 
    'PNTCPG.T5', 0, NULL, 'Adaptable field typologie 5');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('1639', 'frmListeTCHPCG01', 'PNTCPG', 'IDTT5', 6, 
    'Associated typology ID 5', 'Associated typology ID 5', 0, 0, 0, 
    'PNTCPG.IDTT5', 0, NULL, 'Associated typology ID 5');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('1640', 'frmListeTCHPCG01', 'PNTCPG', 'A1', 40, 
    'Adaptable field string 1', 'Adaptable field string 1', 0, 0, 0, 
    'PNTCPG.A1', 0, NULL, 'Adaptable field string 1');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('1641', 'frmListeTCHPCG01', 'PNTCPG', 'A2', 40, 
    'Adaptable field string 2', 'Adaptable field string 2', 0, 0, 0, 
    'PNTCPG.A2', 0, NULL, 'Adaptable field string 2');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('1642', 'frmListeTCHPCG01', 'PNTCPG', 'A3', 40, 
    'Adaptable field string 3', 'Adaptable field string 3', 0, 0, 0, 
    'PNTCPG.A3', 0, NULL, 'Adaptable field string 3');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('1643', 'frmListeTCHPCG01', 'PNTCPG', 'A4', 40, 
    'Adaptable field string 4', 'Adaptable field string 4', 0, 0, 0, 
    'PNTCPG.A4', 0, NULL, 'Adaptable field string 4');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('1644', 'frmListeTCHPCG01', 'PNTCPG', 'A5', 40, 
    'Adaptable field string 5', 'Adaptable field string 5', 0, 0, 0, 
    'PNTCPG.A5', 0, NULL, 'Adaptable field string 5');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('1645', 'frmListeTCHPCG01', 'PNTCPG', 'N1', 22, 
    'Adaptable field number 1', 'Adaptable field number 1', 0, 0, 0, 
    'PNTCPG.N1', 0, NULL, 'Adaptable field number 1');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('1646', 'frmListeTCHPCG01', 'PNTCPG', 'N2', 22, 
    'Adaptable field number 2', 'Adaptable field number 2', 0, 0, 0, 
    'PNTCPG.N2', 0, NULL, 'Adaptable field number 2');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('1647', 'frmListeTCHPCG01', 'PNTCPG', 'N3', 22, 
    'Adaptable field number 3', 'Adaptable field number 3', 0, 0, 0, 
    'PNTCPG.N3', 0, NULL, 'Adaptable field number 3');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('1648', 'frmListeTCHPCG01', 'PNTCPG', 'N4', 22, 
    'Adaptable field number 4', 'Adaptable field number 4', 0, 0, 0, 
    'PNTCPG.N4', 0, NULL, 'Adaptable field number 4');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('1649', 'frmListeTCHPCG01', 'PNTCPG', 'N5', 22, 
    'Adaptable field number 5', 'Adaptable field number 5', 0, 0, 0, 
    'PNTCPG.N5', 0, NULL, 'Adaptable field number 5');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('1650', 'frmListeTCHPCG01', 'PNTCPG', 'C1', 22, 
    'Adaptable field check-box 1', 'Adaptable field check-box 1', 0, 0, 0, 
    'PNTCPG.C1', 0, NULL, 'Adaptable field check-box 1');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('1651', 'frmListeTCHPCG01', 'PNTCPG', 'C2', 22, 
    'Adaptable field check-box 2', 'Adaptable field check-box 2', 0, 0, 0, 
    'PNTCPG.C2', 0, NULL, 'Adaptable field check-box 2');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('1652', 'frmListeTCHPCG01', 'PNTCPG', 'C3', 22, 
    'Adaptable field check-box 3', 'Adaptable field check-box 3', 0, 0, 0, 
    'PNTCPG.C3', 0, NULL, 'Adaptable field check-box 3');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('1653', 'frmListeTCHPCG01', 'PNTCPG', 'C4', 22, 
    'Adaptable field check-box 4', 'Adaptable field check-box 4', 0, 0, 0, 
    'PNTCPG.C4', 0, NULL, 'Adaptable field check-box 4');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('1654', 'frmListeTCHPCG01', 'PNTCPG', 'C5', 22, 
    'Adaptable field check-box 5', 'Adaptable field check-box 5', 0, 0, 0, 
    'PNTCPG.C5', 0, NULL, 'Adaptable field check-box 5');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('1655', 'frmListeTCHPCG01', 'PNTCPG', 'D1', 7, 
    'Adaptable field check-box 1', 'Adaptable field check-box 1', 0, 0, 0, 
    'TO_CHAR(PNTCPG.D1,''DD/MM/YYYY'')', 0, NULL, 'Adaptable field check-box 1');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('1656', 'frmListeCMMCTR01', 'CTR_ALL', 'IDTT2', 6, 
    'Associated typology ID 2', 'Associated typology ID 2', 0, 0, 0, 
    'CTR_ALL.IDTT2', 0, NULL, 'Associated typology ID 2');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('1657', 'frmListeCMMCTR01', 'CTR_ALL', 'T3', 6, 
    'Adaptable field typologie 3', 'Adaptable field typologie 3', 0, 0, 0, 
    'CTR_ALL.T3', 0, NULL, 'Adaptable field typologie 3');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('1658', 'frmListeCMMCTR01', 'CTR_ALL', 'IDTT3', 6, 
    'Associated typology ID 3', 'Associated typology ID 3', 0, 0, 0, 
    'CTR_ALL.IDTT3', 0, NULL, 'Associated typology ID 3');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('1659', 'frmListeCMMCTR01', 'CTR_ALL', 'T4', 6, 
    'Adaptable field typologie 4', 'Adaptable field typologie 4', 0, 0, 0, 
    'CTR_ALL.T4', 0, NULL, 'Adaptable field typologie 4');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('1660', 'frmListeCMMCTR01', 'CTR_ALL', 'IDTT4', 6, 
    'Associated typology ID 4', 'Associated typology ID 4', 0, 0, 0, 
    'CTR_ALL.IDTT4', 0, NULL, 'Associated typology ID 4');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('1661', 'frmListeCMMCTR01', 'CTR_ALL', 'T5', 6, 
    'Adaptable field typologie 5', 'Adaptable field typologie 5', 0, 0, 0, 
    'CTR_ALL.T5', 0, NULL, 'Adaptable field typologie 5');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('1662', 'frmListeCMMCTR01', 'CTR_ALL', 'IDTT5', 6, 
    'Associated typology ID 5', 'Associated typology ID 5', 0, 0, 0, 
    'CTR_ALL.IDTT5', 0, NULL, 'Associated typology ID 5');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('1663', 'frmListeCMMCTR01', 'CTR_ALL', 'A1', 40, 
    'Adaptable field string 1', 'Adaptable field string 1', 0, 0, 0, 
    'CTR_ALL.A1', 0, NULL, 'Adaptable field string 1');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('1664', 'frmListeCMMCTR01', 'CTR_ALL', 'A2', 40, 
    'Adaptable field string 2', 'Adaptable field string 2', 0, 0, 0, 
    'CTR_ALL.A2', 0, NULL, 'Adaptable field string 2');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('1665', 'frmListeCMMCTR01', 'CTR_ALL', 'A3', 40, 
    'Adaptable field string 3', 'Adaptable field string 3', 0, 0, 0, 
    'CTR_ALL.A3', 0, NULL, 'Adaptable field string 3');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('1666', 'frmListeCMMCTR01', 'CTR_ALL', 'A4', 40, 
    'Adaptable field string 4', 'Adaptable field string 4', 0, 0, 0, 
    'CTR_ALL.A4', 0, NULL, 'Adaptable field string 4');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('1667', 'frmListeCMMCTR01', 'CTR_ALL', 'A5', 40, 
    'Adaptable field string 5', 'Adaptable field string 5', 0, 0, 0, 
    'CTR_ALL.A5', 0, NULL, 'Adaptable field string 5');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('1668', 'frmListeCMMCTR01', 'CTR_ALL', 'N1', 22, 
    'Adaptable field number 1', 'Adaptable field number 1', 0, 0, 0, 
    'CTR_ALL.N1', 0, NULL, 'Adaptable field number 1');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('1669', 'frmListeCMMCTR01', 'CTR_ALL', 'N2', 22, 
    'Adaptable field number 2', 'Adaptable field number 2', 0, 0, 0, 
    'CTR_ALL.N2', 0, NULL, 'Adaptable field number 2');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('1670', 'frmListeCMMCTR01', 'CTR_ALL', 'N3', 22, 
    'Adaptable field number 3', 'Adaptable field number 3', 0, 0, 0, 
    'CTR_ALL.N3', 0, NULL, 'Adaptable field number 3');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('1671', 'frmListeCMMCTR01', 'CTR_ALL', 'N4', 22, 
    'Adaptable field number 4', 'Adaptable field number 4', 0, 0, 0, 
    'CTR_ALL.N4', 0, NULL, 'Adaptable field number 4');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('1672', 'frmListeCMMCTR01', 'CTR_ALL', 'N5', 22, 
    'Adaptable field number 5', 'Adaptable field number 5', 0, 0, 0, 
    'CTR_ALL.N5', 0, NULL, 'Adaptable field number 5');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('1673', 'frmListeCMMCTR01', 'CLT', 'IDTCTGCLT', 6, 
    'Categorie de client', 'Categorie de client', 0, 1, 0, 
    'CLT.IDTCTGCLT', 0, NULL, 'Categorie de client');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('1674', 'frmListeTCHPCG01', 'PNTLVR', 'IDTPNTLVR', 60, 
    'Point de livraison', 'Identifiant interne', 1, 1, 0, 
    'PNTLVR.IdtDcpGgr || PRMGNR.SprCdf || PNTLVR.NumOrd', 1, NULL, 'Identifiant interne');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('1675', 'frmListeTCHCPR01', 'CPR', 'DATFBR', 7, 
    'Date de fabrication', 'Date de fabrication', 0, 1, 1, 
    'TO_CHAR(CPR.DATFBR,''DD/MM/YYYY'')', 7, NULL, 'Date de fabrication');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('1676', 'frmListeTCHCPR01', 'CPR', 'DATETL', 7, 
    'Date d''etalonnage', 'Date d''etalonnage', 0, 1, 0, 
    'TO_CHAR(CPR.DATETL,''DD/MM/YYYY'')', 0, NULL, 'Date d''etalonnage');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('1677', 'frmListeTCHCPR01', 'CPR', 'DATAGR', 7, 
    'Date d''agrement', 'Date d''agrement', 0, 1, 0, 
    'TO_CHAR(CPR.DATAGR,''DD/MM/YYYY'')', 0, NULL, 'Date d''agrement');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('1678', 'frmListeTCHCPR01', 'CPR', 'SQCCNS', 22, 
    'Consumption serial number', 'Consumption serial number', 0, 1, 0, 
    'CPR.SQCCNS', 0, NULL, 'Consumption serial number');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('1679', 'frmListeTCHCPR01', 'CPR', 'SQCIND', 22, 
    'Serial number of the index of the meter', 'Serial number of the index of the meter', 0, 1, 0, 
    'CPR.SQCIND', 0, NULL, 'Serial number of the index of the meter');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('1680', 'frmListeTCHCPR01', 'CPR', 'IDTSQCGNR', 22, 
    'General identifier', 'General identifier', 0, 1, 0, 
    'CPR.IDTSQCGNR', 0, NULL, 'General identifier');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('1681', 'frmListeTCHCPR01', 'CPR', 'T1', 6, 
    'Adaptable field typology 1', 'Adaptable field typology 1', 0, 0, 0, 
    'CPR.T1', 0, NULL, 'Adaptable field typology 1');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('1682', 'frmListeTCHCPR01', 'CPR', 'IDTT1', 6, 
    'Associated typology ID 1', 'Associated typology ID 1', 0, 0, 0, 
    'CPR.IDTT1', 0, NULL, 'Associated typology ID 1');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('1683', 'frmListeTCHCPR01', 'CPR', 'T2', 6, 
    'Adaptable field typology 2', 'Adaptable field typology 2', 0, 0, 0, 
    'CPR.T2', 0, NULL, 'Adaptable field typology 2');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('1684', 'frmListeTCHCPR01', 'CPR', 'IDTT2', 6, 
    'Associated typology ID 2', 'Associated typology ID 2', 0, 0, 0, 
    'CPR.IDTT2', 0, NULL, 'Associated typology ID 2');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('1685', 'frmListeTCHCPR01', 'CPR', 'T3', 6, 
    'Adaptable field typology 3', 'Adaptable field typology 3', 0, 0, 0, 
    'CPR.T3', 0, NULL, 'Adaptable field typology 3');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('1686', 'frmListeTCHCPR01', 'CPR', 'IDTT3', 6, 
    'Associated typology ID 3', 'Associated typology ID 3', 0, 0, 0, 
    'CPR.IDTT3', 0, NULL, 'Associated typology ID 3');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('1687', 'frmListeTCHCPR01', 'CPR', 'T4', 6, 
    'Adaptable field typology 4', 'Adaptable field typology 4', 0, 0, 0, 
    'CPR.T4', 0, NULL, 'Adaptable field typology 4');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('1688', 'frmListeTCHCPR01', 'CPR', 'IDTT4', 6, 
    'Associated typology ID 4', 'Associated typology ID 4', 0, 0, 0, 
    'CPR.IDTT4', 0, NULL, 'Associated typology ID 4');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('1689', 'frmListeTCHCPR01', 'CPR', 'T5', 6, 
    'Adaptable field typology 5', 'Adaptable field typology 5', 0, 0, 0, 
    'CPR.T5', 0, NULL, 'Adaptable field typology 5');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('1690', 'frmListeTCHCPR01', 'CPR', 'IDTT5', 6, 
    'Associated typology ID 5', 'Associated typology ID 5', 0, 0, 0, 
    'CPR.IDTT5', 0, NULL, 'Associated typology ID 5');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('1691', 'frmListeTCHCPR01', 'CPR', 'A1', 40, 
    'Adaptable field string 1', 'Adaptable field string 1', 0, 0, 0, 
    'CPR.A1', 0, NULL, 'Adaptable field string 1');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('1692', 'frmListeTCHCPR01', 'CPR', 'A2', 40, 
    'Adaptable field string 2', 'Adaptable field string 2', 0, 0, 0, 
    'CPR.A2', 0, NULL, 'Adaptable field string 2');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('1693', 'frmListeTCHCPR01', 'CPR', 'A3', 40, 
    'Adaptable field string 3', 'Adaptable field string 3', 0, 0, 0, 
    'CPR.A3', 0, NULL, 'Adaptable field string 3');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('1694', 'frmListeTCHCPR01', 'CPR', 'A4', 40, 
    'Adaptable field string 4', 'Adaptable field string 4', 0, 0, 0, 
    'CPR.A4', 0, NULL, 'Adaptable field string 4');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('1695', 'frmListeTCHCPR01', 'CPR', 'A5', 40, 
    'Adaptable field string 5', 'Adaptable field string 5', 0, 0, 0, 
    'CPR.A5', 0, NULL, 'Adaptable field string 5');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('1696', 'frmListeTCHCPR01', 'CPR', 'IDTAGT', 6, 
    'Employee ID', 'Employee ID', 0, 1, 0, 
    'CPR.IDTAGT', 0, NULL, 'Employee ID');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('1697', 'frmListeTCHPCG01', 'PNTCPG', 'IDTPNTLVR', 22, 
    'Delivery point ID', 'Delivery point ID', 0, 1, 0, 
    'PNTCPG.IDTPNTLVR', 0, NULL, 'Delivery point ID');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('1698', 'frmListeTCHPCG01', 'PNTCPG', 'IDTPNTCPG', 22, 
    'Internal metering point ID', 'Numero d''ordre', 0, 1, 0, 
    'PNTCPG.IDTPNTCPG', 0, NULL, 'Numero d''ordre');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('1699', 'frmListeTCHPCG01', 'PNTCPG', 'IDTSRV', 22, 
    'Service Id', 'Service Id', 0, 1, 0, 
    'PNTCPG.IDTSRV', 0, NULL, 'Service Id');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('1700', 'frmListeTCHPCG01', 'PNTCPG', 'IDTTRNTYP', 6, 
    'Standard round ID', 'Tournee type', 0, 1, 0, 
    'PNTCPG.IDTTRNTYP', 0, NULL, 'Tournee type');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('1701', 'frmListeTCHPCG01', 'PNTCPG', 'IDTCNTOPR', 6, 
    'Operational center ID', 'Operational center ID', 0, 1, 1, 
    'PNTCPG.IDTCNTOPR', 3, NULL, 'Operational center ID');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('1702', 'frmListeTCHPCG01', 'PNTCPG', 'MTRAGT', 6, 
    'ID of the employee who carries out updating', 'ID of the employee who carries out updating', 0, 1, 0, 
    'PNTCPG.MTRAGT', 0, NULL, 'ID of the employee who carries out updating');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('1703', 'frmListeTCHCPR01', 'CPR', 'NUMCPR', 20, 
    'Numero', 'Numero', 1, 1, 0, 
    'CPR.NUMCPR', 1, NULL, 'Numero');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('1704', 'frmListeTCHPCG01', 'PNTCPG', 'D2', 7, 
    'Adaptable field check-box 2', 'Adaptable field check-box 2', 0, 0, 0, 
    'TO_CHAR(PNTCPG.D2,''DD/MM/YYYY'')', 0, NULL, 'Adaptable field check-box 2');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('1705', 'frmListeTCHPCG01', 'PNTCPG', 'D3', 7, 
    'Adaptable field check-box 3', 'Adaptable field check-box 3', 0, 0, 0, 
    'TO_CHAR(PNTCPG.D3,''DD/MM/YYYY'')', 0, NULL, 'Adaptable field check-box 3');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('1706', 'frmListeTCHPCG01', 'PNTCPG', 'D4', 7, 
    'Adaptable field check-box 4', 'Adaptable field check-box 4', 0, 0, 0, 
    'TO_CHAR(PNTCPG.D4,''DD/MM/YYYY'')', 0, NULL, 'Adaptable field check-box 4');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('1707', 'frmListeTCHPCG01', 'PNTCPG', 'D5', 7, 
    'Adaptable field check-box 5', 'Adaptable field check-box 5', 0, 0, 0, 
    'TO_CHAR(PNTCPG.D5,''DD/MM/YYYY'')', 0, NULL, 'Adaptable field check-box 5');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('1708', 'frmListeTCHPCG01', 'PNTCPG', 'ANCRFR', 20, 
    'Ancienne reference', 'Ancienne reference', 0, 1, 0, 
    'PNTCPG.ANCRFR', 0, NULL, 'Ancienne reference');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('1709', 'frmListeTCHPCG01', 'PNTCPG', 'ADRSTR1', 50, 
    'Description of structured address 1', 'Description of structured address 1', 0, 0, 0, 
    'PNTCPG.ADRSTR1', 0, NULL, 'Description of structured address 1');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('1710', 'frmListeTCHPCG01', 'PNTCPG', 'ADRSTR2', 50, 
    'Description of structured address 2', 'Description of structured address 2', 0, 0, 0, 
    'PNTCPG.ADRSTR2', 0, NULL, 'Description of structured address 2');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('1711', 'frmListeTCHPCG01', 'PNTCPG', 'ADRSTR3', 50, 
    'Description of structured address 3', 'Description of structured address 3', 0, 0, 0, 
    'PNTCPG.ADRSTR3', 0, NULL, 'Description of structured address 3');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('1712', 'frmListeTCHPCG01', 'PNTCPG', 'ADRSTR4', 50, 
    'Description of structured address 4', 'Description of structured address 4', 0, 0, 0, 
    'PNTCPG.ADRSTR4', 0, NULL, 'Description of structured address 4');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('1713', 'frmListeTCHPCG01', 'PNTCPG', 'ADRSTR5', 50, 
    'Description of structured address 5', 'Description of structured address 5', 0, 0, 0, 
    'PNTCPG.ADRSTR5', 0, NULL, 'Description of structured address 5');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('1714', 'frmListeTCHPCG01', 'PNTCPG', 'ADRSTR6', 50, 
    'Description of structured address 6', 'Description of structured address 6', 0, 0, 0, 
    'PNTCPG.ADRSTR6', 0, NULL, 'Description of structured address 6');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('1715', 'frmListeTCHPCG01', 'PNTCPG', 'ADRSTR7', 50, 
    'Description of structured address 7', 'Description of structured address 7', 0, 0, 0, 
    'PNTCPG.ADRSTR7', 0, NULL, 'Description of structured address 7');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('1716', 'frmListeTCHPCG01', 'PNTCPG', 'ADRSTR8', 50, 
    'Description of structured address 8', 'Description of structured address 8', 0, 0, 0, 
    'PNTCPG.ADRSTR8', 0, NULL, 'Description of structured address 8');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('1717', 'frmListeCMMCLT01', 'CLT', 'ADRSTR2', 50, 
    'Description of structured address 2', 'Description of structured address 2', 0, 0, 0, 
    'CLT.ADRSTR2', 0, NULL, 'Description of structured address 2');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('1718', 'frmListeCMMCLT01', 'CLT', 'ADRSTR3', 50, 
    'Description of structured address 3', 'Description of structured address 3', 0, 0, 0, 
    'CLT.ADRSTR3', 0, NULL, 'Description of structured address 3');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('1719', 'frmListeCMMCLT01', 'CLT', 'ADRSTR4', 50, 
    'Description of structured address 4', 'Description of structured address 4', 0, 0, 0, 
    'CLT.ADRSTR4', 0, NULL, 'Description of structured address 4');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('1720', 'frmListeCMMCLT01', 'CLT', 'ADRSTR5', 50, 
    'Description of structured address 5', 'Description of structured address 5', 0, 0, 0, 
    'CLT.ADRSTR5', 0, NULL, 'Description of structured address 5');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('1721', 'frmListeCMMCLT01', 'CLT', 'IDTCLT', 6, 
    'Nombre de contrat', 'Code', 0, 1, 0, 
    '(SELECT COUNT(*) FROM CTR WHERE CTR.IDTCLTDST = CLT.IDTCLT)', 0, NULL, 'Code');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('1722', 'frmListeCMMCTR01', 'CTR_ALL', 'IDTCTR', 60, 
    'Point de livraison', 'Numero', 0, 1, 1, 
    'PNTLVR.IdtDcpGgr || PRMGNR.SprCdf || PNTLVR.NumOrd', 3, NULL, 'Numero');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('1723', 'frmListeCMMCLT01', 'CLT', 'ADRSTR6', 50, 
    'Description of structured address 6', 'Description of structured address 6', 0, 0, 0, 
    'CLT.ADRSTR6', 0, NULL, 'Description of structured address 6');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('1724', 'frmListeCMMCLT01', 'CLT', 'ADRSTR7', 50, 
    'Description of structured address 7', 'Description of structured address 7', 0, 0, 0, 
    'CLT.ADRSTR7', 0, NULL, 'Description of structured address 7');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('1725', 'frmListeCMMCLT01', 'CLT', 'ADRSTR8', 50, 
    'Description of structured address 8', 'Description of structured address 8', 0, 0, 0, 
    'CLT.ADRSTR8', 0, NULL, 'Description of structured address 8');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('1726', 'frmListeCMMCLT01', 'CLT', 'ADRSTR9', 254, 
    'Description of structured address 9', 'Description of structured address 9', 0, 0, 0, 
    'CLT.ADRSTR9', 0, NULL, 'Description of structured address 9');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('1727', 'frmListeCMMCLT01', 'CLT', 'ADRSTR10', 50, 
    'Description of structured address 10', 'Description of structured address 10', 0, 0, 0, 
    'CLT.ADRSTR10', 0, NULL, 'Description of structured address 10');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('1728', 'frmListeCMMCLT01', 'CLT', 'CHPLIB5', 254, 
    'Lib 5', 'Lib 5', 0, 0, 0, 
    'CLT.CHPLIB5', 0, NULL, 'Lib 5');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('1729', 'frmListeCMMCLT01', 'CLT', 'TLP', 20, 
    'Telephone portable', 'Telephone portable', 0, 1, 0, 
    'CLT.TLP', 0, NULL, 'Telephone portable');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('1730', 'frmListeCMMCLT01', 'CLT', 'MAIL', 40, 
    'Messagerie electronique', 'Messagerie electronique', 0, 1, 0, 
    'CLT.MAIL', 0, NULL, 'Messagerie electronique');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('1731', 'frmListeCMMCTR01', 'CTR_ALL', 'IDTPNTCPG', 6, 
    'Point de comptage', 'Point de comptage', 0, 1, 1, 
    'PNTCPG.IDTPNTCPG', 4, NULL, 'Point de comptage');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('1732', 'frmListeCMMCTR01', 'CLT', 'IDTCLT', 6, 
    'Code', 'Code', 0, 1, 0, 
    'CLT.IDTCLT', 0, NULL, 'Code');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('1733', 'frmListeCMMCTR01', 'CTR_ALL', 'IDTCTR', 10, 
    'Numéro', 'Numero', 1, 1, 0, 
    'CTR_ALL.IDTCTR', 1, NULL, 'Numero');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('1734', 'frmListeCMMCTR01', 'CTR_ALL', 'IDTPNTLVR', 22, 
    'Delivery point ID', 'Delivery point ID', 0, 1, 0, 
    'CTR_ALL.IDTPNTLVR', 0, NULL, 'Delivery point ID');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('1735', 'frmListeCMMCTR01', 'CTR_ALL', 'IDTPNTCPG', 22, 
    'Metering point ID', 'Metering point ID', 0, 1, 0, 
    'CTR_ALL.IDTPNTCPG', 0, NULL, 'Metering point ID');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('1736', 'frmListeCMMCTR01', 'CTR_ALL', 'IDTLOTFAC', 6, 
    'Billing batch ID', 'Lot de facturation', 0, 1, 0, 
    'CTR_ALL.IDTLOTFAC', 0, NULL, 'Lot de facturation');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('1737', 'frmListeCMMCTR01', 'CTR_ALL', 'IDTCLTDST', 6, 
    'Addressee ID', 'Code destinataire', 0, 1, 0, 
    'CTR_ALL.IDTCLTDST', 0, NULL, 'Code destinataire');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('1738', 'frmListeCMMCTR01', 'CTR_ALL', 'IDTCLTSSC', 6, 
    'Client souscripteur', 'Code souscripteur', 0, 1, 1, 
    'CTR_ALL.IDTCLTSSC', 7, NULL, 'Code souscripteur');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('1739', 'frmListeCMMCTR01', 'CTR_ALL', 'IDTCNTOPR', 6, 
    'Centre opérationel', 'Centre opérationel', 0, 1, 1, 
    'CTR_ALL.IDTCNTOPR', 14, NULL, 'Centre opérationel');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('1740', 'frmListeCMMCTR01', 'CTR_ALL', 'IDTCODSNS', 6, 
    'Code sensibilité', 'Code sensibilité', 0, 1, 1, 
    'CTR_ALL.IDTCODSNS', 15, NULL, 'Code sensibilité');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('1741', 'frmListeCMMCTR01', 'CLT', 'IDTQLT', 6, 
    'Qualité client', 'Qualité client', 0, 1, 0, 
    'CLT.IDTQLT', 0, NULL, 'Qualité client');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('1742', 'frmListeCMMCTR01', 'CTR_ALL', 'DATRSL', 7, 
    'Résilié le', 'Date de resiliation', 0, 1, 0, 
    'TO_CHAR(CTR_ALL.DATRSL,''DD/MM/YYYY'')', 2, NULL, 'Date de resiliation');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('1743', 'frmListeCMMCTR01', 'CTR_ALL', 'MTFRSL', 15, 
    'Motive for termination', 'Motive for termination', 0, 1, 0, 
    'CTR_ALL.MTFRSL', 0, NULL, 'Motive for termination');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('1744', 'frmListeCMMCTR01', 'CTR_ALL', 'DATDRNFCT', 7, 
    'Date of last billing of the contract', 'Date de derniere facturation', 0, 1, 0, 
    'TO_CHAR(CTR_ALL.DATDRNFCT,''DD/MM/YYYY'')', 0, NULL, 'Date de derniere facturation');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('1745', 'frmListeCMMCTR01', 'CTR_ALL', 'DEBDRNPRDFCT', 7, 
    'Last billed period (starting date)', 'Last billed period (starting date)', 0, 1, 0, 
    'TO_CHAR(CTR_ALL.DEBDRNPRDFCT,''DD/MM/YYYY'')', 0, NULL, 'Last billed period (starting date)');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('1746', 'frmListeCMMCTR01', 'CTR_ALL', 'FINDRNPRDFCT', 7, 
    'Last billed period (ending date)', '????? ??? ????', 0, 1, 0, 
    'TO_CHAR(CTR_ALL.FINDRNPRDFCT,''DD/MM/YYYY'')', 0, NULL, '????? ??? ????');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('1747', 'frmListeCMMCTR01', 'CTR_ALL', 'SQCAVN', 22, 
    'Amendment serial number', 'Amendment serial number', 0, 1, 0, 
    'CTR_ALL.SQCAVN', 0, NULL, 'Amendment serial number');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('1748', 'frmListeCMMCTR01', 'CTR_ALL', 'DPTGRN', 22, 
    'Deposit', 'Depot de garantie', 0, 1, 1, 
    'CTR_ALL.DPTGRN', 13, NULL, 'Depot de garantie');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('1749', 'frmListeCMMCTR01', 'CTR_ALL', 'NUMINTER', 22, 
    'Work order number', 'Work order number', 0, 1, 0, 
    'CTR_ALL.NUMINTER', 0, NULL, 'Work order number');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('1750', 'frmListeCMMCTR01', 'CTR_ALL', 'IDTSRV', 22, 
    'Service ID (1 <WATER>, 2 <LV electricity>, 3 <MV electricity>, ...)', 'Service ID (1 <WATER>, 2 <LV electricity>, 3 <MV electricity>, ...)', 0, 1, 0, 
    'CTR_ALL.IDTSRV', 0, NULL, 'Service ID (1 <WATER>, 2 <LV electricity>, 3 <MV electricity>, ...)');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('1751', 'frmListeCMMCTR01', 'CTR_ALL', 'ETTCTR', 22, 
    'Contract status ( 1< normal>, 2<creation mode of the amendment>, 3<cancellation mode>, 4<creation mode>)', 'Contract status ( 1< normal>, 2<creation mode of the amendment>, 3<cancellation mode>, 4<creation mode>)', 0, 1, 0, 
    'CTR_ALL.ETTCTR', 0, NULL, 'Contract status ( 1< normal>, 2<creation mode of the amendment>, 3<cancellation mode>, 4<creation mode>)');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('1752', 'frmListeCMMCTR01', 'CTR_ALL', 'CODTYPCTR', 6, 
    'Type of contract code', 'Type de contrat', 0, 1, 0, 
    'CTR_ALL.CODTYPCTR', 0, NULL, 'Type de contrat');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('1753', 'frmListeCMMCTR01', 'CTR_ALL', 'IDTSQCGNR', 22, 
    'General identifier', 'General identifier', 0, 1, 0, 
    'CTR_ALL.IDTSQCGNR', 0, NULL, 'General identifier');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('1754', 'frmListeCMMCTR01', 'CTR_ALL', 'IDTRCVTYP', 6, 
    'Debt recovery type ID', 'Recouvrement type', 0, 1, 0, 
    'CTR_ALL.IDTRCVTYP', 0, NULL, 'Recouvrement type');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('1755', 'frmListeCMMCTR01', 'CTR_ALL', 'IDTBNQ', 6, 
    'Banque', 'Banque', 0, 1, 0, 
    'CTR_ALL.IDTBNQ', 0, NULL, 'Banque');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('1756', 'frmListeCMMCTR01', 'CTR_ALL', 'NUMCPTBNC', 30, 
    'Bank account number', 'Compte', 0, 1, 0, 
    'CTR_ALL.NUMCPTBNC', 0, NULL, 'Compte');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('1757', 'frmListeCMMCTR01', 'CTR_ALL', 'CLERIB', 2, 
    'Bank account code', 'Bank account code', 0, 1, 0, 
    'CTR_ALL.CLERIB', 0, NULL, 'Bank account code');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('1758', 'frmListeCMMCTR01', 'CTR_ALL', 'T1', 6, 
    'Adaptable field typologie 1', 'Adaptable field typologie 1', 0, 0, 0, 
    'CTR_ALL.T1', 0, NULL, 'Adaptable field typologie 1');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('1759', 'frmListeCMMCTR01', 'CTR_ALL', 'IDTT1', 6, 
    'Associated typology ID 1', 'Associated typology ID 1', 0, 0, 0, 
    'CTR_ALL.IDTT1', 0, NULL, 'Associated typology ID 1');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('1760', 'frmListeCMMCTR01', 'CTR_ALL', 'T2', 6, 
    'Adaptable field typologie 2', 'Adaptable field typologie 2', 0, 0, 0, 
    'CTR_ALL.T2', 0, NULL, 'Adaptable field typologie 2');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('1761', 'frmListeCMMCTR01', 'CTR_ALL', 'C1', 22, 
    'Adaptable field check-box 1', 'Adaptable field check-box 1', 0, 0, 0, 
    'CTR_ALL.C1', 0, NULL, 'Adaptable field check-box 1');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('1762', 'frmListeCMMCTR01', 'CTR_ALL', 'C2', 22, 
    'Adaptable field check-box 2', 'Adaptable field check-box 2', 0, 0, 0, 
    'CTR_ALL.C2', 0, NULL, 'Adaptable field check-box 2');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('1763', 'frmListeCMMCTR01', 'CTR_ALL', 'C3', 22, 
    'Adaptable field check-box 3', 'Adaptable field check-box 3', 0, 0, 0, 
    'CTR_ALL.C3', 0, NULL, 'Adaptable field check-box 3');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('1764', 'frmListeCMMCTR01', 'CTR_ALL', 'C4', 22, 
    'Adaptable field check-box 4', 'Adaptable field check-box 4', 0, 0, 0, 
    'CTR_ALL.C4', 0, NULL, 'Adaptable field check-box 4');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('1765', 'frmListeCMMCTR01', 'CTR_ALL', 'C5', 22, 
    'Adaptable field check-box 5', 'Adaptable field check-box 5', 0, 0, 0, 
    'CTR_ALL.C5', 0, NULL, 'Adaptable field check-box 5');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('1766', 'frmListeCMMCTR01', 'CTR_ALL', 'D1', 7, 
    'Adaptable field date 1', 'Adaptable field date 1', 0, 0, 0, 
    'TO_CHAR(CTR_ALL.D1,''DD/MM/YYYY'')', 0, NULL, 'Adaptable field date 1');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('1767', 'frmListeCMMCTR01', 'CTR_ALL', 'D2', 7, 
    'Adaptable field date 2', 'Adaptable field date 2', 0, 0, 0, 
    'TO_CHAR(CTR_ALL.D2,''DD/MM/YYYY'')', 0, NULL, 'Adaptable field date 2');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('1768', 'frmListeCMMCTR01', 'CTR_ALL', 'D3', 7, 
    'Adaptable field date 3', 'Adaptable field date 3', 0, 0, 0, 
    'TO_CHAR(CTR_ALL.D3,''DD/MM/YYYY'')', 0, NULL, 'Adaptable field date 3');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('1769', 'frmListeCMMCTR01', 'CTR_ALL', 'D4', 7, 
    'Adaptable field date 4', 'Adaptable field date 4', 0, 0, 0, 
    'TO_CHAR(CTR_ALL.D4,''DD/MM/YYYY'')', 0, NULL, 'Adaptable field date 4');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('1770', 'frmListeCMMCTR01', 'CTR_ALL', 'D5', 7, 
    'Adaptable field date 5', 'Adaptable field date 5', 0, 0, 0, 
    'TO_CHAR(CTR_ALL.D5,''DD/MM/YYYY'')', 0, NULL, 'Adaptable field date 5');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('1771', 'frmListeCMMCTR01', 'CTR_ALL', 'ANCRFR', 20, 
    'Ancienne reference', 'Ancienne reference', 0, 1, 0, 
    'CTR_ALL.ANCRFR', 0, NULL, 'Ancienne reference');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('1772', 'frmListeCMMCTR01', 'CTR_ALL', 'DATMAJ', 7, 
    'Date de mise à jour', 'Date de mise à jour', 0, 1, 0, 
    'TO_CHAR(CTR_ALL.DATMAJ,''DD/MM/YYYY'')', 0, NULL, 'Date de mise à jour');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('1773', 'frmListeCMMCTR01', 'CTR_ALL', 'MTRAGT', 6, 
    'ID of the employee who carries out updating', 'ID of the employee who carries out updating', 0, 1, 0, 
    'CTR_ALL.MTRAGT', 0, NULL, 'ID of the employee who carries out updating');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('1774', 'frmListeTCHPCG01', 'PNTCPG', 'FINDRNPRDRLV', 7, 
    'Fin de la dernière période théorique de relève', 'Fin de la dernière période théorique de relève', 0, 1, 0, 
    'TO_CHAR(PNTCPG.FINDRNPRDRLV,''DD/MM/YYYY'')', 0, NULL, 'Fin de la dernière période théorique de relève');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('1775', 'frmListeTCHPCG01', 'PNTCPG', 'IDTCLTPRP', 6, 
    'Code client propriétaire', 'Code client propriétaire', 0, 1, 0, 
    'PNTCPG.IDTCLTPRP', 0, NULL, 'Code client propriétaire');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('1776', 'frmListeTCHPCG01', 'PNTCPG', 'IDTLOTRCS', 6, 
    'Lot recensement', 'Lot recensement', 0, 1, 0, 
    'PNTCPG.IDTLOTRCS', 0, NULL, 'Lot recensement');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('1777', 'frmListeTCHPCG01', 'PNTCPG', 'NUMENQ', 22, 
    'numéro recensement', 'numéro recensement', 0, 1, 0, 
    'PNTCPG.NUMENQ', 0, NULL, 'numéro recensement');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('1778', 'frmListeCMMCTR01', 'PNTCPG', 'ABRLBR', 2000, 
    'Adresse du point de comptage', 'Adresse du point de comptage', 0, 1, 1, 
    'REPLACE(REPLACE(PNTCPG.ADRLBR,CHR(10),'' ''),CHR(13),'' '')', 5, NULL, 'Adresse du point de comptage');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('1779', 'frmListeCMMCTR01', 'SRV', 'CODSRV', 6, 
    'Service', 'Code', 0, 1, 1, 
    'SRV.CODSRV', 6, NULL, 'Code');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('1780', 'frmListeCMMCTR01', 'AVTCTR', 'IDTTRF', 6, 
    'Tarif', 'Code tarif', 0, 1, 1, 
    'AVTCTR.IDTTRF', 8, NULL, 'Code tarif');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('1781', 'frmListeCMMCTR01', 'AVTCTR', 'IDTFACTYP', 6, 
    'Facture type', 'Facture type', 0, 1, 1, 
    'AVTCTR.IDTFACTYP', 9, NULL, 'Facture type');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('1782', 'frmListeCMMCTR01', 'CTR_ALL', 'DATSCR', 15, 
    'Souscrit le', 'Date de souscription', 0, 1, 1, 
    'TO_CHAR(CTR_ALL.DATSCR,''DD/MM/YYYY'')', 10, NULL, 'Date de souscription');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('1783', 'frmListeCMMCTR01', 'AVTCTR', 'IDTACV', 6, 
    'Usage', 'Usage', 0, 1, 1, 
    'AVTCTR.IDTACV', 11, NULL, 'Usage');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('1784', 'frmListeCMMCTR01', 'AVTCTR', 'EXNTVA', 6, 
    'Exonéré de TVA', 'Exonéré de TVA', 0, 1, 1, 
    'DECODE(AVTCTR.ExnTVA,0,''Non'',''Oui'')', 12, NULL, 'Exonéré de TVA');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('1785', 'frmListeCMMCTR01', 'CLT', 'IDTCNTOPR', 6, 
    'Centre operationnel', 'Centre operationnel', 0, 1, 1, 
    'CLT.IDTCNTOPR', 0, NULL, 'Centre operationnel');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('1786', 'frmListeCMMCTR01', 'CLT', 'IDTCODSNS', 6, 
    'Sensibilité client', 'Sensibilite client', 0, 1, 1, 
    'CLT.IDTCODSNS', 0, NULL, 'Sensibilite client');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('1787', 'frmListeCMMCTR01', 'CLT', 'IDTCTR', 10, 
    'Contract ID', 'Contract ID', 0, 1, 0, 
    'CLT.IDTCTR', 0, NULL, 'Contract ID');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('1788', 'frmListeCMMCTR01', 'CLT', 'NUMAVN', 22, 
    'Amendment number', 'Amendment number', 0, 1, 0, 
    'CLT.NUMAVN', 0, NULL, 'Amendment number');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('1789', 'frmListeCMMCTR01', 'CLT', 'AVT_IDTCTR', 10, 
    'NOT USED !!!', 'NOT USED !!!', 0, 0, 0, 
    'CLT.AVT_IDTCTR', 0, NULL, 'NOT USED !!!');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('1790', 'frmListeCMMCTR01', 'CLT', 'AVT_NUMAVN', 22, 
    'NOT USED!!!', 'NOT USED!!!', 0, 0, 0, 
    'CLT.AVT_NUMAVN', 0, NULL, 'NOT USED!!!');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('1791', 'frmListeCMMCTR01', 'CLT', 'MTRAGT', 6, 
    'Agent', 'Agent', 0, 1, 0, 
    'CLT.MTRAGT', 0, NULL, 'Agent');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('1792', 'frmListeCMMCTR01', 'CLT', 'DATMAJ', 7, 
    'Date de mise a jour', 'Date de mise a jour', 0, 1, 0, 
    'TO_CHAR(CLT.DATMAJ,''DD/MM/YYYY'')', 0, NULL, 'Date de mise a jour');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('1793', 'frmListeCMMCTR01', 'CLT', 'NOM', 40, 
    'Nom', 'Nom', 0, 1, 0, 
    'CLT.NOM', 0, NULL, 'Nom');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('1794', 'frmListeCMMCTR01', 'CLT', 'PRN', 40, 
    'Prenom', 'Prenom', 0, 1, 0, 
    'CLT.PRN', 0, NULL, 'Prenom');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('1795', 'frmListeCMMCTR01', 'CLT', 'TLB', 20, 
    'Telephone du bureau', 'Telephone du bureau', 0, 1, 0, 
    'CLT.TLB', 0, NULL, 'Telephone du bureau');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('1796', 'frmListeCMMCTR01', 'CLT', 'FLB', 20, 
    'Fax du bureau', 'Fax du bureau', 0, 1, 0, 
    'CLT.FLB', 0, NULL, 'Fax du bureau');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('1797', 'frmListeCMMCTR01', 'CLT', 'TLD', 20, 
    'Telephone du domicile', 'Telephone du domicile', 0, 1, 0, 
    'CLT.TLD', 0, NULL, 'Telephone du domicile');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('1798', 'frmListeCMMCTR01', 'CLT', 'FLD', 20, 
    'Fax du domicile', 'Fax du domicile', 0, 1, 0, 
    'CLT.FLD', 0, NULL, 'Fax du domicile');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('1799', 'frmListeCMMCTR01', 'CLT', 'ANCRFR', 20, 
    'Ancienne reference', 'Ancienne reference', 0, 1, 0, 
    'CLT.ANCRFR', 0, NULL, 'Ancienne reference');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('1800', 'frmListeCMMCTR01', 'CLT', 'QLTPYR', 2, 
    'Qualite payeur', 'Qualite payeur', 0, 1, 0, 
    'CLT.QLTPYR', 0, NULL, 'Qualite payeur');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('1801', 'frmListeCMMCTR01', 'CLT', 'FRD', 22, 
    'Fraudeur', 'Fraudeur', 0, 1, 0, 
    'CLT.FRD', 0, NULL, 'Fraudeur');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('1802', 'frmListeCMMCTR01', 'CLT', 'ADRLBR', 2000, 
    'Adresse', 'Adresse', 0, 1, 1, 
    'SUBSTR(REPLACE(REPLACE(CLT.ADRLBR,CHR(10),'' ''),CHR(13),'' ''),1,254)', 0, NULL, 'Adresse');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('1803', 'frmListeCMMCTR01', 'CLT', 'PMTLTG', 22, 
    'Nombre de paiements litigieux', 'Nombre de paiements litigieux', 0, 1, 0, 
    'CLT.PMTLTG', 0, NULL, 'Nombre de paiements litigieux');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('1804', 'frmListeCMMCTR01', 'CLT', 'RGR', 22, 
    'Client regroupe', 'Client regroupe', 0, 1, 0, 
    'CLT.RGR', 0, NULL, 'Client regroupe');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('1805', 'frmListeCMMCTR01', 'CLT', 'INTBNC', 22, 
    'Interdit bancaire', 'Ineligible', 0, 1, 0, 
    'CLT.INTBNC', 0, NULL, 'Ineligible');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('1806', 'frmListeCMMCTR01', 'CLT', 'SQCCPTCLT', 22, 
    'Customer account serial number', 'Customer account serial number', 0, 1, 0, 
    'CLT.SQCCPTCLT', 0, NULL, 'Customer account serial number');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('1807', 'frmListeCMMCTR01', 'CLT', 'SQCCNT', 22, 
    'Contact serial number', 'Contact serial number', 0, 1, 0, 
    'CLT.SQCCNT', 0, NULL, 'Contact serial number');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('1808', 'frmListeCMMCTR01', 'CLT', 'IDTPRMCTR', 10, 
    'Code du premier contrat', 'Code du premier contrat', 0, 1, 0, 
    'CLT.IDTPRMCTR', 0, NULL, 'Code du premier contrat');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('1809', 'frmListeCMMCTR01', 'CLT', 'RTRIPY', 22, 
    'Nombre de retours d''impaye', 'Nombre de retours d''impaye', 0, 1, 0, 
    'CLT.RTRIPY', 0, NULL, 'Nombre de retours d''impaye');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('1810', 'frmListeCMMCTR01', 'CLT', 'CHPLIB1', 30, 
    '1st free field', '1st free field', 0, 0, 0, 
    'CLT.CHPLIB1', 0, NULL, '1st free field');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('1811', 'frmListeCMMCTR01', 'CLT', 'CHPLIB2', 30, 
    '2nd free field', '2nd free field', 0, 0, 0, 
    'CLT.CHPLIB2', 0, NULL, '2nd free field');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('1812', 'frmListeCMMCTR01', 'CLT', 'CHPLIB3', 30, 
    '3rd free field', '3rd free field', 0, 0, 0, 
    'CLT.CHPLIB3', 0, NULL, '3rd free field');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('1813', 'frmListeCMMCTR01', 'CLT', 'CHPLIB4', 30, 
    '4th free field', '4th free field', 0, 0, 0, 
    'CLT.CHPLIB4', 0, NULL, '4th free field');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('1814', 'frmListeCMMCTR01', 'CLT', 'IDTSQCGNR', 22, 
    'General identifier', 'General identifier', 0, 0, 0, 
    'CLT.IDTSQCGNR', 0, NULL, 'General identifier');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('1815', 'frmListeCMMCTR01', 'CLT', 'T1', 6, 
    'Adaptable field typology 1', 'Adaptable field typology 1', 0, 0, 0, 
    'CLT.T1', 0, NULL, 'Adaptable field typology 1');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('1816', 'frmListeCMMCTR01', 'CLT', 'IDTT1', 6, 
    'Associated typology ID 1', 'Associated typology ID 1', 0, 0, 0, 
    'CLT.IDTT1', 0, NULL, 'Associated typology ID 1');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('1817', 'frmListeCMMCTR01', 'CLT', 'T2', 6, 
    'Adaptable field typology 2', 'Adaptable field typology 2', 0, 0, 0, 
    'CLT.T2', 0, NULL, 'Adaptable field typology 2');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('1818', 'frmListeCMMCTR01', 'CLT', 'IDTT2', 6, 
    'Associated typology ID 2', 'Associated typology ID 2', 0, 0, 0, 
    'CLT.IDTT2', 0, NULL, 'Associated typology ID 2');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('1819', 'frmListeCMMCTR01', 'CLT', 'T3', 6, 
    'Adaptable field typology 3', 'Adaptable field typology 3', 0, 0, 0, 
    'CLT.T3', 0, NULL, 'Adaptable field typology 3');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('1820', 'frmListeCMMCTR01', 'CLT', 'IDTT3', 6, 
    'Associated typology ID 3', 'Associated typology ID 3', 0, 0, 0, 
    'CLT.IDTT3', 0, NULL, 'Associated typology ID 3');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('1821', 'frmListeCMMCTR01', 'CLT', 'T4', 6, 
    'Adaptable field typology 4', 'Adaptable field typology 4', 0, 0, 0, 
    'CLT.T4', 0, NULL, 'Adaptable field typology 4');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('1822', 'frmListeCMMCTR01', 'CLT', 'IDTT4', 6, 
    'Associated typology ID 4', 'Associated typology ID 4', 0, 0, 0, 
    'CLT.IDTT4', 0, NULL, 'Associated typology ID 4');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('1823', 'frmListeTCHCPR01', 'CPRPNTCPG', 'IDTUSGCPR', 22, 
    'Meter use ID', 'Meter use ID', 0, 1, 0, 
    'CPRPNTCPG.IDTUSGCPR', 0, NULL, 'Meter use ID');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('1824', 'frmListeTCHCPR01', 'CPRPNTRTT', 'IDTCPR', 22, 
    'Internal meter ID', 'Internal meter ID', 0, 1, 0, 
    'CPRPNTRTT.IDTCPR', 0, NULL, 'Internal meter ID');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('1825', 'frmListeTCHCPR01', 'CPRPNTRTT', 'IDTPNTRTT', 22, 
    'Internal metering point ID', 'Internal metering point ID', 0, 1, 0, 
    'CPRPNTRTT.IDTPNTRTT', 0, NULL, 'Internal metering point ID');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('1826', 'frmListeTCHCPR01', 'CPRPNTRTT', 'DATENT', 7, 
    'Date d''entree', 'Date d''entree', 0, 1, 1, 
    'TO_CHAR(CPRPNTRTT.DATENT,''DD/MM/YYYY'')', 10, NULL, 'Date d''entree');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('1827', 'frmListeTCHCPR01', 'CPRPNTRTT', 'DATSRT', 7, 
    'Date de sortie', 'Date de sortie', 0, 1, 0, 
    'TO_CHAR(CPRPNTRTT.DATSRT,''DD/MM/YYYY'')', 0, NULL, 'Date de sortie');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('1828', 'frmListeTCHCPR01', 'CPRPNTRTT', 'IDTMTFMVT', 22, 
    'Meter movement reason', 'Meter movement reason', 0, 1, 0, 
    'CPRPNTRTT.IDTMTFMVT', 0, NULL, 'Meter movement reason');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('1829', 'frmListeCMMCTR01', 'PNTLVR', 'IDTT4', 6, 
    'Associated typology ID 4', 'Associated typology ID 4', 0, 0, 0, 
    'PNTLVR.IDTT4', 0, NULL, 'Associated typology ID 4');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('1830', 'frmListeCMMCTR01', 'PNTLVR', 'T5', 6, 
    'Adaptable field typologie 5', 'Adaptable field typologie 5', 0, 0, 0, 
    'PNTLVR.T5', 0, NULL, 'Adaptable field typologie 5');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('1831', 'frmListeCMMCTR01', 'PNTLVR', 'IDTT5', 6, 
    'Associated typology ID 5', 'Associated typology ID 5', 0, 0, 0, 
    'PNTLVR.IDTT5', 0, NULL, 'Associated typology ID 5');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('1832', 'frmListeCMMCTR01', 'PNTLVR', 'A1', 40, 
    'Adaptable field string 1', 'Adaptable field string 1', 0, 0, 0, 
    'PNTLVR.A1', 0, NULL, 'Adaptable field string 1');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('1833', 'frmListeCMMCTR01', 'PNTLVR', 'A2', 40, 
    'Adaptable field string  2', 'Adaptable field string  2', 0, 0, 0, 
    'PNTLVR.A2', 0, NULL, 'Adaptable field string  2');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('1834', 'frmListeCMMCTR01', 'PNTLVR', 'A3', 40, 
    'Adaptable field string 3', 'Adaptable field string 3', 0, 0, 0, 
    'PNTLVR.A3', 0, NULL, 'Adaptable field string 3');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('1835', 'frmListeCMMCTR01', 'PNTLVR', 'A4', 40, 
    'Adaptable field string 4', 'Adaptable field string 4', 0, 0, 0, 
    'PNTLVR.A4', 0, NULL, 'Adaptable field string 4');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('1836', 'frmListeCMMCTR01', 'PNTLVR', 'A5', 40, 
    'Adaptable field string 5', 'Adaptable field string 5', 0, 0, 0, 
    'PNTLVR.A5', 0, NULL, 'Adaptable field string 5');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('1837', 'frmListeCMMCTR01', 'PNTLVR', 'N1', 22, 
    'Adaptable field number1', 'Adaptable field number1', 0, 0, 0, 
    'PNTLVR.N1', 0, NULL, 'Adaptable field number1');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('1838', 'frmListeCMMCTR01', 'PNTLVR', 'N2', 22, 
    'Adaptable field number12', 'Adaptable field number12', 0, 0, 0, 
    'PNTLVR.N2', 0, NULL, 'Adaptable field number12');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('1839', 'frmListeCMMCTR01', 'PNTLVR', 'N3', 22, 
    'Adaptable field number13', 'Adaptable field number13', 0, 0, 0, 
    'PNTLVR.N3', 0, NULL, 'Adaptable field number13');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('1840', 'frmListeCMMCTR01', 'PNTLVR', 'N4', 22, 
    'Adaptable field number 4', 'Adaptable field number 4', 0, 0, 0, 
    'PNTLVR.N4', 0, NULL, 'Adaptable field number 4');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('1841', 'frmListeTCHPCG01', 'PNTCPG', 'ADRSTR9', 50, 
    'Description of structured address 9', 'Description of structured address 9', 0, 0, 0, 
    'PNTCPG.ADRSTR9', 0, NULL, 'Description of structured address 9');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('1842', 'frmListeTCHPCG01', 'PNTCPG', 'ADRSTR10', 50, 
    'Description of structured address 10', 'Description of structured address 10', 0, 0, 0, 
    'PNTCPG.ADRSTR10', 0, NULL, 'Description of structured address 10');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('1843', 'frmListeTCHPCG01', 'PNTCPG', 'IDTSIG', 22, 
    'Code SIG', 'Code SIG', 0, 1, 0, 
    'PNTCPG.IDTSIG', 0, NULL, 'Code SIG');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('1976', 'frmListeCMMCTR01', 'AVTCTR', 'CHP07', 22, 
    'Adaptable field 07', 'Adaptable field 07', 0, 0, 0, 
    'AVTCTR.CHP07', 0, NULL, 'Adaptable field 07');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('1977', 'frmListeCMMCTR01', 'AVTCTR', 'CHP08', 22, 
    'Adaptable field 08', 'Adaptable field 08', 0, 0, 0, 
    'AVTCTR.CHP08', 0, NULL, 'Adaptable field 08');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('1978', 'frmListeCMMCTR01', 'AVTCTR', 'CHP09', 22, 
    'Adaptable field 09', 'Adaptable field 09', 0, 0, 0, 
    'AVTCTR.CHP09', 0, NULL, 'Adaptable field 09');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('1979', 'frmListeCMMCTR01', 'AVTCTR', 'CHP10', 22, 
    'Adaptable field 10', 'Adaptable field 10', 0, 0, 0, 
    'AVTCTR.CHP10', 0, NULL, 'Adaptable field 10');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('1980', 'frmListeCMMCTR01', 'AVTCTR', 'CHP11', 22, 
    'Adaptable field 11', 'Adaptable field 11', 0, 0, 0, 
    'AVTCTR.CHP11', 0, NULL, 'Adaptable field 11');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('1981', 'frmListeCMMCTR01', 'AVTCTR', 'CHP12', 22, 
    'Adaptable field 12', 'Adaptable field 12', 0, 0, 0, 
    'AVTCTR.CHP12', 0, NULL, 'Adaptable field 12');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('1982', 'frmListeCMMCTR01', 'AVTCTR', 'CHP13', 22, 
    'Adaptable field 13', 'Adaptable field 13', 0, 0, 0, 
    'AVTCTR.CHP13', 0, NULL, 'Adaptable field 13');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('1983', 'frmListeCMMCTR01', 'AVTCTR', 'CHP14', 22, 
    'Adaptable field 14', 'Adaptable field 14', 0, 0, 0, 
    'AVTCTR.CHP14', 0, NULL, 'Adaptable field 14');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('1984', 'frmListeCMMCTR01', 'AVTCTR', 'CHP15', 22, 
    'Adaptable field 15', 'Adaptable field 15', 0, 0, 0, 
    'AVTCTR.CHP15', 0, NULL, 'Adaptable field 15');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('1985', 'frmListeCMMCTR01', 'AVTCTR', 'CFFMLP', 22, 
    'Multiplication coeff.', 'Multiplication coeff.', 0, 1, 0, 
    'AVTCTR.CFFMLP', 0, NULL, 'Multiplication coeff.');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('1986', 'frmListeCMMCLT01', 'CLT', 'SQCCPTCLT', 22, 
    'Customer account serial number', 'Customer account serial number', 0, 1, 0, 
    'CLT.SQCCPTCLT', 0, NULL, 'Customer account serial number');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('1987', 'frmListeCMMCLT01', 'CLT', 'SQCCNT', 22, 
    'Contact serial number', 'Contact serial number', 0, 1, 0, 
    'CLT.SQCCNT', 0, NULL, 'Contact serial number');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('1988', 'frmListeCMMCLT01', 'CLT', 'X7SNDXNOM', 40, 
    'Fonction de recherche pour Nom', 'Fonction de recherche pour Nom', 0, 0, 0, 
    'CLT.X7SNDXNOM', 0, NULL, 'Fonction de recherche pour Nom');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('1989', 'frmListeCMMCTR01', 'CTR_ALL', 'DATCRT', 7, 
    'Creation date', 'Creation date', 0, 1, 0, 
    'TO_CHAR(CTR_ALL.DATCRT,''DD/MM/YYYY'')', 0, NULL, 'Creation date');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('1990', 'frmListeCMMCTR01', 'CTR_ALL', 'ETTCTRFCT', 22, 
    'Billing status of contract (1<normal>, 2<computation mode>, 3<validation mode>, 4<periodical billing on going>)', 'Billing status of contract (1<normal>, 2<computation mode>, 3<validation mode>, 4<periodical billing on going>)', 0, 1, 0, 
    'CTR_ALL.ETTCTRFCT', 0, NULL, 'Billing status of contract (1<normal>, 2<computation mode>, 3<validation mode>, 4<periodical billing on going>)');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('1991', 'frmListeCMMCTR01', 'CTR_ALL', 'IDTGCH', 6, 
    'Counter ID', 'Counter ID', 0, 1, 0, 
    'CTR_ALL.IDTGCH', 0, NULL, 'Counter ID');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('1992', 'frmListeCMMCTR01', 'CTR_ALL', 'PRPCPTBNC', 40, 
    'Bank account owner', 'Bank account owner', 0, 1, 0, 
    'CTR_ALL.PRPCPTBNC', 0, NULL, 'Bank account owner');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('1993', 'frmListeTCHPCG01', 'PNTLVR', 'IDTT4', 6, 
    'Associated typology ID 4', 'Associated typology ID 4', 0, 0, 0, 
    'PNTLVR.IDTT4', 0, NULL, 'Associated typology ID 4');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('1994', 'frmListeTCHPCG01', 'PNTLVR', 'T5', 6, 
    'Adaptable field typologie 5', 'Adaptable field typologie 5', 0, 0, 0, 
    'PNTLVR.T5', 0, NULL, 'Adaptable field typologie 5');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('1995', 'frmListeTCHPCG01', 'PNTLVR', 'IDTT5', 6, 
    'Associated typology ID 5', 'Associated typology ID 5', 0, 0, 0, 
    'PNTLVR.IDTT5', 0, NULL, 'Associated typology ID 5');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('1996', 'frmListeTCHPCG01', 'PNTLVR', 'A1', 40, 
    'Adaptable field string 1', 'Adaptable field string 1', 0, 0, 0, 
    'PNTLVR.A1', 0, NULL, 'Adaptable field string 1');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('1997', 'frmListeTCHPCG01', 'PNTLVR', 'A2', 40, 
    'Adaptable field string  2', 'Adaptable field string  2', 0, 0, 0, 
    'PNTLVR.A2', 0, NULL, 'Adaptable field string  2');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('1998', 'frmListeTCHPCG01', 'PNTLVR', 'A3', 40, 
    'Adaptable field string 3', 'Adaptable field string 3', 0, 0, 0, 
    'PNTLVR.A3', 0, NULL, 'Adaptable field string 3');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('1999', 'frmListeTCHPCG01', 'PNTLVR', 'A4', 40, 
    'Adaptable field string 4', 'Adaptable field string 4', 0, 0, 0, 
    'PNTLVR.A4', 0, NULL, 'Adaptable field string 4');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('2000', 'frmListeTCHPCG01', 'PNTLVR', 'A5', 40, 
    'Adaptable field string 5', 'Adaptable field string 5', 0, 0, 0, 
    'PNTLVR.A5', 0, NULL, 'Adaptable field string 5');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('2001', 'frmListeTCHPCG01', 'PNTLVR', 'N1', 22, 
    'Adaptable field number1', 'Adaptable field number1', 0, 0, 0, 
    'PNTLVR.N1', 0, NULL, 'Adaptable field number1');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('2002', 'frmListeTCHPCG01', 'PNTLVR', 'N2', 22, 
    'Adaptable field number12', 'Adaptable field number12', 0, 0, 0, 
    'PNTLVR.N2', 0, NULL, 'Adaptable field number12');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('2003', 'frmListeTCHPCG01', 'PNTLVR', 'N3', 22, 
    'Adaptable field number13', 'Adaptable field number13', 0, 0, 0, 
    'PNTLVR.N3', 0, NULL, 'Adaptable field number13');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('2004', 'frmListeTCHPCG01', 'PNTLVR', 'N4', 22, 
    'Adaptable field number 4', 'Adaptable field number 4', 0, 0, 0, 
    'PNTLVR.N4', 0, NULL, 'Adaptable field number 4');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('2005', 'frmListeTCHPCG01', 'PNTLVR', 'N5', 22, 
    'Adaptable field number 5', 'Adaptable field number 5', 0, 0, 0, 
    'PNTLVR.N5', 0, NULL, 'Adaptable field number 5');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('2006', 'frmListeTCHPCG01', 'PNTLVR', 'C1', 22, 
    'Adaptable field check-box 1', 'Adaptable field check-box 1', 0, 0, 0, 
    'PNTLVR.C1', 0, NULL, 'Adaptable field check-box 1');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('2007', 'frmListeTCHPCG01', 'PNTLVR', 'C2', 22, 
    'Adaptable field check-box 2', 'Adaptable field check-box 2', 0, 0, 0, 
    'PNTLVR.C2', 0, NULL, 'Adaptable field check-box 2');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('2008', 'frmListeTCHPCG01', 'PNTLVR', 'C3', 22, 
    'Adaptable field check-box 3', 'Adaptable field check-box 3', 0, 0, 0, 
    'PNTLVR.C3', 0, NULL, 'Adaptable field check-box 3');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('2009', 'frmListeTCHPCG01', 'PNTLVR', 'C4', 22, 
    'Adaptable field check-box 4', 'Adaptable field check-box 4', 0, 0, 0, 
    'PNTLVR.C4', 0, NULL, 'Adaptable field check-box 4');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('2010', 'frmListeTCHPCG01', 'PNTLVR', 'C5', 22, 
    'Adaptable field check-box 5', 'Adaptable field check-box 5', 0, 0, 0, 
    'PNTLVR.C5', 0, NULL, 'Adaptable field check-box 5');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('2011', 'frmListeTCHPCG01', 'PNTLVR', 'D1', 7, 
    'Adaptable field date 1', 'Adaptable field date 1', 0, 0, 0, 
    'TO_CHAR(PNTLVR.D1,''DD/MM/YYYY'')', 0, NULL, 'Adaptable field date 1');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('2012', 'frmListeTCHPCG01', 'PNTLVR', 'D2', 7, 
    'Adaptable field date 2', 'Adaptable field date 2', 0, 0, 0, 
    'TO_CHAR(PNTLVR.D2,''DD/MM/YYYY'')', 0, NULL, 'Adaptable field date 2');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('2013', 'frmListeTCHPCG01', 'PNTLVR', 'D3', 7, 
    'Adaptable field date 3', 'Adaptable field date 3', 0, 0, 0, 
    'TO_CHAR(PNTLVR.D3,''DD/MM/YYYY'')', 0, NULL, 'Adaptable field date 3');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('2014', 'frmListeTCHPCG01', 'PNTLVR', 'D4', 7, 
    'Adaptable field date 4', 'Adaptable field date 4', 0, 0, 0, 
    'TO_CHAR(PNTLVR.D4,''DD/MM/YYYY'')', 0, NULL, 'Adaptable field date 4');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('2015', 'frmListeTCHPCG01', 'PNTLVR', 'D5', 7, 
    'Adaptable field date 5', 'Adaptable field date 5', 0, 0, 0, 
    'TO_CHAR(PNTLVR.D5,''DD/MM/YYYY'')', 0, NULL, 'Adaptable field date 5');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('2016', 'frmListeTCHPCG01', 'PNTLVR', 'ADRSTR1', 50, 
    'Description of structured address 1', 'Description of structured address 1', 0, 0, 0, 
    'PNTLVR.ADRSTR1', 0, NULL, 'Description of structured address 1');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('2017', 'frmListeTCHPCG01', 'PNTLVR', 'ADRSTR2', 50, 
    'Description of structured address 2', 'Description of structured address 2', 0, 0, 0, 
    'PNTLVR.ADRSTR2', 0, NULL, 'Description of structured address 2');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('2018', 'frmListeTCHPCG01', 'PNTLVR', 'ADRSTR3', 50, 
    'Description of structured address 3', 'Description of structured address 3', 0, 0, 0, 
    'PNTLVR.ADRSTR3', 0, NULL, 'Description of structured address 3');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('2019', 'frmListeTCHPCG01', 'PNTLVR', 'ADRSTR4', 50, 
    'Description of structured address 4', 'Description of structured address 4', 0, 0, 0, 
    'PNTLVR.ADRSTR4', 0, NULL, 'Description of structured address 4');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('2020', 'frmListeTCHPCG01', 'PNTLVR', 'ADRSTR5', 50, 
    'Description of structured address 5', 'Description of structured address 5', 0, 0, 0, 
    'PNTLVR.ADRSTR5', 0, NULL, 'Description of structured address 5');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('2021', 'frmListeTCHPCG01', 'PNTLVR', 'ADRSTR6', 50, 
    'Description of structured address 6', 'Description of structured address 6', 0, 0, 0, 
    'PNTLVR.ADRSTR6', 0, NULL, 'Description of structured address 6');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('2022', 'frmListeTCHPCG01', 'PNTLVR', 'ADRSTR7', 50, 
    'Description of structured address 7', 'Description of structured address 7', 0, 0, 0, 
    'PNTLVR.ADRSTR7', 0, NULL, 'Description of structured address 7');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('2023', 'frmListeTCHPCG01', 'PNTLVR', 'ADRSTR8', 50, 
    'Description of structured address 8', 'Description of structured address 8', 0, 0, 0, 
    'PNTLVR.ADRSTR8', 0, NULL, 'Description of structured address 8');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('2024', 'frmListeTCHPCG01', 'PNTLVR', 'ADRSTR9', 50, 
    'Description of structured address 9', 'Description of structured address 9', 0, 0, 0, 
    'PNTLVR.ADRSTR9', 0, NULL, 'Description of structured address 9');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('2025', 'frmListeTCHPCG01', 'PNTLVR', 'ADRSTR10', 50, 
    'Description of structured address 10', 'Description of structured address 10', 0, 0, 0, 
    'PNTLVR.ADRSTR10', 0, NULL, 'Description of structured address 10');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('2026', 'frmListeTCHPCG01', 'PNTLVR', 'IDTPNTLVR', 22, 
    'Internal Delivery point ID', 'Identifiant interne', 0, 0, 0, 
    'PNTLVR.IDTPNTLVR', 0, NULL, 'Identifiant interne');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('2027', 'frmListeTCHPCG01', 'PNTLVR', 'IDTTYPHBT', 6, 
    'Type d''habitation', 'Type d''habitation', 0, 1, 0, 
    'PNTLVR.IDTTYPHBT', 0, NULL, 'Type d''habitation');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('2028', 'frmListeTCHPCG01', 'PNTLVR', 'IDTCNTOPR', 6, 
    'Centre opérationel', 'Centre opérationel', 0, 1, 0, 
    'PNTLVR.IDTCNTOPR', 0, NULL, 'Centre opérationel');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('2029', 'frmListeTCHPCG01', 'PNTLVR', 'IDTDCPGGR', 29, 
    'Découpage géographique', 'Adresse geographique', 0, 1, 0, 
    'PNTLVR.IDTDCPGGR', 0, NULL, 'Adresse geographique');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('2030', 'frmListeTCHPCG01', 'PNTLVR', 'MTRAGT', 6, 
    'Agent', 'Agent', 0, 1, 0, 
    'PNTLVR.MTRAGT', 0, NULL, 'Agent');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('2031', 'frmListeTCHPCG01', 'PNTLVR', 'DATMAJ', 7, 
    'Date de mise à jour', 'Date de mise a jour', 0, 1, 0, 
    'TO_CHAR(PNTLVR.DATMAJ,''DD/MM/YYYY'')', 0, NULL, 'Date de mise a jour');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('2032', 'frmListeTCHPCG01', 'PNTLVR', 'OCC', 22, 
    'Occupé', 'Occupation', 0, 1, 0, 
    'PNTLVR.OCC', 0, NULL, 'Occupation');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('2033', 'frmListeTCHPCG01', 'PNTLVR', 'ANCRFR', 20, 
    'Former reference', 'Ancienne reference', 0, 1, 0, 
    'PNTLVR.ANCRFR', 0, NULL, 'Ancienne reference');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('2034', 'frmListeTCHPCG01', 'PNTLVR', 'ADRLBR', 254, 
    'Adresse', 'Adresse', 0, 1, 0, 
    'SUBSTR(REPLACE(REPLACE(PNTLVR.ADRLBR,CHR(10),'' ''),CHR(13),'' ''),1,254)', 0, NULL, 'Adresse');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('2035', 'frmListeTCHPCG01', 'PNTLVR', 'SQCPNTCPG', 22, 
    'Metering point last used serial number', 'Metering point last used serial number', 0, 1, 0, 
    'PNTLVR.SQCPNTCPG', 0, NULL, 'Metering point last used serial number');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('2036', 'frmListeTCHPCG01', 'PNTLVR', 'NUMORD', 22, 
    'Number in the standard round', 'Numero d''ordre', 0, 1, 0, 
    'PNTLVR.NUMORD', 0, NULL, 'Numero d''ordre');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('2229', 'frmListeCLTOPR01', 'SIT', 'SIT', 12, 
    'Situation', 'Situation', 0, 1, 1, 
    'SIT.SIT', 4, NULL, 'Situation');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('2230', 'frmListeCLTOPR01', 'TYPOPR', 'TYPOPR', 12, 
    'Type', 'Type', 0, 1, 1, 
    'TYPOPR.TYPOPR', 5, NULL, 'Type');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('2231', 'frmListeCLTOPR01', 'OPR', 'DATEXG', 12, 
    'Exigibilité', 'Date d''exigibilite', 0, 1, 1, 
    'TO_CHAR(OPR.DATEXG,X7UTIL.FRMDAT)', 6, NULL, 'Date d''exigibilite');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('2232', 'frmListeCLTOPR01', 'OPR', 'Mnt', 12, 
    'Débit', 'Montant', 0, 1, 1, 
    'CASE WHEN OPR.MNT <= 0 THEN NULL ELSE OPR.MNT END', 7, NULL, 'Montant');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('2233', 'frmListeCLTOPR01', 'OPR', 'Mnt', 12, 
    'Crédit', 'Montant', 0, 1, 1, 
    'CASE WHEN OPR.MNT >= 0 THEN NULL ELSE OPR.MNT * -1 END', 9, NULL, 'Montant');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('2234', 'frmListeCLTOPR01', 'OPR', 'Sld', 12, 
    'Solde', 'Solde de l''operation', 0, 1, 1, 
    'CASE WHEN OPR.SLD <= 0 THEN NULL ELSE OPR.SLD END', 10, NULL, 'Solde de l''operation');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('2235', 'frmListeCLTOPR01', 'OPR', 'Sld', 12, 
    'Non affecté', 'Solde de l''operation', 0, 1, 1, 
    'CASE WHEN OPR.SLD >= 0 THEN NULL ELSE OPR.SLD * -1 END', 10, NULL, 'Solde de l''operation');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('2236', 'frmListeCLTOPR01', 'OPR', 'IDTCLT', 12, 
    'Client', 'Client', 0, 1, 1, 
    'OPR.IDTCLT', 11, NULL, 'Client');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('2237', 'frmListeCLTOPR01', 'CTRFAC', 'IDTCTR', 12, 
    'Contrat', 'Contrat', 0, 1, 1, 
    'CTRFAC.IDTCTR', 12, NULL, 'Contrat');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('2238', 'frmListeCLTOPR01', 'CTRFAC', 'DatDbtPrd', 12, 
    'Debut période fac.', 'Debut période fac.', 0, 1, 1, 
    'DECODE(TYPOPR.IdtTypOpr, 2, NULL, TO_CHAR(CTRFAC.DatDbtPrd,X7UTIL.FRMDAT))', 13, NULL, 'Debut période fac.');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('2239', 'frmListeCLTOPR01', 'CTRFAC', 'DatFinPrd', 12, 
    'Fin période fac.', 'Fin période fac.', 0, 1, 1, 
    'DECODE(TYPOPR.IdtTypOpr, 2, NULL, TO_CHAR(CTRFAC.DatFinPrd,X7UTIL.FRMDAT) )', 14, NULL, 'Fin période fac.');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('2240', 'frmListeCLTOPR01', 'OPR', 'INFCPL', 12, 
    'Information complémentaires', 'Information complémentaires', 0, 1, 1, 
    'OPR.INFCPL', 15, NULL, 'Information complémentaires');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('2241', 'frmListeCLTOPR01', 'OPR', 'IDTAGT', 6, 
    'Code agent', 'Code agent', 0, 1, 0, 
    'OPR.IDTAGT', 0, NULL, 'Code agent');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('2242', 'frmListeCLTOPR01', 'OPR', 'IDTBNQ', 6, 
    'Code banque', 'Code banque', 0, 1, 0, 
    'OPR.IDTBNQ', 0, NULL, 'Code banque');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('2243', 'frmListeCLTOPR01', 'OPR', 'IDTCSS', 6, 
    'Code caisse', 'Code caisse', 0, 1, 0, 
    'OPR.IDTCSS', 0, NULL, 'Code caisse');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('2244', 'frmListeCLTOPR01', 'OPR', 'IDTDVS', 6, 
    'Code devise', 'Code devise', 0, 1, 0, 
    'OPR.IDTDVS', 0, NULL, 'Code devise');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('2245', 'frmListeCLTOPR01', 'OPR', 'IDTGCH', 6, 
    'Code guichet', 'Code guichet', 0, 1, 0, 
    'OPR.IDTGCH', 0, NULL, 'Code guichet');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('2246', 'frmListeCLTOPR01', 'OPR', 'IDTOPR', 22, 
    'Identifiant de l''operation', 'Identifiant de l''operation', 0, 1, 0, 
    'OPR.IDTOPR', 0, NULL, 'Identifiant de l''operation');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('2247', 'frmListeCLTOPR01', 'OPR', 'NUMCHQ', 15, 
    'Numero de cheque', 'Numero de cheque', 0, 1, 0, 
    'OPR.NUMCHQ', 0, NULL, 'Numero de cheque');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('2248', 'frmListeCLTOPR01', 'OPR', 'LIB', 22, 
    'Situation libelle', 'Situation libelle', 0, 1, 0, 
    '(SELECT LIB FROM SIT S WHERE S.IDTSIT = OPR.IDTSIT)', 0, NULL, 'Situation libelle');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('2249', 'frmListeCLTOPR01', 'OPR', 'NOM', 22, 
    'Nom agent', 'Nom agent', 0, 1, 0, 
    '(SELECT NOM FROM AGT WHERE AGT.IDTAGT = OPR.IDTAGT)', 0, NULL, 'Nom agent');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('2250', 'frmListeCLTOPR01', 'OPR', 'PRN', 22, 
    'Prenom agent', 'Prenom agent', 0, 1, 0, 
    '(SELECT PRN FROM AGT WHERE AGT.IDTAGT = OPR.IDTAGT)', 0, NULL, 'Prenom agent');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('2251', 'frmListeCLTOPR01', 'OPR', 'TYPOPR', 22, 
    'Type de l''operation', 'Type de l''operation', 0, 1, 0, 
    '(SELECT TYPOPR FROM TYPOPR WHERE TYPOPR.IDTTYPOPR = OPR.IDTTYPOPR)', 0, NULL, 'Type de l''operation');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('2252', 'frmListeCLTOPR01', 'OPRDBT_VIEW', 'MNT', 22, 
    'Montant', 'Montant', 0, 1, 0, 
    'OPRDBT_VIEW.MNT', 0, NULL, 'Montant');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('2253', 'frmListeCLTOPR01', 'OPRDBT_VIEW', 'CODRGR', 6, 
    'Code de regroupement', 'Code de regroupement', 0, 1, 0, 
    'OPRDBT_VIEW.CODRGR', 0, NULL, 'Code de regroupement');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('2254', 'frmListeCLTOPR01', 'OPRDBT_VIEW', 'DATEXG', 22, 
    'Date d''exigibilite', 'Date d''exigibilite', 0, 1, 0, 
    'TO_CHAR(OPRDBT_VIEW.DATEXG,X7UTIL.FRMDAT)', 0, NULL, 'Date d''exigibilite');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('2255', 'frmListeCLTOPR01', 'OPRDBT_VIEW', 'DATVLR', 22, 
    'Date de valeur', 'Date de valeur', 0, 1, 0, 
    'TO_CHAR(OPRDBT_VIEW.DATVLR,X7UTIL.FRMDAT)', 0, NULL, 'Date de valeur');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('2256', 'frmListeCLTOPR01', 'OPRDBT_VIEW', 'ECHPMT', 22, 
    'Code d''echeancier de paiement', 'Code d''echeancier de paiement', 0, 1, 0, 
    'OPRDBT_VIEW.ECHPMT', 0, NULL, 'Code d''echeancier de paiement');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('2257', 'frmListeCLTOPR01', 'OPRDBT_VIEW', 'MNTDVS', 22, 
    'Montant de la devise etrangere', 'Montant de la devise etrangere', 0, 1, 0, 
    'OPRDBT_VIEW.MNTDVS', 0, NULL, 'Montant de la devise etrangere');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('2258', 'frmListeCLTOPR01', 'OPRDBT_VIEW', 'IDTLOTRTG', 22, 
    'Lot de routage', 'Lot de routage', 0, 1, 0, 
    'OPRDBT_VIEW.IDTLOTRTG', 0, NULL, 'Lot de routage');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('2259', 'frmListeCLTOPR01', 'OPRDBT_VIEW', 'BRDRGR', 16, 
    'Bordereau de regroupement', 'Bordereau de regroupement', 0, 1, 0, 
    'OPRDBT_VIEW.BRDRGR', 0, NULL, 'Bordereau de regroupement');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('2260', 'frmListeINTINT01', 'INT', 'IDTINT', 12, 
    'Numéro', 'Code', 1, 1, 0, 
    'INT.IDTINT', 1, NULL, 'Code');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('2261', 'frmListeINTINT01', 'CTLACT', 'LIBABR', 12, 
    'Nature', 'Nature', 0, 1, 1, 
    'CTLACT.LIBABR', 2, NULL, 'Nature');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('2262', 'frmListeINTINT01', 'STAINT', 'LIB', 12, 
    'Etat', 'Etat', 0, 1, 1, 
    'STAINT.LIB', 3, NULL, 'Etat');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('2263', 'frmListeINTINT01', 'INT', 'DATEXEPRV', 12, 
    'Prévue le', 'Prevue le', 0, 1, 1, 
    'TO_CHAR(INT.DATEXEPRV,X7UTIL.FRMDATHM)', 4, NULL, 'Prevue le');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('2264', 'frmListeINTINT01', 'PNTLVR', 'IDTPNTLVR', 12, 
    'Point de livraison', 'Identifiant interne', 0, 1, 1, 
    'substr(X7UTIL.LIBPNTLVR(PNTLVR.IDTPNTLVR),1,250)', 5, NULL, 'Identifiant interne');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('2265', 'frmListeINTINT01', 'INT', 'IDTPNTCPG', 12, 
    'Point de comptage', 'Point de comptage', 0, 1, 1, 
    'INT.IDTPNTCPG', 6, NULL, 'Point de comptage');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('2266', 'frmListeINTINT01', 'INT', 'IDTCNTOPR', 12, 
    'CO', 'CO', 0, 1, 1, 
    'INT.IDTCNTOPR', 7, NULL, 'CO');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('2267', 'frmListeINTINT01', 'INT', 'DATDEM', 12, 
    'Date de demande', 'Date de demande', 0, 1, 0, 
    'TO_CHAR(INT.DATDEM,X7UTIL.FRMDATHM)', 0, NULL, 'Date de demande');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('2268', 'frmListeINTINT01', 'INT', 'DATPOSAVN', 12, 
    'Date d''installation avant intervention', 'Date d''installation avant intervention', 0, 1, 0, 
    'TO_CHAR(INT.DATPOSAVN,X7UTIL.FRMDAT)', 0, NULL, 'Date d''installation avant intervention');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('2269', 'frmListeINTINT01', 'INT', 'DMTPNTCPG', 12, 
    'Diametre du point de comptage', 'Diametre du point de comptage', 0, 1, 0, 
    'INT.DMTPNTCPG', 0, NULL, 'Diametre du point de comptage');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('2270', 'frmListeINTINT01', 'INT', 'IDTMODCOU', 12, 
    'Code de la methode de coupure', 'Code de la methode de coupure', 0, 1, 0, 
    'INT.IDTMODCOU', 0, NULL, 'Code de la methode de coupure');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('2271', 'frmListeINTINT01', 'INT', 'IDTSTA', 12, 
    'Code du status', 'Code du status', 0, 1, 0, 
    'INT.IDTSTA', 0, NULL, 'Code du status');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('2272', 'frmListeINTINT01', 'INT', 'IND1', 12, 
    'Lecture 1', 'Lecture 1', 0, 1, 0, 
    'INT.IND1', 0, NULL, 'Lecture 1');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('2273', 'frmListeINTINT01', 'INT', 'IND1APR', 12, 
    'Lecture 1 apres intervention', 'Lecture 1 apres intervention', 0, 1, 0, 
    'INT.IND1APR', 0, NULL, 'Lecture 1 apres intervention');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('2274', 'frmListeINTINT01', 'INT', 'IND1AVN', 12, 
    'Lecture 1 avant intervention', 'Lecture 1 avant intervention', 0, 1, 0, 
    'INT.IND1AVN', 0, NULL, 'Lecture 1 avant intervention');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('2275', 'frmListeINTINT01', 'INT', 'DATEFFEXE', 12, 
    'Executee le', 'Date de CRI', 0, 1, 0, 
    'TO_CHAR(INT.DATEFFEXE,X7UTIL.FRMDATHM)', 0, NULL, 'Date de CRI');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('2276', 'frmListeINTINT01', 'INT', 'DATEDTBI', 12, 
    'Date d''edition', 'Date d''edition', 0, 1, 0, 
    'TO_CHAR(INT.DATEDTBI,X7UTIL.FRMDATHM)', 0, NULL, 'Date d''edition');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('2277', 'frmListeINTINT01', 'INT', 'MTRAGT', 12, 
    'Agent', 'Agent', 0, 1, 0, 
    'INT.MTRAGT', 0, NULL, 'Agent');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('2278', 'frmListeINTINT01', 'INT', 'IDTCPRAVN', 12, 
    'Code avant intervention', 'Code avant intervention', 0, 1, 0, 
    'INT.IDTCPRAVN', 0, NULL, 'Code avant intervention');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('2279', 'frmListeINTINT01', 'INT', 'IDTCPRAPR', 12, 
    'Code apres intervention', 'Code apres intervention', 0, 1, 0, 
    'INT.IDTCPRAPR', 0, NULL, 'Code apres intervention');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('2280', 'frmListeINTINT01', 'INT', 'IDTMTFINTLIB', 12, 
    'Motif de l''intervention', 'Motif de l''intervention', 0, 1, 0, 
    '(SELECT M1.TypoStd FROM TYPOSTD M1 WHERE M1.IdtTypoStd = INT.IdtMtfInt AND M1.CodTypoStd = ''MTFINT'')', 0, NULL, 'Motif de l''intervention');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('2281', 'frmListeCMMCLT01', 'CTR_ALL', 'T3', 6, 
    'Adaptable field typologie 3', 'Adaptable field typologie 3', 0, 0, 0, 
    'CTR_ALL.T3', 0, NULL, 'Adaptable field typologie 3');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('2282', 'frmListeCMMCLT01', 'CTR_ALL', 'A1', 40, 
    'Adaptable field string 1', 'Adaptable field string 1', 0, 0, 0, 
    'CTR_ALL.A1', 0, NULL, 'Adaptable field string 1');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('2283', 'frmListeCMMCLT01', 'CTR_ALL', 'A2', 40, 
    'Adaptable field string 2', 'Adaptable field string 2', 0, 0, 0, 
    'CTR_ALL.A2', 0, NULL, 'Adaptable field string 2');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('2284', 'frmListeCMMCLT01', 'CTR_ALL', 'N2', 22, 
    'Adaptable field number 2', 'Adaptable field number 2', 0, 0, 0, 
    'CTR_ALL.N2', 0, NULL, 'Adaptable field number 2');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('2285', 'frmListeCMMCLT01', 'CTR_ALL', 'IDTPNTLVR', 22, 
    'Delivery point ID', 'Delivery point ID', 0, 1, 0, 
    'CTR_ALL.IDTPNTLVR', 0, NULL, 'Delivery point ID');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('2286', 'frmListeCMMCLT01', 'CTR_ALL', 'IDTCNTOPR', 6, 
    'Centre opérationel', 'Centre opérationel', 0, 1, 0, 
    'CTR_ALL.IDTCNTOPR', 0, NULL, 'Centre opérationel');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('2287', 'frmListeCMMCLT01', 'CTR_ALL', 'SQCAVN', 22, 
    'Amendment serial number', 'Amendment serial number', 0, 1, 0, 
    'CTR_ALL.SQCAVN', 0, NULL, 'Amendment serial number');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('2288', 'frmListeCMMCLT01', 'CTR_ALL', 'T2', 6, 
    'Adaptable field typologie 2', 'Adaptable field typologie 2', 0, 0, 0, 
    'CTR_ALL.T2', 0, NULL, 'Adaptable field typologie 2');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('2289', 'frmListeCMMCLT01', 'CTR_ALL', 'D3', 7, 
    'Adaptable field date 3', 'Adaptable field date 3', 0, 0, 0, 
    'TO_CHAR(CTR_ALL.D3,''DD/MM/YYYY'')', 0, NULL, 'Adaptable field date 3');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('2290', 'frmListeCMMCLT01', 'CTR_ALL', 'MTRAGT', 6, 
    'ID of the employee who carries out updating', 'ID of the employee who carries out updating', 0, 1, 0, 
    'CTR_ALL.MTRAGT', 0, NULL, 'ID of the employee who carries out updating');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('2291', 'frmListeCMMCLT01', 'CTR_ALL', 'IDTCTR', 10, 
    'Numéro', 'Numero', 0, 1, 0, 
    'CTR_ALL.IDTCTR', 0, NULL, 'Numero');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('2292', 'frmListeCMMCLT01', 'CTR_ALL', 'MTFRSL', 15, 
    'Motive for termination', 'Motive for termination', 0, 1, 0, 
    'CTR_ALL.MTFRSL', 0, NULL, 'Motive for termination');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('2293', 'frmListeCMMCLT01', 'CTR_ALL', 'IDTRCVTYP', 6, 
    'Debt recovery type ID', 'Recouvrement type', 0, 1, 0, 
    'CTR_ALL.IDTRCVTYP', 0, NULL, 'Recouvrement type');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('2294', 'frmListeCMMCLT01', 'CTR_ALL', 'DATSCR', 15, 
    'Souscrit le', 'Date de souscription', 0, 1, 0, 
    'TO_CHAR(CTR_ALL.DATSCR,''DD/MM/YYYY'')', 0, NULL, 'Date de souscription');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('2295', 'frmListeCMMCLT01', 'CTR_ALL', 'T5', 6, 
    'Adaptable field typologie 5', 'Adaptable field typologie 5', 0, 0, 0, 
    'CTR_ALL.T5', 0, NULL, 'Adaptable field typologie 5');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('2296', 'frmListeCMMCLT01', 'CTR_ALL', 'N3', 22, 
    'Adaptable field number 3', 'Adaptable field number 3', 0, 0, 0, 
    'CTR_ALL.N3', 0, NULL, 'Adaptable field number 3');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('2297', 'frmListeCMMCLT01', 'CTR_ALL', 'N4', 22, 
    'Adaptable field number 4', 'Adaptable field number 4', 0, 0, 0, 
    'CTR_ALL.N4', 0, NULL, 'Adaptable field number 4');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('2298', 'frmListeCMMCLT01', 'CTR_ALL', 'N5', 22, 
    'Adaptable field number 5', 'Adaptable field number 5', 0, 0, 0, 
    'CTR_ALL.N5', 0, NULL, 'Adaptable field number 5');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('2299', 'frmListeCMMCLT01', 'CTR_ALL', 'DATRSL', 7, 
    'Résilié le', 'Date de resiliation', 0, 1, 0, 
    'TO_CHAR(CTR_ALL.DATRSL,''DD/MM/YYYY'')', 0, NULL, 'Date de resiliation');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('2300', 'frmListeCMMCLT01', 'CTR_ALL', 'ETTCTR', 22, 
    'Contract status ( 1< normal>, 2<creation mode of the amendment>, 3<cancellation mode>, 4<creation mode>)', 'Contract status ( 1< normal>, 2<creation mode of the amendment>, 3<cancellation mode>, 4<creation mode>)', 0, 1, 0, 
    'CTR_ALL.ETTCTR', 0, NULL, 'Contract status ( 1< normal>, 2<creation mode of the amendment>, 3<cancellation mode>, 4<creation mode>)');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('2301', 'frmListeCMMCLT01', 'CTR_ALL', 'IDTSQCGNR', 22, 
    'General identifier', 'General identifier', 0, 1, 0, 
    'CTR_ALL.IDTSQCGNR', 0, NULL, 'General identifier');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('2302', 'frmListeCMMCLT01', 'CTR_ALL', 'IDTBNQ', 6, 
    'Banque', 'Banque', 0, 1, 0, 
    'CTR_ALL.IDTBNQ', 0, NULL, 'Banque');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('2303', 'frmListeCMMCLT01', 'CTR_ALL', 'NUMCPTBNC', 30, 
    'Bank account number', 'Compte', 0, 1, 0, 
    'CTR_ALL.NUMCPTBNC', 0, NULL, 'Compte');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('2304', 'frmListeCMMCLT01', 'CTR_ALL', 'CLERIB', 2, 
    'Bank account code', 'Bank account code', 0, 1, 0, 
    'CTR_ALL.CLERIB', 0, NULL, 'Bank account code');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('2305', 'frmListeCMMCLT01', 'CTR_ALL', 'D2', 7, 
    'Adaptable field date 2', 'Adaptable field date 2', 0, 0, 0, 
    'TO_CHAR(CTR_ALL.D2,''DD/MM/YYYY'')', 0, NULL, 'Adaptable field date 2');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('2306', 'frmListeCMMCLT01', 'CTR_ALL', 'D4', 7, 
    'Adaptable field date 4', 'Adaptable field date 4', 0, 0, 0, 
    'TO_CHAR(CTR_ALL.D4,''DD/MM/YYYY'')', 0, NULL, 'Adaptable field date 4');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('2307', 'frmListeCMMCLT01', 'CTR_ALL', 'A3', 40, 
    'Adaptable field string 3', 'Adaptable field string 3', 0, 0, 0, 
    'CTR_ALL.A3', 0, NULL, 'Adaptable field string 3');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('2308', 'frmListeCMMCLT01', 'CTR_ALL', 'IDTCTR', 60, 
    'Point de livraison', 'Numero', 0, 1, 0, 
    'PNTLVR.IdtDcpGgr || PRMGNR.SprCdf || PNTLVR.NumOrd', 0, NULL, 'Numero');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('2309', 'frmListeCMMCLT01', 'CTR_ALL', 'IDTPNTCPG', 6, 
    'Point de comptage', 'Point de comptage', 0, 1, 0, 
    'PNTCPG.IDTPNTCPG', 0, NULL, 'Point de comptage');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('2310', 'frmListeCMMCLT01', 'CTR_ALL', 'FINDRNPRDFCT', 7, 
    'Last billed period (ending date)', '????? ??? ????', 0, 1, 0, 
    'TO_CHAR(CTR_ALL.FINDRNPRDFCT,''DD/MM/YYYY'')', 0, NULL, '????? ??? ????');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('2311', 'frmListeCMMCLT01', 'CTR_ALL', 'DPTGRN', 22, 
    'Deposit', 'Depot de garantie', 0, 1, 0, 
    'CTR_ALL.DPTGRN', 0, NULL, 'Depot de garantie');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('2312', 'frmListeCMMCLT01', 'CTR_ALL', 'IDTGCH', 6, 
    'Counter ID', 'Counter ID', 0, 1, 0, 
    'CTR_ALL.IDTGCH', 0, NULL, 'Counter ID');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('2313', 'frmListeCMMCLT01', 'CTR_ALL', 'IDTT4', 6, 
    'Associated typology ID 4', 'Associated typology ID 4', 0, 0, 0, 
    'CTR_ALL.IDTT4', 0, NULL, 'Associated typology ID 4');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('2314', 'frmListeCMMCLT01', 'CTR_ALL', 'IDTT5', 6, 
    'Associated typology ID 5', 'Associated typology ID 5', 0, 0, 0, 
    'CTR_ALL.IDTT5', 0, NULL, 'Associated typology ID 5');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('2315', 'frmListeCMMCLT01', 'CTR_ALL', 'IDTCLTDST', 6, 
    'Addressee ID', 'Code destinataire', 0, 1, 0, 
    'CTR_ALL.IDTCLTDST', 0, NULL, 'Code destinataire');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('2316', 'frmListeCMMCLT01', 'CTR_ALL', 'IDTCLTSSC', 6, 
    'Client souscripteur', 'Code souscripteur', 0, 1, 0, 
    'CTR_ALL.IDTCLTSSC', 0, NULL, 'Code souscripteur');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('2317', 'frmListeCMMCLT01', 'CTR_ALL', 'CODTYPCTR', 6, 
    'Type of contract code', 'Type de contrat', 0, 1, 0, 
    'CTR_ALL.CODTYPCTR', 0, NULL, 'Type de contrat');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('2318', 'frmListeCMMCLT01', 'CTR_ALL', 'IDTT1', 6, 
    'Associated typology ID 1', 'Associated typology ID 1', 0, 0, 0, 
    'CTR_ALL.IDTT1', 0, NULL, 'Associated typology ID 1');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('2319', 'frmListeCMMCLT01', 'CTR_ALL', 'DATMAJ', 7, 
    'Date de mise à jour', 'Date de mise à jour', 0, 1, 0, 
    'TO_CHAR(CTR_ALL.DATMAJ,''DD/MM/YYYY'')', 0, NULL, 'Date de mise à jour');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('2320', 'frmListeCMMCLT01', 'CTR_ALL', 'DATCRT', 7, 
    'Creation date', 'Creation date', 0, 1, 0, 
    'TO_CHAR(CTR_ALL.DATCRT,''DD/MM/YYYY'')', 0, NULL, 'Creation date');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('2321', 'frmListeCMMCLT01', 'CTR_ALL', 'IDTT2', 6, 
    'Associated typology ID 2', 'Associated typology ID 2', 0, 0, 0, 
    'CTR_ALL.IDTT2', 0, NULL, 'Associated typology ID 2');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('2322', 'frmListeCMMCLT01', 'CTR_ALL', 'A4', 40, 
    'Adaptable field string 4', 'Adaptable field string 4', 0, 0, 0, 
    'CTR_ALL.A4', 0, NULL, 'Adaptable field string 4');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('2323', 'frmListeCMMCLT01', 'CTR_ALL', 'A5', 40, 
    'Adaptable field string 5', 'Adaptable field string 5', 0, 0, 0, 
    'CTR_ALL.A5', 0, NULL, 'Adaptable field string 5');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('2324', 'frmListeCMMCLT01', 'CTR_ALL', 'N1', 22, 
    'Adaptable field number 1', 'Adaptable field number 1', 0, 0, 0, 
    'CTR_ALL.N1', 0, NULL, 'Adaptable field number 1');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('2325', 'frmListeCMMCLT01', 'CTR_ALL', 'T1', 6, 
    'Adaptable field typologie 1', 'Adaptable field typologie 1', 0, 0, 0, 
    'CTR_ALL.T1', 0, NULL, 'Adaptable field typologie 1');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('2326', 'frmListeCMMCLT01', 'CTR_ALL', 'C3', 22, 
    'Adaptable field check-box 3', 'Adaptable field check-box 3', 0, 0, 0, 
    'CTR_ALL.C3', 0, NULL, 'Adaptable field check-box 3');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('2327', 'frmListeCMMCLT01', 'CTR_ALL', 'ANCRFR', 20, 
    'Ancienne reference', 'Ancienne reference', 0, 1, 0, 
    'CTR_ALL.ANCRFR', 0, NULL, 'Ancienne reference');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('2328', 'frmListeCMMCLT01', 'CTR_ALL', 'ETTCTRFCT', 22, 
    'Billing status of contract (1<normal>, 2<computation mode>, 3<validation mode>, 4<periodical billing on going>)', 'Billing status of contract (1<normal>, 2<computation mode>, 3<validation mode>, 4<periodical billing on going>)', 0, 1, 0, 
    'CTR_ALL.ETTCTRFCT', 0, NULL, 'Billing status of contract (1<normal>, 2<computation mode>, 3<validation mode>, 4<periodical billing on going>)');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('2329', 'frmListeCMMCLT01', 'CTR_ALL', 'T4', 6, 
    'Adaptable field typologie 4', 'Adaptable field typologie 4', 0, 0, 0, 
    'CTR_ALL.T4', 0, NULL, 'Adaptable field typologie 4');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('2330', 'frmListeCMMCLT01', 'CTR_ALL', 'IDTPNTCPG', 22, 
    'Metering point ID', 'Metering point ID', 0, 1, 0, 
    'CTR_ALL.IDTPNTCPG', 0, NULL, 'Metering point ID');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('2331', 'frmListeCMMCLT01', 'CTR_ALL', 'IDTLOTFAC', 6, 
    'Billing batch ID', 'Lot de facturation', 0, 1, 0, 
    'CTR_ALL.IDTLOTFAC', 0, NULL, 'Lot de facturation');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('2332', 'frmListeCMMCLT01', 'CTR_ALL', 'IDTCODSNS', 6, 
    'Code sensibilité', 'Code sensibilité', 0, 1, 0, 
    'CTR_ALL.IDTCODSNS', 0, NULL, 'Code sensibilité');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('2333', 'frmListeCMMCLT01', 'CTR_ALL', 'DATDRNFCT', 7, 
    'Date of last billing of the contract', 'Date de derniere facturation', 0, 1, 0, 
    'TO_CHAR(CTR_ALL.DATDRNFCT,''DD/MM/YYYY'')', 0, NULL, 'Date de derniere facturation');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('2334', 'frmListeCMMCLT01', 'CTR_ALL', 'C1', 22, 
    'Adaptable field check-box 1', 'Adaptable field check-box 1', 0, 0, 0, 
    'CTR_ALL.C1', 0, NULL, 'Adaptable field check-box 1');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('2335', 'frmListeCMMCLT01', 'CTR_ALL', 'C2', 22, 
    'Adaptable field check-box 2', 'Adaptable field check-box 2', 0, 0, 0, 
    'CTR_ALL.C2', 0, NULL, 'Adaptable field check-box 2');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('2336', 'frmListeCMMCLT01', 'CTR_ALL', 'C5', 22, 
    'Adaptable field check-box 5', 'Adaptable field check-box 5', 0, 0, 0, 
    'CTR_ALL.C5', 0, NULL, 'Adaptable field check-box 5');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('2337', 'frmListeCMMCLT01', 'CTR_ALL', 'D1', 7, 
    'Adaptable field date 1', 'Adaptable field date 1', 0, 0, 0, 
    'TO_CHAR(CTR_ALL.D1,''DD/MM/YYYY'')', 0, NULL, 'Adaptable field date 1');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('2338', 'frmListeCMMCLT01', 'CTR_ALL', 'PRPCPTBNC', 40, 
    'Bank account owner', 'Bank account owner', 0, 1, 0, 
    'CTR_ALL.PRPCPTBNC', 0, NULL, 'Bank account owner');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('2339', 'frmListeCMMCLT01', 'CTR_ALL', 'IDTT3', 6, 
    'Associated typology ID 3', 'Associated typology ID 3', 0, 0, 0, 
    'CTR_ALL.IDTT3', 0, NULL, 'Associated typology ID 3');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('2340', 'frmListeCMMCLT01', 'CTR_ALL', 'DEBDRNPRDFCT', 7, 
    'Last billed period (starting date)', 'Last billed period (starting date)', 0, 1, 0, 
    'TO_CHAR(CTR_ALL.DEBDRNPRDFCT,''DD/MM/YYYY'')', 0, NULL, 'Last billed period (starting date)');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('2341', 'frmListeCMMCLT01', 'CTR_ALL', 'NUMINTER', 22, 
    'Work order number', 'Work order number', 0, 1, 0, 
    'CTR_ALL.NUMINTER', 0, NULL, 'Work order number');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('2342', 'frmListeCMMCLT01', 'CTR_ALL', 'IDTSRV', 22, 
    'Service ID (1 <WATER>, 2 <LV electricity>, 3 <MV electricity>, ...)', 'Service ID (1 <WATER>, 2 <LV electricity>, 3 <MV electricity>, ...)', 0, 1, 0, 
    'CTR_ALL.IDTSRV', 0, NULL, 'Service ID (1 <WATER>, 2 <LV electricity>, 3 <MV electricity>, ...)');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('2343', 'frmListeCMMCLT01', 'CTR_ALL', 'C4', 22, 
    'Adaptable field check-box 4', 'Adaptable field check-box 4', 0, 0, 0, 
    'CTR_ALL.C4', 0, NULL, 'Adaptable field check-box 4');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('2344', 'frmListeCMMCLT01', 'CTR_ALL', 'D5', 7, 
    'Adaptable field date 5', 'Adaptable field date 5', 0, 0, 0, 
    'TO_CHAR(CTR_ALL.D5,''DD/MM/YYYY'')', 0, NULL, 'Adaptable field date 5');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('2345', 'frmListeCMMCLT01', 'CPR', 'IDTSQCGNR', 22, 
    'General identifier', 'General identifier', 0, 1, 0, 
    'CPR.IDTSQCGNR', 0, NULL, 'General identifier');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('2346', 'frmListeCMMCLT01', 'CPR', 'T3', 6, 
    'Adaptable field typology 3', 'Adaptable field typology 3', 0, 0, 0, 
    'CPR.T3', 0, NULL, 'Adaptable field typology 3');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('2347', 'frmListeCMMCLT01', 'CPR', 'T5', 6, 
    'Adaptable field typology 5', 'Adaptable field typology 5', 0, 0, 0, 
    'CPR.T5', 0, NULL, 'Adaptable field typology 5');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('2348', 'frmListeCMMCLT01', 'CPR', 'D3', 7, 
    'Adaptable field date 3', 'Adaptable field date 3', 0, 0, 0, 
    'TO_CHAR(CPR.D3,''DD/MM/YYYY'')', 0, NULL, 'Adaptable field date 3');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('2349', 'frmListeCMMCLT01', 'CPR', 'IDTCPR', 22, 
    'Identifiant interne', 'Identifiant interne', 0, 1, 0, 
    'CPR.IDTCPR', 0, NULL, 'Identifiant interne');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('2350', 'frmListeCMMCLT01', 'CPR', 'SQCIND', 22, 
    'Serial number of the index of the meter', 'Serial number of the index of the meter', 0, 1, 0, 
    'CPR.SQCIND', 0, NULL, 'Serial number of the index of the meter');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('2351', 'frmListeCMMCLT01', 'CPR', 'IDTT3', 6, 
    'Associated typology ID 3', 'Associated typology ID 3', 0, 0, 0, 
    'CPR.IDTT3', 0, NULL, 'Associated typology ID 3');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('2352', 'frmListeCMMCLT01', 'CPR', 'A2', 40, 
    'Adaptable field string 2', 'Adaptable field string 2', 0, 0, 0, 
    'CPR.A2', 0, NULL, 'Adaptable field string 2');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('2353', 'frmListeCMMCLT01', 'CPR', 'A5', 40, 
    'Adaptable field string 5', 'Adaptable field string 5', 0, 0, 0, 
    'CPR.A5', 0, NULL, 'Adaptable field string 5');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('2354', 'frmListeCMMCLT01', 'CPR', 'SQCCNS', 22, 
    'Consumption serial number', 'Consumption serial number', 0, 1, 0, 
    'CPR.SQCCNS', 0, NULL, 'Consumption serial number');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('2355', 'frmListeCMMCLT01', 'CPR', 'T1', 6, 
    'Adaptable field typology 1', 'Adaptable field typology 1', 0, 0, 0, 
    'CPR.T1', 0, NULL, 'Adaptable field typology 1');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('2356', 'frmListeCMMCLT01', 'CPR', 'T4', 6, 
    'Adaptable field typology 4', 'Adaptable field typology 4', 0, 0, 0, 
    'CPR.T4', 0, NULL, 'Adaptable field typology 4');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('2357', 'frmListeCMMCLT01', 'CPR', 'IDTT5', 6, 
    'Associated typology ID 5', 'Associated typology ID 5', 0, 0, 0, 
    'CPR.IDTT5', 0, NULL, 'Associated typology ID 5');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('2358', 'frmListeCMMCLT01', 'CPR', 'A4', 40, 
    'Adaptable field string 4', 'Adaptable field string 4', 0, 0, 0, 
    'CPR.A4', 0, NULL, 'Adaptable field string 4');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('2359', 'frmListeCMMCLT01', 'CPR', 'IDTAGT', 6, 
    'Employee ID', 'Employee ID', 0, 1, 0, 
    'CPR.IDTAGT', 0, NULL, 'Employee ID');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('2360', 'frmListeCMMCLT01', 'CPR', 'N4', 22, 
    'Adaptable field number 4', 'Adaptable field number 4', 0, 0, 0, 
    'CPR.N4', 0, NULL, 'Adaptable field number 4');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('2361', 'frmListeCMMCLT01', 'CPR', 'C1', 22, 
    'Adaptable field check-box 1', 'Adaptable field check-box 1', 0, 0, 0, 
    'CPR.C1', 0, NULL, 'Adaptable field check-box 1');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('2362', 'frmListeCMMCLT01', 'CPR', 'C4', 22, 
    'Adaptable field check-box 4', 'Adaptable field check-box 4', 0, 0, 0, 
    'CPR.C4', 0, NULL, 'Adaptable field check-box 4');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('2363', 'frmListeCMMCLT01', 'CPR', 'DATGRN', 7, 
    'Date de garantie', 'Date de garantie', 0, 1, 0, 
    'TO_CHAR(CPR.DATGRN,''DD/MM/YYYY'')', 0, NULL, 'Date de garantie');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('2364', 'frmListeCMMCLT01', 'CPR', 'DATFBR', 7, 
    'Date de fabrication', 'Date de fabrication', 0, 1, 0, 
    'TO_CHAR(CPR.DATFBR,''DD/MM/YYYY'')', 0, NULL, 'Date de fabrication');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('2365', 'frmListeCMMCLT01', 'CPR', 'IDTT4', 6, 
    'Associated typology ID 4', 'Associated typology ID 4', 0, 0, 0, 
    'CPR.IDTT4', 0, NULL, 'Associated typology ID 4');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('2366', 'frmListeCMMCLT01', 'CPR', 'C3', 22, 
    'Adaptable field check-box 3', 'Adaptable field check-box 3', 0, 0, 0, 
    'CPR.C3', 0, NULL, 'Adaptable field check-box 3');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('2367', 'frmListeCMMCLT01', 'CPR', 'C5', 22, 
    'Adaptable field check-box 5', 'Adaptable field check-box 5', 0, 0, 0, 
    'CPR.C5', 0, NULL, 'Adaptable field check-box 5');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('2368', 'frmListeCMMCLT01', 'CPR', 'IDTTYPCPR', 6, 
    'Type de compteur', 'Type de compteur', 0, 1, 0, 
    'CPR.IDTTYPCPR', 0, NULL, 'Type de compteur');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('2369', 'frmListeCMMCLT01', 'CPR', 'IDTT1', 6, 
    'Associated typology ID 1', 'Associated typology ID 1', 0, 0, 0, 
    'CPR.IDTT1', 0, NULL, 'Associated typology ID 1');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('2370', 'frmListeCMMCLT01', 'CPR', 'A1', 40, 
    'Adaptable field string 1', 'Adaptable field string 1', 0, 0, 0, 
    'CPR.A1', 0, NULL, 'Adaptable field string 1');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('2371', 'frmListeCMMCLT01', 'CPR', 'A3', 40, 
    'Adaptable field string 3', 'Adaptable field string 3', 0, 0, 0, 
    'CPR.A3', 0, NULL, 'Adaptable field string 3');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('2372', 'frmListeCMMCLT01', 'CPR', 'N1', 22, 
    'Adaptable field number 1', 'Adaptable field number 1', 0, 0, 0, 
    'CPR.N1', 0, NULL, 'Adaptable field number 1');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('2373', 'frmListeCMMCLT01', 'CPR', 'IDTCODOBS', 22, 
    'Observation code ID', 'Observation code ID', 0, 1, 0, 
    'CPR.IDTCODOBS', 0, NULL, 'Observation code ID');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('2374', 'frmListeCMMCLT01', 'CPR', 'NUMCPR', 20, 
    'Numero', 'Numero', 0, 1, 0, 
    'CPR.NUMCPR', 0, NULL, 'Numero');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('2375', 'frmListeCMMCLT01', 'CPR', 'N5', 22, 
    'Adaptable field number 5', 'Adaptable field number 5', 0, 0, 0, 
    'CPR.N5', 0, NULL, 'Adaptable field number 5');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('2376', 'frmListeCMMCLT01', 'CPR', 'C2', 22, 
    'Adaptable field check-box 2', 'Adaptable field check-box 2', 0, 0, 0, 
    'CPR.C2', 0, NULL, 'Adaptable field check-box 2');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('2377', 'frmListeCMMCLT01', 'CPR', 'DATRVS', 7, 
    'Date de revision', 'Date de revision', 0, 1, 0, 
    'TO_CHAR(CPR.DATRVS,''DD/MM/YYYY'')', 0, NULL, 'Date de revision');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('2378', 'frmListeCMMCLT01', 'CPR', 'DATMAJ', 7, 
    'Date de mise à jour', 'Date de mise à jour', 0, 1, 0, 
    'TO_CHAR(CPR.DATMAJ,''DD/MM/YYYY'')', 0, NULL, 'Date de mise à jour');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('2379', 'frmListeCMMCLT01', 'CPR', 'DATETL', 7, 
    'Date d''etalonnage', 'Date d''etalonnage', 0, 1, 0, 
    'TO_CHAR(CPR.DATETL,''DD/MM/YYYY'')', 0, NULL, 'Date d''etalonnage');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('2380', 'frmListeCMMCLT01', 'CPR', 'N3', 22, 
    'Adaptable field number 3', 'Adaptable field number 3', 0, 0, 0, 
    'CPR.N3', 0, NULL, 'Adaptable field number 3');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('2381', 'frmListeCMMCLT01', 'CPR', 'D1', 7, 
    'Adaptable field date 1', 'Adaptable field date 1', 0, 0, 0, 
    'TO_CHAR(CPR.D1,''DD/MM/YYYY'')', 0, NULL, 'Adaptable field date 1');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('2382', 'frmListeCMMCLT01', 'CPR', 'NUMENQ', 22, 
    'Recensement', 'Recensement', 0, 1, 0, 
    'CPR.NUMENQ', 0, NULL, 'Recensement');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('2383', 'frmListeCMMCLT01', 'CPR', 'DATAGR', 7, 
    'Date d''agrement', 'Date d''agrement', 0, 1, 0, 
    'TO_CHAR(CPR.DATAGR,''DD/MM/YYYY'')', 0, NULL, 'Date d''agrement');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('2384', 'frmListeCMMCLT01', 'CPR', 'T2', 6, 
    'Adaptable field typology 2', 'Adaptable field typology 2', 0, 0, 0, 
    'CPR.T2', 0, NULL, 'Adaptable field typology 2');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('2385', 'frmListeCMMCLT01', 'CPR', 'IDTT2', 6, 
    'Associated typology ID 2', 'Associated typology ID 2', 0, 0, 0, 
    'CPR.IDTT2', 0, NULL, 'Associated typology ID 2');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('2386', 'frmListeCMMCLT01', 'CPR', 'N2', 22, 
    'Adaptable field number 2', 'Adaptable field number 2', 0, 0, 0, 
    'CPR.N2', 0, NULL, 'Adaptable field number 2');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('2387', 'frmListeCMMCLT01', 'CPR', 'D2', 7, 
    'Adaptable field date 2', 'Adaptable field date 2', 0, 0, 0, 
    'TO_CHAR(CPR.D2,''DD/MM/YYYY'')', 0, NULL, 'Adaptable field date 2');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('2388', 'frmListeCMMCLT01', 'CPR', 'D4', 7, 
    'Adaptable field date 4', 'Adaptable field date 4', 0, 0, 0, 
    'TO_CHAR(CPR.D4,''DD/MM/YYYY'')', 0, NULL, 'Adaptable field date 4');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('2389', 'frmListeCMMCLT01', 'CPR', 'D5', 7, 
    'Adaptable field date 5', 'Adaptable field date 5', 0, 0, 0, 
    'TO_CHAR(CPR.D5,''DD/MM/YYYY'')', 0, NULL, 'Adaptable field date 5');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('2390', 'frmListeCMMCLT01', 'SRV', 'CODSRV', 6, 
    'Service', 'Code', 0, 1, 0, 
    'SRV.CODSRV', 0, NULL, 'Code');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('2391', 'frmListeTCHPCG01', 'CPR', 'SQCIND', 22, 
    'Serial number of the index of the meter', 'Serial number of the index of the meter', 0, 1, 0, 
    'CPR.SQCIND', 0, NULL, 'Serial number of the index of the meter');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('2392', 'frmListeTCHPCG01', 'CPR', 'IDTT3', 6, 
    'Associated typology ID 3', 'Associated typology ID 3', 0, 0, 0, 
    'CPR.IDTT3', 0, NULL, 'Associated typology ID 3');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('2393', 'frmListeTCHPCG01', 'CPR', 'IDTT4', 6, 
    'Associated typology ID 4', 'Associated typology ID 4', 0, 0, 0, 
    'CPR.IDTT4', 0, NULL, 'Associated typology ID 4');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('2394', 'frmListeTCHPCG01', 'CPR', 'A2', 40, 
    'Adaptable field string 2', 'Adaptable field string 2', 0, 0, 0, 
    'CPR.A2', 0, NULL, 'Adaptable field string 2');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('2395', 'frmListeTCHPCG01', 'CPR', 'A3', 40, 
    'Adaptable field string 3', 'Adaptable field string 3', 0, 0, 0, 
    'CPR.A3', 0, NULL, 'Adaptable field string 3');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('2396', 'frmListeTCHPCG01', 'CPR', 'C1', 22, 
    'Adaptable field check-box 1', 'Adaptable field check-box 1', 0, 0, 0, 
    'CPR.C1', 0, NULL, 'Adaptable field check-box 1');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('2397', 'frmListeTCHPCG01', 'CPR', 'D4', 7, 
    'Adaptable field date 4', 'Adaptable field date 4', 0, 0, 0, 
    'TO_CHAR(CPR.D4,''DD/MM/YYYY'')', 0, NULL, 'Adaptable field date 4');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('2398', 'frmListeTCHPCG01', 'CPR', 'D5', 7, 
    'Adaptable field date 5', 'Adaptable field date 5', 0, 0, 0, 
    'TO_CHAR(CPR.D5,''DD/MM/YYYY'')', 0, NULL, 'Adaptable field date 5');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('2399', 'frmListeTCHPCG01', 'CPR', 'NUMENQ', 22, 
    'Recensement', 'Recensement', 0, 1, 0, 
    'CPR.NUMENQ', 0, NULL, 'Recensement');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('2400', 'frmListeTCHPCG01', 'CPR', 'T4', 6, 
    'Adaptable field typology 4', 'Adaptable field typology 4', 0, 0, 0, 
    'CPR.T4', 0, NULL, 'Adaptable field typology 4');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('2401', 'frmListeTCHPCG01', 'CPR', 'N1', 22, 
    'Adaptable field number 1', 'Adaptable field number 1', 0, 0, 0, 
    'CPR.N1', 0, NULL, 'Adaptable field number 1');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('2402', 'frmListeTCHPCG01', 'CPR', 'N5', 22, 
    'Adaptable field number 5', 'Adaptable field number 5', 0, 0, 0, 
    'CPR.N5', 0, NULL, 'Adaptable field number 5');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('2403', 'frmListeTCHPCG01', 'CPR', 'D1', 7, 
    'Adaptable field date 1', 'Adaptable field date 1', 0, 0, 0, 
    'TO_CHAR(CPR.D1,''DD/MM/YYYY'')', 0, NULL, 'Adaptable field date 1');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('2404', 'frmListeTCHPCG01', 'CPR', 'IDTCPR', 22, 
    'Identifiant interne', 'Identifiant interne', 0, 1, 0, 
    'CPR.IDTCPR', 0, NULL, 'Identifiant interne');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('2405', 'frmListeTCHPCG01', 'CPR', 'IDTT1', 6, 
    'Associated typology ID 1', 'Associated typology ID 1', 0, 0, 0, 
    'CPR.IDTT1', 0, NULL, 'Associated typology ID 1');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('2406', 'frmListeTCHPCG01', 'CPR', 'N3', 22, 
    'Adaptable field number 3', 'Adaptable field number 3', 0, 0, 0, 
    'CPR.N3', 0, NULL, 'Adaptable field number 3');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('2407', 'frmListeTCHPCG01', 'CPR', 'DATMAJ', 7, 
    'Date de mise à jour', 'Date de mise à jour', 0, 1, 0, 
    'TO_CHAR(CPR.DATMAJ,''DD/MM/YYYY'')', 0, NULL, 'Date de mise à jour');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('2408', 'frmListeTCHPCG01', 'CPR', 'IDTTYPCPR', 6, 
    'Type de compteur', 'Type de compteur', 0, 1, 0, 
    'CPR.IDTTYPCPR', 0, NULL, 'Type de compteur');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('2409', 'frmListeTCHPCG01', 'CPR', 'A5', 40, 
    'Adaptable field string 5', 'Adaptable field string 5', 0, 0, 0, 
    'CPR.A5', 0, NULL, 'Adaptable field string 5');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('2410', 'frmListeTCHPCG01', 'CPR', 'C4', 22, 
    'Adaptable field check-box 4', 'Adaptable field check-box 4', 0, 0, 0, 
    'CPR.C4', 0, NULL, 'Adaptable field check-box 4');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('2411', 'frmListeTCHPCG01', 'CPR', 'C5', 22, 
    'Adaptable field check-box 5', 'Adaptable field check-box 5', 0, 0, 0, 
    'CPR.C5', 0, NULL, 'Adaptable field check-box 5');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('2412', 'frmListeTCHPCG01', 'CPR', 'DATAGR', 7, 
    'Date d''agrement', 'Date d''agrement', 0, 1, 0, 
    'TO_CHAR(CPR.DATAGR,''DD/MM/YYYY'')', 0, NULL, 'Date d''agrement');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('2413', 'frmListeTCHPCG01', 'CPR', 'IDTSQCGNR', 22, 
    'General identifier', 'General identifier', 0, 1, 0, 
    'CPR.IDTSQCGNR', 0, NULL, 'General identifier');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('2414', 'frmListeTCHPCG01', 'CPR', 'IDTAGT', 6, 
    'Employee ID', 'Employee ID', 0, 1, 0, 
    'CPR.IDTAGT', 0, NULL, 'Employee ID');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('2415', 'frmListeTCHPCG01', 'CPR', 'N4', 22, 
    'Adaptable field number 4', 'Adaptable field number 4', 0, 0, 0, 
    'CPR.N4', 0, NULL, 'Adaptable field number 4');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('2416', 'frmListeTCHPCG01', 'CPR', 'DATFBR', 7, 
    'Date de fabrication', 'Date de fabrication', 0, 1, 0, 
    'TO_CHAR(CPR.DATFBR,''DD/MM/YYYY'')', 0, NULL, 'Date de fabrication');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('2037', 'frmListeTCHPCG01', 'PNTLVR', 'CODGEO1', 5, 
    'Code géographique 1', 'Code du niveau 1', 0, 1, 0, 
    'PNTLVR.CODGEO1', 0, NULL, 'Code du niveau 1');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('2038', 'frmListeTCHPCG01', 'PNTLVR', 'CODGEO2', 4, 
    'Code géographique 2', 'Code du niveau 2', 0, 1, 0, 
    'PNTLVR.CODGEO2', 0, NULL, 'Code du niveau 2');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('2039', 'frmListeTCHPCG01', 'PNTLVR', 'CODGEO3', 4, 
    'Code géographique 3', 'Code du niveau 3', 0, 1, 0, 
    'PNTLVR.CODGEO3', 0, NULL, 'Code du niveau 3');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('2040', 'frmListeTCHPCG01', 'PNTLVR', 'CODGEO4', 4, 
    'Code géographique 4', 'Code du niveau 4', 0, 1, 0, 
    'PNTLVR.CODGEO4', 0, NULL, 'Code du niveau 4');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('2041', 'frmListeTCHPCG01', 'PNTLVR', 'CODGEO5', 4, 
    'Code géographique 5', 'Code du niveau 5', 0, 1, 0, 
    'PNTLVR.CODGEO5', 0, NULL, 'Code du niveau 5');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('2042', 'frmListeTCHPCG01', 'PNTLVR', 'CODGEO6', 4, 
    'Code géographique 6', 'Code du niveau 6', 0, 1, 0, 
    'PNTLVR.CODGEO6', 0, NULL, 'Code du niveau 6');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('2043', 'frmListeTCHPCG01', 'PNTLVR', 'IDTENQ', 22, 
    'Investigation ID', 'Investigation ID', 0, 1, 0, 
    'PNTLVR.IDTENQ', 0, NULL, 'Investigation ID');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('2044', 'frmListeTCHPCG01', 'PNTLVR', 'IDTSQCGNR', 22, 
    'General identifier', 'General identifier', 0, 0, 0, 
    'PNTLVR.IDTSQCGNR', 0, NULL, 'General identifier');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('2045', 'frmListeTCHPCG01', 'PNTLVR', 'T1', 6, 
    'Adaptable field typologie 1', 'Adaptable field typologie 1', 0, 0, 0, 
    'PNTLVR.T1', 0, NULL, 'Adaptable field typologie 1');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('2046', 'frmListeTCHPCG01', 'PNTLVR', 'IDTT1', 6, 
    'Associated typology ID 1', 'Associated typology ID 1', 0, 0, 0, 
    'PNTLVR.IDTT1', 0, NULL, 'Associated typology ID 1');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('2047', 'frmListeTCHPCG01', 'PNTLVR', 'T2', 6, 
    'Adaptable field typologie 2', 'Adaptable field typologie 2', 0, 0, 0, 
    'PNTLVR.T2', 0, NULL, 'Adaptable field typologie 2');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('2048', 'frmListeTCHPCG01', 'PNTLVR', 'IDTT2', 6, 
    'Associated typology ID 2', 'Associated typology ID 2', 0, 0, 0, 
    'PNTLVR.IDTT2', 0, NULL, 'Associated typology ID 2');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('2049', 'frmListeTCHPCG01', 'PNTLVR', 'T3', 6, 
    'Adaptable field typologie 3', 'Adaptable field typologie 3', 0, 0, 0, 
    'PNTLVR.T3', 0, NULL, 'Adaptable field typologie 3');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('2050', 'frmListeTCHPCG01', 'PNTLVR', 'IDTT3', 6, 
    'Associated typology ID 3', 'Associated typology ID 3', 0, 0, 0, 
    'PNTLVR.IDTT3', 0, NULL, 'Associated typology ID 3');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('2051', 'frmListeTCHPCG01', 'PNTLVR', 'T4', 6, 
    'Adaptable field typologie 4', 'Adaptable field typologie 4', 0, 0, 0, 
    'PNTLVR.T4', 0, NULL, 'Adaptable field typologie 4');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('2052', 'frmListeTCHCPR01', 'CPR', 'N1', 22, 
    'Adaptable field number 1', 'Adaptable field number 1', 0, 0, 0, 
    'CPR.N1', 0, NULL, 'Adaptable field number 1');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('2053', 'frmListeTCHCPR01', 'CPR', 'N2', 22, 
    'Adaptable field number 2', 'Adaptable field number 2', 0, 0, 0, 
    'CPR.N2', 0, NULL, 'Adaptable field number 2');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('2054', 'frmListeTCHCPR01', 'CPR', 'N3', 22, 
    'Adaptable field number 3', 'Adaptable field number 3', 0, 0, 0, 
    'CPR.N3', 0, NULL, 'Adaptable field number 3');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('2055', 'frmListeTCHCPR01', 'CPR', 'N4', 22, 
    'Adaptable field number 4', 'Adaptable field number 4', 0, 0, 0, 
    'CPR.N4', 0, NULL, 'Adaptable field number 4');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('2056', 'frmListeTCHCPR01', 'CPR', 'N5', 22, 
    'Adaptable field number 5', 'Adaptable field number 5', 0, 0, 0, 
    'CPR.N5', 0, NULL, 'Adaptable field number 5');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('2057', 'frmListeTCHCPR01', 'CPR', 'C1', 22, 
    'Adaptable field check-box 1', 'Adaptable field check-box 1', 0, 0, 0, 
    'CPR.C1', 0, NULL, 'Adaptable field check-box 1');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('2058', 'frmListeTCHPCG01', 'TYPCPG', 'IDTTYPCPG', 22, 
    'Internal metering type ID', 'Internal metering type ID', 0, 1, 0, 
    'TYPCPG.IDTTYPCPG', 0, NULL, 'Internal metering type ID');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('2059', 'frmListeTCHPCG01', 'TYPCPG', 'TYPCPG', 6, 
    'External metering type ID', 'Code du type de comptage', 0, 1, 1, 
    'TYPCPG.TYPCPG', 4, NULL, 'Code du type de comptage');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('2060', 'frmListeTCHPCG01', 'TYPCPG', 'LIB', 254, 
    'Description', 'Description', 0, 1, 0, 
    'TYPCPG.LIB', 0, NULL, 'Description');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('2061', 'frmListeTCHPCG01', 'TYPCPG', 'LIBABR', 127, 
    'Short wording', 'Short wording', 0, 1, 0, 
    'TYPCPG.LIBABR', 0, NULL, 'Short wording');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('2062', 'frmListeTCHPCG01', 'TYPCPG', 'LIBINT', 40, 
    'Internal description in english for maintenance purpose', 'Internal description in english for maintenance purpose', 0, 1, 0, 
    'TYPCPG.LIBINT', 0, NULL, 'Internal description in english for maintenance purpose');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('2063', 'frmListeTCHPCG01', 'TYPCPG', 'VLRDFT', 22, 
    'Default value (1 <TRUE>, 0 <FALSE>)', 'Default value (1 <TRUE>, 0 <FALSE>)', 0, 0, 0, 
    'TYPCPG.VLRDFT', 0, NULL, 'Default value (1 <TRUE>, 0 <FALSE>)');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('2064', 'frmListeTCHPCG01', 'TYPCPG', 'UTL', 22, 
    'Used (1 <TRUE>, 0 <FALSE>)', 'Used (1 <TRUE>, 0 <FALSE>)', 0, 0, 0, 
    'TYPCPG.UTL', 0, NULL, 'Used (1 <TRUE>, 0 <FALSE>)');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('2065', 'frmListeTCHPCG01', 'TYPCPG', 'SST', 22, 
    'Indicates system data in the table (1 <TRUE>, 0 <FALSE>)', 'Indicates system data in the table (1 <TRUE>, 0 <FALSE>)', 0, 0, 0, 
    'TYPCPG.SST', 0, NULL, 'Indicates system data in the table (1 <TRUE>, 0 <FALSE>)');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('2066', 'frmListeTCHPCG01', 'TYPCPG', 'ESTAUT', 22, 
    'Estimation allowed (1 <TRUE>, 0 <FALSE>)', 'Estimation allowed (1 <TRUE>, 0 <FALSE>)', 0, 1, 0, 
    'TYPCPG.ESTAUT', 0, NULL, 'Estimation allowed (1 <TRUE>, 0 <FALSE>)');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('2067', 'frmListeTCHPCG01', 'TYPCPG', 'IDTSRV', 22, 
    'Service', 'Service', 0, 1, 0, 
    'TYPCPG.IDTSRV', 0, NULL, 'Service');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('2068', 'frmListeTCHCPR01', 'CPR', 'C2', 22, 
    'Adaptable field check-box 2', 'Adaptable field check-box 2', 0, 0, 0, 
    'CPR.C2', 0, NULL, 'Adaptable field check-box 2');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('2069', 'frmListeTCHCPR01', 'CPR', 'C3', 22, 
    'Adaptable field check-box 3', 'Adaptable field check-box 3', 0, 0, 0, 
    'CPR.C3', 0, NULL, 'Adaptable field check-box 3');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('2070', 'frmListeTCHCPR01', 'CPR', 'C4', 22, 
    'Adaptable field check-box 4', 'Adaptable field check-box 4', 0, 0, 0, 
    'CPR.C4', 0, NULL, 'Adaptable field check-box 4');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('2071', 'frmListeTCHCPR01', 'CPR', 'C5', 22, 
    'Adaptable field check-box 5', 'Adaptable field check-box 5', 0, 0, 0, 
    'CPR.C5', 0, NULL, 'Adaptable field check-box 5');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('2072', 'frmListeTCHCPR01', 'CPR', 'D1', 7, 
    'Adaptable field date 1', 'Adaptable field date 1', 0, 0, 0, 
    'TO_CHAR(CPR.D1,''DD/MM/YYYY'')', 0, NULL, 'Adaptable field date 1');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('2073', 'frmListeTCHCPR01', 'CPR', 'D2', 7, 
    'Adaptable field date 2', 'Adaptable field date 2', 0, 0, 0, 
    'TO_CHAR(CPR.D2,''DD/MM/YYYY'')', 0, NULL, 'Adaptable field date 2');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('2074', 'frmListeTCHCPR01', 'CPR', 'D3', 7, 
    'Adaptable field date 3', 'Adaptable field date 3', 0, 0, 0, 
    'TO_CHAR(CPR.D3,''DD/MM/YYYY'')', 0, NULL, 'Adaptable field date 3');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('2075', 'frmListeTCHCPR01', 'CPR', 'D4', 7, 
    'Adaptable field date 4', 'Adaptable field date 4', 0, 0, 0, 
    'TO_CHAR(CPR.D4,''DD/MM/YYYY'')', 0, NULL, 'Adaptable field date 4');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('2076', 'frmListeTCHCPR01', 'CPR', 'D5', 7, 
    'Adaptable field date 5', 'Adaptable field date 5', 0, 0, 0, 
    'TO_CHAR(CPR.D5,''DD/MM/YYYY'')', 0, NULL, 'Adaptable field date 5');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('2077', 'frmListeTCHCPR01', 'CPR', 'IDTCODOBS', 22, 
    'Observation code ID', 'Observation code ID', 0, 1, 0, 
    'CPR.IDTCODOBS', 0, NULL, 'Observation code ID');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('2078', 'frmListeCMMCTR01', 'CLT', 'ADRSTR1', 50, 
    'Description of structured address 1', 'Description of structured address 1', 0, 0, 0, 
    'CLT.ADRSTR1', 0, NULL, 'Description of structured address 1');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('2079', 'frmListeCMMCTR01', 'CLT', 'ADRSTR2', 50, 
    'Description of structured address 2', 'Description of structured address 2', 0, 0, 0, 
    'CLT.ADRSTR2', 0, NULL, 'Description of structured address 2');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('2080', 'frmListeCMMCTR01', 'CLT', 'ADRSTR3', 50, 
    'Description of structured address 3', 'Description of structured address 3', 0, 0, 0, 
    'CLT.ADRSTR3', 0, NULL, 'Description of structured address 3');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('2081', 'frmListeCMMCTR01', 'CLT', 'ADRSTR4', 50, 
    'Description of structured address 4', 'Description of structured address 4', 0, 0, 0, 
    'CLT.ADRSTR4', 0, NULL, 'Description of structured address 4');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('2082', 'frmListeCMMCTR01', 'CLT', 'ADRSTR5', 50, 
    'Description of structured address 5', 'Description of structured address 5', 0, 0, 0, 
    'CLT.ADRSTR5', 0, NULL, 'Description of structured address 5');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('2083', 'frmListeCMMCTR01', 'CLT', 'ADRSTR6', 50, 
    'Description of structured address 6', 'Description of structured address 6', 0, 0, 0, 
    'CLT.ADRSTR6', 0, NULL, 'Description of structured address 6');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('2084', 'frmListeCMMCTR01', 'CLT', 'ADRSTR7', 50, 
    'Description of structured address 7', 'Description of structured address 7', 0, 0, 0, 
    'CLT.ADRSTR7', 0, NULL, 'Description of structured address 7');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('2085', 'frmListeCMMCTR01', 'CLT', 'ADRSTR8', 50, 
    'Description of structured address 8', 'Description of structured address 8', 0, 0, 0, 
    'CLT.ADRSTR8', 0, NULL, 'Description of structured address 8');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('2086', 'frmListeCMMCTR01', 'CLT', 'ADRSTR9', 254, 
    'Description of structured address 9', 'Description of structured address 9', 0, 0, 0, 
    'CLT.ADRSTR9', 0, NULL, 'Description of structured address 9');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('2087', 'frmListeCMMCTR01', 'CLT', 'ADRSTR10', 50, 
    'Description of structured address 10', 'Description of structured address 10', 0, 0, 0, 
    'CLT.ADRSTR10', 0, NULL, 'Description of structured address 10');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('2088', 'frmListeCMMCTR01', 'CLT', 'CHPLIB5', 254, 
    'Lib 5', 'Lib 5', 0, 0, 0, 
    'CLT.CHPLIB5', 0, NULL, 'Lib 5');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('2089', 'frmListeCMMCTR01', 'CLT', 'TLP', 20, 
    'Telephone portable', 'Telephone portable', 0, 1, 0, 
    'CLT.TLP', 0, NULL, 'Telephone portable');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('2090', 'frmListeCMMCTR01', 'CLT', 'MAIL', 40, 
    'Messagerie electronique', 'Messagerie electronique', 0, 1, 0, 
    'CLT.MAIL', 0, NULL, 'Messagerie electronique');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('2091', 'frmListeTCHCPR01', 'CPR', 'DATGRN', 7, 
    'Date de garantie', 'Date de garantie', 0, 1, 0, 
    'TO_CHAR(CPR.DATGRN,''DD/MM/YYYY'')', 0, NULL, 'Date de garantie');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('2092', 'frmListeTCHCPR01', 'CPR', 'DATRVS', 7, 
    'Date de revision', 'Date de revision', 0, 1, 0, 
    'TO_CHAR(CPR.DATRVS,''DD/MM/YYYY'')', 0, NULL, 'Date de revision');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('2093', 'frmListeTCHCPR01', 'CPR', 'DATMAJ', 7, 
    'Date de mise à jour', 'Date de mise à jour', 0, 1, 1, 
    'TO_CHAR(CPR.DATMAJ,''DD/MM/YYYY'')', 11, NULL, 'Date de mise à jour');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('2094', 'frmListeTCHCPR01', 'CPR', 'NUMENQ', 22, 
    'Recensement', 'Recensement', 0, 1, 0, 
    'CPR.NUMENQ', 0, NULL, 'Recensement');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('2095', 'frmListeTCHCPR01', 'TYPCPR', 'IDTTYPCPR', 6, 
    'Internal ID (type of meter ID)', 'Internal ID (type of meter ID)', 0, 1, 0, 
    'TYPCPR.IDTTYPCPR', 0, NULL, 'Internal ID (type of meter ID)');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('2096', 'frmListeTCHCPR01', 'TYPCPR', 'IDTUNTMSRDMT', 22, 
    'Diameter / calibre unit of measure ID', 'Diameter / calibre unit of measure ID', 0, 1, 0, 
    'TYPCPR.IDTUNTMSRDMT', 0, NULL, 'Diameter / calibre unit of measure ID');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('2097', 'frmListeTCHCPR01', 'TYPCPR', 'IDTUNTMSR', 22, 
    'Unit of measure ID', 'Unit of measure ID', 0, 1, 0, 
    'TYPCPR.IDTUNTMSR', 0, NULL, 'Unit of measure ID');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('2098', 'frmListeTCHCPR01', 'TYPCPR', 'IDTTCHCMP', 22, 
    'Metering technique ID', 'Metering technique ID', 0, 1, 0, 
    'TYPCPR.IDTTCHCMP', 0, NULL, 'Metering technique ID');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('2099', 'frmListeTCHCPR01', 'TYPCPR', 'IDTSRV', 22, 
    'Service ID (1 <WATER>, 2 <LV electricity>, 3 <MV electricity>, ...)', 'Service ID (1 <WATER>, 2 <LV electricity>, 3 <MV electricity>, ...)', 0, 1, 0, 
    'TYPCPR.IDTSRV', 0, NULL, 'Service ID (1 <WATER>, 2 <LV electricity>, 3 <MV electricity>, ...)');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('2100', 'frmListeTCHCPR01', 'TYPCPR', 'FBR', 20, 
    'Manufacturer', 'Manufacturer', 0, 1, 1, 
    'TYPCPR.FBR', 3, NULL, 'Manufacturer');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('2101', 'frmListeTCHCPR01', 'TYPCPR', 'MDL', 20, 
    'Modele du compteur', 'Modele du compteur', 0, 1, 1, 
    'TYPCPR.MDL', 5, NULL, 'Modele du compteur');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('2102', 'frmListeTCHCPR01', 'TYPCPR', 'NBRCDR', 22, 
    'Nombre de cadran', 'Nombre de cadran', 0, 1, 0, 
    'TYPCPR.NBRCDR', 0, NULL, 'Nombre de cadran');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('2103', 'frmListeTCHCPR01', 'TYPCPR', 'NBRCND', 22, 
    'Monophase (2 wires) or triphase (4 wires)', 'Monophase (2 wires) or triphase (4 wires)', 0, 1, 0, 
    'TYPCPR.NBRCND', 0, NULL, 'Monophase (2 wires) or triphase (4 wires)');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('2104', 'frmListeTCHCPR01', 'TYPCPR', 'NBRROU', 22, 
    'Nombre de roues', 'Nombre de roues', 0, 1, 0, 
    'TYPCPR.NBRROU', 0, NULL, 'Nombre de roues');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('2105', 'frmListeTCHCPR01', 'TYPCPR', 'CLBMAX', 22, 
    'Calibre maximum', 'Calibre maximum', 0, 1, 0, 
    'TYPCPR.CLBMAX', 0, NULL, 'Calibre maximum');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('2106', 'frmListeTCHCPR01', 'TYPCPR', 'CLBMIN', 22, 
    'Calibre minimum', 'Calibre minimum', 0, 1, 0, 
    'TYPCPR.CLBMIN', 0, NULL, 'Calibre minimum');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('2107', 'frmListeTCHCPR01', 'TYPCPR', 'DMT', 22, 
    'Diametre', 'Diametre', 0, 1, 1, 
    'TYPCPR.DMT', 6, NULL, 'Diametre');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('2108', 'frmListeTCHCPR01', 'TYPCPR', 'CFF', 22, 
    'Facteur de multiplication de certains compteur', 'Facteur de multiplication de certains compteur', 0, 1, 0, 
    'TYPCPR.CFF', 0, NULL, 'Facteur de multiplication de certains compteur');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('2109', 'frmListeTCHCPR01', 'TYPCPR', 'MRQ', 20, 
    'Marque', 'Marque', 0, 1, 1, 
    'TYPCPR.MRQ', 4, NULL, 'Marque');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('2110', 'frmListeTCHCPR01', 'TYPCPR', 'CLS', 1, 
    'Information technique', 'Information technique', 0, 1, 0, 
    'TYPCPR.CLS', 0, NULL, 'Information technique');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('2111', 'frmListeTCHCPR01', 'TYPCPR', 'CPC', 22, 
    'Capacite du point de comptage', 'Capacite du point de comptage', 0, 1, 0, 
    'TYPCPR.CPC', 0, NULL, 'Capacite du point de comptage');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('2112', 'frmListeTCHCPR01', 'TYPCPR', 'UTL', 22, 
    'Used (1 <TRUE>,0 <FALSE>)', 'Used (1 <TRUE>,0 <FALSE>)', 0, 1, 0, 
    'TYPCPR.UTL', 0, NULL, 'Used (1 <TRUE>,0 <FALSE>)');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('2113', 'frmListeTCHCPR01', 'CPRPNTCPG', 'IDTCPR', 22, 
    'Meter ID', 'Meter ID', 0, 1, 0, 
    'CPRPNTCPG.IDTCPR', 0, NULL, 'Meter ID');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('2114', 'frmListeTCHCPR01', 'CPRPNTCPG', 'IDTPNTLVR', 22, 
    'Delivery point ID', 'Delivery point ID', 0, 1, 0, 
    'CPRPNTCPG.IDTPNTLVR', 0, NULL, 'Delivery point ID');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('2115', 'frmListeTCHCPR01', 'CPRPNTCPG', 'IDTPNTCPG', 22, 
    'Metering point ID', 'Metering point ID', 0, 1, 0, 
    'CPRPNTCPG.IDTPNTCPG', 0, NULL, 'Metering point ID');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('2116', 'frmListeTCHCPR01', 'CPRPNTCPG', 'DATPOS', 7, 
    'Date de pose', 'Date de pose', 0, 1, 1, 
    'TO_CHAR(CPRPNTCPG.DATPOS,''DD/MM/YYYY'')', 8, NULL, 'Date de pose');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('2117', 'frmListeTCHCPR01', 'CPRPNTCPG', 'DATDPS', 7, 
    'Date de depose', 'Date de depose', 0, 1, 1, 
    'TO_CHAR(CPRPNTCPG.DATDPS,''DD/MM/YYYY'')', 9, NULL, 'Date de depose');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('2118', 'frmListeTCHCPR01', 'CPRPNTCPG', 'TYPCPRFAC', 6, 
    'Type de compteur facture', 'Type de compteur facture', 0, 1, 0, 
    'CPRPNTCPG.TYPCPRFAC', 0, NULL, 'Type de compteur facture');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('2119', 'frmListeTCHCPR01', 'CPRPNTCPG', 'IDCRLV', 40, 
    'Note du releveur', 'Note du releveur', 0, 1, 0, 
    'CPRPNTCPG.IDCRLV', 0, NULL, 'Note du releveur');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('2120', 'frmListeTCHCPR01', 'CPRPNTCPG', 'CFTCOR', 22, 
    'Coefficient de correction', 'Coefficient de correction', 0, 1, 0, 
    'CPRPNTCPG.CFTCOR', 0, NULL, 'Coefficient de correction');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('2121', 'frmListeTCHPCG01', 'SRV', 'CODSRV', 6, 
    'Service', 'Code', 0, 1, 1, 
    'SRV.CODSRV', 6, NULL, 'Code');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('2122', 'frmListeCMMCTR01', 'FACTYP', 'FACABN', 22, 
    'Facture d''abonnement', 'Facture d''abonnement', 0, 1, 0, 
    'FACTYP.FACABN', 0, NULL, 'Facture d''abonnement');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('2123', 'frmListeCMMCTR01', 'FACTYP', 'IDTSRV', 22, 
    'Code du service', 'Code du service', 0, 1, 0, 
    'FACTYP.IDTSRV', 0, NULL, 'Code du service');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('2124', 'frmListeCMMCTR01', 'FACTYP', 'RGMCPT', 22, 
    'Regime compte', 'Regime compte', 0, 1, 0, 
    'FACTYP.RGMCPT', 0, NULL, 'Regime compte');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('2125', 'frmListeCMMCTR01', 'FACTYP', 'IDTFACTYP', 22, 
    'Code', 'Facture type', 0, 1, 0, 
    'FACTYP.IDTFACTYP', 0, NULL, 'Facture type');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('2126', 'frmListeCMMCTR01', 'BNQ', 'LIBABR', 22, 
    'Libelle de la banque', 'Libelle de la banque', 0, 1, 0, 
    'BNQ.LIBABR', 0, NULL, 'Libelle de la banque');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('2127', 'frmListeCMMCTR01', 'OPR', 'MNT', 22, 
    'Montant de l''opération', 'Montant', 0, 1, 0, 
    'OPR.MNT', 0, NULL, 'Montant');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('2128', 'frmListeCMMCTR01', 'OPR', 'RFR', 30, 
    'Reference', 'Reference', 0, 1, 0, 
    'OPR.RFR', 0, NULL, 'Reference');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('2129', 'frmListeCMMCTR01', 'OPR', 'SLD', 22, 
    'Solde de l''opération', 'Solde de l''operation', 0, 1, 0, 
    'OPR.SLD', 0, NULL, 'Solde de l''operation');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('2130', 'frmListeCMMCTR01', 'OPR', 'DATCRT', 22, 
    'Date de l''operation', 'Date de creation', 0, 1, 0, 
    'TO_CHAR(OPR.DATCRT,X7UTIL.FRMDAT)', 0, NULL, 'Date de creation');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('2131', 'frmListeCMMCTR01', 'CPTCLT', 'CPTDVS', 22, 
    'Compte en devise', 'Compte en devise', 0, 1, 0, 
    'CPTCLT.CPTDVS', 0, NULL, 'Compte en devise');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('2132', 'frmListeCMMCTR01', 'CPTCLT', 'DATFRM', 7, 
    'Date de fermeture', 'Date de fermeture', 0, 1, 0, 
    'TO_CHAR(CPTCLT.DATFRM,X7UTIL.FRMDAT)', 0, NULL, 'Date de fermeture');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('2133', 'frmListeCMMCTR01', 'CPTCLT', 'DATOVR', 7, 
    'Date d''ouverture', 'Date d''ouverture', 0, 1, 0, 
    'TO_CHAR(CPTCLT.DATOVR,X7UTIL.FRMDAT)', 0, NULL, 'Date d''ouverture');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('2134', 'frmListeCMMCTR01', 'CPTCLT', 'IDTBNQ', 22, 
    'Code banque', 'Code banque', 0, 1, 0, 
    'CPTCLT.IDTBNQ', 0, NULL, 'Code banque');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('2135', 'frmListeCMMCTR01', 'CPTCLT', 'IDTDVS', 22, 
    'Devise', 'Devise', 0, 1, 0, 
    'CPTCLT.IDTDVS', 0, NULL, 'Devise');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('2136', 'frmListeCMMCTR01', 'CPTCLT', 'DATDRNRLC', 22, 
    'Date de derniere relance', 'Date de derniere relance', 0, 1, 0, 
    'TO_CHAR(CPTCLT.DATDRNRLC,X7UTIL.FRMDAT)', 0, NULL, 'Date de derniere relance');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('2137', 'frmListeCMMCTR01', 'CPTCLT', 'DATINTRTR', 7, 
    'Date du dernier calcul des interets de retard', 'Date du dernier calcul des interets de retard', 0, 1, 0, 
    'TO_CHAR(CPTCLT.DATINTRTR,X7UTIL.FRMDAT)', 0, NULL, 'Date du dernier calcul des interets de retard');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('2138', 'frmListeCMMCTR01', 'CPTCLT', 'DATMAJSLD', 7, 
    'Date de mise a jour du solde', 'Date de mise a jour du solde', 0, 1, 0, 
    'TO_CHAR(CPTCLT.DATMAJSLD,X7UTIL.FRMDAT)', 0, NULL, 'Date de mise a jour du solde');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('2139', 'frmListeCMMCTR01', 'CPTCLT', 'DATMAJCPTCLT', 7, 
    'Date de mise a jour du compte client', 'Date de mise a jour du compte client', 0, 1, 0, 
    'TO_CHAR(CPTCLT.DATMAJCPTCLT,X7UTIL.FRMDAT)', 0, NULL, 'Date de mise a jour du compte client');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('2140', 'frmListeCMMCTR01', 'CPTCLT', 'ECHEANCIERENCOURS( CPTCLT.IDTCLT )', 22, 
    'Echeancier en cours', 'Echeancier en cours', 0, 1, 0, 
    'ECHEANCIERENCOURS( CPTCLT.IDTCLT )', 0, NULL, 'Echeancier en cours');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('2141', 'frmListeCMMCTR01', 'CPTCLT', 'DATCRT', 22, 
    'Date oper', 'Date oper', 0, 1, 0, 
    '(SELECT TO_CHAR(MAX(DATCRT),X7UTIL.FRMDAT)DATCRT FROM OPR WHERE CPTCLT.IDTCLT=OPR.IDTCLT)', 0, NULL, 'Date oper');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('2142', 'frmListeCMMCLT01', 'FAC', 'ORG', 1, 
    'Origine de la facture', 'Origine de la facture', 0, 1, 0, 
    'FAC.ORG', 0, NULL, 'Origine de la facture');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('2143', 'frmListeCMMCLT01', 'FAC', 'MNTHT', 22, 
    'Montant HT', 'Montant HT', 0, 1, 0, 
    'FAC.MNTHT', 0, NULL, 'Montant HT');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('2144', 'frmListeCMMCLT01', 'FAC', 'BRDRGR', 16, 
    'Code du bordereau de regroupement', 'Code du bordereau de regroupement', 0, 1, 0, 
    'FAC.BRDRGR', 0, NULL, 'Code du bordereau de regroupement');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('2145', 'frmListeCMMCLT01', 'FAC', 'CATCLT', 6, 
    'Categorie du client', 'Categorie du client', 0, 1, 0, 
    'FAC.CATCLT', 0, NULL, 'Categorie du client');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('2146', 'frmListeCMMCLT01', 'FAC', 'CODRGR', 6, 
    'Code de regroupement', 'Code de regroupement', 0, 1, 0, 
    'FAC.CODRGR', 0, NULL, 'Code de regroupement');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('2147', 'frmListeCMMCLT01', 'FAC', 'CODVLD', 22, 
    'Code de validation', 'Code de validation', 0, 1, 0, 
    'FAC.CODVLD', 0, NULL, 'Code de validation');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('2148', 'frmListeCMMCLT01', 'FAC', 'DATCLC', 7, 
    'Date de calcul', 'Date de calcul', 0, 1, 0, 
    'TO_CHAR(FAC.DATCLC,X7UTIL.FRMDAT)', 0, NULL, 'Date de calcul');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('2149', 'frmListeCMMCLT01', 'FAC', 'DATCNV', 7, 
    'Date de validation du taux de la devise', 'Date de validation du taux de la devise', 0, 1, 0, 
    'TO_CHAR(FAC.DATCNV,X7UTIL.FRMDAT)', 0, NULL, 'Date de validation du taux de la devise');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('2150', 'frmListeCMMCLT01', 'FAC', 'DATEXG', 7, 
    'Date d''exigibilite', 'Date d''exigibilite', 0, 1, 0, 
    'TO_CHAR(FAC.DATEXG,X7UTIL.FRMDAT)', 0, NULL, 'Date d''exigibilite');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('2151', 'frmListeCMMCLT01', 'FAC', 'DESEMP', 22, 
    'Facture annulee avec desempilage', 'Facture annulee avec desempilage', 0, 1, 0, 
    'FAC.DESEMP', 0, NULL, 'Facture annulee avec desempilage');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('2152', 'frmListeCMMCLT01', 'FAC', 'FCTANN', 1, 
    'Facture annulée', 'Facture annulée', 0, 1, 0, 
    'FAC.FCTANN', 0, NULL, 'Facture annulée');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('2153', 'frmListeCMMCLT01', 'FAC', 'MNTTVA', 22, 
    'Montant TVA', 'Montant TVA', 0, 1, 0, 
    'FAC.MNTTVA', 0, NULL, 'Montant TVA');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('2154', 'frmListeCMMCLT01', 'FAC', 'NUMFCT', 22, 
    'Numero', 'Numero', 0, 1, 0, 
    'FAC.NUMFCT', 0, NULL, 'Numero');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('2155', 'frmListeCMMCLT01', 'FAC', 'DATDRNPEN', 7, 
    'Date de fin du dernier calcul de penalites', 'Date de fin du dernier calcul de penalites', 0, 1, 0, 
    'TO_CHAR(FAC.DATDRNPEN,X7UTIL.FRMDAT)', 0, NULL, 'Date de fin du dernier calcul de penalites');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('2156', 'frmListeCMMCLT01', 'FAC', 'ECHPMTREG', 22, 
    'Regularisation de l''echeancier', 'Regularisation de l''echeancier', 0, 1, 0, 
    'FAC.ECHPMTREG', 0, NULL, 'Regularisation de l''echeancier');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('2157', 'frmListeCMMCLT01', 'FAC', 'IDTAGTCLC', 6, 
    'Code de l''agent calculateur', 'Code de l''agent calculateur', 0, 1, 0, 
    'FAC.IDTAGTCLC', 0, NULL, 'Code de l''agent calculateur');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('2158', 'frmListeCMMCLT01', 'FAC', 'IDTCNTOPR', 22, 
    'Centre operationnel', 'Centre operationnel', 0, 1, 0, 
    'FAC.IDTCNTOPR', 0, NULL, 'Centre operationnel');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('2159', 'frmListeCMMCLT01', 'FAC', 'IDTLOTFAC', 22, 
    'Lot de facturation', 'Lot de facturation', 0, 1, 0, 
    'FAC.IDTLOTFAC', 0, NULL, 'Lot de facturation');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('2160', 'frmListeCMMCLT01', 'FAC', 'MNTCRTAFF', 22, 
    'Montant du credit assigne', 'Montant du credit assigne', 0, 1, 0, 
    'FAC.MNTCRTAFF', 0, NULL, 'Montant du credit assigne');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('2161', 'frmListeCMMCLT01', 'FAC', 'MNTDPTGRNAFF', 22, 
    'Compte de depot de garanti', 'Compte de depot de garanti', 0, 1, 0, 
    'FAC.MNTDPTGRNAFF', 0, NULL, 'Compte de depot de garanti');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('2162', 'frmListeCMMCLT01', 'FAC', 'MNTHT+FAC.MNTTVA', 22, 
    'Montant TTC', 'Montant TTC', 0, 1, 0, 
    'FAC.MNTHT+FAC.MNTTVA', 0, NULL, 'Montant TTC');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('2163', 'frmListeCMMCLT01', 'FAC', 'TYPFCT', 22, 
    'Type de facture', 'Type de facture', 0, 1, 0, 
    '(SELECT TYPFCT FROM TYPFCT TF WHERE TF.IDTTYPFCT = FAC.IDTTYPFCT)', 0, NULL, 'Type de facture');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('2164', 'frmListeTCHPLV01', 'PNTLVR', 'IDTPNTLVR', 200, 
    'Code', 'Identifiant interne', 0, 1, 1, 
    'substr(X7UTIL.LIBPNTLVR(PNTLVR.IDTPNTLVR),1,250)', 1, NULL, 'Identifiant interne');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('2165', 'frmListeTCHPLV01', 'PNTLVR', 'Occupé', 20, 
    'Occupé', 'Occupé', 0, 1, 1, 
    'DECODE(PNTLVR.Occ,1,''Oui'',''Non'')', 2, NULL, 'Occupé');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('2166', 'frmListeTCHPLV01', 'PNTLVR', 'Datmaj', 20, 
    'Mise à jour le:', 'Date de mise a jour', 0, 1, 1, 
    'TO_CHAR(PNTLVR.DATMAJ,X7UTIL.FRMDAT)', 3, NULL, 'Date de mise a jour');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('2167', 'frmListeTCHPLV01', 'PNTLVR', 'ADRLBR', 2000, 
    'Adresse', 'Adresse', 0, 1, 1, 
    'SUBSTR(REPLACE(REPLACE(PNTLVR.ADRLBR,CHR(10),'' ''),CHR(13),'' ''),1,254)', 4, NULL, 'Adresse');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('2168', 'frmListeTCHPLV01', 'PNTLVR', 'IdtCntOpr', 10, 
    'CO', 'CO', 0, 1, 1, 
    'PNTLVR.IdtCntOpr', 5, NULL, 'CO');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('2169', 'frmListeCLTCPT01', 'CPTCLT', 'IDTCLT', 6, 
    'Numéro', 'Numéro', 1, 1, 0, 
    'CPTCLT.IDTCLT', 1, NULL, 'Numéro');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('2170', 'frmListeCLTCPT01', 'CLT', 'NOM', 40, 
    'Nom', 'Nom', 0, 1, 1, 
    'CLT.NOM', 2, NULL, 'Nom');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('2171', 'frmListeCLTCPT01', 'CPTCLT', 'IDTDVS', 6, 
    'Devise', 'Devise', 0, 1, 1, 
    'CPTCLT.IDTDVS', 3, NULL, 'Devise');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('2172', 'frmListeCLTCPT01', 'CLT', 'Solde global', 6, 
    'Solde global', 'Solde global', 0, 1, 1, 
    'NVL( SldGlb( CLT.IdtClt, 1 ), 0 )', 4, NULL, 'Solde global');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('2173', 'frmListeCLTCPT01', 'CLT', 'Solde exigible', 6, 
    'Solde exigible', 'Solde exigible', 0, 1, 1, 
    'NVL( SldExg( CLT.IdtClt, 1 ), 0 )', 5, NULL, 'Solde exigible');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('2174', 'frmListeCLTCPT01', 'CLT', 'Echéancier', 6, 
    'Echéancier', 'Echéancier', 0, 1, 1, 
    'DECODE(EcheancierEnCours( CPTCLT.IdtClt ),0,''non'',''oui'')', 6, NULL, 'Echéancier');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('2175', 'frmListeCLTCPT01', 'CPTCLT', 'IDTCNTOPR', 6, 
    'CO', 'CO', 0, 1, 1, 
    'CPTCLT.IdtCntOpr', 7, NULL, 'CO');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('2176', 'frmListeCLTCPT01', 'CPTCLT', 'IDTCNTSNS', 6, 
    'CS', 'CS', 0, 1, 1, 
    'CPTCLT.IdtCodSns', 8, NULL, 'CS');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('2177', 'frmListeAFFCNT01', 'AFF', 'DATCRT', 22, 
    'Date de creation', 'Date de creation', 0, 1, 0, 
    'TO_CHAR(AFF.DATCRT,X7UTIL.FRMDAT)', 0, NULL, 'Date de creation');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('2178', 'frmListeAFFCNT01', 'AFF', 'DATFIN', 22, 
    'Date de fin', 'Date de fin', 0, 1, 0, 
    'TO_CHAR(AFF.DATFIN,X7UTIL.FRMDAT)', 0, NULL, 'Date de fin');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('2179', 'frmListeAFFCNT01', 'AFF', 'IDTAFF', 22, 
    'Code', 'Code', 0, 1, 0, 
    'AFF.IDTAFF', 0, NULL, 'Code');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('2180', 'frmListeAFFCNT01', 'AFF', 'IDTETP', 22, 
    'N?Etape', 'N°Etape', 0, 1, 0, 
    'AFF.IDTETP', 0, NULL, 'N°Etape');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('2181', 'frmListeAFFCNT01', 'AFF', 'IDTSML', 22, 
    'Simulation', 'Simulation', 0, 1, 0, 
    'AFF.IDTSML', 0, NULL, 'Simulation');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('2182', 'frmListeAFFCNT01', 'AFF', 'MTRAGT', 22, 
    'Affecté à', 'Affecté à', 0, 1, 0, 
    'AFF.MTRAGT', 0, NULL, 'Affecté à');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('2183', 'frmListeAFFCNT01', 'AFF', 'IDTPLNACT', 22, 
    'Code plan d''actions', 'Code plan d''actions', 0, 1, 0, 
    'AFF.IDTPLNACT', 0, NULL, 'Code plan d''actions');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('2184', 'frmListeAFFCNT01', 'ACTCRS', 'MNTRLC', 22, 
    'Montant de la relance', 'Montant de la relance', 0, 1, 0, 
    'ACTCRS.MNTRLC', 0, NULL, 'Montant de la relance');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('2185', 'frmListeAFFCNT01', 'ACTCRS', 'IDTACTCRS', 22, 
    'Code action en cours', 'Code', 0, 1, 0, 
    'ACTCRS.IDTACTCRS', 0, NULL, 'Code');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('2186', 'frmListeAFFCNT01', 'CTLACT', 'ACT', 6, 
    'Code action', 'Code action', 0, 1, 0, 
    'CTLACT.ACT', 0, NULL, 'Code action');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('2187', 'frmListeAFFCNT01', 'CNT', 'IDTAGT', 6, 
    'Agent d''acceuil', 'Code', 1, 1, 0, 
    'CNT.IDTAGT', 1, NULL, 'Code');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('2188', 'frmListeAFFCNT01', 'CNT', 'IDTAGTSUI', 6, 
    'Agent de suivi', 'Code', 1, 1, 0, 
    'CNT.IDTAGTSUI', 1, NULL, 'Code');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('2189', 'frmListeAFFCNT01', 'CNT', 'IDTCLT', 6, 
    'Client', 'Client', 1, 1, 0, 
    'CNT.IDTCLT', 1, NULL, 'Client');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('2190', 'frmListeAFFCNT01', 'CNT', 'IDTCNT', 6, 
    'Numéro', 'Code', 1, 1, 0, 
    'CNT.IDTCNT', 2, NULL, 'Code');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('2191', 'frmListeAFFCNT01', 'MTFCNT', 'LIBABR', 6, 
    'Nature', 'Nature', 0, 1, 1, 
    'MTFCNT.LIBABR', 3, NULL, 'Nature');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('2192', 'frmListeAFFCNT01', 'CNT', 'DATCNT', 6, 
    'Date Début', 'Date du contact', 0, 1, 1, 
    'TO_CHAR(CNT.DATCNT,X7UTIL.FRMDAT)', 4, NULL, 'Date du contact');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('2193', 'frmListeAFFCNT01', 'CNT', 'DATFIN', 6, 
    'Date Fin', 'Date de fin', 0, 1, 1, 
    'TO_CHAR(CNT.DATFIN,X7UTIL.FRMDAT)', 5, NULL, 'Date de fin');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('2194', 'frmListeAFFCNT01', 'CLT', 'NOM', 40, 
    'Nom', 'Nom', 0, 1, 1, 
    'CLT.NOM', 6, NULL, 'Nom');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('2195', 'frmListeAFFCNT01', 'CLT', 'IDTCNTOPR', 6, 
    'CO', 'Centre operationnel', 0, 1, 1, 
    'CLT.IdtCntOpr', 7, NULL, 'Centre operationnel');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('2196', 'frmListeAFFCNT01', 'CLT', 'IDTCNTSNS', 6, 
    'CS', 'CS', 0, 1, 1, 
    'CLT.IdtCodSns', 8, NULL, 'CS');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('2197', 'frmListeAFFCNT01', 'CNT', 'MTRAGT', 6, 
    'Agent de suivi', 'Agent de suivi', 0, 1, 0, 
    'CNT.MTRAGT', 0, NULL, 'Agent de suivi');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('2198', 'frmListeAFFCNT01', 'CNT', 'CNTNOM', 6, 
    'Nom', 'Nom', 0, 1, 0, 
    'CNT.CNTNOM', 0, NULL, 'Nom');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('2199', 'frmListeAFFCNT01', 'CNT', 'IdtOrgCnt', 6, 
    'Code origine du contact', 'Code origine du contact', 0, 1, 0, 
    '(SELECT M1.TypoStd FROM TYPOSTD M1 WHERE M1.IdtTypoStd = CNT.IdtOrgCnt AND M1.CodTypoStd = ''ORGCNT'')', 0, NULL, 'Code origine du contact');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('2200', 'frmListeAFFCNT01', 'CNT', 'CNTTLD', 6, 
    'Telephone', 'Telephone', 0, 1, 0, 
    'CNT.CNTTLD', 0, NULL, 'Telephone');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('2201', 'frmListeAFFCNT01', 'CNT', 'CNTPRN', 6, 
    'Prenom', 'Prenom', 0, 1, 0, 
    'CNT.CNTPRN', 0, NULL, 'Prenom');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('2202', 'frmListeAFFCNT01', 'CNT', 'IDTSML', 6, 
    'Simulation', 'Simulation', 0, 1, 0, 
    'CNT.IDTSML', 0, NULL, 'Simulation');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('2203', 'frmListeAFFCNT01', 'CNT', 'IdtMtfFinCnt', 6, 
    'Motif de fin de contact', 'Motif de fin de contact', 0, 1, 0, 
    '(SELECT M1.TypoStd FROM TYPOSTD M1 WHERE M1.IdtTypoStd = CNT.IdtMtfFinCnt AND M1.CodTypoStd = ''FINCNT'')', 0, NULL, 'Motif de fin de contact');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('2204', 'frmListeAFFAFF01', 'AFF', 'IDTAFF', 12, 
    'Affaire', 'Code', 1, 1, 0, 
    'AFF.IDTAFF', 1, NULL, 'Code');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('2205', 'frmListeAFFAFF01', 'AFF', 'IDTCLT', 6, 
    'Client', 'Client', 0, 1, 1, 
    'AFF.IDTCLT', 2, NULL, 'Client');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('2206', 'frmListeAFFAFF01', 'AFF', 'IDTCNT', 6, 
    'Contact', 'Contact', 0, 1, 1, 
    'AFF.IDTCNT', 3, NULL, 'Contact');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('2207', 'frmListeAFFAFF01', 'PLNACT', 'LIBABR', 6, 
    'Contact', 'Contact', 0, 1, 1, 
    'PLNACT.LIBABR', 4, NULL, 'Contact');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('2208', 'frmListeAFFAFF01', 'AFF', 'Datcrt', 20, 
    'Début', 'Date de creation', 0, 1, 1, 
    'TO_CHAR(AFF.DATCRT,X7UTIL.FRMDAT)', 5, NULL, 'Date de creation');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('2209', 'frmListeAFFAFF01', 'AFF', 'Datfin', 20, 
    'Fin', 'Date de fin', 0, 1, 1, 
    'TO_CHAR(AFF.DATFIN,X7UTIL.FRMDAT)', 6, NULL, 'Date de fin');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('2210', 'frmListeAFFAFF01', 'CLT', 'NOM', 6, 
    'Nom', 'Nom', 0, 1, 1, 
    'CLT.NOM', 7, NULL, 'Nom');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('2211', 'frmListeAFFAFF01', 'CLT', 'IDTCNTOPR', 6, 
    'CO', 'Centre operationnel', 0, 1, 1, 
    'CLT.IDTCNTOPR', 8, NULL, 'Centre operationnel');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('2212', 'frmListeAFFAFF01', 'CLT', 'IDTCODSNS', 6, 
    'CS', 'Sensibilite client', 0, 1, 1, 
    'CLT.IDTCODSNS', 9, NULL, 'Sensibilite client');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('2213', 'frmListeAFFACT01', 'ACTCRS', 'IDTACTCRS', 12, 
    'Code', 'Code', 1, 1, 0, 
    'ACTCRS.IDTACTCRS', 1, NULL, 'Code');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('2214', 'frmListeAFFACT01', 'CTLACT', 'LIBABR', 12, 
    'Libellé', 'Libellé', 0, 1, 1, 
    'CTLACT.LIBABR', 2, NULL, 'Libellé');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('2215', 'frmListeAFFACT01', 'ACTCRS', 'Datpre', 20, 
    'Début prévu le', 'Date prevue', 0, 1, 1, 
    'TO_CHAR(ACTCRS.DATPRE,X7UTIL.FRMDATHM)', 3, NULL, 'Date prevue');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('2216', 'frmListeAFFACT01', 'ACTCRS', 'Datree', 20, 
    'Début réel le', 'Date reelle', 0, 1, 1, 
    'TO_CHAR(ACTCRS.DATREE,X7UTIL.FRMDATHM)', 4, NULL, 'Date reelle');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('2217', 'frmListeAFFACT01', 'ACTCRS', 'Datfin', 20, 
    'Fin réel le', 'Date de fin', 0, 1, 1, 
    'TO_CHAR(ACTCRS.DATFIN,X7UTIL.FRMDATHM)', 5, NULL, 'Date de fin');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('2218', 'frmListeAFFACT01', 'CTLACT', 'DURMIN', 20, 
    'Durée prévue', 'Durée prévue', 0, 1, 1, 
    'substr(x7util.DUREEJHM(CTLACT.DURMIN),1,254)', 6, NULL, 'Durée prévue');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('2219', 'frmListeAFFACT01', 'ACTCRS', 'DURMIN', 20, 
    'Durée réelle', 'Durée réelle', 0, 1, 1, 
    'substr(x7util.DUREEJHM(((NVL(ACTCRS.DatFin,DECODE(ACTCRS.IDTRET,4,SYSDATE,NULL))-ACTCRS.DatRee))*1440),1,254)', 7, NULL, 'Durée réelle');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('2220', 'frmListeAFFACT01', 'ACTCRS', 'DURMIN', 20, 
    'Retard', 'Retard', 0, 1, 1, 
    'substr(x7util.DUREEJHM((DECODE(SIGN(NVL(ACTCRS.DatFin,DECODE(ACTCRS.IDTRET,4,SYSDATE,NULL))-ACTCRS.DatRee-CTLACT.DURMIN),-1,0,(NVL(ACTCRS.DatFin,DECODE(ACTCRS.IDTRET,4,SYSDATE,NULL))-ACTCRS.DatRee)-CTLACT.DURMIN))*1440),1,254)', 8, NULL, 'Retard');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('2221', 'frmListeAFFACT01', 'ACTCRS', 'IDTAGTAFF', 20, 
    'Affecté à', 'Affecté à', 0, 1, 1, 
    'ACTCRS.IDTAGTAFF', 9, NULL, 'Affecté à');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('2222', 'frmListeAFFACT01', 'ACTCRS', 'IDTAGTTRT', 20, 
    'Traité par', 'Traité par', 0, 1, 1, 
    'ACTCRS.IDTAGTTRT', 10, NULL, 'Traité par');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('2223', 'frmListeAFFACT01', 'ACTCRS', 'MTRAGT', 20, 
    'Affecte a', 'Affecte a', 0, 1, 0, 
    'ACTCRS.MTRAGT', 0, NULL, 'Affecte a');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('2224', 'frmListeAFFACT01', 'ACTCRS', 'DELAIHH', 20, 
    'Dépassement de délai (Heures)', 'Dépassement de délai (Heures)', 0, 1, 0, 
    'ROUND(((nvl(ACTCRS.DatFin,sysdate) - (ACTCRS.DatRee + (CTLACT.DurMin / 60 / 24)) ) * 24),2)', 0, NULL, 'Dépassement de délai (Heures)');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('2225', 'frmListeAFFACT01', 'ACTCRS', 'DELAIJJ', 20, 
    'Dépassement de délai (Jours)', 'Dépassement de délai (Jours)', 0, 1, 0, 
    'ROUND(nvl(ACTCRS.DatFin,sysdate) - (ACTCRS.DatRee + (CTLACT.DurMin / 60 / 24)),2)', 0, NULL, 'Dépassement de délai (Jours)');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('2226', 'frmListeCLTOPR01', 'OPR', 'RFR', 12, 
    'Référence', 'Reference', 1, 1, 0, 
    'OPR.RFR', 1, NULL, 'Reference');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('2227', 'frmListeCLTOPR01', 'OPR', 'DATCRT', 12, 
    'Date', 'Date de creation', 0, 1, 1, 
    'TO_CHAR(OPR.DATCRT,X7UTIL.FRMDAT)', 2, NULL, 'Date de creation');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('2228', 'frmListeCLTOPR01', 'OPR', 'DATVLR', 12, 
    'Valeur', 'Date de valeur', 0, 1, 1, 
    'TO_CHAR(OPR.DATVLR,X7UTIL.FRMDAT)', 3, NULL, 'Date de valeur');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('1914', 'frmListeCMMCTR01', 'PNTLVR', 'C4', 22, 
    'Adaptable field check-box 4', 'Adaptable field check-box 4', 0, 0, 0, 
    'PNTLVR.C4', 0, NULL, 'Adaptable field check-box 4');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('1915', 'frmListeCMMCTR01', 'PNTLVR', 'C5', 22, 
    'Adaptable field check-box 5', 'Adaptable field check-box 5', 0, 0, 0, 
    'PNTLVR.C5', 0, NULL, 'Adaptable field check-box 5');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('1916', 'frmListeCMMCTR01', 'PNTLVR', 'D1', 7, 
    'Adaptable field date 1', 'Adaptable field date 1', 0, 0, 0, 
    'TO_CHAR(PNTLVR.D1,''DD/MM/YYYY'')', 0, NULL, 'Adaptable field date 1');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('1917', 'frmListeCMMCTR01', 'PNTLVR', 'D2', 7, 
    'Adaptable field date 2', 'Adaptable field date 2', 0, 0, 0, 
    'TO_CHAR(PNTLVR.D2,''DD/MM/YYYY'')', 0, NULL, 'Adaptable field date 2');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('1918', 'frmListeCMMCTR01', 'PNTLVR', 'D3', 7, 
    'Adaptable field date 3', 'Adaptable field date 3', 0, 0, 0, 
    'TO_CHAR(PNTLVR.D3,''DD/MM/YYYY'')', 0, NULL, 'Adaptable field date 3');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('1919', 'frmListeCMMCTR01', 'PNTLVR', 'D4', 7, 
    'Adaptable field date 4', 'Adaptable field date 4', 0, 0, 0, 
    'TO_CHAR(PNTLVR.D4,''DD/MM/YYYY'')', 0, NULL, 'Adaptable field date 4');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('1920', 'frmListeCMMCTR01', 'PNTLVR', 'D5', 7, 
    'Adaptable field date 5', 'Adaptable field date 5', 0, 0, 0, 
    'TO_CHAR(PNTLVR.D5,''DD/MM/YYYY'')', 0, NULL, 'Adaptable field date 5');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('1921', 'frmListeCMMCTR01', 'PNTLVR', 'ADRSTR1', 50, 
    'Description of structured address 1', 'Description of structured address 1', 0, 0, 0, 
    'PNTLVR.ADRSTR1', 0, NULL, 'Description of structured address 1');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('1922', 'frmListeCMMCTR01', 'PNTLVR', 'ADRSTR2', 50, 
    'Description of structured address 2', 'Description of structured address 2', 0, 0, 0, 
    'PNTLVR.ADRSTR2', 0, NULL, 'Description of structured address 2');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('1923', 'frmListeCMMCTR01', 'PNTLVR', 'ADRSTR3', 50, 
    'Description of structured address 3', 'Description of structured address 3', 0, 0, 0, 
    'PNTLVR.ADRSTR3', 0, NULL, 'Description of structured address 3');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('1924', 'frmListeCMMCTR01', 'PNTLVR', 'ADRSTR4', 50, 
    'Description of structured address 4', 'Description of structured address 4', 0, 0, 0, 
    'PNTLVR.ADRSTR4', 0, NULL, 'Description of structured address 4');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('1925', 'frmListeCMMCTR01', 'PNTLVR', 'ADRSTR5', 50, 
    'Description of structured address 5', 'Description of structured address 5', 0, 0, 0, 
    'PNTLVR.ADRSTR5', 0, NULL, 'Description of structured address 5');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('1926', 'frmListeCMMCTR01', 'PNTLVR', 'ADRSTR6', 50, 
    'Description of structured address 6', 'Description of structured address 6', 0, 0, 0, 
    'PNTLVR.ADRSTR6', 0, NULL, 'Description of structured address 6');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('1927', 'frmListeCMMCTR01', 'PNTLVR', 'ADRSTR7', 50, 
    'Description of structured address 7', 'Description of structured address 7', 0, 0, 0, 
    'PNTLVR.ADRSTR7', 0, NULL, 'Description of structured address 7');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('1928', 'frmListeCMMCTR01', 'PNTLVR', 'ADRSTR8', 50, 
    'Description of structured address 8', 'Description of structured address 8', 0, 0, 0, 
    'PNTLVR.ADRSTR8', 0, NULL, 'Description of structured address 8');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('1929', 'frmListeCMMCTR01', 'PNTLVR', 'ADRSTR9', 50, 
    'Description of structured address 9', 'Description of structured address 9', 0, 0, 0, 
    'PNTLVR.ADRSTR9', 0, NULL, 'Description of structured address 9');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('1930', 'frmListeCMMCTR01', 'PNTLVR', 'ADRSTR10', 50, 
    'Description of structured address 10', 'Description of structured address 10', 0, 0, 0, 
    'PNTLVR.ADRSTR10', 0, NULL, 'Description of structured address 10');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('1931', 'frmListeCMMCTR01', 'PNTLVR', 'IDTPNTLVR', 22, 
    'Internal Delivery point ID', 'Identifiant interne', 0, 0, 0, 
    'PNTLVR.IDTPNTLVR', 0, NULL, 'Identifiant interne');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('1932', 'frmListeCMMCTR01', 'PNTLVR', 'IDTTYPHBT', 6, 
    'Type d''habitation', 'Type d''habitation', 0, 1, 0, 
    'PNTLVR.IDTTYPHBT', 0, NULL, 'Type d''habitation');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('1933', 'frmListeCMMCTR01', 'PNTLVR', 'IDTCNTOPR', 6, 
    'Centre opérationel', 'Centre opérationel', 0, 1, 0, 
    'PNTLVR.IDTCNTOPR', 0, NULL, 'Centre opérationel');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('1934', 'frmListeCMMCTR01', 'PNTLVR', 'IDTDCPGGR', 29, 
    'Découpage géographique', 'Adresse geographique', 0, 1, 0, 
    'PNTLVR.IDTDCPGGR', 0, NULL, 'Adresse geographique');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('1935', 'frmListeCMMCTR01', 'PNTLVR', 'MTRAGT', 6, 
    'Agent', 'Agent', 0, 1, 0, 
    'PNTLVR.MTRAGT', 0, NULL, 'Agent');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('1936', 'frmListeCMMCTR01', 'PNTLVR', 'DATMAJ', 7, 
    'Date de mise à jour', 'Date de mise a jour', 0, 1, 0, 
    'TO_CHAR(PNTLVR.DATMAJ,''DD/MM/YYYY'')', 0, NULL, 'Date de mise a jour');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('1937', 'frmListeCMMCTR01', 'PNTLVR', 'OCC', 22, 
    'Occupé', 'Occupation', 0, 1, 0, 
    'PNTLVR.OCC', 0, NULL, 'Occupation');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('1938', 'frmListeCMMCTR01', 'PNTLVR', 'ANCRFR', 20, 
    'Former reference', 'Ancienne reference', 0, 1, 0, 
    'PNTLVR.ANCRFR', 0, NULL, 'Ancienne reference');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('1939', 'frmListeCMMCTR01', 'PNTLVR', 'ADRLBR', 254, 
    'Adresse', 'Adresse', 0, 1, 0, 
    'SUBSTR(REPLACE(REPLACE(PNTLVR.ADRLBR,CHR(10),'' ''),CHR(13),'' ''),1,254)', 0, NULL, 'Adresse');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('1940', 'frmListeCMMCTR01', 'PNTLVR', 'SQCPNTCPG', 22, 
    'Metering point last used serial number', 'Metering point last used serial number', 0, 1, 0, 
    'PNTLVR.SQCPNTCPG', 0, NULL, 'Metering point last used serial number');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('1941', 'frmListeCMMCTR01', 'PNTLVR', 'NUMORD', 22, 
    'Number in the standard round', 'Numero d''ordre', 0, 1, 0, 
    'PNTLVR.NUMORD', 0, NULL, 'Numero d''ordre');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('1942', 'frmListeCMMCTR01', 'PNTLVR', 'CODGEO1', 5, 
    'Code géographique 1', 'Code du niveau 1', 0, 1, 0, 
    'PNTLVR.CODGEO1', 0, NULL, 'Code du niveau 1');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('1943', 'frmListeCMMCTR01', 'PNTLVR', 'CODGEO2', 4, 
    'Code géographique 2', 'Code du niveau 2', 0, 1, 0, 
    'PNTLVR.CODGEO2', 0, NULL, 'Code du niveau 2');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('1944', 'frmListeCMMCTR01', 'PNTLVR', 'CODGEO3', 4, 
    'Code géographique 3', 'Code du niveau 3', 0, 1, 0, 
    'PNTLVR.CODGEO3', 0, NULL, 'Code du niveau 3');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('1945', 'frmListeCMMCTR01', 'PNTLVR', 'CODGEO4', 4, 
    'Code géographique 4', 'Code du niveau 4', 0, 1, 0, 
    'PNTLVR.CODGEO4', 0, NULL, 'Code du niveau 4');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('1946', 'frmListeCMMCTR01', 'PNTLVR', 'CODGEO5', 4, 
    'Code géographique 5', 'Code du niveau 5', 0, 1, 0, 
    'PNTLVR.CODGEO5', 0, NULL, 'Code du niveau 5');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('1947', 'frmListeCMMCTR01', 'PNTLVR', 'CODGEO6', 4, 
    'Code géographique 6', 'Code du niveau 6', 0, 1, 0, 
    'PNTLVR.CODGEO6', 0, NULL, 'Code du niveau 6');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('1948', 'frmListeCMMCTR01', 'PNTLVR', 'IDTENQ', 22, 
    'Investigation ID', 'Investigation ID', 0, 1, 0, 
    'PNTLVR.IDTENQ', 0, NULL, 'Investigation ID');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('1949', 'frmListeCMMCTR01', 'PNTLVR', 'IDTSQCGNR', 22, 
    'General identifier', 'General identifier', 0, 0, 0, 
    'PNTLVR.IDTSQCGNR', 0, NULL, 'General identifier');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('1950', 'frmListeCMMCTR01', 'PNTLVR', 'T1', 6, 
    'Adaptable field typologie 1', 'Adaptable field typologie 1', 0, 0, 0, 
    'PNTLVR.T1', 0, NULL, 'Adaptable field typologie 1');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('1951', 'frmListeCMMCTR01', 'PNTLVR', 'IDTT1', 6, 
    'Associated typology ID 1', 'Associated typology ID 1', 0, 0, 0, 
    'PNTLVR.IDTT1', 0, NULL, 'Associated typology ID 1');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('1952', 'frmListeCMMCTR01', 'PNTLVR', 'T2', 6, 
    'Adaptable field typologie 2', 'Adaptable field typologie 2', 0, 0, 0, 
    'PNTLVR.T2', 0, NULL, 'Adaptable field typologie 2');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('1953', 'frmListeCMMCTR01', 'PNTLVR', 'IDTT2', 6, 
    'Associated typology ID 2', 'Associated typology ID 2', 0, 0, 0, 
    'PNTLVR.IDTT2', 0, NULL, 'Associated typology ID 2');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('1954', 'frmListeCMMCTR01', 'PNTLVR', 'T3', 6, 
    'Adaptable field typologie 3', 'Adaptable field typologie 3', 0, 0, 0, 
    'PNTLVR.T3', 0, NULL, 'Adaptable field typologie 3');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('1955', 'frmListeCMMCTR01', 'PNTLVR', 'IDTT3', 6, 
    'Associated typology ID 3', 'Associated typology ID 3', 0, 0, 0, 
    'PNTLVR.IDTT3', 0, NULL, 'Associated typology ID 3');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('1956', 'frmListeCMMCTR01', 'PNTLVR', 'T4', 6, 
    'Adaptable field typologie 4', 'Adaptable field typologie 4', 0, 0, 0, 
    'PNTLVR.T4', 0, NULL, 'Adaptable field typologie 4');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('1957', 'frmListeCMMCTR01', 'AVTCTR', 'IDTCLT', 6, 
    'Customer ID', 'Customer ID', 0, 1, 0, 
    'AVTCTR.IDTCLT', 0, NULL, 'Customer ID');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('1958', 'frmListeCMMCTR01', 'AVTCTR', 'IDTCTR', 10, 
    'Contract', 'Contract', 0, 1, 0, 
    'AVTCTR.IDTCTR', 0, NULL, 'Contract');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('1959', 'frmListeCMMCTR01', 'AVTCTR', 'NUMAVN', 22, 
    'Numéro d''avenant', 'Numéro d''avenant', 0, 1, 0, 
    'AVTCTR.NUMAVN', 0, NULL, 'Numéro d''avenant');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('1960', 'frmListeCMMCTR01', 'AVTCTR', 'IDTPSSSSC', 4, 
    'Subscribed power ID', 'Code', 0, 1, 0, 
    'AVTCTR.IDTPSSSSC', 0, NULL, 'Code');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('1961', 'frmListeCMMCTR01', 'AVTCTR', 'IDTPSSSSCMT', 4, 
    'MV_subscribed power ID', 'MV_subscribed power ID', 0, 1, 0, 
    'AVTCTR.IDTPSSSSCMT', 0, NULL, 'MV_subscribed power ID');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('1962', 'frmListeCMMCTR01', 'AVTCTR', 'MTRAGT', 6, 
    'ID of the employee who carries out updating', 'ID of the employee who carries out updating', 0, 1, 0, 
    'AVTCTR.MTRAGT', 0, NULL, 'ID of the employee who carries out updating');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('1963', 'frmListeCMMCTR01', 'AVTCTR', 'DATMAJ', 7, 
    'Date de mise à jour', 'Date de mise à jour', 0, 1, 0, 
    'TO_CHAR(AVTCTR.DATMAJ,''DD/MM/YYYY'')', 0, NULL, 'Date de mise à jour');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('1964', 'frmListeCMMCTR01', 'AVTCTR', 'DATDBT', 7, 
    'Date de début', '???? ???', 0, 1, 0, 
    'TO_CHAR(AVTCTR.DATDBT,''DD/MM/YYYY'')', 0, NULL, '???? ???');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('1965', 'frmListeCMMCTR01', 'AVTCTR', 'DATFIN', 7, 
    'Date de fin', 'Date de fin', 0, 1, 0, 
    'TO_CHAR(AVTCTR.DATFIN,''DD/MM/YYYY'')', 0, NULL, 'Date de fin');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('1966', 'frmListeCMMCTR01', 'AVTCTR', 'EXNTVA', 22, 
    'TVA exemption', 'TVA exemption', 0, 1, 0, 
    'AVTCTR.EXNTVA', 0, NULL, 'TVA exemption');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('1967', 'frmListeCMMCTR01', 'AVTCTR', 'NOTE', 254, 
    'Note', 'Note', 0, 1, 0, 
    'AVTCTR.NOTE', 0, NULL, 'Note');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('1968', 'frmListeCMMCTR01', 'AVTCTR', 'DATCRT', 7, 
    'Date de création', 'Date de creation de l''avenant actif', 0, 1, 0, 
    'TO_CHAR(AVTCTR.DATCRT,''DD/MM/YYYY'')', 0, NULL, 'Date de creation de l''avenant actif');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('1969', 'frmListeCMMCTR01', 'AVTCTR', 'IDTCLTDST', 6, 
    'Destinataire', 'Destinataire', 0, 1, 0, 
    'AVTCTR.IDTCLTDST', 0, NULL, 'Destinataire');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('1970', 'frmListeCMMCTR01', 'AVTCTR', 'CHP01', 22, 
    'Adaptable field 01', 'Adaptable field 01', 0, 0, 0, 
    'AVTCTR.CHP01', 0, NULL, 'Adaptable field 01');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('1971', 'frmListeCMMCTR01', 'AVTCTR', 'CHP02', 22, 
    'Adaptable field 02', 'Adaptable field 02', 0, 0, 0, 
    'AVTCTR.CHP02', 0, NULL, 'Adaptable field 02');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('1972', 'frmListeCMMCTR01', 'AVTCTR', 'CHP03', 22, 
    'Adaptable field 03', 'Adaptable field 03', 0, 0, 0, 
    'AVTCTR.CHP03', 0, NULL, 'Adaptable field 03');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('1973', 'frmListeCMMCTR01', 'AVTCTR', 'CHP04', 22, 
    'Adaptable field 04', 'Adaptable field 04', 0, 0, 0, 
    'AVTCTR.CHP04', 0, NULL, 'Adaptable field 04');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('1974', 'frmListeCMMCTR01', 'AVTCTR', 'CHP05', 22, 
    'Adaptable field 05', 'Adaptable field 05', 0, 0, 0, 
    'AVTCTR.CHP05', 0, NULL, 'Adaptable field 05');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('1975', 'frmListeCMMCTR01', 'AVTCTR', 'CHP06', 22, 
    'Adaptable field 06', 'Adaptable field 06', 0, 0, 0, 
    'AVTCTR.CHP06', 0, NULL, 'Adaptable field 06');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('2618', 'frmListeTCHCPR01', 'CTR_ALL', 'IDTCODSNS', 6, 
    'Code sensibilité', 'Code sensibilité', 0, 1, 0, 
    'CTR_ALL.IDTCODSNS', 0, NULL, 'Code sensibilité');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('2619', 'frmListeTCHCPR01', 'CTR_ALL', 'MTFRSL', 15, 
    'Motive for termination', 'Motive for termination', 0, 1, 0, 
    'CTR_ALL.MTFRSL', 0, NULL, 'Motive for termination');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('2620', 'frmListeTCHCPR01', 'CTR_ALL', 'C3', 22, 
    'Adaptable field check-box 3', 'Adaptable field check-box 3', 0, 0, 0, 
    'CTR_ALL.C3', 0, NULL, 'Adaptable field check-box 3');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('2621', 'frmListeTCHCPR01', 'CTR_ALL', 'D5', 7, 
    'Adaptable field date 5', 'Adaptable field date 5', 0, 0, 0, 
    'TO_CHAR(CTR_ALL.D5,''DD/MM/YYYY'')', 0, NULL, 'Adaptable field date 5');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('2622', 'frmListeTCHCPR01', 'CTR_ALL', 'DATCRT', 7, 
    'Creation date', 'Creation date', 0, 1, 0, 
    'TO_CHAR(CTR_ALL.DATCRT,''DD/MM/YYYY'')', 0, NULL, 'Creation date');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('2623', 'frmListeTCHCPR01', 'CTR_ALL', 'IDTT4', 6, 
    'Associated typology ID 4', 'Associated typology ID 4', 0, 0, 0, 
    'CTR_ALL.IDTT4', 0, NULL, 'Associated typology ID 4');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('2624', 'frmListeTCHCPR01', 'CTR_ALL', 'A2', 40, 
    'Adaptable field string 2', 'Adaptable field string 2', 0, 0, 0, 
    'CTR_ALL.A2', 0, NULL, 'Adaptable field string 2');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('2625', 'frmListeTCHCPR01', 'CTR_ALL', 'IDTCTR', 10, 
    'Numéro', 'Numero', 0, 1, 0, 
    'CTR_ALL.IDTCTR', 0, NULL, 'Numero');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('2626', 'frmListeTCHCPR01', 'CTR_ALL', 'DPTGRN', 22, 
    'Deposit', 'Depot de garantie', 0, 1, 0, 
    'CTR_ALL.DPTGRN', 0, NULL, 'Depot de garantie');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('2627', 'frmListeTCHCPR01', 'CTR_ALL', 'IDTT1', 6, 
    'Associated typology ID 1', 'Associated typology ID 1', 0, 0, 0, 
    'CTR_ALL.IDTT1', 0, NULL, 'Associated typology ID 1');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('2628', 'frmListeTCHCPR01', 'CTR_ALL', 'C5', 22, 
    'Adaptable field check-box 5', 'Adaptable field check-box 5', 0, 0, 0, 
    'CTR_ALL.C5', 0, NULL, 'Adaptable field check-box 5');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('2629', 'frmListeTCHCPR01', 'CTR_ALL', 'D1', 7, 
    'Adaptable field date 1', 'Adaptable field date 1', 0, 0, 0, 
    'TO_CHAR(CTR_ALL.D1,''DD/MM/YYYY'')', 0, NULL, 'Adaptable field date 1');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('2630', 'frmListeTCHCPR01', 'CTR_ALL', 'D4', 7, 
    'Adaptable field date 4', 'Adaptable field date 4', 0, 0, 0, 
    'TO_CHAR(CTR_ALL.D4,''DD/MM/YYYY'')', 0, NULL, 'Adaptable field date 4');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('2631', 'frmListeTCHCPR01', 'CTR_ALL', 'ETTCTRFCT', 22, 
    'Billing status of contract (1<normal>, 2<computation mode>, 3<validation mode>, 4<periodical billing on going>)', 'Billing status of contract (1<normal>, 2<computation mode>, 3<validation mode>, 4<periodical billing on going>)', 0, 1, 0, 
    'CTR_ALL.ETTCTRFCT', 0, NULL, 'Billing status of contract (1<normal>, 2<computation mode>, 3<validation mode>, 4<periodical billing on going>)');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('2632', 'frmListeTCHCPR01', 'CTR_ALL', 'IDTGCH', 6, 
    'Counter ID', 'Counter ID', 0, 1, 0, 
    'CTR_ALL.IDTGCH', 0, NULL, 'Counter ID');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('2633', 'frmListeTCHCPR01', 'CTR_ALL', 'IDTT2', 6, 
    'Associated typology ID 2', 'Associated typology ID 2', 0, 0, 0, 
    'CTR_ALL.IDTT2', 0, NULL, 'Associated typology ID 2');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('2634', 'frmListeTCHCPR01', 'CTR_ALL', 'IDTT3', 6, 
    'Associated typology ID 3', 'Associated typology ID 3', 0, 0, 0, 
    'CTR_ALL.IDTT3', 0, NULL, 'Associated typology ID 3');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('2635', 'frmListeTCHCPR01', 'CTR_ALL', 'A3', 40, 
    'Adaptable field string 3', 'Adaptable field string 3', 0, 0, 0, 
    'CTR_ALL.A3', 0, NULL, 'Adaptable field string 3');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('2636', 'frmListeTCHCPR01', 'CTR_ALL', 'A4', 40, 
    'Adaptable field string 4', 'Adaptable field string 4', 0, 0, 0, 
    'CTR_ALL.A4', 0, NULL, 'Adaptable field string 4');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('2637', 'frmListeTCHCPR01', 'CTR_ALL', 'N3', 22, 
    'Adaptable field number 3', 'Adaptable field number 3', 0, 0, 0, 
    'CTR_ALL.N3', 0, NULL, 'Adaptable field number 3');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('2638', 'frmListeTCHCPR01', 'CTR_ALL', 'IDTCTR', 60, 
    'Point de livraison', 'Numero', 0, 1, 0, 
    'PNTLVR.IdtDcpGgr || PRMGNR.SprCdf || PNTLVR.NumOrd', 0, NULL, 'Numero');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('2639', 'frmListeTCHCPR01', 'CTR_ALL', 'IDTCLTDST', 6, 
    'Addressee ID', 'Code destinataire', 0, 1, 0, 
    'CTR_ALL.IDTCLTDST', 0, NULL, 'Code destinataire');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('2640', 'frmListeTCHCPR01', 'CTR_ALL', 'DEBDRNPRDFCT', 7, 
    'Last billed period (starting date)', 'Last billed period (starting date)', 0, 1, 0, 
    'TO_CHAR(CTR_ALL.DEBDRNPRDFCT,''DD/MM/YYYY'')', 0, NULL, 'Last billed period (starting date)');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('2641', 'frmListeTCHCPR01', 'CTR_ALL', 'SQCAVN', 22, 
    'Amendment serial number', 'Amendment serial number', 0, 1, 0, 
    'CTR_ALL.SQCAVN', 0, NULL, 'Amendment serial number');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('2642', 'frmListeTCHCPR01', 'CTR_ALL', 'C2', 22, 
    'Adaptable field check-box 2', 'Adaptable field check-box 2', 0, 0, 0, 
    'CTR_ALL.C2', 0, NULL, 'Adaptable field check-box 2');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('2643', 'frmListeTCHCPR01', 'CTR_ALL', 'D2', 7, 
    'Adaptable field date 2', 'Adaptable field date 2', 0, 0, 0, 
    'TO_CHAR(CTR_ALL.D2,''DD/MM/YYYY'')', 0, NULL, 'Adaptable field date 2');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('2644', 'frmListeTCHCPR01', 'CTR_ALL', 'N4', 22, 
    'Adaptable field number 4', 'Adaptable field number 4', 0, 0, 0, 
    'CTR_ALL.N4', 0, NULL, 'Adaptable field number 4');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('2645', 'frmListeTCHCPR01', 'CTR_ALL', 'IDTCNTOPR', 6, 
    'Centre opérationel', 'Centre opérationel', 0, 1, 0, 
    'CTR_ALL.IDTCNTOPR', 0, NULL, 'Centre opérationel');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('2646', 'frmListeTCHCPR01', 'CTR_ALL', 'DATRSL', 7, 
    'Résilié le', 'Date de resiliation', 0, 1, 0, 
    'TO_CHAR(CTR_ALL.DATRSL,''DD/MM/YYYY'')', 0, NULL, 'Date de resiliation');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('2647', 'frmListeTCHCPR01', 'CTR_ALL', 'FINDRNPRDFCT', 7, 
    'Last billed period (ending date)', '????? ??? ????', 0, 1, 0, 
    'TO_CHAR(CTR_ALL.FINDRNPRDFCT,''DD/MM/YYYY'')', 0, NULL, '????? ??? ????');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('2648', 'frmListeTCHCPR01', 'CTR_ALL', 'IDTSRV', 22, 
    'Service ID (1 <WATER>, 2 <LV electricity>, 3 <MV electricity>, ...)', 'Service ID (1 <WATER>, 2 <LV electricity>, 3 <MV electricity>, ...)', 0, 1, 0, 
    'CTR_ALL.IDTSRV', 0, NULL, 'Service ID (1 <WATER>, 2 <LV electricity>, 3 <MV electricity>, ...)');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('2649', 'frmListeTCHCPR01', 'CTR_ALL', 'T4', 6, 
    'Adaptable field typologie 4', 'Adaptable field typologie 4', 0, 0, 0, 
    'CTR_ALL.T4', 0, NULL, 'Adaptable field typologie 4');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('2650', 'frmListeTCHCPR01', 'CTR_ALL', 'T5', 6, 
    'Adaptable field typologie 5', 'Adaptable field typologie 5', 0, 0, 0, 
    'CTR_ALL.T5', 0, NULL, 'Adaptable field typologie 5');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('2651', 'frmListeTCHCPR01', 'CTR_ALL', 'IDTPNTCPG', 6, 
    'Point de comptage', 'Point de comptage', 0, 1, 0, 
    'PNTCPG.IDTPNTCPG', 0, NULL, 'Point de comptage');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('2652', 'frmListeTCHCPR01', 'CTR_ALL', 'IDTCLTSSC', 6, 
    'Client souscripteur', 'Code souscripteur', 0, 1, 0, 
    'CTR_ALL.IDTCLTSSC', 0, NULL, 'Code souscripteur');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('2653', 'frmListeTCHCPR01', 'CTR_ALL', 'NUMINTER', 22, 
    'Work order number', 'Work order number', 0, 1, 0, 
    'CTR_ALL.NUMINTER', 0, NULL, 'Work order number');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('2654', 'frmListeTCHCPR01', 'CTR_ALL', 'ETTCTR', 22, 
    'Contract status ( 1< normal>, 2<creation mode of the amendment>, 3<cancellation mode>, 4<creation mode>)', 'Contract status ( 1< normal>, 2<creation mode of the amendment>, 3<cancellation mode>, 4<creation mode>)', 0, 1, 0, 
    'CTR_ALL.ETTCTR', 0, NULL, 'Contract status ( 1< normal>, 2<creation mode of the amendment>, 3<cancellation mode>, 4<creation mode>)');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('2655', 'frmListeTCHCPR01', 'CTR_ALL', 'C1', 22, 
    'Adaptable field check-box 1', 'Adaptable field check-box 1', 0, 0, 0, 
    'CTR_ALL.C1', 0, NULL, 'Adaptable field check-box 1');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('2656', 'frmListeTCHCPR01', 'CTR_ALL', 'C4', 22, 
    'Adaptable field check-box 4', 'Adaptable field check-box 4', 0, 0, 0, 
    'CTR_ALL.C4', 0, NULL, 'Adaptable field check-box 4');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('2657', 'frmListeTCHCPR01', 'CTR_ALL', 'DATMAJ', 7, 
    'Date de mise à jour', 'Date de mise à jour', 0, 1, 0, 
    'TO_CHAR(CTR_ALL.DATMAJ,''DD/MM/YYYY'')', 0, NULL, 'Date de mise à jour');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('2658', 'frmListeTCHCPR01', 'CTR_ALL', 'DATSCR', 15, 
    'Souscrit le', 'Date de souscription', 0, 1, 0, 
    'TO_CHAR(CTR_ALL.DATSCR,''DD/MM/YYYY'')', 0, NULL, 'Date de souscription');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('2659', 'frmListeTCHCPR01', 'CTR_ALL', 'PRPCPTBNC', 40, 
    'Bank account owner', 'Bank account owner', 0, 1, 0, 
    'CTR_ALL.PRPCPTBNC', 0, NULL, 'Bank account owner');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('2660', 'frmListeTCHCPR01', 'PNTCPG', 'IDTLOTFAC', 6, 
    'Lot de facturation', 'Lot de facturation', 0, 1, 0, 
    'PNTCPG.IDTLOTFAC', 0, NULL, 'Lot de facturation');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('2661', 'frmListeTCHCPR01', 'PNTCPG', 'SCTCND', 22, 
    'Conductors section', 'Conductors section', 0, 1, 0, 
    'PNTCPG.SCTCND', 0, NULL, 'Conductors section');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('2662', 'frmListeTCHCPR01', 'PNTCPG', 'ADRLBR', 254, 
    'Adresse', 'Adresse', 0, 1, 0, 
    'SUBSTR(REPLACE(REPLACE(PNTCPG.ADRLBR,CHR(10),'' ''),CHR(13),'' ''),1,254)', 0, NULL, 'Adresse');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('2663', 'frmListeTCHCPR01', 'PNTCPG', 'T2', 6, 
    'Adaptable field typologie 2', 'Adaptable field typologie 2', 0, 0, 0, 
    'PNTCPG.T2', 0, NULL, 'Adaptable field typologie 2');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('2664', 'frmListeTCHCPR01', 'PNTCPG', 'A1', 40, 
    'Adaptable field string 1', 'Adaptable field string 1', 0, 0, 0, 
    'PNTCPG.A1', 0, NULL, 'Adaptable field string 1');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('2665', 'frmListeTCHCPR01', 'PNTCPG', 'IDTPNTLVR', 22, 
    'Delivery point ID', 'Delivery point ID', 0, 1, 0, 
    'PNTCPG.IDTPNTLVR', 0, NULL, 'Delivery point ID');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('2666', 'frmListeTCHCPR01', 'PNTCPG', 'ADRSTR1', 50, 
    'Description of structured address 1', 'Description of structured address 1', 0, 0, 0, 
    'PNTCPG.ADRSTR1', 0, NULL, 'Description of structured address 1');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('2667', 'frmListeTCHCPR01', 'PNTCPG', 'ADRSTR8', 50, 
    'Description of structured address 8', 'Description of structured address 8', 0, 0, 0, 
    'PNTCPG.ADRSTR8', 0, NULL, 'Description of structured address 8');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('2668', 'frmListeTCHCPR01', 'PNTCPG', 'IDTCLTPRP', 6, 
    'Code client propriétaire', 'Code client propriétaire', 0, 1, 0, 
    'PNTCPG.IDTCLTPRP', 0, NULL, 'Code client propriétaire');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('2669', 'frmListeTCHCPR01', 'PNTCPG', 'IDTLOTRCS', 6, 
    'Lot recensement', 'Lot recensement', 0, 1, 0, 
    'PNTCPG.IDTLOTRCS', 0, NULL, 'Lot recensement');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('2670', 'frmListeTCHCPR01', 'PNTCPG', 'DMT', 22, 
    'Diamètre', 'Diametre', 0, 1, 0, 
    'PNTCPG.DMT', 0, NULL, 'Diametre');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('2671', 'frmListeTCHCPR01', 'PNTCPG', 'RNG1', 22, 
    'Rang', 'Rang', 0, 1, 0, 
    'PNTCPG.RNG1', 0, NULL, 'Rang');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('2672', 'frmListeTCHCPR01', 'PNTCPG', 'T4', 6, 
    'Adaptable field typologie 4', 'Adaptable field typologie 4', 0, 0, 0, 
    'PNTCPG.T4', 0, NULL, 'Adaptable field typologie 4');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('2673', 'frmListeTCHCPR01', 'PNTCPG', 'IDTT5', 6, 
    'Associated typology ID 5', 'Associated typology ID 5', 0, 0, 0, 
    'PNTCPG.IDTT5', 0, NULL, 'Associated typology ID 5');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('2674', 'frmListeTCHCPR01', 'PNTCPG', 'A3', 40, 
    'Adaptable field string 3', 'Adaptable field string 3', 0, 0, 0, 
    'PNTCPG.A3', 0, NULL, 'Adaptable field string 3');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('2675', 'frmListeTCHCPR01', 'PNTCPG', 'N1', 22, 
    'Adaptable field number 1', 'Adaptable field number 1', 0, 0, 0, 
    'PNTCPG.N1', 0, NULL, 'Adaptable field number 1');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('2676', 'frmListeTCHCPR01', 'PNTCPG', 'C2', 22, 
    'Adaptable field check-box 2', 'Adaptable field check-box 2', 0, 0, 0, 
    'PNTCPG.C2', 0, NULL, 'Adaptable field check-box 2');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('2737', 'frmListeTCHPLV01', 'PNTLVR', 'A3', 40, 
    'Adaptable field string 3', 'Adaptable field string 3', 0, 0, 0, 
    'PNTLVR.A3', 0, NULL, 'Adaptable field string 3');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('2738', 'frmListeTCHPLV01', 'PNTLVR', 'A5', 40, 
    'Adaptable field string 5', 'Adaptable field string 5', 0, 0, 0, 
    'PNTLVR.A5', 0, NULL, 'Adaptable field string 5');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('2739', 'frmListeTCHPLV01', 'PNTLVR', 'ADRSTR7', 50, 
    'Description of structured address 7', 'Description of structured address 7', 0, 0, 0, 
    'PNTLVR.ADRSTR7', 0, NULL, 'Description of structured address 7');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('2740', 'frmListeTCHPLV01', 'PNTLVR', 'MTRAGT', 6, 
    'Agent', 'Agent', 0, 1, 0, 
    'PNTLVR.MTRAGT', 0, NULL, 'Agent');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('2741', 'frmListeTCHPLV01', 'PNTLVR', 'NUMORD', 22, 
    'Number in the standard round', 'Numero d''ordre', 0, 1, 0, 
    'PNTLVR.NUMORD', 0, NULL, 'Numero d''ordre');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('2742', 'frmListeTCHPLV01', 'PNTLVR', 'IDTT3', 6, 
    'Associated typology ID 3', 'Associated typology ID 3', 0, 0, 0, 
    'PNTLVR.IDTT3', 0, NULL, 'Associated typology ID 3');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('2743', 'frmListeTCHPLV01', 'PNTLVR', 'C5', 22, 
    'Adaptable field check-box 5', 'Adaptable field check-box 5', 0, 0, 0, 
    'PNTLVR.C5', 0, NULL, 'Adaptable field check-box 5');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('2744', 'frmListeTCHPLV01', 'PNTLVR', 'ADRSTR3', 50, 
    'Description of structured address 3', 'Description of structured address 3', 0, 0, 0, 
    'PNTLVR.ADRSTR3', 0, NULL, 'Description of structured address 3');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('2745', 'frmListeTCHPLV01', 'PNTLVR', 'ADRSTR10', 50, 
    'Description of structured address 10', 'Description of structured address 10', 0, 0, 0, 
    'PNTLVR.ADRSTR10', 0, NULL, 'Description of structured address 10');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('2746', 'frmListeTCHPLV01', 'PNTLVR', 'CODGEO6', 4, 
    'Code géographique 6', 'Code du niveau 6', 0, 1, 0, 
    'PNTLVR.CODGEO6', 0, NULL, 'Code du niveau 6');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('2747', 'frmListeTCHPLV01', 'PNTLVR', 'T1', 6, 
    'Adaptable field typologie 1', 'Adaptable field typologie 1', 0, 0, 0, 
    'PNTLVR.T1', 0, NULL, 'Adaptable field typologie 1');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('2748', 'frmListeTCHPLV01', 'PNTLVR', 'IDTT2', 6, 
    'Associated typology ID 2', 'Associated typology ID 2', 0, 0, 0, 
    'PNTLVR.IDTT2', 0, NULL, 'Associated typology ID 2');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('2749', 'frmListeTCHPLV01', 'PNTLVR', 'C1', 22, 
    'Adaptable field check-box 1', 'Adaptable field check-box 1', 0, 0, 0, 
    'PNTLVR.C1', 0, NULL, 'Adaptable field check-box 1');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('2750', 'frmListeTCHPLV01', 'PNTLVR', 'IDTT5', 6, 
    'Associated typology ID 5', 'Associated typology ID 5', 0, 0, 0, 
    'PNTLVR.IDTT5', 0, NULL, 'Associated typology ID 5');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('2751', 'frmListeTCHPLV01', 'PNTLVR', 'D4', 7, 
    'Adaptable field date 4', 'Adaptable field date 4', 0, 0, 0, 
    'TO_CHAR(PNTLVR.D4,''DD/MM/YYYY'')', 0, NULL, 'Adaptable field date 4');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('2752', 'frmListeTCHPLV01', 'PNTLVR', 'ADRSTR1', 50, 
    'Description of structured address 1', 'Description of structured address 1', 0, 0, 0, 
    'PNTLVR.ADRSTR1', 0, NULL, 'Description of structured address 1');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('2753', 'frmListeTCHPLV01', 'PNTLVR', 'ADRSTR2', 50, 
    'Description of structured address 2', 'Description of structured address 2', 0, 0, 0, 
    'PNTLVR.ADRSTR2', 0, NULL, 'Description of structured address 2');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('2754', 'frmListeTCHPLV01', 'PNTLVR', 'ADRSTR4', 50, 
    'Description of structured address 4', 'Description of structured address 4', 0, 0, 0, 
    'PNTLVR.ADRSTR4', 0, NULL, 'Description of structured address 4');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('2755', 'frmListeTCHPLV01', 'PNTLVR', 'ADRSTR6', 50, 
    'Description of structured address 6', 'Description of structured address 6', 0, 0, 0, 
    'PNTLVR.ADRSTR6', 0, NULL, 'Description of structured address 6');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('2756', 'frmListeTCHPLV01', 'PNTLVR', 'ADRSTR9', 50, 
    'Description of structured address 9', 'Description of structured address 9', 0, 0, 0, 
    'PNTLVR.ADRSTR9', 0, NULL, 'Description of structured address 9');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('2757', 'frmListeTCHPLV01', 'PNTLVR', 'DATMAJ', 7, 
    'Date de mise à jour', 'Date de mise a jour', 0, 1, 0, 
    'TO_CHAR(PNTLVR.DATMAJ,''DD/MM/YYYY'')', 0, NULL, 'Date de mise a jour');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('2758', 'frmListeTCHPLV01', 'PNTLVR', 'CODGEO2', 4, 
    'Code géographique 2', 'Code du niveau 2', 0, 1, 0, 
    'PNTLVR.CODGEO2', 0, NULL, 'Code du niveau 2');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('2759', 'frmListeTCHPLV01', 'PNTLVR', 'T2', 6, 
    'Adaptable field typologie 2', 'Adaptable field typologie 2', 0, 0, 0, 
    'PNTLVR.T2', 0, NULL, 'Adaptable field typologie 2');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('2760', 'frmListeTCHPLV01', 'PNTLVR', 'T4', 6, 
    'Adaptable field typologie 4', 'Adaptable field typologie 4', 0, 0, 0, 
    'PNTLVR.T4', 0, NULL, 'Adaptable field typologie 4');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('2761', 'frmListeTCHPLV01', 'PNTLVR', 'A1', 40, 
    'Adaptable field string 1', 'Adaptable field string 1', 0, 0, 0, 
    'PNTLVR.A1', 0, NULL, 'Adaptable field string 1');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('2762', 'frmListeTCHPLV01', 'PNTLVR', 'A4', 40, 
    'Adaptable field string 4', 'Adaptable field string 4', 0, 0, 0, 
    'PNTLVR.A4', 0, NULL, 'Adaptable field string 4');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('2763', 'frmListeTCHPLV01', 'PNTLVR', 'IDTDCPGGR', 29, 
    'Découpage géographique', 'Adresse geographique', 0, 1, 0, 
    'PNTLVR.IDTDCPGGR', 0, NULL, 'Adresse geographique');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('2764', 'frmListeTCHPLV01', 'PNTLVR', 'CODGEO3', 4, 
    'Code géographique 3', 'Code du niveau 3', 0, 1, 0, 
    'PNTLVR.CODGEO3', 0, NULL, 'Code du niveau 3');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('2765', 'frmListeTCHPLV01', 'PNTLVR', 'T3', 6, 
    'Adaptable field typologie 3', 'Adaptable field typologie 3', 0, 0, 0, 
    'PNTLVR.T3', 0, NULL, 'Adaptable field typologie 3');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('2766', 'frmListeTCHPLV01', 'PNTLVR', 'IDTT4', 6, 
    'Associated typology ID 4', 'Associated typology ID 4', 0, 0, 0, 
    'PNTLVR.IDTT4', 0, NULL, 'Associated typology ID 4');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('2767', 'frmListeTCHPLV01', 'PNTLVR', 'N1', 22, 
    'Adaptable field number1', 'Adaptable field number1', 0, 0, 0, 
    'PNTLVR.N1', 0, NULL, 'Adaptable field number1');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('2768', 'frmListeTCHPLV01', 'PNTLVR', 'D1', 7, 
    'Adaptable field date 1', 'Adaptable field date 1', 0, 0, 0, 
    'TO_CHAR(PNTLVR.D1,''DD/MM/YYYY'')', 0, NULL, 'Adaptable field date 1');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('2769', 'frmListeTCHPLV01', 'PNTLVR', 'ADRSTR5', 50, 
    'Description of structured address 5', 'Description of structured address 5', 0, 0, 0, 
    'PNTLVR.ADRSTR5', 0, NULL, 'Description of structured address 5');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('2770', 'frmListeTCHPLV01', 'PNTLVR', 'IDTPNTLVR', 22, 
    'Internal Delivery point ID', 'Identifiant interne', 0, 0, 0, 
    'PNTLVR.IDTPNTLVR', 0, NULL, 'Identifiant interne');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('2771', 'frmListeTCHPLV01', 'PNTLVR', 'OCC', 22, 
    'Occupé', 'Occupation', 0, 1, 0, 
    'PNTLVR.OCC', 0, NULL, 'Occupation');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('2772', 'frmListeTCHPLV01', 'PNTLVR', 'ANCRFR', 20, 
    'Former reference', 'Ancienne reference', 0, 1, 0, 
    'PNTLVR.ANCRFR', 0, NULL, 'Ancienne reference');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('2773', 'frmListeTCHPLV01', 'PNTLVR', 'CODGEO1', 5, 
    'Code géographique 1', 'Code du niveau 1', 0, 1, 0, 
    'PNTLVR.CODGEO1', 0, NULL, 'Code du niveau 1');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('2774', 'frmListeTCHPLV01', 'PNTLVR', 'IDTENQ', 22, 
    'Investigation ID', 'Investigation ID', 0, 1, 0, 
    'PNTLVR.IDTENQ', 0, NULL, 'Investigation ID');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('2775', 'frmListeTCHPLV01', 'PNTLVR', 'C2', 22, 
    'Adaptable field check-box 2', 'Adaptable field check-box 2', 0, 0, 0, 
    'PNTLVR.C2', 0, NULL, 'Adaptable field check-box 2');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('2776', 'frmListeTCHPLV01', 'PNTLVR', 'A2', 40, 
    'Adaptable field string  2', 'Adaptable field string  2', 0, 0, 0, 
    'PNTLVR.A2', 0, NULL, 'Adaptable field string  2');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('2777', 'frmListeTCHPLV01', 'PNTLVR', 'N2', 22, 
    'Adaptable field number12', 'Adaptable field number12', 0, 0, 0, 
    'PNTLVR.N2', 0, NULL, 'Adaptable field number12');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('2778', 'frmListeTCHPLV01', 'PNTLVR', 'N3', 22, 
    'Adaptable field number13', 'Adaptable field number13', 0, 0, 0, 
    'PNTLVR.N3', 0, NULL, 'Adaptable field number13');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('2779', 'frmListeTCHPLV01', 'PNTLVR', 'D5', 7, 
    'Adaptable field date 5', 'Adaptable field date 5', 0, 0, 0, 
    'TO_CHAR(PNTLVR.D5,''DD/MM/YYYY'')', 0, NULL, 'Adaptable field date 5');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('2780', 'frmListeTCHPLV01', 'PNTLVR', 'SQCPNTCPG', 22, 
    'Metering point last used serial number', 'Metering point last used serial number', 0, 1, 0, 
    'PNTLVR.SQCPNTCPG', 0, NULL, 'Metering point last used serial number');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('2781', 'frmListeTCHPLV01', 'PNTLVR', 'CODGEO4', 4, 
    'Code géographique 4', 'Code du niveau 4', 0, 1, 0, 
    'PNTLVR.CODGEO4', 0, NULL, 'Code du niveau 4');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('2782', 'frmListeTCHPLV01', 'PNTLVR', 'T5', 6, 
    'Adaptable field typologie 5', 'Adaptable field typologie 5', 0, 0, 0, 
    'PNTLVR.T5', 0, NULL, 'Adaptable field typologie 5');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('2783', 'frmListeTCHPLV01', 'PNTLVR', 'N4', 22, 
    'Adaptable field number 4', 'Adaptable field number 4', 0, 0, 0, 
    'PNTLVR.N4', 0, NULL, 'Adaptable field number 4');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('2784', 'frmListeTCHPLV01', 'PNTLVR', 'D2', 7, 
    'Adaptable field date 2', 'Adaptable field date 2', 0, 0, 0, 
    'TO_CHAR(PNTLVR.D2,''DD/MM/YYYY'')', 0, NULL, 'Adaptable field date 2');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('2785', 'frmListeTCHPLV01', 'PNTLVR', 'ADRSTR8', 50, 
    'Description of structured address 8', 'Description of structured address 8', 0, 0, 0, 
    'PNTLVR.ADRSTR8', 0, NULL, 'Description of structured address 8');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('2786', 'frmListeTCHPLV01', 'PNTLVR', 'IDTTYPHBT', 6, 
    'Type d''habitation', 'Type d''habitation', 0, 1, 0, 
    'PNTLVR.IDTTYPHBT', 0, NULL, 'Type d''habitation');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('2787', 'frmListeTCHPLV01', 'PNTLVR', 'CODGEO5', 4, 
    'Code géographique 5', 'Code du niveau 5', 0, 1, 0, 
    'PNTLVR.CODGEO5', 0, NULL, 'Code du niveau 5');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('2788', 'frmListeTCHPLV01', 'PNTLVR', 'IDTSQCGNR', 22, 
    'General identifier', 'General identifier', 0, 0, 0, 
    'PNTLVR.IDTSQCGNR', 0, NULL, 'General identifier');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('2789', 'frmListeTCHPLV01', 'PNTLVR', 'C3', 22, 
    'Adaptable field check-box 3', 'Adaptable field check-box 3', 0, 0, 0, 
    'PNTLVR.C3', 0, NULL, 'Adaptable field check-box 3');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('2790', 'frmListeTCHPLV01', 'PNTLVR', 'C4', 22, 
    'Adaptable field check-box 4', 'Adaptable field check-box 4', 0, 0, 0, 
    'PNTLVR.C4', 0, NULL, 'Adaptable field check-box 4');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('2791', 'frmListeTCHPLV01', 'PNTLVR', 'D3', 7, 
    'Adaptable field date 3', 'Adaptable field date 3', 0, 0, 0, 
    'TO_CHAR(PNTLVR.D3,''DD/MM/YYYY'')', 0, NULL, 'Adaptable field date 3');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('2792', 'frmListeTCHPLV01', 'PNTLVR', 'IDTCNTOPR', 6, 
    'Centre opérationel', 'Centre opérationel', 0, 1, 0, 
    'PNTLVR.IDTCNTOPR', 0, NULL, 'Centre opérationel');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('2793', 'frmListeTCHPLV01', 'PNTLVR', 'IDTT1', 6, 
    'Associated typology ID 1', 'Associated typology ID 1', 0, 0, 0, 
    'PNTLVR.IDTT1', 0, NULL, 'Associated typology ID 1');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('2794', 'frmListeCLTCPT01', 'CLT', 'CHPLIB1', 30, 
    '1st free field', '1st free field', 0, 0, 0, 
    'CLT.CHPLIB1', 0, NULL, '1st free field');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('2795', 'frmListeCLTCPT01', 'CLT', 'CHPLIB3', 30, 
    '3rd free field', '3rd free field', 0, 0, 0, 
    'CLT.CHPLIB3', 0, NULL, '3rd free field');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('2796', 'frmListeCLTCPT01', 'CLT', 'CHPLIB4', 30, 
    '4th free field', '4th free field', 0, 0, 0, 
    'CLT.CHPLIB4', 0, NULL, '4th free field');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('2797', 'frmListeCLTCPT01', 'CLT', 'T5', 6, 
    'Adaptable field typology 5', 'Adaptable field typology 5', 0, 0, 0, 
    'CLT.T5', 0, NULL, 'Adaptable field typology 5');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('2798', 'frmListeCLTCPT01', 'CLT', 'A1', 40, 
    'Adaptable field string 1', 'Adaptable field string 1', 0, 0, 0, 
    'CLT.A1', 0, NULL, 'Adaptable field string 1');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('2799', 'frmListeCLTCPT01', 'CLT', 'A4', 40, 
    'Adaptable field string 4', 'Adaptable field string 4', 0, 0, 0, 
    'CLT.A4', 0, NULL, 'Adaptable field string 4');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('2800', 'frmListeCLTCPT01', 'CLT', 'A5', 40, 
    'Adaptable field string 5', 'Adaptable field string 5', 0, 0, 0, 
    'CLT.A5', 0, NULL, 'Adaptable field string 5');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('2801', 'frmListeCLTCPT01', 'CLT', 'N1', 22, 
    'Adaptable field number 1', 'Adaptable field number 1', 0, 0, 0, 
    'CLT.N1', 0, NULL, 'Adaptable field number 1');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('2802', 'frmListeCLTCPT01', 'CLT', 'N5', 22, 
    'Adaptable field number 5', 'Adaptable field number 5', 0, 0, 0, 
    'CLT.N5', 0, NULL, 'Adaptable field number 5');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('2803', 'frmListeCLTCPT01', 'CLT', 'ADRSTR3', 50, 
    'Description of structured address 3', 'Description of structured address 3', 0, 0, 0, 
    'CLT.ADRSTR3', 0, NULL, 'Description of structured address 3');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('2804', 'frmListeCLTCPT01', 'CLT', 'ADRSTR4', 50, 
    'Description of structured address 4', 'Description of structured address 4', 0, 0, 0, 
    'CLT.ADRSTR4', 0, NULL, 'Description of structured address 4');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('2805', 'frmListeCLTCPT01', 'CLT', 'IDTCLT', 6, 
    'Nombre de contrat', 'Code', 0, 1, 0, 
    '(SELECT COUNT(*) FROM CTR WHERE CTR.IDTCLTDST = CLT.IDTCLT)', 0, NULL, 'Code');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('2806', 'frmListeCLTCPT01', 'CLT', 'IDTCTGCLT', 6, 
    'Categorie de client', 'Categorie de client', 0, 1, 0, 
    'CLT.IDTCTGCLT', 0, NULL, 'Categorie de client');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('2807', 'frmListeCLTCPT01', 'CLT', 'IDTCTR', 10, 
    'Contract ID', 'Contract ID', 0, 1, 0, 
    'CLT.IDTCTR', 0, NULL, 'Contract ID');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('2808', 'frmListeCLTCPT01', 'CLT', 'RTRIPY', 22, 
    'Nombre de retours d''impaye', 'Nombre de retours d''impaye', 0, 1, 0, 
    'CLT.RTRIPY', 0, NULL, 'Nombre de retours d''impaye');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('2809', 'frmListeCLTCPT01', 'CLT', 'T1', 6, 
    'Adaptable field typology 1', 'Adaptable field typology 1', 0, 0, 0, 
    'CLT.T1', 0, NULL, 'Adaptable field typology 1');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('2810', 'frmListeCLTCPT01', 'CLT', 'ADRSTR9', 254, 
    'Description of structured address 9', 'Description of structured address 9', 0, 0, 0, 
    'CLT.ADRSTR9', 0, NULL, 'Description of structured address 9');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('2811', 'frmListeCLTCPT01', 'CLT', 'TLB', 20, 
    'Telephone du bureau', 'Telephone du bureau', 0, 1, 0, 
    'CLT.TLB', 0, NULL, 'Telephone du bureau');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('2812', 'frmListeCLTCPT01', 'CLT', 'FLD', 20, 
    'Fax du domicile', 'Fax du domicile', 0, 1, 0, 
    'CLT.FLD', 0, NULL, 'Fax du domicile');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('2813', 'frmListeCLTCPT01', 'CLT', 'T2', 6, 
    'Adaptable field typology 2', 'Adaptable field typology 2', 0, 0, 0, 
    'CLT.T2', 0, NULL, 'Adaptable field typology 2');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('2814', 'frmListeCLTCPT01', 'CLT', 'IDTT2', 6, 
    'Associated typology ID 2', 'Associated typology ID 2', 0, 0, 0, 
    'CLT.IDTT2', 0, NULL, 'Associated typology ID 2');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('2815', 'frmListeCLTCPT01', 'CLT', 'T3', 6, 
    'Adaptable field typology 3', 'Adaptable field typology 3', 0, 0, 0, 
    'CLT.T3', 0, NULL, 'Adaptable field typology 3');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('2816', 'frmListeCLTCPT01', 'CLT', 'IDTT3', 6, 
    'Associated typology ID 3', 'Associated typology ID 3', 0, 0, 0, 
    'CLT.IDTT3', 0, NULL, 'Associated typology ID 3');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('2817', 'frmListeCLTCPT01', 'CLT', 'T4', 6, 
    'Adaptable field typology 4', 'Adaptable field typology 4', 0, 0, 0, 
    'CLT.T4', 0, NULL, 'Adaptable field typology 4');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('2818', 'frmListeCLTCPT01', 'CLT', 'C2', 22, 
    'Adaptable field check-box 2', 'Adaptable field check-box 2', 0, 0, 0, 
    'CLT.C2', 0, NULL, 'Adaptable field check-box 2');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('2819', 'frmListeCLTCPT01', 'CLT', 'ADRSTR7', 50, 
    'Description of structured address 7', 'Description of structured address 7', 0, 0, 0, 
    'CLT.ADRSTR7', 0, NULL, 'Description of structured address 7');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('2820', 'frmListeCLTCPT01', 'CLT', 'IDTCNTOPR', 6, 
    'Centre operationnel', 'Centre operationnel', 0, 1, 0, 
    'CLT.IDTCNTOPR', 0, NULL, 'Centre operationnel');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('2821', 'frmListeCLTCPT01', 'CLT', 'AVT_IDTCTR', 10, 
    'NOT USED !!!', 'NOT USED !!!', 0, 0, 0, 
    'CLT.AVT_IDTCTR', 0, NULL, 'NOT USED !!!');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('2822', 'frmListeCLTCPT01', 'CLT', 'AVT_NUMAVN', 22, 
    'NOT USED!!!', 'NOT USED!!!', 0, 0, 0, 
    'CLT.AVT_NUMAVN', 0, NULL, 'NOT USED!!!');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('2823', 'frmListeCLTCPT01', 'CLT', 'MTRAGT', 6, 
    'Agent', 'Agent', 0, 1, 0, 
    'CLT.MTRAGT', 0, NULL, 'Agent');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('2824', 'frmListeCLTCPT01', 'CLT', 'QLTPYR', 2, 
    'Qualite payeur', 'Qualite payeur', 0, 1, 0, 
    'CLT.QLTPYR', 0, NULL, 'Qualite payeur');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('2825', 'frmListeCLTCPT01', 'CLT', 'FRD', 22, 
    'Fraudeur', 'Fraudeur', 0, 1, 0, 
    'CLT.FRD', 0, NULL, 'Fraudeur');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('2826', 'frmListeCLTCPT01', 'CLT', 'PMTLTG', 22, 
    'Nombre de paiements litigieux', 'Nombre de paiements litigieux', 0, 1, 0, 
    'CLT.PMTLTG', 0, NULL, 'Nombre de paiements litigieux');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('2827', 'frmListeCLTCPT01', 'CLT', 'INTBNC', 22, 
    'Interdit bancaire', 'Ineligible', 0, 1, 0, 
    'CLT.INTBNC', 0, NULL, 'Ineligible');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('2828', 'frmListeCLTCPT01', 'CLT', 'CHPLIB2', 30, 
    '2nd free field', '2nd free field', 0, 0, 0, 
    'CLT.CHPLIB2', 0, NULL, '2nd free field');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('2829', 'frmListeCLTCPT01', 'CLT', 'C3', 22, 
    'Adaptable field check-box 3', 'Adaptable field check-box 3', 0, 0, 0, 
    'CLT.C3', 0, NULL, 'Adaptable field check-box 3');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('2830', 'frmListeCLTCPT01', 'CLT', 'ADRSTR5', 50, 
    'Description of structured address 5', 'Description of structured address 5', 0, 0, 0, 
    'CLT.ADRSTR5', 0, NULL, 'Description of structured address 5');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('2831', 'frmListeCLTCPT01', 'CLT', 'SQCCPTCLT', 22, 
    'Customer account serial number', 'Customer account serial number', 0, 1, 0, 
    'CLT.SQCCPTCLT', 0, NULL, 'Customer account serial number');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('2832', 'frmListeCLTCPT01', 'CLT', 'IDTCODSNS', 6, 
    'Sensibilité client', 'Sensibilite client', 0, 1, 0, 
    'CLT.IDTCODSNS', 0, NULL, 'Sensibilite client');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('2833', 'frmListeCLTCPT01', 'CLT', 'DATMAJ', 7, 
    'Date de mise a jour', 'Date de mise a jour', 0, 1, 0, 
    'TO_CHAR(CLT.DATMAJ,''DD/MM/YYYY'')', 0, NULL, 'Date de mise a jour');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('2834', 'frmListeCLTCPT01', 'CLT', 'FLB', 20, 
    'Fax du bureau', 'Fax du bureau', 0, 1, 0, 
    'CLT.FLB', 0, NULL, 'Fax du bureau');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('2835', 'frmListeCLTCPT01', 'CLT', 'IDTT4', 6, 
    'Associated typology ID 4', 'Associated typology ID 4', 0, 0, 0, 
    'CLT.IDTT4', 0, NULL, 'Associated typology ID 4');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('2836', 'frmListeCLTCPT01', 'CLT', 'IDTT5', 6, 
    'Associated typology ID 5', 'Associated typology ID 5', 0, 0, 0, 
    'CLT.IDTT5', 0, NULL, 'Associated typology ID 5');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('2837', 'frmListeCLTCPT01', 'CLT', 'C4', 22, 
    'Adaptable field check-box 4', 'Adaptable field check-box 4', 0, 0, 0, 
    'CLT.C4', 0, NULL, 'Adaptable field check-box 4');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('2838', 'frmListeCLTCPT01', 'CLT', 'D2', 7, 
    'Adaptable field date 2', 'Adaptable field date 2', 0, 0, 0, 
    'TO_CHAR(CLT.D2,''DD/MM/YYYY'')', 0, NULL, 'Adaptable field date 2');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('2839', 'frmListeCLTCPT01', 'CLT', 'ADRSTR2', 50, 
    'Description of structured address 2', 'Description of structured address 2', 0, 0, 0, 
    'CLT.ADRSTR2', 0, NULL, 'Description of structured address 2');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('2840', 'frmListeCLTCPT01', 'CLT', 'CHPLIB5', 254, 
    'Lib 5', 'Lib 5', 0, 0, 0, 
    'CLT.CHPLIB5', 0, NULL, 'Lib 5');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('2841', 'frmListeCLTCPT01', 'CLT', 'MAIL', 40, 
    'Messagerie electronique', 'Messagerie electronique', 0, 1, 0, 
    'CLT.MAIL', 0, NULL, 'Messagerie electronique');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('2842', 'frmListeCLTCPT01', 'CLT', 'IDTQLT', 6, 
    'Qualité client', 'Type of customer ID', 0, 1, 0, 
    'CLT.IDTQLT', 0, NULL, 'Type of customer ID');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('2843', 'frmListeCLTCPT01', 'CLT', 'NUMAVN', 22, 
    'Numéro d''avenant', 'avenant', 0, 1, 0, 
    'CLT.NUMAVN', 0, NULL, 'avenant');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('2844', 'frmListeCLTCPT01', 'CLT', 'IDTT1', 6, 
    'Associated typology ID 1', 'Associated typology ID 1', 0, 0, 0, 
    'CLT.IDTT1', 0, NULL, 'Associated typology ID 1');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('2845', 'frmListeCLTCPT01', 'CLT', 'A2', 40, 
    'Adaptable field string 2', 'Adaptable field string 2', 0, 0, 0, 
    'CLT.A2', 0, NULL, 'Adaptable field string 2');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('2846', 'frmListeCLTCPT01', 'CLT', 'N3', 22, 
    'Adaptable field number 3', 'Adaptable field number 3', 0, 0, 0, 
    'CLT.N3', 0, NULL, 'Adaptable field number 3');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('2847', 'frmListeCLTCPT01', 'CLT', 'C5', 22, 
    'Adaptable field check-box 5', 'Adaptable field check-box 5', 0, 0, 0, 
    'CLT.C5', 0, NULL, 'Adaptable field check-box 5');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('2848', 'frmListeCLTCPT01', 'CLT', 'D3', 7, 
    'Adaptable field date 3', 'Adaptable field date 3', 0, 0, 0, 
    'TO_CHAR(CLT.D3,''DD/MM/YYYY'')', 0, NULL, 'Adaptable field date 3');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('2849', 'frmListeCLTCPT01', 'CLT', 'D5', 7, 
    'Adaptable field date 5', 'Adaptable field date 5', 0, 0, 0, 
    'TO_CHAR(CLT.D5,''DD/MM/YYYY'')', 0, NULL, 'Adaptable field date 5');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('2850', 'frmListeCLTCPT01', 'CLT', 'ADRSTR8', 50, 
    'Description of structured address 8', 'Description of structured address 8', 0, 0, 0, 
    'CLT.ADRSTR8', 0, NULL, 'Description of structured address 8');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('2851', 'frmListeCLTCPT01', 'CLT', 'SQCCNT', 22, 
    'Contact serial number', 'Contact serial number', 0, 1, 0, 
    'CLT.SQCCNT', 0, NULL, 'Contact serial number');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('2852', 'frmListeCLTCPT01', 'CLT', 'PRN', 40, 
    'Prenom', 'Prenom', 0, 1, 0, 
    'CLT.PRN', 0, NULL, 'Prenom');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('2853', 'frmListeCLTCPT01', 'CLT', 'IDTPRMCTR', 10, 
    'Code du premier contrat', 'Code du premier contrat', 0, 1, 0, 
    'CLT.IDTPRMCTR', 0, NULL, 'Code du premier contrat');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('2854', 'frmListeCLTCPT01', 'CLT', 'IDTSQCGNR', 22, 
    'General identifier', 'General identifier', 0, 0, 0, 
    'CLT.IDTSQCGNR', 0, NULL, 'General identifier');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('2855', 'frmListeCLTCPT01', 'CLT', 'A3', 40, 
    'Adaptable field string 3', 'Adaptable field string 3', 0, 0, 0, 
    'CLT.A3', 0, NULL, 'Adaptable field string 3');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('2856', 'frmListeCLTCPT01', 'CLT', 'D1', 7, 
    'Adaptable field date 1', 'Adaptable field date 1', 0, 0, 0, 
    'TO_CHAR(CLT.D1,''DD/MM/YYYY'')', 0, NULL, 'Adaptable field date 1');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('2857', 'frmListeCLTCPT01', 'CLT', 'D4', 7, 
    'Adaptable field date 4', 'Adaptable field date 4', 0, 0, 0, 
    'TO_CHAR(CLT.D4,''DD/MM/YYYY'')', 0, NULL, 'Adaptable field date 4');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('2858', 'frmListeCLTCPT01', 'CLT', 'ADRSTR6', 50, 
    'Description of structured address 6', 'Description of structured address 6', 0, 0, 0, 
    'CLT.ADRSTR6', 0, NULL, 'Description of structured address 6');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('2859', 'frmListeCLTCPT01', 'CLT', 'ADRSTR10', 50, 
    'Description of structured address 10', 'Description of structured address 10', 0, 0, 0, 
    'CLT.ADRSTR10', 0, NULL, 'Description of structured address 10');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('2860', 'frmListeCLTCPT01', 'CLT', 'X7SNDXNOM', 40, 
    'Fonction de recherche pour Nom', 'Fonction de recherche pour Nom', 0, 0, 0, 
    'CLT.X7SNDXNOM', 0, NULL, 'Fonction de recherche pour Nom');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('2861', 'frmListeCLTCPT01', 'CLT', 'IDTCLT', 6, 
    'Code', 'Code', 0, 1, 0, 
    'CLT.IDTCLT', 0, NULL, 'Code');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('2862', 'frmListeCLTCPT01', 'CLT', 'TLD', 20, 
    'Telephone du domicile', 'Telephone du domicile', 0, 1, 0, 
    'CLT.TLD', 0, NULL, 'Telephone du domicile');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('2863', 'frmListeCLTCPT01', 'CLT', 'ANCRFR', 20, 
    'Ancienne reference', 'Ancienne reference', 0, 1, 0, 
    'CLT.ANCRFR', 0, NULL, 'Ancienne reference');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('2864', 'frmListeCLTCPT01', 'CLT', 'ADRLBR', 2000, 
    'Adresse', 'Adresse', 0, 1, 0, 
    'SUBSTR(REPLACE(REPLACE(CLT.ADRLBR,CHR(10),'' ''),CHR(13),'' ''),1,254)', 0, NULL, 'Adresse');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('2865', 'frmListeCLTCPT01', 'CLT', 'RGR', 22, 
    'Client regroupe', 'Client regroupe', 0, 1, 0, 
    'CLT.RGR', 0, NULL, 'Client regroupe');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('2677', 'frmListeTCHCPR01', 'PNTCPG', 'C3', 22, 
    'Adaptable field check-box 3', 'Adaptable field check-box 3', 0, 0, 0, 
    'PNTCPG.C3', 0, NULL, 'Adaptable field check-box 3');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('2678', 'frmListeTCHCPR01', 'PNTCPG', 'IDTTRNTYP', 6, 
    'Standard round ID', 'Tournee type', 0, 1, 0, 
    'PNTCPG.IDTTRNTYP', 0, NULL, 'Tournee type');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('2679', 'frmListeTCHCPR01', 'PNTCPG', 'IDTCNTOPR', 6, 
    'Operational center ID', 'Operational center ID', 0, 1, 0, 
    'PNTCPG.IDTCNTOPR', 0, NULL, 'Operational center ID');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('2680', 'frmListeTCHCPR01', 'PNTCPG', 'D4', 7, 
    'Adaptable field check-box 4', 'Adaptable field check-box 4', 0, 0, 0, 
    'TO_CHAR(PNTCPG.D4,''DD/MM/YYYY'')', 0, NULL, 'Adaptable field check-box 4');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('2681', 'frmListeTCHCPR01', 'PNTCPG', 'ANCRFR', 20, 
    'Ancienne reference', 'Ancienne reference', 0, 1, 0, 
    'PNTCPG.ANCRFR', 0, NULL, 'Ancienne reference');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('2682', 'frmListeTCHCPR01', 'PNTCPG', 'ADRSTR3', 50, 
    'Description of structured address 3', 'Description of structured address 3', 0, 0, 0, 
    'PNTCPG.ADRSTR3', 0, NULL, 'Description of structured address 3');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('2683', 'frmListeTCHCPR01', 'PNTCPG', 'ADRSTR4', 50, 
    'Description of structured address 4', 'Description of structured address 4', 0, 0, 0, 
    'PNTCPG.ADRSTR4', 0, NULL, 'Description of structured address 4');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('2684', 'frmListeTCHCPR01', 'PNTCPG', 'ADRSTR6', 50, 
    'Description of structured address 6', 'Description of structured address 6', 0, 0, 0, 
    'PNTCPG.ADRSTR6', 0, NULL, 'Description of structured address 6');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('2685', 'frmListeTCHCPR01', 'PNTCPG', 'DEBDRNPRDRLV', 7, 
    'Début de période', 'Début de période', 0, 1, 0, 
    'TO_CHAR(PNTCPG.DEBDRNPRDRLV,''DD/MM/YYYY'')', 0, NULL, 'Début de période');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('2686', 'frmListeTCHCPR01', 'PNTCPG', 'NBRCND', 22, 
    'Number of conductors', 'Number of conductors', 0, 0, 0, 
    'PNTCPG.NBRCND', 0, NULL, 'Number of conductors');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('2687', 'frmListeTCHCPR01', 'PNTCPG', 'T1', 6, 
    'Adaptable field typologie 1', 'Adaptable field typologie 1', 0, 0, 0, 
    'PNTCPG.T1', 0, NULL, 'Adaptable field typologie 1');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('2688', 'frmListeTCHCPR01', 'PNTCPG', 'A5', 40, 
    'Adaptable field string 5', 'Adaptable field string 5', 0, 0, 0, 
    'PNTCPG.A5', 0, NULL, 'Adaptable field string 5');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('2689', 'frmListeTCHCPR01', 'PNTCPG', 'D1', 7, 
    'Adaptable field check-box 1', 'Adaptable field check-box 1', 0, 0, 0, 
    'TO_CHAR(PNTCPG.D1,''DD/MM/YYYY'')', 0, NULL, 'Adaptable field check-box 1');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('2690', 'frmListeTCHCPR01', 'PNTCPG', 'IDTTYPCPG', 22, 
    'Type de métrage', 'Type de métrage', 0, 1, 0, 
    'PNTCPG.IDTTYPCPG', 0, NULL, 'Type de métrage');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('2691', 'frmListeTCHCPR01', 'PNTCPG', 'IDTT2', 6, 
    'Associated typology ID 2', 'Associated typology ID 2', 0, 0, 0, 
    'PNTCPG.IDTT2', 0, NULL, 'Associated typology ID 2');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('2692', 'frmListeTCHCPR01', 'PNTCPG', 'N2', 22, 
    'Adaptable field number 2', 'Adaptable field number 2', 0, 0, 0, 
    'PNTCPG.N2', 0, NULL, 'Adaptable field number 2');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('2693', 'frmListeTCHCPR01', 'PNTCPG', 'C1', 22, 
    'Adaptable field check-box 1', 'Adaptable field check-box 1', 0, 0, 0, 
    'PNTCPG.C1', 0, NULL, 'Adaptable field check-box 1');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('2694', 'frmListeTCHCPR01', 'PNTCPG', 'IDTSRV', 22, 
    'Service Id', 'Service Id', 0, 1, 0, 
    'PNTCPG.IDTSRV', 0, NULL, 'Service Id');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('2695', 'frmListeTCHCPR01', 'PNTCPG', 'D2', 7, 
    'Adaptable field check-box 2', 'Adaptable field check-box 2', 0, 0, 0, 
    'TO_CHAR(PNTCPG.D2,''DD/MM/YYYY'')', 0, NULL, 'Adaptable field check-box 2');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('2696', 'frmListeTCHCPR01', 'PNTCPG', 'DATCNN', 7, 
    'Date de connexion', 'Date de connexion', 0, 1, 0, 
    'TO_CHAR(PNTCPG.DATCNN,''DD/MM/YYYY'')', 0, NULL, 'Date de connexion');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('2697', 'frmListeTCHCPR01', 'PNTCPG', 'T3', 6, 
    'Adaptable field typologie 3', 'Adaptable field typologie 3', 0, 0, 0, 
    'PNTCPG.T3', 0, NULL, 'Adaptable field typologie 3');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('2698', 'frmListeTCHCPR01', 'PNTCPG', 'IDTT4', 6, 
    'Associated typology ID 4', 'Associated typology ID 4', 0, 0, 0, 
    'PNTCPG.IDTT4', 0, NULL, 'Associated typology ID 4');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('2699', 'frmListeTCHCPR01', 'PNTCPG', 'A2', 40, 
    'Adaptable field string 2', 'Adaptable field string 2', 0, 0, 0, 
    'PNTCPG.A2', 0, NULL, 'Adaptable field string 2');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('2700', 'frmListeTCHCPR01', 'PNTCPG', 'N4', 22, 
    'Adaptable field number 4', 'Adaptable field number 4', 0, 0, 0, 
    'PNTCPG.N4', 0, NULL, 'Adaptable field number 4');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('2701', 'frmListeTCHCPR01', 'PNTCPG', 'FINDRNPRDRLV', 7, 
    'Fin de la dernière période théorique de relève', 'Fin de la dernière période théorique de relève', 0, 1, 0, 
    'TO_CHAR(PNTCPG.FINDRNPRDRLV,''DD/MM/YYYY'')', 0, NULL, 'Fin de la dernière période théorique de relève');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('2702', 'frmListeTCHCPR01', 'PNTCPG', 'NUMENQ', 22, 
    'numéro recensement', 'numéro recensement', 0, 1, 0, 
    'PNTCPG.NUMENQ', 0, NULL, 'numéro recensement');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('2703', 'frmListeTCHCPR01', 'PNTCPG', 'CLBMINDSJ', 22, 
    'Minimum calibre circuit breaker', 'Minimum calibre circuit breaker', 0, 0, 0, 
    'PNTCPG.CLBMINDSJ', 0, NULL, 'Minimum calibre circuit breaker');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('2704', 'frmListeTCHCPR01', 'PNTCPG', 'DATCOU', 7, 
    'Date de coupure', 'Date de coupure', 0, 1, 0, 
    'TO_CHAR(PNTCPG.DATCOU,''DD/MM/YYYY'')', 0, NULL, 'Date de coupure');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('2705', 'frmListeTCHCPR01', 'PNTCPG', 'A4', 40, 
    'Adaptable field string 4', 'Adaptable field string 4', 0, 0, 0, 
    'PNTCPG.A4', 0, NULL, 'Adaptable field string 4');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('2706', 'frmListeTCHCPR01', 'PNTCPG', 'N3', 22, 
    'Adaptable field number 3', 'Adaptable field number 3', 0, 0, 0, 
    'PNTCPG.N3', 0, NULL, 'Adaptable field number 3');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('2707', 'frmListeTCHCPR01', 'PNTCPG', 'C4', 22, 
    'Adaptable field check-box 4', 'Adaptable field check-box 4', 0, 0, 0, 
    'PNTCPG.C4', 0, NULL, 'Adaptable field check-box 4');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('2708', 'frmListeTCHCPR01', 'PNTCPG', 'C5', 22, 
    'Adaptable field check-box 5', 'Adaptable field check-box 5', 0, 0, 0, 
    'PNTCPG.C5', 0, NULL, 'Adaptable field check-box 5');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('2709', 'frmListeTCHCPR01', 'PNTCPG', 'D5', 7, 
    'Adaptable field check-box 5', 'Adaptable field check-box 5', 0, 0, 0, 
    'TO_CHAR(PNTCPG.D5,''DD/MM/YYYY'')', 0, NULL, 'Adaptable field check-box 5');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('2710', 'frmListeTCHCPR01', 'PNTCPG', 'ADRSTR7', 50, 
    'Description of structured address 7', 'Description of structured address 7', 0, 0, 0, 
    'PNTCPG.ADRSTR7', 0, NULL, 'Description of structured address 7');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('2711', 'frmListeTCHCPR01', 'PNTCPG', 'IDTSIG', 22, 
    'Code SIG', 'Code SIG', 0, 1, 0, 
    'PNTCPG.IDTSIG', 0, NULL, 'Code SIG');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('2712', 'frmListeTCHCPR01', 'PNTCPG', 'RGLDSJ', 22, 
    'Circuit breaker setting', 'Circuit breaker setting', 0, 1, 0, 
    'PNTCPG.RGLDSJ', 0, NULL, 'Circuit breaker setting');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('2713', 'frmListeTCHCPR01', 'PNTCPG', 'PSSTRS', 22, 
    'Puissance du transformateur', 'Puissance du transformateur', 0, 0, 0, 
    'PNTCPG.PSSTRS', 0, NULL, 'Puissance du transformateur');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('2714', 'frmListeTCHCPR01', 'PNTCPG', 'IDTT3', 6, 
    'Associated typology ID 3', 'Associated typology ID 3', 0, 0, 0, 
    'PNTCPG.IDTT3', 0, NULL, 'Associated typology ID 3');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('2715', 'frmListeTCHCPR01', 'PNTCPG', 'MTRAGT', 6, 
    'ID of the employee who carries out updating', 'ID of the employee who carries out updating', 0, 1, 0, 
    'PNTCPG.MTRAGT', 0, NULL, 'ID of the employee who carries out updating');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('2716', 'frmListeTCHCPR01', 'PNTCPG', 'ADRSTR2', 50, 
    'Description of structured address 2', 'Description of structured address 2', 0, 0, 0, 
    'PNTCPG.ADRSTR2', 0, NULL, 'Description of structured address 2');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('2717', 'frmListeTCHCPR01', 'PNTCPG', 'ADRSTR9', 50, 
    'Description of structured address 9', 'Description of structured address 9', 0, 0, 0, 
    'PNTCPG.ADRSTR9', 0, NULL, 'Description of structured address 9');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('2718', 'frmListeTCHCPR01', 'PNTCPG', 'ADRSTR10', 50, 
    'Description of structured address 10', 'Description of structured address 10', 0, 0, 0, 
    'PNTCPG.ADRSTR10', 0, NULL, 'Description of structured address 10');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('2719', 'frmListeTCHCPR01', 'PNTCPG', 'DATMAJ', 7, 
    'Date de mise à jour', 'Date de mise à jour', 0, 1, 0, 
    'TO_CHAR(PNTCPG.DATMAJ,''DD/MM/YYYY'')', 0, NULL, 'Date de mise à jour');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('2720', 'frmListeTCHCPR01', 'PNTCPG', 'CLBMAXDSJ', 22, 
    'Maximum calibre of circuit breaker', 'Maximum calibre of circuit breaker', 0, 0, 0, 
    'PNTCPG.CLBMAXDSJ', 0, NULL, 'Maximum calibre of circuit breaker');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('2721', 'frmListeTCHCPR01', 'PNTCPG', 'DATDCN', 7, 
    'Date de deconnexion', 'Date de deconnexion', 0, 1, 0, 
    'TO_CHAR(PNTCPG.DATDCN,''DD/MM/YYYY'')', 0, NULL, 'Date de deconnexion');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('2722', 'frmListeTCHCPR01', 'PNTCPG', 'DATRMS', 7, 
    'Date de retablissement', 'Date de retablissement', 0, 1, 0, 
    'TO_CHAR(PNTCPG.DATRMS,''DD/MM/YYYY'')', 0, NULL, 'Date de retablissement');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('2723', 'frmListeTCHCPR01', 'PNTCPG', 'IDTUNTMSRDMT', 22, 
    'Diameter unit of measure ID', 'Diameter unit of measure ID', 0, 1, 0, 
    'PNTCPG.IDTUNTMSRDMT', 0, NULL, 'Diameter unit of measure ID');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('2724', 'frmListeTCHCPR01', 'PNTCPG', 'IDTSQCGNR', 22, 
    'General sequence ID', 'General sequence ID', 0, 0, 0, 
    'PNTCPG.IDTSQCGNR', 0, NULL, 'General sequence ID');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('2725', 'frmListeTCHCPR01', 'PNTCPG', 'IDTT1', 6, 
    'Associated typology ID 1', 'Associated typology ID 1', 0, 0, 0, 
    'PNTCPG.IDTT1', 0, NULL, 'Associated typology ID 1');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('2726', 'frmListeTCHCPR01', 'PNTCPG', 'T5', 6, 
    'Adaptable field typologie 5', 'Adaptable field typologie 5', 0, 0, 0, 
    'PNTCPG.T5', 0, NULL, 'Adaptable field typologie 5');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('2727', 'frmListeTCHCPR01', 'PNTCPG', 'N5', 22, 
    'Adaptable field number 5', 'Adaptable field number 5', 0, 0, 0, 
    'PNTCPG.N5', 0, NULL, 'Adaptable field number 5');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('2728', 'frmListeTCHCPR01', 'PNTCPG', 'D3', 7, 
    'Adaptable field check-box 3', 'Adaptable field check-box 3', 0, 0, 0, 
    'TO_CHAR(PNTCPG.D3,''DD/MM/YYYY'')', 0, NULL, 'Adaptable field check-box 3');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('2729', 'frmListeTCHCPR01', 'PNTCPG', 'ADRSTR5', 50, 
    'Description of structured address 5', 'Description of structured address 5', 0, 0, 0, 
    'PNTCPG.ADRSTR5', 0, NULL, 'Description of structured address 5');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('2730', 'frmListeTCHCPR01', 'PNTLVR', 'Datmaj', 20, 
    'Mise à jour le:', 'Date de mise a jour', 0, 1, 0, 
    'TO_CHAR(PNTLVR.DATMAJ,X7UTIL.FRMDAT)', 0, NULL, 'Date de mise a jour');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('2731', 'frmListeTCHCPR01', 'PNTLVR', 'Occupé', 20, 
    'Occupé', 'Occupé', 0, 1, 0, 
    'DECODE(PNTLVR.Occ,1,''Oui'',''Non'')', 0, NULL, 'Occupé');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('2732', 'frmListeTCHCPR01', 'PNTLVR', 'ADRLBR', 2000, 
    'Adresse', 'Adresse', 0, 1, 0, 
    'SUBSTR(REPLACE(REPLACE(PNTLVR.ADRLBR,CHR(10),'' ''),CHR(13),'' ''),1,254)', 0, NULL, 'Adresse');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('2733', 'frmListeTCHCPR01', 'PNTLVR', 'IdtCntOpr', 10, 
    'CO', 'CO', 0, 1, 0, 
    'PNTLVR.IdtCntOpr', 0, NULL, 'CO');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('2734', 'frmListeTCHCPR01', 'PNTLVR', 'IDTPNTLVR', 200, 
    'Code', 'Identifiant interne', 0, 1, 0, 
    'substr(X7UTIL.LIBPNTLVR(PNTLVR.IDTPNTLVR),1,250)', 0, NULL, 'Identifiant interne');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('2735', 'frmListeTCHCPR01', 'SRV', 'CODSRV', 6, 
    'Service', 'Code', 0, 1, 0, 
    'SRV.CODSRV', 0, NULL, 'Code');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('2736', 'frmListeTCHPLV01', 'PNTLVR', 'N5', 22, 
    'Adaptable field number 5', 'Adaptable field number 5', 0, 0, 0, 
    'PNTLVR.N5', 0, NULL, 'Adaptable field number 5');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('2417', 'frmListeTCHPCG01', 'CPR', 'IDTT2', 6, 
    'Associated typology ID 2', 'Associated typology ID 2', 0, 0, 0, 
    'CPR.IDTT2', 0, NULL, 'Associated typology ID 2');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('2418', 'frmListeTCHPCG01', 'CPR', 'T3', 6, 
    'Adaptable field typology 3', 'Adaptable field typology 3', 0, 0, 0, 
    'CPR.T3', 0, NULL, 'Adaptable field typology 3');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('2419', 'frmListeTCHPCG01', 'CPR', 'T5', 6, 
    'Adaptable field typology 5', 'Adaptable field typology 5', 0, 0, 0, 
    'CPR.T5', 0, NULL, 'Adaptable field typology 5');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('2420', 'frmListeTCHPCG01', 'CPR', 'IDTT5', 6, 
    'Associated typology ID 5', 'Associated typology ID 5', 0, 0, 0, 
    'CPR.IDTT5', 0, NULL, 'Associated typology ID 5');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('2421', 'frmListeTCHPCG01', 'CPR', 'A4', 40, 
    'Adaptable field string 4', 'Adaptable field string 4', 0, 0, 0, 
    'CPR.A4', 0, NULL, 'Adaptable field string 4');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('2422', 'frmListeTCHPCG01', 'CPR', 'DATETL', 7, 
    'Date d''etalonnage', 'Date d''etalonnage', 0, 1, 0, 
    'TO_CHAR(CPR.DATETL,''DD/MM/YYYY'')', 0, NULL, 'Date d''etalonnage');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('2423', 'frmListeTCHPCG01', 'CPR', 'SQCCNS', 22, 
    'Consumption serial number', 'Consumption serial number', 0, 1, 0, 
    'CPR.SQCCNS', 0, NULL, 'Consumption serial number');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('2424', 'frmListeTCHPCG01', 'CPR', 'T1', 6, 
    'Adaptable field typology 1', 'Adaptable field typology 1', 0, 0, 0, 
    'CPR.T1', 0, NULL, 'Adaptable field typology 1');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('2425', 'frmListeTCHPCG01', 'CPR', 'T2', 6, 
    'Adaptable field typology 2', 'Adaptable field typology 2', 0, 0, 0, 
    'CPR.T2', 0, NULL, 'Adaptable field typology 2');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('2426', 'frmListeTCHPCG01', 'CPR', 'A1', 40, 
    'Adaptable field string 1', 'Adaptable field string 1', 0, 0, 0, 
    'CPR.A1', 0, NULL, 'Adaptable field string 1');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('2427', 'frmListeTCHPCG01', 'CPR', 'NUMCPR', 20, 
    'Numero', 'Numero', 0, 1, 0, 
    'CPR.NUMCPR', 0, NULL, 'Numero');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('2428', 'frmListeTCHPCG01', 'CPR', 'N2', 22, 
    'Adaptable field number 2', 'Adaptable field number 2', 0, 0, 0, 
    'CPR.N2', 0, NULL, 'Adaptable field number 2');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('2429', 'frmListeTCHPCG01', 'CPR', 'C2', 22, 
    'Adaptable field check-box 2', 'Adaptable field check-box 2', 0, 0, 0, 
    'CPR.C2', 0, NULL, 'Adaptable field check-box 2');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('2430', 'frmListeTCHPCG01', 'CPR', 'DATRVS', 7, 
    'Date de revision', 'Date de revision', 0, 1, 0, 
    'TO_CHAR(CPR.DATRVS,''DD/MM/YYYY'')', 0, NULL, 'Date de revision');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('2431', 'frmListeTCHPCG01', 'CPR', 'C3', 22, 
    'Adaptable field check-box 3', 'Adaptable field check-box 3', 0, 0, 0, 
    'CPR.C3', 0, NULL, 'Adaptable field check-box 3');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('2432', 'frmListeTCHPCG01', 'CPR', 'D2', 7, 
    'Adaptable field date 2', 'Adaptable field date 2', 0, 0, 0, 
    'TO_CHAR(CPR.D2,''DD/MM/YYYY'')', 0, NULL, 'Adaptable field date 2');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('2433', 'frmListeTCHPCG01', 'CPR', 'D3', 7, 
    'Adaptable field date 3', 'Adaptable field date 3', 0, 0, 0, 
    'TO_CHAR(CPR.D3,''DD/MM/YYYY'')', 0, NULL, 'Adaptable field date 3');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('2434', 'frmListeTCHPCG01', 'CPR', 'IDTCODOBS', 22, 
    'Observation code ID', 'Observation code ID', 0, 1, 0, 
    'CPR.IDTCODOBS', 0, NULL, 'Observation code ID');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('2435', 'frmListeTCHPCG01', 'CPR', 'DATGRN', 7, 
    'Date de garantie', 'Date de garantie', 0, 1, 0, 
    'TO_CHAR(CPR.DATGRN,''DD/MM/YYYY'')', 0, NULL, 'Date de garantie');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('2436', 'frmListeTCHPCG01', 'CLT', 'IDTCNTOPR', 6, 
    'Centre operationnel', 'Centre operationnel', 0, 1, 0, 
    'CLT.IDTCNTOPR', 0, NULL, 'Centre operationnel');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('2437', 'frmListeTCHPCG01', 'CLT', 'NUMAVN', 22, 
    'Numéro d''avenant', 'avenant', 0, 1, 0, 
    'CLT.NUMAVN', 0, NULL, 'avenant');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('2438', 'frmListeTCHPCG01', 'CLT', 'PRN', 40, 
    'Prenom', 'Prenom', 0, 1, 0, 
    'CLT.PRN', 0, NULL, 'Prenom');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('2439', 'frmListeTCHPCG01', 'CLT', 'A3', 40, 
    'Adaptable field string 3', 'Adaptable field string 3', 0, 0, 0, 
    'CLT.A3', 0, NULL, 'Adaptable field string 3');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('2440', 'frmListeTCHPCG01', 'CLT', 'N3', 22, 
    'Adaptable field number 3', 'Adaptable field number 3', 0, 0, 0, 
    'CLT.N3', 0, NULL, 'Adaptable field number 3');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('2441', 'frmListeTCHPCG01', 'CLT', 'C2', 22, 
    'Adaptable field check-box 2', 'Adaptable field check-box 2', 0, 0, 0, 
    'CLT.C2', 0, NULL, 'Adaptable field check-box 2');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('2442', 'frmListeTCHPCG01', 'CLT', 'ADRSTR5', 50, 
    'Description of structured address 5', 'Description of structured address 5', 0, 0, 0, 
    'CLT.ADRSTR5', 0, NULL, 'Description of structured address 5');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('2443', 'frmListeTCHPCG01', 'CLT', 'ADRSTR8', 50, 
    'Description of structured address 8', 'Description of structured address 8', 0, 0, 0, 
    'CLT.ADRSTR8', 0, NULL, 'Description of structured address 8');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('2444', 'frmListeTCHPCG01', 'CLT', 'ADRSTR10', 50, 
    'Description of structured address 10', 'Description of structured address 10', 0, 0, 0, 
    'CLT.ADRSTR10', 0, NULL, 'Description of structured address 10');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('2445', 'frmListeTCHPCG01', 'CLT', 'IDTCTGCLT', 6, 
    'Categorie de client', 'Categorie de client', 0, 1, 0, 
    'CLT.IDTCTGCLT', 0, NULL, 'Categorie de client');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('2446', 'frmListeTCHPCG01', 'CLT', 'TLB', 20, 
    'Telephone du bureau', 'Telephone du bureau', 0, 1, 0, 
    'CLT.TLB', 0, NULL, 'Telephone du bureau');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('2447', 'frmListeTCHPCG01', 'CLT', 'N1', 22, 
    'Adaptable field number 1', 'Adaptable field number 1', 0, 0, 0, 
    'CLT.N1', 0, NULL, 'Adaptable field number 1');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('2448', 'frmListeTCHPCG01', 'CLT', 'N4', 22, 
    'Adaptable field number 4', 'Adaptable field number 4', 0, 0, 0, 
    'CLT.N4', 0, NULL, 'Adaptable field number 4');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('2449', 'frmListeTCHPCG01', 'CLT', 'ADRSTR1', 50, 
    'Description of structured address 1', 'Description of structured address 1', 0, 0, 0, 
    'CLT.ADRSTR1', 0, NULL, 'Description of structured address 1');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('2450', 'frmListeTCHPCG01', 'CLT', 'IDTCLT', 6, 
    'Code', 'Code', 0, 1, 0, 
    'CLT.IDTCLT', 0, NULL, 'Code');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('2451', 'frmListeTCHPCG01', 'CLT', 'AVT_IDTCTR', 10, 
    'NOT USED !!!', 'NOT USED !!!', 0, 0, 0, 
    'CLT.AVT_IDTCTR', 0, NULL, 'NOT USED !!!');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('2452', 'frmListeTCHPCG01', 'CLT', 'AVT_NUMAVN', 22, 
    'NOT USED!!!', 'NOT USED!!!', 0, 0, 0, 
    'CLT.AVT_NUMAVN', 0, NULL, 'NOT USED!!!');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('2453', 'frmListeTCHPCG01', 'CLT', 'TLD', 20, 
    'Telephone du domicile', 'Telephone du domicile', 0, 1, 0, 
    'CLT.TLD', 0, NULL, 'Telephone du domicile');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('2454', 'frmListeTCHPCG01', 'CLT', 'FLD', 20, 
    'Fax du domicile', 'Fax du domicile', 0, 1, 0, 
    'CLT.FLD', 0, NULL, 'Fax du domicile');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('2455', 'frmListeTCHPCG01', 'CLT', 'ANCRFR', 20, 
    'Ancienne reference', 'Ancienne reference', 0, 1, 0, 
    'CLT.ANCRFR', 0, NULL, 'Ancienne reference');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('2456', 'frmListeTCHPCG01', 'CLT', 'QLTPYR', 2, 
    'Qualite payeur', 'Qualite payeur', 0, 1, 0, 
    'CLT.QLTPYR', 0, NULL, 'Qualite payeur');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('2457', 'frmListeTCHPCG01', 'CLT', 'RGR', 22, 
    'Client regroupe', 'Client regroupe', 0, 1, 0, 
    'CLT.RGR', 0, NULL, 'Client regroupe');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('2458', 'frmListeTCHPCG01', 'CLT', 'T2', 6, 
    'Adaptable field typology 2', 'Adaptable field typology 2', 0, 0, 0, 
    'CLT.T2', 0, NULL, 'Adaptable field typology 2');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('2459', 'frmListeTCHPCG01', 'CLT', 'D1', 7, 
    'Adaptable field date 1', 'Adaptable field date 1', 0, 0, 0, 
    'TO_CHAR(CLT.D1,''DD/MM/YYYY'')', 0, NULL, 'Adaptable field date 1');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('2460', 'frmListeTCHPCG01', 'CLT', 'NOM', 40, 
    'Nom', 'Nom', 0, 1, 0, 
    'CLT.NOM', 0, NULL, 'Nom');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('2461', 'frmListeTCHPCG01', 'CLT', 'ADRLBR', 2000, 
    'Adresse', 'Adresse', 0, 1, 0, 
    'SUBSTR(REPLACE(REPLACE(CLT.ADRLBR,CHR(10),'' ''),CHR(13),'' ''),1,254)', 0, NULL, 'Adresse');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('2462', 'frmListeTCHPCG01', 'CLT', 'INTBNC', 22, 
    'Interdit bancaire', 'Ineligible', 0, 1, 0, 
    'CLT.INTBNC', 0, NULL, 'Ineligible');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('2463', 'frmListeTCHPCG01', 'CLT', 'IDTPRMCTR', 10, 
    'Code du premier contrat', 'Code du premier contrat', 0, 1, 0, 
    'CLT.IDTPRMCTR', 0, NULL, 'Code du premier contrat');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('2464', 'frmListeTCHPCG01', 'CLT', 'IDTT2', 6, 
    'Associated typology ID 2', 'Associated typology ID 2', 0, 0, 0, 
    'CLT.IDTT2', 0, NULL, 'Associated typology ID 2');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('2465', 'frmListeTCHPCG01', 'CLT', 'IDTT4', 6, 
    'Associated typology ID 4', 'Associated typology ID 4', 0, 0, 0, 
    'CLT.IDTT4', 0, NULL, 'Associated typology ID 4');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('2466', 'frmListeTCHPCG01', 'CLT', 'T5', 6, 
    'Adaptable field typology 5', 'Adaptable field typology 5', 0, 0, 0, 
    'CLT.T5', 0, NULL, 'Adaptable field typology 5');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('2467', 'frmListeTCHPCG01', 'CLT', 'A4', 40, 
    'Adaptable field string 4', 'Adaptable field string 4', 0, 0, 0, 
    'CLT.A4', 0, NULL, 'Adaptable field string 4');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('2468', 'frmListeTCHPCG01', 'CLT', 'A5', 40, 
    'Adaptable field string 5', 'Adaptable field string 5', 0, 0, 0, 
    'CLT.A5', 0, NULL, 'Adaptable field string 5');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('2469', 'frmListeTCHPCG01', 'CLT', 'N5', 22, 
    'Adaptable field number 5', 'Adaptable field number 5', 0, 0, 0, 
    'CLT.N5', 0, NULL, 'Adaptable field number 5');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('2470', 'frmListeTCHPCG01', 'CLT', 'D5', 7, 
    'Adaptable field date 5', 'Adaptable field date 5', 0, 0, 0, 
    'TO_CHAR(CLT.D5,''DD/MM/YYYY'')', 0, NULL, 'Adaptable field date 5');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('2471', 'frmListeTCHPCG01', 'CLT', 'ADRSTR3', 50, 
    'Description of structured address 3', 'Description of structured address 3', 0, 0, 0, 
    'CLT.ADRSTR3', 0, NULL, 'Description of structured address 3');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('2472', 'frmListeTCHPCG01', 'CLT', 'ADRSTR7', 50, 
    'Description of structured address 7', 'Description of structured address 7', 0, 0, 0, 
    'CLT.ADRSTR7', 0, NULL, 'Description of structured address 7');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('2473', 'frmListeTCHPCG01', 'CLT', 'TLP', 20, 
    'Telephone portable', 'Telephone portable', 0, 1, 0, 
    'CLT.TLP', 0, NULL, 'Telephone portable');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('2474', 'frmListeTCHPCG01', 'CLT', 'IDTCODSNS', 6, 
    'Sensibilité client', 'Sensibilite client', 0, 1, 0, 
    'CLT.IDTCODSNS', 0, NULL, 'Sensibilite client');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('2475', 'frmListeTCHPCG01', 'CLT', 'DATMAJ', 7, 
    'Date de mise a jour', 'Date de mise a jour', 0, 1, 0, 
    'TO_CHAR(CLT.DATMAJ,''DD/MM/YYYY'')', 0, NULL, 'Date de mise a jour');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('2476', 'frmListeTCHPCG01', 'CLT', 'CHPLIB3', 30, 
    '3rd free field', '3rd free field', 0, 0, 0, 
    'CLT.CHPLIB3', 0, NULL, '3rd free field');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('2477', 'frmListeTCHPCG01', 'CLT', 'CHPLIB4', 30, 
    '4th free field', '4th free field', 0, 0, 0, 
    'CLT.CHPLIB4', 0, NULL, '4th free field');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('2478', 'frmListeTCHPCG01', 'CLT', 'T1', 6, 
    'Adaptable field typology 1', 'Adaptable field typology 1', 0, 0, 0, 
    'CLT.T1', 0, NULL, 'Adaptable field typology 1');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('2479', 'frmListeTCHPCG01', 'CLT', 'IDTT1', 6, 
    'Associated typology ID 1', 'Associated typology ID 1', 0, 0, 0, 
    'CLT.IDTT1', 0, NULL, 'Associated typology ID 1');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('2480', 'frmListeTCHPCG01', 'CLT', 'IDTT5', 6, 
    'Associated typology ID 5', 'Associated typology ID 5', 0, 0, 0, 
    'CLT.IDTT5', 0, NULL, 'Associated typology ID 5');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('2481', 'frmListeTCHPCG01', 'CLT', 'C3', 22, 
    'Adaptable field check-box 3', 'Adaptable field check-box 3', 0, 0, 0, 
    'CLT.C3', 0, NULL, 'Adaptable field check-box 3');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('2482', 'frmListeTCHPCG01', 'CLT', 'D3', 7, 
    'Adaptable field date 3', 'Adaptable field date 3', 0, 0, 0, 
    'TO_CHAR(CLT.D3,''DD/MM/YYYY'')', 0, NULL, 'Adaptable field date 3');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('2483', 'frmListeTCHPCG01', 'CLT', 'D4', 7, 
    'Adaptable field date 4', 'Adaptable field date 4', 0, 0, 0, 
    'TO_CHAR(CLT.D4,''DD/MM/YYYY'')', 0, NULL, 'Adaptable field date 4');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('2484', 'frmListeTCHPCG01', 'CLT', 'SQCCNT', 22, 
    'Contact serial number', 'Contact serial number', 0, 1, 0, 
    'CLT.SQCCNT', 0, NULL, 'Contact serial number');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('2485', 'frmListeTCHPCG01', 'CLT', 'MTRAGT', 6, 
    'Agent', 'Agent', 0, 1, 0, 
    'CLT.MTRAGT', 0, NULL, 'Agent');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('2486', 'frmListeTCHPCG01', 'CLT', 'CHPLIB1', 30, 
    '1st free field', '1st free field', 0, 0, 0, 
    'CLT.CHPLIB1', 0, NULL, '1st free field');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('2487', 'frmListeTCHPCG01', 'CLT', 'T4', 6, 
    'Adaptable field typology 4', 'Adaptable field typology 4', 0, 0, 0, 
    'CLT.T4', 0, NULL, 'Adaptable field typology 4');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('2488', 'frmListeTCHPCG01', 'CLT', 'A2', 40, 
    'Adaptable field string 2', 'Adaptable field string 2', 0, 0, 0, 
    'CLT.A2', 0, NULL, 'Adaptable field string 2');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('2489', 'frmListeTCHPCG01', 'CLT', 'N2', 22, 
    'Adaptable field number 2', 'Adaptable field number 2', 0, 0, 0, 
    'CLT.N2', 0, NULL, 'Adaptable field number 2');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('2490', 'frmListeTCHPCG01', 'CLT', 'C4', 22, 
    'Adaptable field check-box 4', 'Adaptable field check-box 4', 0, 0, 0, 
    'CLT.C4', 0, NULL, 'Adaptable field check-box 4');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('2491', 'frmListeTCHPCG01', 'CLT', 'C5', 22, 
    'Adaptable field check-box 5', 'Adaptable field check-box 5', 0, 0, 0, 
    'CLT.C5', 0, NULL, 'Adaptable field check-box 5');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('2492', 'frmListeTCHPCG01', 'CLT', 'D2', 7, 
    'Adaptable field date 2', 'Adaptable field date 2', 0, 0, 0, 
    'TO_CHAR(CLT.D2,''DD/MM/YYYY'')', 0, NULL, 'Adaptable field date 2');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('2493', 'frmListeTCHPCG01', 'CLT', 'MAIL', 40, 
    'Messagerie electronique', 'Messagerie electronique', 0, 1, 0, 
    'CLT.MAIL', 0, NULL, 'Messagerie electronique');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('2494', 'frmListeTCHPCG01', 'CLT', 'SQCCPTCLT', 22, 
    'Customer account serial number', 'Customer account serial number', 0, 1, 0, 
    'CLT.SQCCPTCLT', 0, NULL, 'Customer account serial number');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('2495', 'frmListeTCHPCG01', 'CLT', 'X7SNDXNOM', 40, 
    'Fonction de recherche pour Nom', 'Fonction de recherche pour Nom', 0, 0, 0, 
    'CLT.X7SNDXNOM', 0, NULL, 'Fonction de recherche pour Nom');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('2496', 'frmListeTCHPCG01', 'CLT', 'IDTCTR', 10, 
    'Contract ID', 'Contract ID', 0, 1, 0, 
    'CLT.IDTCTR', 0, NULL, 'Contract ID');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('2497', 'frmListeTCHPCG01', 'CLT', 'FRD', 22, 
    'Fraudeur', 'Fraudeur', 0, 1, 0, 
    'CLT.FRD', 0, NULL, 'Fraudeur');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('2498', 'frmListeTCHPCG01', 'CLT', 'PMTLTG', 22, 
    'Nombre de paiements litigieux', 'Nombre de paiements litigieux', 0, 1, 0, 
    'CLT.PMTLTG', 0, NULL, 'Nombre de paiements litigieux');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('2499', 'frmListeTCHPCG01', 'CLT', 'RTRIPY', 22, 
    'Nombre de retours d''impaye', 'Nombre de retours d''impaye', 0, 1, 0, 
    'CLT.RTRIPY', 0, NULL, 'Nombre de retours d''impaye');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('2500', 'frmListeTCHPCG01', 'CLT', 'T3', 6, 
    'Adaptable field typology 3', 'Adaptable field typology 3', 0, 0, 0, 
    'CLT.T3', 0, NULL, 'Adaptable field typology 3');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('2501', 'frmListeTCHPCG01', 'CLT', 'IDTT3', 6, 
    'Associated typology ID 3', 'Associated typology ID 3', 0, 0, 0, 
    'CLT.IDTT3', 0, NULL, 'Associated typology ID 3');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('2502', 'frmListeTCHPCG01', 'CLT', 'C1', 22, 
    'Adaptable field check-box 1', 'Adaptable field check-box 1', 0, 0, 0, 
    'CLT.C1', 0, NULL, 'Adaptable field check-box 1');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('2503', 'frmListeTCHPCG01', 'CLT', 'ADRSTR2', 50, 
    'Description of structured address 2', 'Description of structured address 2', 0, 0, 0, 
    'CLT.ADRSTR2', 0, NULL, 'Description of structured address 2');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('2504', 'frmListeTCHPCG01', 'CLT', 'CHPLIB5', 254, 
    'Lib 5', 'Lib 5', 0, 0, 0, 
    'CLT.CHPLIB5', 0, NULL, 'Lib 5');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('2505', 'frmListeTCHPCG01', 'CLT', 'IDTQLT', 6, 
    'Qualité client', 'Type of customer ID', 0, 1, 0, 
    'CLT.IDTQLT', 0, NULL, 'Type of customer ID');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('2506', 'frmListeTCHPCG01', 'CLT', 'FLB', 20, 
    'Fax du bureau', 'Fax du bureau', 0, 1, 0, 
    'CLT.FLB', 0, NULL, 'Fax du bureau');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('2507', 'frmListeTCHPCG01', 'CLT', 'CHPLIB2', 30, 
    '2nd free field', '2nd free field', 0, 0, 0, 
    'CLT.CHPLIB2', 0, NULL, '2nd free field');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('2508', 'frmListeTCHPCG01', 'CLT', 'IDTSQCGNR', 22, 
    'General identifier', 'General identifier', 0, 0, 0, 
    'CLT.IDTSQCGNR', 0, NULL, 'General identifier');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('2509', 'frmListeTCHPCG01', 'CLT', 'A1', 40, 
    'Adaptable field string 1', 'Adaptable field string 1', 0, 0, 0, 
    'CLT.A1', 0, NULL, 'Adaptable field string 1');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('2510', 'frmListeTCHPCG01', 'CLT', 'ADRSTR4', 50, 
    'Description of structured address 4', 'Description of structured address 4', 0, 0, 0, 
    'CLT.ADRSTR4', 0, NULL, 'Description of structured address 4');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('2511', 'frmListeTCHPCG01', 'CLT', 'IDTCLT', 6, 
    'Nombre de contrat', 'Code', 0, 1, 0, 
    '(SELECT COUNT(*) FROM CTR WHERE CTR.IDTCLTDST = CLT.IDTCLT)', 0, NULL, 'Code');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('2512', 'frmListeTCHPCG01', 'CLT', 'ADRSTR6', 50, 
    'Description of structured address 6', 'Description of structured address 6', 0, 0, 0, 
    'CLT.ADRSTR6', 0, NULL, 'Description of structured address 6');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('2513', 'frmListeTCHPCG01', 'CLT', 'ADRSTR9', 254, 
    'Description of structured address 9', 'Description of structured address 9', 0, 0, 0, 
    'CLT.ADRSTR9', 0, NULL, 'Description of structured address 9');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('2514', 'frmListeTCHPCG01', 'PNTLVR', 'IDTPNTLVR', 200, 
    'Code', 'Identifiant interne', 0, 1, 0, 
    'substr(X7UTIL.LIBPNTLVR(PNTLVR.IDTPNTLVR),1,250)', 0, NULL, 'Identifiant interne');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('2515', 'frmListeTCHPCG01', 'PNTLVR', 'IdtCntOpr', 10, 
    'CO', 'CO', 0, 1, 0, 
    'PNTLVR.IdtCntOpr', 0, NULL, 'CO');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('2516', 'frmListeTCHPCG01', 'PNTLVR', 'Datmaj', 20, 
    'Mise à jour le:', 'Date de mise a jour', 0, 1, 0, 
    'TO_CHAR(PNTLVR.DATMAJ,X7UTIL.FRMDAT)', 0, NULL, 'Date de mise a jour');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('2517', 'frmListeTCHPCG01', 'PNTLVR', 'Occupé', 20, 
    'Occupé', 'Occupé', 0, 1, 0, 
    'DECODE(PNTLVR.Occ,1,''Oui'',''Non'')', 0, NULL, 'Occupé');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('2518', 'frmListeTCHCPR01', 'CLT', 'IDTCLT', 6, 
    'Code', 'Code', 0, 1, 0, 
    'CLT.IDTCLT', 0, NULL, 'Code');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('2519', 'frmListeTCHCPR01', 'CLT', 'MTRAGT', 6, 
    'Agent', 'Agent', 0, 1, 0, 
    'CLT.MTRAGT', 0, NULL, 'Agent');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('2520', 'frmListeTCHCPR01', 'CLT', 'QLTPYR', 2, 
    'Qualite payeur', 'Qualite payeur', 0, 1, 0, 
    'CLT.QLTPYR', 0, NULL, 'Qualite payeur');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('2521', 'frmListeTCHCPR01', 'CLT', 'FRD', 22, 
    'Fraudeur', 'Fraudeur', 0, 1, 0, 
    'CLT.FRD', 0, NULL, 'Fraudeur');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('2522', 'frmListeTCHCPR01', 'CLT', 'INTBNC', 22, 
    'Interdit bancaire', 'Ineligible', 0, 1, 0, 
    'CLT.INTBNC', 0, NULL, 'Ineligible');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('2523', 'frmListeTCHCPR01', 'CLT', 'D5', 7, 
    'Adaptable field date 5', 'Adaptable field date 5', 0, 0, 0, 
    'TO_CHAR(CLT.D5,''DD/MM/YYYY'')', 0, NULL, 'Adaptable field date 5');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('2524', 'frmListeTCHCPR01', 'CLT', 'ADRSTR3', 50, 
    'Description of structured address 3', 'Description of structured address 3', 0, 0, 0, 
    'CLT.ADRSTR3', 0, NULL, 'Description of structured address 3');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('2525', 'frmListeTCHCPR01', 'CLT', 'IDTCODSNS', 6, 
    'Sensibilité client', 'Sensibilite client', 0, 1, 0, 
    'CLT.IDTCODSNS', 0, NULL, 'Sensibilite client');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('2526', 'frmListeTCHCPR01', 'CLT', 'PRN', 40, 
    'Prenom', 'Prenom', 0, 1, 0, 
    'CLT.PRN', 0, NULL, 'Prenom');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('2527', 'frmListeTCHCPR01', 'CLT', 'CHPLIB1', 30, 
    '1st free field', '1st free field', 0, 0, 0, 
    'CLT.CHPLIB1', 0, NULL, '1st free field');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('2528', 'frmListeTCHCPR01', 'CLT', 'A1', 40, 
    'Adaptable field string 1', 'Adaptable field string 1', 0, 0, 0, 
    'CLT.A1', 0, NULL, 'Adaptable field string 1');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('2529', 'frmListeTCHCPR01', 'CLT', 'A5', 40, 
    'Adaptable field string 5', 'Adaptable field string 5', 0, 0, 0, 
    'CLT.A5', 0, NULL, 'Adaptable field string 5');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('2530', 'frmListeTCHCPR01', 'CLT', 'SQCCPTCLT', 22, 
    'Customer account serial number', 'Customer account serial number', 0, 1, 0, 
    'CLT.SQCCPTCLT', 0, NULL, 'Customer account serial number');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('2531', 'frmListeTCHCPR01', 'CLT', 'X7SNDXNOM', 40, 
    'Fonction de recherche pour Nom', 'Fonction de recherche pour Nom', 0, 0, 0, 
    'CLT.X7SNDXNOM', 0, NULL, 'Fonction de recherche pour Nom');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('2532', 'frmListeTCHCPR01', 'CLT', 'FLB', 20, 
    'Fax du bureau', 'Fax du bureau', 0, 1, 0, 
    'CLT.FLB', 0, NULL, 'Fax du bureau');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('2533', 'frmListeTCHCPR01', 'CLT', 'PMTLTG', 22, 
    'Nombre de paiements litigieux', 'Nombre de paiements litigieux', 0, 1, 0, 
    'CLT.PMTLTG', 0, NULL, 'Nombre de paiements litigieux');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('2534', 'frmListeTCHCPR01', 'CLT', 'CHPLIB2', 30, 
    '2nd free field', '2nd free field', 0, 0, 0, 
    'CLT.CHPLIB2', 0, NULL, '2nd free field');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('2535', 'frmListeTCHCPR01', 'CLT', 'T2', 6, 
    'Adaptable field typology 2', 'Adaptable field typology 2', 0, 0, 0, 
    'CLT.T2', 0, NULL, 'Adaptable field typology 2');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('2536', 'frmListeTCHCPR01', 'CLT', 'T3', 6, 
    'Adaptable field typology 3', 'Adaptable field typology 3', 0, 0, 0, 
    'CLT.T3', 0, NULL, 'Adaptable field typology 3');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('2537', 'frmListeTCHCPR01', 'CLT', 'IDTT3', 6, 
    'Associated typology ID 3', 'Associated typology ID 3', 0, 0, 0, 
    'CLT.IDTT3', 0, NULL, 'Associated typology ID 3');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('2538', 'frmListeTCHCPR01', 'CLT', 'A2', 40, 
    'Adaptable field string 2', 'Adaptable field string 2', 0, 0, 0, 
    'CLT.A2', 0, NULL, 'Adaptable field string 2');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('2539', 'frmListeTCHCPR01', 'CLT', 'A4', 40, 
    'Adaptable field string 4', 'Adaptable field string 4', 0, 0, 0, 
    'CLT.A4', 0, NULL, 'Adaptable field string 4');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('2540', 'frmListeTCHCPR01', 'CLT', 'N3', 22, 
    'Adaptable field number 3', 'Adaptable field number 3', 0, 0, 0, 
    'CLT.N3', 0, NULL, 'Adaptable field number 3');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('2541', 'frmListeTCHCPR01', 'CLT', 'C1', 22, 
    'Adaptable field check-box 1', 'Adaptable field check-box 1', 0, 0, 0, 
    'CLT.C1', 0, NULL, 'Adaptable field check-box 1');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('2542', 'frmListeTCHCPR01', 'CLT', 'C5', 22, 
    'Adaptable field check-box 5', 'Adaptable field check-box 5', 0, 0, 0, 
    'CLT.C5', 0, NULL, 'Adaptable field check-box 5');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('2543', 'frmListeTCHCPR01', 'CLT', 'D1', 7, 
    'Adaptable field date 1', 'Adaptable field date 1', 0, 0, 0, 
    'TO_CHAR(CLT.D1,''DD/MM/YYYY'')', 0, NULL, 'Adaptable field date 1');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('2544', 'frmListeTCHCPR01', 'CLT', 'D4', 7, 
    'Adaptable field date 4', 'Adaptable field date 4', 0, 0, 0, 
    'TO_CHAR(CLT.D4,''DD/MM/YYYY'')', 0, NULL, 'Adaptable field date 4');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('2545', 'frmListeTCHCPR01', 'CLT', 'MAIL', 40, 
    'Messagerie electronique', 'Messagerie electronique', 0, 1, 0, 
    'CLT.MAIL', 0, NULL, 'Messagerie electronique');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('2546', 'frmListeTCHCPR01', 'CLT', 'IDTCTR', 10, 
    'Contract ID', 'Contract ID', 0, 1, 0, 
    'CLT.IDTCTR', 0, NULL, 'Contract ID');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('2547', 'frmListeTCHCPR01', 'CLT', 'ADRLBR', 2000, 
    'Adresse', 'Adresse', 0, 1, 0, 
    'SUBSTR(REPLACE(REPLACE(CLT.ADRLBR,CHR(10),'' ''),CHR(13),'' ''),1,254)', 0, NULL, 'Adresse');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('2548', 'frmListeTCHCPR01', 'CLT', 'RGR', 22, 
    'Client regroupe', 'Client regroupe', 0, 1, 0, 
    'CLT.RGR', 0, NULL, 'Client regroupe');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('2549', 'frmListeTCHCPR01', 'CLT', 'CHPLIB4', 30, 
    '4th free field', '4th free field', 0, 0, 0, 
    'CLT.CHPLIB4', 0, NULL, '4th free field');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('2550', 'frmListeTCHCPR01', 'CLT', 'T1', 6, 
    'Adaptable field typology 1', 'Adaptable field typology 1', 0, 0, 0, 
    'CLT.T1', 0, NULL, 'Adaptable field typology 1');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('2551', 'frmListeTCHCPR01', 'CLT', 'IDTT4', 6, 
    'Associated typology ID 4', 'Associated typology ID 4', 0, 0, 0, 
    'CLT.IDTT4', 0, NULL, 'Associated typology ID 4');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('2552', 'frmListeTCHCPR01', 'CLT', 'T5', 6, 
    'Adaptable field typology 5', 'Adaptable field typology 5', 0, 0, 0, 
    'CLT.T5', 0, NULL, 'Adaptable field typology 5');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('2553', 'frmListeTCHCPR01', 'CLT', 'C3', 22, 
    'Adaptable field check-box 3', 'Adaptable field check-box 3', 0, 0, 0, 
    'CLT.C3', 0, NULL, 'Adaptable field check-box 3');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('2554', 'frmListeTCHCPR01', 'CLT', 'ADRSTR1', 50, 
    'Description of structured address 1', 'Description of structured address 1', 0, 0, 0, 
    'CLT.ADRSTR1', 0, NULL, 'Description of structured address 1');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('2555', 'frmListeTCHCPR01', 'CLT', 'ADRSTR7', 50, 
    'Description of structured address 7', 'Description of structured address 7', 0, 0, 0, 
    'CLT.ADRSTR7', 0, NULL, 'Description of structured address 7');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('2556', 'frmListeTCHCPR01', 'CLT', 'ADRSTR10', 50, 
    'Description of structured address 10', 'Description of structured address 10', 0, 0, 0, 
    'CLT.ADRSTR10', 0, NULL, 'Description of structured address 10');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('2557', 'frmListeTCHCPR01', 'CLT', 'IDTQLT', 6, 
    'Qualité client', 'Type of customer ID', 0, 1, 0, 
    'CLT.IDTQLT', 0, NULL, 'Type of customer ID');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('2558', 'frmListeTCHCPR01', 'CLT', 'IDTCTGCLT', 6, 
    'Categorie de client', 'Categorie de client', 0, 1, 0, 
    'CLT.IDTCTGCLT', 0, NULL, 'Categorie de client');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('2559', 'frmListeTCHCPR01', 'CLT', 'AVT_IDTCTR', 10, 
    'NOT USED !!!', 'NOT USED !!!', 0, 0, 0, 
    'CLT.AVT_IDTCTR', 0, NULL, 'NOT USED !!!');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('2560', 'frmListeTCHCPR01', 'CLT', 'AVT_NUMAVN', 22, 
    'NOT USED!!!', 'NOT USED!!!', 0, 0, 0, 
    'CLT.AVT_NUMAVN', 0, NULL, 'NOT USED!!!');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('2561', 'frmListeTCHCPR01', 'CLT', 'DATMAJ', 7, 
    'Date de mise a jour', 'Date de mise a jour', 0, 1, 0, 
    'TO_CHAR(CLT.DATMAJ,''DD/MM/YYYY'')', 0, NULL, 'Date de mise a jour');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('2562', 'frmListeTCHCPR01', 'CLT', 'NOM', 40, 
    'Nom', 'Nom', 0, 1, 0, 
    'CLT.NOM', 0, NULL, 'Nom');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('2563', 'frmListeTCHCPR01', 'CLT', 'TLB', 20, 
    'Telephone du bureau', 'Telephone du bureau', 0, 1, 0, 
    'CLT.TLB', 0, NULL, 'Telephone du bureau');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('2564', 'frmListeTCHCPR01', 'CLT', 'N2', 22, 
    'Adaptable field number 2', 'Adaptable field number 2', 0, 0, 0, 
    'CLT.N2', 0, NULL, 'Adaptable field number 2');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('2565', 'frmListeTCHCPR01', 'CLT', 'N4', 22, 
    'Adaptable field number 4', 'Adaptable field number 4', 0, 0, 0, 
    'CLT.N4', 0, NULL, 'Adaptable field number 4');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('2566', 'frmListeTCHCPR01', 'CLT', 'D2', 7, 
    'Adaptable field date 2', 'Adaptable field date 2', 0, 0, 0, 
    'TO_CHAR(CLT.D2,''DD/MM/YYYY'')', 0, NULL, 'Adaptable field date 2');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('2567', 'frmListeTCHCPR01', 'CLT', 'ADRSTR2', 50, 
    'Description of structured address 2', 'Description of structured address 2', 0, 0, 0, 
    'CLT.ADRSTR2', 0, NULL, 'Description of structured address 2');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('2568', 'frmListeTCHCPR01', 'CLT', 'IDTCLT', 6, 
    'Nombre de contrat', 'Code', 0, 1, 0, 
    '(SELECT COUNT(*) FROM CTR WHERE CTR.IDTCLTDST = CLT.IDTCLT)', 0, NULL, 'Code');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('2569', 'frmListeTCHCPR01', 'CLT', 'TLP', 20, 
    'Telephone portable', 'Telephone portable', 0, 1, 0, 
    'CLT.TLP', 0, NULL, 'Telephone portable');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('2570', 'frmListeTCHCPR01', 'CLT', 'SQCCNT', 22, 
    'Contact serial number', 'Contact serial number', 0, 1, 0, 
    'CLT.SQCCNT', 0, NULL, 'Contact serial number');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('2571', 'frmListeTCHCPR01', 'CLT', 'NUMAVN', 22, 
    'Numéro d''avenant', 'avenant', 0, 1, 0, 
    'CLT.NUMAVN', 0, NULL, 'avenant');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('2572', 'frmListeTCHCPR01', 'CLT', 'CHPLIB3', 30, 
    '3rd free field', '3rd free field', 0, 0, 0, 
    'CLT.CHPLIB3', 0, NULL, '3rd free field');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('2573', 'frmListeTCHCPR01', 'CLT', 'IDTT1', 6, 
    'Associated typology ID 1', 'Associated typology ID 1', 0, 0, 0, 
    'CLT.IDTT1', 0, NULL, 'Associated typology ID 1');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('2574', 'frmListeTCHCPR01', 'CLT', 'IDTT2', 6, 
    'Associated typology ID 2', 'Associated typology ID 2', 0, 0, 0, 
    'CLT.IDTT2', 0, NULL, 'Associated typology ID 2');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('2575', 'frmListeTCHCPR01', 'CLT', 'A3', 40, 
    'Adaptable field string 3', 'Adaptable field string 3', 0, 0, 0, 
    'CLT.A3', 0, NULL, 'Adaptable field string 3');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('2576', 'frmListeTCHCPR01', 'CLT', 'N5', 22, 
    'Adaptable field number 5', 'Adaptable field number 5', 0, 0, 0, 
    'CLT.N5', 0, NULL, 'Adaptable field number 5');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('2577', 'frmListeTCHCPR01', 'CLT', 'C4', 22, 
    'Adaptable field check-box 4', 'Adaptable field check-box 4', 0, 0, 0, 
    'CLT.C4', 0, NULL, 'Adaptable field check-box 4');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('2578', 'frmListeTCHCPR01', 'CLT', 'ADRSTR5', 50, 
    'Description of structured address 5', 'Description of structured address 5', 0, 0, 0, 
    'CLT.ADRSTR5', 0, NULL, 'Description of structured address 5');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('2579', 'frmListeTCHCPR01', 'CLT', 'IDTCNTOPR', 6, 
    'Centre operationnel', 'Centre operationnel', 0, 1, 0, 
    'CLT.IDTCNTOPR', 0, NULL, 'Centre operationnel');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('2580', 'frmListeTCHCPR01', 'CLT', 'TLD', 20, 
    'Telephone du domicile', 'Telephone du domicile', 0, 1, 0, 
    'CLT.TLD', 0, NULL, 'Telephone du domicile');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('2581', 'frmListeTCHCPR01', 'CLT', 'FLD', 20, 
    'Fax du domicile', 'Fax du domicile', 0, 1, 0, 
    'CLT.FLD', 0, NULL, 'Fax du domicile');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('2582', 'frmListeTCHCPR01', 'CLT', 'IDTPRMCTR', 10, 
    'Code du premier contrat', 'Code du premier contrat', 0, 1, 0, 
    'CLT.IDTPRMCTR', 0, NULL, 'Code du premier contrat');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('2583', 'frmListeTCHCPR01', 'CLT', 'RTRIPY', 22, 
    'Nombre de retours d''impaye', 'Nombre de retours d''impaye', 0, 1, 0, 
    'CLT.RTRIPY', 0, NULL, 'Nombre de retours d''impaye');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('2584', 'frmListeTCHCPR01', 'CLT', 'C2', 22, 
    'Adaptable field check-box 2', 'Adaptable field check-box 2', 0, 0, 0, 
    'CLT.C2', 0, NULL, 'Adaptable field check-box 2');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('2585', 'frmListeTCHCPR01', 'CLT', 'D3', 7, 
    'Adaptable field date 3', 'Adaptable field date 3', 0, 0, 0, 
    'TO_CHAR(CLT.D3,''DD/MM/YYYY'')', 0, NULL, 'Adaptable field date 3');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('2586', 'frmListeTCHCPR01', 'CLT', 'ADRSTR8', 50, 
    'Description of structured address 8', 'Description of structured address 8', 0, 0, 0, 
    'CLT.ADRSTR8', 0, NULL, 'Description of structured address 8');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('2587', 'frmListeTCHCPR01', 'CLT', 'ADRSTR9', 254, 
    'Description of structured address 9', 'Description of structured address 9', 0, 0, 0, 
    'CLT.ADRSTR9', 0, NULL, 'Description of structured address 9');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('2588', 'frmListeTCHCPR01', 'CLT', 'ANCRFR', 20, 
    'Ancienne reference', 'Ancienne reference', 0, 1, 0, 
    'CLT.ANCRFR', 0, NULL, 'Ancienne reference');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('2589', 'frmListeTCHCPR01', 'CLT', 'IDTSQCGNR', 22, 
    'General identifier', 'General identifier', 0, 0, 0, 
    'CLT.IDTSQCGNR', 0, NULL, 'General identifier');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('2590', 'frmListeTCHCPR01', 'CLT', 'T4', 6, 
    'Adaptable field typology 4', 'Adaptable field typology 4', 0, 0, 0, 
    'CLT.T4', 0, NULL, 'Adaptable field typology 4');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('2591', 'frmListeTCHCPR01', 'CLT', 'IDTT5', 6, 
    'Associated typology ID 5', 'Associated typology ID 5', 0, 0, 0, 
    'CLT.IDTT5', 0, NULL, 'Associated typology ID 5');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('2592', 'frmListeTCHCPR01', 'CLT', 'N1', 22, 
    'Adaptable field number 1', 'Adaptable field number 1', 0, 0, 0, 
    'CLT.N1', 0, NULL, 'Adaptable field number 1');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('2593', 'frmListeTCHCPR01', 'CLT', 'ADRSTR4', 50, 
    'Description of structured address 4', 'Description of structured address 4', 0, 0, 0, 
    'CLT.ADRSTR4', 0, NULL, 'Description of structured address 4');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('2594', 'frmListeTCHCPR01', 'CLT', 'ADRSTR6', 50, 
    'Description of structured address 6', 'Description of structured address 6', 0, 0, 0, 
    'CLT.ADRSTR6', 0, NULL, 'Description of structured address 6');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('2595', 'frmListeTCHCPR01', 'CLT', 'CHPLIB5', 254, 
    'Lib 5', 'Lib 5', 0, 0, 0, 
    'CLT.CHPLIB5', 0, NULL, 'Lib 5');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('2596', 'frmListeTCHCPR01', 'CTR_ALL', 'IDTT5', 6, 
    'Associated typology ID 5', 'Associated typology ID 5', 0, 0, 0, 
    'CTR_ALL.IDTT5', 0, NULL, 'Associated typology ID 5');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('2597', 'frmListeTCHCPR01', 'CTR_ALL', 'A1', 40, 
    'Adaptable field string 1', 'Adaptable field string 1', 0, 0, 0, 
    'CTR_ALL.A1', 0, NULL, 'Adaptable field string 1');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('2598', 'frmListeTCHCPR01', 'CTR_ALL', 'N5', 22, 
    'Adaptable field number 5', 'Adaptable field number 5', 0, 0, 0, 
    'CTR_ALL.N5', 0, NULL, 'Adaptable field number 5');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('2599', 'frmListeTCHCPR01', 'CTR_ALL', 'IDTPNTLVR', 22, 
    'Delivery point ID', 'Delivery point ID', 0, 1, 0, 
    'CTR_ALL.IDTPNTLVR', 0, NULL, 'Delivery point ID');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('2600', 'frmListeTCHCPR01', 'CTR_ALL', 'IDTRCVTYP', 6, 
    'Debt recovery type ID', 'Recouvrement type', 0, 1, 0, 
    'CTR_ALL.IDTRCVTYP', 0, NULL, 'Recouvrement type');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('2601', 'frmListeTCHCPR01', 'CTR_ALL', 'NUMCPTBNC', 30, 
    'Bank account number', 'Compte', 0, 1, 0, 
    'CTR_ALL.NUMCPTBNC', 0, NULL, 'Compte');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('2602', 'frmListeTCHCPR01', 'CTR_ALL', 'CLERIB', 2, 
    'Bank account code', 'Bank account code', 0, 1, 0, 
    'CTR_ALL.CLERIB', 0, NULL, 'Bank account code');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('2603', 'frmListeTCHCPR01', 'CTR_ALL', 'T1', 6, 
    'Adaptable field typologie 1', 'Adaptable field typologie 1', 0, 0, 0, 
    'CTR_ALL.T1', 0, NULL, 'Adaptable field typologie 1');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('2604', 'frmListeTCHCPR01', 'CTR_ALL', 'T2', 6, 
    'Adaptable field typologie 2', 'Adaptable field typologie 2', 0, 0, 0, 
    'CTR_ALL.T2', 0, NULL, 'Adaptable field typologie 2');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('2605', 'frmListeTCHCPR01', 'CTR_ALL', 'D3', 7, 
    'Adaptable field date 3', 'Adaptable field date 3', 0, 0, 0, 
    'TO_CHAR(CTR_ALL.D3,''DD/MM/YYYY'')', 0, NULL, 'Adaptable field date 3');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('2606', 'frmListeTCHCPR01', 'CTR_ALL', 'ANCRFR', 20, 
    'Ancienne reference', 'Ancienne reference', 0, 1, 0, 
    'CTR_ALL.ANCRFR', 0, NULL, 'Ancienne reference');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('2607', 'frmListeTCHCPR01', 'CTR_ALL', 'N2', 22, 
    'Adaptable field number 2', 'Adaptable field number 2', 0, 0, 0, 
    'CTR_ALL.N2', 0, NULL, 'Adaptable field number 2');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('2608', 'frmListeTCHCPR01', 'CTR_ALL', 'CODTYPCTR', 6, 
    'Type of contract code', 'Type de contrat', 0, 1, 0, 
    'CTR_ALL.CODTYPCTR', 0, NULL, 'Type de contrat');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('2609', 'frmListeTCHCPR01', 'CTR_ALL', 'IDTSQCGNR', 22, 
    'General identifier', 'General identifier', 0, 1, 0, 
    'CTR_ALL.IDTSQCGNR', 0, NULL, 'General identifier');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('2610', 'frmListeTCHCPR01', 'CTR_ALL', 'IDTBNQ', 6, 
    'Banque', 'Banque', 0, 1, 0, 
    'CTR_ALL.IDTBNQ', 0, NULL, 'Banque');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('2611', 'frmListeTCHCPR01', 'CTR_ALL', 'MTRAGT', 6, 
    'ID of the employee who carries out updating', 'ID of the employee who carries out updating', 0, 1, 0, 
    'CTR_ALL.MTRAGT', 0, NULL, 'ID of the employee who carries out updating');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('2612', 'frmListeTCHCPR01', 'CTR_ALL', 'DATDRNFCT', 7, 
    'Date of last billing of the contract', 'Date de derniere facturation', 0, 1, 0, 
    'TO_CHAR(CTR_ALL.DATDRNFCT,''DD/MM/YYYY'')', 0, NULL, 'Date de derniere facturation');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('2613', 'frmListeTCHCPR01', 'CTR_ALL', 'T3', 6, 
    'Adaptable field typologie 3', 'Adaptable field typologie 3', 0, 0, 0, 
    'CTR_ALL.T3', 0, NULL, 'Adaptable field typologie 3');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('2614', 'frmListeTCHCPR01', 'CTR_ALL', 'A5', 40, 
    'Adaptable field string 5', 'Adaptable field string 5', 0, 0, 0, 
    'CTR_ALL.A5', 0, NULL, 'Adaptable field string 5');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('2615', 'frmListeTCHCPR01', 'CTR_ALL', 'N1', 22, 
    'Adaptable field number 1', 'Adaptable field number 1', 0, 0, 0, 
    'CTR_ALL.N1', 0, NULL, 'Adaptable field number 1');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('2616', 'frmListeTCHCPR01', 'CTR_ALL', 'IDTPNTCPG', 22, 
    'Metering point ID', 'Metering point ID', 0, 1, 0, 
    'CTR_ALL.IDTPNTCPG', 0, NULL, 'Metering point ID');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('2617', 'frmListeTCHCPR01', 'CTR_ALL', 'IDTLOTFAC', 6, 
    'Billing batch ID', 'Lot de facturation', 0, 1, 0, 
    'CTR_ALL.IDTLOTFAC', 0, NULL, 'Lot de facturation');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('2866', 'frmListeCLTCPT01', 'CLT', 'N2', 22, 
    'Adaptable field number 2', 'Adaptable field number 2', 0, 0, 0, 
    'CLT.N2', 0, NULL, 'Adaptable field number 2');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('2867', 'frmListeCLTCPT01', 'CLT', 'N4', 22, 
    'Adaptable field number 4', 'Adaptable field number 4', 0, 0, 0, 
    'CLT.N4', 0, NULL, 'Adaptable field number 4');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('2868', 'frmListeCLTCPT01', 'CLT', 'C1', 22, 
    'Adaptable field check-box 1', 'Adaptable field check-box 1', 0, 0, 0, 
    'CLT.C1', 0, NULL, 'Adaptable field check-box 1');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('2869', 'frmListeCLTCPT01', 'CLT', 'ADRSTR1', 50, 
    'Description of structured address 1', 'Description of structured address 1', 0, 0, 0, 
    'CLT.ADRSTR1', 0, NULL, 'Description of structured address 1');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('2870', 'frmListeCLTCPT01', 'CLT', 'TLP', 20, 
    'Telephone portable', 'Telephone portable', 0, 1, 0, 
    'CLT.TLP', 0, NULL, 'Telephone portable');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('2871', 'frmListeCLTCPT01', 'OPR', 'Sld', 12, 
    'Solde', 'Solde de l''operation', 0, 1, 0, 
    'CASE WHEN OPR.SLD <= 0 THEN NULL ELSE OPR.SLD END', 0, NULL, 'Solde de l''operation');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('2872', 'frmListeCLTCPT01', 'OPR', 'Sld', 12, 
    'Non affecté', 'Solde de l''operation', 0, 1, 0, 
    'CASE WHEN OPR.SLD >= 0 THEN NULL ELSE OPR.SLD * -1 END', 0, NULL, 'Solde de l''operation');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('2873', 'frmListeCLTCPT01', 'OPR', 'RFR', 12, 
    'Référence', 'Reference', 0, 1, 0, 
    'OPR.RFR', 0, NULL, 'Reference');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('2874', 'frmListeCLTCPT01', 'OPR', 'DATVLR', 12, 
    'Valeur', 'Date de valeur', 0, 1, 0, 
    'TO_CHAR(OPR.DATVLR,X7UTIL.FRMDAT)', 0, NULL, 'Date de valeur');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('2875', 'frmListeCLTCPT01', 'OPR', 'Mnt', 12, 
    'Débit', 'Montant', 0, 1, 0, 
    'CASE WHEN OPR.MNT <= 0 THEN NULL ELSE OPR.MNT END', 0, NULL, 'Montant');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('2876', 'frmListeCLTCPT01', 'OPR', 'INFCPL', 12, 
    'Information complémentaires', 'Information complémentaires', 0, 1, 0, 
    'OPR.INFCPL', 0, NULL, 'Information complémentaires');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('2877', 'frmListeCLTCPT01', 'OPR', 'IDTAGT', 6, 
    'Code agent', 'Code agent', 0, 1, 0, 
    'OPR.IDTAGT', 0, NULL, 'Code agent');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('2878', 'frmListeCLTCPT01', 'OPR', 'IDTBNQ', 6, 
    'Code banque', 'Code banque', 0, 1, 0, 
    'OPR.IDTBNQ', 0, NULL, 'Code banque');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('2879', 'frmListeCLTCPT01', 'OPR', 'IDTCSS', 6, 
    'Code caisse', 'Code caisse', 0, 1, 0, 
    'OPR.IDTCSS', 0, NULL, 'Code caisse');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('2880', 'frmListeCLTCPT01', 'OPR', 'NUMCHQ', 15, 
    'Numero de cheque', 'Numero de cheque', 0, 1, 0, 
    'OPR.NUMCHQ', 0, NULL, 'Numero de cheque');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('2881', 'frmListeCLTCPT01', 'OPR', 'PRN', 22, 
    'Prenom agent', 'Prenom agent', 0, 1, 0, 
    '(SELECT PRN FROM AGT WHERE AGT.IDTAGT = OPR.IDTAGT)', 0, NULL, 'Prenom agent');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('2882', 'frmListeCLTCPT01', 'OPR', 'Mnt', 12, 
    'Crédit', 'Montant', 0, 1, 0, 
    'CASE WHEN OPR.MNT >= 0 THEN NULL ELSE OPR.MNT * -1 END', 0, NULL, 'Montant');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('2883', 'frmListeCLTCPT01', 'OPR', 'IDTCLT', 12, 
    'Client', 'Client', 0, 1, 0, 
    'OPR.IDTCLT', 0, NULL, 'Client');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('2884', 'frmListeCLTCPT01', 'OPR', 'DATEXG', 12, 
    'Exigibilité', 'Date d''exigibilite', 0, 1, 0, 
    'TO_CHAR(OPR.DATEXG,X7UTIL.FRMDAT)', 0, NULL, 'Date d''exigibilite');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('2885', 'frmListeCLTCPT01', 'OPR', 'NOM', 22, 
    'Nom agent', 'Nom agent', 0, 1, 0, 
    '(SELECT NOM FROM AGT WHERE AGT.IDTAGT = OPR.IDTAGT)', 0, NULL, 'Nom agent');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('2886', 'frmListeCLTCPT01', 'OPR', 'TYPOPR', 22, 
    'Type de l''operation', 'Type de l''operation', 0, 1, 0, 
    '(SELECT TYPOPR FROM TYPOPR WHERE TYPOPR.IDTTYPOPR = OPR.IDTTYPOPR)', 0, NULL, 'Type de l''operation');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('2887', 'frmListeCLTCPT01', 'OPR', 'DATCRT', 12, 
    'Date', 'Date de creation', 0, 1, 0, 
    'TO_CHAR(OPR.DATCRT,X7UTIL.FRMDAT)', 0, NULL, 'Date de creation');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('2888', 'frmListeCLTCPT01', 'OPR', 'IDTOPR', 22, 
    'Identifiant de l''operation', 'Identifiant de l''operation', 0, 1, 0, 
    'OPR.IDTOPR', 0, NULL, 'Identifiant de l''operation');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('2889', 'frmListeCLTCPT01', 'OPR', 'IDTGCH', 6, 
    'Code guichet', 'Code guichet', 0, 1, 0, 
    'OPR.IDTGCH', 0, NULL, 'Code guichet');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('2890', 'frmListeCLTCPT01', 'OPR', 'LIB', 22, 
    'Situation libelle', 'Situation libelle', 0, 1, 0, 
    '(SELECT LIB FROM SIT S WHERE S.IDTSIT = OPR.IDTSIT)', 0, NULL, 'Situation libelle');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('2891', 'frmListeCLTCPT01', 'OPR', 'IDTDVS', 6, 
    'Code devise', 'Code devise', 0, 1, 0, 
    'OPR.IDTDVS', 0, NULL, 'Code devise');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('2892', 'frmListeCLTCPT01', 'CTR_ALL', 'IDTT5', 6, 
    'Associated typology ID 5', 'Associated typology ID 5', 0, 0, 0, 
    'CTR_ALL.IDTT5', 0, NULL, 'Associated typology ID 5');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('2893', 'frmListeCLTCPT01', 'CTR_ALL', 'A2', 40, 
    'Adaptable field string 2', 'Adaptable field string 2', 0, 0, 0, 
    'CTR_ALL.A2', 0, NULL, 'Adaptable field string 2');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('2894', 'frmListeCLTCPT01', 'CTR_ALL', 'IDTCODSNS', 6, 
    'Code sensibilité', 'Code sensibilité', 0, 1, 0, 
    'CTR_ALL.IDTCODSNS', 0, NULL, 'Code sensibilité');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('2895', 'frmListeCLTCPT01', 'CTR_ALL', 'DPTGRN', 22, 
    'Deposit', 'Depot de garantie', 0, 1, 0, 
    'CTR_ALL.DPTGRN', 0, NULL, 'Depot de garantie');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('2896', 'frmListeCLTCPT01', 'CTR_ALL', 'IDTSRV', 22, 
    'Service ID (1 <WATER>, 2 <LV electricity>, 3 <MV electricity>, ...)', 'Service ID (1 <WATER>, 2 <LV electricity>, 3 <MV electricity>, ...)', 0, 1, 0, 
    'CTR_ALL.IDTSRV', 0, NULL, 'Service ID (1 <WATER>, 2 <LV electricity>, 3 <MV electricity>, ...)');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('2897', 'frmListeCLTCPT01', 'CTR_ALL', 'IDTBNQ', 6, 
    'Banque', 'Banque', 0, 1, 0, 
    'CTR_ALL.IDTBNQ', 0, NULL, 'Banque');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('2898', 'frmListeCLTCPT01', 'CTR_ALL', 'NUMCPTBNC', 30, 
    'Bank account number', 'Compte', 0, 1, 0, 
    'CTR_ALL.NUMCPTBNC', 0, NULL, 'Compte');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('2899', 'frmListeCLTCPT01', 'CTR_ALL', 'IDTT1', 6, 
    'Associated typology ID 1', 'Associated typology ID 1', 0, 0, 0, 
    'CTR_ALL.IDTT1', 0, NULL, 'Associated typology ID 1');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('2900', 'frmListeCLTCPT01', 'CTR_ALL', 'IDTT3', 6, 
    'Associated typology ID 3', 'Associated typology ID 3', 0, 0, 0, 
    'CTR_ALL.IDTT3', 0, NULL, 'Associated typology ID 3');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('2901', 'frmListeCLTCPT01', 'CTR_ALL', 'T4', 6, 
    'Adaptable field typologie 4', 'Adaptable field typologie 4', 0, 0, 0, 
    'CTR_ALL.T4', 0, NULL, 'Adaptable field typologie 4');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('2902', 'frmListeCLTCPT01', 'CTR_ALL', 'T5', 6, 
    'Adaptable field typologie 5', 'Adaptable field typologie 5', 0, 0, 0, 
    'CTR_ALL.T5', 0, NULL, 'Adaptable field typologie 5');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('2903', 'frmListeCLTCPT01', 'CTR_ALL', 'A4', 40, 
    'Adaptable field string 4', 'Adaptable field string 4', 0, 0, 0, 
    'CTR_ALL.A4', 0, NULL, 'Adaptable field string 4');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('2904', 'frmListeCLTCPT01', 'CTR_ALL', 'N5', 22, 
    'Adaptable field number 5', 'Adaptable field number 5', 0, 0, 0, 
    'CTR_ALL.N5', 0, NULL, 'Adaptable field number 5');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('2905', 'frmListeCLTCPT01', 'CTR_ALL', 'IDTPNTLVR', 22, 
    'Delivery point ID', 'Delivery point ID', 0, 1, 0, 
    'CTR_ALL.IDTPNTLVR', 0, NULL, 'Delivery point ID');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('2906', 'frmListeCLTCPT01', 'CTR_ALL', 'IDTPNTCPG', 22, 
    'Metering point ID', 'Metering point ID', 0, 1, 0, 
    'CTR_ALL.IDTPNTCPG', 0, NULL, 'Metering point ID');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('2907', 'frmListeCLTCPT01', 'CTR_ALL', 'DATDRNFCT', 7, 
    'Date of last billing of the contract', 'Date de derniere facturation', 0, 1, 0, 
    'TO_CHAR(CTR_ALL.DATDRNFCT,''DD/MM/YYYY'')', 0, NULL, 'Date de derniere facturation');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('2908', 'frmListeCLTCPT01', 'CTR_ALL', 'IDTSQCGNR', 22, 
    'General identifier', 'General identifier', 0, 1, 0, 
    'CTR_ALL.IDTSQCGNR', 0, NULL, 'General identifier');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('2909', 'frmListeCLTCPT01', 'CTR_ALL', 'C4', 22, 
    'Adaptable field check-box 4', 'Adaptable field check-box 4', 0, 0, 0, 
    'CTR_ALL.C4', 0, NULL, 'Adaptable field check-box 4');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('2910', 'frmListeCLTCPT01', 'CTR_ALL', 'IDTT4', 6, 
    'Associated typology ID 4', 'Associated typology ID 4', 0, 0, 0, 
    'CTR_ALL.IDTT4', 0, NULL, 'Associated typology ID 4');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('2911', 'frmListeCLTCPT01', 'CTR_ALL', 'A3', 40, 
    'Adaptable field string 3', 'Adaptable field string 3', 0, 0, 0, 
    'CTR_ALL.A3', 0, NULL, 'Adaptable field string 3');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('2912', 'frmListeCLTCPT01', 'CTR_ALL', 'N2', 22, 
    'Adaptable field number 2', 'Adaptable field number 2', 0, 0, 0, 
    'CTR_ALL.N2', 0, NULL, 'Adaptable field number 2');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('2913', 'frmListeCLTCPT01', 'CTR_ALL', 'IDTCNTOPR', 6, 
    'Centre opérationel', 'Centre opérationel', 0, 1, 0, 
    'CTR_ALL.IDTCNTOPR', 0, NULL, 'Centre opérationel');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('2914', 'frmListeCLTCPT01', 'CTR_ALL', 'DEBDRNPRDFCT', 7, 
    'Last billed period (starting date)', 'Last billed period (starting date)', 0, 1, 0, 
    'TO_CHAR(CTR_ALL.DEBDRNPRDFCT,''DD/MM/YYYY'')', 0, NULL, 'Last billed period (starting date)');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('2915', 'frmListeCLTCPT01', 'CTR_ALL', 'FINDRNPRDFCT', 7, 
    'Last billed period (ending date)', '????? ??? ????', 0, 1, 0, 
    'TO_CHAR(CTR_ALL.FINDRNPRDFCT,''DD/MM/YYYY'')', 0, NULL, '????? ??? ????');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('2916', 'frmListeCLTCPT01', 'CTR_ALL', 'NUMINTER', 22, 
    'Work order number', 'Work order number', 0, 1, 0, 
    'CTR_ALL.NUMINTER', 0, NULL, 'Work order number');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('2917', 'frmListeCLTCPT01', 'CTR_ALL', 'D1', 7, 
    'Adaptable field date 1', 'Adaptable field date 1', 0, 0, 0, 
    'TO_CHAR(CTR_ALL.D1,''DD/MM/YYYY'')', 0, NULL, 'Adaptable field date 1');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('2918', 'frmListeCLTCPT01', 'CTR_ALL', 'D2', 7, 
    'Adaptable field date 2', 'Adaptable field date 2', 0, 0, 0, 
    'TO_CHAR(CTR_ALL.D2,''DD/MM/YYYY'')', 0, NULL, 'Adaptable field date 2');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('2919', 'frmListeCLTCPT01', 'CTR_ALL', 'DATSCR', 15, 
    'Souscrit le', 'Date de souscription', 0, 1, 0, 
    'TO_CHAR(CTR_ALL.DATSCR,''DD/MM/YYYY'')', 0, NULL, 'Date de souscription');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('2920', 'frmListeCLTCPT01', 'CTR_ALL', 'T3', 6, 
    'Adaptable field typologie 3', 'Adaptable field typologie 3', 0, 0, 0, 
    'CTR_ALL.T3', 0, NULL, 'Adaptable field typologie 3');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('2921', 'frmListeCLTCPT01', 'CTR_ALL', 'IDTCTR', 60, 
    'Point de livraison', 'Numero', 0, 1, 0, 
    'PNTLVR.IdtDcpGgr || PRMGNR.SprCdf || PNTLVR.NumOrd', 0, NULL, 'Numero');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('2922', 'frmListeCLTCPT01', 'CTR_ALL', 'IDTCTR', 10, 
    'Numéro', 'Numero', 0, 1, 0, 
    'CTR_ALL.IDTCTR', 0, NULL, 'Numero');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('2923', 'frmListeCLTCPT01', 'CTR_ALL', 'DATRSL', 7, 
    'Résilié le', 'Date de resiliation', 0, 1, 0, 
    'TO_CHAR(CTR_ALL.DATRSL,''DD/MM/YYYY'')', 0, NULL, 'Date de resiliation');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('2924', 'frmListeCLTCPT01', 'CTR_ALL', 'SQCAVN', 22, 
    'Amendment serial number', 'Amendment serial number', 0, 1, 0, 
    'CTR_ALL.SQCAVN', 0, NULL, 'Amendment serial number');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('2925', 'frmListeCLTCPT01', 'CTR_ALL', 'IDTRCVTYP', 6, 
    'Debt recovery type ID', 'Recouvrement type', 0, 1, 0, 
    'CTR_ALL.IDTRCVTYP', 0, NULL, 'Recouvrement type');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('2926', 'frmListeCLTCPT01', 'CTR_ALL', 'C2', 22, 
    'Adaptable field check-box 2', 'Adaptable field check-box 2', 0, 0, 0, 
    'CTR_ALL.C2', 0, NULL, 'Adaptable field check-box 2');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('2927', 'frmListeCLTCPT01', 'CTR_ALL', 'DATMAJ', 7, 
    'Date de mise à jour', 'Date de mise à jour', 0, 1, 0, 
    'TO_CHAR(CTR_ALL.DATMAJ,''DD/MM/YYYY'')', 0, NULL, 'Date de mise à jour');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('2928', 'frmListeCLTCPT01', 'CTR_ALL', 'A5', 40, 
    'Adaptable field string 5', 'Adaptable field string 5', 0, 0, 0, 
    'CTR_ALL.A5', 0, NULL, 'Adaptable field string 5');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('3111', 'frmListeAFFCNT01', 'CLT', 'X7SNDXNOM', 40, 
    'Fonction de recherche pour Nom', 'Fonction de recherche pour Nom', 0, 0, 0, 
    'CLT.X7SNDXNOM', 0, NULL, 'Fonction de recherche pour Nom');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('3112', 'frmListeAFFCNT01', 'CLT', 'AVT_IDTCTR', 10, 
    'NOT USED !!!', 'NOT USED !!!', 0, 0, 0, 
    'CLT.AVT_IDTCTR', 0, NULL, 'NOT USED !!!');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('3113', 'frmListeAFFCNT01', 'CLT', 'AVT_NUMAVN', 22, 
    'NOT USED!!!', 'NOT USED!!!', 0, 0, 0, 
    'CLT.AVT_NUMAVN', 0, NULL, 'NOT USED!!!');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('3114', 'frmListeAFFCNT01', 'CLT', 'MTRAGT', 6, 
    'Agent', 'Agent', 0, 1, 0, 
    'CLT.MTRAGT', 0, NULL, 'Agent');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('3115', 'frmListeAFFCNT01', 'CLT', 'CHPLIB4', 30, 
    '4th free field', '4th free field', 0, 0, 0, 
    'CLT.CHPLIB4', 0, NULL, '4th free field');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('3116', 'frmListeAFFCNT01', 'CLT', 'IDTT5', 6, 
    'Associated typology ID 5', 'Associated typology ID 5', 0, 0, 0, 
    'CLT.IDTT5', 0, NULL, 'Associated typology ID 5');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('3117', 'frmListeAFFCNT01', 'CLT', 'D3', 7, 
    'Adaptable field date 3', 'Adaptable field date 3', 0, 0, 0, 
    'TO_CHAR(CLT.D3,''DD/MM/YYYY'')', 0, NULL, 'Adaptable field date 3');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('3118', 'frmListeAFFCNT01', 'CLT', 'ADRSTR3', 50, 
    'Description of structured address 3', 'Description of structured address 3', 0, 0, 0, 
    'CLT.ADRSTR3', 0, NULL, 'Description of structured address 3');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('3119', 'frmListeAFFCNT01', 'CLT', 'ADRSTR4', 50, 
    'Description of structured address 4', 'Description of structured address 4', 0, 0, 0, 
    'CLT.ADRSTR4', 0, NULL, 'Description of structured address 4');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('3120', 'frmListeAFFCNT01', 'CLT', 'IDTCLT', 6, 
    'Nombre de contrat', 'Code', 0, 1, 0, 
    '(SELECT COUNT(*) FROM CTR WHERE CTR.IDTCLTDST = CLT.IDTCLT)', 0, NULL, 'Code');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('3121', 'frmListeAFFCNT01', 'CLT', 'TLD', 20, 
    'Telephone du domicile', 'Telephone du domicile', 0, 1, 0, 
    'CLT.TLD', 0, NULL, 'Telephone du domicile');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('3122', 'frmListeAFFCNT01', 'CLT', 'IDTSQCGNR', 22, 
    'General identifier', 'General identifier', 0, 0, 0, 
    'CLT.IDTSQCGNR', 0, NULL, 'General identifier');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('3123', 'frmListeAFFCNT01', 'CLT', 'IDTT2', 6, 
    'Associated typology ID 2', 'Associated typology ID 2', 0, 0, 0, 
    'CLT.IDTT2', 0, NULL, 'Associated typology ID 2');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('3124', 'frmListeAFFCNT01', 'CLT', 'IDTT4', 6, 
    'Associated typology ID 4', 'Associated typology ID 4', 0, 0, 0, 
    'CLT.IDTT4', 0, NULL, 'Associated typology ID 4');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('3125', 'frmListeAFFCNT01', 'CLT', 'A5', 40, 
    'Adaptable field string 5', 'Adaptable field string 5', 0, 0, 0, 
    'CLT.A5', 0, NULL, 'Adaptable field string 5');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('3126', 'frmListeAFFCNT01', 'CLT', 'C4', 22, 
    'Adaptable field check-box 4', 'Adaptable field check-box 4', 0, 0, 0, 
    'CLT.C4', 0, NULL, 'Adaptable field check-box 4');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('3127', 'frmListeAFFCNT01', 'CLT', 'MAIL', 40, 
    'Messagerie electronique', 'Messagerie electronique', 0, 1, 0, 
    'CLT.MAIL', 0, NULL, 'Messagerie electronique');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('3128', 'frmListeAFFCNT01', 'PNTLVR', 'C5', 22, 
    'Adaptable field check-box 5', 'Adaptable field check-box 5', 0, 0, 0, 
    'PNTLVR.C5', 0, NULL, 'Adaptable field check-box 5');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('3129', 'frmListeAFFCNT01', 'PNTLVR', 'IDTT2', 6, 
    'Associated typology ID 2', 'Associated typology ID 2', 0, 0, 0, 
    'PNTLVR.IDTT2', 0, NULL, 'Associated typology ID 2');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('3130', 'frmListeAFFCNT01', 'PNTLVR', 'DATMAJ', 7, 
    'Date de mise à jour', 'Date de mise a jour', 0, 1, 0, 
    'TO_CHAR(PNTLVR.DATMAJ,''DD/MM/YYYY'')', 0, NULL, 'Date de mise a jour');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('3131', 'frmListeAFFCNT01', 'PNTLVR', 'N1', 22, 
    'Adaptable field number1', 'Adaptable field number1', 0, 0, 0, 
    'PNTLVR.N1', 0, NULL, 'Adaptable field number1');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('3132', 'frmListeAFFCNT01', 'PNTLVR', 'D1', 7, 
    'Adaptable field date 1', 'Adaptable field date 1', 0, 0, 0, 
    'TO_CHAR(PNTLVR.D1,''DD/MM/YYYY'')', 0, NULL, 'Adaptable field date 1');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('3133', 'frmListeAFFCNT01', 'PNTLVR', 'ADRSTR5', 50, 
    'Description of structured address 5', 'Description of structured address 5', 0, 0, 0, 
    'PNTLVR.ADRSTR5', 0, NULL, 'Description of structured address 5');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('3134', 'frmListeAFFCNT01', 'PNTLVR', 'N3', 22, 
    'Adaptable field number13', 'Adaptable field number13', 0, 0, 0, 
    'PNTLVR.N3', 0, NULL, 'Adaptable field number13');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('3135', 'frmListeAFFCNT01', 'PNTLVR', 'T5', 6, 
    'Adaptable field typologie 5', 'Adaptable field typologie 5', 0, 0, 0, 
    'PNTLVR.T5', 0, NULL, 'Adaptable field typologie 5');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('3136', 'frmListeAFFCNT01', 'PNTLVR', 'CODGEO5', 4, 
    'Code géographique 5', 'Code du niveau 5', 0, 1, 0, 
    'PNTLVR.CODGEO5', 0, NULL, 'Code du niveau 5');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('3137', 'frmListeAFFCNT01', 'PNTLVR', 'IDTPNTLVR', 200, 
    'Code', 'Identifiant interne', 0, 1, 0, 
    'substr(X7UTIL.LIBPNTLVR(PNTLVR.IDTPNTLVR),1,250)', 0, NULL, 'Identifiant interne');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('3138', 'frmListeAFFCNT01', 'PNTLVR', 'IdtCntOpr', 10, 
    'CO', 'CO', 0, 1, 0, 
    'PNTLVR.IdtCntOpr', 0, NULL, 'CO');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('3139', 'frmListeAFFCNT01', 'PNTLVR', 'A3', 40, 
    'Adaptable field string 3', 'Adaptable field string 3', 0, 0, 0, 
    'PNTLVR.A3', 0, NULL, 'Adaptable field string 3');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('3140', 'frmListeAFFCNT01', 'PNTLVR', 'IDTT3', 6, 
    'Associated typology ID 3', 'Associated typology ID 3', 0, 0, 0, 
    'PNTLVR.IDTT3', 0, NULL, 'Associated typology ID 3');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('3141', 'frmListeAFFCNT01', 'PNTLVR', 'ADRSTR10', 50, 
    'Description of structured address 10', 'Description of structured address 10', 0, 0, 0, 
    'PNTLVR.ADRSTR10', 0, NULL, 'Description of structured address 10');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('3142', 'frmListeAFFCNT01', 'PNTLVR', 'CODGEO6', 4, 
    'Code géographique 6', 'Code du niveau 6', 0, 1, 0, 
    'PNTLVR.CODGEO6', 0, NULL, 'Code du niveau 6');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('3143', 'frmListeAFFCNT01', 'PNTLVR', 'T1', 6, 
    'Adaptable field typologie 1', 'Adaptable field typologie 1', 0, 0, 0, 
    'PNTLVR.T1', 0, NULL, 'Adaptable field typologie 1');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('3144', 'frmListeAFFCNT01', 'PNTLVR', 'IDTT5', 6, 
    'Associated typology ID 5', 'Associated typology ID 5', 0, 0, 0, 
    'PNTLVR.IDTT5', 0, NULL, 'Associated typology ID 5');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('3145', 'frmListeAFFCNT01', 'PNTLVR', 'ADRSTR1', 50, 
    'Description of structured address 1', 'Description of structured address 1', 0, 0, 0, 
    'PNTLVR.ADRSTR1', 0, NULL, 'Description of structured address 1');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('3146', 'frmListeAFFCNT01', 'PNTLVR', 'ADRSTR2', 50, 
    'Description of structured address 2', 'Description of structured address 2', 0, 0, 0, 
    'PNTLVR.ADRSTR2', 0, NULL, 'Description of structured address 2');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('3147', 'frmListeAFFCNT01', 'PNTLVR', 'A2', 40, 
    'Adaptable field string  2', 'Adaptable field string  2', 0, 0, 0, 
    'PNTLVR.A2', 0, NULL, 'Adaptable field string  2');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('3148', 'frmListeAFFCNT01', 'PNTLVR', 'A5', 40, 
    'Adaptable field string 5', 'Adaptable field string 5', 0, 0, 0, 
    'PNTLVR.A5', 0, NULL, 'Adaptable field string 5');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('3149', 'frmListeAFFCNT01', 'PNTLVR', 'C1', 22, 
    'Adaptable field check-box 1', 'Adaptable field check-box 1', 0, 0, 0, 
    'PNTLVR.C1', 0, NULL, 'Adaptable field check-box 1');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('3150', 'frmListeAFFCNT01', 'PNTLVR', 'ADRSTR6', 50, 
    'Description of structured address 6', 'Description of structured address 6', 0, 0, 0, 
    'PNTLVR.ADRSTR6', 0, NULL, 'Description of structured address 6');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('3151', 'frmListeAFFCNT01', 'PNTLVR', 'T4', 6, 
    'Adaptable field typologie 4', 'Adaptable field typologie 4', 0, 0, 0, 
    'PNTLVR.T4', 0, NULL, 'Adaptable field typologie 4');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('3152', 'frmListeAFFCNT01', 'PNTLVR', 'A4', 40, 
    'Adaptable field string 4', 'Adaptable field string 4', 0, 0, 0, 
    'PNTLVR.A4', 0, NULL, 'Adaptable field string 4');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('3153', 'frmListeAFFCNT01', 'PNTLVR', 'IDTPNTLVR', 22, 
    'Internal Delivery point ID', 'Identifiant interne', 0, 0, 0, 
    'PNTLVR.IDTPNTLVR', 0, NULL, 'Identifiant interne');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('3154', 'frmListeAFFCNT01', 'PNTLVR', 'CODGEO1', 5, 
    'Code géographique 1', 'Code du niveau 1', 0, 1, 0, 
    'PNTLVR.CODGEO1', 0, NULL, 'Code du niveau 1');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('3155', 'frmListeAFFCNT01', 'PNTLVR', 'N2', 22, 
    'Adaptable field number12', 'Adaptable field number12', 0, 0, 0, 
    'PNTLVR.N2', 0, NULL, 'Adaptable field number12');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('3156', 'frmListeAFFCNT01', 'PNTLVR', 'D5', 7, 
    'Adaptable field date 5', 'Adaptable field date 5', 0, 0, 0, 
    'TO_CHAR(PNTLVR.D5,''DD/MM/YYYY'')', 0, NULL, 'Adaptable field date 5');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('3157', 'frmListeAFFCNT01', 'PNTLVR', 'IDTTYPHBT', 6, 
    'Type d''habitation', 'Type d''habitation', 0, 1, 0, 
    'PNTLVR.IDTTYPHBT', 0, NULL, 'Type d''habitation');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('3158', 'frmListeAFFCNT01', 'PNTLVR', 'ADRSTR7', 50, 
    'Description of structured address 7', 'Description of structured address 7', 0, 0, 0, 
    'PNTLVR.ADRSTR7', 0, NULL, 'Description of structured address 7');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('3159', 'frmListeAFFCNT01', 'PNTLVR', 'D4', 7, 
    'Adaptable field date 4', 'Adaptable field date 4', 0, 0, 0, 
    'TO_CHAR(PNTLVR.D4,''DD/MM/YYYY'')', 0, NULL, 'Adaptable field date 4');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('3160', 'frmListeAFFCNT01', 'PNTLVR', 'ADRSTR4', 50, 
    'Description of structured address 4', 'Description of structured address 4', 0, 0, 0, 
    'PNTLVR.ADRSTR4', 0, NULL, 'Description of structured address 4');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('3161', 'frmListeAFFCNT01', 'PNTLVR', 'CODGEO2', 4, 
    'Code géographique 2', 'Code du niveau 2', 0, 1, 0, 
    'PNTLVR.CODGEO2', 0, NULL, 'Code du niveau 2');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('3162', 'frmListeAFFCNT01', 'PNTLVR', 'SQCPNTCPG', 22, 
    'Metering point last used serial number', 'Metering point last used serial number', 0, 1, 0, 
    'PNTLVR.SQCPNTCPG', 0, NULL, 'Metering point last used serial number');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('3163', 'frmListeAFFCNT01', 'PNTLVR', 'N4', 22, 
    'Adaptable field number 4', 'Adaptable field number 4', 0, 0, 0, 
    'PNTLVR.N4', 0, NULL, 'Adaptable field number 4');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('3164', 'frmListeAFFCNT01', 'PNTLVR', 'IDTSQCGNR', 22, 
    'General identifier', 'General identifier', 0, 0, 0, 
    'PNTLVR.IDTSQCGNR', 0, NULL, 'General identifier');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('3165', 'frmListeAFFCNT01', 'PNTLVR', 'C3', 22, 
    'Adaptable field check-box 3', 'Adaptable field check-box 3', 0, 0, 0, 
    'PNTLVR.C3', 0, NULL, 'Adaptable field check-box 3');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('3166', 'frmListeAFFCNT01', 'PNTLVR', 'N5', 22, 
    'Adaptable field number 5', 'Adaptable field number 5', 0, 0, 0, 
    'PNTLVR.N5', 0, NULL, 'Adaptable field number 5');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('3167', 'frmListeAFFCNT01', 'PNTLVR', 'IDTDCPGGR', 29, 
    'Découpage géographique', 'Adresse geographique', 0, 1, 0, 
    'PNTLVR.IDTDCPGGR', 0, NULL, 'Adresse geographique');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('3168', 'frmListeAFFCNT01', 'PNTLVR', 'CODGEO3', 4, 
    'Code géographique 3', 'Code du niveau 3', 0, 1, 0, 
    'PNTLVR.CODGEO3', 0, NULL, 'Code du niveau 3');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('3169', 'frmListeAFFCNT01', 'PNTLVR', 'IDTT4', 6, 
    'Associated typology ID 4', 'Associated typology ID 4', 0, 0, 0, 
    'PNTLVR.IDTT4', 0, NULL, 'Associated typology ID 4');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('3170', 'frmListeAFFCNT01', 'PNTLVR', 'IDTENQ', 22, 
    'Investigation ID', 'Investigation ID', 0, 1, 0, 
    'PNTLVR.IDTENQ', 0, NULL, 'Investigation ID');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('3171', 'frmListeAFFCNT01', 'PNTLVR', 'CODGEO4', 4, 
    'Code géographique 4', 'Code du niveau 4', 0, 1, 0, 
    'PNTLVR.CODGEO4', 0, NULL, 'Code du niveau 4');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('3172', 'frmListeAFFCNT01', 'PNTLVR', 'C4', 22, 
    'Adaptable field check-box 4', 'Adaptable field check-box 4', 0, 0, 0, 
    'PNTLVR.C4', 0, NULL, 'Adaptable field check-box 4');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('3173', 'frmListeAFFCNT01', 'PNTLVR', 'D3', 7, 
    'Adaptable field date 3', 'Adaptable field date 3', 0, 0, 0, 
    'TO_CHAR(PNTLVR.D3,''DD/MM/YYYY'')', 0, NULL, 'Adaptable field date 3');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('3240', 'frmListeAFFCNT01', 'PNTCPG', 'IDTT4', 6, 
    'Associated typology ID 4', 'Associated typology ID 4', 0, 0, 0, 
    'PNTCPG.IDTT4', 0, NULL, 'Associated typology ID 4');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('3241', 'frmListeAFFCNT01', 'PNTCPG', 'IDTPNTLVR', 22, 
    'Delivery point ID', 'Delivery point ID', 0, 1, 0, 
    'PNTCPG.IDTPNTLVR', 0, NULL, 'Delivery point ID');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('3242', 'frmListeAFFCNT01', 'PNTCPG', 'IDTCNTOPR', 6, 
    'Operational center ID', 'Operational center ID', 0, 1, 0, 
    'PNTCPG.IDTCNTOPR', 0, NULL, 'Operational center ID');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('3243', 'frmListeAFFCNT01', 'PNTCPG', 'MTRAGT', 6, 
    'ID of the employee who carries out updating', 'ID of the employee who carries out updating', 0, 1, 0, 
    'PNTCPG.MTRAGT', 0, NULL, 'ID of the employee who carries out updating');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('3244', 'frmListeAFFCNT01', 'PNTCPG', 'D4', 7, 
    'Adaptable field check-box 4', 'Adaptable field check-box 4', 0, 0, 0, 
    'TO_CHAR(PNTCPG.D4,''DD/MM/YYYY'')', 0, NULL, 'Adaptable field check-box 4');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('3245', 'frmListeAFFCNT01', 'PNTCPG', 'SCTCND', 22, 
    'Conductors section', 'Conductors section', 0, 1, 0, 
    'PNTCPG.SCTCND', 0, NULL, 'Conductors section');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('3246', 'frmListeAFFCNT01', 'PNTCPG', 'DATCNN', 7, 
    'Date de connexion', 'Date de connexion', 0, 1, 0, 
    'TO_CHAR(PNTCPG.DATCNN,''DD/MM/YYYY'')', 0, NULL, 'Date de connexion');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('3247', 'frmListeAFFCNT01', 'PNTCPG', 'IDTUNTMSRDMT', 22, 
    'Diameter unit of measure ID', 'Diameter unit of measure ID', 0, 1, 0, 
    'PNTCPG.IDTUNTMSRDMT', 0, NULL, 'Diameter unit of measure ID');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('3248', 'frmListeAFFCNT01', 'PNTCPG', 'C3', 22, 
    'Adaptable field check-box 3', 'Adaptable field check-box 3', 0, 0, 0, 
    'PNTCPG.C3', 0, NULL, 'Adaptable field check-box 3');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('3249', 'frmListeAFFCNT01', 'PNTCPG', 'D1', 7, 
    'Adaptable field check-box 1', 'Adaptable field check-box 1', 0, 0, 0, 
    'TO_CHAR(PNTCPG.D1,''DD/MM/YYYY'')', 0, NULL, 'Adaptable field check-box 1');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('3250', 'frmListeAFFCNT01', 'PNTCPG', 'ADRSTR2', 50, 
    'Description of structured address 2', 'Description of structured address 2', 0, 0, 0, 
    'PNTCPG.ADRSTR2', 0, NULL, 'Description of structured address 2');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('3251', 'frmListeAFFCNT01', 'PNTCPG', 'ADRSTR8', 50, 
    'Description of structured address 8', 'Description of structured address 8', 0, 0, 0, 
    'PNTCPG.ADRSTR8', 0, NULL, 'Description of structured address 8');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('3252', 'frmListeAFFCNT01', 'PNTCPG', 'IDTSIG', 22, 
    'Code SIG', 'Code SIG', 0, 1, 0, 
    'PNTCPG.IDTSIG', 0, NULL, 'Code SIG');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('3253', 'frmListeAFFCNT01', 'PNTCPG', 'DATMAJ', 7, 
    'Date de mise à jour', 'Date de mise à jour', 0, 1, 0, 
    'TO_CHAR(PNTCPG.DATMAJ,''DD/MM/YYYY'')', 0, NULL, 'Date de mise à jour');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('3254', 'frmListeAFFCNT01', 'PNTCPG', 'NBRCND', 22, 
    'Number of conductors', 'Number of conductors', 0, 0, 0, 
    'PNTCPG.NBRCND', 0, NULL, 'Number of conductors');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('3255', 'frmListeAFFCNT01', 'PNTCPG', 'IDTTYPCPG', 22, 
    'Type de métrage', 'Type de métrage', 0, 1, 0, 
    'PNTCPG.IDTTYPCPG', 0, NULL, 'Type de métrage');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('3256', 'frmListeAFFCNT01', 'PNTCPG', 'T1', 6, 
    'Adaptable field typologie 1', 'Adaptable field typologie 1', 0, 0, 0, 
    'PNTCPG.T1', 0, NULL, 'Adaptable field typologie 1');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('3257', 'frmListeAFFCNT01', 'PNTCPG', 'IDTT3', 6, 
    'Associated typology ID 3', 'Associated typology ID 3', 0, 0, 0, 
    'PNTCPG.IDTT3', 0, NULL, 'Associated typology ID 3');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('3258', 'frmListeAFFCNT01', 'PNTCPG', 'T5', 6, 
    'Adaptable field typologie 5', 'Adaptable field typologie 5', 0, 0, 0, 
    'PNTCPG.T5', 0, NULL, 'Adaptable field typologie 5');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('3259', 'frmListeAFFCNT01', 'PNTCPG', 'A2', 40, 
    'Adaptable field string 2', 'Adaptable field string 2', 0, 0, 0, 
    'PNTCPG.A2', 0, NULL, 'Adaptable field string 2');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('3260', 'frmListeAFFCNT01', 'PNTCPG', 'D3', 7, 
    'Adaptable field check-box 3', 'Adaptable field check-box 3', 0, 0, 0, 
    'TO_CHAR(PNTCPG.D3,''DD/MM/YYYY'')', 0, NULL, 'Adaptable field check-box 3');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('3261', 'frmListeAFFCNT01', 'PNTCPG', 'ADRSTR3', 50, 
    'Description of structured address 3', 'Description of structured address 3', 0, 0, 0, 
    'PNTCPG.ADRSTR3', 0, NULL, 'Description of structured address 3');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('3262', 'frmListeAFFCNT01', 'PNTCPG', 'ADRSTR7', 50, 
    'Description of structured address 7', 'Description of structured address 7', 0, 0, 0, 
    'PNTCPG.ADRSTR7', 0, NULL, 'Description of structured address 7');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('3263', 'frmListeAFFCNT01', 'PNTCPG', 'CLBMAXDSJ', 22, 
    'Maximum calibre of circuit breaker', 'Maximum calibre of circuit breaker', 0, 0, 0, 
    'PNTCPG.CLBMAXDSJ', 0, NULL, 'Maximum calibre of circuit breaker');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('3264', 'frmListeAFFCNT01', 'PNTCPG', 'ADRSTR1', 50, 
    'Description of structured address 1', 'Description of structured address 1', 0, 0, 0, 
    'PNTCPG.ADRSTR1', 0, NULL, 'Description of structured address 1');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('3265', 'frmListeAFFCNT01', 'PNTCPG', 'IDTLOTRCS', 6, 
    'Lot recensement', 'Lot recensement', 0, 1, 0, 
    'PNTCPG.IDTLOTRCS', 0, NULL, 'Lot recensement');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('3266', 'frmListeAFFCNT01', 'PNTCPG', 'ADRSTR9', 50, 
    'Description of structured address 9', 'Description of structured address 9', 0, 0, 0, 
    'PNTCPG.ADRSTR9', 0, NULL, 'Description of structured address 9');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('3267', 'frmListeAFFCNT01', 'PNTCPG', 'ADRSTR10', 50, 
    'Description of structured address 10', 'Description of structured address 10', 0, 0, 0, 
    'PNTCPG.ADRSTR10', 0, NULL, 'Description of structured address 10');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('3268', 'frmListeAFFCNT01', 'PNTCPG', 'PSSTRS', 22, 
    'Puissance du transformateur', 'Puissance du transformateur', 0, 0, 0, 
    'PNTCPG.PSSTRS', 0, NULL, 'Puissance du transformateur');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('3269', 'frmListeAFFCNT01', 'PNTCPG', 'ADRLBR', 254, 
    'Adresse', 'Adresse', 0, 1, 0, 
    'SUBSTR(REPLACE(REPLACE(PNTCPG.ADRLBR,CHR(10),'' ''),CHR(13),'' ''),1,254)', 0, NULL, 'Adresse');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('3270', 'frmListeAFFCNT01', 'PNTCPG', 'A3', 40, 
    'Adaptable field string 3', 'Adaptable field string 3', 0, 0, 0, 
    'PNTCPG.A3', 0, NULL, 'Adaptable field string 3');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('3271', 'frmListeAFFCNT01', 'PNTCPG', 'C2', 22, 
    'Adaptable field check-box 2', 'Adaptable field check-box 2', 0, 0, 0, 
    'PNTCPG.C2', 0, NULL, 'Adaptable field check-box 2');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('3272', 'frmListeAFFCNT01', 'PNTCPG', 'D5', 7, 
    'Adaptable field check-box 5', 'Adaptable field check-box 5', 0, 0, 0, 
    'TO_CHAR(PNTCPG.D5,''DD/MM/YYYY'')', 0, NULL, 'Adaptable field check-box 5');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('3273', 'frmListeAFFCNT01', 'PNTCPG', 'ANCRFR', 20, 
    'Ancienne reference', 'Ancienne reference', 0, 1, 0, 
    'PNTCPG.ANCRFR', 0, NULL, 'Ancienne reference');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('3274', 'frmListeAFFCNT01', 'PNTCPG', 'RGLDSJ', 22, 
    'Circuit breaker setting', 'Circuit breaker setting', 0, 1, 0, 
    'PNTCPG.RGLDSJ', 0, NULL, 'Circuit breaker setting');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('3275', 'frmListeAFFCNT01', 'PNTCPG', 'DATCOU', 7, 
    'Date de coupure', 'Date de coupure', 0, 1, 0, 
    'TO_CHAR(PNTCPG.DATCOU,''DD/MM/YYYY'')', 0, NULL, 'Date de coupure');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('3276', 'frmListeAFFCNT01', 'PNTCPG', 'RNG1', 22, 
    'Rang', 'Rang', 0, 1, 0, 
    'PNTCPG.RNG1', 0, NULL, 'Rang');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('3277', 'frmListeAFFCNT01', 'PNTCPG', 'IDTT5', 6, 
    'Associated typology ID 5', 'Associated typology ID 5', 0, 0, 0, 
    'PNTCPG.IDTT5', 0, NULL, 'Associated typology ID 5');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('3278', 'frmListeAFFCNT01', 'PNTCPG', 'A5', 40, 
    'Adaptable field string 5', 'Adaptable field string 5', 0, 0, 0, 
    'PNTCPG.A5', 0, NULL, 'Adaptable field string 5');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('3279', 'frmListeAFFCNT01', 'PNTCPG', 'N1', 22, 
    'Adaptable field number 1', 'Adaptable field number 1', 0, 0, 0, 
    'PNTCPG.N1', 0, NULL, 'Adaptable field number 1');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('3280', 'frmListeAFFCNT01', 'PNTCPG', 'N5', 22, 
    'Adaptable field number 5', 'Adaptable field number 5', 0, 0, 0, 
    'PNTCPG.N5', 0, NULL, 'Adaptable field number 5');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('3281', 'frmListeAFFCNT01', 'PNTCPG', 'C4', 22, 
    'Adaptable field check-box 4', 'Adaptable field check-box 4', 0, 0, 0, 
    'PNTCPG.C4', 0, NULL, 'Adaptable field check-box 4');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('3282', 'frmListeAFFCNT01', 'PNTCPG', 'IDTSRV', 22, 
    'Service Id', 'Service Id', 0, 1, 0, 
    'PNTCPG.IDTSRV', 0, NULL, 'Service Id');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('3283', 'frmListeAFFCNT01', 'PNTCPG', 'ADRSTR5', 50, 
    'Description of structured address 5', 'Description of structured address 5', 0, 0, 0, 
    'PNTCPG.ADRSTR5', 0, NULL, 'Description of structured address 5');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('3284', 'frmListeAFFCNT01', 'PNTCPG', 'IDTT1', 6, 
    'Associated typology ID 1', 'Associated typology ID 1', 0, 0, 0, 
    'PNTCPG.IDTT1', 0, NULL, 'Associated typology ID 1');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('3285', 'frmListeAFFCNT01', 'PNTCPG', 'N4', 22, 
    'Adaptable field number 4', 'Adaptable field number 4', 0, 0, 0, 
    'PNTCPG.N4', 0, NULL, 'Adaptable field number 4');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('3286', 'frmListeAFFCNT01', 'PNTCPG', 'IDTLOTFAC', 6, 
    'Lot de facturation', 'Lot de facturation', 0, 1, 0, 
    'PNTCPG.IDTLOTFAC', 0, NULL, 'Lot de facturation');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('3287', 'frmListeAFFCNT01', 'PNTCPG', 'CLBMINDSJ', 22, 
    'Minimum calibre circuit breaker', 'Minimum calibre circuit breaker', 0, 0, 0, 
    'PNTCPG.CLBMINDSJ', 0, NULL, 'Minimum calibre circuit breaker');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('3288', 'frmListeAFFCNT01', 'PNTCPG', 'DATDCN', 7, 
    'Date de deconnexion', 'Date de deconnexion', 0, 1, 0, 
    'TO_CHAR(PNTCPG.DATDCN,''DD/MM/YYYY'')', 0, NULL, 'Date de deconnexion');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('3289', 'frmListeAFFCNT01', 'PNTCPG', 'DATRMS', 7, 
    'Date de retablissement', 'Date de retablissement', 0, 1, 0, 
    'TO_CHAR(PNTCPG.DATRMS,''DD/MM/YYYY'')', 0, NULL, 'Date de retablissement');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('3290', 'frmListeAFFCNT01', 'PNTCPG', 'IDTSQCGNR', 22, 
    'General sequence ID', 'General sequence ID', 0, 0, 0, 
    'PNTCPG.IDTSQCGNR', 0, NULL, 'General sequence ID');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('3291', 'frmListeAFFCNT01', 'PNTCPG', 'T3', 6, 
    'Adaptable field typologie 3', 'Adaptable field typologie 3', 0, 0, 0, 
    'PNTCPG.T3', 0, NULL, 'Adaptable field typologie 3');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('3292', 'frmListeAFFCNT01', 'PNTCPG', 'T4', 6, 
    'Adaptable field typologie 4', 'Adaptable field typologie 4', 0, 0, 0, 
    'PNTCPG.T4', 0, NULL, 'Adaptable field typologie 4');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('3293', 'frmListeAFFCNT01', 'PNTCPG', 'A1', 40, 
    'Adaptable field string 1', 'Adaptable field string 1', 0, 0, 0, 
    'PNTCPG.A1', 0, NULL, 'Adaptable field string 1');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('3294', 'frmListeAFFCNT01', 'PNTCPG', 'A4', 40, 
    'Adaptable field string 4', 'Adaptable field string 4', 0, 0, 0, 
    'PNTCPG.A4', 0, NULL, 'Adaptable field string 4');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('3295', 'frmListeAFFCNT01', 'PNTCPG', 'N2', 22, 
    'Adaptable field number 2', 'Adaptable field number 2', 0, 0, 0, 
    'PNTCPG.N2', 0, NULL, 'Adaptable field number 2');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('3296', 'frmListeAFFCNT01', 'PNTCPG', 'N3', 22, 
    'Adaptable field number 3', 'Adaptable field number 3', 0, 0, 0, 
    'PNTCPG.N3', 0, NULL, 'Adaptable field number 3');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('3297', 'frmListeAFFCNT01', 'PNTCPG', 'C1', 22, 
    'Adaptable field check-box 1', 'Adaptable field check-box 1', 0, 0, 0, 
    'PNTCPG.C1', 0, NULL, 'Adaptable field check-box 1');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('3298', 'frmListeAFFCNT01', 'PNTCPG', 'C5', 22, 
    'Adaptable field check-box 5', 'Adaptable field check-box 5', 0, 0, 0, 
    'PNTCPG.C5', 0, NULL, 'Adaptable field check-box 5');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('3299', 'frmListeAFFCNT01', 'PNTCPG', 'IDTTRNTYP', 6, 
    'Standard round ID', 'Tournee type', 0, 1, 0, 
    'PNTCPG.IDTTRNTYP', 0, NULL, 'Tournee type');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('3300', 'frmListeAFFCNT01', 'PNTCPG', 'D2', 7, 
    'Adaptable field check-box 2', 'Adaptable field check-box 2', 0, 0, 0, 
    'TO_CHAR(PNTCPG.D2,''DD/MM/YYYY'')', 0, NULL, 'Adaptable field check-box 2');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('3301', 'frmListeAFFCNT01', 'PNTCPG', 'ADRSTR4', 50, 
    'Description of structured address 4', 'Description of structured address 4', 0, 0, 0, 
    'PNTCPG.ADRSTR4', 0, NULL, 'Description of structured address 4');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('3302', 'frmListeAFFCNT01', 'PNTCPG', 'ADRSTR6', 50, 
    'Description of structured address 6', 'Description of structured address 6', 0, 0, 0, 
    'PNTCPG.ADRSTR6', 0, NULL, 'Description of structured address 6');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('3303', 'frmListeAFFCNT01', 'PNTCPG', 'FINDRNPRDRLV', 7, 
    'Fin de la dernière période théorique de relève', 'Fin de la dernière période théorique de relève', 0, 1, 0, 
    'TO_CHAR(PNTCPG.FINDRNPRDRLV,''DD/MM/YYYY'')', 0, NULL, 'Fin de la dernière période théorique de relève');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('3304', 'frmListeAFFCNT01', 'PNTCPG', 'IDTCLTPRP', 6, 
    'Code client propriétaire', 'Code client propriétaire', 0, 1, 0, 
    'PNTCPG.IDTCLTPRP', 0, NULL, 'Code client propriétaire');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('3305', 'frmListeAFFCNT01', 'PNTCPG', 'NUMENQ', 22, 
    'numéro recensement', 'numéro recensement', 0, 1, 0, 
    'PNTCPG.NUMENQ', 0, NULL, 'numéro recensement');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('3306', 'frmListeAFFAFF01', 'AFF', 'IDTSML', 22, 
    'Simulation', 'Simulation', 0, 1, 0, 
    'AFF.IDTSML', 0, NULL, 'Simulation');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('3307', 'frmListeAFFAFF01', 'AFF', 'MTRAGT', 22, 
    'Affecté à', 'Affecté à', 0, 1, 0, 
    'AFF.MTRAGT', 0, NULL, 'Affecté à');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('3308', 'frmListeAFFAFF01', 'AFF', 'IDTETP', 22, 
    'N?Etape', 'N°Etape', 0, 1, 0, 
    'AFF.IDTETP', 0, NULL, 'N°Etape');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('3309', 'frmListeAFFAFF01', 'AFF', 'IDTPLNACT', 22, 
    'Code plan d''actions', 'Code plan d''actions', 0, 1, 0, 
    'AFF.IDTPLNACT', 0, NULL, 'Code plan d''actions');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('3310', 'frmListeAFFAFF01', 'CLT', 'IDTQLT', 6, 
    'Qualité client', 'Type of customer ID', 0, 1, 0, 
    'CLT.IDTQLT', 0, NULL, 'Type of customer ID');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('3311', 'frmListeAFFAFF01', 'CLT', 'NUMAVN', 22, 
    'Numéro d''avenant', 'avenant', 0, 1, 0, 
    'CLT.NUMAVN', 0, NULL, 'avenant');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('3312', 'frmListeAFFAFF01', 'CLT', 'MTRAGT', 6, 
    'Agent', 'Agent', 0, 1, 0, 
    'CLT.MTRAGT', 0, NULL, 'Agent');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('3313', 'frmListeAFFAFF01', 'CLT', 'PRN', 40, 
    'Prenom', 'Prenom', 0, 1, 0, 
    'CLT.PRN', 0, NULL, 'Prenom');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('3314', 'frmListeAFFAFF01', 'CLT', 'RGR', 22, 
    'Client regroupe', 'Client regroupe', 0, 1, 0, 
    'CLT.RGR', 0, NULL, 'Client regroupe');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('3315', 'frmListeAFFAFF01', 'CLT', 'IDTT2', 6, 
    'Associated typology ID 2', 'Associated typology ID 2', 0, 0, 0, 
    'CLT.IDTT2', 0, NULL, 'Associated typology ID 2');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('3316', 'frmListeAFFAFF01', 'CLT', 'C2', 22, 
    'Adaptable field check-box 2', 'Adaptable field check-box 2', 0, 0, 0, 
    'CLT.C2', 0, NULL, 'Adaptable field check-box 2');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('3317', 'frmListeAFFAFF01', 'CLT', 'D1', 7, 
    'Adaptable field date 1', 'Adaptable field date 1', 0, 0, 0, 
    'TO_CHAR(CLT.D1,''DD/MM/YYYY'')', 0, NULL, 'Adaptable field date 1');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('3318', 'frmListeAFFAFF01', 'CLT', 'FLB', 20, 
    'Fax du bureau', 'Fax du bureau', 0, 1, 0, 
    'CLT.FLB', 0, NULL, 'Fax du bureau');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('3319', 'frmListeAFFAFF01', 'CLT', 'CHPLIB3', 30, 
    '3rd free field', '3rd free field', 0, 0, 0, 
    'CLT.CHPLIB3', 0, NULL, '3rd free field');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('3320', 'frmListeAFFAFF01', 'CLT', 'IDTT3', 6, 
    'Associated typology ID 3', 'Associated typology ID 3', 0, 0, 0, 
    'CLT.IDTT3', 0, NULL, 'Associated typology ID 3');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('3321', 'frmListeAFFAFF01', 'CLT', 'IDTT4', 6, 
    'Associated typology ID 4', 'Associated typology ID 4', 0, 0, 0, 
    'CLT.IDTT4', 0, NULL, 'Associated typology ID 4');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('3322', 'frmListeAFFAFF01', 'CLT', 'C4', 22, 
    'Adaptable field check-box 4', 'Adaptable field check-box 4', 0, 0, 0, 
    'CLT.C4', 0, NULL, 'Adaptable field check-box 4');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('3323', 'frmListeAFFAFF01', 'CLT', 'ADRSTR4', 50, 
    'Description of structured address 4', 'Description of structured address 4', 0, 0, 0, 
    'CLT.ADRSTR4', 0, NULL, 'Description of structured address 4');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('3324', 'frmListeAFFAFF01', 'CLT', 'ADRSTR6', 50, 
    'Description of structured address 6', 'Description of structured address 6', 0, 0, 0, 
    'CLT.ADRSTR6', 0, NULL, 'Description of structured address 6');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('3325', 'frmListeAFFAFF01', 'CLT', 'MAIL', 40, 
    'Messagerie electronique', 'Messagerie electronique', 0, 1, 0, 
    'CLT.MAIL', 0, NULL, 'Messagerie electronique');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('3326', 'frmListeAFFAFF01', 'CLT', 'IDTCTR', 10, 
    'Contract ID', 'Contract ID', 0, 1, 0, 
    'CLT.IDTCTR', 0, NULL, 'Contract ID');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('3327', 'frmListeAFFAFF01', 'CLT', 'T1', 6, 
    'Adaptable field typology 1', 'Adaptable field typology 1', 0, 0, 0, 
    'CLT.T1', 0, NULL, 'Adaptable field typology 1');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('3328', 'frmListeAFFAFF01', 'CLT', 'T5', 6, 
    'Adaptable field typology 5', 'Adaptable field typology 5', 0, 0, 0, 
    'CLT.T5', 0, NULL, 'Adaptable field typology 5');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('3329', 'frmListeAFFAFF01', 'CLT', 'IDTT5', 6, 
    'Associated typology ID 5', 'Associated typology ID 5', 0, 0, 0, 
    'CLT.IDTT5', 0, NULL, 'Associated typology ID 5');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('3330', 'frmListeAFFAFF01', 'CLT', 'N1', 22, 
    'Adaptable field number 1', 'Adaptable field number 1', 0, 0, 0, 
    'CLT.N1', 0, NULL, 'Adaptable field number 1');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('3331', 'frmListeAFFAFF01', 'CLT', 'C1', 22, 
    'Adaptable field check-box 1', 'Adaptable field check-box 1', 0, 0, 0, 
    'CLT.C1', 0, NULL, 'Adaptable field check-box 1');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('3332', 'frmListeAFFAFF01', 'CLT', 'ADRSTR2', 50, 
    'Description of structured address 2', 'Description of structured address 2', 0, 0, 0, 
    'CLT.ADRSTR2', 0, NULL, 'Description of structured address 2');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('3333', 'frmListeAFFAFF01', 'CLT', 'ADRSTR5', 50, 
    'Description of structured address 5', 'Description of structured address 5', 0, 0, 0, 
    'CLT.ADRSTR5', 0, NULL, 'Description of structured address 5');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('3334', 'frmListeAFFAFF01', 'CLT', 'X7SNDXNOM', 40, 
    'Fonction de recherche pour Nom', 'Fonction de recherche pour Nom', 0, 0, 0, 
    'CLT.X7SNDXNOM', 0, NULL, 'Fonction de recherche pour Nom');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('3335', 'frmListeAFFAFF01', 'CLT', 'IDTCTGCLT', 6, 
    'Categorie de client', 'Categorie de client', 0, 1, 0, 
    'CLT.IDTCTGCLT', 0, NULL, 'Categorie de client');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('3336', 'frmListeAFFAFF01', 'CLT', 'AVT_NUMAVN', 22, 
    'NOT USED!!!', 'NOT USED!!!', 0, 0, 0, 
    'CLT.AVT_NUMAVN', 0, NULL, 'NOT USED!!!');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('3337', 'frmListeAFFAFF01', 'CLT', 'TLD', 20, 
    'Telephone du domicile', 'Telephone du domicile', 0, 1, 0, 
    'CLT.TLD', 0, NULL, 'Telephone du domicile');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('3338', 'frmListeAFFAFF01', 'CLT', 'ADRLBR', 2000, 
    'Adresse', 'Adresse', 0, 1, 0, 
    'SUBSTR(REPLACE(REPLACE(CLT.ADRLBR,CHR(10),'' ''),CHR(13),'' ''),1,254)', 0, NULL, 'Adresse');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('3339', 'frmListeAFFAFF01', 'CLT', 'PMTLTG', 22, 
    'Nombre de paiements litigieux', 'Nombre de paiements litigieux', 0, 1, 0, 
    'CLT.PMTLTG', 0, NULL, 'Nombre de paiements litigieux');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('3340', 'frmListeAFFAFF01', 'CLT', 'INTBNC', 22, 
    'Interdit bancaire', 'Ineligible', 0, 1, 0, 
    'CLT.INTBNC', 0, NULL, 'Ineligible');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('3341', 'frmListeAFFAFF01', 'CLT', 'RTRIPY', 22, 
    'Nombre de retours d''impaye', 'Nombre de retours d''impaye', 0, 1, 0, 
    'CLT.RTRIPY', 0, NULL, 'Nombre de retours d''impaye');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('3342', 'frmListeAFFAFF01', 'CLT', 'CHPLIB2', 30, 
    '2nd free field', '2nd free field', 0, 0, 0, 
    'CLT.CHPLIB2', 0, NULL, '2nd free field');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('3343', 'frmListeAFFAFF01', 'CLT', 'CHPLIB4', 30, 
    '4th free field', '4th free field', 0, 0, 0, 
    'CLT.CHPLIB4', 0, NULL, '4th free field');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('3344', 'frmListeAFFAFF01', 'CLT', 'IDTT1', 6, 
    'Associated typology ID 1', 'Associated typology ID 1', 0, 0, 0, 
    'CLT.IDTT1', 0, NULL, 'Associated typology ID 1');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('3345', 'frmListeAFFAFF01', 'CLT', 'N2', 22, 
    'Adaptable field number 2', 'Adaptable field number 2', 0, 0, 0, 
    'CLT.N2', 0, NULL, 'Adaptable field number 2');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('3346', 'frmListeAFFAFF01', 'CLT', 'N3', 22, 
    'Adaptable field number 3', 'Adaptable field number 3', 0, 0, 0, 
    'CLT.N3', 0, NULL, 'Adaptable field number 3');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('3347', 'frmListeAFFAFF01', 'CLT', 'N5', 22, 
    'Adaptable field number 5', 'Adaptable field number 5', 0, 0, 0, 
    'CLT.N5', 0, NULL, 'Adaptable field number 5');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('3348', 'frmListeAFFAFF01', 'CLT', 'C5', 22, 
    'Adaptable field check-box 5', 'Adaptable field check-box 5', 0, 0, 0, 
    'CLT.C5', 0, NULL, 'Adaptable field check-box 5');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('3349', 'frmListeAFFAFF01', 'CLT', 'D3', 7, 
    'Adaptable field date 3', 'Adaptable field date 3', 0, 0, 0, 
    'TO_CHAR(CLT.D3,''DD/MM/YYYY'')', 0, NULL, 'Adaptable field date 3');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('3350', 'frmListeAFFAFF01', 'CLT', 'ADRSTR1', 50, 
    'Description of structured address 1', 'Description of structured address 1', 0, 0, 0, 
    'CLT.ADRSTR1', 0, NULL, 'Description of structured address 1');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('3351', 'frmListeAFFAFF01', 'CLT', 'IDTCLT', 6, 
    'Nombre de contrat', 'Code', 0, 1, 0, 
    '(SELECT COUNT(*) FROM CTR WHERE CTR.IDTCLTDST = CLT.IDTCLT)', 0, NULL, 'Code');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('3352', 'frmListeAFFAFF01', 'CLT', 'ADRSTR10', 50, 
    'Description of structured address 10', 'Description of structured address 10', 0, 0, 0, 
    'CLT.ADRSTR10', 0, NULL, 'Description of structured address 10');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('3353', 'frmListeAFFAFF01', 'CLT', 'SQCCPTCLT', 22, 
    'Customer account serial number', 'Customer account serial number', 0, 1, 0, 
    'CLT.SQCCPTCLT', 0, NULL, 'Customer account serial number');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('3354', 'frmListeAFFAFF01', 'CLT', 'TLB', 20, 
    'Telephone du bureau', 'Telephone du bureau', 0, 1, 0, 
    'CLT.TLB', 0, NULL, 'Telephone du bureau');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('3355', 'frmListeAFFAFF01', 'CLT', 'A1', 40, 
    'Adaptable field string 1', 'Adaptable field string 1', 0, 0, 0, 
    'CLT.A1', 0, NULL, 'Adaptable field string 1');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('3356', 'frmListeAFFAFF01', 'CLT', 'A3', 40, 
    'Adaptable field string 3', 'Adaptable field string 3', 0, 0, 0, 
    'CLT.A3', 0, NULL, 'Adaptable field string 3');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('3357', 'frmListeAFFAFF01', 'CLT', 'N4', 22, 
    'Adaptable field number 4', 'Adaptable field number 4', 0, 0, 0, 
    'CLT.N4', 0, NULL, 'Adaptable field number 4');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('3358', 'frmListeAFFAFF01', 'CLT', 'D2', 7, 
    'Adaptable field date 2', 'Adaptable field date 2', 0, 0, 0, 
    'TO_CHAR(CLT.D2,''DD/MM/YYYY'')', 0, NULL, 'Adaptable field date 2');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('3359', 'frmListeAFFAFF01', 'CLT', 'CHPLIB5', 254, 
    'Lib 5', 'Lib 5', 0, 0, 0, 
    'CLT.CHPLIB5', 0, NULL, 'Lib 5');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('3360', 'frmListeAFFAFF01', 'CLT', 'IDTCLT', 6, 
    'Code', 'Code', 0, 1, 0, 
    'CLT.IDTCLT', 0, NULL, 'Code');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('3361', 'frmListeAFFAFF01', 'CLT', 'DATMAJ', 7, 
    'Date de mise a jour', 'Date de mise a jour', 0, 1, 0, 
    'TO_CHAR(CLT.DATMAJ,''DD/MM/YYYY'')', 0, NULL, 'Date de mise a jour');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('3362', 'frmListeAFFAFF01', 'CLT', 'ANCRFR', 20, 
    'Ancienne reference', 'Ancienne reference', 0, 1, 0, 
    'CLT.ANCRFR', 0, NULL, 'Ancienne reference');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('3363', 'frmListeAFFAFF01', 'CLT', 'FRD', 22, 
    'Fraudeur', 'Fraudeur', 0, 1, 0, 
    'CLT.FRD', 0, NULL, 'Fraudeur');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('3364', 'frmListeAFFAFF01', 'CLT', 'IDTPRMCTR', 10, 
    'Code du premier contrat', 'Code du premier contrat', 0, 1, 0, 
    'CLT.IDTPRMCTR', 0, NULL, 'Code du premier contrat');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('3365', 'frmListeAFFAFF01', 'CLT', 'C3', 22, 
    'Adaptable field check-box 3', 'Adaptable field check-box 3', 0, 0, 0, 
    'CLT.C3', 0, NULL, 'Adaptable field check-box 3');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('3366', 'frmListeAFFAFF01', 'CLT', 'ADRSTR3', 50, 
    'Description of structured address 3', 'Description of structured address 3', 0, 0, 0, 
    'CLT.ADRSTR3', 0, NULL, 'Description of structured address 3');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('3174', 'frmListeAFFCNT01', 'PNTLVR', 'IDTCNTOPR', 6, 
    'Centre opérationel', 'Centre opérationel', 0, 1, 0, 
    'PNTLVR.IDTCNTOPR', 0, NULL, 'Centre opérationel');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('3175', 'frmListeAFFCNT01', 'PNTLVR', 'IDTT1', 6, 
    'Associated typology ID 1', 'Associated typology ID 1', 0, 0, 0, 
    'PNTLVR.IDTT1', 0, NULL, 'Associated typology ID 1');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('3176', 'frmListeAFFCNT01', 'PNTLVR', 'Occupé', 20, 
    'Occupé', 'Occupé', 0, 1, 0, 
    'DECODE(PNTLVR.Occ,1,''Oui'',''Non'')', 0, NULL, 'Occupé');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('3177', 'frmListeAFFCNT01', 'PNTLVR', 'Datmaj', 20, 
    'Mise à jour le:', 'Date de mise a jour', 0, 1, 0, 
    'TO_CHAR(PNTLVR.DATMAJ,X7UTIL.FRMDAT)', 0, NULL, 'Date de mise a jour');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('3178', 'frmListeAFFCNT01', 'PNTLVR', 'ADRLBR', 2000, 
    'Adresse', 'Adresse', 0, 1, 0, 
    'SUBSTR(REPLACE(REPLACE(PNTLVR.ADRLBR,CHR(10),'' ''),CHR(13),'' ''),1,254)', 0, NULL, 'Adresse');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('3179', 'frmListeAFFCNT01', 'PNTLVR', 'MTRAGT', 6, 
    'Agent', 'Agent', 0, 1, 0, 
    'PNTLVR.MTRAGT', 0, NULL, 'Agent');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('3180', 'frmListeAFFCNT01', 'PNTLVR', 'ADRSTR3', 50, 
    'Description of structured address 3', 'Description of structured address 3', 0, 0, 0, 
    'PNTLVR.ADRSTR3', 0, NULL, 'Description of structured address 3');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('3181', 'frmListeAFFCNT01', 'PNTLVR', 'T2', 6, 
    'Adaptable field typologie 2', 'Adaptable field typologie 2', 0, 0, 0, 
    'PNTLVR.T2', 0, NULL, 'Adaptable field typologie 2');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('3182', 'frmListeAFFCNT01', 'PNTLVR', 'OCC', 22, 
    'Occupé', 'Occupation', 0, 1, 0, 
    'PNTLVR.OCC', 0, NULL, 'Occupation');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('3183', 'frmListeAFFCNT01', 'PNTLVR', 'ANCRFR', 20, 
    'Former reference', 'Ancienne reference', 0, 1, 0, 
    'PNTLVR.ANCRFR', 0, NULL, 'Ancienne reference');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('3184', 'frmListeAFFCNT01', 'PNTLVR', 'D2', 7, 
    'Adaptable field date 2', 'Adaptable field date 2', 0, 0, 0, 
    'TO_CHAR(PNTLVR.D2,''DD/MM/YYYY'')', 0, NULL, 'Adaptable field date 2');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('3185', 'frmListeAFFCNT01', 'PNTLVR', 'ADRSTR8', 50, 
    'Description of structured address 8', 'Description of structured address 8', 0, 0, 0, 
    'PNTLVR.ADRSTR8', 0, NULL, 'Description of structured address 8');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('3186', 'frmListeAFFCNT01', 'PNTLVR', 'NUMORD', 22, 
    'Number in the standard round', 'Numero d''ordre', 0, 1, 0, 
    'PNTLVR.NUMORD', 0, NULL, 'Numero d''ordre');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('3187', 'frmListeAFFCNT01', 'PNTLVR', 'ADRSTR9', 50, 
    'Description of structured address 9', 'Description of structured address 9', 0, 0, 0, 
    'PNTLVR.ADRSTR9', 0, NULL, 'Description of structured address 9');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('3188', 'frmListeAFFCNT01', 'PNTLVR', 'A1', 40, 
    'Adaptable field string 1', 'Adaptable field string 1', 0, 0, 0, 
    'PNTLVR.A1', 0, NULL, 'Adaptable field string 1');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('3189', 'frmListeAFFCNT01', 'PNTLVR', 'T3', 6, 
    'Adaptable field typologie 3', 'Adaptable field typologie 3', 0, 0, 0, 
    'PNTLVR.T3', 0, NULL, 'Adaptable field typologie 3');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('3190', 'frmListeAFFCNT01', 'PNTLVR', 'C2', 22, 
    'Adaptable field check-box 2', 'Adaptable field check-box 2', 0, 0, 0, 
    'PNTLVR.C2', 0, NULL, 'Adaptable field check-box 2');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('3191', 'frmListeAFFCNT01', 'CPR', 'DATAGR', 7, 
    'Date d''agrement', 'Date d''agrement', 0, 1, 0, 
    'TO_CHAR(CPR.DATAGR,''DD/MM/YYYY'')', 0, NULL, 'Date d''agrement');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('3192', 'frmListeAFFCNT01', 'CPR', 'IDTT2', 6, 
    'Associated typology ID 2', 'Associated typology ID 2', 0, 0, 0, 
    'CPR.IDTT2', 0, NULL, 'Associated typology ID 2');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('3193', 'frmListeAFFCNT01', 'CPR', 'IDTT4', 6, 
    'Associated typology ID 4', 'Associated typology ID 4', 0, 0, 0, 
    'CPR.IDTT4', 0, NULL, 'Associated typology ID 4');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('3194', 'frmListeAFFCNT01', 'CPR', 'IDTAGT', 6, 
    'Employee ID', 'Employee ID', 0, 1, 0, 
    'CPR.IDTAGT', 0, NULL, 'Employee ID');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('3195', 'frmListeAFFCNT01', 'CPR', 'C4', 22, 
    'Adaptable field check-box 4', 'Adaptable field check-box 4', 0, 0, 0, 
    'CPR.C4', 0, NULL, 'Adaptable field check-box 4');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('3196', 'frmListeAFFCNT01', 'CPR', 'IDTTYPCPR', 6, 
    'Type de compteur', 'Type de compteur', 0, 1, 0, 
    'CPR.IDTTYPCPR', 0, NULL, 'Type de compteur');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('3197', 'frmListeAFFCNT01', 'CPR', 'DATFBR', 7, 
    'Date de fabrication', 'Date de fabrication', 0, 1, 0, 
    'TO_CHAR(CPR.DATFBR,''DD/MM/YYYY'')', 0, NULL, 'Date de fabrication');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('3198', 'frmListeAFFCNT01', 'CPR', 'T1', 6, 
    'Adaptable field typology 1', 'Adaptable field typology 1', 0, 0, 0, 
    'CPR.T1', 0, NULL, 'Adaptable field typology 1');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('3199', 'frmListeAFFCNT01', 'CPR', 'T3', 6, 
    'Adaptable field typology 3', 'Adaptable field typology 3', 0, 0, 0, 
    'CPR.T3', 0, NULL, 'Adaptable field typology 3');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('3200', 'frmListeAFFCNT01', 'CPR', 'IDTT3', 6, 
    'Associated typology ID 3', 'Associated typology ID 3', 0, 0, 0, 
    'CPR.IDTT3', 0, NULL, 'Associated typology ID 3');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('3201', 'frmListeAFFCNT01', 'CPR', 'IDTT5', 6, 
    'Associated typology ID 5', 'Associated typology ID 5', 0, 0, 0, 
    'CPR.IDTT5', 0, NULL, 'Associated typology ID 5');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('3202', 'frmListeAFFCNT01', 'CPR', 'N2', 22, 
    'Adaptable field number 2', 'Adaptable field number 2', 0, 0, 0, 
    'CPR.N2', 0, NULL, 'Adaptable field number 2');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('3203', 'frmListeAFFCNT01', 'CPR', 'C5', 22, 
    'Adaptable field check-box 5', 'Adaptable field check-box 5', 0, 0, 0, 
    'CPR.C5', 0, NULL, 'Adaptable field check-box 5');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('3204', 'frmListeAFFCNT01', 'CPR', 'D2', 7, 
    'Adaptable field date 2', 'Adaptable field date 2', 0, 0, 0, 
    'TO_CHAR(CPR.D2,''DD/MM/YYYY'')', 0, NULL, 'Adaptable field date 2');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('3205', 'frmListeAFFCNT01', 'CPR', 'DATRVS', 7, 
    'Date de revision', 'Date de revision', 0, 1, 0, 
    'TO_CHAR(CPR.DATRVS,''DD/MM/YYYY'')', 0, NULL, 'Date de revision');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('3206', 'frmListeAFFCNT01', 'CPR', 'IDTCPR', 22, 
    'Identifiant interne', 'Identifiant interne', 0, 1, 0, 
    'CPR.IDTCPR', 0, NULL, 'Identifiant interne');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('3207', 'frmListeAFFCNT01', 'CPR', 'A1', 40, 
    'Adaptable field string 1', 'Adaptable field string 1', 0, 0, 0, 
    'CPR.A1', 0, NULL, 'Adaptable field string 1');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('3208', 'frmListeAFFCNT01', 'CPR', 'N3', 22, 
    'Adaptable field number 3', 'Adaptable field number 3', 0, 0, 0, 
    'CPR.N3', 0, NULL, 'Adaptable field number 3');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('3209', 'frmListeAFFCNT01', 'CPR', 'D3', 7, 
    'Adaptable field date 3', 'Adaptable field date 3', 0, 0, 0, 
    'TO_CHAR(CPR.D3,''DD/MM/YYYY'')', 0, NULL, 'Adaptable field date 3');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('3210', 'frmListeAFFCNT01', 'CPR', 'IDTCODOBS', 22, 
    'Observation code ID', 'Observation code ID', 0, 1, 0, 
    'CPR.IDTCODOBS', 0, NULL, 'Observation code ID');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('3211', 'frmListeAFFCNT01', 'CPR', 'T4', 6, 
    'Adaptable field typology 4', 'Adaptable field typology 4', 0, 0, 0, 
    'CPR.T4', 0, NULL, 'Adaptable field typology 4');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('3212', 'frmListeAFFCNT01', 'CPR', 'A3', 40, 
    'Adaptable field string 3', 'Adaptable field string 3', 0, 0, 0, 
    'CPR.A3', 0, NULL, 'Adaptable field string 3');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('3213', 'frmListeAFFCNT01', 'CPR', 'NUMCPR', 20, 
    'Numero', 'Numero', 0, 1, 0, 
    'CPR.NUMCPR', 0, NULL, 'Numero');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('3214', 'frmListeAFFCNT01', 'CPR', 'N4', 22, 
    'Adaptable field number 4', 'Adaptable field number 4', 0, 0, 0, 
    'CPR.N4', 0, NULL, 'Adaptable field number 4');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('3215', 'frmListeAFFCNT01', 'CPR', 'N5', 22, 
    'Adaptable field number 5', 'Adaptable field number 5', 0, 0, 0, 
    'CPR.N5', 0, NULL, 'Adaptable field number 5');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('3216', 'frmListeAFFCNT01', 'CPR', 'C1', 22, 
    'Adaptable field check-box 1', 'Adaptable field check-box 1', 0, 0, 0, 
    'CPR.C1', 0, NULL, 'Adaptable field check-box 1');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('3217', 'frmListeAFFCNT01', 'CPR', 'C2', 22, 
    'Adaptable field check-box 2', 'Adaptable field check-box 2', 0, 0, 0, 
    'CPR.C2', 0, NULL, 'Adaptable field check-box 2');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('3218', 'frmListeAFFCNT01', 'CPR', 'C3', 22, 
    'Adaptable field check-box 3', 'Adaptable field check-box 3', 0, 0, 0, 
    'CPR.C3', 0, NULL, 'Adaptable field check-box 3');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('3219', 'frmListeAFFCNT01', 'CPR', 'DATMAJ', 7, 
    'Date de mise à jour', 'Date de mise à jour', 0, 1, 0, 
    'TO_CHAR(CPR.DATMAJ,''DD/MM/YYYY'')', 0, NULL, 'Date de mise à jour');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('3220', 'frmListeAFFCNT01', 'CPR', 'NUMENQ', 22, 
    'Recensement', 'Recensement', 0, 1, 0, 
    'CPR.NUMENQ', 0, NULL, 'Recensement');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('3221', 'frmListeAFFCNT01', 'CPR', 'A4', 40, 
    'Adaptable field string 4', 'Adaptable field string 4', 0, 0, 0, 
    'CPR.A4', 0, NULL, 'Adaptable field string 4');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('3222', 'frmListeAFFCNT01', 'CPR', 'DATETL', 7, 
    'Date d''etalonnage', 'Date d''etalonnage', 0, 1, 0, 
    'TO_CHAR(CPR.DATETL,''DD/MM/YYYY'')', 0, NULL, 'Date d''etalonnage');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('3223', 'frmListeAFFCNT01', 'CPR', 'SQCCNS', 22, 
    'Consumption serial number', 'Consumption serial number', 0, 1, 0, 
    'CPR.SQCCNS', 0, NULL, 'Consumption serial number');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('3224', 'frmListeAFFCNT01', 'CPR', 'IDTSQCGNR', 22, 
    'General identifier', 'General identifier', 0, 1, 0, 
    'CPR.IDTSQCGNR', 0, NULL, 'General identifier');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('3225', 'frmListeAFFCNT01', 'CPR', 'IDTT1', 6, 
    'Associated typology ID 1', 'Associated typology ID 1', 0, 0, 0, 
    'CPR.IDTT1', 0, NULL, 'Associated typology ID 1');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('3226', 'frmListeAFFCNT01', 'CPR', 'A5', 40, 
    'Adaptable field string 5', 'Adaptable field string 5', 0, 0, 0, 
    'CPR.A5', 0, NULL, 'Adaptable field string 5');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('3227', 'frmListeAFFCNT01', 'CPR', 'N1', 22, 
    'Adaptable field number 1', 'Adaptable field number 1', 0, 0, 0, 
    'CPR.N1', 0, NULL, 'Adaptable field number 1');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('3228', 'frmListeAFFCNT01', 'CPR', 'D4', 7, 
    'Adaptable field date 4', 'Adaptable field date 4', 0, 0, 0, 
    'TO_CHAR(CPR.D4,''DD/MM/YYYY'')', 0, NULL, 'Adaptable field date 4');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('3229', 'frmListeAFFCNT01', 'CPR', 'DATGRN', 7, 
    'Date de garantie', 'Date de garantie', 0, 1, 0, 
    'TO_CHAR(CPR.DATGRN,''DD/MM/YYYY'')', 0, NULL, 'Date de garantie');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('3230', 'frmListeAFFCNT01', 'CPR', 'SQCIND', 22, 
    'Serial number of the index of the meter', 'Serial number of the index of the meter', 0, 1, 0, 
    'CPR.SQCIND', 0, NULL, 'Serial number of the index of the meter');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('3231', 'frmListeAFFCNT01', 'CPR', 'T2', 6, 
    'Adaptable field typology 2', 'Adaptable field typology 2', 0, 0, 0, 
    'CPR.T2', 0, NULL, 'Adaptable field typology 2');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('3232', 'frmListeAFFCNT01', 'CPR', 'T5', 6, 
    'Adaptable field typology 5', 'Adaptable field typology 5', 0, 0, 0, 
    'CPR.T5', 0, NULL, 'Adaptable field typology 5');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('3233', 'frmListeAFFCNT01', 'CPR', 'A2', 40, 
    'Adaptable field string 2', 'Adaptable field string 2', 0, 0, 0, 
    'CPR.A2', 0, NULL, 'Adaptable field string 2');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('3234', 'frmListeAFFCNT01', 'CPR', 'D1', 7, 
    'Adaptable field date 1', 'Adaptable field date 1', 0, 0, 0, 
    'TO_CHAR(CPR.D1,''DD/MM/YYYY'')', 0, NULL, 'Adaptable field date 1');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('3235', 'frmListeAFFCNT01', 'CPR', 'D5', 7, 
    'Adaptable field date 5', 'Adaptable field date 5', 0, 0, 0, 
    'TO_CHAR(CPR.D5,''DD/MM/YYYY'')', 0, NULL, 'Adaptable field date 5');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('3236', 'frmListeAFFCNT01', 'PNTCPG', 'DEBDRNPRDRLV', 7, 
    'Début de période', 'Début de période', 0, 1, 0, 
    'TO_CHAR(PNTCPG.DEBDRNPRDRLV,''DD/MM/YYYY'')', 0, NULL, 'Début de période');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('3237', 'frmListeAFFCNT01', 'PNTCPG', 'DMT', 22, 
    'Diamètre', 'Diametre', 0, 1, 0, 
    'PNTCPG.DMT', 0, NULL, 'Diametre');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('3238', 'frmListeAFFCNT01', 'PNTCPG', 'T2', 6, 
    'Adaptable field typologie 2', 'Adaptable field typologie 2', 0, 0, 0, 
    'PNTCPG.T2', 0, NULL, 'Adaptable field typologie 2');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('3239', 'frmListeAFFCNT01', 'PNTCPG', 'IDTT2', 6, 
    'Associated typology ID 2', 'Associated typology ID 2', 0, 0, 0, 
    'PNTCPG.IDTT2', 0, NULL, 'Associated typology ID 2');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('2929', 'frmListeCLTCPT01', 'CTR_ALL', 'CODTYPCTR', 6, 
    'Type of contract code', 'Type de contrat', 0, 1, 0, 
    'CTR_ALL.CODTYPCTR', 0, NULL, 'Type de contrat');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('2930', 'frmListeCLTCPT01', 'CTR_ALL', 'CLERIB', 2, 
    'Bank account code', 'Bank account code', 0, 1, 0, 
    'CTR_ALL.CLERIB', 0, NULL, 'Bank account code');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('2931', 'frmListeCLTCPT01', 'CTR_ALL', 'C3', 22, 
    'Adaptable field check-box 3', 'Adaptable field check-box 3', 0, 0, 0, 
    'CTR_ALL.C3', 0, NULL, 'Adaptable field check-box 3');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('2932', 'frmListeCLTCPT01', 'CTR_ALL', 'D4', 7, 
    'Adaptable field date 4', 'Adaptable field date 4', 0, 0, 0, 
    'TO_CHAR(CTR_ALL.D4,''DD/MM/YYYY'')', 0, NULL, 'Adaptable field date 4');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('2933', 'frmListeCLTCPT01', 'CTR_ALL', 'DATCRT', 7, 
    'Creation date', 'Creation date', 0, 1, 0, 
    'TO_CHAR(CTR_ALL.DATCRT,''DD/MM/YYYY'')', 0, NULL, 'Creation date');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('2934', 'frmListeCLTCPT01', 'CTR_ALL', 'PRPCPTBNC', 40, 
    'Bank account owner', 'Bank account owner', 0, 1, 0, 
    'CTR_ALL.PRPCPTBNC', 0, NULL, 'Bank account owner');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('2935', 'frmListeCLTCPT01', 'CTR_ALL', 'IDTT2', 6, 
    'Associated typology ID 2', 'Associated typology ID 2', 0, 0, 0, 
    'CTR_ALL.IDTT2', 0, NULL, 'Associated typology ID 2');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('2936', 'frmListeCLTCPT01', 'CTR_ALL', 'A1', 40, 
    'Adaptable field string 1', 'Adaptable field string 1', 0, 0, 0, 
    'CTR_ALL.A1', 0, NULL, 'Adaptable field string 1');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('2937', 'frmListeCLTCPT01', 'CTR_ALL', 'IDTPNTCPG', 6, 
    'Point de comptage', 'Point de comptage', 0, 1, 0, 
    'PNTCPG.IDTPNTCPG', 0, NULL, 'Point de comptage');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('2938', 'frmListeCLTCPT01', 'CTR_ALL', 'IDTLOTFAC', 6, 
    'Billing batch ID', 'Lot de facturation', 0, 1, 0, 
    'CTR_ALL.IDTLOTFAC', 0, NULL, 'Lot de facturation');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('2939', 'frmListeCLTCPT01', 'CTR_ALL', 'MTFRSL', 15, 
    'Motive for termination', 'Motive for termination', 0, 1, 0, 
    'CTR_ALL.MTFRSL', 0, NULL, 'Motive for termination');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('2940', 'frmListeCLTCPT01', 'CTR_ALL', 'ETTCTR', 22, 
    'Contract status ( 1< normal>, 2<creation mode of the amendment>, 3<cancellation mode>, 4<creation mode>)', 'Contract status ( 1< normal>, 2<creation mode of the amendment>, 3<cancellation mode>, 4<creation mode>)', 0, 1, 0, 
    'CTR_ALL.ETTCTR', 0, NULL, 'Contract status ( 1< normal>, 2<creation mode of the amendment>, 3<cancellation mode>, 4<creation mode>)');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('2941', 'frmListeCLTCPT01', 'CTR_ALL', 'D5', 7, 
    'Adaptable field date 5', 'Adaptable field date 5', 0, 0, 0, 
    'TO_CHAR(CTR_ALL.D5,''DD/MM/YYYY'')', 0, NULL, 'Adaptable field date 5');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('2942', 'frmListeCLTCPT01', 'CTR_ALL', 'ANCRFR', 20, 
    'Ancienne reference', 'Ancienne reference', 0, 1, 0, 
    'CTR_ALL.ANCRFR', 0, NULL, 'Ancienne reference');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('2943', 'frmListeCLTCPT01', 'CTR_ALL', 'MTRAGT', 6, 
    'ID of the employee who carries out updating', 'ID of the employee who carries out updating', 0, 1, 0, 
    'CTR_ALL.MTRAGT', 0, NULL, 'ID of the employee who carries out updating');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('2944', 'frmListeCLTCPT01', 'CTR_ALL', 'N1', 22, 
    'Adaptable field number 1', 'Adaptable field number 1', 0, 0, 0, 
    'CTR_ALL.N1', 0, NULL, 'Adaptable field number 1');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('2945', 'frmListeCLTCPT01', 'CTR_ALL', 'N3', 22, 
    'Adaptable field number 3', 'Adaptable field number 3', 0, 0, 0, 
    'CTR_ALL.N3', 0, NULL, 'Adaptable field number 3');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('2946', 'frmListeCLTCPT01', 'CTR_ALL', 'N4', 22, 
    'Adaptable field number 4', 'Adaptable field number 4', 0, 0, 0, 
    'CTR_ALL.N4', 0, NULL, 'Adaptable field number 4');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('2947', 'frmListeCLTCPT01', 'CTR_ALL', 'IDTCLTDST', 6, 
    'Addressee ID', 'Code destinataire', 0, 1, 0, 
    'CTR_ALL.IDTCLTDST', 0, NULL, 'Code destinataire');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('2948', 'frmListeCLTCPT01', 'CTR_ALL', 'IDTCLTSSC', 6, 
    'Client souscripteur', 'Code souscripteur', 0, 1, 0, 
    'CTR_ALL.IDTCLTSSC', 0, NULL, 'Code souscripteur');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('2949', 'frmListeCLTCPT01', 'CTR_ALL', 'T1', 6, 
    'Adaptable field typologie 1', 'Adaptable field typologie 1', 0, 0, 0, 
    'CTR_ALL.T1', 0, NULL, 'Adaptable field typologie 1');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('2950', 'frmListeCLTCPT01', 'CTR_ALL', 'C1', 22, 
    'Adaptable field check-box 1', 'Adaptable field check-box 1', 0, 0, 0, 
    'CTR_ALL.C1', 0, NULL, 'Adaptable field check-box 1');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('2951', 'frmListeCLTCPT01', 'CTR_ALL', 'C5', 22, 
    'Adaptable field check-box 5', 'Adaptable field check-box 5', 0, 0, 0, 
    'CTR_ALL.C5', 0, NULL, 'Adaptable field check-box 5');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('2952', 'frmListeCLTCPT01', 'CTR_ALL', 'D3', 7, 
    'Adaptable field date 3', 'Adaptable field date 3', 0, 0, 0, 
    'TO_CHAR(CTR_ALL.D3,''DD/MM/YYYY'')', 0, NULL, 'Adaptable field date 3');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('2953', 'frmListeCLTCPT01', 'CTR_ALL', 'ETTCTRFCT', 22, 
    'Billing status of contract (1<normal>, 2<computation mode>, 3<validation mode>, 4<periodical billing on going>)', 'Billing status of contract (1<normal>, 2<computation mode>, 3<validation mode>, 4<periodical billing on going>)', 0, 1, 0, 
    'CTR_ALL.ETTCTRFCT', 0, NULL, 'Billing status of contract (1<normal>, 2<computation mode>, 3<validation mode>, 4<periodical billing on going>)');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('2954', 'frmListeCLTCPT01', 'CTR_ALL', 'T2', 6, 
    'Adaptable field typologie 2', 'Adaptable field typologie 2', 0, 0, 0, 
    'CTR_ALL.T2', 0, NULL, 'Adaptable field typologie 2');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('2955', 'frmListeCLTCPT01', 'CTR_ALL', 'IDTGCH', 6, 
    'Counter ID', 'Counter ID', 0, 1, 0, 
    'CTR_ALL.IDTGCH', 0, NULL, 'Counter ID');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('2956', 'frmListeCLTCPT01', 'CPTCLT', 'DATMAJCPTCLT', 7, 
    'Date de mise a jour du compte client', 'Date de mise a jour du compte client', 0, 1, 0, 
    'TO_CHAR(CPTCLT.DATMAJCPTCLT,X7UTIL.FRMDAT)', 0, NULL, 'Date de mise a jour du compte client');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('2957', 'frmListeCLTCPT01', 'CPTCLT', 'DATDRNRLC', 22, 
    'Date de derniere relance', 'Date de derniere relance', 0, 1, 0, 
    'TO_CHAR(CPTCLT.DATDRNRLC,X7UTIL.FRMDAT)', 0, NULL, 'Date de derniere relance');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('2958', 'frmListeCLTCPT01', 'CPTCLT', 'DATFRM', 7, 
    'Date de fermeture', 'Date de fermeture', 0, 1, 0, 
    'TO_CHAR(CPTCLT.DATFRM,X7UTIL.FRMDAT)', 0, NULL, 'Date de fermeture');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('2959', 'frmListeCLTCPT01', 'CPTCLT', 'CPTDVS', 22, 
    'Compte en devise', 'Compte en devise', 0, 1, 0, 
    'CPTCLT.CPTDVS', 0, NULL, 'Compte en devise');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('2960', 'frmListeCLTCPT01', 'CPTCLT', 'IDTBNQ', 22, 
    'Code banque', 'Code banque', 0, 1, 0, 
    'CPTCLT.IDTBNQ', 0, NULL, 'Code banque');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('2961', 'frmListeCLTCPT01', 'CPTCLT', 'DATMAJSLD', 7, 
    'Date de mise a jour du solde', 'Date de mise a jour du solde', 0, 1, 0, 
    'TO_CHAR(CPTCLT.DATMAJSLD,X7UTIL.FRMDAT)', 0, NULL, 'Date de mise a jour du solde');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('2962', 'frmListeCLTCPT01', 'CPTCLT', 'DATINTRTR', 7, 
    'Date du dernier calcul des interets de retard', 'Date du dernier calcul des interets de retard', 0, 1, 0, 
    'TO_CHAR(CPTCLT.DATINTRTR,X7UTIL.FRMDAT)', 0, NULL, 'Date du dernier calcul des interets de retard');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('2963', 'frmListeCLTCPT01', 'CPTCLT', 'DATCRT', 22, 
    'Date oper', 'Date oper', 0, 1, 0, 
    '(SELECT TO_CHAR(MAX(DATCRT),X7UTIL.FRMDAT)DATCRT FROM OPR WHERE CPTCLT.IDTCLT=OPR.IDTCLT)', 0, NULL, 'Date oper');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('2964', 'frmListeCLTCPT01', 'CPTCLT', 'DATOVR', 7, 
    'Date d''ouverture', 'Date d''ouverture', 0, 1, 0, 
    'TO_CHAR(CPTCLT.DATOVR,X7UTIL.FRMDAT)', 0, NULL, 'Date d''ouverture');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('2965', 'frmListeCLTCPT01', 'CPTCLT', 'ECHEANCIERENCOURS( CPTCLT.IDTCLT )', 22, 
    'Echeancier en cours', 'Echeancier en cours', 0, 1, 0, 
    'ECHEANCIERENCOURS( CPTCLT.IDTCLT )', 0, NULL, 'Echeancier en cours');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('2966', 'frmListeAFFCNT01', 'AFF', 'IDTCLT', 6, 
    'Client', 'Client', 0, 1, 0, 
    'AFF.IDTCLT', 0, NULL, 'Client');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('2967', 'frmListeAFFCNT01', 'AFF', 'IDTCNT', 6, 
    'Contact', 'Contact', 0, 1, 0, 
    'AFF.IDTCNT', 0, NULL, 'Contact');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('2968', 'frmListeAFFCNT01', 'SRV', 'CODSRV', 6, 
    'Service', 'Code', 0, 1, 0, 
    'SRV.CODSRV', 0, NULL, 'Code');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('2969', 'frmListeAFFCNT01', 'CTR_ALL', 'IDTT2', 6, 
    'Associated typology ID 2', 'Associated typology ID 2', 0, 0, 0, 
    'CTR_ALL.IDTT2', 0, NULL, 'Associated typology ID 2');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('2970', 'frmListeAFFCNT01', 'CTR_ALL', 'T5', 6, 
    'Adaptable field typologie 5', 'Adaptable field typologie 5', 0, 0, 0, 
    'CTR_ALL.T5', 0, NULL, 'Adaptable field typologie 5');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('2971', 'frmListeAFFCNT01', 'CTR_ALL', 'N2', 22, 
    'Adaptable field number 2', 'Adaptable field number 2', 0, 0, 0, 
    'CTR_ALL.N2', 0, NULL, 'Adaptable field number 2');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('2972', 'frmListeAFFCNT01', 'CTR_ALL', 'IDTCTR', 60, 
    'Point de livraison', 'Numero', 0, 1, 0, 
    'PNTLVR.IdtDcpGgr || PRMGNR.SprCdf || PNTLVR.NumOrd', 0, NULL, 'Numero');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('2973', 'frmListeAFFCNT01', 'CTR_ALL', 'IDTPNTCPG', 6, 
    'Point de comptage', 'Point de comptage', 0, 1, 0, 
    'PNTCPG.IDTPNTCPG', 0, NULL, 'Point de comptage');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('2974', 'frmListeAFFCNT01', 'CTR_ALL', 'CLERIB', 2, 
    'Bank account code', 'Bank account code', 0, 1, 0, 
    'CTR_ALL.CLERIB', 0, NULL, 'Bank account code');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('2975', 'frmListeAFFCNT01', 'CTR_ALL', 'DATSCR', 15, 
    'Souscrit le', 'Date de souscription', 0, 1, 0, 
    'TO_CHAR(CTR_ALL.DATSCR,''DD/MM/YYYY'')', 0, NULL, 'Date de souscription');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('2976', 'frmListeAFFCNT01', 'CTR_ALL', 'T3', 6, 
    'Adaptable field typologie 3', 'Adaptable field typologie 3', 0, 0, 0, 
    'CTR_ALL.T3', 0, NULL, 'Adaptable field typologie 3');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('2977', 'frmListeAFFCNT01', 'CTR_ALL', 'IDTT3', 6, 
    'Associated typology ID 3', 'Associated typology ID 3', 0, 0, 0, 
    'CTR_ALL.IDTT3', 0, NULL, 'Associated typology ID 3');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('2978', 'frmListeAFFCNT01', 'CTR_ALL', 'IDTCTR', 10, 
    'Numéro', 'Numero', 0, 1, 0, 
    'CTR_ALL.IDTCTR', 0, NULL, 'Numero');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('2979', 'frmListeAFFCNT01', 'CTR_ALL', 'IDTLOTFAC', 6, 
    'Billing batch ID', 'Lot de facturation', 0, 1, 0, 
    'CTR_ALL.IDTLOTFAC', 0, NULL, 'Lot de facturation');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('2980', 'frmListeAFFCNT01', 'CTR_ALL', 'IDTCLTDST', 6, 
    'Addressee ID', 'Code destinataire', 0, 1, 0, 
    'CTR_ALL.IDTCLTDST', 0, NULL, 'Code destinataire');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('2981', 'frmListeAFFCNT01', 'CTR_ALL', 'IDTCNTOPR', 6, 
    'Centre opérationel', 'Centre opérationel', 0, 1, 0, 
    'CTR_ALL.IDTCNTOPR', 0, NULL, 'Centre opérationel');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('2982', 'frmListeAFFCNT01', 'CTR_ALL', 'DATRSL', 7, 
    'Résilié le', 'Date de resiliation', 0, 1, 0, 
    'TO_CHAR(CTR_ALL.DATRSL,''DD/MM/YYYY'')', 0, NULL, 'Date de resiliation');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('2983', 'frmListeAFFCNT01', 'CTR_ALL', 'DATDRNFCT', 7, 
    'Date of last billing of the contract', 'Date de derniere facturation', 0, 1, 0, 
    'TO_CHAR(CTR_ALL.DATDRNFCT,''DD/MM/YYYY'')', 0, NULL, 'Date de derniere facturation');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('2984', 'frmListeAFFCNT01', 'CTR_ALL', 'FINDRNPRDFCT', 7, 
    'Last billed period (ending date)', '????? ??? ????', 0, 1, 0, 
    'TO_CHAR(CTR_ALL.FINDRNPRDFCT,''DD/MM/YYYY'')', 0, NULL, '????? ??? ????');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('2985', 'frmListeAFFCNT01', 'CTR_ALL', 'SQCAVN', 22, 
    'Amendment serial number', 'Amendment serial number', 0, 1, 0, 
    'CTR_ALL.SQCAVN', 0, NULL, 'Amendment serial number');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('2986', 'frmListeAFFCNT01', 'CTR_ALL', 'D2', 7, 
    'Adaptable field date 2', 'Adaptable field date 2', 0, 0, 0, 
    'TO_CHAR(CTR_ALL.D2,''DD/MM/YYYY'')', 0, NULL, 'Adaptable field date 2');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('2987', 'frmListeAFFCNT01', 'CTR_ALL', 'D3', 7, 
    'Adaptable field date 3', 'Adaptable field date 3', 0, 0, 0, 
    'TO_CHAR(CTR_ALL.D3,''DD/MM/YYYY'')', 0, NULL, 'Adaptable field date 3');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('2988', 'frmListeAFFCNT01', 'CTR_ALL', 'DATCRT', 7, 
    'Creation date', 'Creation date', 0, 1, 0, 
    'TO_CHAR(CTR_ALL.DATCRT,''DD/MM/YYYY'')', 0, NULL, 'Creation date');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('2989', 'frmListeAFFCNT01', 'CTR_ALL', 'IDTT5', 6, 
    'Associated typology ID 5', 'Associated typology ID 5', 0, 0, 0, 
    'CTR_ALL.IDTT5', 0, NULL, 'Associated typology ID 5');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('2990', 'frmListeAFFCNT01', 'CTR_ALL', 'A2', 40, 
    'Adaptable field string 2', 'Adaptable field string 2', 0, 0, 0, 
    'CTR_ALL.A2', 0, NULL, 'Adaptable field string 2');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('2991', 'frmListeAFFCNT01', 'CTR_ALL', 'N3', 22, 
    'Adaptable field number 3', 'Adaptable field number 3', 0, 0, 0, 
    'CTR_ALL.N3', 0, NULL, 'Adaptable field number 3');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('2992', 'frmListeAFFCNT01', 'CTR_ALL', 'MTFRSL', 15, 
    'Motive for termination', 'Motive for termination', 0, 1, 0, 
    'CTR_ALL.MTFRSL', 0, NULL, 'Motive for termination');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('2993', 'frmListeAFFCNT01', 'CTR_ALL', 'NUMINTER', 22, 
    'Work order number', 'Work order number', 0, 1, 0, 
    'CTR_ALL.NUMINTER', 0, NULL, 'Work order number');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('2994', 'frmListeAFFCNT01', 'CTR_ALL', 'IDTBNQ', 6, 
    'Banque', 'Banque', 0, 1, 0, 
    'CTR_ALL.IDTBNQ', 0, NULL, 'Banque');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('2995', 'frmListeAFFCNT01', 'CTR_ALL', 'C3', 22, 
    'Adaptable field check-box 3', 'Adaptable field check-box 3', 0, 0, 0, 
    'CTR_ALL.C3', 0, NULL, 'Adaptable field check-box 3');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('2996', 'frmListeAFFCNT01', 'CTR_ALL', 'C5', 22, 
    'Adaptable field check-box 5', 'Adaptable field check-box 5', 0, 0, 0, 
    'CTR_ALL.C5', 0, NULL, 'Adaptable field check-box 5');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('2997', 'frmListeAFFCNT01', 'CTR_ALL', 'MTRAGT', 6, 
    'ID of the employee who carries out updating', 'ID of the employee who carries out updating', 0, 1, 0, 
    'CTR_ALL.MTRAGT', 0, NULL, 'ID of the employee who carries out updating');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('2998', 'frmListeAFFCNT01', 'CTR_ALL', 'IDTGCH', 6, 
    'Counter ID', 'Counter ID', 0, 1, 0, 
    'CTR_ALL.IDTGCH', 0, NULL, 'Counter ID');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('2999', 'frmListeAFFCNT01', 'CTR_ALL', 'IDTT4', 6, 
    'Associated typology ID 4', 'Associated typology ID 4', 0, 0, 0, 
    'CTR_ALL.IDTT4', 0, NULL, 'Associated typology ID 4');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('3000', 'frmListeAFFCNT01', 'CTR_ALL', 'N1', 22, 
    'Adaptable field number 1', 'Adaptable field number 1', 0, 0, 0, 
    'CTR_ALL.N1', 0, NULL, 'Adaptable field number 1');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('3001', 'frmListeAFFCNT01', 'CTR_ALL', 'N5', 22, 
    'Adaptable field number 5', 'Adaptable field number 5', 0, 0, 0, 
    'CTR_ALL.N5', 0, NULL, 'Adaptable field number 5');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('3002', 'frmListeAFFCNT01', 'CTR_ALL', 'IDTPNTLVR', 22, 
    'Delivery point ID', 'Delivery point ID', 0, 1, 0, 
    'CTR_ALL.IDTPNTLVR', 0, NULL, 'Delivery point ID');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('3003', 'frmListeAFFCNT01', 'CTR_ALL', 'IDTPNTCPG', 22, 
    'Metering point ID', 'Metering point ID', 0, 1, 0, 
    'CTR_ALL.IDTPNTCPG', 0, NULL, 'Metering point ID');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('3004', 'frmListeAFFCNT01', 'CTR_ALL', 'ETTCTR', 22, 
    'Contract status ( 1< normal>, 2<creation mode of the amendment>, 3<cancellation mode>, 4<creation mode>)', 'Contract status ( 1< normal>, 2<creation mode of the amendment>, 3<cancellation mode>, 4<creation mode>)', 0, 1, 0, 
    'CTR_ALL.ETTCTR', 0, NULL, 'Contract status ( 1< normal>, 2<creation mode of the amendment>, 3<cancellation mode>, 4<creation mode>)');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('3005', 'frmListeAFFCNT01', 'CTR_ALL', 'T1', 6, 
    'Adaptable field typologie 1', 'Adaptable field typologie 1', 0, 0, 0, 
    'CTR_ALL.T1', 0, NULL, 'Adaptable field typologie 1');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('3006', 'frmListeAFFCNT01', 'CTR_ALL', 'PRPCPTBNC', 40, 
    'Bank account owner', 'Bank account owner', 0, 1, 0, 
    'CTR_ALL.PRPCPTBNC', 0, NULL, 'Bank account owner');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('3007', 'frmListeAFFCNT01', 'CTR_ALL', 'N4', 22, 
    'Adaptable field number 4', 'Adaptable field number 4', 0, 0, 0, 
    'CTR_ALL.N4', 0, NULL, 'Adaptable field number 4');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('3008', 'frmListeAFFCNT01', 'CTR_ALL', 'IDTCLTSSC', 6, 
    'Client souscripteur', 'Code souscripteur', 0, 1, 0, 
    'CTR_ALL.IDTCLTSSC', 0, NULL, 'Code souscripteur');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('3009', 'frmListeAFFCNT01', 'CTR_ALL', 'DPTGRN', 22, 
    'Deposit', 'Depot de garantie', 0, 1, 0, 
    'CTR_ALL.DPTGRN', 0, NULL, 'Depot de garantie');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('3010', 'frmListeAFFCNT01', 'CTR_ALL', 'CODTYPCTR', 6, 
    'Type of contract code', 'Type de contrat', 0, 1, 0, 
    'CTR_ALL.CODTYPCTR', 0, NULL, 'Type de contrat');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('3011', 'frmListeAFFCNT01', 'CTR_ALL', 'IDTRCVTYP', 6, 
    'Debt recovery type ID', 'Recouvrement type', 0, 1, 0, 
    'CTR_ALL.IDTRCVTYP', 0, NULL, 'Recouvrement type');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('3012', 'frmListeAFFCNT01', 'CTR_ALL', 'T2', 6, 
    'Adaptable field typologie 2', 'Adaptable field typologie 2', 0, 0, 0, 
    'CTR_ALL.T2', 0, NULL, 'Adaptable field typologie 2');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('3013', 'frmListeAFFCNT01', 'CTR_ALL', 'ETTCTRFCT', 22, 
    'Billing status of contract (1<normal>, 2<computation mode>, 3<validation mode>, 4<periodical billing on going>)', 'Billing status of contract (1<normal>, 2<computation mode>, 3<validation mode>, 4<periodical billing on going>)', 0, 1, 0, 
    'CTR_ALL.ETTCTRFCT', 0, NULL, 'Billing status of contract (1<normal>, 2<computation mode>, 3<validation mode>, 4<periodical billing on going>)');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('3014', 'frmListeAFFCNT01', 'CTR_ALL', 'A5', 40, 
    'Adaptable field string 5', 'Adaptable field string 5', 0, 0, 0, 
    'CTR_ALL.A5', 0, NULL, 'Adaptable field string 5');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('3015', 'frmListeAFFCNT01', 'CTR_ALL', 'IDTSRV', 22, 
    'Service ID (1 <WATER>, 2 <LV electricity>, 3 <MV electricity>, ...)', 'Service ID (1 <WATER>, 2 <LV electricity>, 3 <MV electricity>, ...)', 0, 1, 0, 
    'CTR_ALL.IDTSRV', 0, NULL, 'Service ID (1 <WATER>, 2 <LV electricity>, 3 <MV electricity>, ...)');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('3016', 'frmListeAFFCNT01', 'CTR_ALL', 'IDTSQCGNR', 22, 
    'General identifier', 'General identifier', 0, 1, 0, 
    'CTR_ALL.IDTSQCGNR', 0, NULL, 'General identifier');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('3017', 'frmListeAFFCNT01', 'CTR_ALL', 'IDTT1', 6, 
    'Associated typology ID 1', 'Associated typology ID 1', 0, 0, 0, 
    'CTR_ALL.IDTT1', 0, NULL, 'Associated typology ID 1');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('3018', 'frmListeAFFCNT01', 'CTR_ALL', 'C1', 22, 
    'Adaptable field check-box 1', 'Adaptable field check-box 1', 0, 0, 0, 
    'CTR_ALL.C1', 0, NULL, 'Adaptable field check-box 1');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('3019', 'frmListeAFFCNT01', 'CTR_ALL', 'C4', 22, 
    'Adaptable field check-box 4', 'Adaptable field check-box 4', 0, 0, 0, 
    'CTR_ALL.C4', 0, NULL, 'Adaptable field check-box 4');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('3020', 'frmListeAFFCNT01', 'CTR_ALL', 'T4', 6, 
    'Adaptable field typologie 4', 'Adaptable field typologie 4', 0, 0, 0, 
    'CTR_ALL.T4', 0, NULL, 'Adaptable field typologie 4');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('3021', 'frmListeAFFCNT01', 'CTR_ALL', 'A1', 40, 
    'Adaptable field string 1', 'Adaptable field string 1', 0, 0, 0, 
    'CTR_ALL.A1', 0, NULL, 'Adaptable field string 1');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('3022', 'frmListeAFFCNT01', 'CTR_ALL', 'A3', 40, 
    'Adaptable field string 3', 'Adaptable field string 3', 0, 0, 0, 
    'CTR_ALL.A3', 0, NULL, 'Adaptable field string 3');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('3023', 'frmListeAFFCNT01', 'CTR_ALL', 'IDTCODSNS', 6, 
    'Code sensibilité', 'Code sensibilité', 0, 1, 0, 
    'CTR_ALL.IDTCODSNS', 0, NULL, 'Code sensibilité');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('3024', 'frmListeAFFCNT01', 'CTR_ALL', 'DEBDRNPRDFCT', 7, 
    'Last billed period (starting date)', 'Last billed period (starting date)', 0, 1, 0, 
    'TO_CHAR(CTR_ALL.DEBDRNPRDFCT,''DD/MM/YYYY'')', 0, NULL, 'Last billed period (starting date)');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('3025', 'frmListeAFFCNT01', 'CTR_ALL', 'D1', 7, 
    'Adaptable field date 1', 'Adaptable field date 1', 0, 0, 0, 
    'TO_CHAR(CTR_ALL.D1,''DD/MM/YYYY'')', 0, NULL, 'Adaptable field date 1');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('3026', 'frmListeAFFCNT01', 'CTR_ALL', 'D4', 7, 
    'Adaptable field date 4', 'Adaptable field date 4', 0, 0, 0, 
    'TO_CHAR(CTR_ALL.D4,''DD/MM/YYYY'')', 0, NULL, 'Adaptable field date 4');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('3027', 'frmListeAFFCNT01', 'CTR_ALL', 'A4', 40, 
    'Adaptable field string 4', 'Adaptable field string 4', 0, 0, 0, 
    'CTR_ALL.A4', 0, NULL, 'Adaptable field string 4');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('3028', 'frmListeAFFCNT01', 'CTR_ALL', 'NUMCPTBNC', 30, 
    'Bank account number', 'Compte', 0, 1, 0, 
    'CTR_ALL.NUMCPTBNC', 0, NULL, 'Compte');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('3029', 'frmListeAFFCNT01', 'CTR_ALL', 'C2', 22, 
    'Adaptable field check-box 2', 'Adaptable field check-box 2', 0, 0, 0, 
    'CTR_ALL.C2', 0, NULL, 'Adaptable field check-box 2');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('3030', 'frmListeAFFCNT01', 'CTR_ALL', 'D5', 7, 
    'Adaptable field date 5', 'Adaptable field date 5', 0, 0, 0, 
    'TO_CHAR(CTR_ALL.D5,''DD/MM/YYYY'')', 0, NULL, 'Adaptable field date 5');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('3031', 'frmListeAFFCNT01', 'CTR_ALL', 'ANCRFR', 20, 
    'Ancienne reference', 'Ancienne reference', 0, 1, 0, 
    'CTR_ALL.ANCRFR', 0, NULL, 'Ancienne reference');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('3032', 'frmListeAFFCNT01', 'CTR_ALL', 'DATMAJ', 7, 
    'Date de mise à jour', 'Date de mise à jour', 0, 1, 0, 
    'TO_CHAR(CTR_ALL.DATMAJ,''DD/MM/YYYY'')', 0, NULL, 'Date de mise à jour');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('3033', 'frmListeAFFCNT01', 'INT', 'IDTCNTOPR', 12, 
    'CO', 'CO', 0, 1, 0, 
    'INT.IDTCNTOPR', 0, NULL, 'CO');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('3034', 'frmListeAFFCNT01', 'INT', 'DATEDTBI', 12, 
    'Date d''edition', 'Date d''edition', 0, 1, 0, 
    'TO_CHAR(INT.DATEDTBI,X7UTIL.FRMDATHM)', 0, NULL, 'Date d''edition');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('3035', 'frmListeAFFCNT01', 'INT', 'IDTCPRAVN', 12, 
    'Code avant intervention', 'Code avant intervention', 0, 1, 0, 
    'INT.IDTCPRAVN', 0, NULL, 'Code avant intervention');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('3036', 'frmListeAFFCNT01', 'INT', 'DATPOSAVN', 12, 
    'Date d''installation avant intervention', 'Date d''installation avant intervention', 0, 1, 0, 
    'TO_CHAR(INT.DATPOSAVN,X7UTIL.FRMDAT)', 0, NULL, 'Date d''installation avant intervention');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('3037', 'frmListeAFFCNT01', 'INT', 'IDTMODCOU', 12, 
    'Code de la methode de coupure', 'Code de la methode de coupure', 0, 1, 0, 
    'INT.IDTMODCOU', 0, NULL, 'Code de la methode de coupure');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('3038', 'frmListeAFFCNT01', 'INT', 'IND1APR', 12, 
    'Lecture 1 apres intervention', 'Lecture 1 apres intervention', 0, 1, 0, 
    'INT.IND1APR', 0, NULL, 'Lecture 1 apres intervention');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('3039', 'frmListeAFFCNT01', 'INT', 'IDTCPRAPR', 12, 
    'Code apres intervention', 'Code apres intervention', 0, 1, 0, 
    'INT.IDTCPRAPR', 0, NULL, 'Code apres intervention');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('3040', 'frmListeAFFCNT01', 'INT', 'IDTPNTCPG', 12, 
    'Point de comptage', 'Point de comptage', 0, 1, 0, 
    'INT.IDTPNTCPG', 0, NULL, 'Point de comptage');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('3041', 'frmListeAFFCNT01', 'INT', 'IDTSTA', 12, 
    'Code du status', 'Code du status', 0, 1, 0, 
    'INT.IDTSTA', 0, NULL, 'Code du status');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('3042', 'frmListeAFFCNT01', 'INT', 'IND1', 12, 
    'Lecture 1', 'Lecture 1', 0, 1, 0, 
    'INT.IND1', 0, NULL, 'Lecture 1');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('3043', 'frmListeAFFCNT01', 'INT', 'IDTINT', 12, 
    'Numéro', 'Code', 0, 1, 0, 
    'INT.IDTINT', 0, NULL, 'Code');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('3044', 'frmListeAFFCNT01', 'INT', 'IDTMTFINTLIB', 12, 
    'Motif de l''intervention', 'Motif de l''intervention', 0, 1, 0, 
    '(SELECT M1.TypoStd FROM TYPOSTD M1 WHERE M1.IdtTypoStd = INT.IdtMtfInt AND M1.CodTypoStd = ''MTFINT'')', 0, NULL, 'Motif de l''intervention');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('3045', 'frmListeAFFCNT01', 'INT', 'DATEXEPRV', 12, 
    'Prévue le', 'Prevue le', 0, 1, 0, 
    'TO_CHAR(INT.DATEXEPRV,X7UTIL.FRMDATHM)', 0, NULL, 'Prevue le');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('3046', 'frmListeAFFCNT01', 'INT', 'DATDEM', 12, 
    'Date de demande', 'Date de demande', 0, 1, 0, 
    'TO_CHAR(INT.DATDEM,X7UTIL.FRMDATHM)', 0, NULL, 'Date de demande');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('3047', 'frmListeAFFCNT01', 'INT', 'IND1AVN', 12, 
    'Lecture 1 avant intervention', 'Lecture 1 avant intervention', 0, 1, 0, 
    'INT.IND1AVN', 0, NULL, 'Lecture 1 avant intervention');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('3048', 'frmListeAFFCNT01', 'INT', 'DMTPNTCPG', 12, 
    'Diametre du point de comptage', 'Diametre du point de comptage', 0, 1, 0, 
    'INT.DMTPNTCPG', 0, NULL, 'Diametre du point de comptage');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('3049', 'frmListeAFFCNT01', 'INT', 'DATEFFEXE', 12, 
    'Executee le', 'Date de CRI', 0, 1, 0, 
    'TO_CHAR(INT.DATEFFEXE,X7UTIL.FRMDATHM)', 0, NULL, 'Date de CRI');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('3050', 'frmListeAFFCNT01', 'INT', 'MTRAGT', 12, 
    'Agent', 'Agent', 0, 1, 0, 
    'INT.MTRAGT', 0, NULL, 'Agent');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('3051', 'frmListeAFFCNT01', 'CLT', 'IDTCNTOPR', 6, 
    'Centre operationnel', 'Centre operationnel', 0, 1, 0, 
    'CLT.IDTCNTOPR', 0, NULL, 'Centre operationnel');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('3052', 'frmListeAFFCNT01', 'CLT', 'DATMAJ', 7, 
    'Date de mise a jour', 'Date de mise a jour', 0, 1, 0, 
    'TO_CHAR(CLT.DATMAJ,''DD/MM/YYYY'')', 0, NULL, 'Date de mise a jour');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('3053', 'frmListeAFFCNT01', 'CLT', 'C3', 22, 
    'Adaptable field check-box 3', 'Adaptable field check-box 3', 0, 0, 0, 
    'CLT.C3', 0, NULL, 'Adaptable field check-box 3');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('3054', 'frmListeAFFCNT01', 'CLT', 'D4', 7, 
    'Adaptable field date 4', 'Adaptable field date 4', 0, 0, 0, 
    'TO_CHAR(CLT.D4,''DD/MM/YYYY'')', 0, NULL, 'Adaptable field date 4');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('3055', 'frmListeAFFCNT01', 'CLT', 'D5', 7, 
    'Adaptable field date 5', 'Adaptable field date 5', 0, 0, 0, 
    'TO_CHAR(CLT.D5,''DD/MM/YYYY'')', 0, NULL, 'Adaptable field date 5');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('3056', 'frmListeAFFCNT01', 'CLT', 'ADRSTR1', 50, 
    'Description of structured address 1', 'Description of structured address 1', 0, 0, 0, 
    'CLT.ADRSTR1', 0, NULL, 'Description of structured address 1');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('3057', 'frmListeAFFCNT01', 'CLT', 'ADRSTR6', 50, 
    'Description of structured address 6', 'Description of structured address 6', 0, 0, 0, 
    'CLT.ADRSTR6', 0, NULL, 'Description of structured address 6');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('3058', 'frmListeAFFCNT01', 'CLT', 'IDTCLT', 6, 
    'Code', 'Code', 0, 1, 0, 
    'CLT.IDTCLT', 0, NULL, 'Code');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('3059', 'frmListeAFFCNT01', 'CLT', 'ANCRFR', 20, 
    'Ancienne reference', 'Ancienne reference', 0, 1, 0, 
    'CLT.ANCRFR', 0, NULL, 'Ancienne reference');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('3060', 'frmListeAFFCNT01', 'CLT', 'QLTPYR', 2, 
    'Qualite payeur', 'Qualite payeur', 0, 1, 0, 
    'CLT.QLTPYR', 0, NULL, 'Qualite payeur');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('3061', 'frmListeAFFCNT01', 'CLT', 'RTRIPY', 22, 
    'Nombre de retours d''impaye', 'Nombre de retours d''impaye', 0, 1, 0, 
    'CLT.RTRIPY', 0, NULL, 'Nombre de retours d''impaye');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('3062', 'frmListeAFFCNT01', 'CLT', 'IDTT1', 6, 
    'Associated typology ID 1', 'Associated typology ID 1', 0, 0, 0, 
    'CLT.IDTT1', 0, NULL, 'Associated typology ID 1');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('3063', 'frmListeAFFCNT01', 'CLT', 'A2', 40, 
    'Adaptable field string 2', 'Adaptable field string 2', 0, 0, 0, 
    'CLT.A2', 0, NULL, 'Adaptable field string 2');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('3064', 'frmListeAFFCNT01', 'CLT', 'C2', 22, 
    'Adaptable field check-box 2', 'Adaptable field check-box 2', 0, 0, 0, 
    'CLT.C2', 0, NULL, 'Adaptable field check-box 2');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('3065', 'frmListeAFFCNT01', 'CLT', 'ADRSTR9', 254, 
    'Description of structured address 9', 'Description of structured address 9', 0, 0, 0, 
    'CLT.ADRSTR9', 0, NULL, 'Description of structured address 9');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('3066', 'frmListeAFFCNT01', 'CLT', 'IDTQLT', 6, 
    'Qualité client', 'Type of customer ID', 0, 1, 0, 
    'CLT.IDTQLT', 0, NULL, 'Type of customer ID');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('3067', 'frmListeAFFCNT01', 'CLT', 'FLD', 20, 
    'Fax du domicile', 'Fax du domicile', 0, 1, 0, 
    'CLT.FLD', 0, NULL, 'Fax du domicile');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('3068', 'frmListeAFFCNT01', 'CLT', 'ADRLBR', 2000, 
    'Adresse', 'Adresse', 0, 1, 0, 
    'SUBSTR(REPLACE(REPLACE(CLT.ADRLBR,CHR(10),'' ''),CHR(13),'' ''),1,254)', 0, NULL, 'Adresse');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('3069', 'frmListeAFFCNT01', 'CLT', 'INTBNC', 22, 
    'Interdit bancaire', 'Ineligible', 0, 1, 0, 
    'CLT.INTBNC', 0, NULL, 'Ineligible');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('3070', 'frmListeAFFCNT01', 'CLT', 'CHPLIB1', 30, 
    '1st free field', '1st free field', 0, 0, 0, 
    'CLT.CHPLIB1', 0, NULL, '1st free field');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('3071', 'frmListeAFFCNT01', 'CLT', 'T1', 6, 
    'Adaptable field typology 1', 'Adaptable field typology 1', 0, 0, 0, 
    'CLT.T1', 0, NULL, 'Adaptable field typology 1');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('3072', 'frmListeAFFCNT01', 'CLT', 'N3', 22, 
    'Adaptable field number 3', 'Adaptable field number 3', 0, 0, 0, 
    'CLT.N3', 0, NULL, 'Adaptable field number 3');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('3073', 'frmListeAFFCNT01', 'CLT', 'N4', 22, 
    'Adaptable field number 4', 'Adaptable field number 4', 0, 0, 0, 
    'CLT.N4', 0, NULL, 'Adaptable field number 4');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('3074', 'frmListeAFFCNT01', 'CLT', 'D2', 7, 
    'Adaptable field date 2', 'Adaptable field date 2', 0, 0, 0, 
    'TO_CHAR(CLT.D2,''DD/MM/YYYY'')', 0, NULL, 'Adaptable field date 2');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('3075', 'frmListeAFFCNT01', 'CLT', 'ADRSTR2', 50, 
    'Description of structured address 2', 'Description of structured address 2', 0, 0, 0, 
    'CLT.ADRSTR2', 0, NULL, 'Description of structured address 2');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('3076', 'frmListeAFFCNT01', 'CLT', 'SQCCNT', 22, 
    'Contact serial number', 'Contact serial number', 0, 1, 0, 
    'CLT.SQCCNT', 0, NULL, 'Contact serial number');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('3077', 'frmListeAFFCNT01', 'CLT', 'IDTCTR', 10, 
    'Contract ID', 'Contract ID', 0, 1, 0, 
    'CLT.IDTCTR', 0, NULL, 'Contract ID');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('3078', 'frmListeAFFCNT01', 'CLT', 'NUMAVN', 22, 
    'Numéro d''avenant', 'avenant', 0, 1, 0, 
    'CLT.NUMAVN', 0, NULL, 'avenant');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('3079', 'frmListeAFFCNT01', 'CLT', 'FRD', 22, 
    'Fraudeur', 'Fraudeur', 0, 1, 0, 
    'CLT.FRD', 0, NULL, 'Fraudeur');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('3080', 'frmListeAFFCNT01', 'CLT', 'PMTLTG', 22, 
    'Nombre de paiements litigieux', 'Nombre de paiements litigieux', 0, 1, 0, 
    'CLT.PMTLTG', 0, NULL, 'Nombre de paiements litigieux');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('3081', 'frmListeAFFCNT01', 'CLT', 'T2', 6, 
    'Adaptable field typology 2', 'Adaptable field typology 2', 0, 0, 0, 
    'CLT.T2', 0, NULL, 'Adaptable field typology 2');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('3082', 'frmListeAFFCNT01', 'CLT', 'T3', 6, 
    'Adaptable field typology 3', 'Adaptable field typology 3', 0, 0, 0, 
    'CLT.T3', 0, NULL, 'Adaptable field typology 3');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('3083', 'frmListeAFFCNT01', 'CLT', 'T4', 6, 
    'Adaptable field typology 4', 'Adaptable field typology 4', 0, 0, 0, 
    'CLT.T4', 0, NULL, 'Adaptable field typology 4');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('3084', 'frmListeAFFCNT01', 'CLT', 'A1', 40, 
    'Adaptable field string 1', 'Adaptable field string 1', 0, 0, 0, 
    'CLT.A1', 0, NULL, 'Adaptable field string 1');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('3085', 'frmListeAFFCNT01', 'CLT', 'A4', 40, 
    'Adaptable field string 4', 'Adaptable field string 4', 0, 0, 0, 
    'CLT.A4', 0, NULL, 'Adaptable field string 4');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('3086', 'frmListeAFFCNT01', 'CLT', 'ADRSTR5', 50, 
    'Description of structured address 5', 'Description of structured address 5', 0, 0, 0, 
    'CLT.ADRSTR5', 0, NULL, 'Description of structured address 5');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('3087', 'frmListeAFFCNT01', 'CLT', 'ADRSTR8', 50, 
    'Description of structured address 8', 'Description of structured address 8', 0, 0, 0, 
    'CLT.ADRSTR8', 0, NULL, 'Description of structured address 8');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('3088', 'frmListeAFFCNT01', 'CLT', 'TLP', 20, 
    'Telephone portable', 'Telephone portable', 0, 1, 0, 
    'CLT.TLP', 0, NULL, 'Telephone portable');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('3089', 'frmListeAFFCNT01', 'CLT', 'IDTPRMCTR', 10, 
    'Code du premier contrat', 'Code du premier contrat', 0, 1, 0, 
    'CLT.IDTPRMCTR', 0, NULL, 'Code du premier contrat');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('3090', 'frmListeAFFCNT01', 'CLT', 'CHPLIB2', 30, 
    '2nd free field', '2nd free field', 0, 0, 0, 
    'CLT.CHPLIB2', 0, NULL, '2nd free field');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('3091', 'frmListeAFFCNT01', 'CLT', 'T5', 6, 
    'Adaptable field typology 5', 'Adaptable field typology 5', 0, 0, 0, 
    'CLT.T5', 0, NULL, 'Adaptable field typology 5');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('3092', 'frmListeAFFCNT01', 'CLT', 'A3', 40, 
    'Adaptable field string 3', 'Adaptable field string 3', 0, 0, 0, 
    'CLT.A3', 0, NULL, 'Adaptable field string 3');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('3093', 'frmListeAFFCNT01', 'CLT', 'N1', 22, 
    'Adaptable field number 1', 'Adaptable field number 1', 0, 0, 0, 
    'CLT.N1', 0, NULL, 'Adaptable field number 1');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('3094', 'frmListeAFFCNT01', 'CLT', 'N2', 22, 
    'Adaptable field number 2', 'Adaptable field number 2', 0, 0, 0, 
    'CLT.N2', 0, NULL, 'Adaptable field number 2');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('3095', 'frmListeAFFCNT01', 'CLT', 'N5', 22, 
    'Adaptable field number 5', 'Adaptable field number 5', 0, 0, 0, 
    'CLT.N5', 0, NULL, 'Adaptable field number 5');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('3096', 'frmListeAFFCNT01', 'CLT', 'C5', 22, 
    'Adaptable field check-box 5', 'Adaptable field check-box 5', 0, 0, 0, 
    'CLT.C5', 0, NULL, 'Adaptable field check-box 5');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('3097', 'frmListeAFFCNT01', 'CLT', 'D1', 7, 
    'Adaptable field date 1', 'Adaptable field date 1', 0, 0, 0, 
    'TO_CHAR(CLT.D1,''DD/MM/YYYY'')', 0, NULL, 'Adaptable field date 1');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('3098', 'frmListeAFFCNT01', 'CLT', 'ADRSTR7', 50, 
    'Description of structured address 7', 'Description of structured address 7', 0, 0, 0, 
    'CLT.ADRSTR7', 0, NULL, 'Description of structured address 7');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('3099', 'frmListeAFFCNT01', 'CLT', 'CHPLIB5', 254, 
    'Lib 5', 'Lib 5', 0, 0, 0, 
    'CLT.CHPLIB5', 0, NULL, 'Lib 5');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('3100', 'frmListeAFFCNT01', 'CLT', 'IDTCTGCLT', 6, 
    'Categorie de client', 'Categorie de client', 0, 1, 0, 
    'CLT.IDTCTGCLT', 0, NULL, 'Categorie de client');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('3101', 'frmListeAFFCNT01', 'CLT', 'IDTCODSNS', 6, 
    'Sensibilité client', 'Sensibilite client', 0, 1, 0, 
    'CLT.IDTCODSNS', 0, NULL, 'Sensibilite client');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('3102', 'frmListeAFFCNT01', 'CLT', 'PRN', 40, 
    'Prenom', 'Prenom', 0, 1, 0, 
    'CLT.PRN', 0, NULL, 'Prenom');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('3103', 'frmListeAFFCNT01', 'CLT', 'TLB', 20, 
    'Telephone du bureau', 'Telephone du bureau', 0, 1, 0, 
    'CLT.TLB', 0, NULL, 'Telephone du bureau');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('3104', 'frmListeAFFCNT01', 'CLT', 'FLB', 20, 
    'Fax du bureau', 'Fax du bureau', 0, 1, 0, 
    'CLT.FLB', 0, NULL, 'Fax du bureau');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('3105', 'frmListeAFFCNT01', 'CLT', 'RGR', 22, 
    'Client regroupe', 'Client regroupe', 0, 1, 0, 
    'CLT.RGR', 0, NULL, 'Client regroupe');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('3106', 'frmListeAFFCNT01', 'CLT', 'CHPLIB3', 30, 
    '3rd free field', '3rd free field', 0, 0, 0, 
    'CLT.CHPLIB3', 0, NULL, '3rd free field');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('3107', 'frmListeAFFCNT01', 'CLT', 'IDTT3', 6, 
    'Associated typology ID 3', 'Associated typology ID 3', 0, 0, 0, 
    'CLT.IDTT3', 0, NULL, 'Associated typology ID 3');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('3108', 'frmListeAFFCNT01', 'CLT', 'C1', 22, 
    'Adaptable field check-box 1', 'Adaptable field check-box 1', 0, 0, 0, 
    'CLT.C1', 0, NULL, 'Adaptable field check-box 1');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('3109', 'frmListeAFFCNT01', 'CLT', 'ADRSTR10', 50, 
    'Description of structured address 10', 'Description of structured address 10', 0, 0, 0, 
    'CLT.ADRSTR10', 0, NULL, 'Description of structured address 10');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('3110', 'frmListeAFFCNT01', 'CLT', 'SQCCPTCLT', 22, 
    'Customer account serial number', 'Customer account serial number', 0, 1, 0, 
    'CLT.SQCCPTCLT', 0, NULL, 'Customer account serial number');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('3554', 'frmListeAFFAFF01', 'PNTCPG', 'T4', 6, 
    'Adaptable field typologie 4', 'Adaptable field typologie 4', 0, 0, 0, 
    'PNTCPG.T4', 0, NULL, 'Adaptable field typologie 4');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('3555', 'frmListeAFFAFF01', 'PNTCPG', 'C2', 22, 
    'Adaptable field check-box 2', 'Adaptable field check-box 2', 0, 0, 0, 
    'PNTCPG.C2', 0, NULL, 'Adaptable field check-box 2');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('3556', 'frmListeAFFAFF01', 'PNTCPG', 'IDTTRNTYP', 6, 
    'Standard round ID', 'Tournee type', 0, 1, 0, 
    'PNTCPG.IDTTRNTYP', 0, NULL, 'Tournee type');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('3557', 'frmListeAFFAFF01', 'PNTCPG', 'MTRAGT', 6, 
    'ID of the employee who carries out updating', 'ID of the employee who carries out updating', 0, 1, 0, 
    'PNTCPG.MTRAGT', 0, NULL, 'ID of the employee who carries out updating');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('3558', 'frmListeAFFAFF01', 'PNTCPG', 'ANCRFR', 20, 
    'Ancienne reference', 'Ancienne reference', 0, 1, 0, 
    'PNTCPG.ANCRFR', 0, NULL, 'Ancienne reference');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('3559', 'frmListeAFFAFF01', 'PNTCPG', 'ADRSTR8', 50, 
    'Description of structured address 8', 'Description of structured address 8', 0, 0, 0, 
    'PNTCPG.ADRSTR8', 0, NULL, 'Description of structured address 8');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('3560', 'frmListeAFFAFF01', 'PNTCPG', 'ADRSTR10', 50, 
    'Description of structured address 10', 'Description of structured address 10', 0, 0, 0, 
    'PNTCPG.ADRSTR10', 0, NULL, 'Description of structured address 10');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('3561', 'frmListeAFFAFF01', 'PNTCPG', 'IDTSIG', 22, 
    'Code SIG', 'Code SIG', 0, 1, 0, 
    'PNTCPG.IDTSIG', 0, NULL, 'Code SIG');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('3562', 'frmListeAFFAFF01', 'PNTCPG', 'DMT', 22, 
    'Diamètre', 'Diametre', 0, 1, 0, 
    'PNTCPG.DMT', 0, NULL, 'Diametre');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('3563', 'frmListeAFFAFF01', 'PNTCPG', 'ADRLBR', 254, 
    'Adresse', 'Adresse', 0, 1, 0, 
    'SUBSTR(REPLACE(REPLACE(PNTCPG.ADRLBR,CHR(10),'' ''),CHR(13),'' ''),1,254)', 0, NULL, 'Adresse');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('3564', 'frmListeAFFAFF01', 'PNTCPG', 'IDTUNTMSRDMT', 22, 
    'Diameter unit of measure ID', 'Diameter unit of measure ID', 0, 1, 0, 
    'PNTCPG.IDTUNTMSRDMT', 0, NULL, 'Diameter unit of measure ID');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('3565', 'frmListeAFFAFF01', 'PNTCPG', 'IDTSQCGNR', 22, 
    'General sequence ID', 'General sequence ID', 0, 0, 0, 
    'PNTCPG.IDTSQCGNR', 0, NULL, 'General sequence ID');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('3566', 'frmListeAFFAFF01', 'PNTCPG', 'IDTTYPCPG', 22, 
    'Type de métrage', 'Type de métrage', 0, 1, 0, 
    'PNTCPG.IDTTYPCPG', 0, NULL, 'Type de métrage');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('3567', 'frmListeAFFAFF01', 'PNTCPG', 'T1', 6, 
    'Adaptable field typologie 1', 'Adaptable field typologie 1', 0, 0, 0, 
    'PNTCPG.T1', 0, NULL, 'Adaptable field typologie 1');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('3568', 'frmListeAFFAFF01', 'PNTCPG', 'T2', 6, 
    'Adaptable field typologie 2', 'Adaptable field typologie 2', 0, 0, 0, 
    'PNTCPG.T2', 0, NULL, 'Adaptable field typologie 2');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('3569', 'frmListeAFFAFF01', 'PNTCPG', 'A1', 40, 
    'Adaptable field string 1', 'Adaptable field string 1', 0, 0, 0, 
    'PNTCPG.A1', 0, NULL, 'Adaptable field string 1');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('3570', 'frmListeAFFAFF01', 'PNTCPG', 'C1', 22, 
    'Adaptable field check-box 1', 'Adaptable field check-box 1', 0, 0, 0, 
    'PNTCPG.C1', 0, NULL, 'Adaptable field check-box 1');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('3571', 'frmListeAFFAFF01', 'PNTCPG', 'ADRSTR1', 50, 
    'Description of structured address 1', 'Description of structured address 1', 0, 0, 0, 
    'PNTCPG.ADRSTR1', 0, NULL, 'Description of structured address 1');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('3572', 'frmListeAFFAFF01', 'PNTCPG', 'ADRSTR3', 50, 
    'Description of structured address 3', 'Description of structured address 3', 0, 0, 0, 
    'PNTCPG.ADRSTR3', 0, NULL, 'Description of structured address 3');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('3573', 'frmListeAFFAFF01', 'PNTCPG', 'CLBMINDSJ', 22, 
    'Minimum calibre circuit breaker', 'Minimum calibre circuit breaker', 0, 0, 0, 
    'PNTCPG.CLBMINDSJ', 0, NULL, 'Minimum calibre circuit breaker');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('3574', 'frmListeAFFAFF01', 'PNTCPG', 'DATRMS', 7, 
    'Date de retablissement', 'Date de retablissement', 0, 1, 0, 
    'TO_CHAR(PNTCPG.DATRMS,''DD/MM/YYYY'')', 0, NULL, 'Date de retablissement');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('3575', 'frmListeAFFAFF01', 'PNTCPG', 'N1', 22, 
    'Adaptable field number 1', 'Adaptable field number 1', 0, 0, 0, 
    'PNTCPG.N1', 0, NULL, 'Adaptable field number 1');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('3576', 'frmListeAFFAFF01', 'PNTCPG', 'NUMENQ', 22, 
    'numéro recensement', 'numéro recensement', 0, 1, 0, 
    'PNTCPG.NUMENQ', 0, NULL, 'numéro recensement');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('3577', 'frmListeAFFAFF01', 'PNTCPG', 'CLBMAXDSJ', 22, 
    'Maximum calibre of circuit breaker', 'Maximum calibre of circuit breaker', 0, 0, 0, 
    'PNTCPG.CLBMAXDSJ', 0, NULL, 'Maximum calibre of circuit breaker');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('3578', 'frmListeAFFAFF01', 'PNTCPG', 'NBRCND', 22, 
    'Number of conductors', 'Number of conductors', 0, 0, 0, 
    'PNTCPG.NBRCND', 0, NULL, 'Number of conductors');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('3579', 'frmListeAFFAFF01', 'PNTCPG', 'DATCOU', 7, 
    'Date de coupure', 'Date de coupure', 0, 1, 0, 
    'TO_CHAR(PNTCPG.DATCOU,''DD/MM/YYYY'')', 0, NULL, 'Date de coupure');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('3580', 'frmListeAFFAFF01', 'PNTCPG', 'IDTT1', 6, 
    'Associated typology ID 1', 'Associated typology ID 1', 0, 0, 0, 
    'PNTCPG.IDTT1', 0, NULL, 'Associated typology ID 1');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('3581', 'frmListeAFFAFF01', 'PNTCPG', 'A4', 40, 
    'Adaptable field string 4', 'Adaptable field string 4', 0, 0, 0, 
    'PNTCPG.A4', 0, NULL, 'Adaptable field string 4');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('3582', 'frmListeAFFAFF01', 'PNTCPG', 'A5', 40, 
    'Adaptable field string 5', 'Adaptable field string 5', 0, 0, 0, 
    'PNTCPG.A5', 0, NULL, 'Adaptable field string 5');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('3583', 'frmListeAFFAFF01', 'PNTCPG', 'N5', 22, 
    'Adaptable field number 5', 'Adaptable field number 5', 0, 0, 0, 
    'PNTCPG.N5', 0, NULL, 'Adaptable field number 5');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('3584', 'frmListeAFFAFF01', 'PNTCPG', 'C4', 22, 
    'Adaptable field check-box 4', 'Adaptable field check-box 4', 0, 0, 0, 
    'PNTCPG.C4', 0, NULL, 'Adaptable field check-box 4');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('3585', 'frmListeAFFAFF01', 'PNTCPG', 'D4', 7, 
    'Adaptable field check-box 4', 'Adaptable field check-box 4', 0, 0, 0, 
    'TO_CHAR(PNTCPG.D4,''DD/MM/YYYY'')', 0, NULL, 'Adaptable field check-box 4');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('3586', 'frmListeAFFAFF01', 'PNTCPG', 'ADRSTR2', 50, 
    'Description of structured address 2', 'Description of structured address 2', 0, 0, 0, 
    'PNTCPG.ADRSTR2', 0, NULL, 'Description of structured address 2');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('3587', 'frmListeAFFAFF01', 'PNTCPG', 'ADRSTR4', 50, 
    'Description of structured address 4', 'Description of structured address 4', 0, 0, 0, 
    'PNTCPG.ADRSTR4', 0, NULL, 'Description of structured address 4');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('3588', 'frmListeAFFAFF01', 'PNTCPG', 'IDTCLTPRP', 6, 
    'Code client propriétaire', 'Code client propriétaire', 0, 1, 0, 
    'PNTCPG.IDTCLTPRP', 0, NULL, 'Code client propriétaire');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('3589', 'frmListeAFFAFF01', 'PNTCPG', 'RGLDSJ', 22, 
    'Circuit breaker setting', 'Circuit breaker setting', 0, 1, 0, 
    'PNTCPG.RGLDSJ', 0, NULL, 'Circuit breaker setting');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('3590', 'frmListeAFFAFF01', 'PNTCPG', 'T5', 6, 
    'Adaptable field typologie 5', 'Adaptable field typologie 5', 0, 0, 0, 
    'PNTCPG.T5', 0, NULL, 'Adaptable field typologie 5');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('3591', 'frmListeAFFAFF01', 'PNTCPG', 'IDTPNTLVR', 22, 
    'Delivery point ID', 'Delivery point ID', 0, 1, 0, 
    'PNTCPG.IDTPNTLVR', 0, NULL, 'Delivery point ID');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('3592', 'frmListeAFFAFF01', 'PNTCPG', 'IDTCNTOPR', 6, 
    'Operational center ID', 'Operational center ID', 0, 1, 0, 
    'PNTCPG.IDTCNTOPR', 0, NULL, 'Operational center ID');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('3593', 'frmListeAFFAFF01', 'PNTCPG', 'D2', 7, 
    'Adaptable field check-box 2', 'Adaptable field check-box 2', 0, 0, 0, 
    'TO_CHAR(PNTCPG.D2,''DD/MM/YYYY'')', 0, NULL, 'Adaptable field check-box 2');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('3594', 'frmListeAFFAFF01', 'PNTCPG', 'D5', 7, 
    'Adaptable field check-box 5', 'Adaptable field check-box 5', 0, 0, 0, 
    'TO_CHAR(PNTCPG.D5,''DD/MM/YYYY'')', 0, NULL, 'Adaptable field check-box 5');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('3595', 'frmListeAFFAFF01', 'PNTLVR', 'IdtCntOpr', 10, 
    'CO', 'CO', 0, 1, 0, 
    'PNTLVR.IdtCntOpr', 0, NULL, 'CO');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('3596', 'frmListeAFFAFF01', 'PNTLVR', 'ADRSTR9', 50, 
    'Description of structured address 9', 'Description of structured address 9', 0, 0, 0, 
    'PNTLVR.ADRSTR9', 0, NULL, 'Description of structured address 9');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('3597', 'frmListeAFFAFF01', 'PNTLVR', 'ADRSTR5', 50, 
    'Description of structured address 5', 'Description of structured address 5', 0, 0, 0, 
    'PNTLVR.ADRSTR5', 0, NULL, 'Description of structured address 5');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('3598', 'frmListeAFFAFF01', 'PNTLVR', 'N3', 22, 
    'Adaptable field number13', 'Adaptable field number13', 0, 0, 0, 
    'PNTLVR.N3', 0, NULL, 'Adaptable field number13');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('3599', 'frmListeAFFAFF01', 'PNTLVR', 'D5', 7, 
    'Adaptable field date 5', 'Adaptable field date 5', 0, 0, 0, 
    'TO_CHAR(PNTLVR.D5,''DD/MM/YYYY'')', 0, NULL, 'Adaptable field date 5');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('3600', 'frmListeAFFAFF01', 'PNTLVR', 'SQCPNTCPG', 22, 
    'Metering point last used serial number', 'Metering point last used serial number', 0, 1, 0, 
    'PNTLVR.SQCPNTCPG', 0, NULL, 'Metering point last used serial number');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('3601', 'frmListeAFFAFF01', 'PNTLVR', 'CODGEO4', 4, 
    'Code géographique 4', 'Code du niveau 4', 0, 1, 0, 
    'PNTLVR.CODGEO4', 0, NULL, 'Code du niveau 4');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('3602', 'frmListeAFFAFF01', 'PNTLVR', 'C3', 22, 
    'Adaptable field check-box 3', 'Adaptable field check-box 3', 0, 0, 0, 
    'PNTLVR.C3', 0, NULL, 'Adaptable field check-box 3');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('3603', 'frmListeAFFAFF01', 'PNTLVR', 'IDTT2', 6, 
    'Associated typology ID 2', 'Associated typology ID 2', 0, 0, 0, 
    'PNTLVR.IDTT2', 0, NULL, 'Associated typology ID 2');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('3604', 'frmListeAFFAFF01', 'PNTLVR', 'IDTT4', 6, 
    'Associated typology ID 4', 'Associated typology ID 4', 0, 0, 0, 
    'PNTLVR.IDTT4', 0, NULL, 'Associated typology ID 4');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('3605', 'frmListeAFFAFF01', 'PNTLVR', 'N1', 22, 
    'Adaptable field number1', 'Adaptable field number1', 0, 0, 0, 
    'PNTLVR.N1', 0, NULL, 'Adaptable field number1');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('3606', 'frmListeAFFAFF01', 'PNTLVR', 'ANCRFR', 20, 
    'Former reference', 'Ancienne reference', 0, 1, 0, 
    'PNTLVR.ANCRFR', 0, NULL, 'Ancienne reference');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('3607', 'frmListeAFFAFF01', 'PNTLVR', 'N4', 22, 
    'Adaptable field number 4', 'Adaptable field number 4', 0, 0, 0, 
    'PNTLVR.N4', 0, NULL, 'Adaptable field number 4');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('3608', 'frmListeAFFAFF01', 'PNTLVR', 'ADRLBR', 2000, 
    'Adresse', 'Adresse', 0, 1, 0, 
    'SUBSTR(REPLACE(REPLACE(PNTLVR.ADRLBR,CHR(10),'' ''),CHR(13),'' ''),1,254)', 0, NULL, 'Adresse');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('3609', 'frmListeAFFAFF01', 'PNTLVR', 'T1', 6, 
    'Adaptable field typologie 1', 'Adaptable field typologie 1', 0, 0, 0, 
    'PNTLVR.T1', 0, NULL, 'Adaptable field typologie 1');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('3610', 'frmListeAFFAFF01', 'PNTLVR', 'IDTT5', 6, 
    'Associated typology ID 5', 'Associated typology ID 5', 0, 0, 0, 
    'PNTLVR.IDTT5', 0, NULL, 'Associated typology ID 5');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('3611', 'frmListeAFFAFF01', 'PNTLVR', 'ADRSTR2', 50, 
    'Description of structured address 2', 'Description of structured address 2', 0, 0, 0, 
    'PNTLVR.ADRSTR2', 0, NULL, 'Description of structured address 2');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('3612', 'frmListeAFFAFF01', 'PNTLVR', 'CODGEO2', 4, 
    'Code géographique 2', 'Code du niveau 2', 0, 1, 0, 
    'PNTLVR.CODGEO2', 0, NULL, 'Code du niveau 2');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('3613', 'frmListeAFFAFF01', 'PNTLVR', 'A1', 40, 
    'Adaptable field string 1', 'Adaptable field string 1', 0, 0, 0, 
    'PNTLVR.A1', 0, NULL, 'Adaptable field string 1');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('3679', 'frmListeAFFACT01', 'CLT', 'ADRSTR1', 50, 
    'Description of structured address 1', 'Description of structured address 1', 0, 0, 0, 
    'CLT.ADRSTR1', 0, NULL, 'Description of structured address 1');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('3680', 'frmListeAFFACT01', 'CLT', 'ADRSTR8', 50, 
    'Description of structured address 8', 'Description of structured address 8', 0, 0, 0, 
    'CLT.ADRSTR8', 0, NULL, 'Description of structured address 8');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('3681', 'frmListeAFFACT01', 'CLT', 'MAIL', 40, 
    'Messagerie electronique', 'Messagerie electronique', 0, 1, 0, 
    'CLT.MAIL', 0, NULL, 'Messagerie electronique');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('3682', 'frmListeAFFACT01', 'CLT', 'SQCCPTCLT', 22, 
    'Customer account serial number', 'Customer account serial number', 0, 1, 0, 
    'CLT.SQCCPTCLT', 0, NULL, 'Customer account serial number');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('3683', 'frmListeAFFACT01', 'CLT', 'IDTCTGCLT', 6, 
    'Categorie de client', 'Categorie de client', 0, 1, 0, 
    'CLT.IDTCTGCLT', 0, NULL, 'Categorie de client');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('3684', 'frmListeAFFACT01', 'CLT', 'IDTCODSNS', 6, 
    'Sensibilité client', 'Sensibilite client', 0, 1, 0, 
    'CLT.IDTCODSNS', 0, NULL, 'Sensibilite client');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('3685', 'frmListeAFFACT01', 'CLT', 'NOM', 40, 
    'Nom', 'Nom', 0, 1, 0, 
    'CLT.NOM', 0, NULL, 'Nom');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('3686', 'frmListeAFFACT01', 'CLT', 'IDTT1', 6, 
    'Associated typology ID 1', 'Associated typology ID 1', 0, 0, 0, 
    'CLT.IDTT1', 0, NULL, 'Associated typology ID 1');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('3687', 'frmListeAFFACT01', 'CLT', 'T2', 6, 
    'Adaptable field typology 2', 'Adaptable field typology 2', 0, 0, 0, 
    'CLT.T2', 0, NULL, 'Adaptable field typology 2');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('3688', 'frmListeAFFACT01', 'CLT', 'A2', 40, 
    'Adaptable field string 2', 'Adaptable field string 2', 0, 0, 0, 
    'CLT.A2', 0, NULL, 'Adaptable field string 2');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('3689', 'frmListeAFFACT01', 'CLT', 'A3', 40, 
    'Adaptable field string 3', 'Adaptable field string 3', 0, 0, 0, 
    'CLT.A3', 0, NULL, 'Adaptable field string 3');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('3690', 'frmListeAFFACT01', 'CLT', 'ADRSTR5', 50, 
    'Description of structured address 5', 'Description of structured address 5', 0, 0, 0, 
    'CLT.ADRSTR5', 0, NULL, 'Description of structured address 5');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('3691', 'frmListeAFFACT01', 'CLT', 'ADRSTR7', 50, 
    'Description of structured address 7', 'Description of structured address 7', 0, 0, 0, 
    'CLT.ADRSTR7', 0, NULL, 'Description of structured address 7');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('3692', 'frmListeAFFACT01', 'CLT', 'ADRSTR9', 254, 
    'Description of structured address 9', 'Description of structured address 9', 0, 0, 0, 
    'CLT.ADRSTR9', 0, NULL, 'Description of structured address 9');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('3693', 'frmListeAFFACT01', 'CLT', 'ADRSTR10', 50, 
    'Description of structured address 10', 'Description of structured address 10', 0, 0, 0, 
    'CLT.ADRSTR10', 0, NULL, 'Description of structured address 10');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('3694', 'frmListeAFFACT01', 'CLT', 'CHPLIB5', 254, 
    'Lib 5', 'Lib 5', 0, 0, 0, 
    'CLT.CHPLIB5', 0, NULL, 'Lib 5');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('3695', 'frmListeAFFACT01', 'CLT', 'DATMAJ', 7, 
    'Date de mise a jour', 'Date de mise a jour', 0, 1, 0, 
    'TO_CHAR(CLT.DATMAJ,''DD/MM/YYYY'')', 0, NULL, 'Date de mise a jour');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('3696', 'frmListeAFFACT01', 'CLT', 'QLTPYR', 2, 
    'Qualite payeur', 'Qualite payeur', 0, 1, 0, 
    'CLT.QLTPYR', 0, NULL, 'Qualite payeur');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('3697', 'frmListeAFFACT01', 'CLT', 'IDTPRMCTR', 10, 
    'Code du premier contrat', 'Code du premier contrat', 0, 1, 0, 
    'CLT.IDTPRMCTR', 0, NULL, 'Code du premier contrat');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('3698', 'frmListeAFFACT01', 'CLT', 'CHPLIB1', 30, 
    '1st free field', '1st free field', 0, 0, 0, 
    'CLT.CHPLIB1', 0, NULL, '1st free field');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('3699', 'frmListeAFFACT01', 'CLT', 'CHPLIB4', 30, 
    '4th free field', '4th free field', 0, 0, 0, 
    'CLT.CHPLIB4', 0, NULL, '4th free field');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('3700', 'frmListeAFFACT01', 'CLT', 'N2', 22, 
    'Adaptable field number 2', 'Adaptable field number 2', 0, 0, 0, 
    'CLT.N2', 0, NULL, 'Adaptable field number 2');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('3701', 'frmListeAFFACT01', 'CLT', 'N4', 22, 
    'Adaptable field number 4', 'Adaptable field number 4', 0, 0, 0, 
    'CLT.N4', 0, NULL, 'Adaptable field number 4');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('3702', 'frmListeAFFACT01', 'CLT', 'C1', 22, 
    'Adaptable field check-box 1', 'Adaptable field check-box 1', 0, 0, 0, 
    'CLT.C1', 0, NULL, 'Adaptable field check-box 1');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('3703', 'frmListeAFFACT01', 'CLT', 'D1', 7, 
    'Adaptable field date 1', 'Adaptable field date 1', 0, 0, 0, 
    'TO_CHAR(CLT.D1,''DD/MM/YYYY'')', 0, NULL, 'Adaptable field date 1');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('3704', 'frmListeAFFACT01', 'CLT', 'IDTQLT', 6, 
    'Qualité client', 'Type of customer ID', 0, 1, 0, 
    'CLT.IDTQLT', 0, NULL, 'Type of customer ID');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('3705', 'frmListeAFFACT01', 'CLT', 'PRN', 40, 
    'Prenom', 'Prenom', 0, 1, 0, 
    'CLT.PRN', 0, NULL, 'Prenom');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('3706', 'frmListeAFFACT01', 'CLT', 'TLD', 20, 
    'Telephone du domicile', 'Telephone du domicile', 0, 1, 0, 
    'CLT.TLD', 0, NULL, 'Telephone du domicile');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('3707', 'frmListeAFFACT01', 'CLT', 'PMTLTG', 22, 
    'Nombre de paiements litigieux', 'Nombre de paiements litigieux', 0, 1, 0, 
    'CLT.PMTLTG', 0, NULL, 'Nombre de paiements litigieux');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('3708', 'frmListeAFFACT01', 'CLT', 'INTBNC', 22, 
    'Interdit bancaire', 'Ineligible', 0, 1, 0, 
    'CLT.INTBNC', 0, NULL, 'Ineligible');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('3709', 'frmListeAFFACT01', 'CLT', 'CHPLIB3', 30, 
    '3rd free field', '3rd free field', 0, 0, 0, 
    'CLT.CHPLIB3', 0, NULL, '3rd free field');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('3710', 'frmListeAFFACT01', 'CLT', 'IDTSQCGNR', 22, 
    'General identifier', 'General identifier', 0, 0, 0, 
    'CLT.IDTSQCGNR', 0, NULL, 'General identifier');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('3711', 'frmListeAFFACT01', 'CLT', 'T4', 6, 
    'Adaptable field typology 4', 'Adaptable field typology 4', 0, 0, 0, 
    'CLT.T4', 0, NULL, 'Adaptable field typology 4');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('3712', 'frmListeAFFACT01', 'CLT', 'IDTT4', 6, 
    'Associated typology ID 4', 'Associated typology ID 4', 0, 0, 0, 
    'CLT.IDTT4', 0, NULL, 'Associated typology ID 4');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('3713', 'frmListeAFFACT01', 'CLT', 'IDTT5', 6, 
    'Associated typology ID 5', 'Associated typology ID 5', 0, 0, 0, 
    'CLT.IDTT5', 0, NULL, 'Associated typology ID 5');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('3714', 'frmListeAFFACT01', 'CLT', 'N5', 22, 
    'Adaptable field number 5', 'Adaptable field number 5', 0, 0, 0, 
    'CLT.N5', 0, NULL, 'Adaptable field number 5');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('3715', 'frmListeAFFACT01', 'CLT', 'C4', 22, 
    'Adaptable field check-box 4', 'Adaptable field check-box 4', 0, 0, 0, 
    'CLT.C4', 0, NULL, 'Adaptable field check-box 4');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('3716', 'frmListeAFFACT01', 'CLT', 'IDTCTR', 10, 
    'Contract ID', 'Contract ID', 0, 1, 0, 
    'CLT.IDTCTR', 0, NULL, 'Contract ID');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('3717', 'frmListeAFFACT01', 'CLT', 'AVT_NUMAVN', 22, 
    'NOT USED!!!', 'NOT USED!!!', 0, 0, 0, 
    'CLT.AVT_NUMAVN', 0, NULL, 'NOT USED!!!');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('3718', 'frmListeAFFACT01', 'CLT', 'FLB', 20, 
    'Fax du bureau', 'Fax du bureau', 0, 1, 0, 
    'CLT.FLB', 0, NULL, 'Fax du bureau');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('3719', 'frmListeAFFACT01', 'CLT', 'RTRIPY', 22, 
    'Nombre de retours d''impaye', 'Nombre de retours d''impaye', 0, 1, 0, 
    'CLT.RTRIPY', 0, NULL, 'Nombre de retours d''impaye');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('3720', 'frmListeAFFACT01', 'CLT', 'T1', 6, 
    'Adaptable field typology 1', 'Adaptable field typology 1', 0, 0, 0, 
    'CLT.T1', 0, NULL, 'Adaptable field typology 1');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('3721', 'frmListeAFFACT01', 'CLT', 'A1', 40, 
    'Adaptable field string 1', 'Adaptable field string 1', 0, 0, 0, 
    'CLT.A1', 0, NULL, 'Adaptable field string 1');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('3722', 'frmListeAFFACT01', 'CLT', 'ADRSTR2', 50, 
    'Description of structured address 2', 'Description of structured address 2', 0, 0, 0, 
    'CLT.ADRSTR2', 0, NULL, 'Description of structured address 2');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('3723', 'frmListeAFFACT01', 'CLT', 'IDTCLT', 6, 
    'Nombre de contrat', 'Code', 0, 1, 0, 
    '(SELECT COUNT(*) FROM CTR WHERE CTR.IDTCLTDST = CLT.IDTCLT)', 0, NULL, 'Code');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('3724', 'frmListeAFFACT01', 'CLT', 'TLP', 20, 
    'Telephone portable', 'Telephone portable', 0, 1, 0, 
    'CLT.TLP', 0, NULL, 'Telephone portable');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('3725', 'frmListeAFFACT01', 'CLT', 'NUMAVN', 22, 
    'Numéro d''avenant', 'avenant', 0, 1, 0, 
    'CLT.NUMAVN', 0, NULL, 'avenant');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('3726', 'frmListeAFFACT01', 'CLT', 'AVT_IDTCTR', 10, 
    'NOT USED !!!', 'NOT USED !!!', 0, 0, 0, 
    'CLT.AVT_IDTCTR', 0, NULL, 'NOT USED !!!');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('3727', 'frmListeAFFACT01', 'CLT', 'TLB', 20, 
    'Telephone du bureau', 'Telephone du bureau', 0, 1, 0, 
    'CLT.TLB', 0, NULL, 'Telephone du bureau');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('3728', 'frmListeAFFACT01', 'CLT', 'FRD', 22, 
    'Fraudeur', 'Fraudeur', 0, 1, 0, 
    'CLT.FRD', 0, NULL, 'Fraudeur');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('3729', 'frmListeAFFACT01', 'CLT', 'ADRLBR', 2000, 
    'Adresse', 'Adresse', 0, 1, 0, 
    'SUBSTR(REPLACE(REPLACE(CLT.ADRLBR,CHR(10),'' ''),CHR(13),'' ''),1,254)', 0, NULL, 'Adresse');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('3730', 'frmListeAFFACT01', 'CLT', 'RGR', 22, 
    'Client regroupe', 'Client regroupe', 0, 1, 0, 
    'CLT.RGR', 0, NULL, 'Client regroupe');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('3731', 'frmListeAFFACT01', 'CLT', 'CHPLIB2', 30, 
    '2nd free field', '2nd free field', 0, 0, 0, 
    'CLT.CHPLIB2', 0, NULL, '2nd free field');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('3732', 'frmListeAFFACT01', 'CLT', 'C3', 22, 
    'Adaptable field check-box 3', 'Adaptable field check-box 3', 0, 0, 0, 
    'CLT.C3', 0, NULL, 'Adaptable field check-box 3');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('3733', 'frmListeAFFACT01', 'CLT', 'C5', 22, 
    'Adaptable field check-box 5', 'Adaptable field check-box 5', 0, 0, 0, 
    'CLT.C5', 0, NULL, 'Adaptable field check-box 5');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('3734', 'frmListeAFFACT01', 'CLT', 'D4', 7, 
    'Adaptable field date 4', 'Adaptable field date 4', 0, 0, 0, 
    'TO_CHAR(CLT.D4,''DD/MM/YYYY'')', 0, NULL, 'Adaptable field date 4');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('3735', 'frmListeAFFACT01', 'CLT', 'ADRSTR3', 50, 
    'Description of structured address 3', 'Description of structured address 3', 0, 0, 0, 
    'CLT.ADRSTR3', 0, NULL, 'Description of structured address 3');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('3736', 'frmListeAFFACT01', 'CLT', 'ADRSTR6', 50, 
    'Description of structured address 6', 'Description of structured address 6', 0, 0, 0, 
    'CLT.ADRSTR6', 0, NULL, 'Description of structured address 6');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('3737', 'frmListeAFFACT01', 'CLT', 'SQCCNT', 22, 
    'Contact serial number', 'Contact serial number', 0, 1, 0, 
    'CLT.SQCCNT', 0, NULL, 'Contact serial number');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('3738', 'frmListeAFFACT01', 'CLT', 'IDTCLT', 6, 
    'Code', 'Code', 0, 1, 0, 
    'CLT.IDTCLT', 0, NULL, 'Code');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('3739', 'frmListeAFFACT01', 'CLT', 'FLD', 20, 
    'Fax du domicile', 'Fax du domicile', 0, 1, 0, 
    'CLT.FLD', 0, NULL, 'Fax du domicile');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('3740', 'frmListeAFFACT01', 'CLT', 'T3', 6, 
    'Adaptable field typology 3', 'Adaptable field typology 3', 0, 0, 0, 
    'CLT.T3', 0, NULL, 'Adaptable field typology 3');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('3741', 'frmListeAFFACT01', 'CLT', 'T5', 6, 
    'Adaptable field typology 5', 'Adaptable field typology 5', 0, 0, 0, 
    'CLT.T5', 0, NULL, 'Adaptable field typology 5');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('3742', 'frmListeAFFACT01', 'CLT', 'N1', 22, 
    'Adaptable field number 1', 'Adaptable field number 1', 0, 0, 0, 
    'CLT.N1', 0, NULL, 'Adaptable field number 1');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('3743', 'frmListeAFFACT01', 'CLT', 'ADRSTR4', 50, 
    'Description of structured address 4', 'Description of structured address 4', 0, 0, 0, 
    'CLT.ADRSTR4', 0, NULL, 'Description of structured address 4');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('3744', 'frmListeAFFACT01', 'CLT', 'X7SNDXNOM', 40, 
    'Fonction de recherche pour Nom', 'Fonction de recherche pour Nom', 0, 0, 0, 
    'CLT.X7SNDXNOM', 0, NULL, 'Fonction de recherche pour Nom');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('3745', 'frmListeAFFACT01', 'CPR', 'DATETL', 7, 
    'Date d''etalonnage', 'Date d''etalonnage', 0, 1, 0, 
    'TO_CHAR(CPR.DATETL,''DD/MM/YYYY'')', 0, NULL, 'Date d''etalonnage');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('3746', 'frmListeAFFACT01', 'CPR', 'IDTT4', 6, 
    'Associated typology ID 4', 'Associated typology ID 4', 0, 0, 0, 
    'CPR.IDTT4', 0, NULL, 'Associated typology ID 4');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('3747', 'frmListeAFFACT01', 'CPR', 'A2', 40, 
    'Adaptable field string 2', 'Adaptable field string 2', 0, 0, 0, 
    'CPR.A2', 0, NULL, 'Adaptable field string 2');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('3748', 'frmListeAFFACT01', 'CPR', 'NUMCPR', 20, 
    'Numero', 'Numero', 0, 1, 0, 
    'CPR.NUMCPR', 0, NULL, 'Numero');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('3749', 'frmListeAFFACT01', 'CPR', 'N1', 22, 
    'Adaptable field number 1', 'Adaptable field number 1', 0, 0, 0, 
    'CPR.N1', 0, NULL, 'Adaptable field number 1');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('3750', 'frmListeAFFACT01', 'CPR', 'C1', 22, 
    'Adaptable field check-box 1', 'Adaptable field check-box 1', 0, 0, 0, 
    'CPR.C1', 0, NULL, 'Adaptable field check-box 1');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('3751', 'frmListeAFFACT01', 'CPR', 'C4', 22, 
    'Adaptable field check-box 4', 'Adaptable field check-box 4', 0, 0, 0, 
    'CPR.C4', 0, NULL, 'Adaptable field check-box 4');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('3752', 'frmListeAFFACT01', 'CPR', 'D4', 7, 
    'Adaptable field date 4', 'Adaptable field date 4', 0, 0, 0, 
    'TO_CHAR(CPR.D4,''DD/MM/YYYY'')', 0, NULL, 'Adaptable field date 4');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('3753', 'frmListeAFFACT01', 'CPR', 'DATGRN', 7, 
    'Date de garantie', 'Date de garantie', 0, 1, 0, 
    'TO_CHAR(CPR.DATGRN,''DD/MM/YYYY'')', 0, NULL, 'Date de garantie');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('3754', 'frmListeAFFACT01', 'CPR', 'T4', 6, 
    'Adaptable field typology 4', 'Adaptable field typology 4', 0, 0, 0, 
    'CPR.T4', 0, NULL, 'Adaptable field typology 4');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('3755', 'frmListeAFFACT01', 'CPR', 'A1', 40, 
    'Adaptable field string 1', 'Adaptable field string 1', 0, 0, 0, 
    'CPR.A1', 0, NULL, 'Adaptable field string 1');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('3756', 'frmListeAFFACT01', 'CPR', 'A5', 40, 
    'Adaptable field string 5', 'Adaptable field string 5', 0, 0, 0, 
    'CPR.A5', 0, NULL, 'Adaptable field string 5');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('3757', 'frmListeAFFACT01', 'CPR', 'N5', 22, 
    'Adaptable field number 5', 'Adaptable field number 5', 0, 0, 0, 
    'CPR.N5', 0, NULL, 'Adaptable field number 5');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('3758', 'frmListeAFFACT01', 'CPR', 'C5', 22, 
    'Adaptable field check-box 5', 'Adaptable field check-box 5', 0, 0, 0, 
    'CPR.C5', 0, NULL, 'Adaptable field check-box 5');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('3759', 'frmListeAFFACT01', 'CPR', 'D1', 7, 
    'Adaptable field date 1', 'Adaptable field date 1', 0, 0, 0, 
    'TO_CHAR(CPR.D1,''DD/MM/YYYY'')', 0, NULL, 'Adaptable field date 1');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('3760', 'frmListeAFFACT01', 'CPR', 'D5', 7, 
    'Adaptable field date 5', 'Adaptable field date 5', 0, 0, 0, 
    'TO_CHAR(CPR.D5,''DD/MM/YYYY'')', 0, NULL, 'Adaptable field date 5');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('3761', 'frmListeAFFACT01', 'CPR', 'IDTTYPCPR', 6, 
    'Type de compteur', 'Type de compteur', 0, 1, 0, 
    'CPR.IDTTYPCPR', 0, NULL, 'Type de compteur');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('3762', 'frmListeAFFACT01', 'CPR', 'DATAGR', 7, 
    'Date d''agrement', 'Date d''agrement', 0, 1, 0, 
    'TO_CHAR(CPR.DATAGR,''DD/MM/YYYY'')', 0, NULL, 'Date d''agrement');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('3763', 'frmListeAFFACT01', 'CPR', 'T2', 6, 
    'Adaptable field typology 2', 'Adaptable field typology 2', 0, 0, 0, 
    'CPR.T2', 0, NULL, 'Adaptable field typology 2');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('3764', 'frmListeAFFACT01', 'CPR', 'IDTT2', 6, 
    'Associated typology ID 2', 'Associated typology ID 2', 0, 0, 0, 
    'CPR.IDTT2', 0, NULL, 'Associated typology ID 2');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('3765', 'frmListeAFFACT01', 'CPR', 'A3', 40, 
    'Adaptable field string 3', 'Adaptable field string 3', 0, 0, 0, 
    'CPR.A3', 0, NULL, 'Adaptable field string 3');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('3766', 'frmListeAFFACT01', 'CPR', 'D3', 7, 
    'Adaptable field date 3', 'Adaptable field date 3', 0, 0, 0, 
    'TO_CHAR(CPR.D3,''DD/MM/YYYY'')', 0, NULL, 'Adaptable field date 3');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('3767', 'frmListeAFFACT01', 'CPR', 'IDTT1', 6, 
    'Associated typology ID 1', 'Associated typology ID 1', 0, 0, 0, 
    'CPR.IDTT1', 0, NULL, 'Associated typology ID 1');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('3768', 'frmListeAFFACT01', 'CPR', 'IDTT5', 6, 
    'Associated typology ID 5', 'Associated typology ID 5', 0, 0, 0, 
    'CPR.IDTT5', 0, NULL, 'Associated typology ID 5');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('3769', 'frmListeAFFACT01', 'CPR', 'A4', 40, 
    'Adaptable field string 4', 'Adaptable field string 4', 0, 0, 0, 
    'CPR.A4', 0, NULL, 'Adaptable field string 4');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('3770', 'frmListeAFFACT01', 'CPR', 'IDTAGT', 6, 
    'Employee ID', 'Employee ID', 0, 1, 0, 
    'CPR.IDTAGT', 0, NULL, 'Employee ID');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('3771', 'frmListeAFFACT01', 'CPR', 'N3', 22, 
    'Adaptable field number 3', 'Adaptable field number 3', 0, 0, 0, 
    'CPR.N3', 0, NULL, 'Adaptable field number 3');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('3772', 'frmListeAFFACT01', 'CPR', 'DATRVS', 7, 
    'Date de revision', 'Date de revision', 0, 1, 0, 
    'TO_CHAR(CPR.DATRVS,''DD/MM/YYYY'')', 0, NULL, 'Date de revision');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('3773', 'frmListeAFFACT01', 'CPR', 'IDTT3', 6, 
    'Associated typology ID 3', 'Associated typology ID 3', 0, 0, 0, 
    'CPR.IDTT3', 0, NULL, 'Associated typology ID 3');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('3774', 'frmListeAFFACT01', 'CPR', 'C2', 22, 
    'Adaptable field check-box 2', 'Adaptable field check-box 2', 0, 0, 0, 
    'CPR.C2', 0, NULL, 'Adaptable field check-box 2');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('3775', 'frmListeAFFACT01', 'CPR', 'C3', 22, 
    'Adaptable field check-box 3', 'Adaptable field check-box 3', 0, 0, 0, 
    'CPR.C3', 0, NULL, 'Adaptable field check-box 3');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('3776', 'frmListeAFFACT01', 'CPR', 'DATMAJ', 7, 
    'Date de mise à jour', 'Date de mise à jour', 0, 1, 0, 
    'TO_CHAR(CPR.DATMAJ,''DD/MM/YYYY'')', 0, NULL, 'Date de mise à jour');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('3777', 'frmListeAFFACT01', 'CPR', 'SQCCNS', 22, 
    'Consumption serial number', 'Consumption serial number', 0, 1, 0, 
    'CPR.SQCCNS', 0, NULL, 'Consumption serial number');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('3778', 'frmListeAFFACT01', 'CPR', 'IDTSQCGNR', 22, 
    'General identifier', 'General identifier', 0, 1, 0, 
    'CPR.IDTSQCGNR', 0, NULL, 'General identifier');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('3779', 'frmListeAFFACT01', 'CPR', 'T3', 6, 
    'Adaptable field typology 3', 'Adaptable field typology 3', 0, 0, 0, 
    'CPR.T3', 0, NULL, 'Adaptable field typology 3');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('3780', 'frmListeAFFACT01', 'CPR', 'N2', 22, 
    'Adaptable field number 2', 'Adaptable field number 2', 0, 0, 0, 
    'CPR.N2', 0, NULL, 'Adaptable field number 2');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('3781', 'frmListeAFFACT01', 'CPR', 'D2', 7, 
    'Adaptable field date 2', 'Adaptable field date 2', 0, 0, 0, 
    'TO_CHAR(CPR.D2,''DD/MM/YYYY'')', 0, NULL, 'Adaptable field date 2');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('3782', 'frmListeAFFACT01', 'CPR', 'NUMENQ', 22, 
    'Recensement', 'Recensement', 0, 1, 0, 
    'CPR.NUMENQ', 0, NULL, 'Recensement');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('3783', 'frmListeAFFACT01', 'CPR', 'IDTCPR', 22, 
    'Identifiant interne', 'Identifiant interne', 0, 1, 0, 
    'CPR.IDTCPR', 0, NULL, 'Identifiant interne');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('3784', 'frmListeAFFACT01', 'CPR', 'DATFBR', 7, 
    'Date de fabrication', 'Date de fabrication', 0, 1, 0, 
    'TO_CHAR(CPR.DATFBR,''DD/MM/YYYY'')', 0, NULL, 'Date de fabrication');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('3785', 'frmListeAFFACT01', 'CPR', 'SQCIND', 22, 
    'Serial number of the index of the meter', 'Serial number of the index of the meter', 0, 1, 0, 
    'CPR.SQCIND', 0, NULL, 'Serial number of the index of the meter');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('3786', 'frmListeAFFACT01', 'CPR', 'T1', 6, 
    'Adaptable field typology 1', 'Adaptable field typology 1', 0, 0, 0, 
    'CPR.T1', 0, NULL, 'Adaptable field typology 1');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('3787', 'frmListeAFFACT01', 'CPR', 'T5', 6, 
    'Adaptable field typology 5', 'Adaptable field typology 5', 0, 0, 0, 
    'CPR.T5', 0, NULL, 'Adaptable field typology 5');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('3788', 'frmListeAFFACT01', 'CPR', 'N4', 22, 
    'Adaptable field number 4', 'Adaptable field number 4', 0, 0, 0, 
    'CPR.N4', 0, NULL, 'Adaptable field number 4');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('3789', 'frmListeAFFACT01', 'CPR', 'IDTCODOBS', 22, 
    'Observation code ID', 'Observation code ID', 0, 1, 0, 
    'CPR.IDTCODOBS', 0, NULL, 'Observation code ID');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('3790', 'frmListeAFFACT01', 'CNT', 'IDTAGT', 6, 
    'Agent d''acceuil', 'Code', 0, 1, 0, 
    'CNT.IDTAGT', 0, NULL, 'Code');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('3791', 'frmListeAFFACT01', 'CNT', 'CNTTLD', 6, 
    'Telephone', 'Telephone', 0, 1, 0, 
    'CNT.CNTTLD', 0, NULL, 'Telephone');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('3792', 'frmListeAFFACT01', 'CNT', 'IDTAGTSUI', 6, 
    'Agent de suivi', 'Code', 0, 1, 0, 
    'CNT.IDTAGTSUI', 0, NULL, 'Code');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('3793', 'frmListeAFFACT01', 'CNT', 'IdtMtfFinCnt', 6, 
    'Motif de fin de contact', 'Motif de fin de contact', 0, 1, 0, 
    '(SELECT M1.TypoStd FROM TYPOSTD M1 WHERE M1.IdtTypoStd = CNT.IdtMtfFinCnt AND M1.CodTypoStd = ''FINCNT'')', 0, NULL, 'Motif de fin de contact');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('3794', 'frmListeAFFACT01', 'CNT', 'DATFIN', 6, 
    'Date Fin', 'Date de fin', 0, 1, 0, 
    'TO_CHAR(CNT.DATFIN,X7UTIL.FRMDAT)', 0, NULL, 'Date de fin');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('3795', 'frmListeAFFACT01', 'CNT', 'MTRAGT', 6, 
    'Agent de suivi', 'Agent de suivi', 0, 1, 0, 
    'CNT.MTRAGT', 0, NULL, 'Agent de suivi');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('3796', 'frmListeAFFACT01', 'CNT', 'IDTSML', 6, 
    'Simulation', 'Simulation', 0, 1, 0, 
    'CNT.IDTSML', 0, NULL, 'Simulation');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('3797', 'frmListeAFFACT01', 'CNT', 'CNTPRN', 6, 
    'Prenom', 'Prenom', 0, 1, 0, 
    'CNT.CNTPRN', 0, NULL, 'Prenom');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('3798', 'frmListeAFFACT01', 'CNT', 'CNTNOM', 6, 
    'Nom', 'Nom', 0, 1, 0, 
    'CNT.CNTNOM', 0, NULL, 'Nom');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('3799', 'frmListeAFFACT01', 'CNT', 'IDTCNT', 6, 
    'Numéro', 'Code', 0, 1, 0, 
    'CNT.IDTCNT', 0, NULL, 'Code');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('3800', 'frmListeAFFACT01', 'CNT', 'DATCNT', 6, 
    'Date Début', 'Date du contact', 0, 1, 0, 
    'TO_CHAR(CNT.DATCNT,X7UTIL.FRMDAT)', 0, NULL, 'Date du contact');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('3801', 'frmListeAFFACT01', 'CNT', 'IdtOrgCnt', 6, 
    'Code origine du contact', 'Code origine du contact', 0, 1, 0, 
    '(SELECT M1.TypoStd FROM TYPOSTD M1 WHERE M1.IdtTypoStd = CNT.IdtOrgCnt AND M1.CodTypoStd = ''ORGCNT'')', 0, NULL, 'Code origine du contact');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('3802', 'frmListeAFFACT01', 'CNT', 'IDTCLT', 6, 
    'Client', 'Client', 0, 1, 0, 
    'CNT.IDTCLT', 0, NULL, 'Client');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('3803', 'frmListeAFFACT01', 'CTR_ALL', 'IDTLOTFAC', 6, 
    'Billing batch ID', 'Lot de facturation', 0, 1, 0, 
    'CTR_ALL.IDTLOTFAC', 0, NULL, 'Lot de facturation');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('3804', 'frmListeAFFACT01', 'CTR_ALL', 'IDTCNTOPR', 6, 
    'Centre opérationel', 'Centre opérationel', 0, 1, 0, 
    'CTR_ALL.IDTCNTOPR', 0, NULL, 'Centre opérationel');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('3805', 'frmListeAFFACT01', 'CTR_ALL', 'DPTGRN', 22, 
    'Deposit', 'Depot de garantie', 0, 1, 0, 
    'CTR_ALL.DPTGRN', 0, NULL, 'Depot de garantie');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('3806', 'frmListeAFFACT01', 'CTR_ALL', 'NUMCPTBNC', 30, 
    'Bank account number', 'Compte', 0, 1, 0, 
    'CTR_ALL.NUMCPTBNC', 0, NULL, 'Compte');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('3807', 'frmListeAFFACT01', 'CTR_ALL', 'T2', 6, 
    'Adaptable field typologie 2', 'Adaptable field typologie 2', 0, 0, 0, 
    'CTR_ALL.T2', 0, NULL, 'Adaptable field typologie 2');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('3808', 'frmListeAFFACT01', 'CTR_ALL', 'IDTT4', 6, 
    'Associated typology ID 4', 'Associated typology ID 4', 0, 0, 0, 
    'CTR_ALL.IDTT4', 0, NULL, 'Associated typology ID 4');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('3809', 'frmListeAFFACT01', 'CTR_ALL', 'A5', 40, 
    'Adaptable field string 5', 'Adaptable field string 5', 0, 0, 0, 
    'CTR_ALL.A5', 0, NULL, 'Adaptable field string 5');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('3810', 'frmListeAFFACT01', 'CTR_ALL', 'N1', 22, 
    'Adaptable field number 1', 'Adaptable field number 1', 0, 0, 0, 
    'CTR_ALL.N1', 0, NULL, 'Adaptable field number 1');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('3811', 'frmListeAFFACT01', 'CTR_ALL', 'IDTCTR', 10, 
    'Numéro', 'Numero', 0, 1, 0, 
    'CTR_ALL.IDTCTR', 0, NULL, 'Numero');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('3812', 'frmListeAFFACT01', 'CTR_ALL', 'IDTPNTLVR', 22, 
    'Delivery point ID', 'Delivery point ID', 0, 1, 0, 
    'CTR_ALL.IDTPNTLVR', 0, NULL, 'Delivery point ID');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('3813', 'frmListeAFFACT01', 'CTR_ALL', 'IDTCODSNS', 6, 
    'Code sensibilité', 'Code sensibilité', 0, 1, 0, 
    'CTR_ALL.IDTCODSNS', 0, NULL, 'Code sensibilité');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('3614', 'frmListeAFFAFF01', 'PNTLVR', 'IDTDCPGGR', 29, 
    'Découpage géographique', 'Adresse geographique', 0, 1, 0, 
    'PNTLVR.IDTDCPGGR', 0, NULL, 'Adresse geographique');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('3615', 'frmListeAFFAFF01', 'PNTLVR', 'CODGEO3', 4, 
    'Code géographique 3', 'Code du niveau 3', 0, 1, 0, 
    'PNTLVR.CODGEO3', 0, NULL, 'Code du niveau 3');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('3616', 'frmListeAFFAFF01', 'PNTLVR', 'ADRSTR8', 50, 
    'Description of structured address 8', 'Description of structured address 8', 0, 0, 0, 
    'PNTLVR.ADRSTR8', 0, NULL, 'Description of structured address 8');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('3617', 'frmListeAFFAFF01', 'PNTLVR', 'C4', 22, 
    'Adaptable field check-box 4', 'Adaptable field check-box 4', 0, 0, 0, 
    'PNTLVR.C4', 0, NULL, 'Adaptable field check-box 4');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('3618', 'frmListeAFFAFF01', 'PNTLVR', 'IDTCNTOPR', 6, 
    'Centre opérationel', 'Centre opérationel', 0, 1, 0, 
    'PNTLVR.IDTCNTOPR', 0, NULL, 'Centre opérationel');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('3619', 'frmListeAFFAFF01', 'PNTLVR', 'Occupé', 20, 
    'Occupé', 'Occupé', 0, 1, 0, 
    'DECODE(PNTLVR.Occ,1,''Oui'',''Non'')', 0, NULL, 'Occupé');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('3620', 'frmListeAFFAFF01', 'PNTLVR', 'ADRSTR3', 50, 
    'Description of structured address 3', 'Description of structured address 3', 0, 0, 0, 
    'PNTLVR.ADRSTR3', 0, NULL, 'Description of structured address 3');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('3621', 'frmListeAFFAFF01', 'PNTLVR', 'IDTENQ', 22, 
    'Investigation ID', 'Investigation ID', 0, 1, 0, 
    'PNTLVR.IDTENQ', 0, NULL, 'Investigation ID');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('3622', 'frmListeAFFAFF01', 'PNTLVR', 'CODGEO5', 4, 
    'Code géographique 5', 'Code du niveau 5', 0, 1, 0, 
    'PNTLVR.CODGEO5', 0, NULL, 'Code du niveau 5');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('3623', 'frmListeAFFAFF01', 'PNTLVR', 'D3', 7, 
    'Adaptable field date 3', 'Adaptable field date 3', 0, 0, 0, 
    'TO_CHAR(PNTLVR.D3,''DD/MM/YYYY'')', 0, NULL, 'Adaptable field date 3');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('3624', 'frmListeAFFAFF01', 'PNTLVR', 'ADRSTR7', 50, 
    'Description of structured address 7', 'Description of structured address 7', 0, 0, 0, 
    'PNTLVR.ADRSTR7', 0, NULL, 'Description of structured address 7');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('3625', 'frmListeAFFAFF01', 'PNTLVR', 'NUMORD', 22, 
    'Number in the standard round', 'Numero d''ordre', 0, 1, 0, 
    'PNTLVR.NUMORD', 0, NULL, 'Numero d''ordre');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('3626', 'frmListeAFFAFF01', 'PNTLVR', 'ADRSTR10', 50, 
    'Description of structured address 10', 'Description of structured address 10', 0, 0, 0, 
    'PNTLVR.ADRSTR10', 0, NULL, 'Description of structured address 10');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('3627', 'frmListeAFFAFF01', 'PNTLVR', 'C1', 22, 
    'Adaptable field check-box 1', 'Adaptable field check-box 1', 0, 0, 0, 
    'PNTLVR.C1', 0, NULL, 'Adaptable field check-box 1');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('3628', 'frmListeAFFAFF01', 'PNTLVR', 'T2', 6, 
    'Adaptable field typologie 2', 'Adaptable field typologie 2', 0, 0, 0, 
    'PNTLVR.T2', 0, NULL, 'Adaptable field typologie 2');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('3629', 'frmListeAFFAFF01', 'PNTLVR', 'T4', 6, 
    'Adaptable field typologie 4', 'Adaptable field typologie 4', 0, 0, 0, 
    'PNTLVR.T4', 0, NULL, 'Adaptable field typologie 4');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('3630', 'frmListeAFFAFF01', 'PNTLVR', 'CODGEO1', 5, 
    'Code géographique 1', 'Code du niveau 1', 0, 1, 0, 
    'PNTLVR.CODGEO1', 0, NULL, 'Code du niveau 1');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('3631', 'frmListeAFFAFF01', 'PNTLVR', 'A3', 40, 
    'Adaptable field string 3', 'Adaptable field string 3', 0, 0, 0, 
    'PNTLVR.A3', 0, NULL, 'Adaptable field string 3');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('3632', 'frmListeAFFAFF01', 'PNTLVR', 'MTRAGT', 6, 
    'Agent', 'Agent', 0, 1, 0, 
    'PNTLVR.MTRAGT', 0, NULL, 'Agent');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('3633', 'frmListeAFFAFF01', 'PNTLVR', 'IDTT3', 6, 
    'Associated typology ID 3', 'Associated typology ID 3', 0, 0, 0, 
    'PNTLVR.IDTT3', 0, NULL, 'Associated typology ID 3');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('3634', 'frmListeAFFAFF01', 'PNTLVR', 'ADRSTR4', 50, 
    'Description of structured address 4', 'Description of structured address 4', 0, 0, 0, 
    'PNTLVR.ADRSTR4', 0, NULL, 'Description of structured address 4');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('3635', 'frmListeAFFAFF01', 'PNTLVR', 'T3', 6, 
    'Adaptable field typologie 3', 'Adaptable field typologie 3', 0, 0, 0, 
    'PNTLVR.T3', 0, NULL, 'Adaptable field typologie 3');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('3636', 'frmListeAFFAFF01', 'PNTLVR', 'IDTPNTLVR', 22, 
    'Internal Delivery point ID', 'Identifiant interne', 0, 0, 0, 
    'PNTLVR.IDTPNTLVR', 0, NULL, 'Identifiant interne');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('3637', 'frmListeAFFAFF01', 'PNTLVR', 'C2', 22, 
    'Adaptable field check-box 2', 'Adaptable field check-box 2', 0, 0, 0, 
    'PNTLVR.C2', 0, NULL, 'Adaptable field check-box 2');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('3638', 'frmListeAFFAFF01', 'PNTLVR', 'A2', 40, 
    'Adaptable field string  2', 'Adaptable field string  2', 0, 0, 0, 
    'PNTLVR.A2', 0, NULL, 'Adaptable field string  2');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('3639', 'frmListeAFFAFF01', 'PNTLVR', 'N2', 22, 
    'Adaptable field number12', 'Adaptable field number12', 0, 0, 0, 
    'PNTLVR.N2', 0, NULL, 'Adaptable field number12');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('3640', 'frmListeAFFAFF01', 'PNTLVR', 'T5', 6, 
    'Adaptable field typologie 5', 'Adaptable field typologie 5', 0, 0, 0, 
    'PNTLVR.T5', 0, NULL, 'Adaptable field typologie 5');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('3641', 'frmListeAFFAFF01', 'PNTLVR', 'Datmaj', 20, 
    'Mise à jour le:', 'Date de mise a jour', 0, 1, 0, 
    'TO_CHAR(PNTLVR.DATMAJ,X7UTIL.FRMDAT)', 0, NULL, 'Date de mise a jour');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('3642', 'frmListeAFFAFF01', 'PNTLVR', 'C5', 22, 
    'Adaptable field check-box 5', 'Adaptable field check-box 5', 0, 0, 0, 
    'PNTLVR.C5', 0, NULL, 'Adaptable field check-box 5');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('3643', 'frmListeAFFAFF01', 'PNTLVR', 'CODGEO6', 4, 
    'Code géographique 6', 'Code du niveau 6', 0, 1, 0, 
    'PNTLVR.CODGEO6', 0, NULL, 'Code du niveau 6');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('3644', 'frmListeAFFAFF01', 'PNTLVR', 'IDTTYPHBT', 6, 
    'Type d''habitation', 'Type d''habitation', 0, 1, 0, 
    'PNTLVR.IDTTYPHBT', 0, NULL, 'Type d''habitation');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('3645', 'frmListeAFFAFF01', 'PNTLVR', 'IDTPNTLVR', 200, 
    'Code', 'Identifiant interne', 0, 1, 0, 
    'substr(X7UTIL.LIBPNTLVR(PNTLVR.IDTPNTLVR),1,250)', 0, NULL, 'Identifiant interne');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('3646', 'frmListeAFFAFF01', 'PNTLVR', 'A5', 40, 
    'Adaptable field string 5', 'Adaptable field string 5', 0, 0, 0, 
    'PNTLVR.A5', 0, NULL, 'Adaptable field string 5');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('3647', 'frmListeAFFAFF01', 'PNTLVR', 'D4', 7, 
    'Adaptable field date 4', 'Adaptable field date 4', 0, 0, 0, 
    'TO_CHAR(PNTLVR.D4,''DD/MM/YYYY'')', 0, NULL, 'Adaptable field date 4');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('3648', 'frmListeAFFAFF01', 'PNTLVR', 'ADRSTR1', 50, 
    'Description of structured address 1', 'Description of structured address 1', 0, 0, 0, 
    'PNTLVR.ADRSTR1', 0, NULL, 'Description of structured address 1');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('3649', 'frmListeAFFAFF01', 'PNTLVR', 'ADRSTR6', 50, 
    'Description of structured address 6', 'Description of structured address 6', 0, 0, 0, 
    'PNTLVR.ADRSTR6', 0, NULL, 'Description of structured address 6');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('3650', 'frmListeAFFAFF01', 'PNTLVR', 'DATMAJ', 7, 
    'Date de mise à jour', 'Date de mise a jour', 0, 1, 0, 
    'TO_CHAR(PNTLVR.DATMAJ,''DD/MM/YYYY'')', 0, NULL, 'Date de mise a jour');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('3651', 'frmListeAFFAFF01', 'PNTLVR', 'A4', 40, 
    'Adaptable field string 4', 'Adaptable field string 4', 0, 0, 0, 
    'PNTLVR.A4', 0, NULL, 'Adaptable field string 4');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('3652', 'frmListeAFFAFF01', 'PNTLVR', 'D1', 7, 
    'Adaptable field date 1', 'Adaptable field date 1', 0, 0, 0, 
    'TO_CHAR(PNTLVR.D1,''DD/MM/YYYY'')', 0, NULL, 'Adaptable field date 1');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('3653', 'frmListeAFFAFF01', 'PNTLVR', 'OCC', 22, 
    'Occupé', 'Occupation', 0, 1, 0, 
    'PNTLVR.OCC', 0, NULL, 'Occupation');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('3654', 'frmListeAFFAFF01', 'PNTLVR', 'D2', 7, 
    'Adaptable field date 2', 'Adaptable field date 2', 0, 0, 0, 
    'TO_CHAR(PNTLVR.D2,''DD/MM/YYYY'')', 0, NULL, 'Adaptable field date 2');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('3655', 'frmListeAFFAFF01', 'PNTLVR', 'IDTSQCGNR', 22, 
    'General identifier', 'General identifier', 0, 0, 0, 
    'PNTLVR.IDTSQCGNR', 0, NULL, 'General identifier');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('3656', 'frmListeAFFAFF01', 'PNTLVR', 'IDTT1', 6, 
    'Associated typology ID 1', 'Associated typology ID 1', 0, 0, 0, 
    'PNTLVR.IDTT1', 0, NULL, 'Associated typology ID 1');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('3657', 'frmListeAFFAFF01', 'PNTLVR', 'N5', 22, 
    'Adaptable field number 5', 'Adaptable field number 5', 0, 0, 0, 
    'PNTLVR.N5', 0, NULL, 'Adaptable field number 5');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('3658', 'frmListeAFFACT01', 'AFF', 'IDTAFF', 12, 
    'Affaire', 'Code', 0, 1, 0, 
    'AFF.IDTAFF', 0, NULL, 'Code');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('3659', 'frmListeAFFACT01', 'AFF', 'IDTCNT', 6, 
    'Contact', 'Contact', 0, 1, 0, 
    'AFF.IDTCNT', 0, NULL, 'Contact');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('3660', 'frmListeAFFACT01', 'AFF', 'IDTSML', 22, 
    'Simulation', 'Simulation', 0, 1, 0, 
    'AFF.IDTSML', 0, NULL, 'Simulation');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('3661', 'frmListeAFFACT01', 'AFF', 'IDTCLT', 6, 
    'Client', 'Client', 0, 1, 0, 
    'AFF.IDTCLT', 0, NULL, 'Client');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('3662', 'frmListeAFFACT01', 'AFF', 'MTRAGT', 22, 
    'Affecté à', 'Affecté à', 0, 1, 0, 
    'AFF.MTRAGT', 0, NULL, 'Affecté à');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('3663', 'frmListeAFFACT01', 'AFF', 'IDTETP', 22, 
    'N?Etape', 'N°Etape', 0, 1, 0, 
    'AFF.IDTETP', 0, NULL, 'N°Etape');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('3664', 'frmListeAFFACT01', 'AFF', 'IDTPLNACT', 22, 
    'Code plan d''actions', 'Code plan d''actions', 0, 1, 0, 
    'AFF.IDTPLNACT', 0, NULL, 'Code plan d''actions');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('3665', 'frmListeAFFACT01', 'AFF', 'Datcrt', 20, 
    'Début', 'Date de creation', 0, 1, 0, 
    'TO_CHAR(AFF.DATCRT,X7UTIL.FRMDAT)', 0, NULL, 'Date de creation');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('3666', 'frmListeAFFACT01', 'AFF', 'Datfin', 20, 
    'Fin', 'Date de fin', 0, 1, 0, 
    'TO_CHAR(AFF.DATFIN,X7UTIL.FRMDAT)', 0, NULL, 'Date de fin');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('3667', 'frmListeAFFACT01', 'CLT', 'MTRAGT', 6, 
    'Agent', 'Agent', 0, 1, 0, 
    'CLT.MTRAGT', 0, NULL, 'Agent');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('3668', 'frmListeAFFACT01', 'CLT', 'ANCRFR', 20, 
    'Ancienne reference', 'Ancienne reference', 0, 1, 0, 
    'CLT.ANCRFR', 0, NULL, 'Ancienne reference');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('3669', 'frmListeAFFACT01', 'CLT', 'IDTT2', 6, 
    'Associated typology ID 2', 'Associated typology ID 2', 0, 0, 0, 
    'CLT.IDTT2', 0, NULL, 'Associated typology ID 2');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('3670', 'frmListeAFFACT01', 'CLT', 'A4', 40, 
    'Adaptable field string 4', 'Adaptable field string 4', 0, 0, 0, 
    'CLT.A4', 0, NULL, 'Adaptable field string 4');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('3671', 'frmListeAFFACT01', 'CLT', 'A5', 40, 
    'Adaptable field string 5', 'Adaptable field string 5', 0, 0, 0, 
    'CLT.A5', 0, NULL, 'Adaptable field string 5');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('3672', 'frmListeAFFACT01', 'CLT', 'C2', 22, 
    'Adaptable field check-box 2', 'Adaptable field check-box 2', 0, 0, 0, 
    'CLT.C2', 0, NULL, 'Adaptable field check-box 2');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('3673', 'frmListeAFFACT01', 'CLT', 'D3', 7, 
    'Adaptable field date 3', 'Adaptable field date 3', 0, 0, 0, 
    'TO_CHAR(CLT.D3,''DD/MM/YYYY'')', 0, NULL, 'Adaptable field date 3');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('3674', 'frmListeAFFACT01', 'CLT', 'D5', 7, 
    'Adaptable field date 5', 'Adaptable field date 5', 0, 0, 0, 
    'TO_CHAR(CLT.D5,''DD/MM/YYYY'')', 0, NULL, 'Adaptable field date 5');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('3675', 'frmListeAFFACT01', 'CLT', 'IDTCNTOPR', 6, 
    'Centre operationnel', 'Centre operationnel', 0, 1, 0, 
    'CLT.IDTCNTOPR', 0, NULL, 'Centre operationnel');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('3676', 'frmListeAFFACT01', 'CLT', 'IDTT3', 6, 
    'Associated typology ID 3', 'Associated typology ID 3', 0, 0, 0, 
    'CLT.IDTT3', 0, NULL, 'Associated typology ID 3');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('3677', 'frmListeAFFACT01', 'CLT', 'N3', 22, 
    'Adaptable field number 3', 'Adaptable field number 3', 0, 0, 0, 
    'CLT.N3', 0, NULL, 'Adaptable field number 3');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('3678', 'frmListeAFFACT01', 'CLT', 'D2', 7, 
    'Adaptable field date 2', 'Adaptable field date 2', 0, 0, 0, 
    'TO_CHAR(CLT.D2,''DD/MM/YYYY'')', 0, NULL, 'Adaptable field date 2');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('3367', 'frmListeAFFAFF01', 'CLT', 'SQCCNT', 22, 
    'Contact serial number', 'Contact serial number', 0, 1, 0, 
    'CLT.SQCCNT', 0, NULL, 'Contact serial number');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('3368', 'frmListeAFFAFF01', 'CLT', 'QLTPYR', 2, 
    'Qualite payeur', 'Qualite payeur', 0, 1, 0, 
    'CLT.QLTPYR', 0, NULL, 'Qualite payeur');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('3369', 'frmListeAFFAFF01', 'CLT', 'T2', 6, 
    'Adaptable field typology 2', 'Adaptable field typology 2', 0, 0, 0, 
    'CLT.T2', 0, NULL, 'Adaptable field typology 2');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('3370', 'frmListeAFFAFF01', 'CLT', 'A2', 40, 
    'Adaptable field string 2', 'Adaptable field string 2', 0, 0, 0, 
    'CLT.A2', 0, NULL, 'Adaptable field string 2');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('3371', 'frmListeAFFAFF01', 'CLT', 'A4', 40, 
    'Adaptable field string 4', 'Adaptable field string 4', 0, 0, 0, 
    'CLT.A4', 0, NULL, 'Adaptable field string 4');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('3372', 'frmListeAFFAFF01', 'CLT', 'ADRSTR7', 50, 
    'Description of structured address 7', 'Description of structured address 7', 0, 0, 0, 
    'CLT.ADRSTR7', 0, NULL, 'Description of structured address 7');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('3373', 'frmListeAFFAFF01', 'CLT', 'ADRSTR8', 50, 
    'Description of structured address 8', 'Description of structured address 8', 0, 0, 0, 
    'CLT.ADRSTR8', 0, NULL, 'Description of structured address 8');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('3374', 'frmListeAFFAFF01', 'CLT', 'AVT_IDTCTR', 10, 
    'NOT USED !!!', 'NOT USED !!!', 0, 0, 0, 
    'CLT.AVT_IDTCTR', 0, NULL, 'NOT USED !!!');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('3375', 'frmListeAFFAFF01', 'CLT', 'FLD', 20, 
    'Fax du domicile', 'Fax du domicile', 0, 1, 0, 
    'CLT.FLD', 0, NULL, 'Fax du domicile');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('3376', 'frmListeAFFAFF01', 'CLT', 'CHPLIB1', 30, 
    '1st free field', '1st free field', 0, 0, 0, 
    'CLT.CHPLIB1', 0, NULL, '1st free field');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('3377', 'frmListeAFFAFF01', 'CLT', 'IDTSQCGNR', 22, 
    'General identifier', 'General identifier', 0, 0, 0, 
    'CLT.IDTSQCGNR', 0, NULL, 'General identifier');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('3378', 'frmListeAFFAFF01', 'CLT', 'T3', 6, 
    'Adaptable field typology 3', 'Adaptable field typology 3', 0, 0, 0, 
    'CLT.T3', 0, NULL, 'Adaptable field typology 3');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('3379', 'frmListeAFFAFF01', 'CLT', 'T4', 6, 
    'Adaptable field typology 4', 'Adaptable field typology 4', 0, 0, 0, 
    'CLT.T4', 0, NULL, 'Adaptable field typology 4');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('3380', 'frmListeAFFAFF01', 'CLT', 'A5', 40, 
    'Adaptable field string 5', 'Adaptable field string 5', 0, 0, 0, 
    'CLT.A5', 0, NULL, 'Adaptable field string 5');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('3381', 'frmListeAFFAFF01', 'CLT', 'D4', 7, 
    'Adaptable field date 4', 'Adaptable field date 4', 0, 0, 0, 
    'TO_CHAR(CLT.D4,''DD/MM/YYYY'')', 0, NULL, 'Adaptable field date 4');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('3382', 'frmListeAFFAFF01', 'CLT', 'D5', 7, 
    'Adaptable field date 5', 'Adaptable field date 5', 0, 0, 0, 
    'TO_CHAR(CLT.D5,''DD/MM/YYYY'')', 0, NULL, 'Adaptable field date 5');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('3383', 'frmListeAFFAFF01', 'CLT', 'ADRSTR9', 254, 
    'Description of structured address 9', 'Description of structured address 9', 0, 0, 0, 
    'CLT.ADRSTR9', 0, NULL, 'Description of structured address 9');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('3384', 'frmListeAFFAFF01', 'CLT', 'TLP', 20, 
    'Telephone portable', 'Telephone portable', 0, 1, 0, 
    'CLT.TLP', 0, NULL, 'Telephone portable');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('3385', 'frmListeAFFAFF01', 'CPR', 'IDTCPR', 22, 
    'Identifiant interne', 'Identifiant interne', 0, 1, 0, 
    'CPR.IDTCPR', 0, NULL, 'Identifiant interne');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('3386', 'frmListeAFFAFF01', 'CPR', 'DATFBR', 7, 
    'Date de fabrication', 'Date de fabrication', 0, 1, 0, 
    'TO_CHAR(CPR.DATFBR,''DD/MM/YYYY'')', 0, NULL, 'Date de fabrication');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('3387', 'frmListeAFFAFF01', 'CPR', 'IDTT1', 6, 
    'Associated typology ID 1', 'Associated typology ID 1', 0, 0, 0, 
    'CPR.IDTT1', 0, NULL, 'Associated typology ID 1');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('3388', 'frmListeAFFAFF01', 'CPR', 'T2', 6, 
    'Adaptable field typology 2', 'Adaptable field typology 2', 0, 0, 0, 
    'CPR.T2', 0, NULL, 'Adaptable field typology 2');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('3389', 'frmListeAFFAFF01', 'CPR', 'IDTT4', 6, 
    'Associated typology ID 4', 'Associated typology ID 4', 0, 0, 0, 
    'CPR.IDTT4', 0, NULL, 'Associated typology ID 4');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('3390', 'frmListeAFFAFF01', 'CPR', 'N1', 22, 
    'Adaptable field number 1', 'Adaptable field number 1', 0, 0, 0, 
    'CPR.N1', 0, NULL, 'Adaptable field number 1');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('3391', 'frmListeAFFAFF01', 'CPR', 'N2', 22, 
    'Adaptable field number 2', 'Adaptable field number 2', 0, 0, 0, 
    'CPR.N2', 0, NULL, 'Adaptable field number 2');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('3392', 'frmListeAFFAFF01', 'CPR', 'C1', 22, 
    'Adaptable field check-box 1', 'Adaptable field check-box 1', 0, 0, 0, 
    'CPR.C1', 0, NULL, 'Adaptable field check-box 1');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('3393', 'frmListeAFFAFF01', 'CPR', 'DATRVS', 7, 
    'Date de revision', 'Date de revision', 0, 1, 0, 
    'TO_CHAR(CPR.DATRVS,''DD/MM/YYYY'')', 0, NULL, 'Date de revision');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('3394', 'frmListeAFFAFF01', 'CPR', 'NUMENQ', 22, 
    'Recensement', 'Recensement', 0, 1, 0, 
    'CPR.NUMENQ', 0, NULL, 'Recensement');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('3395', 'frmListeAFFAFF01', 'CPR', 'IDTTYPCPR', 6, 
    'Type de compteur', 'Type de compteur', 0, 1, 0, 
    'CPR.IDTTYPCPR', 0, NULL, 'Type de compteur');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('3396', 'frmListeAFFAFF01', 'CPR', 'N5', 22, 
    'Adaptable field number 5', 'Adaptable field number 5', 0, 0, 0, 
    'CPR.N5', 0, NULL, 'Adaptable field number 5');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('3397', 'frmListeAFFAFF01', 'CPR', 'C2', 22, 
    'Adaptable field check-box 2', 'Adaptable field check-box 2', 0, 0, 0, 
    'CPR.C2', 0, NULL, 'Adaptable field check-box 2');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('3398', 'frmListeAFFAFF01', 'CPR', 'C5', 22, 
    'Adaptable field check-box 5', 'Adaptable field check-box 5', 0, 0, 0, 
    'CPR.C5', 0, NULL, 'Adaptable field check-box 5');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('3399', 'frmListeAFFAFF01', 'CPR', 'DATMAJ', 7, 
    'Date de mise à jour', 'Date de mise à jour', 0, 1, 0, 
    'TO_CHAR(CPR.DATMAJ,''DD/MM/YYYY'')', 0, NULL, 'Date de mise à jour');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('3400', 'frmListeAFFAFF01', 'CPR', 'DATETL', 7, 
    'Date d''etalonnage', 'Date d''etalonnage', 0, 1, 0, 
    'TO_CHAR(CPR.DATETL,''DD/MM/YYYY'')', 0, NULL, 'Date d''etalonnage');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('3401', 'frmListeAFFAFF01', 'CPR', 'IDTSQCGNR', 22, 
    'General identifier', 'General identifier', 0, 1, 0, 
    'CPR.IDTSQCGNR', 0, NULL, 'General identifier');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('3402', 'frmListeAFFAFF01', 'CPR', 'T5', 6, 
    'Adaptable field typology 5', 'Adaptable field typology 5', 0, 0, 0, 
    'CPR.T5', 0, NULL, 'Adaptable field typology 5');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('3403', 'frmListeAFFAFF01', 'CPR', 'A3', 40, 
    'Adaptable field string 3', 'Adaptable field string 3', 0, 0, 0, 
    'CPR.A3', 0, NULL, 'Adaptable field string 3');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('3404', 'frmListeAFFAFF01', 'CPR', 'IDTAGT', 6, 
    'Employee ID', 'Employee ID', 0, 1, 0, 
    'CPR.IDTAGT', 0, NULL, 'Employee ID');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('3405', 'frmListeAFFAFF01', 'CPR', 'N4', 22, 
    'Adaptable field number 4', 'Adaptable field number 4', 0, 0, 0, 
    'CPR.N4', 0, NULL, 'Adaptable field number 4');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('3406', 'frmListeAFFAFF01', 'CPR', 'D2', 7, 
    'Adaptable field date 2', 'Adaptable field date 2', 0, 0, 0, 
    'TO_CHAR(CPR.D2,''DD/MM/YYYY'')', 0, NULL, 'Adaptable field date 2');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('3407', 'frmListeAFFAFF01', 'CPR', 'DATGRN', 7, 
    'Date de garantie', 'Date de garantie', 0, 1, 0, 
    'TO_CHAR(CPR.DATGRN,''DD/MM/YYYY'')', 0, NULL, 'Date de garantie');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('3408', 'frmListeAFFAFF01', 'CPR', 'IDTT2', 6, 
    'Associated typology ID 2', 'Associated typology ID 2', 0, 0, 0, 
    'CPR.IDTT2', 0, NULL, 'Associated typology ID 2');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('3409', 'frmListeAFFAFF01', 'CPR', 'T3', 6, 
    'Adaptable field typology 3', 'Adaptable field typology 3', 0, 0, 0, 
    'CPR.T3', 0, NULL, 'Adaptable field typology 3');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('3410', 'frmListeAFFAFF01', 'CPR', 'D1', 7, 
    'Adaptable field date 1', 'Adaptable field date 1', 0, 0, 0, 
    'TO_CHAR(CPR.D1,''DD/MM/YYYY'')', 0, NULL, 'Adaptable field date 1');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('3411', 'frmListeAFFAFF01', 'CPR', 'IDTCODOBS', 22, 
    'Observation code ID', 'Observation code ID', 0, 1, 0, 
    'CPR.IDTCODOBS', 0, NULL, 'Observation code ID');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('3412', 'frmListeAFFAFF01', 'CPR', 'T4', 6, 
    'Adaptable field typology 4', 'Adaptable field typology 4', 0, 0, 0, 
    'CPR.T4', 0, NULL, 'Adaptable field typology 4');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('3413', 'frmListeAFFAFF01', 'CPR', 'IDTT5', 6, 
    'Associated typology ID 5', 'Associated typology ID 5', 0, 0, 0, 
    'CPR.IDTT5', 0, NULL, 'Associated typology ID 5');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('3414', 'frmListeAFFAFF01', 'CPR', 'C3', 22, 
    'Adaptable field check-box 3', 'Adaptable field check-box 3', 0, 0, 0, 
    'CPR.C3', 0, NULL, 'Adaptable field check-box 3');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('3415', 'frmListeAFFAFF01', 'CPR', 'C4', 22, 
    'Adaptable field check-box 4', 'Adaptable field check-box 4', 0, 0, 0, 
    'CPR.C4', 0, NULL, 'Adaptable field check-box 4');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('3416', 'frmListeAFFAFF01', 'CPR', 'D3', 7, 
    'Adaptable field date 3', 'Adaptable field date 3', 0, 0, 0, 
    'TO_CHAR(CPR.D3,''DD/MM/YYYY'')', 0, NULL, 'Adaptable field date 3');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('3417', 'frmListeAFFAFF01', 'CPR', 'SQCCNS', 22, 
    'Consumption serial number', 'Consumption serial number', 0, 1, 0, 
    'CPR.SQCCNS', 0, NULL, 'Consumption serial number');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('3418', 'frmListeAFFAFF01', 'CPR', 'SQCIND', 22, 
    'Serial number of the index of the meter', 'Serial number of the index of the meter', 0, 1, 0, 
    'CPR.SQCIND', 0, NULL, 'Serial number of the index of the meter');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('3419', 'frmListeAFFAFF01', 'CPR', 'A2', 40, 
    'Adaptable field string 2', 'Adaptable field string 2', 0, 0, 0, 
    'CPR.A2', 0, NULL, 'Adaptable field string 2');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('3420', 'frmListeAFFAFF01', 'CPR', 'A5', 40, 
    'Adaptable field string 5', 'Adaptable field string 5', 0, 0, 0, 
    'CPR.A5', 0, NULL, 'Adaptable field string 5');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('3421', 'frmListeAFFAFF01', 'CPR', 'N3', 22, 
    'Adaptable field number 3', 'Adaptable field number 3', 0, 0, 0, 
    'CPR.N3', 0, NULL, 'Adaptable field number 3');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('3422', 'frmListeAFFAFF01', 'CPR', 'DATAGR', 7, 
    'Date d''agrement', 'Date d''agrement', 0, 1, 0, 
    'TO_CHAR(CPR.DATAGR,''DD/MM/YYYY'')', 0, NULL, 'Date d''agrement');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('3423', 'frmListeAFFAFF01', 'CPR', 'T1', 6, 
    'Adaptable field typology 1', 'Adaptable field typology 1', 0, 0, 0, 
    'CPR.T1', 0, NULL, 'Adaptable field typology 1');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('3424', 'frmListeAFFAFF01', 'CPR', 'A4', 40, 
    'Adaptable field string 4', 'Adaptable field string 4', 0, 0, 0, 
    'CPR.A4', 0, NULL, 'Adaptable field string 4');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('3425', 'frmListeAFFAFF01', 'CPR', 'D4', 7, 
    'Adaptable field date 4', 'Adaptable field date 4', 0, 0, 0, 
    'TO_CHAR(CPR.D4,''DD/MM/YYYY'')', 0, NULL, 'Adaptable field date 4');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('3426', 'frmListeAFFAFF01', 'CPR', 'IDTT3', 6, 
    'Associated typology ID 3', 'Associated typology ID 3', 0, 0, 0, 
    'CPR.IDTT3', 0, NULL, 'Associated typology ID 3');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('3427', 'frmListeAFFAFF01', 'CPR', 'A1', 40, 
    'Adaptable field string 1', 'Adaptable field string 1', 0, 0, 0, 
    'CPR.A1', 0, NULL, 'Adaptable field string 1');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('3428', 'frmListeAFFAFF01', 'CPR', 'NUMCPR', 20, 
    'Numero', 'Numero', 0, 1, 0, 
    'CPR.NUMCPR', 0, NULL, 'Numero');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('3429', 'frmListeAFFAFF01', 'CPR', 'D5', 7, 
    'Adaptable field date 5', 'Adaptable field date 5', 0, 0, 0, 
    'TO_CHAR(CPR.D5,''DD/MM/YYYY'')', 0, NULL, 'Adaptable field date 5');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('3430', 'frmListeAFFAFF01', 'CNT', 'IDTAGTSUI', 6, 
    'Agent de suivi', 'Code', 0, 1, 0, 
    'CNT.IDTAGTSUI', 0, NULL, 'Code');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('3431', 'frmListeAFFAFF01', 'CNT', 'IDTSML', 6, 
    'Simulation', 'Simulation', 0, 1, 0, 
    'CNT.IDTSML', 0, NULL, 'Simulation');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('3432', 'frmListeAFFAFF01', 'CNT', 'CNTNOM', 6, 
    'Nom', 'Nom', 0, 1, 0, 
    'CNT.CNTNOM', 0, NULL, 'Nom');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('3433', 'frmListeAFFAFF01', 'CNT', 'CNTPRN', 6, 
    'Prenom', 'Prenom', 0, 1, 0, 
    'CNT.CNTPRN', 0, NULL, 'Prenom');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('3434', 'frmListeAFFAFF01', 'CNT', 'IDTCNT', 6, 
    'Numéro', 'Code', 0, 1, 0, 
    'CNT.IDTCNT', 0, NULL, 'Code');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('3435', 'frmListeAFFAFF01', 'CNT', 'DATCNT', 6, 
    'Date Début', 'Date du contact', 0, 1, 0, 
    'TO_CHAR(CNT.DATCNT,X7UTIL.FRMDAT)', 0, NULL, 'Date du contact');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('3436', 'frmListeAFFAFF01', 'CNT', 'DATFIN', 6, 
    'Date Fin', 'Date de fin', 0, 1, 0, 
    'TO_CHAR(CNT.DATFIN,X7UTIL.FRMDAT)', 0, NULL, 'Date de fin');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('3437', 'frmListeAFFAFF01', 'CNT', 'IdtMtfFinCnt', 6, 
    'Motif de fin de contact', 'Motif de fin de contact', 0, 1, 0, 
    '(SELECT M1.TypoStd FROM TYPOSTD M1 WHERE M1.IdtTypoStd = CNT.IdtMtfFinCnt AND M1.CodTypoStd = ''FINCNT'')', 0, NULL, 'Motif de fin de contact');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('3438', 'frmListeAFFAFF01', 'CNT', 'IDTAGT', 6, 
    'Agent d''acceuil', 'Code', 0, 1, 0, 
    'CNT.IDTAGT', 0, NULL, 'Code');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('3439', 'frmListeAFFAFF01', 'CNT', 'IDTCLT', 6, 
    'Client', 'Client', 0, 1, 0, 
    'CNT.IDTCLT', 0, NULL, 'Client');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('3440', 'frmListeAFFAFF01', 'CNT', 'MTRAGT', 6, 
    'Agent de suivi', 'Agent de suivi', 0, 1, 0, 
    'CNT.MTRAGT', 0, NULL, 'Agent de suivi');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('3441', 'frmListeAFFAFF01', 'CNT', 'IdtOrgCnt', 6, 
    'Code origine du contact', 'Code origine du contact', 0, 1, 0, 
    '(SELECT M1.TypoStd FROM TYPOSTD M1 WHERE M1.IdtTypoStd = CNT.IdtOrgCnt AND M1.CodTypoStd = ''ORGCNT'')', 0, NULL, 'Code origine du contact');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('3442', 'frmListeAFFAFF01', 'CNT', 'CNTTLD', 6, 
    'Telephone', 'Telephone', 0, 1, 0, 
    'CNT.CNTTLD', 0, NULL, 'Telephone');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('3443', 'frmListeAFFAFF01', 'CTR_ALL', 'IDTT5', 6, 
    'Associated typology ID 5', 'Associated typology ID 5', 0, 0, 0, 
    'CTR_ALL.IDTT5', 0, NULL, 'Associated typology ID 5');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('3444', 'frmListeAFFAFF01', 'CTR_ALL', 'N2', 22, 
    'Adaptable field number 2', 'Adaptable field number 2', 0, 0, 0, 
    'CTR_ALL.N2', 0, NULL, 'Adaptable field number 2');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('3445', 'frmListeAFFAFF01', 'CTR_ALL', 'N4', 22, 
    'Adaptable field number 4', 'Adaptable field number 4', 0, 0, 0, 
    'CTR_ALL.N4', 0, NULL, 'Adaptable field number 4');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('3446', 'frmListeAFFAFF01', 'CTR_ALL', 'IDTPNTLVR', 22, 
    'Delivery point ID', 'Delivery point ID', 0, 1, 0, 
    'CTR_ALL.IDTPNTLVR', 0, NULL, 'Delivery point ID');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('3447', 'frmListeAFFAFF01', 'CTR_ALL', 'DATDRNFCT', 7, 
    'Date of last billing of the contract', 'Date de derniere facturation', 0, 1, 0, 
    'TO_CHAR(CTR_ALL.DATDRNFCT,''DD/MM/YYYY'')', 0, NULL, 'Date de derniere facturation');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('3448', 'frmListeAFFAFF01', 'CTR_ALL', 'CLERIB', 2, 
    'Bank account code', 'Bank account code', 0, 1, 0, 
    'CTR_ALL.CLERIB', 0, NULL, 'Bank account code');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('3449', 'frmListeAFFAFF01', 'CTR_ALL', 'T1', 6, 
    'Adaptable field typologie 1', 'Adaptable field typologie 1', 0, 0, 0, 
    'CTR_ALL.T1', 0, NULL, 'Adaptable field typologie 1');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('3450', 'frmListeAFFAFF01', 'CTR_ALL', 'A3', 40, 
    'Adaptable field string 3', 'Adaptable field string 3', 0, 0, 0, 
    'CTR_ALL.A3', 0, NULL, 'Adaptable field string 3');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('3451', 'frmListeAFFAFF01', 'CTR_ALL', 'IDTCNTOPR', 6, 
    'Centre opérationel', 'Centre opérationel', 0, 1, 0, 
    'CTR_ALL.IDTCNTOPR', 0, NULL, 'Centre opérationel');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('3452', 'frmListeAFFAFF01', 'CTR_ALL', 'DPTGRN', 22, 
    'Deposit', 'Depot de garantie', 0, 1, 0, 
    'CTR_ALL.DPTGRN', 0, NULL, 'Depot de garantie');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('3453', 'frmListeAFFAFF01', 'CTR_ALL', 'IDTSQCGNR', 22, 
    'General identifier', 'General identifier', 0, 1, 0, 
    'CTR_ALL.IDTSQCGNR', 0, NULL, 'General identifier');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('3454', 'frmListeAFFAFF01', 'CTR_ALL', 'D3', 7, 
    'Adaptable field date 3', 'Adaptable field date 3', 0, 0, 0, 
    'TO_CHAR(CTR_ALL.D3,''DD/MM/YYYY'')', 0, NULL, 'Adaptable field date 3');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('3455', 'frmListeAFFAFF01', 'CTR_ALL', 'ANCRFR', 20, 
    'Ancienne reference', 'Ancienne reference', 0, 1, 0, 
    'CTR_ALL.ANCRFR', 0, NULL, 'Ancienne reference');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('3456', 'frmListeAFFAFF01', 'CTR_ALL', 'DATMAJ', 7, 
    'Date de mise à jour', 'Date de mise à jour', 0, 1, 0, 
    'TO_CHAR(CTR_ALL.DATMAJ,''DD/MM/YYYY'')', 0, NULL, 'Date de mise à jour');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('3457', 'frmListeAFFAFF01', 'CTR_ALL', 'MTRAGT', 6, 
    'ID of the employee who carries out updating', 'ID of the employee who carries out updating', 0, 1, 0, 
    'CTR_ALL.MTRAGT', 0, NULL, 'ID of the employee who carries out updating');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('3458', 'frmListeAFFAFF01', 'CTR_ALL', 'ETTCTRFCT', 22, 
    'Billing status of contract (1<normal>, 2<computation mode>, 3<validation mode>, 4<periodical billing on going>)', 'Billing status of contract (1<normal>, 2<computation mode>, 3<validation mode>, 4<periodical billing on going>)', 0, 1, 0, 
    'CTR_ALL.ETTCTRFCT', 0, NULL, 'Billing status of contract (1<normal>, 2<computation mode>, 3<validation mode>, 4<periodical billing on going>)');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('3459', 'frmListeAFFAFF01', 'CTR_ALL', 'IDTGCH', 6, 
    'Counter ID', 'Counter ID', 0, 1, 0, 
    'CTR_ALL.IDTGCH', 0, NULL, 'Counter ID');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('3460', 'frmListeAFFAFF01', 'CTR_ALL', 'IDTT2', 6, 
    'Associated typology ID 2', 'Associated typology ID 2', 0, 0, 0, 
    'CTR_ALL.IDTT2', 0, NULL, 'Associated typology ID 2');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('3461', 'frmListeAFFAFF01', 'CTR_ALL', 'T4', 6, 
    'Adaptable field typologie 4', 'Adaptable field typologie 4', 0, 0, 0, 
    'CTR_ALL.T4', 0, NULL, 'Adaptable field typologie 4');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('3462', 'frmListeAFFAFF01', 'CTR_ALL', 'T5', 6, 
    'Adaptable field typologie 5', 'Adaptable field typologie 5', 0, 0, 0, 
    'CTR_ALL.T5', 0, NULL, 'Adaptable field typologie 5');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('3463', 'frmListeAFFAFF01', 'CTR_ALL', 'A4', 40, 
    'Adaptable field string 4', 'Adaptable field string 4', 0, 0, 0, 
    'CTR_ALL.A4', 0, NULL, 'Adaptable field string 4');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('3464', 'frmListeAFFAFF01', 'CTR_ALL', 'N1', 22, 
    'Adaptable field number 1', 'Adaptable field number 1', 0, 0, 0, 
    'CTR_ALL.N1', 0, NULL, 'Adaptable field number 1');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('3465', 'frmListeAFFAFF01', 'CTR_ALL', 'N5', 22, 
    'Adaptable field number 5', 'Adaptable field number 5', 0, 0, 0, 
    'CTR_ALL.N5', 0, NULL, 'Adaptable field number 5');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('3466', 'frmListeAFFAFF01', 'CTR_ALL', 'IDTLOTFAC', 6, 
    'Billing batch ID', 'Lot de facturation', 0, 1, 0, 
    'CTR_ALL.IDTLOTFAC', 0, NULL, 'Lot de facturation');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('3467', 'frmListeAFFAFF01', 'CTR_ALL', 'DATRSL', 7, 
    'Résilié le', 'Date de resiliation', 0, 1, 0, 
    'TO_CHAR(CTR_ALL.DATRSL,''DD/MM/YYYY'')', 0, NULL, 'Date de resiliation');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('3468', 'frmListeAFFAFF01', 'CTR_ALL', 'CODTYPCTR', 6, 
    'Type of contract code', 'Type de contrat', 0, 1, 0, 
    'CTR_ALL.CODTYPCTR', 0, NULL, 'Type de contrat');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('3469', 'frmListeAFFAFF01', 'CTR_ALL', 'C2', 22, 
    'Adaptable field check-box 2', 'Adaptable field check-box 2', 0, 0, 0, 
    'CTR_ALL.C2', 0, NULL, 'Adaptable field check-box 2');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('3470', 'frmListeAFFAFF01', 'CTR_ALL', 'C3', 22, 
    'Adaptable field check-box 3', 'Adaptable field check-box 3', 0, 0, 0, 
    'CTR_ALL.C3', 0, NULL, 'Adaptable field check-box 3');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('3471', 'frmListeAFFAFF01', 'CTR_ALL', 'PRPCPTBNC', 40, 
    'Bank account owner', 'Bank account owner', 0, 1, 0, 
    'CTR_ALL.PRPCPTBNC', 0, NULL, 'Bank account owner');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('3472', 'frmListeAFFAFF01', 'CTR_ALL', 'A5', 40, 
    'Adaptable field string 5', 'Adaptable field string 5', 0, 0, 0, 
    'CTR_ALL.A5', 0, NULL, 'Adaptable field string 5');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('3473', 'frmListeAFFAFF01', 'CTR_ALL', 'IDTPNTCPG', 22, 
    'Metering point ID', 'Metering point ID', 0, 1, 0, 
    'CTR_ALL.IDTPNTCPG', 0, NULL, 'Metering point ID');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('3474', 'frmListeAFFAFF01', 'CTR_ALL', 'NUMINTER', 22, 
    'Work order number', 'Work order number', 0, 1, 0, 
    'CTR_ALL.NUMINTER', 0, NULL, 'Work order number');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('3475', 'frmListeAFFAFF01', 'CTR_ALL', 'IDTRCVTYP', 6, 
    'Debt recovery type ID', 'Recouvrement type', 0, 1, 0, 
    'CTR_ALL.IDTRCVTYP', 0, NULL, 'Recouvrement type');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('3476', 'frmListeAFFAFF01', 'CTR_ALL', 'D4', 7, 
    'Adaptable field date 4', 'Adaptable field date 4', 0, 0, 0, 
    'TO_CHAR(CTR_ALL.D4,''DD/MM/YYYY'')', 0, NULL, 'Adaptable field date 4');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('3477', 'frmListeAFFAFF01', 'CTR_ALL', 'D5', 7, 
    'Adaptable field date 5', 'Adaptable field date 5', 0, 0, 0, 
    'TO_CHAR(CTR_ALL.D5,''DD/MM/YYYY'')', 0, NULL, 'Adaptable field date 5');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('3478', 'frmListeAFFAFF01', 'CTR_ALL', 'IDTCTR', 60, 
    'Point de livraison', 'Numero', 0, 1, 0, 
    'PNTLVR.IdtDcpGgr || PRMGNR.SprCdf || PNTLVR.NumOrd', 0, NULL, 'Numero');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('3479', 'frmListeAFFAFF01', 'CTR_ALL', 'IDTCLTSSC', 6, 
    'Client souscripteur', 'Code souscripteur', 0, 1, 0, 
    'CTR_ALL.IDTCLTSSC', 0, NULL, 'Code souscripteur');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('3480', 'frmListeAFFAFF01', 'CTR_ALL', 'IDTCODSNS', 6, 
    'Code sensibilité', 'Code sensibilité', 0, 1, 0, 
    'CTR_ALL.IDTCODSNS', 0, NULL, 'Code sensibilité');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('3481', 'frmListeAFFAFF01', 'CTR_ALL', 'NUMCPTBNC', 30, 
    'Bank account number', 'Compte', 0, 1, 0, 
    'CTR_ALL.NUMCPTBNC', 0, NULL, 'Compte');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('3482', 'frmListeAFFAFF01', 'CTR_ALL', 'T2', 6, 
    'Adaptable field typologie 2', 'Adaptable field typologie 2', 0, 0, 0, 
    'CTR_ALL.T2', 0, NULL, 'Adaptable field typologie 2');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('3483', 'frmListeAFFAFF01', 'CTR_ALL', 'C4', 22, 
    'Adaptable field check-box 4', 'Adaptable field check-box 4', 0, 0, 0, 
    'CTR_ALL.C4', 0, NULL, 'Adaptable field check-box 4');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('3484', 'frmListeAFFAFF01', 'CTR_ALL', 'D2', 7, 
    'Adaptable field date 2', 'Adaptable field date 2', 0, 0, 0, 
    'TO_CHAR(CTR_ALL.D2,''DD/MM/YYYY'')', 0, NULL, 'Adaptable field date 2');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('3485', 'frmListeAFFAFF01', 'CTR_ALL', 'DATCRT', 7, 
    'Creation date', 'Creation date', 0, 1, 0, 
    'TO_CHAR(CTR_ALL.DATCRT,''DD/MM/YYYY'')', 0, NULL, 'Creation date');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('3486', 'frmListeAFFAFF01', 'CTR_ALL', 'T3', 6, 
    'Adaptable field typologie 3', 'Adaptable field typologie 3', 0, 0, 0, 
    'CTR_ALL.T3', 0, NULL, 'Adaptable field typologie 3');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('3487', 'frmListeAFFAFF01', 'CTR_ALL', 'A1', 40, 
    'Adaptable field string 1', 'Adaptable field string 1', 0, 0, 0, 
    'CTR_ALL.A1', 0, NULL, 'Adaptable field string 1');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('3488', 'frmListeAFFAFF01', 'CTR_ALL', 'N3', 22, 
    'Adaptable field number 3', 'Adaptable field number 3', 0, 0, 0, 
    'CTR_ALL.N3', 0, NULL, 'Adaptable field number 3');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('3489', 'frmListeAFFAFF01', 'CTR_ALL', 'IDTPNTCPG', 6, 
    'Point de comptage', 'Point de comptage', 0, 1, 0, 
    'PNTCPG.IDTPNTCPG', 0, NULL, 'Point de comptage');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('3490', 'frmListeAFFAFF01', 'CTR_ALL', 'IDTCLTDST', 6, 
    'Addressee ID', 'Code destinataire', 0, 1, 0, 
    'CTR_ALL.IDTCLTDST', 0, NULL, 'Code destinataire');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('3491', 'frmListeAFFAFF01', 'CTR_ALL', 'MTFRSL', 15, 
    'Motive for termination', 'Motive for termination', 0, 1, 0, 
    'CTR_ALL.MTFRSL', 0, NULL, 'Motive for termination');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('3492', 'frmListeAFFAFF01', 'CTR_ALL', 'FINDRNPRDFCT', 7, 
    'Last billed period (ending date)', '????? ??? ????', 0, 1, 0, 
    'TO_CHAR(CTR_ALL.FINDRNPRDFCT,''DD/MM/YYYY'')', 0, NULL, '????? ??? ????');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('3493', 'frmListeAFFAFF01', 'CTR_ALL', 'SQCAVN', 22, 
    'Amendment serial number', 'Amendment serial number', 0, 1, 0, 
    'CTR_ALL.SQCAVN', 0, NULL, 'Amendment serial number');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('3494', 'frmListeAFFAFF01', 'CTR_ALL', 'C5', 22, 
    'Adaptable field check-box 5', 'Adaptable field check-box 5', 0, 0, 0, 
    'CTR_ALL.C5', 0, NULL, 'Adaptable field check-box 5');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('3495', 'frmListeAFFAFF01', 'CTR_ALL', 'DATSCR', 15, 
    'Souscrit le', 'Date de souscription', 0, 1, 0, 
    'TO_CHAR(CTR_ALL.DATSCR,''DD/MM/YYYY'')', 0, NULL, 'Date de souscription');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('3496', 'frmListeAFFAFF01', 'CTR_ALL', 'IDTT3', 6, 
    'Associated typology ID 3', 'Associated typology ID 3', 0, 0, 0, 
    'CTR_ALL.IDTT3', 0, NULL, 'Associated typology ID 3');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('3497', 'frmListeAFFAFF01', 'CTR_ALL', 'IDTT4', 6, 
    'Associated typology ID 4', 'Associated typology ID 4', 0, 0, 0, 
    'CTR_ALL.IDTT4', 0, NULL, 'Associated typology ID 4');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('3498', 'frmListeAFFAFF01', 'CTR_ALL', 'A2', 40, 
    'Adaptable field string 2', 'Adaptable field string 2', 0, 0, 0, 
    'CTR_ALL.A2', 0, NULL, 'Adaptable field string 2');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('3499', 'frmListeAFFAFF01', 'CTR_ALL', 'DEBDRNPRDFCT', 7, 
    'Last billed period (starting date)', 'Last billed period (starting date)', 0, 1, 0, 
    'TO_CHAR(CTR_ALL.DEBDRNPRDFCT,''DD/MM/YYYY'')', 0, NULL, 'Last billed period (starting date)');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('3500', 'frmListeAFFAFF01', 'CTR_ALL', 'IDTSRV', 22, 
    'Service ID (1 <WATER>, 2 <LV electricity>, 3 <MV electricity>, ...)', 'Service ID (1 <WATER>, 2 <LV electricity>, 3 <MV electricity>, ...)', 0, 1, 0, 
    'CTR_ALL.IDTSRV', 0, NULL, 'Service ID (1 <WATER>, 2 <LV electricity>, 3 <MV electricity>, ...)');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('3501', 'frmListeAFFAFF01', 'CTR_ALL', 'ETTCTR', 22, 
    'Contract status ( 1< normal>, 2<creation mode of the amendment>, 3<cancellation mode>, 4<creation mode>)', 'Contract status ( 1< normal>, 2<creation mode of the amendment>, 3<cancellation mode>, 4<creation mode>)', 0, 1, 0, 
    'CTR_ALL.ETTCTR', 0, NULL, 'Contract status ( 1< normal>, 2<creation mode of the amendment>, 3<cancellation mode>, 4<creation mode>)');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('3502', 'frmListeAFFAFF01', 'CTR_ALL', 'IDTT1', 6, 
    'Associated typology ID 1', 'Associated typology ID 1', 0, 0, 0, 
    'CTR_ALL.IDTT1', 0, NULL, 'Associated typology ID 1');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('3503', 'frmListeAFFAFF01', 'CTR_ALL', 'C1', 22, 
    'Adaptable field check-box 1', 'Adaptable field check-box 1', 0, 0, 0, 
    'CTR_ALL.C1', 0, NULL, 'Adaptable field check-box 1');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('3504', 'frmListeAFFAFF01', 'CTR_ALL', 'D1', 7, 
    'Adaptable field date 1', 'Adaptable field date 1', 0, 0, 0, 
    'TO_CHAR(CTR_ALL.D1,''DD/MM/YYYY'')', 0, NULL, 'Adaptable field date 1');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('3505', 'frmListeAFFAFF01', 'CTR_ALL', 'IDTCTR', 10, 
    'Numéro', 'Numero', 0, 1, 0, 
    'CTR_ALL.IDTCTR', 0, NULL, 'Numero');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('3506', 'frmListeAFFAFF01', 'CTR_ALL', 'IDTBNQ', 6, 
    'Banque', 'Banque', 0, 1, 0, 
    'CTR_ALL.IDTBNQ', 0, NULL, 'Banque');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('3507', 'frmListeAFFAFF01', 'INT', 'IDTMODCOU', 12, 
    'Code de la methode de coupure', 'Code de la methode de coupure', 0, 1, 0, 
    'INT.IDTMODCOU', 0, NULL, 'Code de la methode de coupure');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('3508', 'frmListeAFFAFF01', 'INT', 'DATEDTBI', 12, 
    'Date d''edition', 'Date d''edition', 0, 1, 0, 
    'TO_CHAR(INT.DATEDTBI,X7UTIL.FRMDATHM)', 0, NULL, 'Date d''edition');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('3509', 'frmListeAFFAFF01', 'INT', 'MTRAGT', 12, 
    'Agent', 'Agent', 0, 1, 0, 
    'INT.MTRAGT', 0, NULL, 'Agent');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('3510', 'frmListeAFFAFF01', 'INT', 'IDTCPRAVN', 12, 
    'Code avant intervention', 'Code avant intervention', 0, 1, 0, 
    'INT.IDTCPRAVN', 0, NULL, 'Code avant intervention');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('3511', 'frmListeAFFAFF01', 'INT', 'DATEXEPRV', 12, 
    'Prévue le', 'Prevue le', 0, 1, 0, 
    'TO_CHAR(INT.DATEXEPRV,X7UTIL.FRMDATHM)', 0, NULL, 'Prevue le');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('3512', 'frmListeAFFAFF01', 'INT', 'IDTCPRAPR', 12, 
    'Code apres intervention', 'Code apres intervention', 0, 1, 0, 
    'INT.IDTCPRAPR', 0, NULL, 'Code apres intervention');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('3513', 'frmListeAFFAFF01', 'INT', 'IDTCNTOPR', 12, 
    'CO', 'CO', 0, 1, 0, 
    'INT.IDTCNTOPR', 0, NULL, 'CO');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('3514', 'frmListeAFFAFF01', 'INT', 'IND1', 12, 
    'Lecture 1', 'Lecture 1', 0, 1, 0, 
    'INT.IND1', 0, NULL, 'Lecture 1');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('3515', 'frmListeAFFAFF01', 'INT', 'DATEFFEXE', 12, 
    'Executee le', 'Date de CRI', 0, 1, 0, 
    'TO_CHAR(INT.DATEFFEXE,X7UTIL.FRMDATHM)', 0, NULL, 'Date de CRI');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('3516', 'frmListeAFFAFF01', 'INT', 'IDTSTA', 12, 
    'Code du status', 'Code du status', 0, 1, 0, 
    'INT.IDTSTA', 0, NULL, 'Code du status');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('3517', 'frmListeAFFAFF01', 'INT', 'IND1APR', 12, 
    'Lecture 1 apres intervention', 'Lecture 1 apres intervention', 0, 1, 0, 
    'INT.IND1APR', 0, NULL, 'Lecture 1 apres intervention');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('3518', 'frmListeAFFAFF01', 'INT', 'IDTINT', 12, 
    'Numéro', 'Code', 0, 1, 0, 
    'INT.IDTINT', 0, NULL, 'Code');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('3519', 'frmListeAFFAFF01', 'INT', 'IDTPNTCPG', 12, 
    'Point de comptage', 'Point de comptage', 0, 1, 0, 
    'INT.IDTPNTCPG', 0, NULL, 'Point de comptage');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('3520', 'frmListeAFFAFF01', 'INT', 'DMTPNTCPG', 12, 
    'Diametre du point de comptage', 'Diametre du point de comptage', 0, 1, 0, 
    'INT.DMTPNTCPG', 0, NULL, 'Diametre du point de comptage');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('3521', 'frmListeAFFAFF01', 'INT', 'IND1AVN', 12, 
    'Lecture 1 avant intervention', 'Lecture 1 avant intervention', 0, 1, 0, 
    'INT.IND1AVN', 0, NULL, 'Lecture 1 avant intervention');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('3522', 'frmListeAFFAFF01', 'INT', 'DATDEM', 12, 
    'Date de demande', 'Date de demande', 0, 1, 0, 
    'TO_CHAR(INT.DATDEM,X7UTIL.FRMDATHM)', 0, NULL, 'Date de demande');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('3523', 'frmListeAFFAFF01', 'INT', 'DATPOSAVN', 12, 
    'Date d''installation avant intervention', 'Date d''installation avant intervention', 0, 1, 0, 
    'TO_CHAR(INT.DATPOSAVN,X7UTIL.FRMDAT)', 0, NULL, 'Date d''installation avant intervention');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('3524', 'frmListeAFFAFF01', 'INT', 'IDTMTFINTLIB', 12, 
    'Motif de l''intervention', 'Motif de l''intervention', 0, 1, 0, 
    '(SELECT M1.TypoStd FROM TYPOSTD M1 WHERE M1.IdtTypoStd = INT.IdtMtfInt AND M1.CodTypoStd = ''MTFINT'')', 0, NULL, 'Motif de l''intervention');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('3525', 'frmListeAFFAFF01', 'PNTCPG', 'IDTLOTFAC', 6, 
    'Lot de facturation', 'Lot de facturation', 0, 1, 0, 
    'PNTCPG.IDTLOTFAC', 0, NULL, 'Lot de facturation');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('3526', 'frmListeAFFAFF01', 'PNTCPG', 'PSSTRS', 22, 
    'Puissance du transformateur', 'Puissance du transformateur', 0, 0, 0, 
    'PNTCPG.PSSTRS', 0, NULL, 'Puissance du transformateur');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('3527', 'frmListeAFFAFF01', 'PNTCPG', 'DATDCN', 7, 
    'Date de deconnexion', 'Date de deconnexion', 0, 1, 0, 
    'TO_CHAR(PNTCPG.DATDCN,''DD/MM/YYYY'')', 0, NULL, 'Date de deconnexion');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('3528', 'frmListeAFFAFF01', 'PNTCPG', 'IDTT3', 6, 
    'Associated typology ID 3', 'Associated typology ID 3', 0, 0, 0, 
    'PNTCPG.IDTT3', 0, NULL, 'Associated typology ID 3');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('3529', 'frmListeAFFAFF01', 'PNTCPG', 'N4', 22, 
    'Adaptable field number 4', 'Adaptable field number 4', 0, 0, 0, 
    'PNTCPG.N4', 0, NULL, 'Adaptable field number 4');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('3530', 'frmListeAFFAFF01', 'PNTCPG', 'C3', 22, 
    'Adaptable field check-box 3', 'Adaptable field check-box 3', 0, 0, 0, 
    'PNTCPG.C3', 0, NULL, 'Adaptable field check-box 3');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('3531', 'frmListeAFFAFF01', 'PNTCPG', 'C5', 22, 
    'Adaptable field check-box 5', 'Adaptable field check-box 5', 0, 0, 0, 
    'PNTCPG.C5', 0, NULL, 'Adaptable field check-box 5');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('3532', 'frmListeAFFAFF01', 'PNTCPG', 'D1', 7, 
    'Adaptable field check-box 1', 'Adaptable field check-box 1', 0, 0, 0, 
    'TO_CHAR(PNTCPG.D1,''DD/MM/YYYY'')', 0, NULL, 'Adaptable field check-box 1');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('3533', 'frmListeAFFAFF01', 'PNTCPG', 'IDTSRV', 22, 
    'Service Id', 'Service Id', 0, 1, 0, 
    'PNTCPG.IDTSRV', 0, NULL, 'Service Id');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('3534', 'frmListeAFFAFF01', 'PNTCPG', 'ADRSTR5', 50, 
    'Description of structured address 5', 'Description of structured address 5', 0, 0, 0, 
    'PNTCPG.ADRSTR5', 0, NULL, 'Description of structured address 5');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('3535', 'frmListeAFFAFF01', 'PNTCPG', 'ADRSTR9', 50, 
    'Description of structured address 9', 'Description of structured address 9', 0, 0, 0, 
    'PNTCPG.ADRSTR9', 0, NULL, 'Description of structured address 9');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('3536', 'frmListeAFFAFF01', 'PNTCPG', 'IDTT2', 6, 
    'Associated typology ID 2', 'Associated typology ID 2', 0, 0, 0, 
    'PNTCPG.IDTT2', 0, NULL, 'Associated typology ID 2');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('3537', 'frmListeAFFAFF01', 'PNTCPG', 'IDTT5', 6, 
    'Associated typology ID 5', 'Associated typology ID 5', 0, 0, 0, 
    'PNTCPG.IDTT5', 0, NULL, 'Associated typology ID 5');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('3538', 'frmListeAFFAFF01', 'PNTCPG', 'A2', 40, 
    'Adaptable field string 2', 'Adaptable field string 2', 0, 0, 0, 
    'PNTCPG.A2', 0, NULL, 'Adaptable field string 2');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('3539', 'frmListeAFFAFF01', 'PNTCPG', 'N2', 22, 
    'Adaptable field number 2', 'Adaptable field number 2', 0, 0, 0, 
    'PNTCPG.N2', 0, NULL, 'Adaptable field number 2');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('3540', 'frmListeAFFAFF01', 'PNTCPG', 'D3', 7, 
    'Adaptable field check-box 3', 'Adaptable field check-box 3', 0, 0, 0, 
    'TO_CHAR(PNTCPG.D3,''DD/MM/YYYY'')', 0, NULL, 'Adaptable field check-box 3');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('3541', 'frmListeAFFAFF01', 'PNTCPG', 'FINDRNPRDRLV', 7, 
    'Fin de la dernière période théorique de relève', 'Fin de la dernière période théorique de relève', 0, 1, 0, 
    'TO_CHAR(PNTCPG.FINDRNPRDRLV,''DD/MM/YYYY'')', 0, NULL, 'Fin de la dernière période théorique de relève');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('3542', 'frmListeAFFAFF01', 'PNTCPG', 'IDTLOTRCS', 6, 
    'Lot recensement', 'Lot recensement', 0, 1, 0, 
    'PNTCPG.IDTLOTRCS', 0, NULL, 'Lot recensement');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('3543', 'frmListeAFFAFF01', 'PNTCPG', 'DEBDRNPRDRLV', 7, 
    'Début de période', 'Début de période', 0, 1, 0, 
    'TO_CHAR(PNTCPG.DEBDRNPRDRLV,''DD/MM/YYYY'')', 0, NULL, 'Début de période');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('3544', 'frmListeAFFAFF01', 'PNTCPG', 'DATMAJ', 7, 
    'Date de mise à jour', 'Date de mise à jour', 0, 1, 0, 
    'TO_CHAR(PNTCPG.DATMAJ,''DD/MM/YYYY'')', 0, NULL, 'Date de mise à jour');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('3545', 'frmListeAFFAFF01', 'PNTCPG', 'SCTCND', 22, 
    'Conductors section', 'Conductors section', 0, 1, 0, 
    'PNTCPG.SCTCND', 0, NULL, 'Conductors section');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('3546', 'frmListeAFFAFF01', 'PNTCPG', 'T3', 6, 
    'Adaptable field typologie 3', 'Adaptable field typologie 3', 0, 0, 0, 
    'PNTCPG.T3', 0, NULL, 'Adaptable field typologie 3');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('3547', 'frmListeAFFAFF01', 'PNTCPG', 'IDTT4', 6, 
    'Associated typology ID 4', 'Associated typology ID 4', 0, 0, 0, 
    'PNTCPG.IDTT4', 0, NULL, 'Associated typology ID 4');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('3548', 'frmListeAFFAFF01', 'PNTCPG', 'A3', 40, 
    'Adaptable field string 3', 'Adaptable field string 3', 0, 0, 0, 
    'PNTCPG.A3', 0, NULL, 'Adaptable field string 3');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('3549', 'frmListeAFFAFF01', 'PNTCPG', 'N3', 22, 
    'Adaptable field number 3', 'Adaptable field number 3', 0, 0, 0, 
    'PNTCPG.N3', 0, NULL, 'Adaptable field number 3');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('3550', 'frmListeAFFAFF01', 'PNTCPG', 'ADRSTR6', 50, 
    'Description of structured address 6', 'Description of structured address 6', 0, 0, 0, 
    'PNTCPG.ADRSTR6', 0, NULL, 'Description of structured address 6');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('3551', 'frmListeAFFAFF01', 'PNTCPG', 'ADRSTR7', 50, 
    'Description of structured address 7', 'Description of structured address 7', 0, 0, 0, 
    'PNTCPG.ADRSTR7', 0, NULL, 'Description of structured address 7');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('3552', 'frmListeAFFAFF01', 'PNTCPG', 'DATCNN', 7, 
    'Date de connexion', 'Date de connexion', 0, 1, 0, 
    'TO_CHAR(PNTCPG.DATCNN,''DD/MM/YYYY'')', 0, NULL, 'Date de connexion');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('3553', 'frmListeAFFAFF01', 'PNTCPG', 'RNG1', 22, 
    'Rang', 'Rang', 0, 1, 0, 
    'PNTCPG.RNG1', 0, NULL, 'Rang');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('3814', 'frmListeAFFACT01', 'CTR_ALL', 'IDTRCVTYP', 6, 
    'Debt recovery type ID', 'Recouvrement type', 0, 1, 0, 
    'CTR_ALL.IDTRCVTYP', 0, NULL, 'Recouvrement type');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('3815', 'frmListeAFFACT01', 'CTR_ALL', 'T1', 6, 
    'Adaptable field typologie 1', 'Adaptable field typologie 1', 0, 0, 0, 
    'CTR_ALL.T1', 0, NULL, 'Adaptable field typologie 1');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('3816', 'frmListeAFFACT01', 'CTR_ALL', 'C3', 22, 
    'Adaptable field check-box 3', 'Adaptable field check-box 3', 0, 0, 0, 
    'CTR_ALL.C3', 0, NULL, 'Adaptable field check-box 3');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('3817', 'frmListeAFFACT01', 'CTR_ALL', 'D1', 7, 
    'Adaptable field date 1', 'Adaptable field date 1', 0, 0, 0, 
    'TO_CHAR(CTR_ALL.D1,''DD/MM/YYYY'')', 0, NULL, 'Adaptable field date 1');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('3818', 'frmListeAFFACT01', 'CTR_ALL', 'DATSCR', 15, 
    'Souscrit le', 'Date de souscription', 0, 1, 0, 
    'TO_CHAR(CTR_ALL.DATSCR,''DD/MM/YYYY'')', 0, NULL, 'Date de souscription');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('3819', 'frmListeAFFACT01', 'CTR_ALL', 'T5', 6, 
    'Adaptable field typologie 5', 'Adaptable field typologie 5', 0, 0, 0, 
    'CTR_ALL.T5', 0, NULL, 'Adaptable field typologie 5');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('3820', 'frmListeAFFACT01', 'CTR_ALL', 'IDTT5', 6, 
    'Associated typology ID 5', 'Associated typology ID 5', 0, 0, 0, 
    'CTR_ALL.IDTT5', 0, NULL, 'Associated typology ID 5');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('3821', 'frmListeAFFACT01', 'CTR_ALL', 'N3', 22, 
    'Adaptable field number 3', 'Adaptable field number 3', 0, 0, 0, 
    'CTR_ALL.N3', 0, NULL, 'Adaptable field number 3');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('3822', 'frmListeAFFACT01', 'CTR_ALL', 'IDTT1', 6, 
    'Associated typology ID 1', 'Associated typology ID 1', 0, 0, 0, 
    'CTR_ALL.IDTT1', 0, NULL, 'Associated typology ID 1');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('3823', 'frmListeAFFACT01', 'CTR_ALL', 'C2', 22, 
    'Adaptable field check-box 2', 'Adaptable field check-box 2', 0, 0, 0, 
    'CTR_ALL.C2', 0, NULL, 'Adaptable field check-box 2');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('3824', 'frmListeAFFACT01', 'CTR_ALL', 'D5', 7, 
    'Adaptable field date 5', 'Adaptable field date 5', 0, 0, 0, 
    'TO_CHAR(CTR_ALL.D5,''DD/MM/YYYY'')', 0, NULL, 'Adaptable field date 5');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('3825', 'frmListeAFFACT01', 'CTR_ALL', 'IDTGCH', 6, 
    'Counter ID', 'Counter ID', 0, 1, 0, 
    'CTR_ALL.IDTGCH', 0, NULL, 'Counter ID');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('3826', 'frmListeAFFACT01', 'CTR_ALL', 'PRPCPTBNC', 40, 
    'Bank account owner', 'Bank account owner', 0, 1, 0, 
    'CTR_ALL.PRPCPTBNC', 0, NULL, 'Bank account owner');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('3827', 'frmListeAFFACT01', 'CTR_ALL', 'IDTT2', 6, 
    'Associated typology ID 2', 'Associated typology ID 2', 0, 0, 0, 
    'CTR_ALL.IDTT2', 0, NULL, 'Associated typology ID 2');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('3828', 'frmListeAFFACT01', 'CTR_ALL', 'IDTT3', 6, 
    'Associated typology ID 3', 'Associated typology ID 3', 0, 0, 0, 
    'CTR_ALL.IDTT3', 0, NULL, 'Associated typology ID 3');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('3829', 'frmListeAFFACT01', 'CTR_ALL', 'IDTCTR', 60, 
    'Point de livraison', 'Numero', 0, 1, 0, 
    'PNTLVR.IdtDcpGgr || PRMGNR.SprCdf || PNTLVR.NumOrd', 0, NULL, 'Numero');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('3830', 'frmListeAFFACT01', 'CTR_ALL', 'IDTCLTSSC', 6, 
    'Client souscripteur', 'Code souscripteur', 0, 1, 0, 
    'CTR_ALL.IDTCLTSSC', 0, NULL, 'Code souscripteur');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('3831', 'frmListeAFFACT01', 'CTR_ALL', 'DEBDRNPRDFCT', 7, 
    'Last billed period (starting date)', 'Last billed period (starting date)', 0, 1, 0, 
    'TO_CHAR(CTR_ALL.DEBDRNPRDFCT,''DD/MM/YYYY'')', 0, NULL, 'Last billed period (starting date)');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('3832', 'frmListeAFFACT01', 'CTR_ALL', 'IDTSQCGNR', 22, 
    'General identifier', 'General identifier', 0, 1, 0, 
    'CTR_ALL.IDTSQCGNR', 0, NULL, 'General identifier');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('3833', 'frmListeAFFACT01', 'CTR_ALL', 'C5', 22, 
    'Adaptable field check-box 5', 'Adaptable field check-box 5', 0, 0, 0, 
    'CTR_ALL.C5', 0, NULL, 'Adaptable field check-box 5');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('3834', 'frmListeAFFACT01', 'CTR_ALL', 'T3', 6, 
    'Adaptable field typologie 3', 'Adaptable field typologie 3', 0, 0, 0, 
    'CTR_ALL.T3', 0, NULL, 'Adaptable field typologie 3');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('3835', 'frmListeAFFACT01', 'CTR_ALL', 'A3', 40, 
    'Adaptable field string 3', 'Adaptable field string 3', 0, 0, 0, 
    'CTR_ALL.A3', 0, NULL, 'Adaptable field string 3');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('3836', 'frmListeAFFACT01', 'CTR_ALL', 'N5', 22, 
    'Adaptable field number 5', 'Adaptable field number 5', 0, 0, 0, 
    'CTR_ALL.N5', 0, NULL, 'Adaptable field number 5');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('3837', 'frmListeAFFACT01', 'CTR_ALL', 'FINDRNPRDFCT', 7, 
    'Last billed period (ending date)', '????? ??? ????', 0, 1, 0, 
    'TO_CHAR(CTR_ALL.FINDRNPRDFCT,''DD/MM/YYYY'')', 0, NULL, '????? ??? ????');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('3838', 'frmListeAFFACT01', 'CTR_ALL', 'CODTYPCTR', 6, 
    'Type of contract code', 'Type de contrat', 0, 1, 0, 
    'CTR_ALL.CODTYPCTR', 0, NULL, 'Type de contrat');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('3839', 'frmListeAFFACT01', 'CTR_ALL', 'ANCRFR', 20, 
    'Ancienne reference', 'Ancienne reference', 0, 1, 0, 
    'CTR_ALL.ANCRFR', 0, NULL, 'Ancienne reference');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('3840', 'frmListeAFFACT01', 'CTR_ALL', 'MTRAGT', 6, 
    'ID of the employee who carries out updating', 'ID of the employee who carries out updating', 0, 1, 0, 
    'CTR_ALL.MTRAGT', 0, NULL, 'ID of the employee who carries out updating');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('3841', 'frmListeAFFACT01', 'CTR_ALL', 'N4', 22, 
    'Adaptable field number 4', 'Adaptable field number 4', 0, 0, 0, 
    'CTR_ALL.N4', 0, NULL, 'Adaptable field number 4');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('3842', 'frmListeAFFACT01', 'CTR_ALL', 'DATDRNFCT', 7, 
    'Date of last billing of the contract', 'Date de derniere facturation', 0, 1, 0, 
    'TO_CHAR(CTR_ALL.DATDRNFCT,''DD/MM/YYYY'')', 0, NULL, 'Date de derniere facturation');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('3843', 'frmListeAFFACT01', 'CTR_ALL', 'D2', 7, 
    'Adaptable field date 2', 'Adaptable field date 2', 0, 0, 0, 
    'TO_CHAR(CTR_ALL.D2,''DD/MM/YYYY'')', 0, NULL, 'Adaptable field date 2');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('3844', 'frmListeAFFACT01', 'CTR_ALL', 'D3', 7, 
    'Adaptable field date 3', 'Adaptable field date 3', 0, 0, 0, 
    'TO_CHAR(CTR_ALL.D3,''DD/MM/YYYY'')', 0, NULL, 'Adaptable field date 3');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('3845', 'frmListeAFFACT01', 'CTR_ALL', 'DATCRT', 7, 
    'Creation date', 'Creation date', 0, 1, 0, 
    'TO_CHAR(CTR_ALL.DATCRT,''DD/MM/YYYY'')', 0, NULL, 'Creation date');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('3846', 'frmListeAFFACT01', 'CTR_ALL', 'A4', 40, 
    'Adaptable field string 4', 'Adaptable field string 4', 0, 0, 0, 
    'CTR_ALL.A4', 0, NULL, 'Adaptable field string 4');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('3847', 'frmListeAFFACT01', 'CTR_ALL', 'NUMINTER', 22, 
    'Work order number', 'Work order number', 0, 1, 0, 
    'CTR_ALL.NUMINTER', 0, NULL, 'Work order number');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('3848', 'frmListeAFFACT01', 'CTR_ALL', 'IDTBNQ', 6, 
    'Banque', 'Banque', 0, 1, 0, 
    'CTR_ALL.IDTBNQ', 0, NULL, 'Banque');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('3849', 'frmListeAFFACT01', 'CTR_ALL', 'C1', 22, 
    'Adaptable field check-box 1', 'Adaptable field check-box 1', 0, 0, 0, 
    'CTR_ALL.C1', 0, NULL, 'Adaptable field check-box 1');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('3850', 'frmListeAFFACT01', 'CTR_ALL', 'D4', 7, 
    'Adaptable field date 4', 'Adaptable field date 4', 0, 0, 0, 
    'TO_CHAR(CTR_ALL.D4,''DD/MM/YYYY'')', 0, NULL, 'Adaptable field date 4');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('3851', 'frmListeAFFACT01', 'CTR_ALL', 'ETTCTRFCT', 22, 
    'Billing status of contract (1<normal>, 2<computation mode>, 3<validation mode>, 4<periodical billing on going>)', 'Billing status of contract (1<normal>, 2<computation mode>, 3<validation mode>, 4<periodical billing on going>)', 0, 1, 0, 
    'CTR_ALL.ETTCTRFCT', 0, NULL, 'Billing status of contract (1<normal>, 2<computation mode>, 3<validation mode>, 4<periodical billing on going>)');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('3852', 'frmListeAFFACT01', 'CTR_ALL', 'T4', 6, 
    'Adaptable field typologie 4', 'Adaptable field typologie 4', 0, 0, 0, 
    'CTR_ALL.T4', 0, NULL, 'Adaptable field typologie 4');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('3853', 'frmListeAFFACT01', 'CTR_ALL', 'A1', 40, 
    'Adaptable field string 1', 'Adaptable field string 1', 0, 0, 0, 
    'CTR_ALL.A1', 0, NULL, 'Adaptable field string 1');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('3854', 'frmListeAFFACT01', 'CTR_ALL', 'A2', 40, 
    'Adaptable field string 2', 'Adaptable field string 2', 0, 0, 0, 
    'CTR_ALL.A2', 0, NULL, 'Adaptable field string 2');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('3855', 'frmListeAFFACT01', 'CTR_ALL', 'N2', 22, 
    'Adaptable field number 2', 'Adaptable field number 2', 0, 0, 0, 
    'CTR_ALL.N2', 0, NULL, 'Adaptable field number 2');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('3856', 'frmListeAFFACT01', 'CTR_ALL', 'IDTPNTCPG', 6, 
    'Point de comptage', 'Point de comptage', 0, 1, 0, 
    'PNTCPG.IDTPNTCPG', 0, NULL, 'Point de comptage');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('3857', 'frmListeAFFACT01', 'CTR_ALL', 'IDTPNTCPG', 22, 
    'Metering point ID', 'Metering point ID', 0, 1, 0, 
    'CTR_ALL.IDTPNTCPG', 0, NULL, 'Metering point ID');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('3858', 'frmListeAFFACT01', 'CTR_ALL', 'IDTCLTDST', 6, 
    'Addressee ID', 'Code destinataire', 0, 1, 0, 
    'CTR_ALL.IDTCLTDST', 0, NULL, 'Code destinataire');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('3859', 'frmListeAFFACT01', 'CTR_ALL', 'DATRSL', 7, 
    'Résilié le', 'Date de resiliation', 0, 1, 0, 
    'TO_CHAR(CTR_ALL.DATRSL,''DD/MM/YYYY'')', 0, NULL, 'Date de resiliation');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('3860', 'frmListeAFFACT01', 'CTR_ALL', 'MTFRSL', 15, 
    'Motive for termination', 'Motive for termination', 0, 1, 0, 
    'CTR_ALL.MTFRSL', 0, NULL, 'Motive for termination');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('3861', 'frmListeAFFACT01', 'CTR_ALL', 'SQCAVN', 22, 
    'Amendment serial number', 'Amendment serial number', 0, 1, 0, 
    'CTR_ALL.SQCAVN', 0, NULL, 'Amendment serial number');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('3862', 'frmListeAFFACT01', 'CTR_ALL', 'IDTSRV', 22, 
    'Service ID (1 <WATER>, 2 <LV electricity>, 3 <MV electricity>, ...)', 'Service ID (1 <WATER>, 2 <LV electricity>, 3 <MV electricity>, ...)', 0, 1, 0, 
    'CTR_ALL.IDTSRV', 0, NULL, 'Service ID (1 <WATER>, 2 <LV electricity>, 3 <MV electricity>, ...)');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('3863', 'frmListeAFFACT01', 'CTR_ALL', 'ETTCTR', 22, 
    'Contract status ( 1< normal>, 2<creation mode of the amendment>, 3<cancellation mode>, 4<creation mode>)', 'Contract status ( 1< normal>, 2<creation mode of the amendment>, 3<cancellation mode>, 4<creation mode>)', 0, 1, 0, 
    'CTR_ALL.ETTCTR', 0, NULL, 'Contract status ( 1< normal>, 2<creation mode of the amendment>, 3<cancellation mode>, 4<creation mode>)');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('3864', 'frmListeAFFACT01', 'CTR_ALL', 'CLERIB', 2, 
    'Bank account code', 'Bank account code', 0, 1, 0, 
    'CTR_ALL.CLERIB', 0, NULL, 'Bank account code');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('3865', 'frmListeAFFACT01', 'CTR_ALL', 'C4', 22, 
    'Adaptable field check-box 4', 'Adaptable field check-box 4', 0, 0, 0, 
    'CTR_ALL.C4', 0, NULL, 'Adaptable field check-box 4');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('3866', 'frmListeAFFACT01', 'CTR_ALL', 'DATMAJ', 7, 
    'Date de mise à jour', 'Date de mise à jour', 0, 1, 0, 
    'TO_CHAR(CTR_ALL.DATMAJ,''DD/MM/YYYY'')', 0, NULL, 'Date de mise à jour');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('3867', 'frmListeAFFACT01', 'INT', 'DATEDTBI', 12, 
    'Date d''edition', 'Date d''edition', 0, 1, 0, 
    'TO_CHAR(INT.DATEDTBI,X7UTIL.FRMDATHM)', 0, NULL, 'Date d''edition');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('3868', 'frmListeAFFACT01', 'INT', 'IDTCPRAPR', 12, 
    'Code apres intervention', 'Code apres intervention', 0, 1, 0, 
    'INT.IDTCPRAPR', 0, NULL, 'Code apres intervention');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('3869', 'frmListeAFFACT01', 'INT', 'IDTPNTCPG', 12, 
    'Point de comptage', 'Point de comptage', 0, 1, 0, 
    'INT.IDTPNTCPG', 0, NULL, 'Point de comptage');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('3870', 'frmListeAFFACT01', 'INT', 'IDTCNTOPR', 12, 
    'CO', 'CO', 0, 1, 0, 
    'INT.IDTCNTOPR', 0, NULL, 'CO');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('3871', 'frmListeAFFACT01', 'INT', 'IDTSTA', 12, 
    'Code du status', 'Code du status', 0, 1, 0, 
    'INT.IDTSTA', 0, NULL, 'Code du status');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('4052', 'frmListeCLTOPR01', 'CTR_ALL', 'D3', 7, 
    'Adaptable field date 3', 'Adaptable field date 3', 0, 0, 0, 
    'TO_CHAR(CTR_ALL.D3,''DD/MM/YYYY'')', 0, NULL, 'Adaptable field date 3');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('4053', 'frmListeCLTOPR01', 'CTR_ALL', 'IDTT3', 6, 
    'Associated typology ID 3', 'Associated typology ID 3', 0, 0, 0, 
    'CTR_ALL.IDTT3', 0, NULL, 'Associated typology ID 3');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('4054', 'frmListeCLTOPR01', 'CTR_ALL', 'A3', 40, 
    'Adaptable field string 3', 'Adaptable field string 3', 0, 0, 0, 
    'CTR_ALL.A3', 0, NULL, 'Adaptable field string 3');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('4055', 'frmListeCLTOPR01', 'CTR_ALL', 'NUMCPTBNC', 30, 
    'Bank account number', 'Compte', 0, 1, 0, 
    'CTR_ALL.NUMCPTBNC', 0, NULL, 'Compte');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('4056', 'frmListeCLTOPR01', 'CTR_ALL', 'ANCRFR', 20, 
    'Ancienne reference', 'Ancienne reference', 0, 1, 0, 
    'CTR_ALL.ANCRFR', 0, NULL, 'Ancienne reference');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('4057', 'frmListeCLTOPR01', 'CTR_ALL', 'MTRAGT', 6, 
    'ID of the employee who carries out updating', 'ID of the employee who carries out updating', 0, 1, 0, 
    'CTR_ALL.MTRAGT', 0, NULL, 'ID of the employee who carries out updating');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('4058', 'frmListeCLTOPR01', 'CTR_ALL', 'IDTT2', 6, 
    'Associated typology ID 2', 'Associated typology ID 2', 0, 0, 0, 
    'CTR_ALL.IDTT2', 0, NULL, 'Associated typology ID 2');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('4059', 'frmListeCLTOPR01', 'CTR_ALL', 'T5', 6, 
    'Adaptable field typologie 5', 'Adaptable field typologie 5', 0, 0, 0, 
    'CTR_ALL.T5', 0, NULL, 'Adaptable field typologie 5');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('4060', 'frmListeCLTOPR01', 'CTR_ALL', 'A1', 40, 
    'Adaptable field string 1', 'Adaptable field string 1', 0, 0, 0, 
    'CTR_ALL.A1', 0, NULL, 'Adaptable field string 1');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('4061', 'frmListeCLTOPR01', 'CTR_ALL', 'IDTCODSNS', 6, 
    'Code sensibilité', 'Code sensibilité', 0, 1, 0, 
    'CTR_ALL.IDTCODSNS', 0, NULL, 'Code sensibilité');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('4062', 'frmListeCLTOPR01', 'CTR_ALL', 'DPTGRN', 22, 
    'Deposit', 'Depot de garantie', 0, 1, 0, 
    'CTR_ALL.DPTGRN', 0, NULL, 'Depot de garantie');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('4063', 'frmListeCLTOPR01', 'CTR_ALL', 'CODTYPCTR', 6, 
    'Type of contract code', 'Type de contrat', 0, 1, 0, 
    'CTR_ALL.CODTYPCTR', 0, NULL, 'Type de contrat');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('4064', 'frmListeCLTOPR01', 'CTR_ALL', 'C5', 22, 
    'Adaptable field check-box 5', 'Adaptable field check-box 5', 0, 0, 0, 
    'CTR_ALL.C5', 0, NULL, 'Adaptable field check-box 5');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('4065', 'frmListeCLTOPR01', 'CTR_ALL', 'IDTT5', 6, 
    'Associated typology ID 5', 'Associated typology ID 5', 0, 0, 0, 
    'CTR_ALL.IDTT5', 0, NULL, 'Associated typology ID 5');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('4066', 'frmListeCLTOPR01', 'CTR_ALL', 'N1', 22, 
    'Adaptable field number 1', 'Adaptable field number 1', 0, 0, 0, 
    'CTR_ALL.N1', 0, NULL, 'Adaptable field number 1');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('4067', 'frmListeCLTOPR01', 'CTR_ALL', 'IDTPNTLVR', 22, 
    'Delivery point ID', 'Delivery point ID', 0, 1, 0, 
    'CTR_ALL.IDTPNTLVR', 0, NULL, 'Delivery point ID');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('4068', 'frmListeCLTOPR01', 'CTR_ALL', 'NUMINTER', 22, 
    'Work order number', 'Work order number', 0, 1, 0, 
    'CTR_ALL.NUMINTER', 0, NULL, 'Work order number');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('4069', 'frmListeCLTOPR01', 'CTR_ALL', 'IDTBNQ', 6, 
    'Banque', 'Banque', 0, 1, 0, 
    'CTR_ALL.IDTBNQ', 0, NULL, 'Banque');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('4070', 'frmListeCLTOPR01', 'CTR_ALL', 'CLERIB', 2, 
    'Bank account code', 'Bank account code', 0, 1, 0, 
    'CTR_ALL.CLERIB', 0, NULL, 'Bank account code');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('4071', 'frmListeCLTOPR01', 'CTR_ALL', 'T1', 6, 
    'Adaptable field typologie 1', 'Adaptable field typologie 1', 0, 0, 0, 
    'CTR_ALL.T1', 0, NULL, 'Adaptable field typologie 1');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('4072', 'frmListeCLTOPR01', 'CTR_ALL', 'D5', 7, 
    'Adaptable field date 5', 'Adaptable field date 5', 0, 0, 0, 
    'TO_CHAR(CTR_ALL.D5,''DD/MM/YYYY'')', 0, NULL, 'Adaptable field date 5');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('4073', 'frmListeCLTOPR01', 'CTR_ALL', 'DATSCR', 15, 
    'Souscrit le', 'Date de souscription', 0, 1, 0, 
    'TO_CHAR(CTR_ALL.DATSCR,''DD/MM/YYYY'')', 0, NULL, 'Date de souscription');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('4074', 'frmListeCLTOPR01', 'CTR_ALL', 'PRPCPTBNC', 40, 
    'Bank account owner', 'Bank account owner', 0, 1, 0, 
    'CTR_ALL.PRPCPTBNC', 0, NULL, 'Bank account owner');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('4075', 'frmListeCLTOPR01', 'CTR_ALL', 'A2', 40, 
    'Adaptable field string 2', 'Adaptable field string 2', 0, 0, 0, 
    'CTR_ALL.A2', 0, NULL, 'Adaptable field string 2');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('4076', 'frmListeCLTOPR01', 'CTR_ALL', 'A5', 40, 
    'Adaptable field string 5', 'Adaptable field string 5', 0, 0, 0, 
    'CTR_ALL.A5', 0, NULL, 'Adaptable field string 5');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('4077', 'frmListeCLTOPR01', 'CTR_ALL', 'IDTPNTCPG', 6, 
    'Point de comptage', 'Point de comptage', 0, 1, 0, 
    'PNTCPG.IDTPNTCPG', 0, NULL, 'Point de comptage');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('4078', 'frmListeCLTOPR01', 'CTR_ALL', 'IDTLOTFAC', 6, 
    'Billing batch ID', 'Lot de facturation', 0, 1, 0, 
    'CTR_ALL.IDTLOTFAC', 0, NULL, 'Lot de facturation');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('4079', 'frmListeCLTOPR01', 'CTR_ALL', 'IDTCNTOPR', 6, 
    'Centre opérationel', 'Centre opérationel', 0, 1, 0, 
    'CTR_ALL.IDTCNTOPR', 0, NULL, 'Centre opérationel');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('4080', 'frmListeCLTOPR01', 'CTR_ALL', 'MTFRSL', 15, 
    'Motive for termination', 'Motive for termination', 0, 1, 0, 
    'CTR_ALL.MTFRSL', 0, NULL, 'Motive for termination');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('4081', 'frmListeCLTOPR01', 'CTR_ALL', 'FINDRNPRDFCT', 7, 
    'Last billed period (ending date)', '????? ??? ????', 0, 1, 0, 
    'TO_CHAR(CTR_ALL.FINDRNPRDFCT,''DD/MM/YYYY'')', 0, NULL, '????? ??? ????');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('4082', 'frmListeCLTOPR01', 'CTR_ALL', 'C1', 22, 
    'Adaptable field check-box 1', 'Adaptable field check-box 1', 0, 0, 0, 
    'CTR_ALL.C1', 0, NULL, 'Adaptable field check-box 1');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('4083', 'frmListeCLTOPR01', 'CTR_ALL', 'T3', 6, 
    'Adaptable field typologie 3', 'Adaptable field typologie 3', 0, 0, 0, 
    'CTR_ALL.T3', 0, NULL, 'Adaptable field typologie 3');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('4084', 'frmListeCLTOPR01', 'CTR_ALL', 'A4', 40, 
    'Adaptable field string 4', 'Adaptable field string 4', 0, 0, 0, 
    'CTR_ALL.A4', 0, NULL, 'Adaptable field string 4');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('4085', 'frmListeCLTOPR01', 'CTR_ALL', 'N4', 22, 
    'Adaptable field number 4', 'Adaptable field number 4', 0, 0, 0, 
    'CTR_ALL.N4', 0, NULL, 'Adaptable field number 4');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('4086', 'frmListeCLTOPR01', 'CTR_ALL', 'N5', 22, 
    'Adaptable field number 5', 'Adaptable field number 5', 0, 0, 0, 
    'CTR_ALL.N5', 0, NULL, 'Adaptable field number 5');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('4087', 'frmListeCLTOPR01', 'CTR_ALL', 'IDTCTR', 60, 
    'Point de livraison', 'Numero', 0, 1, 0, 
    'PNTLVR.IdtDcpGgr || PRMGNR.SprCdf || PNTLVR.NumOrd', 0, NULL, 'Numero');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('4088', 'frmListeCLTOPR01', 'CTR_ALL', 'DATRSL', 7, 
    'Résilié le', 'Date de resiliation', 0, 1, 0, 
    'TO_CHAR(CTR_ALL.DATRSL,''DD/MM/YYYY'')', 0, NULL, 'Date de resiliation');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('4089', 'frmListeCLTOPR01', 'CTR_ALL', 'DATDRNFCT', 7, 
    'Date of last billing of the contract', 'Date de derniere facturation', 0, 1, 0, 
    'TO_CHAR(CTR_ALL.DATDRNFCT,''DD/MM/YYYY'')', 0, NULL, 'Date de derniere facturation');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('4090', 'frmListeCLTOPR01', 'CTR_ALL', 'SQCAVN', 22, 
    'Amendment serial number', 'Amendment serial number', 0, 1, 0, 
    'CTR_ALL.SQCAVN', 0, NULL, 'Amendment serial number');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('4091', 'frmListeCLTOPR01', 'CTR_ALL', 'IDTSRV', 22, 
    'Service ID (1 <WATER>, 2 <LV electricity>, 3 <MV electricity>, ...)', 'Service ID (1 <WATER>, 2 <LV electricity>, 3 <MV electricity>, ...)', 0, 1, 0, 
    'CTR_ALL.IDTSRV', 0, NULL, 'Service ID (1 <WATER>, 2 <LV electricity>, 3 <MV electricity>, ...)');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('4092', 'frmListeCLTOPR01', 'CTR_ALL', 'IDTSQCGNR', 22, 
    'General identifier', 'General identifier', 0, 1, 0, 
    'CTR_ALL.IDTSQCGNR', 0, NULL, 'General identifier');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('4093', 'frmListeCLTOPR01', 'CTR_ALL', 'DATCRT', 7, 
    'Creation date', 'Creation date', 0, 1, 0, 
    'TO_CHAR(CTR_ALL.DATCRT,''DD/MM/YYYY'')', 0, NULL, 'Creation date');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('4094', 'frmListeCLTOPR01', 'CTR_ALL', 'ETTCTRFCT', 22, 
    'Billing status of contract (1<normal>, 2<computation mode>, 3<validation mode>, 4<periodical billing on going>)', 'Billing status of contract (1<normal>, 2<computation mode>, 3<validation mode>, 4<periodical billing on going>)', 0, 1, 0, 
    'CTR_ALL.ETTCTRFCT', 0, NULL, 'Billing status of contract (1<normal>, 2<computation mode>, 3<validation mode>, 4<periodical billing on going>)');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('4095', 'frmListeCLTOPR01', 'CTR_ALL', 'IDTGCH', 6, 
    'Counter ID', 'Counter ID', 0, 1, 0, 
    'CTR_ALL.IDTGCH', 0, NULL, 'Counter ID');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('4096', 'frmListeCLTOPR01', 'CLT', 'IDTCNTOPR', 6, 
    'Centre operationnel', 'Centre operationnel', 0, 1, 0, 
    'CLT.IDTCNTOPR', 0, NULL, 'Centre operationnel');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('4097', 'frmListeCLTOPR01', 'CLT', 'IDTCTR', 10, 
    'Contract ID', 'Contract ID', 0, 1, 0, 
    'CLT.IDTCTR', 0, NULL, 'Contract ID');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('4098', 'frmListeCLTOPR01', 'CLT', 'NUMAVN', 22, 
    'Numéro d''avenant', 'avenant', 0, 1, 0, 
    'CLT.NUMAVN', 0, NULL, 'avenant');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('4099', 'frmListeCLTOPR01', 'CLT', 'DATMAJ', 7, 
    'Date de mise a jour', 'Date de mise a jour', 0, 1, 0, 
    'TO_CHAR(CLT.DATMAJ,''DD/MM/YYYY'')', 0, NULL, 'Date de mise a jour');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('4100', 'frmListeCLTOPR01', 'CLT', 'NOM', 40, 
    'Nom', 'Nom', 0, 1, 0, 
    'CLT.NOM', 0, NULL, 'Nom');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('4101', 'frmListeCLTOPR01', 'CLT', 'QLTPYR', 2, 
    'Qualite payeur', 'Qualite payeur', 0, 1, 0, 
    'CLT.QLTPYR', 0, NULL, 'Qualite payeur');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('4102', 'frmListeCLTOPR01', 'CLT', 'T1', 6, 
    'Adaptable field typology 1', 'Adaptable field typology 1', 0, 0, 0, 
    'CLT.T1', 0, NULL, 'Adaptable field typology 1');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('4103', 'frmListeCLTOPR01', 'CLT', 'N2', 22, 
    'Adaptable field number 2', 'Adaptable field number 2', 0, 0, 0, 
    'CLT.N2', 0, NULL, 'Adaptable field number 2');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('4104', 'frmListeCLTOPR01', 'CLT', 'N5', 22, 
    'Adaptable field number 5', 'Adaptable field number 5', 0, 0, 0, 
    'CLT.N5', 0, NULL, 'Adaptable field number 5');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('4105', 'frmListeCLTOPR01', 'CLT', 'C3', 22, 
    'Adaptable field check-box 3', 'Adaptable field check-box 3', 0, 0, 0, 
    'CLT.C3', 0, NULL, 'Adaptable field check-box 3');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('4106', 'frmListeCLTOPR01', 'CLT', 'D2', 7, 
    'Adaptable field date 2', 'Adaptable field date 2', 0, 0, 0, 
    'TO_CHAR(CLT.D2,''DD/MM/YYYY'')', 0, NULL, 'Adaptable field date 2');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('4107', 'frmListeCLTOPR01', 'CLT', 'ADRSTR8', 50, 
    'Description of structured address 8', 'Description of structured address 8', 0, 0, 0, 
    'CLT.ADRSTR8', 0, NULL, 'Description of structured address 8');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('4108', 'frmListeCLTOPR01', 'CLT', 'IDTPRMCTR', 10, 
    'Code du premier contrat', 'Code du premier contrat', 0, 1, 0, 
    'CLT.IDTPRMCTR', 0, NULL, 'Code du premier contrat');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('4109', 'frmListeCLTOPR01', 'CLT', 'IDTSQCGNR', 22, 
    'General identifier', 'General identifier', 0, 0, 0, 
    'CLT.IDTSQCGNR', 0, NULL, 'General identifier');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('4110', 'frmListeCLTOPR01', 'CLT', 'T3', 6, 
    'Adaptable field typology 3', 'Adaptable field typology 3', 0, 0, 0, 
    'CLT.T3', 0, NULL, 'Adaptable field typology 3');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('4111', 'frmListeCLTOPR01', 'CLT', 'IDTT3', 6, 
    'Associated typology ID 3', 'Associated typology ID 3', 0, 0, 0, 
    'CLT.IDTT3', 0, NULL, 'Associated typology ID 3');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('4112', 'frmListeCLTOPR01', 'CLT', 'T4', 6, 
    'Adaptable field typology 4', 'Adaptable field typology 4', 0, 0, 0, 
    'CLT.T4', 0, NULL, 'Adaptable field typology 4');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('4113', 'frmListeCLTOPR01', 'CLT', 'A2', 40, 
    'Adaptable field string 2', 'Adaptable field string 2', 0, 0, 0, 
    'CLT.A2', 0, NULL, 'Adaptable field string 2');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('4183', 'frmListeINTINT01', 'CLT', 'IDTT5', 6, 
    'Associated typology ID 5', 'Associated typology ID 5', 0, 0, 0, 
    'CLT.IDTT5', 0, NULL, 'Associated typology ID 5');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('4184', 'frmListeINTINT01', 'CLT', 'A4', 40, 
    'Adaptable field string 4', 'Adaptable field string 4', 0, 0, 0, 
    'CLT.A4', 0, NULL, 'Adaptable field string 4');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('4185', 'frmListeINTINT01', 'CLT', 'N5', 22, 
    'Adaptable field number 5', 'Adaptable field number 5', 0, 0, 0, 
    'CLT.N5', 0, NULL, 'Adaptable field number 5');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('4186', 'frmListeINTINT01', 'CLT', 'C3', 22, 
    'Adaptable field check-box 3', 'Adaptable field check-box 3', 0, 0, 0, 
    'CLT.C3', 0, NULL, 'Adaptable field check-box 3');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('4187', 'frmListeINTINT01', 'CLT', 'IDTCLT', 6, 
    'Nombre de contrat', 'Code', 0, 1, 0, 
    '(SELECT COUNT(*) FROM CTR WHERE CTR.IDTCLTDST = CLT.IDTCLT)', 0, NULL, 'Code');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('4188', 'frmListeINTINT01', 'CLT', 'ADRSTR6', 50, 
    'Description of structured address 6', 'Description of structured address 6', 0, 0, 0, 
    'CLT.ADRSTR6', 0, NULL, 'Description of structured address 6');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('4189', 'frmListeINTINT01', 'CLT', 'SQCCPTCLT', 22, 
    'Customer account serial number', 'Customer account serial number', 0, 1, 0, 
    'CLT.SQCCPTCLT', 0, NULL, 'Customer account serial number');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('4190', 'frmListeINTINT01', 'CLT', 'IDTCTGCLT', 6, 
    'Categorie de client', 'Categorie de client', 0, 1, 0, 
    'CLT.IDTCTGCLT', 0, NULL, 'Categorie de client');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('4191', 'frmListeINTINT01', 'CLT', 'IDTCNTOPR', 6, 
    'Centre operationnel', 'Centre operationnel', 0, 1, 0, 
    'CLT.IDTCNTOPR', 0, NULL, 'Centre operationnel');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('4192', 'frmListeINTINT01', 'CLT', 'AVT_NUMAVN', 22, 
    'NOT USED!!!', 'NOT USED!!!', 0, 0, 0, 
    'CLT.AVT_NUMAVN', 0, NULL, 'NOT USED!!!');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('4193', 'frmListeINTINT01', 'CLT', 'FLB', 20, 
    'Fax du bureau', 'Fax du bureau', 0, 1, 0, 
    'CLT.FLB', 0, NULL, 'Fax du bureau');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('4194', 'frmListeINTINT01', 'CLT', 'PMTLTG', 22, 
    'Nombre de paiements litigieux', 'Nombre de paiements litigieux', 0, 1, 0, 
    'CLT.PMTLTG', 0, NULL, 'Nombre de paiements litigieux');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('4195', 'frmListeINTINT01', 'CLT', 'INTBNC', 22, 
    'Interdit bancaire', 'Ineligible', 0, 1, 0, 
    'CLT.INTBNC', 0, NULL, 'Ineligible');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('4196', 'frmListeINTINT01', 'CLT', 'RTRIPY', 22, 
    'Nombre de retours d''impaye', 'Nombre de retours d''impaye', 0, 1, 0, 
    'CLT.RTRIPY', 0, NULL, 'Nombre de retours d''impaye');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('4197', 'frmListeINTINT01', 'CLT', 'IDTT1', 6, 
    'Associated typology ID 1', 'Associated typology ID 1', 0, 0, 0, 
    'CLT.IDTT1', 0, NULL, 'Associated typology ID 1');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('4198', 'frmListeINTINT01', 'CLT', 'IDTT3', 6, 
    'Associated typology ID 3', 'Associated typology ID 3', 0, 0, 0, 
    'CLT.IDTT3', 0, NULL, 'Associated typology ID 3');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('4199', 'frmListeINTINT01', 'CLT', 'A1', 40, 
    'Adaptable field string 1', 'Adaptable field string 1', 0, 0, 0, 
    'CLT.A1', 0, NULL, 'Adaptable field string 1');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('4200', 'frmListeINTINT01', 'CLT', 'A3', 40, 
    'Adaptable field string 3', 'Adaptable field string 3', 0, 0, 0, 
    'CLT.A3', 0, NULL, 'Adaptable field string 3');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('4201', 'frmListeINTINT01', 'CLT', 'C4', 22, 
    'Adaptable field check-box 4', 'Adaptable field check-box 4', 0, 0, 0, 
    'CLT.C4', 0, NULL, 'Adaptable field check-box 4');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('4202', 'frmListeINTINT01', 'CLT', 'ADRSTR7', 50, 
    'Description of structured address 7', 'Description of structured address 7', 0, 0, 0, 
    'CLT.ADRSTR7', 0, NULL, 'Description of structured address 7');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('4203', 'frmListeINTINT01', 'CLT', 'TLP', 20, 
    'Telephone portable', 'Telephone portable', 0, 1, 0, 
    'CLT.TLP', 0, NULL, 'Telephone portable');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('4204', 'frmListeINTINT01', 'CLT', 'RGR', 22, 
    'Client regroupe', 'Client regroupe', 0, 1, 0, 
    'CLT.RGR', 0, NULL, 'Client regroupe');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('4205', 'frmListeINTINT01', 'CLT', 'T3', 6, 
    'Adaptable field typology 3', 'Adaptable field typology 3', 0, 0, 0, 
    'CLT.T3', 0, NULL, 'Adaptable field typology 3');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('4206', 'frmListeINTINT01', 'CLT', 'T5', 6, 
    'Adaptable field typology 5', 'Adaptable field typology 5', 0, 0, 0, 
    'CLT.T5', 0, NULL, 'Adaptable field typology 5');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('4207', 'frmListeINTINT01', 'CLT', 'N1', 22, 
    'Adaptable field number 1', 'Adaptable field number 1', 0, 0, 0, 
    'CLT.N1', 0, NULL, 'Adaptable field number 1');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('4208', 'frmListeINTINT01', 'CLT', 'C1', 22, 
    'Adaptable field check-box 1', 'Adaptable field check-box 1', 0, 0, 0, 
    'CLT.C1', 0, NULL, 'Adaptable field check-box 1');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('4209', 'frmListeINTINT01', 'CLT', 'D2', 7, 
    'Adaptable field date 2', 'Adaptable field date 2', 0, 0, 0, 
    'TO_CHAR(CLT.D2,''DD/MM/YYYY'')', 0, NULL, 'Adaptable field date 2');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('4210', 'frmListeINTINT01', 'CLT', 'D3', 7, 
    'Adaptable field date 3', 'Adaptable field date 3', 0, 0, 0, 
    'TO_CHAR(CLT.D3,''DD/MM/YYYY'')', 0, NULL, 'Adaptable field date 3');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('4211', 'frmListeINTINT01', 'CLT', 'ADRSTR4', 50, 
    'Description of structured address 4', 'Description of structured address 4', 0, 0, 0, 
    'CLT.ADRSTR4', 0, NULL, 'Description of structured address 4');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('4212', 'frmListeINTINT01', 'CLT', 'ADRSTR8', 50, 
    'Description of structured address 8', 'Description of structured address 8', 0, 0, 0, 
    'CLT.ADRSTR8', 0, NULL, 'Description of structured address 8');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('4213', 'frmListeINTINT01', 'CLT', 'SQCCNT', 22, 
    'Contact serial number', 'Contact serial number', 0, 1, 0, 
    'CLT.SQCCNT', 0, NULL, 'Contact serial number');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('4214', 'frmListeINTINT01', 'CLT', 'IDTCTR', 10, 
    'Contract ID', 'Contract ID', 0, 1, 0, 
    'CLT.IDTCTR', 0, NULL, 'Contract ID');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('4215', 'frmListeINTINT01', 'CLT', 'PRN', 40, 
    'Prenom', 'Prenom', 0, 1, 0, 
    'CLT.PRN', 0, NULL, 'Prenom');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('4216', 'frmListeINTINT01', 'CLT', 'CHPLIB4', 30, 
    '4th free field', '4th free field', 0, 0, 0, 
    'CLT.CHPLIB4', 0, NULL, '4th free field');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('4217', 'frmListeINTINT01', 'CLT', 'N4', 22, 
    'Adaptable field number 4', 'Adaptable field number 4', 0, 0, 0, 
    'CLT.N4', 0, NULL, 'Adaptable field number 4');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('4218', 'frmListeINTINT01', 'CLT', 'ADRSTR5', 50, 
    'Description of structured address 5', 'Description of structured address 5', 0, 0, 0, 
    'CLT.ADRSTR5', 0, NULL, 'Description of structured address 5');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('4219', 'frmListeINTINT01', 'CLT', 'MAIL', 40, 
    'Messagerie electronique', 'Messagerie electronique', 0, 1, 0, 
    'CLT.MAIL', 0, NULL, 'Messagerie electronique');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('4220', 'frmListeINTINT01', 'CLT', 'IDTCLT', 6, 
    'Code', 'Code', 0, 1, 0, 
    'CLT.IDTCLT', 0, NULL, 'Code');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('4221', 'frmListeINTINT01', 'CLT', 'IDTPRMCTR', 10, 
    'Code du premier contrat', 'Code du premier contrat', 0, 1, 0, 
    'CLT.IDTPRMCTR', 0, NULL, 'Code du premier contrat');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('4222', 'frmListeINTINT01', 'CLT', 'IDTSQCGNR', 22, 
    'General identifier', 'General identifier', 0, 0, 0, 
    'CLT.IDTSQCGNR', 0, NULL, 'General identifier');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('4223', 'frmListeINTINT01', 'CLT', 'T2', 6, 
    'Adaptable field typology 2', 'Adaptable field typology 2', 0, 0, 0, 
    'CLT.T2', 0, NULL, 'Adaptable field typology 2');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('4224', 'frmListeINTINT01', 'CLT', 'A2', 40, 
    'Adaptable field string 2', 'Adaptable field string 2', 0, 0, 0, 
    'CLT.A2', 0, NULL, 'Adaptable field string 2');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('4225', 'frmListeINTINT01', 'CLT', 'A5', 40, 
    'Adaptable field string 5', 'Adaptable field string 5', 0, 0, 0, 
    'CLT.A5', 0, NULL, 'Adaptable field string 5');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('4226', 'frmListeINTINT01', 'CLT', 'D1', 7, 
    'Adaptable field date 1', 'Adaptable field date 1', 0, 0, 0, 
    'TO_CHAR(CLT.D1,''DD/MM/YYYY'')', 0, NULL, 'Adaptable field date 1');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('4227', 'frmListeINTINT01', 'CLT', 'ADRSTR1', 50, 
    'Description of structured address 1', 'Description of structured address 1', 0, 0, 0, 
    'CLT.ADRSTR1', 0, NULL, 'Description of structured address 1');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('4228', 'frmListeINTINT01', 'CLT', 'ADRSTR9', 254, 
    'Description of structured address 9', 'Description of structured address 9', 0, 0, 0, 
    'CLT.ADRSTR9', 0, NULL, 'Description of structured address 9');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('4229', 'frmListeINTINT01', 'CLT', 'X7SNDXNOM', 40, 
    'Fonction de recherche pour Nom', 'Fonction de recherche pour Nom', 0, 0, 0, 
    'CLT.X7SNDXNOM', 0, NULL, 'Fonction de recherche pour Nom');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('4230', 'frmListeINTINT01', 'CLT', 'IDTQLT', 6, 
    'Qualité client', 'Type of customer ID', 0, 1, 0, 
    'CLT.IDTQLT', 0, NULL, 'Type of customer ID');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('4231', 'frmListeINTINT01', 'CLT', 'IDTCODSNS', 6, 
    'Sensibilité client', 'Sensibilite client', 0, 1, 0, 
    'CLT.IDTCODSNS', 0, NULL, 'Sensibilite client');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('4232', 'frmListeINTINT01', 'CLT', 'NUMAVN', 22, 
    'Numéro d''avenant', 'avenant', 0, 1, 0, 
    'CLT.NUMAVN', 0, NULL, 'avenant');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('4233', 'frmListeINTINT01', 'CLT', 'MTRAGT', 6, 
    'Agent', 'Agent', 0, 1, 0, 
    'CLT.MTRAGT', 0, NULL, 'Agent');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('4234', 'frmListeINTINT01', 'CLT', 'QLTPYR', 2, 
    'Qualite payeur', 'Qualite payeur', 0, 1, 0, 
    'CLT.QLTPYR', 0, NULL, 'Qualite payeur');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('4235', 'frmListeINTINT01', 'CLT', 'FRD', 22, 
    'Fraudeur', 'Fraudeur', 0, 1, 0, 
    'CLT.FRD', 0, NULL, 'Fraudeur');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('4236', 'frmListeINTINT01', 'CLT', 'ADRLBR', 2000, 
    'Adresse', 'Adresse', 0, 1, 0, 
    'SUBSTR(REPLACE(REPLACE(CLT.ADRLBR,CHR(10),'' ''),CHR(13),'' ''),1,254)', 0, NULL, 'Adresse');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('4237', 'frmListeINTINT01', 'CLT', 'CHPLIB1', 30, 
    '1st free field', '1st free field', 0, 0, 0, 
    'CLT.CHPLIB1', 0, NULL, '1st free field');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('4238', 'frmListeINTINT01', 'CLT', 'C2', 22, 
    'Adaptable field check-box 2', 'Adaptable field check-box 2', 0, 0, 0, 
    'CLT.C2', 0, NULL, 'Adaptable field check-box 2');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('4239', 'frmListeINTINT01', 'CLT', 'C5', 22, 
    'Adaptable field check-box 5', 'Adaptable field check-box 5', 0, 0, 0, 
    'CLT.C5', 0, NULL, 'Adaptable field check-box 5');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('4240', 'frmListeINTINT01', 'CLT', 'ADRSTR3', 50, 
    'Description of structured address 3', 'Description of structured address 3', 0, 0, 0, 
    'CLT.ADRSTR3', 0, NULL, 'Description of structured address 3');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('4241', 'frmListeINTINT01', 'CLT', 'TLB', 20, 
    'Telephone du bureau', 'Telephone du bureau', 0, 1, 0, 
    'CLT.TLB', 0, NULL, 'Telephone du bureau');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('4242', 'frmListeINTINT01', 'CLT', 'N3', 22, 
    'Adaptable field number 3', 'Adaptable field number 3', 0, 0, 0, 
    'CLT.N3', 0, NULL, 'Adaptable field number 3');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('4243', 'frmListeINTINT01', 'CLT', 'D4', 7, 
    'Adaptable field date 4', 'Adaptable field date 4', 0, 0, 0, 
    'TO_CHAR(CLT.D4,''DD/MM/YYYY'')', 0, NULL, 'Adaptable field date 4');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('4244', 'frmListeINTINT01', 'CLT', 'D5', 7, 
    'Adaptable field date 5', 'Adaptable field date 5', 0, 0, 0, 
    'TO_CHAR(CLT.D5,''DD/MM/YYYY'')', 0, NULL, 'Adaptable field date 5');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('4245', 'frmListeINTINT01', 'CLT', 'ADRSTR10', 50, 
    'Description of structured address 10', 'Description of structured address 10', 0, 0, 0, 
    'CLT.ADRSTR10', 0, NULL, 'Description of structured address 10');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('4246', 'frmListeINTINT01', 'CLT', 'AVT_IDTCTR', 10, 
    'NOT USED !!!', 'NOT USED !!!', 0, 0, 0, 
    'CLT.AVT_IDTCTR', 0, NULL, 'NOT USED !!!');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('4247', 'frmListeINTINT01', 'CLT', 'CHPLIB3', 30, 
    '3rd free field', '3rd free field', 0, 0, 0, 
    'CLT.CHPLIB3', 0, NULL, '3rd free field');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('4248', 'frmListeINTINT01', 'CLT', 'IDTT2', 6, 
    'Associated typology ID 2', 'Associated typology ID 2', 0, 0, 0, 
    'CLT.IDTT2', 0, NULL, 'Associated typology ID 2');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('4249', 'frmListeINTINT01', 'CLT', 'T4', 6, 
    'Adaptable field typology 4', 'Adaptable field typology 4', 0, 0, 0, 
    'CLT.T4', 0, NULL, 'Adaptable field typology 4');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('4250', 'frmListeINTINT01', 'CLT', 'N2', 22, 
    'Adaptable field number 2', 'Adaptable field number 2', 0, 0, 0, 
    'CLT.N2', 0, NULL, 'Adaptable field number 2');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('4251', 'frmListeINTINT01', 'CLT', 'ADRSTR2', 50, 
    'Description of structured address 2', 'Description of structured address 2', 0, 0, 0, 
    'CLT.ADRSTR2', 0, NULL, 'Description of structured address 2');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('4252', 'frmListeINTINT01', 'CLT', 'CHPLIB5', 254, 
    'Lib 5', 'Lib 5', 0, 0, 0, 
    'CLT.CHPLIB5', 0, NULL, 'Lib 5');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('4253', 'frmListeINTINT01', 'CPR', 'T3', 6, 
    'Adaptable field typology 3', 'Adaptable field typology 3', 0, 0, 0, 
    'CPR.T3', 0, NULL, 'Adaptable field typology 3');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('4254', 'frmListeINTINT01', 'CPR', 'IDTT5', 6, 
    'Associated typology ID 5', 'Associated typology ID 5', 0, 0, 0, 
    'CPR.IDTT5', 0, NULL, 'Associated typology ID 5');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('4255', 'frmListeINTINT01', 'CPR', 'A2', 40, 
    'Adaptable field string 2', 'Adaptable field string 2', 0, 0, 0, 
    'CPR.A2', 0, NULL, 'Adaptable field string 2');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('4256', 'frmListeINTINT01', 'CPR', 'N2', 22, 
    'Adaptable field number 2', 'Adaptable field number 2', 0, 0, 0, 
    'CPR.N2', 0, NULL, 'Adaptable field number 2');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('4257', 'frmListeINTINT01', 'CPR', 'IDTCODOBS', 22, 
    'Observation code ID', 'Observation code ID', 0, 1, 0, 
    'CPR.IDTCODOBS', 0, NULL, 'Observation code ID');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('4258', 'frmListeINTINT01', 'CPR', 'DATAGR', 7, 
    'Date d''agrement', 'Date d''agrement', 0, 1, 0, 
    'TO_CHAR(CPR.DATAGR,''DD/MM/YYYY'')', 0, NULL, 'Date d''agrement');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('4259', 'frmListeINTINT01', 'CPR', 'IDTT4', 6, 
    'Associated typology ID 4', 'Associated typology ID 4', 0, 0, 0, 
    'CPR.IDTT4', 0, NULL, 'Associated typology ID 4');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('4260', 'frmListeINTINT01', 'CPR', 'T5', 6, 
    'Adaptable field typology 5', 'Adaptable field typology 5', 0, 0, 0, 
    'CPR.T5', 0, NULL, 'Adaptable field typology 5');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('4261', 'frmListeINTINT01', 'CPR', 'A1', 40, 
    'Adaptable field string 1', 'Adaptable field string 1', 0, 0, 0, 
    'CPR.A1', 0, NULL, 'Adaptable field string 1');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('4262', 'frmListeINTINT01', 'CPR', 'A3', 40, 
    'Adaptable field string 3', 'Adaptable field string 3', 0, 0, 0, 
    'CPR.A3', 0, NULL, 'Adaptable field string 3');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('4263', 'frmListeINTINT01', 'CPR', 'N1', 22, 
    'Adaptable field number 1', 'Adaptable field number 1', 0, 0, 0, 
    'CPR.N1', 0, NULL, 'Adaptable field number 1');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('4264', 'frmListeINTINT01', 'CPR', 'NUMENQ', 22, 
    'Recensement', 'Recensement', 0, 1, 0, 
    'CPR.NUMENQ', 0, NULL, 'Recensement');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('4265', 'frmListeINTINT01', 'CPR', 'IDTCPR', 22, 
    'Identifiant interne', 'Identifiant interne', 0, 1, 0, 
    'CPR.IDTCPR', 0, NULL, 'Identifiant interne');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('4266', 'frmListeINTINT01', 'CPR', 'IDTTYPCPR', 6, 
    'Type de compteur', 'Type de compteur', 0, 1, 0, 
    'CPR.IDTTYPCPR', 0, NULL, 'Type de compteur');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('4267', 'frmListeINTINT01', 'CPR', 'T1', 6, 
    'Adaptable field typology 1', 'Adaptable field typology 1', 0, 0, 0, 
    'CPR.T1', 0, NULL, 'Adaptable field typology 1');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('4268', 'frmListeINTINT01', 'CPR', 'IDTT3', 6, 
    'Associated typology ID 3', 'Associated typology ID 3', 0, 0, 0, 
    'CPR.IDTT3', 0, NULL, 'Associated typology ID 3');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('4269', 'frmListeINTINT01', 'CPR', 'N3', 22, 
    'Adaptable field number 3', 'Adaptable field number 3', 0, 0, 0, 
    'CPR.N3', 0, NULL, 'Adaptable field number 3');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('4270', 'frmListeINTINT01', 'CPR', 'DATFBR', 7, 
    'Date de fabrication', 'Date de fabrication', 0, 1, 0, 
    'TO_CHAR(CPR.DATFBR,''DD/MM/YYYY'')', 0, NULL, 'Date de fabrication');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('4271', 'frmListeINTINT01', 'CPR', 'T2', 6, 
    'Adaptable field typology 2', 'Adaptable field typology 2', 0, 0, 0, 
    'CPR.T2', 0, NULL, 'Adaptable field typology 2');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('4272', 'frmListeINTINT01', 'CPR', 'IDTT2', 6, 
    'Associated typology ID 2', 'Associated typology ID 2', 0, 0, 0, 
    'CPR.IDTT2', 0, NULL, 'Associated typology ID 2');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('4273', 'frmListeINTINT01', 'CPR', 'IDTAGT', 6, 
    'Employee ID', 'Employee ID', 0, 1, 0, 
    'CPR.IDTAGT', 0, NULL, 'Employee ID');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('4274', 'frmListeINTINT01', 'CPR', 'N4', 22, 
    'Adaptable field number 4', 'Adaptable field number 4', 0, 0, 0, 
    'CPR.N4', 0, NULL, 'Adaptable field number 4');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('4275', 'frmListeINTINT01', 'CPR', 'C1', 22, 
    'Adaptable field check-box 1', 'Adaptable field check-box 1', 0, 0, 0, 
    'CPR.C1', 0, NULL, 'Adaptable field check-box 1');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('4276', 'frmListeINTINT01', 'CPR', 'DATRVS', 7, 
    'Date de revision', 'Date de revision', 0, 1, 0, 
    'TO_CHAR(CPR.DATRVS,''DD/MM/YYYY'')', 0, NULL, 'Date de revision');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('4277', 'frmListeINTINT01', 'CPR', 'IDTSQCGNR', 22, 
    'General identifier', 'General identifier', 0, 1, 0, 
    'CPR.IDTSQCGNR', 0, NULL, 'General identifier');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('4278', 'frmListeINTINT01', 'CPR', 'A5', 40, 
    'Adaptable field string 5', 'Adaptable field string 5', 0, 0, 0, 
    'CPR.A5', 0, NULL, 'Adaptable field string 5');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('4279', 'frmListeINTINT01', 'CPR', 'N5', 22, 
    'Adaptable field number 5', 'Adaptable field number 5', 0, 0, 0, 
    'CPR.N5', 0, NULL, 'Adaptable field number 5');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('4280', 'frmListeINTINT01', 'CPR', 'D1', 7, 
    'Adaptable field date 1', 'Adaptable field date 1', 0, 0, 0, 
    'TO_CHAR(CPR.D1,''DD/MM/YYYY'')', 0, NULL, 'Adaptable field date 1');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('4281', 'frmListeINTINT01', 'CPR', 'T4', 6, 
    'Adaptable field typology 4', 'Adaptable field typology 4', 0, 0, 0, 
    'CPR.T4', 0, NULL, 'Adaptable field typology 4');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('4282', 'frmListeINTINT01', 'CPR', 'D5', 7, 
    'Adaptable field date 5', 'Adaptable field date 5', 0, 0, 0, 
    'TO_CHAR(CPR.D5,''DD/MM/YYYY'')', 0, NULL, 'Adaptable field date 5');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('4283', 'frmListeINTINT01', 'CPR', 'SQCCNS', 22, 
    'Consumption serial number', 'Consumption serial number', 0, 1, 0, 
    'CPR.SQCCNS', 0, NULL, 'Consumption serial number');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('4284', 'frmListeINTINT01', 'CPR', 'A4', 40, 
    'Adaptable field string 4', 'Adaptable field string 4', 0, 0, 0, 
    'CPR.A4', 0, NULL, 'Adaptable field string 4');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('4285', 'frmListeINTINT01', 'CPR', 'NUMCPR', 20, 
    'Numero', 'Numero', 0, 1, 0, 
    'CPR.NUMCPR', 0, NULL, 'Numero');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('4286', 'frmListeINTINT01', 'CPR', 'C2', 22, 
    'Adaptable field check-box 2', 'Adaptable field check-box 2', 0, 0, 0, 
    'CPR.C2', 0, NULL, 'Adaptable field check-box 2');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('4287', 'frmListeINTINT01', 'CPR', 'C4', 22, 
    'Adaptable field check-box 4', 'Adaptable field check-box 4', 0, 0, 0, 
    'CPR.C4', 0, NULL, 'Adaptable field check-box 4');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('4288', 'frmListeINTINT01', 'CPR', 'D3', 7, 
    'Adaptable field date 3', 'Adaptable field date 3', 0, 0, 0, 
    'TO_CHAR(CPR.D3,''DD/MM/YYYY'')', 0, NULL, 'Adaptable field date 3');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('4289', 'frmListeINTINT01', 'CPR', 'D4', 7, 
    'Adaptable field date 4', 'Adaptable field date 4', 0, 0, 0, 
    'TO_CHAR(CPR.D4,''DD/MM/YYYY'')', 0, NULL, 'Adaptable field date 4');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('4290', 'frmListeINTINT01', 'CPR', 'DATMAJ', 7, 
    'Date de mise à jour', 'Date de mise à jour', 0, 1, 0, 
    'TO_CHAR(CPR.DATMAJ,''DD/MM/YYYY'')', 0, NULL, 'Date de mise à jour');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('4291', 'frmListeINTINT01', 'CPR', 'DATETL', 7, 
    'Date d''etalonnage', 'Date d''etalonnage', 0, 1, 0, 
    'TO_CHAR(CPR.DATETL,''DD/MM/YYYY'')', 0, NULL, 'Date d''etalonnage');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('4292', 'frmListeINTINT01', 'CPR', 'SQCIND', 22, 
    'Serial number of the index of the meter', 'Serial number of the index of the meter', 0, 1, 0, 
    'CPR.SQCIND', 0, NULL, 'Serial number of the index of the meter');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('4293', 'frmListeINTINT01', 'CPR', 'IDTT1', 6, 
    'Associated typology ID 1', 'Associated typology ID 1', 0, 0, 0, 
    'CPR.IDTT1', 0, NULL, 'Associated typology ID 1');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('4294', 'frmListeINTINT01', 'CPR', 'C3', 22, 
    'Adaptable field check-box 3', 'Adaptable field check-box 3', 0, 0, 0, 
    'CPR.C3', 0, NULL, 'Adaptable field check-box 3');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('4295', 'frmListeINTINT01', 'CPR', 'C5', 22, 
    'Adaptable field check-box 5', 'Adaptable field check-box 5', 0, 0, 0, 
    'CPR.C5', 0, NULL, 'Adaptable field check-box 5');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('4296', 'frmListeINTINT01', 'CPR', 'D2', 7, 
    'Adaptable field date 2', 'Adaptable field date 2', 0, 0, 0, 
    'TO_CHAR(CPR.D2,''DD/MM/YYYY'')', 0, NULL, 'Adaptable field date 2');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('4297', 'frmListeINTINT01', 'CPR', 'DATGRN', 7, 
    'Date de garantie', 'Date de garantie', 0, 1, 0, 
    'TO_CHAR(CPR.DATGRN,''DD/MM/YYYY'')', 0, NULL, 'Date de garantie');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('4298', 'frmListeINTINT01', 'PNTLVR', 'ADRLBR', 2000, 
    'Adresse', 'Adresse', 0, 1, 0, 
    'SUBSTR(REPLACE(REPLACE(PNTLVR.ADRLBR,CHR(10),'' ''),CHR(13),'' ''),1,254)', 0, NULL, 'Adresse');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('4299', 'frmListeINTINT01', 'PNTLVR', 'A3', 40, 
    'Adaptable field string 3', 'Adaptable field string 3', 0, 0, 0, 
    'PNTLVR.A3', 0, NULL, 'Adaptable field string 3');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('4300', 'frmListeINTINT01', 'PNTLVR', 'ADRSTR1', 50, 
    'Description of structured address 1', 'Description of structured address 1', 0, 0, 0, 
    'PNTLVR.ADRSTR1', 0, NULL, 'Description of structured address 1');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('4301', 'frmListeINTINT01', 'PNTLVR', 'A1', 40, 
    'Adaptable field string 1', 'Adaptable field string 1', 0, 0, 0, 
    'PNTLVR.A1', 0, NULL, 'Adaptable field string 1');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('4302', 'frmListeINTINT01', 'PNTLVR', 'CODGEO3', 4, 
    'Code géographique 3', 'Code du niveau 3', 0, 1, 0, 
    'PNTLVR.CODGEO3', 0, NULL, 'Code du niveau 3');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('4303', 'frmListeINTINT01', 'PNTLVR', 'OCC', 22, 
    'Occupé', 'Occupation', 0, 1, 0, 
    'PNTLVR.OCC', 0, NULL, 'Occupation');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('4304', 'frmListeINTINT01', 'PNTLVR', 'IDTENQ', 22, 
    'Investigation ID', 'Investigation ID', 0, 1, 0, 
    'PNTLVR.IDTENQ', 0, NULL, 'Investigation ID');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('4305', 'frmListeINTINT01', 'PNTLVR', 'D5', 7, 
    'Adaptable field date 5', 'Adaptable field date 5', 0, 0, 0, 
    'TO_CHAR(PNTLVR.D5,''DD/MM/YYYY'')', 0, NULL, 'Adaptable field date 5');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('4306', 'frmListeINTINT01', 'PNTLVR', 'CODGEO4', 4, 
    'Code géographique 4', 'Code du niveau 4', 0, 1, 0, 
    'PNTLVR.CODGEO4', 0, NULL, 'Code du niveau 4');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('4307', 'frmListeINTINT01', 'PNTLVR', 'T5', 6, 
    'Adaptable field typologie 5', 'Adaptable field typologie 5', 0, 0, 0, 
    'PNTLVR.T5', 0, NULL, 'Adaptable field typologie 5');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('4308', 'frmListeINTINT01', 'PNTLVR', 'CODGEO5', 4, 
    'Code géographique 5', 'Code du niveau 5', 0, 1, 0, 
    'PNTLVR.CODGEO5', 0, NULL, 'Code du niveau 5');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('4309', 'frmListeINTINT01', 'PNTLVR', 'IDTT1', 6, 
    'Associated typology ID 1', 'Associated typology ID 1', 0, 0, 0, 
    'PNTLVR.IDTT1', 0, NULL, 'Associated typology ID 1');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('4310', 'frmListeINTINT01', 'PNTLVR', 'Occupé', 20, 
    'Occupé', 'Occupé', 0, 1, 0, 
    'DECODE(PNTLVR.Occ,1,''Oui'',''Non'')', 0, NULL, 'Occupé');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('4311', 'frmListeINTINT01', 'PNTLVR', 'C1', 22, 
    'Adaptable field check-box 1', 'Adaptable field check-box 1', 0, 0, 0, 
    'PNTLVR.C1', 0, NULL, 'Adaptable field check-box 1');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('4312', 'frmListeINTINT01', 'PNTLVR', 'ADRSTR6', 50, 
    'Description of structured address 6', 'Description of structured address 6', 0, 0, 0, 
    'PNTLVR.ADRSTR6', 0, NULL, 'Description of structured address 6');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('4313', 'frmListeINTINT01', 'PNTLVR', 'ADRSTR9', 50, 
    'Description of structured address 9', 'Description of structured address 9', 0, 0, 0, 
    'PNTLVR.ADRSTR9', 0, NULL, 'Description of structured address 9');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('4314', 'frmListeINTINT01', 'PNTLVR', 'N4', 22, 
    'Adaptable field number 4', 'Adaptable field number 4', 0, 0, 0, 
    'PNTLVR.N4', 0, NULL, 'Adaptable field number 4');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('4315', 'frmListeINTINT01', 'PNTLVR', 'IDTCNTOPR', 6, 
    'Centre opérationel', 'Centre opérationel', 0, 1, 0, 
    'PNTLVR.IDTCNTOPR', 0, NULL, 'Centre opérationel');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('4114', 'frmListeCLTOPR01', 'CLT', 'C2', 22, 
    'Adaptable field check-box 2', 'Adaptable field check-box 2', 0, 0, 0, 
    'CLT.C2', 0, NULL, 'Adaptable field check-box 2');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('4115', 'frmListeCLTOPR01', 'CLT', 'D1', 7, 
    'Adaptable field date 1', 'Adaptable field date 1', 0, 0, 0, 
    'TO_CHAR(CLT.D1,''DD/MM/YYYY'')', 0, NULL, 'Adaptable field date 1');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('4116', 'frmListeCLTOPR01', 'CLT', 'AVT_IDTCTR', 10, 
    'NOT USED !!!', 'NOT USED !!!', 0, 0, 0, 
    'CLT.AVT_IDTCTR', 0, NULL, 'NOT USED !!!');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('4117', 'frmListeCLTOPR01', 'CLT', 'TLB', 20, 
    'Telephone du bureau', 'Telephone du bureau', 0, 1, 0, 
    'CLT.TLB', 0, NULL, 'Telephone du bureau');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('4118', 'frmListeCLTOPR01', 'CLT', 'FLB', 20, 
    'Fax du bureau', 'Fax du bureau', 0, 1, 0, 
    'CLT.FLB', 0, NULL, 'Fax du bureau');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('4119', 'frmListeCLTOPR01', 'CLT', 'D4', 7, 
    'Adaptable field date 4', 'Adaptable field date 4', 0, 0, 0, 
    'TO_CHAR(CLT.D4,''DD/MM/YYYY'')', 0, NULL, 'Adaptable field date 4');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('4120', 'frmListeCLTOPR01', 'CLT', 'ADRSTR5', 50, 
    'Description of structured address 5', 'Description of structured address 5', 0, 0, 0, 
    'CLT.ADRSTR5', 0, NULL, 'Description of structured address 5');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('4121', 'frmListeCLTOPR01', 'CLT', 'IDTCLT', 6, 
    'Nombre de contrat', 'Code', 0, 1, 0, 
    '(SELECT COUNT(*) FROM CTR WHERE CTR.IDTCLTDST = CLT.IDTCLT)', 0, NULL, 'Code');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('4122', 'frmListeCLTOPR01', 'CLT', 'ADRSTR9', 254, 
    'Description of structured address 9', 'Description of structured address 9', 0, 0, 0, 
    'CLT.ADRSTR9', 0, NULL, 'Description of structured address 9');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('4123', 'frmListeCLTOPR01', 'CLT', 'MTRAGT', 6, 
    'Agent', 'Agent', 0, 1, 0, 
    'CLT.MTRAGT', 0, NULL, 'Agent');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('4124', 'frmListeCLTOPR01', 'CLT', 'PRN', 40, 
    'Prenom', 'Prenom', 0, 1, 0, 
    'CLT.PRN', 0, NULL, 'Prenom');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('4125', 'frmListeCLTOPR01', 'CLT', 'INTBNC', 22, 
    'Interdit bancaire', 'Ineligible', 0, 1, 0, 
    'CLT.INTBNC', 0, NULL, 'Ineligible');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('4126', 'frmListeCLTOPR01', 'CLT', 'IDTT4', 6, 
    'Associated typology ID 4', 'Associated typology ID 4', 0, 0, 0, 
    'CLT.IDTT4', 0, NULL, 'Associated typology ID 4');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('4127', 'frmListeCLTOPR01', 'CLT', 'A3', 40, 
    'Adaptable field string 3', 'Adaptable field string 3', 0, 0, 0, 
    'CLT.A3', 0, NULL, 'Adaptable field string 3');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('4128', 'frmListeCLTOPR01', 'CLT', 'N1', 22, 
    'Adaptable field number 1', 'Adaptable field number 1', 0, 0, 0, 
    'CLT.N1', 0, NULL, 'Adaptable field number 1');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('4129', 'frmListeCLTOPR01', 'CLT', 'N3', 22, 
    'Adaptable field number 3', 'Adaptable field number 3', 0, 0, 0, 
    'CLT.N3', 0, NULL, 'Adaptable field number 3');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('4130', 'frmListeCLTOPR01', 'CLT', 'ADRSTR1', 50, 
    'Description of structured address 1', 'Description of structured address 1', 0, 0, 0, 
    'CLT.ADRSTR1', 0, NULL, 'Description of structured address 1');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('4131', 'frmListeCLTOPR01', 'CLT', 'ADRSTR4', 50, 
    'Description of structured address 4', 'Description of structured address 4', 0, 0, 0, 
    'CLT.ADRSTR4', 0, NULL, 'Description of structured address 4');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('4132', 'frmListeCLTOPR01', 'CLT', 'FLD', 20, 
    'Fax du domicile', 'Fax du domicile', 0, 1, 0, 
    'CLT.FLD', 0, NULL, 'Fax du domicile');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('4133', 'frmListeCLTOPR01', 'CLT', 'RTRIPY', 22, 
    'Nombre de retours d''impaye', 'Nombre de retours d''impaye', 0, 1, 0, 
    'CLT.RTRIPY', 0, NULL, 'Nombre de retours d''impaye');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('4134', 'frmListeCLTOPR01', 'CLT', 'T5', 6, 
    'Adaptable field typology 5', 'Adaptable field typology 5', 0, 0, 0, 
    'CLT.T5', 0, NULL, 'Adaptable field typology 5');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('4135', 'frmListeCLTOPR01', 'CLT', 'N4', 22, 
    'Adaptable field number 4', 'Adaptable field number 4', 0, 0, 0, 
    'CLT.N4', 0, NULL, 'Adaptable field number 4');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('4136', 'frmListeCLTOPR01', 'CLT', 'C4', 22, 
    'Adaptable field check-box 4', 'Adaptable field check-box 4', 0, 0, 0, 
    'CLT.C4', 0, NULL, 'Adaptable field check-box 4');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('4137', 'frmListeCLTOPR01', 'CLT', 'C5', 22, 
    'Adaptable field check-box 5', 'Adaptable field check-box 5', 0, 0, 0, 
    'CLT.C5', 0, NULL, 'Adaptable field check-box 5');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('4138', 'frmListeCLTOPR01', 'CLT', 'TLP', 20, 
    'Telephone portable', 'Telephone portable', 0, 1, 0, 
    'CLT.TLP', 0, NULL, 'Telephone portable');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('4139', 'frmListeCLTOPR01', 'CLT', 'X7SNDXNOM', 40, 
    'Fonction de recherche pour Nom', 'Fonction de recherche pour Nom', 0, 0, 0, 
    'CLT.X7SNDXNOM', 0, NULL, 'Fonction de recherche pour Nom');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('4140', 'frmListeCLTOPR01', 'CLT', 'IDTQLT', 6, 
    'Qualité client', 'Type of customer ID', 0, 1, 0, 
    'CLT.IDTQLT', 0, NULL, 'Type of customer ID');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('4141', 'frmListeCLTOPR01', 'CLT', 'IDTCODSNS', 6, 
    'Sensibilité client', 'Sensibilite client', 0, 1, 0, 
    'CLT.IDTCODSNS', 0, NULL, 'Sensibilite client');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('4142', 'frmListeCLTOPR01', 'CLT', 'RGR', 22, 
    'Client regroupe', 'Client regroupe', 0, 1, 0, 
    'CLT.RGR', 0, NULL, 'Client regroupe');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('4143', 'frmListeCLTOPR01', 'CLT', 'CHPLIB3', 30, 
    '3rd free field', '3rd free field', 0, 0, 0, 
    'CLT.CHPLIB3', 0, NULL, '3rd free field');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('4144', 'frmListeCLTOPR01', 'CLT', 'IDTT1', 6, 
    'Associated typology ID 1', 'Associated typology ID 1', 0, 0, 0, 
    'CLT.IDTT1', 0, NULL, 'Associated typology ID 1');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('4145', 'frmListeCLTOPR01', 'CLT', 'IDTT5', 6, 
    'Associated typology ID 5', 'Associated typology ID 5', 0, 0, 0, 
    'CLT.IDTT5', 0, NULL, 'Associated typology ID 5');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('4146', 'frmListeCLTOPR01', 'CLT', 'A1', 40, 
    'Adaptable field string 1', 'Adaptable field string 1', 0, 0, 0, 
    'CLT.A1', 0, NULL, 'Adaptable field string 1');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('4147', 'frmListeCLTOPR01', 'CLT', 'A4', 40, 
    'Adaptable field string 4', 'Adaptable field string 4', 0, 0, 0, 
    'CLT.A4', 0, NULL, 'Adaptable field string 4');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('4148', 'frmListeCLTOPR01', 'CLT', 'D3', 7, 
    'Adaptable field date 3', 'Adaptable field date 3', 0, 0, 0, 
    'TO_CHAR(CLT.D3,''DD/MM/YYYY'')', 0, NULL, 'Adaptable field date 3');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('4149', 'frmListeCLTOPR01', 'CLT', 'ADRSTR6', 50, 
    'Description of structured address 6', 'Description of structured address 6', 0, 0, 0, 
    'CLT.ADRSTR6', 0, NULL, 'Description of structured address 6');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('4150', 'frmListeCLTOPR01', 'CLT', 'MAIL', 40, 
    'Messagerie electronique', 'Messagerie electronique', 0, 1, 0, 
    'CLT.MAIL', 0, NULL, 'Messagerie electronique');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('4151', 'frmListeCLTOPR01', 'CLT', 'SQCCPTCLT', 22, 
    'Customer account serial number', 'Customer account serial number', 0, 1, 0, 
    'CLT.SQCCPTCLT', 0, NULL, 'Customer account serial number');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('4152', 'frmListeCLTOPR01', 'CLT', 'IDTCLT', 6, 
    'Code', 'Code', 0, 1, 0, 
    'CLT.IDTCLT', 0, NULL, 'Code');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('4153', 'frmListeCLTOPR01', 'CLT', 'IDTCTGCLT', 6, 
    'Categorie de client', 'Categorie de client', 0, 1, 0, 
    'CLT.IDTCTGCLT', 0, NULL, 'Categorie de client');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('4154', 'frmListeCLTOPR01', 'CLT', 'ANCRFR', 20, 
    'Ancienne reference', 'Ancienne reference', 0, 1, 0, 
    'CLT.ANCRFR', 0, NULL, 'Ancienne reference');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('4155', 'frmListeCLTOPR01', 'CLT', 'FRD', 22, 
    'Fraudeur', 'Fraudeur', 0, 1, 0, 
    'CLT.FRD', 0, NULL, 'Fraudeur');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('4156', 'frmListeCLTOPR01', 'CLT', 'PMTLTG', 22, 
    'Nombre de paiements litigieux', 'Nombre de paiements litigieux', 0, 1, 0, 
    'CLT.PMTLTG', 0, NULL, 'Nombre de paiements litigieux');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('4157', 'frmListeCLTOPR01', 'CLT', 'CHPLIB1', 30, 
    '1st free field', '1st free field', 0, 0, 0, 
    'CLT.CHPLIB1', 0, NULL, '1st free field');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('4158', 'frmListeCLTOPR01', 'CLT', 'CHPLIB2', 30, 
    '2nd free field', '2nd free field', 0, 0, 0, 
    'CLT.CHPLIB2', 0, NULL, '2nd free field');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('4159', 'frmListeCLTOPR01', 'CLT', 'T2', 6, 
    'Adaptable field typology 2', 'Adaptable field typology 2', 0, 0, 0, 
    'CLT.T2', 0, NULL, 'Adaptable field typology 2');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('4160', 'frmListeCLTOPR01', 'CLT', 'A5', 40, 
    'Adaptable field string 5', 'Adaptable field string 5', 0, 0, 0, 
    'CLT.A5', 0, NULL, 'Adaptable field string 5');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('4161', 'frmListeCLTOPR01', 'CLT', 'C1', 22, 
    'Adaptable field check-box 1', 'Adaptable field check-box 1', 0, 0, 0, 
    'CLT.C1', 0, NULL, 'Adaptable field check-box 1');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('4162', 'frmListeCLTOPR01', 'CLT', 'ADRSTR3', 50, 
    'Description of structured address 3', 'Description of structured address 3', 0, 0, 0, 
    'CLT.ADRSTR3', 0, NULL, 'Description of structured address 3');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('4163', 'frmListeCLTOPR01', 'CLT', 'ADRSTR7', 50, 
    'Description of structured address 7', 'Description of structured address 7', 0, 0, 0, 
    'CLT.ADRSTR7', 0, NULL, 'Description of structured address 7');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('4164', 'frmListeCLTOPR01', 'CLT', 'ADRSTR10', 50, 
    'Description of structured address 10', 'Description of structured address 10', 0, 0, 0, 
    'CLT.ADRSTR10', 0, NULL, 'Description of structured address 10');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('4165', 'frmListeCLTOPR01', 'CLT', 'AVT_NUMAVN', 22, 
    'NOT USED!!!', 'NOT USED!!!', 0, 0, 0, 
    'CLT.AVT_NUMAVN', 0, NULL, 'NOT USED!!!');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('4166', 'frmListeCLTOPR01', 'CLT', 'TLD', 20, 
    'Telephone du domicile', 'Telephone du domicile', 0, 1, 0, 
    'CLT.TLD', 0, NULL, 'Telephone du domicile');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('4167', 'frmListeCLTOPR01', 'CLT', 'ADRLBR', 2000, 
    'Adresse', 'Adresse', 0, 1, 0, 
    'SUBSTR(REPLACE(REPLACE(CLT.ADRLBR,CHR(10),'' ''),CHR(13),'' ''),1,254)', 0, NULL, 'Adresse');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('4168', 'frmListeCLTOPR01', 'CLT', 'CHPLIB4', 30, 
    '4th free field', '4th free field', 0, 0, 0, 
    'CLT.CHPLIB4', 0, NULL, '4th free field');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('4169', 'frmListeCLTOPR01', 'CLT', 'IDTT2', 6, 
    'Associated typology ID 2', 'Associated typology ID 2', 0, 0, 0, 
    'CLT.IDTT2', 0, NULL, 'Associated typology ID 2');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('4170', 'frmListeCLTOPR01', 'CLT', 'D5', 7, 
    'Adaptable field date 5', 'Adaptable field date 5', 0, 0, 0, 
    'TO_CHAR(CLT.D5,''DD/MM/YYYY'')', 0, NULL, 'Adaptable field date 5');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('4171', 'frmListeCLTOPR01', 'CLT', 'ADRSTR2', 50, 
    'Description of structured address 2', 'Description of structured address 2', 0, 0, 0, 
    'CLT.ADRSTR2', 0, NULL, 'Description of structured address 2');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('4172', 'frmListeCLTOPR01', 'CLT', 'CHPLIB5', 254, 
    'Lib 5', 'Lib 5', 0, 0, 0, 
    'CLT.CHPLIB5', 0, NULL, 'Lib 5');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('4173', 'frmListeCLTOPR01', 'CLT', 'SQCCNT', 22, 
    'Contact serial number', 'Contact serial number', 0, 1, 0, 
    'CLT.SQCCNT', 0, NULL, 'Contact serial number');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('4174', 'frmListeINTINT01', 'SRV', 'CODSRV', 6, 
    'Service', 'Code', 0, 1, 0, 
    'SRV.CODSRV', 0, NULL, 'Code');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('4175', 'frmListeINTINT01', 'CLT', 'DATMAJ', 7, 
    'Date de mise a jour', 'Date de mise a jour', 0, 1, 0, 
    'TO_CHAR(CLT.DATMAJ,''DD/MM/YYYY'')', 0, NULL, 'Date de mise a jour');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('4176', 'frmListeINTINT01', 'CLT', 'NOM', 40, 
    'Nom', 'Nom', 0, 1, 0, 
    'CLT.NOM', 0, NULL, 'Nom');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('4177', 'frmListeINTINT01', 'CLT', 'TLD', 20, 
    'Telephone du domicile', 'Telephone du domicile', 0, 1, 0, 
    'CLT.TLD', 0, NULL, 'Telephone du domicile');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('4178', 'frmListeINTINT01', 'CLT', 'FLD', 20, 
    'Fax du domicile', 'Fax du domicile', 0, 1, 0, 
    'CLT.FLD', 0, NULL, 'Fax du domicile');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('4179', 'frmListeINTINT01', 'CLT', 'ANCRFR', 20, 
    'Ancienne reference', 'Ancienne reference', 0, 1, 0, 
    'CLT.ANCRFR', 0, NULL, 'Ancienne reference');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('4180', 'frmListeINTINT01', 'CLT', 'CHPLIB2', 30, 
    '2nd free field', '2nd free field', 0, 0, 0, 
    'CLT.CHPLIB2', 0, NULL, '2nd free field');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('4181', 'frmListeINTINT01', 'CLT', 'T1', 6, 
    'Adaptable field typology 1', 'Adaptable field typology 1', 0, 0, 0, 
    'CLT.T1', 0, NULL, 'Adaptable field typology 1');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('4182', 'frmListeINTINT01', 'CLT', 'IDTT4', 6, 
    'Associated typology ID 4', 'Associated typology ID 4', 0, 0, 0, 
    'CLT.IDTT4', 0, NULL, 'Associated typology ID 4');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('3872', 'frmListeAFFACT01', 'INT', 'IND1', 12, 
    'Lecture 1', 'Lecture 1', 0, 1, 0, 
    'INT.IND1', 0, NULL, 'Lecture 1');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('3873', 'frmListeAFFACT01', 'INT', 'DATDEM', 12, 
    'Date de demande', 'Date de demande', 0, 1, 0, 
    'TO_CHAR(INT.DATDEM,X7UTIL.FRMDATHM)', 0, NULL, 'Date de demande');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('3874', 'frmListeAFFACT01', 'INT', 'DATEXEPRV', 12, 
    'Prévue le', 'Prevue le', 0, 1, 0, 
    'TO_CHAR(INT.DATEXEPRV,X7UTIL.FRMDATHM)', 0, NULL, 'Prevue le');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('3875', 'frmListeAFFACT01', 'INT', 'IDTMODCOU', 12, 
    'Code de la methode de coupure', 'Code de la methode de coupure', 0, 1, 0, 
    'INT.IDTMODCOU', 0, NULL, 'Code de la methode de coupure');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('3876', 'frmListeAFFACT01', 'INT', 'DATEFFEXE', 12, 
    'Executee le', 'Date de CRI', 0, 1, 0, 
    'TO_CHAR(INT.DATEFFEXE,X7UTIL.FRMDATHM)', 0, NULL, 'Date de CRI');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('3877', 'frmListeAFFACT01', 'INT', 'IDTCPRAVN', 12, 
    'Code avant intervention', 'Code avant intervention', 0, 1, 0, 
    'INT.IDTCPRAVN', 0, NULL, 'Code avant intervention');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('3878', 'frmListeAFFACT01', 'INT', 'IDTMTFINTLIB', 12, 
    'Motif de l''intervention', 'Motif de l''intervention', 0, 1, 0, 
    '(SELECT M1.TypoStd FROM TYPOSTD M1 WHERE M1.IdtTypoStd = INT.IdtMtfInt AND M1.CodTypoStd = ''MTFINT'')', 0, NULL, 'Motif de l''intervention');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('3879', 'frmListeAFFACT01', 'INT', 'IDTINT', 12, 
    'Numéro', 'Code', 0, 1, 0, 
    'INT.IDTINT', 0, NULL, 'Code');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('3880', 'frmListeAFFACT01', 'INT', 'DATPOSAVN', 12, 
    'Date d''installation avant intervention', 'Date d''installation avant intervention', 0, 1, 0, 
    'TO_CHAR(INT.DATPOSAVN,X7UTIL.FRMDAT)', 0, NULL, 'Date d''installation avant intervention');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('3881', 'frmListeAFFACT01', 'INT', 'DMTPNTCPG', 12, 
    'Diametre du point de comptage', 'Diametre du point de comptage', 0, 1, 0, 
    'INT.DMTPNTCPG', 0, NULL, 'Diametre du point de comptage');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('3882', 'frmListeAFFACT01', 'INT', 'IND1AVN', 12, 
    'Lecture 1 avant intervention', 'Lecture 1 avant intervention', 0, 1, 0, 
    'INT.IND1AVN', 0, NULL, 'Lecture 1 avant intervention');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('3883', 'frmListeAFFACT01', 'INT', 'MTRAGT', 12, 
    'Agent', 'Agent', 0, 1, 0, 
    'INT.MTRAGT', 0, NULL, 'Agent');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('3884', 'frmListeAFFACT01', 'INT', 'IND1APR', 12, 
    'Lecture 1 apres intervention', 'Lecture 1 apres intervention', 0, 1, 0, 
    'INT.IND1APR', 0, NULL, 'Lecture 1 apres intervention');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('3885', 'frmListeAFFACT01', 'PNTCPG', 'RGLDSJ', 22, 
    'Circuit breaker setting', 'Circuit breaker setting', 0, 1, 0, 
    'PNTCPG.RGLDSJ', 0, NULL, 'Circuit breaker setting');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('3886', 'frmListeAFFACT01', 'PNTCPG', 'DATCOU', 7, 
    'Date de coupure', 'Date de coupure', 0, 1, 0, 
    'TO_CHAR(PNTCPG.DATCOU,''DD/MM/YYYY'')', 0, NULL, 'Date de coupure');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('3887', 'frmListeAFFACT01', 'PNTCPG', 'IDTT5', 6, 
    'Associated typology ID 5', 'Associated typology ID 5', 0, 0, 0, 
    'PNTCPG.IDTT5', 0, NULL, 'Associated typology ID 5');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('3888', 'frmListeAFFACT01', 'PNTCPG', 'A3', 40, 
    'Adaptable field string 3', 'Adaptable field string 3', 0, 0, 0, 
    'PNTCPG.A3', 0, NULL, 'Adaptable field string 3');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('3889', 'frmListeAFFACT01', 'PNTCPG', 'N1', 22, 
    'Adaptable field number 1', 'Adaptable field number 1', 0, 0, 0, 
    'PNTCPG.N1', 0, NULL, 'Adaptable field number 1');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('3890', 'frmListeAFFACT01', 'PNTCPG', 'D1', 7, 
    'Adaptable field check-box 1', 'Adaptable field check-box 1', 0, 0, 0, 
    'TO_CHAR(PNTCPG.D1,''DD/MM/YYYY'')', 0, NULL, 'Adaptable field check-box 1');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('3891', 'frmListeAFFACT01', 'PNTCPG', 'ANCRFR', 20, 
    'Ancienne reference', 'Ancienne reference', 0, 1, 0, 
    'PNTCPG.ANCRFR', 0, NULL, 'Ancienne reference');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('3892', 'frmListeAFFACT01', 'PNTCPG', 'ADRSTR7', 50, 
    'Description of structured address 7', 'Description of structured address 7', 0, 0, 0, 
    'PNTCPG.ADRSTR7', 0, NULL, 'Description of structured address 7');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('3893', 'frmListeAFFACT01', 'PNTCPG', 'IDTLOTFAC', 6, 
    'Lot de facturation', 'Lot de facturation', 0, 1, 0, 
    'PNTCPG.IDTLOTFAC', 0, NULL, 'Lot de facturation');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('3894', 'frmListeAFFACT01', 'PNTCPG', 'DMT', 22, 
    'Diamètre', 'Diametre', 0, 1, 0, 
    'PNTCPG.DMT', 0, NULL, 'Diametre');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('3895', 'frmListeAFFACT01', 'PNTCPG', 'T2', 6, 
    'Adaptable field typologie 2', 'Adaptable field typologie 2', 0, 0, 0, 
    'PNTCPG.T2', 0, NULL, 'Adaptable field typologie 2');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('3896', 'frmListeAFFACT01', 'PNTCPG', 'IDTT3', 6, 
    'Associated typology ID 3', 'Associated typology ID 3', 0, 0, 0, 
    'PNTCPG.IDTT3', 0, NULL, 'Associated typology ID 3');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('3897', 'frmListeAFFACT01', 'PNTCPG', 'A1', 40, 
    'Adaptable field string 1', 'Adaptable field string 1', 0, 0, 0, 
    'PNTCPG.A1', 0, NULL, 'Adaptable field string 1');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('3898', 'frmListeAFFACT01', 'PNTCPG', 'N5', 22, 
    'Adaptable field number 5', 'Adaptable field number 5', 0, 0, 0, 
    'PNTCPG.N5', 0, NULL, 'Adaptable field number 5');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('3899', 'frmListeAFFACT01', 'PNTCPG', 'C1', 22, 
    'Adaptable field check-box 1', 'Adaptable field check-box 1', 0, 0, 0, 
    'PNTCPG.C1', 0, NULL, 'Adaptable field check-box 1');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('3900', 'frmListeAFFACT01', 'PNTCPG', 'C3', 22, 
    'Adaptable field check-box 3', 'Adaptable field check-box 3', 0, 0, 0, 
    'PNTCPG.C3', 0, NULL, 'Adaptable field check-box 3');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('3901', 'frmListeAFFACT01', 'PNTCPG', 'D4', 7, 
    'Adaptable field check-box 4', 'Adaptable field check-box 4', 0, 0, 0, 
    'TO_CHAR(PNTCPG.D4,''DD/MM/YYYY'')', 0, NULL, 'Adaptable field check-box 4');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('3902', 'frmListeAFFACT01', 'PNTCPG', 'ADRSTR3', 50, 
    'Description of structured address 3', 'Description of structured address 3', 0, 0, 0, 
    'PNTCPG.ADRSTR3', 0, NULL, 'Description of structured address 3');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('3903', 'frmListeAFFACT01', 'PNTCPG', 'ADRSTR4', 50, 
    'Description of structured address 4', 'Description of structured address 4', 0, 0, 0, 
    'PNTCPG.ADRSTR4', 0, NULL, 'Description of structured address 4');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('3904', 'frmListeAFFACT01', 'PNTCPG', 'IDTCLTPRP', 6, 
    'Code client propriétaire', 'Code client propriétaire', 0, 1, 0, 
    'PNTCPG.IDTCLTPRP', 0, NULL, 'Code client propriétaire');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('3905', 'frmListeAFFACT01', 'PNTCPG', 'IDTLOTRCS', 6, 
    'Lot recensement', 'Lot recensement', 0, 1, 0, 
    'PNTCPG.IDTLOTRCS', 0, NULL, 'Lot recensement');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('3906', 'frmListeAFFACT01', 'PNTCPG', 'SCTCND', 22, 
    'Conductors section', 'Conductors section', 0, 1, 0, 
    'PNTCPG.SCTCND', 0, NULL, 'Conductors section');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('3907', 'frmListeAFFACT01', 'PNTCPG', 'IDTSQCGNR', 22, 
    'General sequence ID', 'General sequence ID', 0, 0, 0, 
    'PNTCPG.IDTSQCGNR', 0, NULL, 'General sequence ID');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('3908', 'frmListeAFFACT01', 'PNTCPG', 'IDTT1', 6, 
    'Associated typology ID 1', 'Associated typology ID 1', 0, 0, 0, 
    'PNTCPG.IDTT1', 0, NULL, 'Associated typology ID 1');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('3909', 'frmListeAFFACT01', 'PNTCPG', 'IDTT4', 6, 
    'Associated typology ID 4', 'Associated typology ID 4', 0, 0, 0, 
    'PNTCPG.IDTT4', 0, NULL, 'Associated typology ID 4');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('3910', 'frmListeAFFACT01', 'PNTCPG', 'N2', 22, 
    'Adaptable field number 2', 'Adaptable field number 2', 0, 0, 0, 
    'PNTCPG.N2', 0, NULL, 'Adaptable field number 2');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('3911', 'frmListeAFFACT01', 'PNTCPG', 'N4', 22, 
    'Adaptable field number 4', 'Adaptable field number 4', 0, 0, 0, 
    'PNTCPG.N4', 0, NULL, 'Adaptable field number 4');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('3912', 'frmListeAFFACT01', 'PNTCPG', 'ADRSTR6', 50, 
    'Description of structured address 6', 'Description of structured address 6', 0, 0, 0, 
    'PNTCPG.ADRSTR6', 0, NULL, 'Description of structured address 6');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('3913', 'frmListeAFFACT01', 'PNTCPG', 'CLBMINDSJ', 22, 
    'Minimum calibre circuit breaker', 'Minimum calibre circuit breaker', 0, 0, 0, 
    'PNTCPG.CLBMINDSJ', 0, NULL, 'Minimum calibre circuit breaker');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('3914', 'frmListeAFFACT01', 'PNTCPG', 'PSSTRS', 22, 
    'Puissance du transformateur', 'Puissance du transformateur', 0, 0, 0, 
    'PNTCPG.PSSTRS', 0, NULL, 'Puissance du transformateur');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('3915', 'frmListeAFFACT01', 'PNTCPG', 'RNG1', 22, 
    'Rang', 'Rang', 0, 1, 0, 
    'PNTCPG.RNG1', 0, NULL, 'Rang');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('3916', 'frmListeAFFACT01', 'PNTCPG', 'IDTUNTMSRDMT', 22, 
    'Diameter unit of measure ID', 'Diameter unit of measure ID', 0, 1, 0, 
    'PNTCPG.IDTUNTMSRDMT', 0, NULL, 'Diameter unit of measure ID');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('3917', 'frmListeAFFACT01', 'PNTCPG', 'N3', 22, 
    'Adaptable field number 3', 'Adaptable field number 3', 0, 0, 0, 
    'PNTCPG.N3', 0, NULL, 'Adaptable field number 3');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('3918', 'frmListeAFFACT01', 'PNTCPG', 'IDTTRNTYP', 6, 
    'Standard round ID', 'Tournee type', 0, 1, 0, 
    'PNTCPG.IDTTRNTYP', 0, NULL, 'Tournee type');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('3919', 'frmListeAFFACT01', 'PNTCPG', 'IDTCNTOPR', 6, 
    'Operational center ID', 'Operational center ID', 0, 1, 0, 
    'PNTCPG.IDTCNTOPR', 0, NULL, 'Operational center ID');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('3920', 'frmListeAFFACT01', 'PNTCPG', 'ADRSTR5', 50, 
    'Description of structured address 5', 'Description of structured address 5', 0, 0, 0, 
    'PNTCPG.ADRSTR5', 0, NULL, 'Description of structured address 5');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('3921', 'frmListeAFFACT01', 'PNTCPG', 'FINDRNPRDRLV', 7, 
    'Fin de la dernière période théorique de relève', 'Fin de la dernière période théorique de relève', 0, 1, 0, 
    'TO_CHAR(PNTCPG.FINDRNPRDRLV,''DD/MM/YYYY'')', 0, NULL, 'Fin de la dernière période théorique de relève');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('3922', 'frmListeAFFACT01', 'PNTCPG', 'ADRSTR9', 50, 
    'Description of structured address 9', 'Description of structured address 9', 0, 0, 0, 
    'PNTCPG.ADRSTR9', 0, NULL, 'Description of structured address 9');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('3923', 'frmListeAFFACT01', 'PNTCPG', 'DATMAJ', 7, 
    'Date de mise à jour', 'Date de mise à jour', 0, 1, 0, 
    'TO_CHAR(PNTCPG.DATMAJ,''DD/MM/YYYY'')', 0, NULL, 'Date de mise à jour');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('3924', 'frmListeAFFACT01', 'PNTCPG', 'NBRCND', 22, 
    'Number of conductors', 'Number of conductors', 0, 0, 0, 
    'PNTCPG.NBRCND', 0, NULL, 'Number of conductors');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('3925', 'frmListeAFFACT01', 'PNTCPG', 'A4', 40, 
    'Adaptable field string 4', 'Adaptable field string 4', 0, 0, 0, 
    'PNTCPG.A4', 0, NULL, 'Adaptable field string 4');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('3926', 'frmListeAFFACT01', 'PNTCPG', 'C5', 22, 
    'Adaptable field check-box 5', 'Adaptable field check-box 5', 0, 0, 0, 
    'PNTCPG.C5', 0, NULL, 'Adaptable field check-box 5');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('3927', 'frmListeAFFACT01', 'PNTCPG', 'MTRAGT', 6, 
    'ID of the employee who carries out updating', 'ID of the employee who carries out updating', 0, 1, 0, 
    'PNTCPG.MTRAGT', 0, NULL, 'ID of the employee who carries out updating');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('3928', 'frmListeAFFACT01', 'PNTCPG', 'ADRSTR8', 50, 
    'Description of structured address 8', 'Description of structured address 8', 0, 0, 0, 
    'PNTCPG.ADRSTR8', 0, NULL, 'Description of structured address 8');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('3929', 'frmListeAFFACT01', 'PNTCPG', 'IDTSIG', 22, 
    'Code SIG', 'Code SIG', 0, 1, 0, 
    'PNTCPG.IDTSIG', 0, NULL, 'Code SIG');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('3930', 'frmListeAFFACT01', 'PNTCPG', 'DATCNN', 7, 
    'Date de connexion', 'Date de connexion', 0, 1, 0, 
    'TO_CHAR(PNTCPG.DATCNN,''DD/MM/YYYY'')', 0, NULL, 'Date de connexion');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('3931', 'frmListeAFFACT01', 'PNTCPG', 'DATDCN', 7, 
    'Date de deconnexion', 'Date de deconnexion', 0, 1, 0, 
    'TO_CHAR(PNTCPG.DATDCN,''DD/MM/YYYY'')', 0, NULL, 'Date de deconnexion');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('3932', 'frmListeAFFACT01', 'PNTCPG', 'IDTTYPCPG', 22, 
    'Type de métrage', 'Type de métrage', 0, 1, 0, 
    'PNTCPG.IDTTYPCPG', 0, NULL, 'Type de métrage');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('3933', 'frmListeAFFACT01', 'PNTCPG', 'T1', 6, 
    'Adaptable field typologie 1', 'Adaptable field typologie 1', 0, 0, 0, 
    'PNTCPG.T1', 0, NULL, 'Adaptable field typologie 1');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('3934', 'frmListeAFFACT01', 'PNTCPG', 'T5', 6, 
    'Adaptable field typologie 5', 'Adaptable field typologie 5', 0, 0, 0, 
    'PNTCPG.T5', 0, NULL, 'Adaptable field typologie 5');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('3935', 'frmListeAFFACT01', 'PNTCPG', 'A5', 40, 
    'Adaptable field string 5', 'Adaptable field string 5', 0, 0, 0, 
    'PNTCPG.A5', 0, NULL, 'Adaptable field string 5');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('3936', 'frmListeAFFACT01', 'PNTCPG', 'C2', 22, 
    'Adaptable field check-box 2', 'Adaptable field check-box 2', 0, 0, 0, 
    'PNTCPG.C2', 0, NULL, 'Adaptable field check-box 2');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('3937', 'frmListeAFFACT01', 'PNTCPG', 'ADRSTR2', 50, 
    'Description of structured address 2', 'Description of structured address 2', 0, 0, 0, 
    'PNTCPG.ADRSTR2', 0, NULL, 'Description of structured address 2');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('3938', 'frmListeAFFACT01', 'PNTCPG', 'NUMENQ', 22, 
    'numéro recensement', 'numéro recensement', 0, 1, 0, 
    'PNTCPG.NUMENQ', 0, NULL, 'numéro recensement');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('3939', 'frmListeAFFACT01', 'PNTCPG', 'ADRSTR10', 50, 
    'Description of structured address 10', 'Description of structured address 10', 0, 0, 0, 
    'PNTCPG.ADRSTR10', 0, NULL, 'Description of structured address 10');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('3940', 'frmListeAFFACT01', 'PNTCPG', 'DEBDRNPRDRLV', 7, 
    'Début de période', 'Début de période', 0, 1, 0, 
    'TO_CHAR(PNTCPG.DEBDRNPRDRLV,''DD/MM/YYYY'')', 0, NULL, 'Début de période');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('3941', 'frmListeAFFACT01', 'PNTCPG', 'CLBMAXDSJ', 22, 
    'Maximum calibre of circuit breaker', 'Maximum calibre of circuit breaker', 0, 0, 0, 
    'PNTCPG.CLBMAXDSJ', 0, NULL, 'Maximum calibre of circuit breaker');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('3942', 'frmListeAFFACT01', 'PNTCPG', 'ADRLBR', 254, 
    'Adresse', 'Adresse', 0, 1, 0, 
    'SUBSTR(REPLACE(REPLACE(PNTCPG.ADRLBR,CHR(10),'' ''),CHR(13),'' ''),1,254)', 0, NULL, 'Adresse');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('3943', 'frmListeAFFACT01', 'PNTCPG', 'DATRMS', 7, 
    'Date de retablissement', 'Date de retablissement', 0, 1, 0, 
    'TO_CHAR(PNTCPG.DATRMS,''DD/MM/YYYY'')', 0, NULL, 'Date de retablissement');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('3944', 'frmListeAFFACT01', 'PNTCPG', 'IDTT2', 6, 
    'Associated typology ID 2', 'Associated typology ID 2', 0, 0, 0, 
    'PNTCPG.IDTT2', 0, NULL, 'Associated typology ID 2');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('3945', 'frmListeAFFACT01', 'PNTCPG', 'D2', 7, 
    'Adaptable field check-box 2', 'Adaptable field check-box 2', 0, 0, 0, 
    'TO_CHAR(PNTCPG.D2,''DD/MM/YYYY'')', 0, NULL, 'Adaptable field check-box 2');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('3946', 'frmListeAFFACT01', 'PNTCPG', 'D5', 7, 
    'Adaptable field check-box 5', 'Adaptable field check-box 5', 0, 0, 0, 
    'TO_CHAR(PNTCPG.D5,''DD/MM/YYYY'')', 0, NULL, 'Adaptable field check-box 5');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('3947', 'frmListeAFFACT01', 'PNTCPG', 'ADRSTR1', 50, 
    'Description of structured address 1', 'Description of structured address 1', 0, 0, 0, 
    'PNTCPG.ADRSTR1', 0, NULL, 'Description of structured address 1');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('3948', 'frmListeAFFACT01', 'PNTCPG', 'T3', 6, 
    'Adaptable field typologie 3', 'Adaptable field typologie 3', 0, 0, 0, 
    'PNTCPG.T3', 0, NULL, 'Adaptable field typologie 3');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('3949', 'frmListeAFFACT01', 'PNTCPG', 'T4', 6, 
    'Adaptable field typologie 4', 'Adaptable field typologie 4', 0, 0, 0, 
    'PNTCPG.T4', 0, NULL, 'Adaptable field typologie 4');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('3950', 'frmListeAFFACT01', 'PNTCPG', 'A2', 40, 
    'Adaptable field string 2', 'Adaptable field string 2', 0, 0, 0, 
    'PNTCPG.A2', 0, NULL, 'Adaptable field string 2');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('3951', 'frmListeAFFACT01', 'PNTCPG', 'C4', 22, 
    'Adaptable field check-box 4', 'Adaptable field check-box 4', 0, 0, 0, 
    'PNTCPG.C4', 0, NULL, 'Adaptable field check-box 4');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('3952', 'frmListeAFFACT01', 'PNTCPG', 'IDTPNTLVR', 22, 
    'Delivery point ID', 'Delivery point ID', 0, 1, 0, 
    'PNTCPG.IDTPNTLVR', 0, NULL, 'Delivery point ID');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('3953', 'frmListeAFFACT01', 'PNTCPG', 'IDTSRV', 22, 
    'Service Id', 'Service Id', 0, 1, 0, 
    'PNTCPG.IDTSRV', 0, NULL, 'Service Id');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('3954', 'frmListeAFFACT01', 'PNTCPG', 'D3', 7, 
    'Adaptable field check-box 3', 'Adaptable field check-box 3', 0, 0, 0, 
    'TO_CHAR(PNTCPG.D3,''DD/MM/YYYY'')', 0, NULL, 'Adaptable field check-box 3');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('3955', 'frmListeAFFACT01', 'PNTLVR', 'ADRLBR', 2000, 
    'Adresse', 'Adresse', 0, 1, 0, 
    'SUBSTR(REPLACE(REPLACE(PNTLVR.ADRLBR,CHR(10),'' ''),CHR(13),'' ''),1,254)', 0, NULL, 'Adresse');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('3956', 'frmListeAFFACT01', 'PNTLVR', 'A3', 40, 
    'Adaptable field string 3', 'Adaptable field string 3', 0, 0, 0, 
    'PNTLVR.A3', 0, NULL, 'Adaptable field string 3');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('3957', 'frmListeAFFACT01', 'PNTLVR', 'CODGEO6', 4, 
    'Code géographique 6', 'Code du niveau 6', 0, 1, 0, 
    'PNTLVR.CODGEO6', 0, NULL, 'Code du niveau 6');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('3958', 'frmListeAFFACT01', 'PNTLVR', 'ADRSTR9', 50, 
    'Description of structured address 9', 'Description of structured address 9', 0, 0, 0, 
    'PNTLVR.ADRSTR9', 0, NULL, 'Description of structured address 9');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('3959', 'frmListeAFFACT01', 'PNTLVR', 'DATMAJ', 7, 
    'Date de mise à jour', 'Date de mise a jour', 0, 1, 0, 
    'TO_CHAR(PNTLVR.DATMAJ,''DD/MM/YYYY'')', 0, NULL, 'Date de mise a jour');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('3960', 'frmListeAFFACT01', 'PNTLVR', 'N2', 22, 
    'Adaptable field number12', 'Adaptable field number12', 0, 0, 0, 
    'PNTLVR.N2', 0, NULL, 'Adaptable field number12');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('3961', 'frmListeAFFACT01', 'PNTLVR', 'Occupé', 20, 
    'Occupé', 'Occupé', 0, 1, 0, 
    'DECODE(PNTLVR.Occ,1,''Oui'',''Non'')', 0, NULL, 'Occupé');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('3962', 'frmListeAFFACT01', 'PNTLVR', 'IdtCntOpr', 10, 
    'CO', 'CO', 0, 1, 0, 
    'PNTLVR.IdtCntOpr', 0, NULL, 'CO');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('3963', 'frmListeAFFACT01', 'PNTLVR', 'ADRSTR10', 50, 
    'Description of structured address 10', 'Description of structured address 10', 0, 0, 0, 
    'PNTLVR.ADRSTR10', 0, NULL, 'Description of structured address 10');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('3964', 'frmListeAFFACT01', 'PNTLVR', 'ADRSTR6', 50, 
    'Description of structured address 6', 'Description of structured address 6', 0, 0, 0, 
    'PNTLVR.ADRSTR6', 0, NULL, 'Description of structured address 6');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('3965', 'frmListeAFFACT01', 'PNTLVR', 'T2', 6, 
    'Adaptable field typologie 2', 'Adaptable field typologie 2', 0, 0, 0, 
    'PNTLVR.T2', 0, NULL, 'Adaptable field typologie 2');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('3966', 'frmListeAFFACT01', 'PNTLVR', 'IDTDCPGGR', 29, 
    'Découpage géographique', 'Adresse geographique', 0, 1, 0, 
    'PNTLVR.IDTDCPGGR', 0, NULL, 'Adresse geographique');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('3967', 'frmListeAFFACT01', 'PNTLVR', 'OCC', 22, 
    'Occupé', 'Occupation', 0, 1, 0, 
    'PNTLVR.OCC', 0, NULL, 'Occupation');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('3968', 'frmListeAFFACT01', 'PNTLVR', 'SQCPNTCPG', 22, 
    'Metering point last used serial number', 'Metering point last used serial number', 0, 1, 0, 
    'PNTLVR.SQCPNTCPG', 0, NULL, 'Metering point last used serial number');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('3969', 'frmListeAFFACT01', 'PNTLVR', 'CODGEO4', 4, 
    'Code géographique 4', 'Code du niveau 4', 0, 1, 0, 
    'PNTLVR.CODGEO4', 0, NULL, 'Code du niveau 4');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('3970', 'frmListeAFFACT01', 'PNTLVR', 'Datmaj', 20, 
    'Mise à jour le:', 'Date de mise a jour', 0, 1, 0, 
    'TO_CHAR(PNTLVR.DATMAJ,X7UTIL.FRMDAT)', 0, NULL, 'Date de mise a jour');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('3971', 'frmListeAFFACT01', 'PNTLVR', 'A5', 40, 
    'Adaptable field string 5', 'Adaptable field string 5', 0, 0, 0, 
    'PNTLVR.A5', 0, NULL, 'Adaptable field string 5');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('3972', 'frmListeAFFACT01', 'PNTLVR', 'MTRAGT', 6, 
    'Agent', 'Agent', 0, 1, 0, 
    'PNTLVR.MTRAGT', 0, NULL, 'Agent');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('3973', 'frmListeAFFACT01', 'PNTLVR', 'A1', 40, 
    'Adaptable field string 1', 'Adaptable field string 1', 0, 0, 0, 
    'PNTLVR.A1', 0, NULL, 'Adaptable field string 1');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('3974', 'frmListeAFFACT01', 'PNTLVR', 'CODGEO3', 4, 
    'Code géographique 3', 'Code du niveau 3', 0, 1, 0, 
    'PNTLVR.CODGEO3', 0, NULL, 'Code du niveau 3');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('3975', 'frmListeAFFACT01', 'PNTLVR', 'ADRSTR5', 50, 
    'Description of structured address 5', 'Description of structured address 5', 0, 0, 0, 
    'PNTLVR.ADRSTR5', 0, NULL, 'Description of structured address 5');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('3976', 'frmListeAFFACT01', 'PNTLVR', 'D5', 7, 
    'Adaptable field date 5', 'Adaptable field date 5', 0, 0, 0, 
    'TO_CHAR(PNTLVR.D5,''DD/MM/YYYY'')', 0, NULL, 'Adaptable field date 5');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('3977', 'frmListeAFFACT01', 'PNTLVR', 'N4', 22, 
    'Adaptable field number 4', 'Adaptable field number 4', 0, 0, 0, 
    'PNTLVR.N4', 0, NULL, 'Adaptable field number 4');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('3978', 'frmListeAFFACT01', 'PNTLVR', 'IDTTYPHBT', 6, 
    'Type d''habitation', 'Type d''habitation', 0, 1, 0, 
    'PNTLVR.IDTTYPHBT', 0, NULL, 'Type d''habitation');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('3979', 'frmListeAFFACT01', 'PNTLVR', 'IDTT2', 6, 
    'Associated typology ID 2', 'Associated typology ID 2', 0, 0, 0, 
    'PNTLVR.IDTT2', 0, NULL, 'Associated typology ID 2');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('3980', 'frmListeAFFACT01', 'PNTLVR', 'C1', 22, 
    'Adaptable field check-box 1', 'Adaptable field check-box 1', 0, 0, 0, 
    'PNTLVR.C1', 0, NULL, 'Adaptable field check-box 1');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('3981', 'frmListeAFFACT01', 'PNTLVR', 'IDTT4', 6, 
    'Associated typology ID 4', 'Associated typology ID 4', 0, 0, 0, 
    'PNTLVR.IDTT4', 0, NULL, 'Associated typology ID 4');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('3982', 'frmListeAFFACT01', 'PNTLVR', 'D1', 7, 
    'Adaptable field date 1', 'Adaptable field date 1', 0, 0, 0, 
    'TO_CHAR(PNTLVR.D1,''DD/MM/YYYY'')', 0, NULL, 'Adaptable field date 1');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('3983', 'frmListeAFFACT01', 'PNTLVR', 'D2', 7, 
    'Adaptable field date 2', 'Adaptable field date 2', 0, 0, 0, 
    'TO_CHAR(PNTLVR.D2,''DD/MM/YYYY'')', 0, NULL, 'Adaptable field date 2');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('3984', 'frmListeAFFACT01', 'PNTLVR', 'ADRSTR1', 50, 
    'Description of structured address 1', 'Description of structured address 1', 0, 0, 0, 
    'PNTLVR.ADRSTR1', 0, NULL, 'Description of structured address 1');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('3985', 'frmListeAFFACT01', 'PNTLVR', 'ADRSTR2', 50, 
    'Description of structured address 2', 'Description of structured address 2', 0, 0, 0, 
    'PNTLVR.ADRSTR2', 0, NULL, 'Description of structured address 2');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('3986', 'frmListeAFFACT01', 'PNTLVR', 'A4', 40, 
    'Adaptable field string 4', 'Adaptable field string 4', 0, 0, 0, 
    'PNTLVR.A4', 0, NULL, 'Adaptable field string 4');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('3987', 'frmListeAFFACT01', 'PNTLVR', 'ANCRFR', 20, 
    'Former reference', 'Ancienne reference', 0, 1, 0, 
    'PNTLVR.ANCRFR', 0, NULL, 'Ancienne reference');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('3988', 'frmListeAFFACT01', 'PNTLVR', 'A2', 40, 
    'Adaptable field string  2', 'Adaptable field string  2', 0, 0, 0, 
    'PNTLVR.A2', 0, NULL, 'Adaptable field string  2');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('3989', 'frmListeAFFACT01', 'PNTLVR', 'CODGEO5', 4, 
    'Code géographique 5', 'Code du niveau 5', 0, 1, 0, 
    'PNTLVR.CODGEO5', 0, NULL, 'Code du niveau 5');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('3990', 'frmListeAFFACT01', 'PNTLVR', 'IDTCNTOPR', 6, 
    'Centre opérationel', 'Centre opérationel', 0, 1, 0, 
    'PNTLVR.IDTCNTOPR', 0, NULL, 'Centre opérationel');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('3991', 'frmListeAFFACT01', 'PNTLVR', 'ADRSTR7', 50, 
    'Description of structured address 7', 'Description of structured address 7', 0, 0, 0, 
    'PNTLVR.ADRSTR7', 0, NULL, 'Description of structured address 7');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('3992', 'frmListeAFFACT01', 'PNTLVR', 'IDTT3', 6, 
    'Associated typology ID 3', 'Associated typology ID 3', 0, 0, 0, 
    'PNTLVR.IDTT3', 0, NULL, 'Associated typology ID 3');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('3993', 'frmListeAFFACT01', 'PNTLVR', 'ADRSTR3', 50, 
    'Description of structured address 3', 'Description of structured address 3', 0, 0, 0, 
    'PNTLVR.ADRSTR3', 0, NULL, 'Description of structured address 3');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('3994', 'frmListeAFFACT01', 'PNTLVR', 'T1', 6, 
    'Adaptable field typologie 1', 'Adaptable field typologie 1', 0, 0, 0, 
    'PNTLVR.T1', 0, NULL, 'Adaptable field typologie 1');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('3995', 'frmListeAFFACT01', 'PNTLVR', 'D4', 7, 
    'Adaptable field date 4', 'Adaptable field date 4', 0, 0, 0, 
    'TO_CHAR(PNTLVR.D4,''DD/MM/YYYY'')', 0, NULL, 'Adaptable field date 4');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('3996', 'frmListeAFFACT01', 'PNTLVR', 'CODGEO1', 5, 
    'Code géographique 1', 'Code du niveau 1', 0, 1, 0, 
    'PNTLVR.CODGEO1', 0, NULL, 'Code du niveau 1');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('3997', 'frmListeAFFACT01', 'PNTLVR', 'T5', 6, 
    'Adaptable field typologie 5', 'Adaptable field typologie 5', 0, 0, 0, 
    'PNTLVR.T5', 0, NULL, 'Adaptable field typologie 5');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('3998', 'frmListeAFFACT01', 'PNTLVR', 'IDTSQCGNR', 22, 
    'General identifier', 'General identifier', 0, 0, 0, 
    'PNTLVR.IDTSQCGNR', 0, NULL, 'General identifier');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('3999', 'frmListeAFFACT01', 'PNTLVR', 'C3', 22, 
    'Adaptable field check-box 3', 'Adaptable field check-box 3', 0, 0, 0, 
    'PNTLVR.C3', 0, NULL, 'Adaptable field check-box 3');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('4000', 'frmListeAFFACT01', 'PNTLVR', 'C4', 22, 
    'Adaptable field check-box 4', 'Adaptable field check-box 4', 0, 0, 0, 
    'PNTLVR.C4', 0, NULL, 'Adaptable field check-box 4');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('4001', 'frmListeAFFACT01', 'PNTLVR', 'IDTT1', 6, 
    'Associated typology ID 1', 'Associated typology ID 1', 0, 0, 0, 
    'PNTLVR.IDTT1', 0, NULL, 'Associated typology ID 1');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('4002', 'frmListeAFFACT01', 'PNTLVR', 'IDTPNTLVR', 200, 
    'Code', 'Identifiant interne', 0, 1, 0, 
    'substr(X7UTIL.LIBPNTLVR(PNTLVR.IDTPNTLVR),1,250)', 0, NULL, 'Identifiant interne');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('4003', 'frmListeAFFACT01', 'PNTLVR', 'NUMORD', 22, 
    'Number in the standard round', 'Numero d''ordre', 0, 1, 0, 
    'PNTLVR.NUMORD', 0, NULL, 'Numero d''ordre');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('4004', 'frmListeAFFACT01', 'PNTLVR', 'C5', 22, 
    'Adaptable field check-box 5', 'Adaptable field check-box 5', 0, 0, 0, 
    'PNTLVR.C5', 0, NULL, 'Adaptable field check-box 5');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('4005', 'frmListeAFFACT01', 'PNTLVR', 'IDTT5', 6, 
    'Associated typology ID 5', 'Associated typology ID 5', 0, 0, 0, 
    'PNTLVR.IDTT5', 0, NULL, 'Associated typology ID 5');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('4006', 'frmListeAFFACT01', 'PNTLVR', 'ADRSTR4', 50, 
    'Description of structured address 4', 'Description of structured address 4', 0, 0, 0, 
    'PNTLVR.ADRSTR4', 0, NULL, 'Description of structured address 4');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('4007', 'frmListeAFFACT01', 'PNTLVR', 'T4', 6, 
    'Adaptable field typologie 4', 'Adaptable field typologie 4', 0, 0, 0, 
    'PNTLVR.T4', 0, NULL, 'Adaptable field typologie 4');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('4008', 'frmListeAFFACT01', 'PNTLVR', 'T3', 6, 
    'Adaptable field typologie 3', 'Adaptable field typologie 3', 0, 0, 0, 
    'PNTLVR.T3', 0, NULL, 'Adaptable field typologie 3');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('4009', 'frmListeAFFACT01', 'PNTLVR', 'C2', 22, 
    'Adaptable field check-box 2', 'Adaptable field check-box 2', 0, 0, 0, 
    'PNTLVR.C2', 0, NULL, 'Adaptable field check-box 2');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('4010', 'frmListeAFFACT01', 'PNTLVR', 'ADRSTR8', 50, 
    'Description of structured address 8', 'Description of structured address 8', 0, 0, 0, 
    'PNTLVR.ADRSTR8', 0, NULL, 'Description of structured address 8');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('4011', 'frmListeAFFACT01', 'PNTLVR', 'D3', 7, 
    'Adaptable field date 3', 'Adaptable field date 3', 0, 0, 0, 
    'TO_CHAR(PNTLVR.D3,''DD/MM/YYYY'')', 0, NULL, 'Adaptable field date 3');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('4012', 'frmListeAFFACT01', 'PNTLVR', 'N5', 22, 
    'Adaptable field number 5', 'Adaptable field number 5', 0, 0, 0, 
    'PNTLVR.N5', 0, NULL, 'Adaptable field number 5');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('4013', 'frmListeAFFACT01', 'PNTLVR', 'CODGEO2', 4, 
    'Code géographique 2', 'Code du niveau 2', 0, 1, 0, 
    'PNTLVR.CODGEO2', 0, NULL, 'Code du niveau 2');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('4014', 'frmListeAFFACT01', 'PNTLVR', 'N1', 22, 
    'Adaptable field number1', 'Adaptable field number1', 0, 0, 0, 
    'PNTLVR.N1', 0, NULL, 'Adaptable field number1');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('4015', 'frmListeAFFACT01', 'PNTLVR', 'IDTPNTLVR', 22, 
    'Internal Delivery point ID', 'Identifiant interne', 0, 0, 0, 
    'PNTLVR.IDTPNTLVR', 0, NULL, 'Identifiant interne');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('4016', 'frmListeAFFACT01', 'PNTLVR', 'IDTENQ', 22, 
    'Investigation ID', 'Investigation ID', 0, 1, 0, 
    'PNTLVR.IDTENQ', 0, NULL, 'Investigation ID');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('4017', 'frmListeAFFACT01', 'PNTLVR', 'N3', 22, 
    'Adaptable field number13', 'Adaptable field number13', 0, 0, 0, 
    'PNTLVR.N3', 0, NULL, 'Adaptable field number13');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('4018', 'frmListeCLTOPR01', 'CPTCLT', 'IDTBNQ', 22, 
    'Code banque', 'Code banque', 0, 1, 0, 
    'CPTCLT.IDTBNQ', 0, NULL, 'Code banque');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('4019', 'frmListeCLTOPR01', 'CPTCLT', 'IDTDVS', 6, 
    'Devise', 'Devise', 0, 1, 0, 
    'CPTCLT.IDTDVS', 0, NULL, 'Devise');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('4020', 'frmListeCLTOPR01', 'CPTCLT', 'DATCRT', 22, 
    'Date oper', 'Date oper', 0, 1, 0, 
    '(SELECT TO_CHAR(MAX(DATCRT),X7UTIL.FRMDAT)DATCRT FROM OPR WHERE CPTCLT.IDTCLT=OPR.IDTCLT)', 0, NULL, 'Date oper');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('4021', 'frmListeCLTOPR01', 'CPTCLT', 'DATINTRTR', 7, 
    'Date du dernier calcul des interets de retard', 'Date du dernier calcul des interets de retard', 0, 1, 0, 
    'TO_CHAR(CPTCLT.DATINTRTR,X7UTIL.FRMDAT)', 0, NULL, 'Date du dernier calcul des interets de retard');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('4022', 'frmListeCLTOPR01', 'CPTCLT', 'DATDRNRLC', 22, 
    'Date de derniere relance', 'Date de derniere relance', 0, 1, 0, 
    'TO_CHAR(CPTCLT.DATDRNRLC,X7UTIL.FRMDAT)', 0, NULL, 'Date de derniere relance');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('4023', 'frmListeCLTOPR01', 'CPTCLT', 'IDTCLT', 6, 
    'Numéro', 'Numéro', 0, 1, 0, 
    'CPTCLT.IDTCLT', 0, NULL, 'Numéro');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('4024', 'frmListeCLTOPR01', 'CPTCLT', 'CPTDVS', 22, 
    'Compte en devise', 'Compte en devise', 0, 1, 0, 
    'CPTCLT.CPTDVS', 0, NULL, 'Compte en devise');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('4025', 'frmListeCLTOPR01', 'CPTCLT', 'DATFRM', 7, 
    'Date de fermeture', 'Date de fermeture', 0, 1, 0, 
    'TO_CHAR(CPTCLT.DATFRM,X7UTIL.FRMDAT)', 0, NULL, 'Date de fermeture');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('4026', 'frmListeCLTOPR01', 'CPTCLT', 'DATMAJSLD', 7, 
    'Date de mise a jour du solde', 'Date de mise a jour du solde', 0, 1, 0, 
    'TO_CHAR(CPTCLT.DATMAJSLD,X7UTIL.FRMDAT)', 0, NULL, 'Date de mise a jour du solde');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('4027', 'frmListeCLTOPR01', 'CPTCLT', 'DATOVR', 7, 
    'Date d''ouverture', 'Date d''ouverture', 0, 1, 0, 
    'TO_CHAR(CPTCLT.DATOVR,X7UTIL.FRMDAT)', 0, NULL, 'Date d''ouverture');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('4028', 'frmListeCLTOPR01', 'CPTCLT', 'DATMAJCPTCLT', 7, 
    'Date de mise a jour du compte client', 'Date de mise a jour du compte client', 0, 1, 0, 
    'TO_CHAR(CPTCLT.DATMAJCPTCLT,X7UTIL.FRMDAT)', 0, NULL, 'Date de mise a jour du compte client');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('4029', 'frmListeCLTOPR01', 'CPTCLT', 'IDTCNTOPR', 6, 
    'CO', 'CO', 0, 1, 0, 
    'CPTCLT.IdtCntOpr', 0, NULL, 'CO');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('4030', 'frmListeCLTOPR01', 'CPTCLT', 'IDTCNTSNS', 6, 
    'CS', 'CS', 0, 1, 0, 
    'CPTCLT.IdtCodSns', 0, NULL, 'CS');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('4031', 'frmListeCLTOPR01', 'CPTCLT', 'ECHEANCIERENCOURS( CPTCLT.IDTCLT )', 22, 
    'Echeancier en cours', 'Echeancier en cours', 0, 1, 0, 
    'ECHEANCIERENCOURS( CPTCLT.IDTCLT )', 0, NULL, 'Echeancier en cours');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('4032', 'frmListeCLTOPR01', 'CTR_ALL', 'IDTT4', 6, 
    'Associated typology ID 4', 'Associated typology ID 4', 0, 0, 0, 
    'CTR_ALL.IDTT4', 0, NULL, 'Associated typology ID 4');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('4033', 'frmListeCLTOPR01', 'CTR_ALL', 'IDTCLTSSC', 6, 
    'Client souscripteur', 'Code souscripteur', 0, 1, 0, 
    'CTR_ALL.IDTCLTSSC', 0, NULL, 'Code souscripteur');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('4034', 'frmListeCLTOPR01', 'CTR_ALL', 'DEBDRNPRDFCT', 7, 
    'Last billed period (starting date)', 'Last billed period (starting date)', 0, 1, 0, 
    'TO_CHAR(CTR_ALL.DEBDRNPRDFCT,''DD/MM/YYYY'')', 0, NULL, 'Last billed period (starting date)');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('4035', 'frmListeCLTOPR01', 'CTR_ALL', 'ETTCTR', 22, 
    'Contract status ( 1< normal>, 2<creation mode of the amendment>, 3<cancellation mode>, 4<creation mode>)', 'Contract status ( 1< normal>, 2<creation mode of the amendment>, 3<cancellation mode>, 4<creation mode>)', 0, 1, 0, 
    'CTR_ALL.ETTCTR', 0, NULL, 'Contract status ( 1< normal>, 2<creation mode of the amendment>, 3<cancellation mode>, 4<creation mode>)');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('4036', 'frmListeCLTOPR01', 'CTR_ALL', 'IDTRCVTYP', 6, 
    'Debt recovery type ID', 'Recouvrement type', 0, 1, 0, 
    'CTR_ALL.IDTRCVTYP', 0, NULL, 'Recouvrement type');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('4037', 'frmListeCLTOPR01', 'CTR_ALL', 'IDTT1', 6, 
    'Associated typology ID 1', 'Associated typology ID 1', 0, 0, 0, 
    'CTR_ALL.IDTT1', 0, NULL, 'Associated typology ID 1');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('4038', 'frmListeCLTOPR01', 'CTR_ALL', 'C2', 22, 
    'Adaptable field check-box 2', 'Adaptable field check-box 2', 0, 0, 0, 
    'CTR_ALL.C2', 0, NULL, 'Adaptable field check-box 2');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('4039', 'frmListeCLTOPR01', 'CTR_ALL', 'N3', 22, 
    'Adaptable field number 3', 'Adaptable field number 3', 0, 0, 0, 
    'CTR_ALL.N3', 0, NULL, 'Adaptable field number 3');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('4040', 'frmListeCLTOPR01', 'CTR_ALL', 'IDTPNTCPG', 22, 
    'Metering point ID', 'Metering point ID', 0, 1, 0, 
    'CTR_ALL.IDTPNTCPG', 0, NULL, 'Metering point ID');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('4041', 'frmListeCLTOPR01', 'CTR_ALL', 'T2', 6, 
    'Adaptable field typologie 2', 'Adaptable field typologie 2', 0, 0, 0, 
    'CTR_ALL.T2', 0, NULL, 'Adaptable field typologie 2');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('4042', 'frmListeCLTOPR01', 'CTR_ALL', 'C3', 22, 
    'Adaptable field check-box 3', 'Adaptable field check-box 3', 0, 0, 0, 
    'CTR_ALL.C3', 0, NULL, 'Adaptable field check-box 3');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('4043', 'frmListeCLTOPR01', 'CTR_ALL', 'C4', 22, 
    'Adaptable field check-box 4', 'Adaptable field check-box 4', 0, 0, 0, 
    'CTR_ALL.C4', 0, NULL, 'Adaptable field check-box 4');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('4044', 'frmListeCLTOPR01', 'CTR_ALL', 'D1', 7, 
    'Adaptable field date 1', 'Adaptable field date 1', 0, 0, 0, 
    'TO_CHAR(CTR_ALL.D1,''DD/MM/YYYY'')', 0, NULL, 'Adaptable field date 1');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('4045', 'frmListeCLTOPR01', 'CTR_ALL', 'D4', 7, 
    'Adaptable field date 4', 'Adaptable field date 4', 0, 0, 0, 
    'TO_CHAR(CTR_ALL.D4,''DD/MM/YYYY'')', 0, NULL, 'Adaptable field date 4');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('4046', 'frmListeCLTOPR01', 'CTR_ALL', 'DATMAJ', 7, 
    'Date de mise à jour', 'Date de mise à jour', 0, 1, 0, 
    'TO_CHAR(CTR_ALL.DATMAJ,''DD/MM/YYYY'')', 0, NULL, 'Date de mise à jour');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('4047', 'frmListeCLTOPR01', 'CTR_ALL', 'T4', 6, 
    'Adaptable field typologie 4', 'Adaptable field typologie 4', 0, 0, 0, 
    'CTR_ALL.T4', 0, NULL, 'Adaptable field typologie 4');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('4048', 'frmListeCLTOPR01', 'CTR_ALL', 'N2', 22, 
    'Adaptable field number 2', 'Adaptable field number 2', 0, 0, 0, 
    'CTR_ALL.N2', 0, NULL, 'Adaptable field number 2');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('4049', 'frmListeCLTOPR01', 'CTR_ALL', 'IDTCTR', 10, 
    'Numéro', 'Numero', 0, 1, 0, 
    'CTR_ALL.IDTCTR', 0, NULL, 'Numero');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('4050', 'frmListeCLTOPR01', 'CTR_ALL', 'IDTCLTDST', 6, 
    'Addressee ID', 'Code destinataire', 0, 1, 0, 
    'CTR_ALL.IDTCLTDST', 0, NULL, 'Code destinataire');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('4051', 'frmListeCLTOPR01', 'CTR_ALL', 'D2', 7, 
    'Adaptable field date 2', 'Adaptable field date 2', 0, 0, 0, 
    'TO_CHAR(CTR_ALL.D2,''DD/MM/YYYY'')', 0, NULL, 'Adaptable field date 2');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('4495', 'frmListeCMMCTR01', 'CPR', 'T3', 6, 
    'Adaptable field typology 3', 'Adaptable field typology 3', 0, 0, 0, 
    'CPR.T3', 0, NULL, 'Adaptable field typology 3');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('4496', 'frmListeCMMCTR01', 'CPR', 'IDTT3', 6, 
    'Associated typology ID 3', 'Associated typology ID 3', 0, 0, 0, 
    'CPR.IDTT3', 0, NULL, 'Associated typology ID 3');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('4497', 'frmListeCMMCTR01', 'CPR', 'A1', 40, 
    'Adaptable field string 1', 'Adaptable field string 1', 0, 0, 0, 
    'CPR.A1', 0, NULL, 'Adaptable field string 1');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('4498', 'frmListeCMMCTR01', 'CPR', 'D4', 7, 
    'Adaptable field date 4', 'Adaptable field date 4', 0, 0, 0, 
    'TO_CHAR(CPR.D4,''DD/MM/YYYY'')', 0, NULL, 'Adaptable field date 4');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('4499', 'frmListeCMMCTR01', 'CPR', 'D5', 7, 
    'Adaptable field date 5', 'Adaptable field date 5', 0, 0, 0, 
    'TO_CHAR(CPR.D5,''DD/MM/YYYY'')', 0, NULL, 'Adaptable field date 5');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('4500', 'frmListeCMMCTR01', 'CPR', 'DATRVS', 7, 
    'Date de revision', 'Date de revision', 0, 1, 0, 
    'TO_CHAR(CPR.DATRVS,''DD/MM/YYYY'')', 0, NULL, 'Date de revision');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('4501', 'frmListeCMMCTR01', 'CPR', 'IDTTYPCPR', 6, 
    'Type de compteur', 'Type de compteur', 0, 1, 0, 
    'CPR.IDTTYPCPR', 0, NULL, 'Type de compteur');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('4502', 'frmListeCMMCTR01', 'CPR', 'DATETL', 7, 
    'Date d''etalonnage', 'Date d''etalonnage', 0, 1, 0, 
    'TO_CHAR(CPR.DATETL,''DD/MM/YYYY'')', 0, NULL, 'Date d''etalonnage');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('4503', 'frmListeCMMCTR01', 'CPR', 'IDTT1', 6, 
    'Associated typology ID 1', 'Associated typology ID 1', 0, 0, 0, 
    'CPR.IDTT1', 0, NULL, 'Associated typology ID 1');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('4504', 'frmListeCMMCTR01', 'CPR', 'IDTT4', 6, 
    'Associated typology ID 4', 'Associated typology ID 4', 0, 0, 0, 
    'CPR.IDTT4', 0, NULL, 'Associated typology ID 4');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('4505', 'frmListeCMMCTR01', 'CPR', 'N2', 22, 
    'Adaptable field number 2', 'Adaptable field number 2', 0, 0, 0, 
    'CPR.N2', 0, NULL, 'Adaptable field number 2');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('4506', 'frmListeCMMCTR01', 'CPR', 'C2', 22, 
    'Adaptable field check-box 2', 'Adaptable field check-box 2', 0, 0, 0, 
    'CPR.C2', 0, NULL, 'Adaptable field check-box 2');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('4507', 'frmListeCMMCTR01', 'CPR', 'IDTCPR', 22, 
    'Identifiant interne', 'Identifiant interne', 0, 1, 0, 
    'CPR.IDTCPR', 0, NULL, 'Identifiant interne');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('4508', 'frmListeCMMCTR01', 'CPR', 'SQCCNS', 22, 
    'Consumption serial number', 'Consumption serial number', 0, 1, 0, 
    'CPR.SQCCNS', 0, NULL, 'Consumption serial number');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('4509', 'frmListeCMMCTR01', 'CPR', 'SQCIND', 22, 
    'Serial number of the index of the meter', 'Serial number of the index of the meter', 0, 1, 0, 
    'CPR.SQCIND', 0, NULL, 'Serial number of the index of the meter');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('4510', 'frmListeCMMCTR01', 'CPR', 'T1', 6, 
    'Adaptable field typology 1', 'Adaptable field typology 1', 0, 0, 0, 
    'CPR.T1', 0, NULL, 'Adaptable field typology 1');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('4511', 'frmListeCMMCTR01', 'CPR', 'T2', 6, 
    'Adaptable field typology 2', 'Adaptable field typology 2', 0, 0, 0, 
    'CPR.T2', 0, NULL, 'Adaptable field typology 2');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('4512', 'frmListeCMMCTR01', 'CPR', 'A4', 40, 
    'Adaptable field string 4', 'Adaptable field string 4', 0, 0, 0, 
    'CPR.A4', 0, NULL, 'Adaptable field string 4');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('4513', 'frmListeCMMCTR01', 'CPR', 'IDTCODOBS', 22, 
    'Observation code ID', 'Observation code ID', 0, 1, 0, 
    'CPR.IDTCODOBS', 0, NULL, 'Observation code ID');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('4514', 'frmListeCMMCTR01', 'CPR', 'T4', 6, 
    'Adaptable field typology 4', 'Adaptable field typology 4', 0, 0, 0, 
    'CPR.T4', 0, NULL, 'Adaptable field typology 4');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('4515', 'frmListeCMMCTR01', 'CPR', 'IDTAGT', 6, 
    'Employee ID', 'Employee ID', 0, 1, 0, 
    'CPR.IDTAGT', 0, NULL, 'Employee ID');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('4516', 'frmListeCMMCTR01', 'CPR', 'C1', 22, 
    'Adaptable field check-box 1', 'Adaptable field check-box 1', 0, 0, 0, 
    'CPR.C1', 0, NULL, 'Adaptable field check-box 1');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('4517', 'frmListeCMMCTR01', 'CPR', 'D2', 7, 
    'Adaptable field date 2', 'Adaptable field date 2', 0, 0, 0, 
    'TO_CHAR(CPR.D2,''DD/MM/YYYY'')', 0, NULL, 'Adaptable field date 2');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('4518', 'frmListeCMMCTR01', 'CPR', 'DATMAJ', 7, 
    'Date de mise à jour', 'Date de mise à jour', 0, 1, 0, 
    'TO_CHAR(CPR.DATMAJ,''DD/MM/YYYY'')', 0, NULL, 'Date de mise à jour');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('4519', 'frmListeCMMCTR01', 'CPR', 'DATFBR', 7, 
    'Date de fabrication', 'Date de fabrication', 0, 1, 0, 
    'TO_CHAR(CPR.DATFBR,''DD/MM/YYYY'')', 0, NULL, 'Date de fabrication');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('4520', 'frmListeCMMCTR01', 'CPR', 'DATAGR', 7, 
    'Date d''agrement', 'Date d''agrement', 0, 1, 0, 
    'TO_CHAR(CPR.DATAGR,''DD/MM/YYYY'')', 0, NULL, 'Date d''agrement');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('4521', 'frmListeCMMCTR01', 'CPR', 'A2', 40, 
    'Adaptable field string 2', 'Adaptable field string 2', 0, 0, 0, 
    'CPR.A2', 0, NULL, 'Adaptable field string 2');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('4522', 'frmListeCMMCTR01', 'CPR', 'A3', 40, 
    'Adaptable field string 3', 'Adaptable field string 3', 0, 0, 0, 
    'CPR.A3', 0, NULL, 'Adaptable field string 3');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('4523', 'frmListeCMMCTR01', 'CPR', 'A5', 40, 
    'Adaptable field string 5', 'Adaptable field string 5', 0, 0, 0, 
    'CPR.A5', 0, NULL, 'Adaptable field string 5');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('4524', 'frmListeCMMCTR01', 'CPR', 'D3', 7, 
    'Adaptable field date 3', 'Adaptable field date 3', 0, 0, 0, 
    'TO_CHAR(CPR.D3,''DD/MM/YYYY'')', 0, NULL, 'Adaptable field date 3');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('4525', 'frmListeCMMCTR01', 'CPR', 'IDTT2', 6, 
    'Associated typology ID 2', 'Associated typology ID 2', 0, 0, 0, 
    'CPR.IDTT2', 0, NULL, 'Associated typology ID 2');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('4526', 'frmListeCMMCTR01', 'CPR', 'N4', 22, 
    'Adaptable field number 4', 'Adaptable field number 4', 0, 0, 0, 
    'CPR.N4', 0, NULL, 'Adaptable field number 4');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('4527', 'frmListeCMMCTR01', 'CPR', 'N5', 22, 
    'Adaptable field number 5', 'Adaptable field number 5', 0, 0, 0, 
    'CPR.N5', 0, NULL, 'Adaptable field number 5');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('4528', 'frmListeCMMCTR01', 'CPR', 'N1', 22, 
    'Adaptable field number 1', 'Adaptable field number 1', 0, 0, 0, 
    'CPR.N1', 0, NULL, 'Adaptable field number 1');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('4529', 'frmListeCMMCTR01', 'CPR', 'C3', 22, 
    'Adaptable field check-box 3', 'Adaptable field check-box 3', 0, 0, 0, 
    'CPR.C3', 0, NULL, 'Adaptable field check-box 3');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('4530', 'frmListeCMMCTR01', 'CPR', 'C4', 22, 
    'Adaptable field check-box 4', 'Adaptable field check-box 4', 0, 0, 0, 
    'CPR.C4', 0, NULL, 'Adaptable field check-box 4');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('4531', 'frmListeCMMCTR01', 'CPR', 'C5', 22, 
    'Adaptable field check-box 5', 'Adaptable field check-box 5', 0, 0, 0, 
    'CPR.C5', 0, NULL, 'Adaptable field check-box 5');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('4532', 'frmListeCMMCTR01', 'CPR', 'D1', 7, 
    'Adaptable field date 1', 'Adaptable field date 1', 0, 0, 0, 
    'TO_CHAR(CPR.D1,''DD/MM/YYYY'')', 0, NULL, 'Adaptable field date 1');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('4533', 'frmListeCMMCTR01', 'CPR', 'NUMENQ', 22, 
    'Recensement', 'Recensement', 0, 1, 0, 
    'CPR.NUMENQ', 0, NULL, 'Recensement');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('4534', 'frmListeCMMCTR01', 'CPR', 'T5', 6, 
    'Adaptable field typology 5', 'Adaptable field typology 5', 0, 0, 0, 
    'CPR.T5', 0, NULL, 'Adaptable field typology 5');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('4535', 'frmListeCMMCTR01', 'CPR', 'IDTT5', 6, 
    'Associated typology ID 5', 'Associated typology ID 5', 0, 0, 0, 
    'CPR.IDTT5', 0, NULL, 'Associated typology ID 5');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('4536', 'frmListeCMMCTR01', 'CPR', 'NUMCPR', 20, 
    'Numero', 'Numero', 0, 1, 0, 
    'CPR.NUMCPR', 0, NULL, 'Numero');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('4537', 'frmListeCMMCTR01', 'CPR', 'N3', 22, 
    'Adaptable field number 3', 'Adaptable field number 3', 0, 0, 0, 
    'CPR.N3', 0, NULL, 'Adaptable field number 3');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('4538', 'frmListeCMMCTR01', 'CPR', 'DATGRN', 7, 
    'Date de garantie', 'Date de garantie', 0, 1, 0, 
    'TO_CHAR(CPR.DATGRN,''DD/MM/YYYY'')', 0, NULL, 'Date de garantie');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('4316', 'frmListeINTINT01', 'PNTLVR', 'IDTT3', 6, 
    'Associated typology ID 3', 'Associated typology ID 3', 0, 0, 0, 
    'PNTLVR.IDTT3', 0, NULL, 'Associated typology ID 3');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('4317', 'frmListeINTINT01', 'PNTLVR', 'ADRSTR4', 50, 
    'Description of structured address 4', 'Description of structured address 4', 0, 0, 0, 
    'PNTLVR.ADRSTR4', 0, NULL, 'Description of structured address 4');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('4318', 'frmListeINTINT01', 'PNTLVR', 'T2', 6, 
    'Adaptable field typologie 2', 'Adaptable field typologie 2', 0, 0, 0, 
    'PNTLVR.T2', 0, NULL, 'Adaptable field typologie 2');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('4319', 'frmListeINTINT01', 'PNTLVR', 'IDTDCPGGR', 29, 
    'Découpage géographique', 'Adresse geographique', 0, 1, 0, 
    'PNTLVR.IDTDCPGGR', 0, NULL, 'Adresse geographique');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('4320', 'frmListeINTINT01', 'PNTLVR', 'IDTT4', 6, 
    'Associated typology ID 4', 'Associated typology ID 4', 0, 0, 0, 
    'PNTLVR.IDTT4', 0, NULL, 'Associated typology ID 4');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('4321', 'frmListeINTINT01', 'PNTLVR', 'N1', 22, 
    'Adaptable field number1', 'Adaptable field number1', 0, 0, 0, 
    'PNTLVR.N1', 0, NULL, 'Adaptable field number1');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('4322', 'frmListeINTINT01', 'PNTLVR', 'IDTPNTLVR', 22, 
    'Internal Delivery point ID', 'Identifiant interne', 0, 0, 0, 
    'PNTLVR.IDTPNTLVR', 0, NULL, 'Identifiant interne');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('4323', 'frmListeINTINT01', 'PNTLVR', 'C2', 22, 
    'Adaptable field check-box 2', 'Adaptable field check-box 2', 0, 0, 0, 
    'PNTLVR.C2', 0, NULL, 'Adaptable field check-box 2');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('4324', 'frmListeINTINT01', 'PNTLVR', 'SQCPNTCPG', 22, 
    'Metering point last used serial number', 'Metering point last used serial number', 0, 1, 0, 
    'PNTLVR.SQCPNTCPG', 0, NULL, 'Metering point last used serial number');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('4325', 'frmListeINTINT01', 'PNTLVR', 'C4', 22, 
    'Adaptable field check-box 4', 'Adaptable field check-box 4', 0, 0, 0, 
    'PNTLVR.C4', 0, NULL, 'Adaptable field check-box 4');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('4326', 'frmListeINTINT01', 'PNTLVR', 'ADRSTR7', 50, 
    'Description of structured address 7', 'Description of structured address 7', 0, 0, 0, 
    'PNTLVR.ADRSTR7', 0, NULL, 'Description of structured address 7');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('4327', 'frmListeINTINT01', 'PNTLVR', 'C5', 22, 
    'Adaptable field check-box 5', 'Adaptable field check-box 5', 0, 0, 0, 
    'PNTLVR.C5', 0, NULL, 'Adaptable field check-box 5');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('4328', 'frmListeINTINT01', 'PNTLVR', 'ADRSTR3', 50, 
    'Description of structured address 3', 'Description of structured address 3', 0, 0, 0, 
    'PNTLVR.ADRSTR3', 0, NULL, 'Description of structured address 3');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('4329', 'frmListeINTINT01', 'PNTLVR', 'ADRSTR10', 50, 
    'Description of structured address 10', 'Description of structured address 10', 0, 0, 0, 
    'PNTLVR.ADRSTR10', 0, NULL, 'Description of structured address 10');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('4330', 'frmListeINTINT01', 'PNTLVR', 'T1', 6, 
    'Adaptable field typologie 1', 'Adaptable field typologie 1', 0, 0, 0, 
    'PNTLVR.T1', 0, NULL, 'Adaptable field typologie 1');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('4331', 'frmListeINTINT01', 'PNTLVR', 'IDTT5', 6, 
    'Associated typology ID 5', 'Associated typology ID 5', 0, 0, 0, 
    'PNTLVR.IDTT5', 0, NULL, 'Associated typology ID 5');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('4332', 'frmListeINTINT01', 'PNTLVR', 'ADRSTR2', 50, 
    'Description of structured address 2', 'Description of structured address 2', 0, 0, 0, 
    'PNTLVR.ADRSTR2', 0, NULL, 'Description of structured address 2');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('4333', 'frmListeINTINT01', 'PNTLVR', 'T3', 6, 
    'Adaptable field typologie 3', 'Adaptable field typologie 3', 0, 0, 0, 
    'PNTLVR.T3', 0, NULL, 'Adaptable field typologie 3');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('4334', 'frmListeINTINT01', 'PNTLVR', 'D2', 7, 
    'Adaptable field date 2', 'Adaptable field date 2', 0, 0, 0, 
    'TO_CHAR(PNTLVR.D2,''DD/MM/YYYY'')', 0, NULL, 'Adaptable field date 2');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('4335', 'frmListeINTINT01', 'PNTLVR', 'IDTSQCGNR', 22, 
    'General identifier', 'General identifier', 0, 0, 0, 
    'PNTLVR.IDTSQCGNR', 0, NULL, 'General identifier');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('4336', 'frmListeINTINT01', 'PNTLVR', 'D3', 7, 
    'Adaptable field date 3', 'Adaptable field date 3', 0, 0, 0, 
    'TO_CHAR(PNTLVR.D3,''DD/MM/YYYY'')', 0, NULL, 'Adaptable field date 3');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('4337', 'frmListeINTINT01', 'PNTLVR', 'N5', 22, 
    'Adaptable field number 5', 'Adaptable field number 5', 0, 0, 0, 
    'PNTLVR.N5', 0, NULL, 'Adaptable field number 5');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('4338', 'frmListeINTINT01', 'PNTLVR', 'IdtCntOpr', 10, 
    'CO', 'CO', 0, 1, 0, 
    'PNTLVR.IdtCntOpr', 0, NULL, 'CO');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('4339', 'frmListeINTINT01', 'PNTLVR', 'MTRAGT', 6, 
    'Agent', 'Agent', 0, 1, 0, 
    'PNTLVR.MTRAGT', 0, NULL, 'Agent');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('4340', 'frmListeINTINT01', 'PNTLVR', 'CODGEO6', 4, 
    'Code géographique 6', 'Code du niveau 6', 0, 1, 0, 
    'PNTLVR.CODGEO6', 0, NULL, 'Code du niveau 6');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('4341', 'frmListeINTINT01', 'PNTLVR', 'ADRSTR5', 50, 
    'Description of structured address 5', 'Description of structured address 5', 0, 0, 0, 
    'PNTLVR.ADRSTR5', 0, NULL, 'Description of structured address 5');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('4342', 'frmListeINTINT01', 'PNTLVR', 'ADRSTR8', 50, 
    'Description of structured address 8', 'Description of structured address 8', 0, 0, 0, 
    'PNTLVR.ADRSTR8', 0, NULL, 'Description of structured address 8');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('4343', 'frmListeINTINT01', 'PNTLVR', 'Datmaj', 20, 
    'Mise à jour le:', 'Date de mise a jour', 0, 1, 0, 
    'TO_CHAR(PNTLVR.DATMAJ,X7UTIL.FRMDAT)', 0, NULL, 'Date de mise a jour');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('4344', 'frmListeINTINT01', 'PNTLVR', 'NUMORD', 22, 
    'Number in the standard round', 'Numero d''ordre', 0, 1, 0, 
    'PNTLVR.NUMORD', 0, NULL, 'Numero d''ordre');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('4345', 'frmListeINTINT01', 'PNTLVR', 'DATMAJ', 7, 
    'Date de mise à jour', 'Date de mise a jour', 0, 1, 0, 
    'TO_CHAR(PNTLVR.DATMAJ,''DD/MM/YYYY'')', 0, NULL, 'Date de mise a jour');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('4346', 'frmListeINTINT01', 'PNTLVR', 'CODGEO2', 4, 
    'Code géographique 2', 'Code du niveau 2', 0, 1, 0, 
    'PNTLVR.CODGEO2', 0, NULL, 'Code du niveau 2');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('4347', 'frmListeINTINT01', 'PNTLVR', 'A2', 40, 
    'Adaptable field string  2', 'Adaptable field string  2', 0, 0, 0, 
    'PNTLVR.A2', 0, NULL, 'Adaptable field string  2');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('4348', 'frmListeINTINT01', 'PNTLVR', 'IDTTYPHBT', 6, 
    'Type d''habitation', 'Type d''habitation', 0, 1, 0, 
    'PNTLVR.IDTTYPHBT', 0, NULL, 'Type d''habitation');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('4349', 'frmListeINTINT01', 'PNTLVR', 'C3', 22, 
    'Adaptable field check-box 3', 'Adaptable field check-box 3', 0, 0, 0, 
    'PNTLVR.C3', 0, NULL, 'Adaptable field check-box 3');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('4350', 'frmListeINTINT01', 'PNTLVR', 'A5', 40, 
    'Adaptable field string 5', 'Adaptable field string 5', 0, 0, 0, 
    'PNTLVR.A5', 0, NULL, 'Adaptable field string 5');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('4351', 'frmListeINTINT01', 'PNTLVR', 'D4', 7, 
    'Adaptable field date 4', 'Adaptable field date 4', 0, 0, 0, 
    'TO_CHAR(PNTLVR.D4,''DD/MM/YYYY'')', 0, NULL, 'Adaptable field date 4');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('4352', 'frmListeINTINT01', 'PNTLVR', 'A4', 40, 
    'Adaptable field string 4', 'Adaptable field string 4', 0, 0, 0, 
    'PNTLVR.A4', 0, NULL, 'Adaptable field string 4');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('4353', 'frmListeINTINT01', 'PNTLVR', 'CODGEO1', 5, 
    'Code géographique 1', 'Code du niveau 1', 0, 1, 0, 
    'PNTLVR.CODGEO1', 0, NULL, 'Code du niveau 1');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('4354', 'frmListeINTINT01', 'PNTLVR', 'IDTT2', 6, 
    'Associated typology ID 2', 'Associated typology ID 2', 0, 0, 0, 
    'PNTLVR.IDTT2', 0, NULL, 'Associated typology ID 2');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('4355', 'frmListeINTINT01', 'PNTLVR', 'T4', 6, 
    'Adaptable field typologie 4', 'Adaptable field typologie 4', 0, 0, 0, 
    'PNTLVR.T4', 0, NULL, 'Adaptable field typologie 4');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('4356', 'frmListeINTINT01', 'PNTLVR', 'D1', 7, 
    'Adaptable field date 1', 'Adaptable field date 1', 0, 0, 0, 
    'TO_CHAR(PNTLVR.D1,''DD/MM/YYYY'')', 0, NULL, 'Adaptable field date 1');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('4357', 'frmListeINTINT01', 'PNTLVR', 'ANCRFR', 20, 
    'Former reference', 'Ancienne reference', 0, 1, 0, 
    'PNTLVR.ANCRFR', 0, NULL, 'Ancienne reference');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('4358', 'frmListeINTINT01', 'PNTLVR', 'N2', 22, 
    'Adaptable field number12', 'Adaptable field number12', 0, 0, 0, 
    'PNTLVR.N2', 0, NULL, 'Adaptable field number12');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('4359', 'frmListeINTINT01', 'PNTLVR', 'N3', 22, 
    'Adaptable field number13', 'Adaptable field number13', 0, 0, 0, 
    'PNTLVR.N3', 0, NULL, 'Adaptable field number13');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('4360', 'frmListeINTINT01', 'PNTCPG', 'DATMAJ', 7, 
    'Date de mise à jour', 'Date de mise à jour', 0, 1, 0, 
    'TO_CHAR(PNTCPG.DATMAJ,''DD/MM/YYYY'')', 0, NULL, 'Date de mise à jour');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('4361', 'frmListeINTINT01', 'PNTCPG', 'IDTUNTMSRDMT', 22, 
    'Diameter unit of measure ID', 'Diameter unit of measure ID', 0, 1, 0, 
    'PNTCPG.IDTUNTMSRDMT', 0, NULL, 'Diameter unit of measure ID');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('4362', 'frmListeINTINT01', 'PNTCPG', 'A1', 40, 
    'Adaptable field string 1', 'Adaptable field string 1', 0, 0, 0, 
    'PNTCPG.A1', 0, NULL, 'Adaptable field string 1');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('4363', 'frmListeINTINT01', 'PNTCPG', 'A4', 40, 
    'Adaptable field string 4', 'Adaptable field string 4', 0, 0, 0, 
    'PNTCPG.A4', 0, NULL, 'Adaptable field string 4');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('4364', 'frmListeINTINT01', 'PNTCPG', 'N4', 22, 
    'Adaptable field number 4', 'Adaptable field number 4', 0, 0, 0, 
    'PNTCPG.N4', 0, NULL, 'Adaptable field number 4');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('4365', 'frmListeINTINT01', 'PNTCPG', 'C1', 22, 
    'Adaptable field check-box 1', 'Adaptable field check-box 1', 0, 0, 0, 
    'PNTCPG.C1', 0, NULL, 'Adaptable field check-box 1');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('4366', 'frmListeINTINT01', 'PNTCPG', 'C5', 22, 
    'Adaptable field check-box 5', 'Adaptable field check-box 5', 0, 0, 0, 
    'PNTCPG.C5', 0, NULL, 'Adaptable field check-box 5');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('4367', 'frmListeINTINT01', 'PNTCPG', 'D2', 7, 
    'Adaptable field check-box 2', 'Adaptable field check-box 2', 0, 0, 0, 
    'TO_CHAR(PNTCPG.D2,''DD/MM/YYYY'')', 0, NULL, 'Adaptable field check-box 2');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('4368', 'frmListeINTINT01', 'PNTCPG', 'ANCRFR', 20, 
    'Ancienne reference', 'Ancienne reference', 0, 1, 0, 
    'PNTCPG.ANCRFR', 0, NULL, 'Ancienne reference');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('4369', 'frmListeINTINT01', 'PNTCPG', 'ADRSTR3', 50, 
    'Description of structured address 3', 'Description of structured address 3', 0, 0, 0, 
    'PNTCPG.ADRSTR3', 0, NULL, 'Description of structured address 3');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('4370', 'frmListeINTINT01', 'PNTCPG', 'IDTCLTPRP', 6, 
    'Code client propriétaire', 'Code client propriétaire', 0, 1, 0, 
    'PNTCPG.IDTCLTPRP', 0, NULL, 'Code client propriétaire');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('4371', 'frmListeINTINT01', 'PNTCPG', 'CLBMINDSJ', 22, 
    'Minimum calibre circuit breaker', 'Minimum calibre circuit breaker', 0, 0, 0, 
    'PNTCPG.CLBMINDSJ', 0, NULL, 'Minimum calibre circuit breaker');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('4372', 'frmListeINTINT01', 'PNTCPG', 'CLBMAXDSJ', 22, 
    'Maximum calibre of circuit breaker', 'Maximum calibre of circuit breaker', 0, 0, 0, 
    'PNTCPG.CLBMAXDSJ', 0, NULL, 'Maximum calibre of circuit breaker');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('4373', 'frmListeINTINT01', 'PNTCPG', 'ADRLBR', 254, 
    'Adresse', 'Adresse', 0, 1, 0, 
    'SUBSTR(REPLACE(REPLACE(PNTCPG.ADRLBR,CHR(10),'' ''),CHR(13),'' ''),1,254)', 0, NULL, 'Adresse');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('4374', 'frmListeINTINT01', 'PNTCPG', 'IDTTYPCPG', 22, 
    'Type de métrage', 'Type de métrage', 0, 1, 0, 
    'PNTCPG.IDTTYPCPG', 0, NULL, 'Type de métrage');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('4375', 'frmListeINTINT01', 'PNTCPG', 'IDTT2', 6, 
    'Associated typology ID 2', 'Associated typology ID 2', 0, 0, 0, 
    'PNTCPG.IDTT2', 0, NULL, 'Associated typology ID 2');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('4376', 'frmListeINTINT01', 'PNTCPG', 'T5', 6, 
    'Adaptable field typologie 5', 'Adaptable field typologie 5', 0, 0, 0, 
    'PNTCPG.T5', 0, NULL, 'Adaptable field typologie 5');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('4377', 'frmListeINTINT01', 'PNTCPG', 'A2', 40, 
    'Adaptable field string 2', 'Adaptable field string 2', 0, 0, 0, 
    'PNTCPG.A2', 0, NULL, 'Adaptable field string 2');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('4378', 'frmListeINTINT01', 'PNTCPG', 'A3', 40, 
    'Adaptable field string 3', 'Adaptable field string 3', 0, 0, 0, 
    'PNTCPG.A3', 0, NULL, 'Adaptable field string 3');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('4379', 'frmListeINTINT01', 'PNTCPG', 'C2', 22, 
    'Adaptable field check-box 2', 'Adaptable field check-box 2', 0, 0, 0, 
    'PNTCPG.C2', 0, NULL, 'Adaptable field check-box 2');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('4380', 'frmListeINTINT01', 'PNTCPG', 'MTRAGT', 6, 
    'ID of the employee who carries out updating', 'ID of the employee who carries out updating', 0, 1, 0, 
    'PNTCPG.MTRAGT', 0, NULL, 'ID of the employee who carries out updating');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('4381', 'frmListeINTINT01', 'PNTCPG', 'D4', 7, 
    'Adaptable field check-box 4', 'Adaptable field check-box 4', 0, 0, 0, 
    'TO_CHAR(PNTCPG.D4,''DD/MM/YYYY'')', 0, NULL, 'Adaptable field check-box 4');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('4382', 'frmListeINTINT01', 'PNTCPG', 'D5', 7, 
    'Adaptable field check-box 5', 'Adaptable field check-box 5', 0, 0, 0, 
    'TO_CHAR(PNTCPG.D5,''DD/MM/YYYY'')', 0, NULL, 'Adaptable field check-box 5');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('4383', 'frmListeINTINT01', 'PNTCPG', 'ADRSTR6', 50, 
    'Description of structured address 6', 'Description of structured address 6', 0, 0, 0, 
    'PNTCPG.ADRSTR6', 0, NULL, 'Description of structured address 6');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('4384', 'frmListeINTINT01', 'PNTCPG', 'ADRSTR8', 50, 
    'Description of structured address 8', 'Description of structured address 8', 0, 0, 0, 
    'PNTCPG.ADRSTR8', 0, NULL, 'Description of structured address 8');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('4385', 'frmListeINTINT01', 'PNTCPG', 'FINDRNPRDRLV', 7, 
    'Fin de la dernière période théorique de relève', 'Fin de la dernière période théorique de relève', 0, 1, 0, 
    'TO_CHAR(PNTCPG.FINDRNPRDRLV,''DD/MM/YYYY'')', 0, NULL, 'Fin de la dernière période théorique de relève');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('4386', 'frmListeINTINT01', 'PNTCPG', 'ADRSTR10', 50, 
    'Description of structured address 10', 'Description of structured address 10', 0, 0, 0, 
    'PNTCPG.ADRSTR10', 0, NULL, 'Description of structured address 10');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('4387', 'frmListeINTINT01', 'PNTCPG', 'DMT', 22, 
    'Diamètre', 'Diametre', 0, 1, 0, 
    'PNTCPG.DMT', 0, NULL, 'Diametre');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('4388', 'frmListeINTINT01', 'PNTCPG', 'PSSTRS', 22, 
    'Puissance du transformateur', 'Puissance du transformateur', 0, 0, 0, 
    'PNTCPG.PSSTRS', 0, NULL, 'Puissance du transformateur');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('4389', 'frmListeINTINT01', 'PNTCPG', 'C3', 22, 
    'Adaptable field check-box 3', 'Adaptable field check-box 3', 0, 0, 0, 
    'PNTCPG.C3', 0, NULL, 'Adaptable field check-box 3');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('4390', 'frmListeINTINT01', 'PNTCPG', 'ADRSTR2', 50, 
    'Description of structured address 2', 'Description of structured address 2', 0, 0, 0, 
    'PNTCPG.ADRSTR2', 0, NULL, 'Description of structured address 2');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('4391', 'frmListeINTINT01', 'PNTCPG', 'ADRSTR7', 50, 
    'Description of structured address 7', 'Description of structured address 7', 0, 0, 0, 
    'PNTCPG.ADRSTR7', 0, NULL, 'Description of structured address 7');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('4392', 'frmListeINTINT01', 'PNTCPG', 'ADRSTR9', 50, 
    'Description of structured address 9', 'Description of structured address 9', 0, 0, 0, 
    'PNTCPG.ADRSTR9', 0, NULL, 'Description of structured address 9');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('4393', 'frmListeINTINT01', 'PNTCPG', 'DEBDRNPRDRLV', 7, 
    'Début de période', 'Début de période', 0, 1, 0, 
    'TO_CHAR(PNTCPG.DEBDRNPRDRLV,''DD/MM/YYYY'')', 0, NULL, 'Début de période');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('4394', 'frmListeINTINT01', 'PNTCPG', 'DATDCN', 7, 
    'Date de deconnexion', 'Date de deconnexion', 0, 1, 0, 
    'TO_CHAR(PNTCPG.DATDCN,''DD/MM/YYYY'')', 0, NULL, 'Date de deconnexion');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('4395', 'frmListeINTINT01', 'PNTCPG', 'RNG1', 22, 
    'Rang', 'Rang', 0, 1, 0, 
    'PNTCPG.RNG1', 0, NULL, 'Rang');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('4396', 'frmListeINTINT01', 'PNTCPG', 'T2', 6, 
    'Adaptable field typologie 2', 'Adaptable field typologie 2', 0, 0, 0, 
    'PNTCPG.T2', 0, NULL, 'Adaptable field typologie 2');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('4397', 'frmListeINTINT01', 'PNTCPG', 'T3', 6, 
    'Adaptable field typologie 3', 'Adaptable field typologie 3', 0, 0, 0, 
    'PNTCPG.T3', 0, NULL, 'Adaptable field typologie 3');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('4398', 'frmListeINTINT01', 'PNTCPG', 'IDTT5', 6, 
    'Associated typology ID 5', 'Associated typology ID 5', 0, 0, 0, 
    'PNTCPG.IDTT5', 0, NULL, 'Associated typology ID 5');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('4399', 'frmListeINTINT01', 'PNTCPG', 'ADRSTR1', 50, 
    'Description of structured address 1', 'Description of structured address 1', 0, 0, 0, 
    'PNTCPG.ADRSTR1', 0, NULL, 'Description of structured address 1');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('4400', 'frmListeINTINT01', 'PNTCPG', 'ADRSTR5', 50, 
    'Description of structured address 5', 'Description of structured address 5', 0, 0, 0, 
    'PNTCPG.ADRSTR5', 0, NULL, 'Description of structured address 5');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('4401', 'frmListeINTINT01', 'PNTCPG', 'IDTLOTRCS', 6, 
    'Lot recensement', 'Lot recensement', 0, 1, 0, 
    'PNTCPG.IDTLOTRCS', 0, NULL, 'Lot recensement');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('4402', 'frmListeINTINT01', 'PNTCPG', 'NUMENQ', 22, 
    'numéro recensement', 'numéro recensement', 0, 1, 0, 
    'PNTCPG.NUMENQ', 0, NULL, 'numéro recensement');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('4403', 'frmListeINTINT01', 'PNTCPG', 'SCTCND', 22, 
    'Conductors section', 'Conductors section', 0, 1, 0, 
    'PNTCPG.SCTCND', 0, NULL, 'Conductors section');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('4404', 'frmListeINTINT01', 'PNTCPG', 'DATCOU', 7, 
    'Date de coupure', 'Date de coupure', 0, 1, 0, 
    'TO_CHAR(PNTCPG.DATCOU,''DD/MM/YYYY'')', 0, NULL, 'Date de coupure');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('4405', 'frmListeINTINT01', 'PNTCPG', 'T1', 6, 
    'Adaptable field typologie 1', 'Adaptable field typologie 1', 0, 0, 0, 
    'PNTCPG.T1', 0, NULL, 'Adaptable field typologie 1');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('4406', 'frmListeINTINT01', 'PNTCPG', 'IDTT1', 6, 
    'Associated typology ID 1', 'Associated typology ID 1', 0, 0, 0, 
    'PNTCPG.IDTT1', 0, NULL, 'Associated typology ID 1');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('4407', 'frmListeINTINT01', 'PNTCPG', 'IDTT4', 6, 
    'Associated typology ID 4', 'Associated typology ID 4', 0, 0, 0, 
    'PNTCPG.IDTT4', 0, NULL, 'Associated typology ID 4');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('4408', 'frmListeINTINT01', 'PNTCPG', 'A5', 40, 
    'Adaptable field string 5', 'Adaptable field string 5', 0, 0, 0, 
    'PNTCPG.A5', 0, NULL, 'Adaptable field string 5');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('4409', 'frmListeINTINT01', 'PNTCPG', 'C4', 22, 
    'Adaptable field check-box 4', 'Adaptable field check-box 4', 0, 0, 0, 
    'PNTCPG.C4', 0, NULL, 'Adaptable field check-box 4');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('4410', 'frmListeINTINT01', 'PNTCPG', 'IDTPNTLVR', 22, 
    'Delivery point ID', 'Delivery point ID', 0, 1, 0, 
    'PNTCPG.IDTPNTLVR', 0, NULL, 'Delivery point ID');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('4411', 'frmListeINTINT01', 'PNTCPG', 'IDTCNTOPR', 6, 
    'Operational center ID', 'Operational center ID', 0, 1, 0, 
    'PNTCPG.IDTCNTOPR', 0, NULL, 'Operational center ID');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('4412', 'frmListeINTINT01', 'PNTCPG', 'DATCNN', 7, 
    'Date de connexion', 'Date de connexion', 0, 1, 0, 
    'TO_CHAR(PNTCPG.DATCNN,''DD/MM/YYYY'')', 0, NULL, 'Date de connexion');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('4413', 'frmListeINTINT01', 'PNTCPG', 'N5', 22, 
    'Adaptable field number 5', 'Adaptable field number 5', 0, 0, 0, 
    'PNTCPG.N5', 0, NULL, 'Adaptable field number 5');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('4414', 'frmListeINTINT01', 'PNTCPG', 'IDTPNTCPG', 22, 
    'Internal metering point ID', 'Numero d''ordre', 0, 1, 0, 
    'PNTCPG.IDTPNTCPG', 0, NULL, 'Numero d''ordre');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('4415', 'frmListeINTINT01', 'PNTCPG', 'D3', 7, 
    'Adaptable field check-box 3', 'Adaptable field check-box 3', 0, 0, 0, 
    'TO_CHAR(PNTCPG.D3,''DD/MM/YYYY'')', 0, NULL, 'Adaptable field check-box 3');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('4416', 'frmListeINTINT01', 'PNTCPG', 'ADRSTR4', 50, 
    'Description of structured address 4', 'Description of structured address 4', 0, 0, 0, 
    'PNTCPG.ADRSTR4', 0, NULL, 'Description of structured address 4');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('4417', 'frmListeINTINT01', 'PNTCPG', 'DATRMS', 7, 
    'Date de retablissement', 'Date de retablissement', 0, 1, 0, 
    'TO_CHAR(PNTCPG.DATRMS,''DD/MM/YYYY'')', 0, NULL, 'Date de retablissement');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('4418', 'frmListeINTINT01', 'PNTCPG', 'N1', 22, 
    'Adaptable field number 1', 'Adaptable field number 1', 0, 0, 0, 
    'PNTCPG.N1', 0, NULL, 'Adaptable field number 1');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('4419', 'frmListeINTINT01', 'PNTCPG', 'N3', 22, 
    'Adaptable field number 3', 'Adaptable field number 3', 0, 0, 0, 
    'PNTCPG.N3', 0, NULL, 'Adaptable field number 3');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('4420', 'frmListeINTINT01', 'PNTCPG', 'IDTSRV', 22, 
    'Service Id', 'Service Id', 0, 1, 0, 
    'PNTCPG.IDTSRV', 0, NULL, 'Service Id');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('4421', 'frmListeINTINT01', 'PNTCPG', 'IDTTRNTYP', 6, 
    'Standard round ID', 'Tournee type', 0, 1, 0, 
    'PNTCPG.IDTTRNTYP', 0, NULL, 'Tournee type');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('4422', 'frmListeINTINT01', 'PNTCPG', 'IDTLOTFAC', 6, 
    'Lot de facturation', 'Lot de facturation', 0, 1, 0, 
    'PNTCPG.IDTLOTFAC', 0, NULL, 'Lot de facturation');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('4423', 'frmListeINTINT01', 'PNTCPG', 'NBRCND', 22, 
    'Number of conductors', 'Number of conductors', 0, 0, 0, 
    'PNTCPG.NBRCND', 0, NULL, 'Number of conductors');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('4424', 'frmListeINTINT01', 'PNTCPG', 'RGLDSJ', 22, 
    'Circuit breaker setting', 'Circuit breaker setting', 0, 1, 0, 
    'PNTCPG.RGLDSJ', 0, NULL, 'Circuit breaker setting');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('4425', 'frmListeINTINT01', 'PNTCPG', 'IDTSQCGNR', 22, 
    'General sequence ID', 'General sequence ID', 0, 0, 0, 
    'PNTCPG.IDTSQCGNR', 0, NULL, 'General sequence ID');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('4426', 'frmListeINTINT01', 'PNTCPG', 'IDTT3', 6, 
    'Associated typology ID 3', 'Associated typology ID 3', 0, 0, 0, 
    'PNTCPG.IDTT3', 0, NULL, 'Associated typology ID 3');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('4427', 'frmListeINTINT01', 'PNTCPG', 'T4', 6, 
    'Adaptable field typologie 4', 'Adaptable field typologie 4', 0, 0, 0, 
    'PNTCPG.T4', 0, NULL, 'Adaptable field typologie 4');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('4428', 'frmListeINTINT01', 'PNTCPG', 'N2', 22, 
    'Adaptable field number 2', 'Adaptable field number 2', 0, 0, 0, 
    'PNTCPG.N2', 0, NULL, 'Adaptable field number 2');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('4429', 'frmListeINTINT01', 'PNTCPG', 'D1', 7, 
    'Adaptable field check-box 1', 'Adaptable field check-box 1', 0, 0, 0, 
    'TO_CHAR(PNTCPG.D1,''DD/MM/YYYY'')', 0, NULL, 'Adaptable field check-box 1');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('4430', 'frmListeINTINT01', 'PNTCPG', 'IDTSIG', 22, 
    'Code SIG', 'Code SIG', 0, 1, 0, 
    'PNTCPG.IDTSIG', 0, NULL, 'Code SIG');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('4431', 'frmListeINTINT01', 'CTR_ALL', 'A3', 40, 
    'Adaptable field string 3', 'Adaptable field string 3', 0, 0, 0, 
    'CTR_ALL.A3', 0, NULL, 'Adaptable field string 3');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('4432', 'frmListeINTINT01', 'CTR_ALL', 'IDTCTR', 60, 
    'Point de livraison', 'Numero', 0, 1, 0, 
    'PNTLVR.IdtDcpGgr || PRMGNR.SprCdf || PNTLVR.NumOrd', 0, NULL, 'Numero');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('4433', 'frmListeINTINT01', 'CTR_ALL', 'IDTCLTSSC', 6, 
    'Client souscripteur', 'Code souscripteur', 0, 1, 0, 
    'CTR_ALL.IDTCLTSSC', 0, NULL, 'Code souscripteur');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('4434', 'frmListeINTINT01', 'CTR_ALL', 'DATRSL', 7, 
    'Résilié le', 'Date de resiliation', 0, 1, 0, 
    'TO_CHAR(CTR_ALL.DATRSL,''DD/MM/YYYY'')', 0, NULL, 'Date de resiliation');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('4435', 'frmListeINTINT01', 'CTR_ALL', 'IDTSRV', 22, 
    'Service ID (1 <WATER>, 2 <LV electricity>, 3 <MV electricity>, ...)', 'Service ID (1 <WATER>, 2 <LV electricity>, 3 <MV electricity>, ...)', 0, 1, 0, 
    'CTR_ALL.IDTSRV', 0, NULL, 'Service ID (1 <WATER>, 2 <LV electricity>, 3 <MV electricity>, ...)');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('4436', 'frmListeINTINT01', 'CTR_ALL', 'CODTYPCTR', 6, 
    'Type of contract code', 'Type de contrat', 0, 1, 0, 
    'CTR_ALL.CODTYPCTR', 0, NULL, 'Type de contrat');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('4437', 'frmListeINTINT01', 'CTR_ALL', 'D3', 7, 
    'Adaptable field date 3', 'Adaptable field date 3', 0, 0, 0, 
    'TO_CHAR(CTR_ALL.D3,''DD/MM/YYYY'')', 0, NULL, 'Adaptable field date 3');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('4438', 'frmListeINTINT01', 'CTR_ALL', 'DATMAJ', 7, 
    'Date de mise à jour', 'Date de mise à jour', 0, 1, 0, 
    'TO_CHAR(CTR_ALL.DATMAJ,''DD/MM/YYYY'')', 0, NULL, 'Date de mise à jour');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('4439', 'frmListeINTINT01', 'CTR_ALL', 'IDTCNTOPR', 6, 
    'Centre opérationel', 'Centre opérationel', 0, 1, 0, 
    'CTR_ALL.IDTCNTOPR', 0, NULL, 'Centre opérationel');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('4440', 'frmListeINTINT01', 'CTR_ALL', 'MTFRSL', 15, 
    'Motive for termination', 'Motive for termination', 0, 1, 0, 
    'CTR_ALL.MTFRSL', 0, NULL, 'Motive for termination');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('4441', 'frmListeINTINT01', 'CTR_ALL', 'FINDRNPRDFCT', 7, 
    'Last billed period (ending date)', '????? ??? ????', 0, 1, 0, 
    'TO_CHAR(CTR_ALL.FINDRNPRDFCT,''DD/MM/YYYY'')', 0, NULL, '????? ??? ????');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('4442', 'frmListeINTINT01', 'CTR_ALL', 'IDTT1', 6, 
    'Associated typology ID 1', 'Associated typology ID 1', 0, 0, 0, 
    'CTR_ALL.IDTT1', 0, NULL, 'Associated typology ID 1');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('4443', 'frmListeINTINT01', 'CTR_ALL', 'C2', 22, 
    'Adaptable field check-box 2', 'Adaptable field check-box 2', 0, 0, 0, 
    'CTR_ALL.C2', 0, NULL, 'Adaptable field check-box 2');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('4444', 'frmListeINTINT01', 'CTR_ALL', 'D2', 7, 
    'Adaptable field date 2', 'Adaptable field date 2', 0, 0, 0, 
    'TO_CHAR(CTR_ALL.D2,''DD/MM/YYYY'')', 0, NULL, 'Adaptable field date 2');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('4445', 'frmListeINTINT01', 'CTR_ALL', 'ANCRFR', 20, 
    'Ancienne reference', 'Ancienne reference', 0, 1, 0, 
    'CTR_ALL.ANCRFR', 0, NULL, 'Ancienne reference');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('4446', 'frmListeINTINT01', 'CTR_ALL', 'IDTGCH', 6, 
    'Counter ID', 'Counter ID', 0, 1, 0, 
    'CTR_ALL.IDTGCH', 0, NULL, 'Counter ID');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('4447', 'frmListeINTINT01', 'CTR_ALL', 'PRPCPTBNC', 40, 
    'Bank account owner', 'Bank account owner', 0, 1, 0, 
    'CTR_ALL.PRPCPTBNC', 0, NULL, 'Bank account owner');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('4448', 'frmListeINTINT01', 'CTR_ALL', 'IDTT3', 6, 
    'Associated typology ID 3', 'Associated typology ID 3', 0, 0, 0, 
    'CTR_ALL.IDTT3', 0, NULL, 'Associated typology ID 3');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('4449', 'frmListeINTINT01', 'CTR_ALL', 'N1', 22, 
    'Adaptable field number 1', 'Adaptable field number 1', 0, 0, 0, 
    'CTR_ALL.N1', 0, NULL, 'Adaptable field number 1');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('4450', 'frmListeINTINT01', 'CTR_ALL', 'N3', 22, 
    'Adaptable field number 3', 'Adaptable field number 3', 0, 0, 0, 
    'CTR_ALL.N3', 0, NULL, 'Adaptable field number 3');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('4451', 'frmListeINTINT01', 'CTR_ALL', 'IDTBNQ', 6, 
    'Banque', 'Banque', 0, 1, 0, 
    'CTR_ALL.IDTBNQ', 0, NULL, 'Banque');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('4452', 'frmListeINTINT01', 'CTR_ALL', 'NUMCPTBNC', 30, 
    'Bank account number', 'Compte', 0, 1, 0, 
    'CTR_ALL.NUMCPTBNC', 0, NULL, 'Compte');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('4453', 'frmListeINTINT01', 'CTR_ALL', 'T2', 6, 
    'Adaptable field typologie 2', 'Adaptable field typologie 2', 0, 0, 0, 
    'CTR_ALL.T2', 0, NULL, 'Adaptable field typologie 2');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('4454', 'frmListeINTINT01', 'CTR_ALL', 'C5', 22, 
    'Adaptable field check-box 5', 'Adaptable field check-box 5', 0, 0, 0, 
    'CTR_ALL.C5', 0, NULL, 'Adaptable field check-box 5');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('4455', 'frmListeINTINT01', 'CTR_ALL', 'D1', 7, 
    'Adaptable field date 1', 'Adaptable field date 1', 0, 0, 0, 
    'TO_CHAR(CTR_ALL.D1,''DD/MM/YYYY'')', 0, NULL, 'Adaptable field date 1');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('4456', 'frmListeINTINT01', 'CTR_ALL', 'T5', 6, 
    'Adaptable field typologie 5', 'Adaptable field typologie 5', 0, 0, 0, 
    'CTR_ALL.T5', 0, NULL, 'Adaptable field typologie 5');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('4457', 'frmListeINTINT01', 'CTR_ALL', 'DPTGRN', 22, 
    'Deposit', 'Depot de garantie', 0, 1, 0, 
    'CTR_ALL.DPTGRN', 0, NULL, 'Depot de garantie');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('4458', 'frmListeINTINT01', 'CTR_ALL', 'C4', 22, 
    'Adaptable field check-box 4', 'Adaptable field check-box 4', 0, 0, 0, 
    'CTR_ALL.C4', 0, NULL, 'Adaptable field check-box 4');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('4459', 'frmListeINTINT01', 'CTR_ALL', 'A4', 40, 
    'Adaptable field string 4', 'Adaptable field string 4', 0, 0, 0, 
    'CTR_ALL.A4', 0, NULL, 'Adaptable field string 4');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('4460', 'frmListeINTINT01', 'CTR_ALL', 'IDTCTR', 10, 
    'Numéro', 'Numero', 0, 1, 0, 
    'CTR_ALL.IDTCTR', 0, NULL, 'Numero');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('4461', 'frmListeINTINT01', 'CTR_ALL', 'IDTPNTCPG', 22, 
    'Metering point ID', 'Metering point ID', 0, 1, 0, 
    'CTR_ALL.IDTPNTCPG', 0, NULL, 'Metering point ID');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('4462', 'frmListeINTINT01', 'CTR_ALL', 'IDTLOTFAC', 6, 
    'Billing batch ID', 'Lot de facturation', 0, 1, 0, 
    'CTR_ALL.IDTLOTFAC', 0, NULL, 'Lot de facturation');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('4463', 'frmListeINTINT01', 'CTR_ALL', 'NUMINTER', 22, 
    'Work order number', 'Work order number', 0, 1, 0, 
    'CTR_ALL.NUMINTER', 0, NULL, 'Work order number');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('4464', 'frmListeINTINT01', 'CTR_ALL', 'IDTSQCGNR', 22, 
    'General identifier', 'General identifier', 0, 1, 0, 
    'CTR_ALL.IDTSQCGNR', 0, NULL, 'General identifier');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('4465', 'frmListeINTINT01', 'CTR_ALL', 'IDTRCVTYP', 6, 
    'Debt recovery type ID', 'Recouvrement type', 0, 1, 0, 
    'CTR_ALL.IDTRCVTYP', 0, NULL, 'Recouvrement type');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('4466', 'frmListeINTINT01', 'CTR_ALL', 'T1', 6, 
    'Adaptable field typologie 1', 'Adaptable field typologie 1', 0, 0, 0, 
    'CTR_ALL.T1', 0, NULL, 'Adaptable field typologie 1');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('4467', 'frmListeINTINT01', 'CTR_ALL', 'MTRAGT', 6, 
    'ID of the employee who carries out updating', 'ID of the employee who carries out updating', 0, 1, 0, 
    'CTR_ALL.MTRAGT', 0, NULL, 'ID of the employee who carries out updating');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('4468', 'frmListeINTINT01', 'CTR_ALL', 'DATSCR', 15, 
    'Souscrit le', 'Date de souscription', 0, 1, 0, 
    'TO_CHAR(CTR_ALL.DATSCR,''DD/MM/YYYY'')', 0, NULL, 'Date de souscription');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('4469', 'frmListeINTINT01', 'CTR_ALL', 'ETTCTRFCT', 22, 
    'Billing status of contract (1<normal>, 2<computation mode>, 3<validation mode>, 4<periodical billing on going>)', 'Billing status of contract (1<normal>, 2<computation mode>, 3<validation mode>, 4<periodical billing on going>)', 0, 1, 0, 
    'CTR_ALL.ETTCTRFCT', 0, NULL, 'Billing status of contract (1<normal>, 2<computation mode>, 3<validation mode>, 4<periodical billing on going>)');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('4470', 'frmListeINTINT01', 'CTR_ALL', 'IDTT4', 6, 
    'Associated typology ID 4', 'Associated typology ID 4', 0, 0, 0, 
    'CTR_ALL.IDTT4', 0, NULL, 'Associated typology ID 4');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('4471', 'frmListeINTINT01', 'CTR_ALL', 'IDTCODSNS', 6, 
    'Code sensibilité', 'Code sensibilité', 0, 1, 0, 
    'CTR_ALL.IDTCODSNS', 0, NULL, 'Code sensibilité');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('4472', 'frmListeINTINT01', 'CTR_ALL', 'DATDRNFCT', 7, 
    'Date of last billing of the contract', 'Date de derniere facturation', 0, 1, 0, 
    'TO_CHAR(CTR_ALL.DATDRNFCT,''DD/MM/YYYY'')', 0, NULL, 'Date de derniere facturation');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('4473', 'frmListeINTINT01', 'CTR_ALL', 'SQCAVN', 22, 
    'Amendment serial number', 'Amendment serial number', 0, 1, 0, 
    'CTR_ALL.SQCAVN', 0, NULL, 'Amendment serial number');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('4474', 'frmListeINTINT01', 'CTR_ALL', 'ETTCTR', 22, 
    'Contract status ( 1< normal>, 2<creation mode of the amendment>, 3<cancellation mode>, 4<creation mode>)', 'Contract status ( 1< normal>, 2<creation mode of the amendment>, 3<cancellation mode>, 4<creation mode>)', 0, 1, 0, 
    'CTR_ALL.ETTCTR', 0, NULL, 'Contract status ( 1< normal>, 2<creation mode of the amendment>, 3<cancellation mode>, 4<creation mode>)');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('4475', 'frmListeINTINT01', 'CTR_ALL', 'T4', 6, 
    'Adaptable field typologie 4', 'Adaptable field typologie 4', 0, 0, 0, 
    'CTR_ALL.T4', 0, NULL, 'Adaptable field typologie 4');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('4476', 'frmListeINTINT01', 'CTR_ALL', 'IDTT5', 6, 
    'Associated typology ID 5', 'Associated typology ID 5', 0, 0, 0, 
    'CTR_ALL.IDTT5', 0, NULL, 'Associated typology ID 5');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('4477', 'frmListeINTINT01', 'CTR_ALL', 'A1', 40, 
    'Adaptable field string 1', 'Adaptable field string 1', 0, 0, 0, 
    'CTR_ALL.A1', 0, NULL, 'Adaptable field string 1');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('4478', 'frmListeINTINT01', 'CTR_ALL', 'IDTCLTDST', 6, 
    'Addressee ID', 'Code destinataire', 0, 1, 0, 
    'CTR_ALL.IDTCLTDST', 0, NULL, 'Code destinataire');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('4479', 'frmListeINTINT01', 'CTR_ALL', 'DEBDRNPRDFCT', 7, 
    'Last billed period (starting date)', 'Last billed period (starting date)', 0, 1, 0, 
    'TO_CHAR(CTR_ALL.DEBDRNPRDFCT,''DD/MM/YYYY'')', 0, NULL, 'Last billed period (starting date)');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('4480', 'frmListeINTINT01', 'CTR_ALL', 'CLERIB', 2, 
    'Bank account code', 'Bank account code', 0, 1, 0, 
    'CTR_ALL.CLERIB', 0, NULL, 'Bank account code');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('4481', 'frmListeINTINT01', 'CTR_ALL', 'C3', 22, 
    'Adaptable field check-box 3', 'Adaptable field check-box 3', 0, 0, 0, 
    'CTR_ALL.C3', 0, NULL, 'Adaptable field check-box 3');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('4482', 'frmListeINTINT01', 'CTR_ALL', 'D5', 7, 
    'Adaptable field date 5', 'Adaptable field date 5', 0, 0, 0, 
    'TO_CHAR(CTR_ALL.D5,''DD/MM/YYYY'')', 0, NULL, 'Adaptable field date 5');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('4483', 'frmListeINTINT01', 'CTR_ALL', 'IDTT2', 6, 
    'Associated typology ID 2', 'Associated typology ID 2', 0, 0, 0, 
    'CTR_ALL.IDTT2', 0, NULL, 'Associated typology ID 2');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('4484', 'frmListeINTINT01', 'CTR_ALL', 'T3', 6, 
    'Adaptable field typologie 3', 'Adaptable field typologie 3', 0, 0, 0, 
    'CTR_ALL.T3', 0, NULL, 'Adaptable field typologie 3');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('4485', 'frmListeINTINT01', 'CTR_ALL', 'A2', 40, 
    'Adaptable field string 2', 'Adaptable field string 2', 0, 0, 0, 
    'CTR_ALL.A2', 0, NULL, 'Adaptable field string 2');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('4486', 'frmListeINTINT01', 'CTR_ALL', 'A5', 40, 
    'Adaptable field string 5', 'Adaptable field string 5', 0, 0, 0, 
    'CTR_ALL.A5', 0, NULL, 'Adaptable field string 5');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('4487', 'frmListeINTINT01', 'CTR_ALL', 'N2', 22, 
    'Adaptable field number 2', 'Adaptable field number 2', 0, 0, 0, 
    'CTR_ALL.N2', 0, NULL, 'Adaptable field number 2');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('4488', 'frmListeINTINT01', 'CTR_ALL', 'N4', 22, 
    'Adaptable field number 4', 'Adaptable field number 4', 0, 0, 0, 
    'CTR_ALL.N4', 0, NULL, 'Adaptable field number 4');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('4489', 'frmListeINTINT01', 'CTR_ALL', 'N5', 22, 
    'Adaptable field number 5', 'Adaptable field number 5', 0, 0, 0, 
    'CTR_ALL.N5', 0, NULL, 'Adaptable field number 5');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('4490', 'frmListeINTINT01', 'CTR_ALL', 'IDTPNTLVR', 22, 
    'Delivery point ID', 'Delivery point ID', 0, 1, 0, 
    'CTR_ALL.IDTPNTLVR', 0, NULL, 'Delivery point ID');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('4491', 'frmListeINTINT01', 'CTR_ALL', 'C1', 22, 
    'Adaptable field check-box 1', 'Adaptable field check-box 1', 0, 0, 0, 
    'CTR_ALL.C1', 0, NULL, 'Adaptable field check-box 1');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('4492', 'frmListeINTINT01', 'CTR_ALL', 'D4', 7, 
    'Adaptable field date 4', 'Adaptable field date 4', 0, 0, 0, 
    'TO_CHAR(CTR_ALL.D4,''DD/MM/YYYY'')', 0, NULL, 'Adaptable field date 4');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('4493', 'frmListeINTINT01', 'CTR_ALL', 'DATCRT', 7, 
    'Creation date', 'Creation date', 0, 1, 0, 
    'TO_CHAR(CTR_ALL.DATCRT,''DD/MM/YYYY'')', 0, NULL, 'Creation date');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('4494', 'frmListeCMMCTR01', 'CPR', 'IDTSQCGNR', 22, 
    'General identifier', 'General identifier', 0, 1, 0, 
    'CPR.IDTSQCGNR', 0, NULL, 'General identifier');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('4541', 'frmListeTCHCPR01', 'DSP', 'NUMDSP', 8, 
    'dispositif', 'dispositif', 0, 1, 0, 
    'DSP.NUMDSP', 0, 'Dispositif', 'dispositif');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('4542', 'frmListeTCHCPR01', 'DSP', 'FBR', 8, 
    'Fabricant', 'Fabricant', 0, 1, 0, 
    'DSP.FBR', 0, 'Fabricant', 'Fabricant');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('4543', 'frmListeTCHCPR01', 'DSPCPR', 'DATPOS', 7, 
    'Date de pose', 'Date de pose', 0, 1, 0, 
    'TO_CHAR(DSPCPR.DATPOS,X7UTIL.FRMDAT)', 0, 'Date de pose', 'Date de pose');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('4544', 'frmListeTCHCPR01', 'DSPCPR', 'DATDPS', 7, 
    'Date de d"?pose', 'Date de d"?pose', 0, 1, 0, 
    'TO_CHAR(DSPCPR.DATDPS,X7UTIL.FRMDAT)', 0, 'Date de d"?pose', 'Date de dpose');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('4545', 'frmListeINTINT01', 'DSP', 'NUMDSP', 8, 
    'dispositif', 'dispositif', 0, 1, 0, 
    'DSP.NUMDSP', 0, 'Dispositif', 'dispositif');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('4546', 'frmListeINTINT01', 'DSP', 'FBR', 8, 
    'Fabricant', 'Fabricant', 0, 1, 0, 
    'DSP.FBR', 0, 'Fabricant', 'Fabricant');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('4547', 'frmListeINTINT01', 'DSPCPR', 'DATPOS', 7, 
    'Date de pose', 'Date de pose', 0, 1, 0, 
    'TO_CHAR(DSPCPR.DATPOS,X7UTIL.FRMDAT)', 0, 'Date de pose', 'Date de pose');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('4548', 'frmListeINTINT01', 'DSPCPR', 'DATDPS', 7, 
    'Date de d"?pose', 'Date de d"?pose', 0, 1, 0, 
    'TO_CHAR(DSPCPR.DATDPS,X7UTIL.FRMDAT)', 0, 'Date de d"?pose', 'Date de d"?pose');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('4549', 'frmListeCMMCTR01', 'CTR_ALL', 'IDTCTR', 10, 
    'Contrat de fourniture', 'Contrat de fourniture', 0, 1, 0, 
    'CTR_ALL.IDTCTRFRN', 0, NULL, 'Contrat de fourniture');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('4539', 'frmListeTCHPCG01', 'PNTCPG', 'COORDX', 16, 
    'Coordonnée X', 'Coord X', 0, 1, 0, 
    'PNTCPG.COORDX', 0, 'Coordonnée X', 'Coordonnée X');
Insert into X7.LSTUSE
   (IDTFLT, IDTHWD, TBL, NOMCOL, LONCOL, 
    LIB, LIBABR, SST, UTL, VLRDFT, 
    COLSEL, TRI, LIBINT, LIBABRINT)
 Values
   ('4540', 'frmListeTCHPCG01', 'PNTCPG', 'COORDY', 16, 
    'Coordonnée Y', 'Coord Y', 0, 1, 0, 
    'PNTCPG.COORDY', 0, 'Coordonnée Y', 'Coordonnée Y');
COMMIT;
