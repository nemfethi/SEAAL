CREATE OR REPLACE PACKAGE X7.CSSCNG01_SPC IS
  PROCEDURE TRTLGNCSSCNG (pCngLgnCss CNGLGNCSS%ROWTYPE);
-------------------------------------------------------------------------
-------------------------------------------------------------------------
-------------------------------------------------------------------------
  PROCEDURE TRTCNG (pIdtCss CNGENT.IdtCss%TYPE,
                    pIdtCng CNGENT.IdtCng%TYPE);
END CSSCNG01_SPC;
/
