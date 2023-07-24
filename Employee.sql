--create table Employee has empid, empname, salary, dept name, address, 
--designation, gender.
--insert atleast 5 record employee record 

create table Employee(
empid int primary key, empname varchar(20),
salary int, deptname varchar(20),adress varchar(20),
designation varchar(20), gender varchar(10))

sp_help Employee

insert into Employee(empid,empname,salary,gender) values(1,'sagar',55000,'male')
insert into Employee(empid,empname,salary,gender) values(2,'pankaj',5000,'male')
insert into Employee values(3,'pratik',4000,'hr','bavdhan','emp','male')
insert into Employee values(4,'sanket',3000,'hr','chakan','emp','male')
insert into Employee values(5,'fahad',4000,'hr','bavdhan','emp','male')

delete from Employee 

insert into Employee values(1,'vidyashree',40000,'manager','pune','emp','female')
insert into Employee values(2,'sanket',19000,'hr','pune','emp','male')
insert into Employee values(3,'anjali',22000,'sales','dubai','emp','female')
insert into Employee values(4,'pratik',46000,'sales','banglore','emp','male')
insert into Employee values(5,'pankaj',33000,'hr','mumbai','emp','male')

select *from Employee

--display salary, designation, emp name
select empname, salary, designation from Employee

--update salary by 10% of employee whos is from pune city
update Employee set salary = salary+(salary*0.10) where adress='pune' 

--delete all the employee whos salary is less than 21000 and address is pune 
delete from Employee where salary<21000

--update address of employee whos designation is manager
update Employee set adress='goa' where deptname='manager'

--display all the female employee 
select * from Employee where gender='female' 

--display all the employee from banglore location 
select * from Employee where adress='banglore'

--display all employee from hr department where location is mumbai
select * from Employee where adress='mumbai' AND deptname='hr'

--delete the employee from sales department whos salary is more than 25000
delete from Employee where salary<25000 and deptname='sales'

--20-7-23
--to find the employee whos salary is more than 30000 and less than 80000 
select * from Employee where salary>30000 and salary<80000

--write query to find the max salary
select max(salary) from Employee

--write query to find the total no of employee
select count(empname) as 'count' from Employee

--write query to find employee whos salary is < 50000 and his working in admin dept
update Employee set deptname = 'admin' where empid in(1,3,5)
select * from Employee where salary <50000 and deptname='admin'

--write query to arrange all the employees in desc order of salary 
select * from Employee order by empname desc

--write query to display employee whos salary is is not in range 20k to 3ok
select * from Employee where salary not between 20000 and 30000

--write query to display name and designation of employee who is from pune and mumbai location 
select empname,designation from Employee where adress in('pune','mumbai')

--write query to display all the employee whos designation contains 'e' character
select * from Employee where empname like '%e%'