-- video 8

select CustomerID from Orders 
where orders.OrderID in 
(select [Order Details].OrderID from [Order Details] where [Order Details].UnitPrice =14) 

--Q2

select Customers.CompanyName, Employees.FirstName,Customers.City from Customers inner join Employees on Customers.City=Employees.City where Employees.City
in (select Employees.City from Employees where Employees.City='new york' or Employees.City='Seattle' or Employees.City='Los Angeles')

--Q3

select Products.UnitPrice from Products 
where Products.SupplierID in 
(select Suppliers.SupplierID from Suppliers where Products.UnitPrice > 30 
and (Suppliers.Country='USA' or Suppliers.Country='UK'))
 select  Suppliers.Country from Suppliers

 select count (ProductID) from Products where UnitPrice >30


/*�� ����� �������� ������ ����� ���� ����� ������� �� �� ������� ��� ������ ��� 

�� ����� �������� ������ ����� ���� ��� ���� ������� �� �� ����� ������� ��� ��� �� ���� ���� 

�� ����� �������� ������ ���� �� ����� ������� ������� �� ���� ������� ������ ���� ���� ������ ��� 

�� ����� �������� ������ ����� ���� ���� ������� �� �� ������� ���� ��� */


--Q1
create procedure orderNum
@getOrderNum int
as
begin
select * from Orders where Orders.OrderID = @getOrderNum
end

exec orderNum @getOrderNum = 10248

--Q2
create procedure orderNumWithSameOrderId
@getOrderId int
as
begin
select [Order Details].ProductID  from [Order Details] where [Order Details].OrderID = @getOrderId
end

exec orderNumWithSameOrderId @getOrderId = 10248

--Q3
create procedure orderNames
@getPrice float
as
begin
select Products.ProductName  from Products where Products.UnitPrice  =  @getPrice
end

exec orderNames @getPrice = 14.00

--Q4
create procedure employeesOrders
@getEmployeesID int
as
begin
select count( Orders.EmployeeID ) from Orders where Orders.EmployeeID = @getEmployeesID
end

exec employeesOrders @getEmployeesID = 2