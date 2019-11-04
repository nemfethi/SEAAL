/* 
Evaluation de l'impact 
distribution vs SMS
pour une tournée
*/
select A.*,
        KTSMS_TRC.DatSend "Date Envoi SMS", 
        KTSMS_TRC.Status "Statut SMS", 
        X7_LTTXOPR_V1.DATCRT "date lettrage Facture"
from ALG_DISTRIBUTION_V3 A, Alg_distribution_V2 b, ktsms_trc,  X7_LTTXOPR_V1
where a.IDtdst = b.IDTDST
and a.numfct = b.NUMFCT
and idttrntyp='010015'
and KTSMS_TRC.Key (+)= idtfac
and X7_LTTXOPR_V1.RFRDBT (+)= b.numfct;