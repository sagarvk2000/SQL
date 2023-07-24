create table regions(
rid int primary key, rname varchar(20)
)

create table countries(
cid int primary key, cname varchar(20),
regionid int constraint regionid_fk foreign key(regionid) references regions(rid)
 )

create table locations(
l_id int primary key, street_add varchar(20), p_code int, city varchar(20), s_provience varchar(20),
coun_id int constraint coun_id_fk foreign key(coun_id) references countries(cid)
)

create table departments(
deptid int, deptname varchar(20),
managerid int, locationid int constraint locationid_fk foreign key(locationid) references locations(l_id)
)

create table employee(
empid int primary key,fname varchar(20),lname varchar(20),email varchar(20),
ph_no varchar(20),hdate varchar(20),jobid int constraint jobid_fk foreign key(jobid) references jobs(jobid), 
salary int,comm_pct int, managerid int,did int
)

create table jobs(
jobid int primary key, job_title varchar(20),
min_salary int, max_salary int
)

insert into jobs values(1,'hr',20000,40000)
insert into jobs values(2,'trainee',20000,40000)
insert into jobs values(3,'tester',20000,40000)
insert into jobs values(4,'deveolper',20000,40000)
insert into jobs values(5,'manager',20000,40000)

--1. Write a query to list the number of jobs available in the employees table.
--2. Write a query to get the total salaries payable to employees.
--3. Write a query to get the minimum salary from employees table.
--4. Write a query to get the maximum salary of an employee working as a Programmer.
--5. Write a query to get the average salary and number of employees working the department 90.
--6. Write a query to get the highest, lowest, sum, and average salary of all employees.
--7. Write a query to get the number of employees with the same job.
--8. Write a query to get the difference between the highest and lowest salaries.
--9. Write a query to find the manager ID and the salary of the lowest-paid employee for that manager.
--10. Write a query to get the department ID and the total salary payable in each department.
--11. Write a query to get the average salary for each job ID excluding programmer.
--12. Write a query to get the total salary, maximum, minimum, average
--salary of employees (job ID wise), for department ID 90 only.
--13. Write a query to get the job ID and maximum salary of the
--employees where maximum salary is greater than or equal to $4000.
--14. Write a query to get the average salary for all departments
--employing more than 10 employees.