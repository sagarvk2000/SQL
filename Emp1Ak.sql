create table EmployeeInfo
(
Empid int primary key,
First_Name varchar(30),
Last_Name varchar(30),
Department varchar(30),
Project varchar(30),
Address varchar(30),
DOB date,
Gender varchar(30)
)
sp_help EmployeeInfo

insert into EmployeeInfo values(1,'Rohit','Gupta','Admin','P1','Delhi','1992/09/02','Male')
insert into EmployeeInfo values(2,'Rahul','Mahajan','Admin','P2','Mumabi','1986/10/10','Male'),
(3,'Sonia','Banerjee','HR','P3','Pune','1983/06/05','Female'),
(4,'Ankita','Kapoor','HR','P4','Chennai','1983/11/28','Female'),
(5,'Swati','Garg','HR','P5','Delhi','1991/04/06','Female')

create table EmployeePosition
(
Empid int foreign key (Empid)references EmployeeInfo(Empid),
EmpPosition varchar(30),
DateOfJoining date,
Salary int
)
sp_help EmployeePosition

insert into EmployeePosition values (1,'Executive','2020-04-01',75000)
insert into EmployeePosition values (2,'Manager','2020-04-03',500000)
insert into EmployeePosition values (3,'Manager','2020-04-02',1500000)
insert into EmployeePosition values (2,'Officer','2020-04-02',90000)
insert into EmployeePosition values (1,'Manager','2020-04-03',300000)

--1. Create a query to generate the first records from the EmployeeInfo table.
select * from EmployeeInfo where Empid=1

--2. Create a query to generate the last records from the EmployeeInfo table.
select * from EmployeeInfo where Empid=5

--3. Create a query to fetch the third-highest salary from the EmpPosition table.
select top 1 salary from 
(select top 3 salary from EmployeePosition order by salary desc)
as subquery order by salary
--or
select * from EmployeePosition order by salary desc offset 2 rows fetch next 1 rows only

--4. Write a query to find duplicate records from a table.
select Empid ,count(*) as 'duplicate records' from EmployeePosition group by Empid having count(*)>1

--5. Create an SQL query to fetch EmpPostion and the total salary paid for each employee position.
select EmpPosition, sum(salary) as 'total salary' from EmployeePosition group by EmpPosition

--6. Create a query to obtain display employees having salaries equal to or greater than 150000.
select * from EmployeePosition where salary>= 150000

--7. Create a query to fetch the list of employees of the same department
select count(*) as 'same department' from EmployeeInfo group by department having count(*)>1