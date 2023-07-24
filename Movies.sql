create table movies(
moveid int primary key,move_name varchar(20),
release_year1 int,box_office_collection int
)

create table roles(
roll_id int primary key, roll_name varchar(20)
)

create table celebrity(
celebrity_id int primary key, celebrity_name varchar(20),
birthdate int, ph_no int, email varchar(20)
)

create table bollywooddata(
bollywooddataid int,
celeb_id int, constraint celeb_idfk foreign key(celeb_id) references celebrity(celebrity_id),
movie_id int, constraint movie_idfk foreign key(movie_id) references movies(moveid),
rollid int, constraint roll_idfk foreign key(rollid) references roles(roll_id)
)

sp_help bollywooddata