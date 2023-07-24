--Student - rollno , sname , degree , birthdate , course id , batch id , fees paid , Remark, is placed
create table student(
rollno int primary key, sname varchar(20), degree varchar(20),
courseid int constraint courseid_fk foreign key(courseid) references course(cid),
batchid int,
bdate varchar(20),
feespaid varchar(10),remark varchar(20),isplaced varchar(20)
)

--Course – course id , course name, duration (in months), trainer id , total fees 
create table course(
cid int primary key, cname varchar(20),
duration varchar(20),trainerid int constraint trainerid_fk foreign key(trainerid) references trainer(tid),
totalfees int
)

--Trainer – Trainer id , trainer name , join date , email , experience in years 
create table trainer(
tid int primary key,tname varchar(20),jdate varchar(20),email varchar(20),expe varchar(20)
)