create table  customers(
customer_id int primary key,c_name varchar(20),country varchar(20),PostalCode int,city varchar(20),b_date date
)
 drop table customers
 select * from customers

insert into customers values(1,'sk','norway',121110,'Oslo','2023-07-21')
insert into customers values(2,'ss','uk',131110,'London','2023-08-21')
insert into customers values(3,'ad','abc',121110,'Berlin','2023-09-21')
insert into customers values(4,'pc','norway',null,'Oslo','2023-10-21')
insert into customers values(23,'ab','japan',null,'tokya','2023-11-21')

truncate table customers

--1.Write a statement that will select the City column from the Customers table
select city from customers

--2.Select all the different values from the Country column in the Customers table.
select country from customers

--3.Select all records where the City column has the value "London"
select * from customers where city='London'

--4.Use the NOT keyword to select all records where City is NOT "Berlin".
select * from customers where not city ='Berlin'

--5.Select all records where the CustomerID column has the value 23.
select * from customers where Customer_id=23

--6.Select all records where the City column has the value 'Berlin' and the PostalCode column has the value 121110.
select * from customers where city='Berlin' and PostalCode=121110

--7.Select all records where the City column has the value 'Berlin' or 'London'.
select * from customers where city in('Berlin' , 'London')

--8.Select all records from the Customers table, sort the result alphabetically by the column City.
select *from customers order by city

--9.Select all records from the Customers table, sort the result reversed alphabetically by the column City.
select *from customers  order by city desc

--10.Select all records from the Customers table, sort the result alphabetically, first by the column Country, then, by the column City
select * from customers order by country,city

--11.Select all records from the Customers where the PostalCode column is empty.
select * from customers where PostalCode is null

--12.	Select all records from the Customers where the PostalCode column is NOT empty.
select * from customers where PostalCode is not null

--13.	Set the value of the City columns to 'Oslo', but only the ones where the Country column has the value "Norway".
update customers set city='Oslo' where country='Norway'

--14.	Delete all the records from the Customers table where the Country value is 'Norway'.
delete from customers where country='Norway'

--20.	Select all records where the value of the City column starts with the letter "a".
select * from customers where city like 'a%'

--21.	Select all records where the value of the City column ends with the letter "a".
select * from customers where city like '%a'

--22.	Select all records where the value of the City column contains the letter "a".
select * from customers where city like '%a%'

--23.	Select all records where the value of the City column starts with letter "a" and ends with the letter "b".
select * from customers where city like 'a%b' 

--24.	Select all records where the value of the City column does NOT start with the letter "a".
select * from customers where city not like 'a%'

--25.	Select all records where the second letter of the City is an "a".
select * from customers where city like '_a%'

--26.	Select all records where the first letter of the City is an "a" or a "c" or an "s".
select * from customers where city like '[acs]%'

--27.	Select all records where the first letter of the City starts with anything from an "a" to an "f".
select * from customers where city like '[a-f]%'

--28.	Select all records where the first letter of the City is NOT an "a" or a "c" or an "f".
select * from customers where city not like '[acf]%'

--29.	Use the IN operator to select all the records where the Country is either "Norway" or "France".
select * from customers where country in('Norway','France')

--30.	Use the IN operator to select all the records where Country is NOT "Norway" and NOT "France".
select * from customers where country not in('Norway','France')


use A_assignment
create table products(
product_id int primary key,price int,p_name varchar(20)
)
drop table products

insert into products values(1,20,'Geitost')
insert into products values(2,40,'keyboard')
insert into products values(3,50,'monitor')
insert into products values(4,10,'cpu')
insert into products values(5,100,'mobile')

sp_help products
truncate table products
select * from products

--15.	Use the MIN function to select the record with the smallest value of the Price column.
select min(price) as 'smallest value' from products

--16.	Use an SQL function to select the record with the highest value of the Price column.
select max(price) as 'highest value' from products

--17.	Use the correct function to return the number of records that have the Price value set to 20
select * from products where price=20

--18.	Use an SQL function to calculate the average price of all products.
select avg(price) as 'average price' from products

--19.	Use an SQL function to calculate the sum of all the Price column values in the Products table
select sum(price) as 'sum' from products

--31.	Use the BETWEEN operator to select all the records where the value of the Price column is between 10 and 20
select * from products where price between 10 and 20

--32.	Use the BETWEEN operator to select all the records where the value of the Price column is NOT between 10 and 20.
select * from products where price not between 10 and 20

--33.Use the BETWEEN operator to select all the records where the value of the ProductName column is alphabetically between 'Geitost' and 'Pavlova'.
select * from products where p_name between 'Geitost' and 'Pavlova'

--34.When displaying the Customers table, make an ALIAS of the PostalCode column, the column should be called Pno instead.
select PostalCode as 'Pno' from customers

--35.When displaying the Customers table, refer to the table as Consumers instead of Customers.
select 'customers' as 'consumer'

--36.List the number of customers in each country.
select country, count(customer_id)as 'count' from customers group by country

--37.List the number of customers in each country, ordered by the country with the most customers first.
select country, count(customer_id)as 'count' from customers group by country order by  count(customer_id) desc

--38.Write the correct SQL statement to create a new database called testDB.
create database testDB

--39.Write the correct SQL statement to delete a database named testDB
drop database testDB

--40.Add a column of type DATE called Birthday in Persons table
alter table customers add birth_date varchar(20)

--41.Delete the column Birthday from the Persons table
alter table customers drop column birth_date



--create a function which accept the price and discount %
-- calculate and returns the price of each product and discounted price

alter function GetProductDis(@price int,@discount_price int)
returns int as begin
declare @res int;
set @res=@price-(@price*@discount_price/100);
return @res
end 

select dbo.GetProductDis(50,5)as 'discount_price',price,p_name from products






