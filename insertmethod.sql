create table Employee(
empid int primary key,
empname varchar(20),
age int check(age>=18), 
email varchar(30) unique,
country varchar(20) default 'India'
)
sp_help Employee
drop table Employee
alter table Employee drop constraint CK__Employee__age__267ABA7A 
--DML insert

insert into Employee values(1,'om',22,'om@gmail.com','USA')
insert into Employee values(2,'sagar',23,'sagar@gmail.com','AUS')
insert into Employee(empid,empname,age,email) values(3,'aap',55,'ram@gmail.com')
insert into Employee(empid,empname,age,email) values(4,'apankajp',65,'pankaj@gmail.com')
insert into Employee(empid,empname,age,email) values(5,'snehal',45,'snehal@gmail.com')
insert into Employee(empid,empname,age,email) values(6,'pratik',35,'pratik@gmail.com')
insert into Employee(empid,empname,age,email) values(7,'sanket',25,'sanket@gmail.com')
insert into Employee(empid,empname,age,email) values(8,'girish',75,'girish@gmail.com')
insert into Employee(empid,empname,age,email) values(9,'vidyashree',85,'vidyashree@gmail.com')
insert into Employee(empid,empname,age,email) values(10,'nilesh',95,'nilesh@gmail.com')

truncate table Employee
select *from Employee

update Employee set country='japan' where empid=10

update Employee set email='jsdjbadb@gmail.com',age=22,country='korea' where empid=6

delete from Employee where empid=9

alter table Employee add salary int
update Employee set salary=25000 where empid in(1,4,7,10)
update Employee set salary=26000 where empid in(2,5)
update Employee set salary=27000 where empid in(3,6,8)
update Employee set salary=31000 where empid in(9)

select * from Employee where salary between 23000 and 25000

select * from Employee where empname like 'a%%p' -- name contains any letter end with a

select * from Employee where empname like 'p%'

select * from Employee where empname like '%p%' --any letters conains p

select * from Employee where empname like '%[k-z]%'

select * from Employee where empname like '[abcdefg]%'
select * from Employee where empname like '%[abcdefg]'
select * from Employee where empname like '%[abcdefg]%'
select * from Employee where empname like 's____'

select * from Employee where empname like 's__g__'

-- not like (skip the pattern)

select * from Employee where empname not like 'a%'
select * from Employee where empname not like '%[abcdefg]'

-- in clause --> select the multiple possible values
select * from Employee where empid in(1,2,3,4,5)
--display emp whose country is india & usa
select * from Employee where country in ('India','USA')
-- display the emp whose age is 27,31,20
select * from Employee where age in (27,31,20)

select * from Employee where empid=1

-- not in
select * from Employee where country not in ('India','USA')

-- and operator 
select * from Employee where country='India' and salary>23000 and age >26

--or operator
select * from Employee where country='India' or country='uk'
-- not operator

select * from Employee where not country='India'

select * from Employee where not salary<=25000


-- order by clause --> sort the data
select * from Employee 
order by empname,email

select * from Employee 
order by empname desc

select * from Employee 
order by age desc

select * from Employee where age <29
order by empname

select * from Employee 
order by empname,salary desc


-- built in functions - max, min, avg, count, sum
--aggregate functions in SQL
select max(salary) from Employee
select max(salary) as 'Max Salary' from Employee
select min(salary) as 'Min Salary' from Employee
select sum(salary) as 'Total salary' from Employee
select avg(salary) as 'avg salary' from Employee

select min(age) as 'Min age' from Employee
select max(age) as 'Max age' from Employee

select count(distinct country) as 'count' from Employee
--consider the duplicate & null records count(*)
select count(*) as 'total count' from Employee


-- LIMITING THE ROWS  
-- Top
-- Offset & fetch
select * from Employee
--top --> it is used to limiting rows

select top 8 * from Employee

-- display first 3 emp who has highest salary in the table
select top 3 * from Employee order by salary desc

-- display emp who has the highest salary in the table
select top 1 * from Employee order by salary desc

select top 2 percent * from Employee order by salary desc

select top 2 with ties * from Employee order by salary desc
-----------------------------------------------------------------
--offset --> to skip records
--fetch --> select the records /limiting the rows
-- offset always used with order by caluse
select * from Employee order by salary desc offset 3 rows fetch next 5 rows only

--display emp who have 2nd & 3rd highest salary
select * from Employee order by salary desc offset 1 rows fetch next 2 rows only

create table deptname(
deptid int primary key,
deptname varchar(20)
)

insert into deptname values(1,'HR')
insert into deptname values(2,'admin')
insert into deptname values(3,'emp')
insert into deptname values(4,'associate')
insert into deptname values(5,'manager')
insert into deptname values(6,'HR')
insert into deptname values(7,'admin')
insert into deptname values(8,'development')
insert into deptname values(9,'HR')
insert into deptname values(10,'associate')

sp_help Employee
select * from deptname
select * from Employee

--alter table Employee add constraint deptid_fk foreign key(empid) references deptname(deptid) 
--alter table Employee drop constraint deptid_fk
alter table Employee add constraint deptid_fk foreign key(deptid) references deptname(deptid) 

--using temperory alias name 
select e1.*,d1.* from Employee e1 inner join deptname d1 on d1.deptid=e1.empid
--or using table name
select Employee.*,deptname.deptname from Employee inner join deptname on deptname.deptid=Employee.empid



--shippment 
create table customer(
customer_id int primary key,customername varchar(30),
age int,
city varchar(20),
state varchar(20),
dob date)

insert into customer values(1,'Pratik',22,'Pune','Maharashtra','1978-1-2')
insert into customer values(2,'Pankaj',21,'Pune','Maharashtra','1990-12-1')
insert into customer values(3,'Anjali',23,'Nashik','Maharashtra','2000-12-27')
insert into customer values(4,'sagar',21,'Surat','Gaujrat','1999-8-17')
insert into customer values(5,'sanket',30,'Noida','UP','1992-1-1')

sp_help customer

create table Orderstatus(
statusid int primary key,
statusname varchar(20)
)

insert into Orderstatus values(1,'Order')
insert into Orderstatus values(2,'Shipped')
insert into Orderstatus values(3,'Delivered')

create table Orders
(
orderid int primary key,
customerid int,
statusid int,
orderdate date,
shippeddate date,
deliverydate date
)
drop table Orders

insert into Orders values(1,1,1,'2023-02-02','2023-03-03',null)
insert into Orders values(2,2,2,'2023-3-2','2023-4-1','2023-4-3')
insert into Orders values(3,3,3,'2023-4-2',null,null)
insert into Orders values(4,4,1,'2023-5-2','2023-3-6','2023-3-6')
insert into Orders values(5,5,2,'2023-6-2','2023-3-7',null)
insert into Orders values(1,1,3,'2023-02-02','2023-03-03',null)
insert into Orders values(7,2,1,'2023-3-2','2023-4-1','2023-4-3')
insert into Orders values(8,3,2,'2023-4-2',null,null)
insert into Orders values(9,4,3,'2023-5-2','2023-3-6','2023-3-6')
insert into Orders values(10,5,1,'2023-6-2','2023-3-7',null)
insert into Orders values(11,6,2,'2023-02-02','2023-03-03',null)
insert into Orders values(12,7,3,'2023-3-2','2023-4-1','2023-4-3')
insert into Orders values(13,8,1,'2023-4-2',null,null)
insert into Orders values(14,9,2,'2023-5-2','2023-3-6','2023-3-6')
insert into Orders values(15,10,3,'2023-6-2','2023-3-7',null)

truncate table Orders

select * from customer
select * from Orders
select * from Orderstatus

select customer.*,Orders.* from customer inner join Orders on Orders.customerid=customer.customer_id


--create table student(
--s_id int primary key, s_name varchar(20), age varchar(20))

--create table enggstudent(
--engg_id int primary key, engg_name varchar(20), age varchar(20), 
--stu_id int constraint stu_id_fk foreign key(stu_id) references student(s_id))

--insert into student values(1,'sagar',22)
--insert into student values(2,'sk',23)

--insert into enggstudent values(1,'sagar1',24,1)
--insert into enggstudent values(2,'sk1',25,2)

--select * from student
--select * from enggstudent

--select student.*,enggstudent.* from student inner join enggstudent on student.s_id=enggstudent.stu_id

