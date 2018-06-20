--1--��� ��������/������� ������ � ������� ����
--select manufactury.*, lending_bill_of_lading.*, raw_material.Name
--from manufactury 
--inner join lending_bill_of_lading on lending_bill_of_lading.id_manufactury = manufactury.id_manufactury
--inner join raw_material on raw_material.id_raw_material = lending_bill_of_lading.id_raw_material
--order by manufactury.id_manufactury

--2--���������� ��� ������������� ���� ������� ����� ��������/�������
--select provider.*, raw_material_by_contract.*
--from provider 
--inner join contract on contract.id_provider = provider.id_provider
--inner join raw_material_by_contract on raw_material_by_contract.id_contract = contract.id_contract
--inner join raw_material on raw_material.id_raw_material = raw_material_by_contract.id_raw_material
--where raw_material.Name = 'Wool'

--select * from raw_material

--3--���������� ��� ����� ������� �������� �� ������� �����
--select earning_bill_of_lading.*
--from earning_bill_of_lading
--inner join raw_material on raw_material.id_raw_material = earning_bill_of_lading.id_raw_material
--where earning_bill_of_lading.Earning_date > dateadd(MONTH, -1, getdate())

--4--�������� ������� ������ ����� ��������
--select Sum(lending_bill_of_lading.Amount) as AllMat
--from lending_bill_of_lading 
--inner join raw_material on raw_material.id_raw_material = lending_bill_of_lading.id_raw_material
--where raw_material.Material = 1

--5--������� �������� ��������/�������� ������ ����� ����� ����
--select Sum(lending_bill_of_lading.Amount) as Summa
--from lending_bill_of_lading
--inner join manufactury on manufactury.id_manufactury  = lending_bill_of_lading.id_manufactury
--where lending_bill_of_lading.Lending_date = '15-03-2018' and manufactury.Name = 'Main'

--select * from lending_bill_of_lading
--select * from manufactury

--6--�������������(�����) �� ����� ��������� ������ ������� ������� ������
--select provider.*, raw_material_by_contract.*
--from provider 
--inner join contract on contract.id_provider = provider.id_provider
--inner join raw_material_by_contract on raw_material_by_contract.id_contract = contract.id_contract
--where raw_material_by_contract.Amount>=500
--order by provider.Name

--7--�������� ������� ���������  ��������/�������� �� ����������
--select Sum(earning_bill_of_lading.Amount) as Summa
--from earning_bill_of_lading
--inner join contract on contract.id_contract = earning_bill_of_lading.id_contract
--where contract.id_contract = 1;

--8--�������� �-�� ��������/�������� �� ������ �� ������� �� ����
--select MAX(lending_bill_of_lading.Amount) as Greatest
--from lending_bill_of_lading
--where lending_bill_of_lading.Lending_date > dateadd(MONTH, -6, getdate

--9--�������� ������� ������ �� ������� ������ ������������ 
--select MAX(raw_material_by_contract.Amount)as MaxAmount
--from provider
--inner join contract on contract.id_provider = provider.id_provider
--inner join raw_material_by_contract on raw_material_by_contract.id_contract = contract.id_contract
--where provider.id_provider=1;

--10--����� ��������� � �������������� �� ���������� �������
--select contract.Conditions, provider.Name
--from contract
--inner join provider on provider.id_provider=contract.id_provider
--where contract.id_contract = 2
--order by provider.Name

---select * from earning_bill_of_lading

-----����� ������������� �� ��������� �� 2 ���� ������ �� ������� �����
--select provider.Name, COUNT(earning_bill_of_lading.id_contract) as EarnCount
--from provider 
--inner join contract on contract.id_provider = provider.id_provider
--inner join earning_bill_of_lading on earning_bill_of_lading.id_contract = contract.id_contract
--where earning_bill_of_lading.Earning_date>dateadd(MONTH, -1, getdate())
--group by provider.Name
--having COUNT(earning_bill_of_lading.id_contract)=2