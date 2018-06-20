---1---

--create proc AvgMark
--as 
--begin
--	select dbo_student.Name_ini, avg(Reiting.Reiting) as AvgMark
--	from dbo_student
--	left join Reiting on Reiting.Kod_student = dbo_student.Kod_stud
--	left join Rozklad_pids on Reiting.K_zapis = Rozklad_pids.K_zapis and Rozklad_pids.Zdacha_type = 1 and Rozklad_pids.Date between '2017-01-06' and '2018-01-07'
--	group by dbo_student.Name_ini
--end

--exec AvgMark


---2---

--create proc GlobalAvgMark
--as 
--begin
--	select dbo_student.Name_ini, avg(Reiting.Reiting) as AvgMark
--	from dbo_student
--	left join Reiting on Reiting.Kod_student = dbo_student.Kod_stud
--	left join Rozklad_pids on Reiting.K_zapis = Rozklad_pids.K_zapis and  Rozklad_pids.Date between '2017-01-06' and '2018-01-07'
--	group by dbo_student.Name_ini
--end

--exec GlobalAvgMark


---3---

--create proc Students4_5
--as
--begin
--	select dbo_student.Name_ini, dbo_student.N_ingroup
--	from dbo_student
--	where (select avg(Reiting.Reiting) from Reiting where Reiting.Kod_student = dbo_student.Kod_stud) > 73
--	group by dbo_student.N_ingroup, dbo_student.Name_ini
--end

--execute Students4_5


---4---

--create proc ECTS_Reiting
--as 
--select Reiting.Reiting,
--case 
--	when Reiting.Reiting > 90 then 'A' 
--	when Reiting.Reiting > 65 then 'B'
--	when Reiting.Reiting > 35 then 'C'
--	when Reiting.Reiting > 10 then 'D'
--	when Reiting.Reiting > 0 then 'E'
--	else 'F'
--end as ECTS
--from Reiting

--exec ECTS_Reiting


---5---

--alter trigger addNewGroup
--on dbo_student
--instead of insert
--as
--declare @group varchar(15)
--	if @@ROWCOUNT >= 1
--	begin
--		select @group = kod_group FROM inserted
--			begin 
--				if (select count(*) from dbo_student
--				inner join dbo_groups on dbo_groups.Kod_group = dbo_student.Kod_group
--				where dbo_groups.Kod_group like @group)=0
--					begin
--						INSERT INTO dbo_groups(Kod_group,K_navch_plan)
--						VALUES (@group,1)
--						PRINT 'Додано нову групу!'
--					end 
--				begin
--					insert into dbo_student (Fname,Kod_group,N_ingroup,Name,Sname)
--						select Fname, Kod_group, N_ingroup,Name, Sname from inserted
--					print 'Студент доданий!'
--				end
--			end
--	end;

---6---

--create trigger deleteEmptyGroup
--on dbo_student
--after delete
--as
--declare  @groupKod varchar(15)
--	if @@ROWCOUNT >= 1
--	begin
--		select @groupKod = kod_group FROM deleted
--		begin
--			if (SELECT count(*) FROM dbo_student
--			where dbo_student.Kod_group like @groupKod) = 0
--			begin
--				delete dbo_groups WHERE Kod_group like @groupKod
--				print 'Група видалена, оскільки вона пуста!'
--			end
--		end
--	end;


--select * from dbo_student
--select * from dbo_groups

--insert into dbo_student(Sname, Name, Fname, N_ingroup, Kod_group) values ('Булкін','Михайло','Михайлович','1','ПІ-55');
--delete dbo_groups where Kod_group like 'ПІ-55';


--insert into dbo_student(Sname, Name, Fname, N_ingroup, Kod_group) values ('Булкін','Михайло','Михайлович','1','ПІ-66');




