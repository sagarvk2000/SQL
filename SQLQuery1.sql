create table book_table(
bookid int primary key,book_name varchar(20),
authorid int,price int);

alter table book_table add constraint author_fk foreign key(authorid) references author_table(authorid)
sp_help book_table

create table author_table(
authorid int primary key, author_name varchar(20),
ph_no varchar(20), email varchar(20),
address varchar(20),city varchar(20))0
.0
create table award_table(
awardid int primary key,award_type_id int ,
author_id int, book_id int, year1 int)

alter table award_table add constraint author1_fk foreign key(author_id) references author_table(authorid)
alter table award_table add constraint book_fk foreign key(book_id) references book_table(bookid)
alter table award_table add constraint awardtypeid_fk foreign key(award_type_id) references awards_master_table(awardtypeid)

create table awards_master_table(
awardtypeid int primary key,awardname varchar(20),award_price int
)
