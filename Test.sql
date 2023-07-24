create table Book(
bid int primary key,bname varchar(20),aid int,
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

insert into Author values(01,'Dr.Apj Abdul Kalam','999999999','a@gmail.com','pamban island','Rameswaram')
insert into Author values(02,'J.K.Rowling','888888888','jk@gmail.com','bristol','england')
insert into Author values(03,'John Tolkein','777777777','jt@gmail.com','bloemfontein','south africa')
insert into Author values(04,'George martin','666666666','gm@gmail.com','new jersey','us')
insert into Author values(05,'Chetan bhagat','555555555','cb@gmail.com','new delhi','delhi')


create table Award_Master(
awardtypeid int primary key, awardname varchar(20),aprice int
)

insert into Award_Master values(101,'book of year',2000)
insert into Award_Master values(102,'book of year',3000)
insert into Award_Master values(103,'book of year',4000)
insert into Award_Master values(104,null,1000)
insert into Award_Master values(105,'book of year',2000)

select * from Book
select * from Author
select * from Award_Master


--1.Write a query to show book name,author name and award name for all books which has received any award.


--2.Write a query to update author name of authors whose book price is > 100. Prefix author name with ‘Honourable’ .


--3.Write a query to display authors and number of books written by that author. Show author who has written maximum books at the top.


--4.Write a query to select book name with 5 th highest price.


--5.Select list of books which have same price as book ‘Diary of Ann Frank’.


--6.Increase price of all books written by Mr. Chetan Bhagat by 5%.


--7.Show award names and number of books which got these awards. 


--8	Delete all books written by ‘Chetan Bhagat’ 


--9	Create view to show name of book and year when it has received award. 


--10.Create trigger to ensure min price of any book must be Rs. 100. 


--11.Increase price of book by 10% if that book has received any award.


--12.Show names of author and number of books written by that Author.
select from Author where aname='Chetan bhagat'

--13.Show names of authors whose books are published before year 2020.


--14.Show name of books which has published within 1 year after 15 August 2020.


--15.Delete all authors whose no book is published in year 2020.


