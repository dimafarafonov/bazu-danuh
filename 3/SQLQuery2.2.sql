--1--вс€ сировина/матер≥ал видана з певного цеху
--select manufactury.*, lending_bill_of_lading.*, raw_material.Name
--from manufactury 
--inner join lending_bill_of_lading on lending_bill_of_lading.id_manufactury = manufactury.id_manufactury
--inner join raw_material on raw_material.id_raw_material = lending_bill_of_lading.id_raw_material
--order by manufactury.id_manufactury

--2--≥нформац≥€ про постачальника €кий постачаЇ певну сировину/матер≥ал
--select provider.*, raw_material_by_contract.*
--from provider 
--inner join contract on contract.id_provider = provider.id_provider
--inner join raw_material_by_contract on raw_material_by_contract.id_contract = contract.id_contract
--inner join raw_material on raw_material.id_raw_material = raw_material_by_contract.id_raw_material
--where raw_material.Name = 'Wool'

--select * from raw_material

--3--≥нформац≥€ про певну прибуту сировину за останн≥й м≥с€ць
--select earning_bill_of_lading.*
--from earning_bill_of_lading
--inner join raw_material on raw_material.id_raw_material = earning_bill_of_lading.id_raw_material
--where earning_bill_of_lading.Earning_date > dateadd(MONTH, -1, getdate())

--4--загальна к≥льк≥сть видач≥ т≥льки матер≥алу
--select Sum(lending_bill_of_lading.Amount) as AllMat
--from lending_bill_of_lading 
--inner join raw_material on raw_material.id_raw_material = lending_bill_of_lading.id_raw_material
--where raw_material.Material = 1

--5--к≥льк≥сть виданого метер≥алу/сировини певним цехом певноњ дати
--select Sum(lending_bill_of_lading.Amount) as Summa
--from lending_bill_of_lading
--inner join manufactury on manufactury.id_manufactury  = lending_bill_of_lading.id_manufactury
--where lending_bill_of_lading.Lending_date = '15-03-2018' and manufactury.Name = 'Main'

--select * from lending_bill_of_lading
--select * from manufactury

--6--постачальники(назва) €к≥ мають поставити велику к≥льк≥сть певного товару
--select provider.*, raw_material_by_contract.*
--from provider 
--inner join contract on contract.id_provider = provider.id_provider
--inner join raw_material_by_contract on raw_material_by_contract.id_contract = contract.id_contract
--where raw_material_by_contract.Amount>=500
--order by provider.Name

--7--загальна к≥льк≥сть прибутого  метер≥алу/сировини за контрактом
--select Sum(earning_bill_of_lading.Amount) as Summa
--from earning_bill_of_lading
--inner join contract on contract.id_contract = earning_bill_of_lading.id_contract
--where contract.id_contract = 1;

--8--найб≥льшу к-ть сировини/матер≥алу що видали за останн≥х п≥в року
--select MAX(lending_bill_of_lading.Amount) as Greatest
--from lending_bill_of_lading
--where lending_bill_of_lading.Lending_date > dateadd(MONTH, -6, getdate

--9--найб≥льша к≥льк≥сть товару що постачаЇ певний постачальник 
--select MAX(raw_material_by_contract.Amount)as MaxAmount
--from provider
--inner join contract on contract.id_provider = provider.id_provider
--inner join raw_material_by_contract on raw_material_by_contract.id_contract = contract.id_contract
--where provider.id_provider=1;

--10--умови контракту з постачальником за контрактим номером
--select contract.Conditions, provider.Name
--from contract
--inner join provider on provider.id_provider=contract.id_provider
--where contract.id_contract = 2
--order by provider.Name

---select * from earning_bill_of_lading

-----назви постачальник≥в що поставили по 2 види товар≥в за останн≥й м≥с€ць
--select provider.Name, COUNT(earning_bill_of_lading.id_contract) as EarnCount
--from provider 
--inner join contract on contract.id_provider = provider.id_provider
--inner join earning_bill_of_lading on earning_bill_of_lading.id_contract = contract.id_contract
--where earning_bill_of_lading.Earning_date>dateadd(MONTH, -1, getdate())
--group by provider.Name
--having COUNT(earning_bill_of_lading.id_contract)=2