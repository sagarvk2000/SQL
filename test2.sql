--Student - rollno , sname , degree , birthdate , course id , batch id , fees paid , Remark, is placed
create table student(
rollno int primary key, sname varchar(20), degree varchar(20),
courseid int constraint courseid_fk foreign key(courseid) references course(cid),
batchid int,
bdate varchar(20),
feespaid varchar(10),remark varchar(20),isplaced varchar(20)
)
alter table student add age int
update student set isplaced='yes' where rollno in(1,2,4)
insert into student values(1,'sagar','mech',111,11,'27-12-2000','yes','pass','yes',21)
insert into student values(2,'snehal','cs',222,22,'27-12-2000','no','fail',null,23)
insert into student values(3,'pankaj','aviation',333,33,'27-12-2000','no','pass','no',24)
insert into student values(4,'akshata','b.com',444,44,'27-12-2000','yes','pass','yes',19)
insert into student values(5,'shree','textile',555,55,'27-12-2000','yes','pass','no',18)
insert into student values(6,'shree1','cotton',565,55,'27-12-2000','yes','pass','no',18)

delete from student where rollno in(1,2,3,4,5)

--Course – course id , course name, duration (in months), trainer id , total fees 
create table course(
cid int primary key, cname varchar(20),
duration varchar(20),trainerid int constraint trainerid_fk foreign key(trainerid) references trainer(tid),
totalfees int
)

insert into course values(111,'automation','4 months',01,50000)
insert into course values(222,'testing','5 months',02,50000)
insert into course values(333,'deveolpment','6 months',03,50000)
insert into course values(444,'analytics','2 months',04,50000)
insert into course values(555,'database','3 months',05,50000)
insert into course values(565,'cad','3 months',05,70000)
update course set totalfees=2000 where cid=333

--Trainer – Trainer id , trainer name , join date , email , experience in years 
create table trainer(
tid int primary key,tname varchar(20),jdate varchar(20),email varchar(20),expe varchar(20)
)
insert into trainer values(01,'aniket','1-2-2020','aniket@gmail.com','10')
insert into trainer values(02,'medha','2-2-2020','medha@gmail.com','11')
insert into trainer values(03,'vrushali','3-2-2020','vrushali@gmail.com','12')
insert into trainer values(04,'kalyani','4-2-2020','kalyani@gmail.com','13')
insert into trainer values(05,'jayshree','5-2-2020','jayshree@gmail.com','14')

select * from student
select * from course
select * from trainer

--1. Show list of students. List contains roll no , student name , course name , trainer name in
--order of course name and student name.
select s.rollno,s.sname,c.cname ,t.tname
from course c join student s on s.courseid=c.cid 
join trainer t on c.trainerid=t.tid order by cname,sname

--2. Show list of students who have pending fees more than 1000rs . List should have student
--name , course name , balance fees . Show this list in descending order of balance fees.
select s.sname,c.cname,(c.totalfees-s.feespaid) as 'balance fees'
from student s 
join course c on s.courseid=c.cid 
where (c.totalfees-s.feespaid)>15000
order by (c.totalfees-s.feespaid)

--3. Append letter ‘_spl’ to all batch ids of trainer ‘Deepa’.



--4. Update table student. Update ‘remark’ field. Remark should be ‘Eligible for exam’ if fees paid
--by student is more than 60%.


--5. Create a index to make retrieval faster based on course name.
create index coursename on course(cname)
------------------------------------------------------------------------------------------------------------
--6. List name of course for which more than 20 students are enrolled. 
select cname, count(*) as 'student count' from course group by cname having count(*)<20
-------------------------------------------------------------------------------------------------------------
--7. List name of course for which maximum revenue was generated.(max fee collection)  ans== sum of fees ,grp by ,find out max display by desc
select cname,totalfees from course where totalfees=(select MAX(totalfees) from course)
------------------------------------------------------------------------------------------------------------
--8. Select name of student who are in same batch as ‘Atul’.  
select sname from student where
-------------------------------------------------------------------------------------------------------------
--9. Delete all students who are in course which is less than 2 months duration. *********
delete s.sname from student s
join course c on s.courseid=c.cid
where c.duration<'4 months'
-------------------------------------------------------------------------------------------------------------
--10. Delete all students for whom is placed is ‘yes’ and who have paid all the fees of their course. ans ==del stu whos total fee and are placed
delete from student where feespaid is not null and isplaced='yes'
-------------------------------------------------------------------------------------------------------------
--11. Create a trigger to add student data in ex-student table if student is deleted from student table.
-------------------------------------------------------------------------------------------------------------
--12. Create a view which shows name of trainer and number of students he is training.
select 
-------------------------------------------------------------------------------------------------------------
--13. Show names of students who are more than 20 years old.
select sname from student where age>20
-------------------------------------------------------------------------------------------------------------
--14. Show names of students who have paid all the fees.
select sname from student where feespaid='yes'
-------------------------------------------------------------------------------------------------------------
--15. Write a procedure which accepts student id and returns his balance fees
create proc SP_Student
as begin
select s.sname, c.cname,(c.totalfees - s.feespaid) as 'Balance fee'
from student s inner join course c on c.cid = s.courseid
end
--call
exec SP_Student
-------------------------------------------------------------------------------------------------------------

