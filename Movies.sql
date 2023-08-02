create table movies(
moveid int primary key,move_name varchar(20),
release_year1 int,box_office_collection varchar(20)
)

insert into movies values(1,'avengers',2011,'54M')
insert into movies values(2,'kong',2016,'60M')
insert into movies values(3,'operheigm',2001,'84M')
insert into movies values(4,'john wick',2023,'100M')
insert into movies values(5,'infinity war',2019,'54M')

create table roles(
roll_id int primary key, roll_name varchar(20)
)

insert into roles values(11,'')

create table celebrity(
celebrity_id int primary key, celebrity_name varchar(20),
birthdate varchar(20), ph_no int, email varchar(20)
)
insert into celebrity values(101,'robert downey jr','22-8-1988',555555555,'robert@gmail.com'),
(102,'monkey','23-6-2000',444444444,'monkey@gmail.com')
(103,'cilian murphy','5-11-1990',333333333,'cilian@gmail.com')

create table bollywooddata(
bollywooddataid int,
celeb_id int, constraint celeb_idfk foreign key(celeb_id) references celebrity(celebrity_id),
movie_id int, constraint movie_idfk foreign key(movie_id) references movies(moveid),
rollid int, constraint roll_idfk foreign key(rollid) references roles(roll_id)
)

