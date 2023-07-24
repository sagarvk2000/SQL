create table countries(
country_id int primary key, country_name varchar(20))

create table format(
format_id int primary key, format_name varchar(20))

create table batsman(
player_id int primary key,player_name varchar(20),
age int,countryid int constraint countryid_fk foreign key(countryid) references countries(country_id),
total_runs int,total50s int,total100s int,player_grade varchar(20))

create table B_F_Mapping(
id int, playerid int constraint playerid_fk foreign key(playerid) references batsman(player_id),
formatid int constraint formatid_fk foreign key(formatid) references format(format_id))

sp_help B_F_Mapping

truncate table B_F_Mapping