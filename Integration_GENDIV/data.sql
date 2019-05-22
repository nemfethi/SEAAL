prompt Importing table gstbtc...
set feedback off
set define off
insert into gstbtc (IDT, LIB, LIBABR, PTHFIL, LIBINT)
values ('027', 'Import Compteurs Generaux/Divisionnaires', 'Import GEN/DIV', 'IMPGENDIV.bat', 'IMPGENDIV');

insert into gstbtc (IDT, LIB, LIBABR, PTHFIL, LIBINT)
values ('028', 'Integration Compteurs Generaux/Divisionnaires', 'Integration GEN/DIV', 'TRTGENDIV.bat', 'TRTGENDIV');

commit;

prompt Done.
