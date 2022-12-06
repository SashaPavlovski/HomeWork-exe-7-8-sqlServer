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
-- AAA יש להדפיס A עבור לקוחות שגרים במדינה שהשם שלה מתחיל ב, COUNTRY_NICK מתוך טבלת לקוחות יש לשלוף את כולה ובנוסף לשלוף טור 
--BBB אז להדפיס ,B אם מתחיל ב
-- CCC אז לבדפיס C אם ב 
--ZZZ וכל השאר להדפיס 
--CASE יש להשתמש ב
--substring ובפונקציה 
select * ,
case
when Country like 'A%' then 'AAA'
when Country like 'B%' then 'BBB'
when Country like 'C%' then 'CCC'
else 'ZZZ'
end as COUNTRY_NICK
from Customers

--Q2
--מתוך טבלת מוצרים יש לשלוף את כל המוצרים ובנוסף להוסיף טור חדש של המלצת מחיר 
-- NORMAR  עבור השאר יש להדפיס MEDIUM  עבור מוצרים שבין 10 ל 5 יש להדפיס CHEAP עבור מוצרים שנמוכים מ 5 יש להדפיס 
-- EXPENSIVE עבור המוצרים שבין 100 ל 150 להדפיס
-- CASE יש  להשתמש ב

select * ,
case
when UnitPrice < 5 then 'CHEAP'
when UnitPrice between 5 and 10 then 'MEDIUM'
when UnitPrice between 100 and 150  then 'EXPENSIVE'
else'NORMAR'
end as recommendations
from Products
