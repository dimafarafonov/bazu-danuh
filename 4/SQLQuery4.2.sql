

--3--�������� ������� ������ ����� ��������
--select raw_material.Name, Sum(lending_bill_of_lading.Amount) as Summ
--from lending_bill_of_lading 
--inner join raw_material on raw_material.id_raw_material = lending_bill_of_lading.id_raw_material
--where raw_material.Raw=1
--group by raw_material.Name


--4--�������� ������� ������ �� ������� ����� ������������ 
--select provider.Name , MAX(raw_material_by_contract.Amount)as MaxAmount
--from provider
--inner join contract on contract.id_provider = provider.id_provider
--inner join raw_material_by_contract on raw_material_by_contract.id_contract = contract.id_contract
--group by provider.Name;

--5--�������� ������� ������ ����� ��������
--select raw_material.Name, Sum(lending_bill_of_lading.Amount) as Summ
--from lending_bill_of_lading 
--inner join raw_material on raw_material.id_raw_material = lending_bill_of_lading.id_raw_material
--where raw_material.Material = 1
--group by raw_material.Name


--6--�������� ������� ���������  ��������/�������� �� ���������� ������� �������������
--select provider.Name, Sum(earning_bill_of_lading.Amount) as Summa
--from earning_bill_of_lading
--inner join contract on contract.id_contract = earning_bill_of_lading.id_contract
--inner join provider on contract.id_provider = provider.id_provider
--group by provider.Name

--7--�������� ��������, �� ����� ���
--select manufactury.Name, MIN(lending_bill_of_lading.Amount) as MinAmount
--from manufactury
--inner join lending_bill_of_lading on manufactury.id_manufactury = lending_bill_of_lading.id_manufactury
--group by manufactury.Name

--8--�������� ��������, �� ����� ���
--select manufactury.Name, MAX(lending_bill_of_lading.Amount) as MaxAmount
--from manufactury
--inner join lending_bill_of_lading on manufactury.id_manufactury = lending_bill_of_lading.id_manufactury
--group by manufactury.Name

--9--�������������(�����) �� ����� ��������� ������ ������� ������� ������
--select provider.*, raw_material_by_contract.*
--from provider 
--inner join contract on contract.id_provider = provider.id_provider
--inner join raw_material_by_contract on raw_material_by_contract.id_contract = contract.id_contract
--where raw_material_by_contract.Amount>=500
--order by provider.Name

--10-����� ������������� �� ��������� �� 2 ���� ������ �� ������� �����
--select provider.Name, COUNT(earning_bill_of_lading.id_contract) as EarnCount
--from provider 
--inner join contract on contract.id_provider = provider.id_provider
--inner join earning_bill_of_lading on earning_bill_of_lading.id_contract = contract.id_contract
--where earning_bill_of_lading.Earning_date>dateadd(MONTH, -1, getdate())
--group by provider.Name
--having COUNT(earning_bill_of_lading.id_contract)=2