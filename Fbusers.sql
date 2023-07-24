create table FBusers(
userid int primary key, username varchar(20),
email varchar(20), ph_no int,total_posts varchar(20))

create table post(
postid int primary key,user_id int constraint userid_fk foreign key(user_id) references FBusers(userid),
postContent varchar(20),postImage varchar(20),postVideo varchar(20)
)

create table friendship(
friendid int , userid int constraint userid1_fk foreign key(userid) references FBusers(userid),
friendshipstatuscode int primary key)

create table friendshipstatus(
friendship_status_code int constraint friendstatus_fk foreign key(friendship_status_code) references friendship(friendshipstatuscode)
status varchar(20)
)
sp_help friendshipstatus
drop table friendshipstatus

create table friendshipstatus(
friendship_status_code int constraint friendstatus_fk foreign key(friendship_status_code) references friendship(friendshipstatuscode),
status1 int
)