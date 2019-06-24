Drop table Alg_Epay_Dtl purge;
Create table Alg_Epay_Dtl
(
IdtTrt number,
transaction_date_payment date,
transaction_montant number,
epayment_transaction_id varchar2(20),
epayment_authorization_code varchar2(20),
epayment_code_client varchar2(10),
epayment_track_id varchar2(20),
epayment_response_code varchar2(100),
transaction_paid number(1),
transaction_report_printed number(1),
transaction_report_pdf number(1),
transaction_report_sent number(1),
transaction_report_sent_to varchar2(256),
is_sent number(1),
date_send date,
cc varchar2(4),
transaction_com Clob,
transaction_statut varchar2(256),
Satim_stt number(1)
);

Drop table Alg_Epay_Ent;

Create table Alg_Epay_Ent
(
  IdtTrt Number,
  DatTrt Date,
  NbrEnt number
);