
create table Employee
(
id int,
empname varchar(25),
salary numeric(12,2)
)

sp_help Employee

--alter is used to modify the schema(structure) of table.
--add for to add new column
alter table Employee add qualification varchar(10)
--modify the data type or size
alter table Employee alter column qualification varchar(15)
--drop the column from the table
alter table Employee drop column qualification

--rename the column in sql server
sp_rename 'Employee.salary','empsalary'

--for existing column we want to apply Not null
alter table Employee alter column empname varchar(20) not null
alter table Employee alter column empsalary numeric(12,2) not null
alter table Employee alter column id int not null

--when we want add constraint to the new column
alter table Employee add email varchar(40) not null unique
--when we want to add constraint to existing column
alter table Employee add constraint un_emp unique(email)
--when we want to add constraint to multiple columns
alter table Employee add constraint un_emp2 unique(id,email)
--when we want to drop constraint 
alter table Employee drop constraint un_emp2

sp_help employee;

--when we want to add primary key to existing column
alter table employee add constraint eid_PK primary key(id);

--when we want to drop the column
alter table employee drop id;

create table student
(
sid int not null,sname varchar(20)
);

sp_help student;

alter table student add constraint s_PK primary key(sid);

create table department
(
did int not null,
dname varchar(20)
)

alter table department add constraint d_pk primary key(did)

alter table student add did int; 

--foreign key 
alter table student add constraint did_fk foreign key(did) references department(did);

--kalayani mam assignment 
create table author
(
authorid int primary key, name varchar(20),city varchar(20),country varchar(20)
)

create table category( 
categoryid int primary key, description varchar(30))

create table book
(bookid int primary key, 
title varchar(10),
authorid int constraint author_idfk foreign key(authorid) references author(authorid),
year1 int,price int,
publisher varchar(20),
rating int
)

create table order_details
(
orderno int, bookid int constraint book_idfk foreign key(bookid) references book(bookid),
qty int
)

sp_help author