CREATE OR REPLACE PACKAGE ALG_IMPCLT is

  -- Author  : FNE
  -- Created : 15/11/2015
  -- Purpose : Importer des abonnés dans X7



  Procedure Load_File;
  procedure Nettoyage;
  Procedure Ctrl_Data;
  Procedure renumord;
  PROCEDURE Import;
  procedure rapport_post_import;
end ALG_IMPCLT;
/