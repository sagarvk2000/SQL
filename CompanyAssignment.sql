create table students(
sid int primary key, sname varchar(20),city varchar(20)
)
insert into students values(1,'ram','pune')
insert into students values(2,'sham','mumbai')
insert into students values(3,'sita','pune')
insert into students values(4,'gita','nashik')

create table subjects(
subid int primary key, subname varchar(20), maxmarks int, passing varchar(20)
)
alter table subjects add constraint sid1_fk foreign key(sid) references students(sid)
update subjects set sid=4 where subid=4
insert into subjects values(1,'maths',100,40)
insert into subjects values(2,'english',100,40)
insert into subjects values(3,'marathi',50,15)
insert into subjects values(4,'hindi',50,15)

create table exam(
sid int constraint sid_fk foreign key(sid) references students(sid),
subid int constraint subid_fk foreign key(subid) references subjects(subid),
marks int
)
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


--a.insert new student in students table
insert into students values(5,'ramesh','hydrabad')

--b.change cityof sid =4 to sangli
update students set city='sangli' where sid=4

--c.return lists of all students with columns sid, name, city
select * from students 

--d.return list containing column sid, name, subname,marks,maxmarks,percentage
select s.sid,s.city,sb.subname,e.marks,e.marks*100/sb.maxmarks as 'Percentage' 
from exam e
join subjects sb on sb.subid=e.subid
join students s on s.sid=e.sid

--e.return list containing columns sid,name, subname,marks,maxmarks,pass(return p),if fail(return f)
--f.return list containing columns sid,name, subname of students who were absent for the exam
--g.return sub list with name of just the student who came first in that sub along with his marks.subid,subname,name,marks,maxmarks