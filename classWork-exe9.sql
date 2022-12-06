/* 
�� ���� ������ �� ��� �� �����  min,max,avg,count,sum ����� �

���� �� ����� ������ ����� ����� ������ 

���� �� ����� �� ���� ������� 

���� �� ���� �� ����� ����� �����               

(���� �� �� ����� ���� ����� (������ ��� �����  

(���� �� �� ����� ���� ����� (������ � �� �����

���� �������� ������ ����� �� ����� ������ �� ���� ������� ������ ����� ����� 

���� �������� ������ ����� �� ����� ������ �� ���� ������� ������ ����� ����� */

--Q1

select UnitPrice from Products
select minPrice = min(UnitPrice) from Products
select maxPrice = max(UnitPrice) from Products
select avgPrice = avg(UnitPrice) from Products
select countPrice = count(UnitPrice) from Products
select sumPrice = sum(UnitPrice) from Products

--Q5
select Products.ProductName,Products.UnitPrice from Products where Products.UnitPrice in (select maxPrice = max(UnitPrice) from Products)
--Q6
select Products.ProductName,Products.UnitPrice from Products where Products.UnitPrice in (select maxPrice = min(UnitPrice) from Products)


--Q7
create procedure orderCountry
@countryName nvarchar(max)
as
begin
select ShipCountry,
num = count (*)
from Orders 
where ShipCountry = @countryName
group by ShipCountry
end

drop procedure orderCountry

exec orderCountry @countryName = 'USA'

--Q8
create procedure orderCount
@countryName nvarchar(max)
as
begin
select count([Order Details].ProductID) as countOrder 
from [Order Details] where [Order Details].OrderID 
in(select Orders.OrderID from Orders 
where ShipCountry = @countryName)
end

drop procedure orderCount

exec orderCount @countryName = 'USA'