/*top 3 earners by department*/
drop table abc.emp;
CREATE TABLE abc.emp
(emp_id int primary key,
emp_name varchar(20),
salary int,
dept_id int);
insert into abc.emp
(emp_id,emp_name,salary,dept_id)
values
(1,"Jim", 9989, 1),
(2, "Kim", 9770, 2),
(3 ,"Lim" ,4061 ,2),
(4 ,"Tim" ,6053 ,3),
(5 ,"Vim" ,2730 ,1),
(6 ,"Jay" ,6354 ,1),
(7 ,"Kay" ,6498 ,3),
(8 ,"Raj" ,1702 ,3),
(9 ,"Ram" ,5069 ,1),
(10, "Sam", 6244, 2),
(11, "Ali", 4890 ,1),
(12, "Joe", 4813 ,3),
(13, "Rim", 8926 ,2),
(14, "Doug", 1595, 2);
create table abc.dept
(dept_id int,
dept_name varchar(20));
insert into abc.dept
(dept_id,dept_name)
values(1,"IT"),
(2,"Fin"),
(3,"Sales");

select emp_name,salary,
(case
     when dept_id=1 then "IT"
     when dept_id=2 then "Fin"
     else "Sales"
     end)as dept from abc.emp
group by dept_id
order by salary desc limit 3;
/*Uber data*/
drop table abc.uber;
create table abc.uber
(start_date datetime,
end_date datetime,
category varchar(20),
start varchar(20),
stop varchar(20),
miles float,
purpose varchar(20));
insert into abc.uber
(start_date,
end_date,
category,
start ,
stop ,
miles,
purpose)values
("2016-12-29 13:56:00","2016-12-29 14:11:00","Business","karachi","karachi",4.1,"Airport/Travel"),
("2016-12-17 15:38:00","2016-12-17 16:12:00","Business","unknown location","unknown location",4.8,"Airport/Travel"),
("2016-08-21 10:00:00","2016-08-21 10:29:00","Business","unknown location","unknown location",7.6,"Airport/Travel"),
("2016-07-17 12:20:00","2016-07-17 15:25:00","Personal","Boone","Cary",180.2,"Commute"),
("2016-07-17 11:23:00","2016-07-17 11:50:00","Personal","Banner Elk","Boone",15.1,"Charity($)"),
("2016-06-03 22:47:00","2016-06-03 23:06:00","Business","Morrisville","Cary",4,"between offices"),
("2016-05-09 14:39:00","2016-05-09 15:06:00","Business","San Francisco","Palo Alto",20.5,"between offices"),
("2016-05-01 17:33:00","2016-05-01 17:45:00","Business","Whitebridge","Tanglewood",6.2,"between offices"),
("2016-04-27 14:13:00","2016-04-27 14:25:00","Business","Burtrose","Whitebridge",4.8,"between offices"),
("2016-04-27 13:30:00","2016-04-27 13:40:00","Business","Whitebridge","Burtrose",4.9,"between offices"),
("2016-04-24 21:41:00","2016-04-24 21:50:00","Business","Morrisville","Cary",4.2,"between offices"),
("2016-03-08 14:38:00","2016-03-08 14:55:00","Business","Whitebridge","Waverly Place",7.2,"between offices"),
("2016-03-14 16:35:00","2016-03-14 17:02:00","Business","New York","Long Island City",13,"meeting"),
("2016-03-07 15:19:00","2016-03-07 15:45:00","Business","Rayleigh","Cary",11.9,"between offices"),
("2016-02-14 14:46:00","2016-02-14 15:03:00","Business","Midtown","Midtown west",2,"meeting"),
("2016-02-14 14:07:00","2016-02-14 14:40:00","Business","East Elmhurst","New York",8.1,"meeting"),
("2016-02-13 14:21:00","2016-02-13 14:41:00","Business","Cary","Morrisville",8.9,"meeting");
/*top three business purpose by total mileage*/
select purpose, sum(miles) from abc.uber
group by purpose 
order by sum(miles) desc limit 3;
/*third highest miles from uber rides data*/
select miles from abc.uber
order by miles desc
limit 1 offset 2;
/*rides that have duration over 40 min*/
select * from abc.uber having timediff(end_date,start_date)>"00:40:00" ;




/*stick_len comments*/
create table abc.stick
(S1 int ,
S2 int,
S3 int);
insert into  abc.stick
(S1,S2,S3)values
(3,4,5),
(5,5,5),
(7,9,7),
(5,5,3),
(8,6,5),
(5,5,5);
select S1,S2,S3,
(case
    when S1=S2 and S2=S3 then "same len"
    when S1!=S2 and S2!=S3 and S3!=S1 then "different len"
    else "two with similar lengths"
end) as stick_len
from abc.stick;







