delete from X7_sldopr_fne A where rowid>(select min(rowid) from X7_Sldopr_Fne B where a.IdtOpr = b.IdtOpr)
