create table book_table(
bookid int primary key,book_name varchar(20),
authorid int,price int);
alter table book_table add constraint author_fk foreign key(authorid) references author_table(authorid)

insert into book_table values(1,'Wings Of Fire',11,200)
insert into book_table values(2,'Harry Potter',22,500)
insert into book_table values(3,'Diary of Ann Frank',33,100)
insert into book_table values(4,'Game of Thrones',44,600)
insert into book_table values(5,'half girlfriend',55,200)

create table author_table(
authorid int primary key, author_name varchar(20),
ph_no varchar(20), email varchar(20),
address varchar(20),city varchar(20))

insert into author_table values(11,'xyz','999999999','a@gmail.com','pamban island','Rameswaram')
insert into author_table values(22,'xyz','888888888','jk@gmail.com','bristol','england')
insert into author_table values(33,'John Tolkein','777777777','jt@gmail.com','bloemfontein','south africa')
insert into author_table values(44,'pqr','666666666','gm@gmail.com','new jersey','us')
insert into author_table values(55,'Chetan bhagat','555555555','cb@gmail.com','new delhi','delhi')

update author_table set author_name='xyz' where authorid=11

create table award_table(
awardid int primary key,award_type_id int ,
author_id int, book_id int, year1 int)

alter table award_table add constraint author1_fk foreign key(author_id) references author_table(authorid)
alter table award_table add constraint book_fk foreign key(book_id) references book_table(bookid)
alter table award_table add constraint awardtypeid_fk foreign key(award_type_id) references awards_master_table(awardtypeid)

insert into award_table values(101,21,11,1,2022)
insert into award_table values(102,22,22,2,2002)
insert into award_table values(103,23,33,3,2017)
insert into award_table values(104,24,44,4,2023)
insert into award_table values(105,25,55,5,2020)

create table awards_master_table(
awardtypeid int primary key,awardname varchar(20),award_price int
)

insert into awards_master_table values(21,'PadmabHushan',23000) 
insert into awards_master_table values(22,'Padmashree',25000) 
insert into awards_master_table values(23,'PadmaVibHushan',100000) 
insert into awards_master_table values(24,'Oscar',35000) 
insert into awards_master_table values(25,'DyanaPeeth',60000) 

select * from author_table
select * from book_table
select * from award_table
select * from awards_master_table

--query
--find the book name which is written by xyz
select book_name from book_table where authorid=
(select authorid from author_table where author_name='xyz')
--or use by join
select book_name from book_table b join author_table a on a.authorid=b.authorid where author_name='xyz'
-- or use without join
select b.book_name from book_table b,author_table a where a.authorid=b.authorid and a.author_name='xyz'

--find the no of award for each author
select a.author_name, count(*) from author_table a join award_table d on a.authorid=d.author_id 
group by a.author_name

--find the award name for the book xyz
select awardname from awards_master_table where awardtypeid in 
(select award_type_id from award_table where book_id=
(select bookid from book_table where book_name='harry potter'))
--or using join
select m.awardname,b.book_name from book_table b 
join award_table a on b.bookid=a.book_id
join awards_master_table m on a.award_type_id=m.awardtypeid where b.book_name='harry potter'
--or
select m.awardname,b.book_name from book_table b,award_table a, awards_master_table m 
where b.bookid=a.book_id and a.award_type_id=m.awardtypeid 
and b.book_name='harry potter'

--find the all author name who got an award
select author_name from author_table where authorid in(select author_id from award_table)
--or by using join 
select a.author_name from author_table a join award_table d on a.authorid=d.author_id

--find the year wise author count 
select count(*) as 'author count',a.year1
from award_table a join author_table a1 on a1.authorid=a.author_id
group by a.year1

--find the author name who wrote only 1 book 
select a.author_name,count(*) from book_table b join author_table a on a.authorid=b.authorid 
group by a.author_name 
having count(*)=1

--find the book name which has max price
select MAX(price) as 'max_price' from book_table

