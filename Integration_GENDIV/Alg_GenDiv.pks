create or replace package Alg_GenDiv is

  -- Author  : FETHI
  -- Created : 18/07/2017 08:54:55
  -- Purpose : gestion de l'intégration des compteurs Gen/Div
  gNewCodTypCtr varchar2(6) := 'REPEGL';
  procedure nettoyage;
  procedure load_file;
  Procedure Controle;
  PROCEDURE Import;
  Procedure Resilier_Contrat(pIdtCtr in ctr.idtctr%type, pcr out number);
  Procedure Creer_Contrat(pIdtCtrAnc in ctr.idtctr%type,
                          pIdtCtrnve out ctr.idtctr%type,
                          pcr        out number);
  Procedure Creer_avenant(pIdtCtrAnc in ctr.idtctr%type,
                          pIdtCtrNve in ctr.idtctr%type);

  Procedure Rattacher_PC (pIdtPntLvrGen    in x7.pntcpg.idtpntlvr%type,
                         pIdtPntLvrDiv    in x7.pntcpg.idtpntlvr%type,
                         pIdtPntCpgDiv    in x7.pntcpg.idtpntCpg%type,
                         pIdtTrnTyp       in x7.PntCpg.IdtTrnTyp%type,
                         pRng1            in x7.PntCpg.Rng1%type,
                         pIdtPntCpgDivNew out x7.pntcpg.idtpntCpg%type,
                         pCr              out number);
  Procedure Traitement;
end Alg_GenDiv;
/