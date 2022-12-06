--select * into newProducts from Products
--create table updatePrice (productsId int not null, newPrice int not null)
create trigger priceIncrease on newProducts
for update 
as
begin
insert into updatePrice (productsId,newPrice) select productId,UnitPrice from inserted
end
update newProducts set UnitPrice = UnitPrice + 1
update updatePrice set newPrice = newPrice + 1
select * from updatePrice
select productId,UnitPrice from newProducts

--create table deleteUpdatePrice (productsId int not null)

create trigger deletePriceIncrease on newProducts 
after delete as
begin
insert into deleteUpdatePrice (productsId) select ProductID from deleted
end

--drop trigger deletePriceIncrease
--delete from newProducts where ProductID = 5;
--select * from deleteUpdatePrice
--select * from newProducts

--Q1
-- AAA �� ������ A ���� ������ ����� ������ ���� ��� ����� �, COUNTRY_NICK ���� ���� ������ �� ����� �� ���� ������ ����� ��� 
--BBB �� ������ ,B �� ����� �
-- CCC �� ������ C �� � 
--ZZZ ��� ���� ������ 
--CASE �� ������ �
--substring ��������� 
select * ,
case
when Country like 'A%' then 'AAA'
when Country like 'B%' then 'BBB'
when Country like 'C%' then 'CCC'
else 'ZZZ'
end as COUNTRY_NICK
from Customers

--Q2
--���� ���� ������ �� ����� �� �� ������� ������ ������ ��� ��� �� ����� ���� 
-- NORMAR  ���� ���� �� ������ MEDIUM  ���� ������ ���� 10 � 5 �� ������ CHEAP ���� ������ ������� � 5 �� ������ 
-- EXPENSIVE ���� ������� ���� 100 � 150 ������
-- CASE ��  ������ �

select * ,
case
when UnitPrice < 5 then 'CHEAP'
when UnitPrice between 5 and 10 then 'MEDIUM'
when UnitPrice between 100 and 150  then 'EXPENSIVE'
else'NORMAR'
end as recommendations
from Products
