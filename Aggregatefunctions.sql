create database Aggregatefunctions

create table regions(
rid int primary key, rname varchar(20)
)
insert into regions values(11,'north')
insert into regions values(12,'south')
insert into regions values(13,'central')
insert into regions values(14,'east')
insert into regions values(15,'west')

create table countries(
cid int primary key , cname varchar(20),
regionid int constraint regionid_fk foreign key(regionid) references regions(rid)
 )
insert into countries values(101,'india',11)
insert into countries values(102,'russia',12)
insert into countries values(103,'aus',13)
insert into countries values(104,'usa',14)
insert into countries values(105,'uk',15)

create table locations(
l_id int primary key, street_add varchar(20), p_code int, city varchar(20), s_provience varchar(20),
coun_id int constraint coun_id_fk foreign key(coun_id) references countries(cid)
)
insert into locations values(111,'fc road',413001,'pune','maharashtra',101)
insert into locations values(222,'arbat',412001,'moskva','moskva',102)
insert into locations values(333,'chapel',411001,'sydney','sydney',103)
insert into locations values(444,'brodway',410001,'new york','new york',104)
insert into locations values(555,'oxford',414001,'oxford','oxford',105)

create table departments(
deptid int primary key, deptname varchar(20),
managerid int, locationid int constraint locationid_fk foreign key(locationid) references locations(l_id)
)

insert into departments values(01,'hr' ,25,111)
insert into departments values(02,'trainee',35,222)
insert into departments values(03,'tester',45,333)
insert into departments values(04,'tester',55,444)
insert into departments values(05,'manager',65,555)

create table employee(
empid int primary key,fname varchar(20),lname varchar(20),email varchar(20),
ph_no varchar(20),hdate varchar(20),jobid int constraint jobid_fk foreign key(jobid) references jobs(jobid), 
salary int,comm_pct int, managerid int,did int constraint did_fk foreign key(did) references departments(deptid)
)
update employee set did=02 where did=3
insert into Employee values(51,'Akshata','Sabne','sabne@gmail.com',6548923175,'2021-09-13',1,30000,500,25,01)
insert into Employee values(52,'Vidya','Hippargee','Vidya@gmail.com',6548923076,'2021-06-20',2,35000,500,35,02)
insert into Employee values(53,'Anjali','Budhe','anjali@gmail.com',8956237412,'2021-10-10',3,20000,1000,45,03)
insert into Employee values(54,'Sagar','Kawade','sagar@gmail.com',9635827413,'2022-01-05',4,45000,1500,55,04)
insert into Employee values(55,'Pankaj','Daundkar','pankaj@gmail.com',8745963108,'2022-05-05',5,50000,800,65,05)

create table jobs(
jobid int primary key, job_title varchar(20),
min_salary int, max_salary int
)
insert into jobs values(1,'hr',50000,60000)
insert into jobs values(2,'trainee',30000,40000)
insert into jobs values(3,'tester' ,20000,10000)
insert into jobs values(4,'tester' ,40000,700000)
insert into jobs values(5,'manager' ,50000,80000)

select * from regions
select * from countries
select * from locations
select * from departments
select * from employee
select * from jobs

--1. Write a query to list the number of jobs available in the employees table.
select j.job_title from employee e inner join jobs j on j.jobid=e.jobid group by j.job_title

--2. Write a query to get the total salaries payable to employees.
select sum(salary) as 'total salary'from employee 

--3. Write a query to get the minimum salary from employees table.
select min(salary) as 'min salary' from employee

--4. Write a query to get the maximum salary of an employee working as a Programmer. 
select max(salary) as max_sal from employee where jobid in(3,4)

--5. Write a query to get the average salary and number of employees working the department 90.
select avg(salary),count(*) from employee where jobid=03

--6. Write a query to get the highest, lowest, sum, and average salary of all employees.
select max(salary) as 'high salary',min(salary) as'low salary',avg(salary) as 'avg salary' from employee

--7. Write a query to get the number of employees with the same job.
select job_title, count(*) as no_of_emp from jobs group by job_title

--8. Write a query to get the difference between the highest and lowest salaries.
select max(salary)-min(salary) as 'salary diff' from employee 

--9. Write a query to find the manager ID and the salary of the lowest-paid employee for that manager.
select fname,salary from employee where managerid in( select managerid from employee where salary
=(select MIN(salary) from employee) );

--10. Write a query to get the department ID and the total salary payable in each department.
select did,sum(salary) from employee group by did

--11. Write a query to get the average salary for each job ID excluding programmer.
select count(jobid),avg(salary) as avg_salary from employee group by jobid

--12. Write a query to get the total salary, maximum, minimum, average
--salary of employees (job ID wise), for department ID 90 only.
select jobid,sum(salary) as total_sal,max(salary) as max_sal,min(salary) as min_Sal,avg(salary) as avg_sal from employee 
where did=2 group by jobid

--13. Write a query to get the job ID and maximum salary of the
--employees where maximum salary is greater than or equal to $4000.
select jobid, max(salary) as max_sal from employee group by jobid having max(salary)>=4000

--14. Write a query to get the average salary for all departments employing more than 10 employees.
select avg(salary),count(did) from employee having count(did)>10 