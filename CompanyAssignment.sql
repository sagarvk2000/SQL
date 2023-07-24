create table students(
sid int primary key, sname varchar(20),city varchar(20)
)

insert into students values(1,'ram','pune')
insert into students values(2,'sham','mumbai')
insert into students values(3,'sita','pune')
insert into students values(4,'gita','nashik')

select * from students

--a.insert new student in students table
insert into students values(5,'ramesh','hydrabad')

--b.change cityof sid =4 to sangli
update students set city='sangli' where sid=4

--c.return lists of all students with columns sid, name, city
select * from students 

--d.return list containing column sid, name, subname,marks,maxmarks,percentage



create table subjects(
subid int primary key, subname varchar(20), maxmarks int, passing varchar(20)
)

insert into subjects values(1,'maths',100,40)
insert into subjects values(2,'english',100,40)
insert into subjects values(3,'marathi',50,15)
insert into subjects values(4,'hindi',50,15)

create table exam(
sid int constraint sid_fk foreign key(sid) references students(sid),
subid int constraint subid_fk foreign key(subid) references subjects(subid),
marks int
)

select * from exam

insert into exam values(1,1,100)
insert into exam values(1,2,85)
insert into exam values(1,3,40)
insert into exam values(1,4,45)
insert into exam values(2,1,35)
insert into exam values(2,2,55)
insert into exam values(2,3,25)
insert into exam values(3,1,95)
insert into exam values(3,2,87)
insert into exam values(3,3,45)
insert into exam values(3,4,42)

