 CREATE DATABASE HospitalDB
GO
-----------------Doctor-------------------
CREATE TABLE Doctor
(ID int not null IDENTITY(1,1),
PatientName nvarchar(20) not null,
Profession nvarchar(20) not null
 )
 go
-----------------Patient-------------------
 create table Patient(
 ID int not null,
 PatientName1 nvarchar(20) not null,
 Adress nvarchar(20) not null
 ) 
 go

-----------------Outpatient_card-------------------
create table Outpatient_card(
IDDoctor int not null ,
IDPatient int not null identity(1,1) ,
IDDisease int not null ,
VisitDate datetime not null,
Disease nvarchar(20) not null,
Treatment nvarchar(40) not null,
VisitPurpose nvarchar(10) not null
)
go

-----------------Schedule-------------------
create table Schedule(
IDDoctor1 int not null,
IDProffesion1 int not null,
ReceptionDay datetime not null,
TimeStart datetime not null,
TimeEnd date not null,
Cabinet int not null,
)
go
-----------------Treatment-------------------
create table Treatment (
IDTreatment int not null Identity(1,1),
Methods nvarchar(30) not null,
Disease nvarchar(30) not null
)
go
-----------------Proffesion-------------------
create table Proffesion(
IDProffesion int not null Identity(1,1),
ProffesionName nvarchar(20) not null
)
go
----------------------------------------------Creation Finish----------------------------------------------
alter table Doctor 
add 
primary key (ID)
go

alter table Treatment
add 
primary key (IDTreatment),
check(Disease in ('Ветрянка','Грибок','Ангина','Лейкемия','Полиемелит'))
go

alter table Proffesion
add 
primary key (IDProffesion)
go

alter table Outpatient_card
add 
primary key (IDPatient)
go
-------------------------------------Alters---------------------- ---------------------------------------
alter table Patient 
add 
UNIQUE(ID)
GO

alter table Patient 
add
Foreign key (ID) references Outpatient_card(IDPatient)
on delete cascade 
go

alter table Outpatient_card
add 
Unique(IDDoctor,IDDisease)
go

alter table Outpatient_card 
add
Foreign key (IDDoctor) references Doctor(ID),
Foreign key (IDDisease) references Treatment(IDTreatment)
on delete cascade
GO

alter table Outpatient_card
add 
check (VisitDate between dateadd(year,-125,getdate()) and dateadd(year,0,getdate())) 
go

alter table Schedule
add 
Unique(IDDoctor1,IDProffesion1)
go

alter table Schedule
add 
Foreign key (IDDoctor1) references Doctor(ID),
Foreign key (IDProffesion1) references Proffesion(IDProffesion)
on delete cascade
GO
--------------------Чтобы дата конца лечение не была больше даты начала--------------------------------------------
alter table Schedule
add 
check(TimeEnd>TimeStart),
check(Cabinet like'([0-254])'),
check(TimeStart between dateadd(hour,8,ReceptionDay) and dateadd(hour,19,ReceptionDay)),
check(ReceptionDay between dateadd(day,1,getdate())and dateadd(day,31,getdate()))
go

alter table Treatment
add
check(Disease in ('Ветрянка','Грибок','Ангина','Лейкемия','Полиемелит'))
go


