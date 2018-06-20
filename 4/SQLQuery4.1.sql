--CREATE VIEW Qresult1 AS
--SELECT dbo_student.Name_ini, sum(Reiting) AS SummReiting, predmet.Nazva
--FROM dbo_groups
--INNER JOIN Predmet_plan ON dbo_groups.K_navch_plan = Predmet_plan.K_navch_plan
--INNER JOIN predmet ON Predmet_plan.K_predmet = predmet.K_predmet
--INNER JOIN dbo_student ON dbo_groups.Kod_group = dbo_student.Kod_group
--INNER JOIN Reiting ON Reiting.Kod_student = dbo_student.Kod_stud
--GROUP BY Kod_student, dbo_student.Name_ini, predmet.Nazva
--ORDER BY Kod_student

---CREATE VIEW Qresult2 AS
--SELECT dbo_groups.Kod_group, COUNT(dbo_student.Kod_group) as StudentCount
--FROM dbo_groups LEFT JOIN dbo_student on dbo_groups.Kod_group = dbo_student.Kod_group
--GROUP BY dbo_groups.Kod_group;

---CREATE VIEW Qresult3 AS
--SELECT dbo_groups.Kod_group, COUNT(Predmet_plan.K_predm_pl) AS PredmetCount
--FROM dbo_groups
--INNER JOIN Predmet_plan ON Predmet_plan.K_navch_plan = dbo_groups.K_navch_plan
--GROUP BY dbo_groups.Kod_group

---CREATE VIEW Qresult4 AS
--SELECT Rozklad_pids.Kod_group, COUNT(K_zapis) AS heldLessonsCount
--FROM Rozklad_pids
--GROUP BY Rozklad_pids.Kod_group

---CREATE VIEW Qresult5 AS
--SELECT dbo_groups.Kod_group, AVG(Reiting.Reiting) as AvgReiting
--FROM dbo_groups LEFT JOIN dbo_student on dbo_groups.Kod_group = dbo_student.Kod_group
--LEFT JOIN Reiting on dbo_student.Kod_stud = Reiting.Kod_student
--GROUP BY dbo_groups.Kod_group;


---CREATE VIEW Qresult6 AS
--SELECT predmet.Nazva, AVG(Reiting.Reiting) AS PredmetReiting
--FROM predmet
--INNER JOIN Predmet_plan ON Predmet_plan.K_predmet = predmet.K_predmet
--INNER JOIN Rozklad_pids ON Rozklad_pids.K_predm_pl = Predmet_plan.K_predm_pl
--INNER JOIN Reiting ON Reiting.K_zapis = Rozklad_pids.K_zapis
--GROUP BY predmet.Nazva

---CREATE VIEW Qresult7 AS
--SELECT dbo_student.Name_ini, AVG (Reiting.reiting) AS Reiting, predmet.Nazva
--FROM dbo_student
--INNER JOIN Reiting ON Reiting.Kod_student = dbo_student.Kod_stud
--INNER JOIN Rozklad_pids ON Rozklad_pids.K_zapis = Reiting.K_zapis
--INNER JOIN Predmet_plan ON Predmet_plan.K_predm_pl = Rozklad_pids.K_predm_pl
--INNER JOIN predmet ON predmet.K_predmet = Predmet_plan.K_predmet
--where  dbo_student.Name_ini = 'Шелуха О.О.'
--GROUP BY dbo_student.Name_ini, predmet.Nazva;

---CREATE VIEW Qresult8 AS
--SELECT predmet.Nazva, Min(Reiting.Reiting) AS MinReiting
--FROM predmet
--INNER JOIN Predmet_plan ON Predmet_plan.K_predmet = predmet.K_predmet
--INNER JOIN Rozklad_pids ON Rozklad_pids.K_predm_pl = Predmet_plan.K_predm_pl
--INNER JOIN Reiting ON Reiting.K_zapis = Rozklad_pids.K_zapis
--GROUP BY predmet.Nazva

--CREATE VIEW Qresult9 AS
--SELECT predmet.Nazva, Max(Reiting.Reiting) AS MinReiting
--FROM predmet
--INNER JOIN Predmet_plan ON Predmet_plan.K_predmet = predmet.K_predmet
--INNER JOIN Rozklad_pids ON Rozklad_pids.K_predm_pl = Predmet_plan.K_predm_pl
--INNER JOIN Reiting ON Reiting.K_zapis = Rozklad_pids.K_zapis
--GROUP BY predmet.Nazva

--CREATE VIEW Qresult10 AS
--SELECT predmet.Nazva, COUNT (Rozklad_pids.K_zapis) as heldLessons
--FROM predmet
--INNER JOIN Predmet_plan ON Predmet_plan.K_predmet = predmet.K_predmet
--INNER JOIN Rozklad_pids ON Rozklad_pids.K_predm_pl = Predmet_plan.K_predm_pl
--GROUP BY predmet.Nazva;

--CREATE VIEW Qresult11 AS
--SELECT Spetsialnost.Nazva, COUNT(dbo_groups.Kod_group) AS kilkistGroup
--FROM Spetsialnost
--INNER JOIN Navch_plan ON Navch_plan.K_spets = Spetsialnost.K_spets
--INNER JOIN dbo_groups ON dbo_groups.K_navch_plan = Navch_plan.K_navch_plan
--GROUP BY Spetsialnost.Nazva

