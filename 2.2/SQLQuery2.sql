insert Doctor
(PatientName,Profession)
values
('����','���������'),('����','������'),('�����','���������'),('��������','��������'),('����','��������'),('������','�������'),('�������','�����')
go

insert Outpatient_card(IDDoctor,IDDisease,VisitDate,Disease,Treatment,VisitPurpose)
values(1,2,'2008-12-26 13:23:44.657','��������','������ ������ �� ������','��������'),
(2,3,'2008-12-26 13:23:44.657','����','���','��������'),
(3,3,'2008-12-26 13:23:44.657','�������','���','��������'),
(4,2,'2008-12-26 13:23:44.657','����','��� � �����','��������'),
(5,2,'2008-12-26 13:23:44.657','������','���� � �������','��������'),
(6,3,'2008-12-26 13:23:44.657','�������','��� � �����','��������'),
(7,2,'2008-12-26 13:23:44.657','�����','����� ���������','��������'),
(2,3,'2008-12-26 13:23:44.657','��������','������','��������'),
(1,2,'2008-12-26 13:23:44.657','����','������','��������'),
(7,2,'2008-12-26 13:23:44.657','����','������','��������')
go

insert Treatment(Methods,Disease)
values('Chai','������'),
('Sessiy','������')
go

insert Patient(PatientName1,Adress)
values('����','��������'),
('����','��������'),
('����','��������'),
('����','��������'),
('����','��������')
go