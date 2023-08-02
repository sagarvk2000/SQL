create table patients(
pid int primary key,
fname varchar(10),lname varchar(10), gender varchar(10),
birthd varchar(20),city varchar(20), provinceid int,
allergies varchar(80), height int,weight int
)
alter table patients add constraint docid_fk foreign key(docid) references doctors(docid)
update patients set docid=15 where pid=105

insert into patients values(101,'Vidyashree','Hipparagi','F','01/01/2000','Sangli',2,'High Fever',5.6,55)
insert into patients values(102,'Akshata','Sabne','F','13/07/1999','Latur',1,'Pet Allergy',5.4,45)
insert into patients values(103,'Sagar','Kawade','M','01/12/2000','Solapur',3,'Dust Allergy',5.7,57)
insert into patients values(104,'Anjali','Buddhe','F','12/04/1997','Beed',4,'Food Allergy',5.5,50)
insert into patients values(105,'Pankaj','Daundkar','M','02/11/1991','Pune',1,'Pollean Allergy',6,65)

create table doctors(
docid int primary key, f_name varchar(10),l_name varchar(10),speciality varchar(25)
)

insert into doctors values(11,'Siddhart',' Mukherjee','Biologist')
insert into doctors values(12,'Devi','Shetty','Cardiologist')
insert into doctors values(13,'Surabi','Anand','Dermatologist')
insert into doctors values(14,'Aditya','Gupta','gynecologist')
insert into doctors values(15,'Mohamed','Rela','Neurologist')

 create table admissions(
 pid int constraint pid_fk foreign key(pid) references patients(pid),
 ad_date varchar(20),dis_date varchar(20),diagnosis varchar(50),
 attending_doc_id int
 )
 alter table admissions add constraint docid1_fk foreign key(docid) references doctors(docid)
 update admissions set docid=15 where pid=105
 insert into admissions values(101,'01/06/2022','06/06/2022','Fever',11)
 insert into admissions values(102,'11/06/2022','16/06/2022','Cough',12)
 insert into admissions values(103,'21/11/2021','26/11/2021','Pain',15)
 insert into admissions values(104,'12/08/2022','18/08/2022','CBC',14)
 insert into admissions values(105,'05/07/2023','15/07/2023','Hiboglobin',13)

 create table province_names(
 provinceid varchar(20),provience varchar(30)
 )

insert into province_names values(1,'Madras')
insert into province_names values(2,'Bombay')
insert into province_names values(3,'Madras')
insert into province_names values(4,'Kolkatta')
insert into province_names values(5,'Madras')

--1.Show the first name, last name and gender of patients who’s gender is ‘M’
select fname,lname,gender from patients where gender='M'

--2.Show the first name & last name of patients who does not have any allergies
select fname,lname from patients where allergies='High Fever'

--3.Show the patients details that start with letter ‘C’
select * from patients where fname  like 's%'

--4.Show the patients details that height range 5.4 to 6
select * from patients where height between 5.4 and 6

--5.Update the patient table for the allergies column. Replace ‘NKA’ where allergies is null
update patients set allergies='NKA' where allergies='Pet Allergy'
select * from patients

--6.Show how many patients have birth year is 2020
select * from patients where birthd='01/12/2000'

--7.Show the patients details who have greatest height
select top 1 * from patients order by height desc
--or
select * from patients where height=
(select max(height) as 'maxheight' from patients)

--8.Show the total amount of male patients and the total amount of female patients in the patients table.
select gender,count(*) from patients group by gender

--9.Show first and last name, allergies from patients which have allergies to either 'Penicillin' or 'Morphine'.
--Show results ordered ascending by allergies then by first_name then by last_name.
select fname,lname,allergies from patients where allergies='Pet Allergy'or allergies='Dust Allergy' order by allergies,fname,lname

--10.Show first_name, last_name, and the total number of admissions attended for each doctor.
--Every admission has been attended by a doctor.
select c.f_name, c.l_name, count(b.pid) as 'admissions_total'
from admissions b, doctors c
WHERE 
b.docid = c.docid
group by c.f_name, c.l_name

--11.For every admission, display the patient's full name, their admission diagnosis, and their doctor's 
--full name who diagnosed their problem.
select p.fname, p.lname,d.f_name,d.l_name
from patients p
join admissions a on p.pid=a.pid
join doctors d on d.docid=p.docid
where diagnosis is not null