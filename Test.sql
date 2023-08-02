create table Book(
bid int primary key,bname varchar(20),aid int constraint aid_fk foreign key(aid) references Author(aid),
price int,pdate varchar(20)
)

insert into Book values(1,'Wings Of Fire',01,200,'2-10-2010')
insert into Book values(2,'Harry Potter',02,500,'2-10-2011')
insert into Book values(3,'Diary of Ann Frank',03,100,'2-10-2012')
insert into Book values(4,'Game of Thrones',04,600,'2-10-2013')
insert into Book values(5,'half girlfriend',05,200,'2-10-2014')

truncate table Book

create table Author(
aid int primary key,aname varchar(20),ph_no varchar(20),email varchar(20),
address varchar(20), city varchar(20)
)
alter table Author add awardtypeid int
alter table Author add constraint awardtypeid_fk foreign key(awardtypeid) references Award_Master(awardtypeid)
 update Author set aname='Abdul Kalam' where aid=01
insert into Author values(01,'Abdul Kalam','999999999','a@gmail.com','pamban island','Rameswaram')
insert into Author values(02,'J.K.Rowling','888888888','jk@gmail.com','bristol','england')
insert into Author values(03,'John Tolkein','777777777','jt@gmail.com','bloemfontein','south africa')
insert into Author values(04,'George martin','666666666','gm@gmail.com','new jersey','us')
insert into Author values(05,'Chetan bhagat','555555555','cb@gmail.com','new delhi','delhi')

create table Awards
(
award_id int not null,
award_type_id int primary key,
author_id int,
constraint author_id_fk1 foreign key (author_id) references Author(aid),
book_id int,
constraint book_id_fk foreign key (book_id) references Book(bid),
year int not null
)
insert into Awards values(11, 101, 1 , 01 , 2001)
insert into Awards values(12, 102, 2 , 03 , 2002)
insert into Awards values(13, 103, 3 , 03 , 2003)
insert into Awards values(14, 104, 4 , 04 , 2004)
insert into Awards values(15, 105, 5 , 05 , 2005)
truncate table Awards

create table Award_Master(
awardtypeid int primary key, awardname varchar(20),aprice int
)
alter table Award_Master add aid int
alter table Award_Master add constraint aid_fk foreign key(aid) references Author(aid)
-- update Award_Master set aid=01 where awardtypeid=101
insert into Award_Master values(101,'book of year',2000,01)
insert into Award_Master values(102,'padmashri',3000,02)
insert into Award_Master values(103,'book of year',4000,03)
insert into Award_Master values(104,null,1000,04)
insert into Award_Master values(105,'padmashri',2000,05)
truncate table Award_Master
--update Award_Master set awardname='padmashri' where awardtypeid in(105,102) 

select * from Author
select * from Book
select * from Award_Master

--1.Write a query to show book name,author name and award name for all books which has received any award.
select b.bname,a1.aname,a.awardname
from Book b
join Author a1 on b.aid=a1.aid
join Award_Master a on a1.awardtypeid=a.awardtypeid

--2.Write a query to update author name of authors whose book price is > 100. Prefix author name with ‘Honourable’ .
update Author set aname= CONCAT('Honorable ', aname) where aid in(select aid from Book where price < 500)
select * from Author

--3.Write a query to display authors and number of books written by that author. Show author who has written maximum books at the top.
select top (1) a.aname,COUNT(*)
from Author a
join Book b on a.aid=b.aid
group by a.aname

--4.Write a query to select book name with 5 th highest price.
select * from Book order by price desc offset 4 rows fetch next 1 rows only

--5.Select list of books which have same price as book ‘Diary of Ann Frank’.
select price from Book where bname='Diary of Ann Frank' and price=100

--6.Increase price of all books written by Mr. Chetan Bhagat by 5%.
update b set b.price=b.price+(b.price*0.05 )from book b
 join Author a  on
b.aid=a.aid where a.aname='Chetan bhagat'

--7.Show award names and number of books which got these awards. 
select a.awardname,b.bname
from  Award_Master a
join Book b on b.aid=a.aid

--8	Delete all books written by ‘Chetan Bhagat’ 
delete b from Book b, author a 
where b.aid=a.aid and a.aname='Chetan bhagat'

--9	Create view to show name of book and year when it has received award. 
create view  GetByBookYear
as
select b.bname , a.year from Book b
inner join Awards a on b.aid=a.author_id

select * from GetByBookYear

--10.Create trigger to ensure min price of any book must be Rs. 100. 


--11.Increase price of book by 10% if that book has received any award.
update Book set price=price+(price*0.10) where bid in
(select bid from Award_Master where awardtypeid is not null)
select * from Book

--12.Show names of author and number of books written by that Author.
select a.aname,b.bname
from Author a 
join Book b on a.aid=b.aid

--13.Show names of authors whose books are published before year 2020.
select a.aname,b.bname
from Author a
join Book b on a.aid=b.aid
where pdate<>'1-10-2020'

--14.Show name of books which has published within 1 year after 15 August 2020.
select pdate from Book where pdate between '1-10-2010' and '3-10-2012'

--15.Delete all authors whose no book is published in year 2020.
delete from Author where aid=
(select bid from Book where pdate between '1-1-2010' and '31-12-2010')

