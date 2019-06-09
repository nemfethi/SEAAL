create or replace package body Alg_GenDiv is
  procedure nettoyage is
  begin
    begin
      /*Vide la table interm�diaire IMPCLT.*/
      execute immediate 'truncate table IMPCLT.IMPGENDIV';
    end;
  end;
  procedure load_file is
    v_maxImp number;
  begin
    /*
    Charge la table interm�diaire IMPCLT.depuis
    la table externe IMPDATA
    */
    select nvl(max(idtimpentgendiv), 0) + 1
      into v_maxImp
      from impentgendiv;
    Nettoyage;
    insert into impgendiv
      (idtimpentgendiv,
       numero,
       idtpntlvrgen,
       idtpntcpggen,
       idtpntlvrdiv,
       idtpntcpgdiv,
       IdtTrnTyp)
      select v_maxImp,
             numero,
             idtpntlvrgen,
             idtpntcpggen,
             idtpntlvrdiv,
             idtpntcpgdiv,
             IdtTrnTyp
        from impcsvgendiv;
  
    insert into impentgendiv
      (idtimpentgendiv, datimp)
    values
      (v_maxImp, sysdate);
  
  exception
    when others then
      dbms_output.put_line(sqlerrm);
      raise;
  end;
  Procedure Controle is
    nbgen     number;
    typcpgGen typcpg.idttypcpg%type;
    --typcpgDiv typcpg.idttypcpg%type;
    nbdiv number;
    nbtrn number;
    --i         number;
    --j         number;  
  begin
    /*
    1. plusieurs GEN dans le fichier
    2. le GEN n'est pas de type GEN
    3. au moins un DIV dans la liste des PREDIV
    4. le GEN et les PREDIV ne sont pas dans la même trounée
    5. le GEN est en cours de facturation
    6. au moins un PREDIV est en cour de facturation
    7. le GEN est résilié
    8. au moins un PREDIV est résilié
    9. le GEN et au moins un PREDIV n'ont pas le même cycle
    10. au moins un PREDIV n''a pas de contrat
    11. le compteur général n''existe pas
    12. la trounée type destination n'existe pas
    */
  
    dbms_output.put_line('Controles d''intégration GENDIV: ');
    -- 01. plusieurs GEN dans le fichier
    dbms_output.put_line('   01. plusieurs GEN dans le fichier : ');
    begin
      select count(*)
        into nbgen
        from (select distinct idtpntlvrgen, idtpntcpggen from impgendiv);
      if nbgen > 1 then
        dbms_output.put_line('     ----> Erreur détectée.'); /*controle*/
        update impgendiv set stt = 1;
        commit;
        return;
      else
        dbms_output.put_line('     Aucune erreur.');
        update impgendiv set stt = 0 where stt is null;
      end if;
    exception
      when others then
        dbms_output.put_line('     ----> Autre Erreur.');
        dbms_output.put_line(sqlerrm);
    end;
    -- 2.le GEN n'est pas de type GEN
    dbms_output.put_line('   02. le compteur General n''est pas de type de comptage General');
    begin
      Select Idttypcpg
        into TypcpgGen
        from x7.Pntcpg
       where (Idtpntlvr, IdtPntCpg) =
             (select distinct idtpntlvrgen, idtpntcpggen from impgendiv);
      if TypCpgGen != 3 then
        dbms_output.put_line('     ----> Erreur détectée.');
        update impgendiv set stt = 1;
        commit;
        return;
      else
        dbms_output.put_line('     Aucune erreur.');
      end if;
    exception
      when others then
        dbms_output.put_line('     ----> Autre Erreur.');
        dbms_output.put_line(sqlerrm);
    end;
    --3. au moins un DIV dans la liste des PREDIV
    dbms_output.put_line('   03. au moins un PC déjà Divisionnaire dans la liste des PRE-Divisionnaires ');
    begin
      select count(*)
        into nbdiv
        from impgendiv, x7.pntcpg
       where pntcpg.idtpntlvr = impgendiv.idtpntlvrdiv
         and pntcpg.idtpntcpg = impgendiv.idtpntcpgdiv
         and idttypcpg = 4;
      if nbdiv > 1 then
        dbms_output.put_line('     ----> Erreur détectée.');
        update impgendiv set stt = 1;
        commit;
        return;
      else
        dbms_output.put_line('     Aucune erreur.');
        update impgendiv set stt = 0 where stt is null;
        commit;
      end if;
    exception
      when others then
        dbms_output.put_line('     ----> Autre Erreur.');
        dbms_output.put_line(sqlerrm);
    end;
    --4. le GEN et les PREDIV ne sont pas dans la même tournée
    dbms_output.put_line('   04. le Général et les PRE-Divisionnaires ne sont pas dans la même tournée');
    begin
      select count(*)
        into nbtrn
        from impgendiv, x7.pntcpg pcg, x7.pntcpg pcd
       where pcg.idtpntlvr = impgendiv.idtpntlvrgen
         and pcg.idtpntcpg = impgendiv.idtpntcpggen
         and pcd.idtpntlvr = impgendiv.idtpntlvrdiv
         and pcd.idtpntcpg = impgendiv.idtpntcpgdiv
         and pcg.idttrntyp != pcd.idttrntyp;
      if nbtrn > 1 then
        dbms_output.put_line('     ----> Erreur détectée.');
        return;
      else
        dbms_output.put_line('     Aucune erreur.');
        update impgendiv set stt = 0 where stt is null;
        commit;
      end if;
    exception
      when others then
        dbms_output.put_line('     ----> Autre Erreur.');
        dbms_output.put_line(sqlerrm);
    end;
    --5.le GEN est en cours de facturation
    dbms_output.put_line('   05. le Général est en cours de facturation');
    begin
      Select count(*)
        into nbgen
        from x7.ctr
       where (Idtpntlvr, IdtPntCpg) in
             (select distinct idtpntlvrgen, idtpntcpggen from impgendiv)
         and ctr.datrsl is null
         and ettctrfct = 1;
      if nbgen > 1 then
        dbms_output.put_line('     ----> Erreur détectée.');
        update impgendiv set stt = 1;
        commit;
        return;
      else
        dbms_output.put_line('     Aucune erreur.');
      end if;
    exception
      when others then
        null;
    end;
    --6. au moins un PREDIV est en cour de facturation
    dbms_output.put_line('   06. au moins un PREDIV est en cour de facturation');
    begin
      Select count(*)
        into nbdiv
        from x7.ctr
       where (Idtpntlvr, IdtPntCpg) in
             (select distinct idtpntlvrdiv, idtpntcpgdiv from impgendiv)
         and ctr.datrsl is null
         and ettctrfct != 1;
      if nbdiv > 1 then
        dbms_output.put_line('     ----> Erreur détectée.');
        update impgendiv set stt = 1;
        commit;
        return;
      else
        dbms_output.put_line('     Aucune erreur.');
        update impgendiv set stt = 0 where stt is null;
        commit;
      end if;
    exception
      when others then
        dbms_output.put_line('     ----> Autre Erreur.');
        dbms_output.put_line(sqlerrm);
    end;
    --7.le GEN est r�sili�
    dbms_output.put_line('   07. le Général est résilié');
    begin
      Select count(*)
        into nbgen
        from x7.ctr
       where (Idtpntlvr, IdtPntCpg) =
             (select distinct idtpntlvrgen, idtpntcpggen from impgendiv)
         and ctr.datrsl is not null;
      if nbgen > 1 then
        dbms_output.put_line('     ----> Erreur détectée.');
        update impgendiv set stt = 1;
        commit;
        return;
      else
        dbms_output.put_line('     Aucune erreur.');
        update impgendiv set stt = 0 where stt is null;
        commit;
      end if;
    exception
      when others then
        dbms_output.put_line('     ----> Autre Erreur.');
        dbms_output.put_line(sqlerrm);
    end;
    --8.
    dbms_output.put_line('   08. au moins un PREDIV est résilié');
    begin
      Select count(*)
        into nbdiv
        from x7.ctr, impgendiv
       where ctr.idtpntlvr = impgendiv.idtpntlvrdiv
         and ctr.idtpntcpg = impgendiv.idtpntcpgdiv
         and ctr.datrsl is not null
         and x7.estpntcpginactif(impgendiv.idtpntlvrdiv,
                                 impgendiv.idtpntcpgdiv) != 0;
      if nbdiv > 1 then
        dbms_output.put_line('     ----> Erreur détectée.');
        update impgendiv set stt = 1;
        commit;
        for c in (Select numero
                    from x7.ctr, impgendiv
                   where ctr.idtpntlvr = impgendiv.idtpntlvrdiv
                     and ctr.idtpntcpg = impgendiv.idtpntcpgdiv
                     and ctr.datrsl is not null
                     and x7.estpntcpginactif(impgendiv.idtpntlvrdiv,
                                             impgendiv.idtpntcpgdiv) != 0) loop
          dbms_output.put_line('       ----> Num�ro: ' || c.numero);
        end loop;
        return;
      else
        dbms_output.put_line('     Aucune erreur.');
        update impgendiv set stt = 0 where stt is null;
        commit;
      end if;
    exception
      when others then
        dbms_output.put_line('     ----> Autre Erreur.');
        dbms_output.put_line(sqlerrm);
    end;
    --9.
    dbms_output.put_line('   09. le GEN et au moins un PREDIV n''ont pas le même cycle');
    begin
      Select count(*)
        into nbdiv
        from (select distinct idtcycfac
                from impgendiv, x7.ctr, x7.avtctr, x7.factyp
               where impgendiv.idtpntlvrdiv = ctr.IDTPNTLVR
                 and impgendiv.idtpntcpgdiv = x7.ctr.idtpntcpg
                 and ctr.idtctr = avtctr.idtctr
                 and numavn = sqcavn
                 and impgendiv.stt = 0
                 and avtctr.idtfactyp = factyp.idtfactyp
              union
              select distinct idtcycfac
                from impgendiv, x7.ctr, x7.avtctr, x7.factyp
               where impgendiv.idtpntlvrgen = ctr.IDTPNTLVR
                 and impgendiv.idtpntcpggen = x7.ctr.idtpntcpg
                 and ctr.idtctr = avtctr.idtctr
                 and numavn = sqcavn
                 and impgendiv.stt = 0
                 and avtctr.idtfactyp = factyp.idtfactyp);
      if nbdiv > 1 then
        dbms_output.put_line('     ----> Erreur détectée.');
        update impgendiv set stt = 1;
        commit;
        for c in (Select numero
                    from x7.ctr, impgendiv
                   where ctr.idtpntlvr = impgendiv.idtpntlvrdiv
                     and ctr.idtpntcpg = impgendiv.idtpntcpgdiv
                     and ctr.datrsl is not null
                     and x7.estpntcpginactif(impgendiv.idtpntlvrdiv,
                                             impgendiv.idtpntcpgdiv) != 0) loop
          dbms_output.put_line('       ----> Numéro: ' || c.numero);
        end loop;
        return;
      else
        dbms_output.put_line('     Aucune erreur.');
        update impgendiv set stt = 0 where stt is null;
        commit;
      end if;
    exception
      when others then
        dbms_output.put_line('     ----> Autre Erreur.');
        dbms_output.put_line(sqlerrm);
    end;
    --10.
    dbms_output.put_line('   10. au moins un PREDIV n''a pas de contrat');
    begin
      Select count(*)
        into nbdiv
        from x7.ctr, impgendiv
       where ctr.idtpntlvr(+) = impgendiv.idtpntlvrdiv
         and ctr.idtpntcpg(+) = impgendiv.idtpntcpgdiv
         and idtpntlvr is null;
      if nbdiv > 1 then
        dbms_output.put_line('     ----> Erreur détectée.');
        update impgendiv set stt = 1;
        commit;
        for c in (Select numero
                  
                    from x7.ctr, impgendiv
                   where ctr.idtpntlvr(+) = impgendiv.idtpntlvrdiv
                     and ctr.idtpntcpg(+) = impgendiv.idtpntcpgdiv
                     and idtpntlvr is null) loop
          dbms_output.put_line('       ----> Numéro: ' || c.numero);
        end loop;
        return;
      else
        dbms_output.put_line('     Aucune erreur.');
        update impgendiv set stt = 0 where stt is null;
        commit;
      end if;
    exception
      when others then
        dbms_output.put_line('     ----> Autre Erreur.');
        dbms_output.put_line(sqlerrm);
    end;
    --11.
    dbms_output.put_line('   11. le compteur général n''existe pas');
    begin
      Select count(*)
        into nbdiv
        from x7.ctr, impgendiv
       where ctr.idtpntlvr(+) = impgendiv.idtpntlvrgen
         and ctr.idtpntcpg(+) = impgendiv.idtpntcpggen
         and idtpntlvr is null;
      if nbdiv > 1 then
        dbms_output.put_line('     ----> Erreur détectée.');
        update impgendiv set stt = 1;
        commit;
        for c in (Select numero
                    from x7.ctr, impgendiv
                   where ctr.idtpntlvr(+) = impgendiv.idtpntlvrgen
                     and ctr.idtpntcpg(+) = impgendiv.idtpntcpggen
                     and idtpntlvr is null) loop
          dbms_output.put_line('       ----> Numéro:  '|| c.numero);
        end loop;
        return;
      else
        dbms_output.put_line('     Aucune erreur.');
        update impgendiv set stt = 0 where stt is null;
        commit;
      end if;
    exception
      when others then
        dbms_output.put_line('     ----> Autre Erreur.');
        dbms_output.put_line(sqlerrm);
    end;
  end;

  Procedure Resilier_Contrat(pIdtCtr in ctr.idtctr%type, pcr out number) is
    vDatRsl X7.CTR.DatRsl%type;
  begin
  
    begin
      update x7.Ctr
         set DatRsl = Findrnprdfct
       where idtctr = pIdtCtr
      returning DatRsl into vDatRsl;
      update X7.AvtCtr
         set DatFin = vDatRsl
       where idtctr = pIdtCtr
         and DatFin is Null;
      dbms_output.put_line('Succès Résiliation Contrat: ' || pIdtCtr);
      pcr := 0;
    exception
      when others then
        dbms_output.put_line('Erreur Résiliation Contrat: ' || pIdtCtr);
        dbms_output.put_line(sqlerrm);
        pcr := 1;
    end;
  end;
  Procedure Creer_Contrat(pIdtCtrAnc in ctr.idtctr%type,
                          pIdtCtrnve out ctr.idtctr%type,
                          pcr        out number) is
    vIdtCtr number;
  begin
    null;
    /*
    Select ancien contrat
    creation nouveau contrat
    avec nouveau type contrat
    */
    --nouveau code contrat
    begin
      x7.x7_trtseq01.X7_NXTTABSEQ('SEQCTR', vIdtCtr);
      insert into X7.Ctr
        (idtctr,
         idtpntlvr,
         idtpntcpg,
         idtcltdst,
         idtcltssc,
         idtcntopr,
         idtcodsns,
         datscr,
         sqcavn,
         ettctr,
         ettctrfct,
         codtypctr,
         idtsrv,
         idtrcvtyp,
         FINDRNPRDFCT,
         t1,
         idtt1,
         t2,
         idtt2,
         t3,
         idtt3,
         t4,
         idtt4,
         t5,
         idtt5,
         a1,
         a2,
         a3,
         a4,
         a5,
         n1,
         n2,
         n3,
         n4,
         n5,
         c1,
         c2,
         c3,
         c4,
         c5)
        (select vIdtCtr,
                idtpntlvr,
                idtpntcpg,
                idtcltdst,
                idtcltssc,
                idtcntopr,
                idtcodsns,
                trunc(sysdate), --datscr
                1,
                ettctr,
                ettctrfct,
                gNewCodTypCtr,
                idtsrv,
                idtrcvtyp,
                findrnprdfct,
                t1,
                idtt1,
                t2,
                idtt2,
                t3,
                idtt3,
                t4,
                idtt4,
                t5,
                idtt5,
                a1,
                a2,
                a3,
                a4,
                a5,
                n1,
                n2,
                n3,
                n4,
                n5,
                c1,
                c2,
                c3,
                c4,
                c5
           from X7.Ctr
          where idtctr = pIdtCtrAnc);
      Creer_avenant(pIdtCtrAnc, vIdtCtr);
      dbms_output.put_line('Succès Création Contrat: ' || vIdtCtr);
      pIdtCtrNve := vIdtCtr;
      pCr        := 0;
    exception
      when others then
        dbms_output.put_line('Erreur Création Contrat: ' || vIdtCtr);
        dbms_output.put_line(sqlerrm);
        pcr := 1;
    end;
  
  end;

  Procedure Creer_avenant(pIdtCtrAnc in ctr.idtctr%type,
                          pIdtCtrNve in ctr.idtctr%type) is
  begin
    null;
    /*
    select derneir avenant du CtrAnc
    creer avenant sur le nouveau contrat
    */
    begin
      insert into x7.avtctr
        (idtclt,
         idtctr,
         numavn,
         idttrf,
         idtfactyp,
         idtacv,
         datdbt,
         datfin,
         exntva,
         datcrt,
         idtcltdst,
         chp01,
         chp02,
         chp03,
         chp04,
         chp05,
         chp06,
         chp07,
         chp08,
         chp09,
         chp10,
         chp11,
         chp12,
         chp13,
         chp14,
         chp15,
         cffmlp)
        select idtclt,
               pIdtCtrNve,
               1, --numavn,
               idttrf,
               idtfactyp,
               idtacv,
               ctr.FINDRNPRDFCT + 1, --datdbt,
               null,
               exntva,
               trunc(sysdate), --avtctr.datcrt,
               avtctr.idtcltdst,
               chp01,
               chp02,
               chp03,
               chp04,
               chp05,
               chp06,
               chp07,
               chp08,
               chp09,
               chp10,
               chp11,
               chp12,
               chp13,
               chp14,
               chp15,
               cffmlp
          from x7.avtctr, x7.ctr
         where ctr.idtctr = avtctr.idtctr
           and ctr.idtctr = pIdtCtrAnc
           and numavn = sqcavn;
      dbms_output.put_line('Succès Création Avenant Contrat: ' ||
                           pIdtCtrNve);
    exception
      when others then
        dbms_output.put_line('Erreur Création Avenant Contrat: ' ||
                             pIdtCtrNve);
        dbms_output.put_line(sqlerrm);
      
    end;
  end;

  Procedure Rattacher_PC(pIdtPntLvrGen    in x7.pntcpg.idtpntlvr%type,
                         pIdtPntLvrDiv    in x7.pntcpg.idtpntlvr%type,
                         pIdtPntCpgDiv    in x7.pntcpg.idtpntCpg%type,
                         pIdtPntCpgDivNew out x7.pntcpg.idtpntCpg%type,
                         pCr              out number) is
    --vIdtPntCpgDiv x7.pntcpg.idtpntCpg%type;
    --pCr           number;
  begin
    /*
    x7.x7_chgcodpntcpg(pIdtPntLvrDiv,
                       pIdtPntCpgDiv,
                       pIdtPntLvrGen,
                       vIdtPntCpgDiv,
                       pCr);
    
    
    
    */
    BEGIN
      select sqcpntcpg + 1
        into pIdtPntCpgDivNew
        from x7.pntlvr
       where idtpntlvr = pIdtPntLvrGen;
      update x7.PntCpg
         set IdtPntLvr = pIdtPntLvrGen,
             IdtPntCpg = pIdtPntCpgDivNew,
             idttypcpg = 4
       where IdtPntLvr = pIdtPntLvrDiv
         and IdtPntCpg = pIdtPntCpgDiv;
      update x7.ctr
         set Idtpntlvr = pIdtPntLvrGen, idtpntcpg = pIdtPntCpgDivNew
       where IdtPntLvr = pIdtPntLvrDiv
         and IdtPntCpg = pIdtPntCpgDiv
         and datrsl is null;
      update x7.PntLvr
         set SqcPntCpg = pIdtPntCpgDivNew
       where IdtPntLvr = pIdtPntLvrGen;
      pCr := 0;
      dbms_output.put_line('Succès Rattachement PC: ' || pIdtPntLvrDiv ||
                           ' / ' || pIdtPntCpgDiv || ' ==> ' ||
                           pIdtPntLvrGen || ' / ' || pIdtPntCpgDivNew);
    EXCEPTION
      When OTHERS Then
        dbms_output.put_line('Erreur Pendant Rattachement PC: ' ||
                             pIdtPntCpgDiv || ' / ' || pIdtPntCpgDiv);
        dbms_output.put_line(sqlerrm);
        pCr := 1;
    END;
  end;
  Procedure Import is
  begin
    nettoyage;
    load_file;
    controle;
  end;
  Procedure Traitement is
    cursor cCtr is
      select Ctr.IdtCtr,
             AvtCtr.Numavn,
             impgendiv.idtpntlvrgen,
             impgendiv.idtpntcpggen,
             impgendiv.idtpntlvrdiv,
             impgendiv.idtpntcpgdiv
        from impgendiv, x7.ctr, x7.avtctr
       where impgendiv.idtpntlvrdiv = ctr.IDTPNTLVR
         and impgendiv.idtpntcpgdiv = x7.ctr.idtpntcpg
         and ctr.idtctr = avtctr.idtctr
         and numavn = sqcavn
         and impgendiv.stt = 0;
    rCtr       cCtr%rowtype;
    pcr        number := 0;
    pcr1       number;
    pcr2       number;
    pcr3       number;
    nbstt      number;
    vIdtCtr    x7.Ctr.idtctr%type;
    vIdtPntCpg x7.pntcpg.idtpntcpg%type;
  begin
    select count(*) into nbstt from impgendiv where stt != 0;
    if nbstt = 0 then
      savepoint s1;
      open cCtr;
      loop
        fetch cCtr
          into rCtr;
        exit when cCtr%notfound;
        dbms_output.put_line('---------------------------------------------------');
        Resilier_Contrat(pIdtCtr => rCtr.Idtctr, pcr => pCr1);
        Creer_Contrat(pIdtCtrAnc => rCtr.Idtctr,
                      pIdtCtrnve => vIdtCtr,
                      pcr        => pCr2);
        Rattacher_PC(pIdtPntLvrGen    => rCtr.Idtpntlvrgen,
                     pIdtPntLvrDiv    => rCtr.Idtpntlvrdiv,
                     pIdtPntCpgDiv    => rCtr.Idtpntcpgdiv,
                     pIdtPntCpgDivNew => vIdtPntCpg,
                     pCr              => pcr3);
        pcr := pcr + pcr1 + pcr2;
        dbms_output.put_line(pcr);
      end loop;
      close cCtr;
      if pcr = 0 then
        commit;
        dbms_output.put_line('==============================================');
        dbms_output.put_line('traitement Généraux/Divisionnaire effectué avec succès');
      else
        rollback to s1;
      end if;
    else
      dbms_output.put_line('Verifier les Controles ');
    end if;
  end;
end Alg_GenDiv;
/
