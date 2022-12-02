drop table abc.swiggy;
create table abc.swiggy
(id int,cust_id varchar(20),order_id int,partner_code int,outlet varchar(20),bill_amount int,order_date date,comments varchar(20));
desc abc.swiggy;
insert into abc.swiggy (id,cust_id,order_id,partner_code,outlet,bill_amount,order_date,comments)
values

(1 ,"SW1005", 700, 50 ,"KFC", 753, "2021-10-10", "Door locked"),
(2 ,"SW1006", 710, 59, "Pizza hut", 1496, "2021-09-01" ,"In-time delivery"),
(3 ,"SW1005", 720, 59 ,"Dominos" ,990 ,"2021-12-10",""),
(4 ,"SW1005" ,707, 50 ,"Pizza hut", 2475, "2021-12-11",""),
(5 ,"SW1006" ,770, 59 ,"KFC", 1250, "2021-11-17", "No response"),
(6 ,"SW1020", 1000 ,119 ,"Pizza hut", 1400 ,"2021-11-18", "In-time delivery"),
(7 ,"SW2035", 1079 ,135 ,"Dominos" ,1750 ,"2021-11-19",""),
(8 ,"SW1020", 1083, 59 ,"KFC" ,1250, "2021-11-20",""),
(11, "SW1020", 1100, 150, "Pizza hut" ,1950 ,"2021-12-24" ,"Late delivery"),
(9 ,"SW2035" ,1095, 119 ,"Pizza hut", 1270, "2021-11-21", "Late delivery"),
(10 ,"SW1005", 729, 135 ,"KFC", 1000 ,"2021-09-10", "Delivered"),
(1 ,"SW1005", 700, 50, "KFC", 753, "2021-10-10" ,"Door locked"),
(2 ,"SW1006", 710, 59 ,"Pizza hut" ,1496 ,"2021-09-01","In-time delivery"),
(3 ,"SW1005", 720 ,59 ,"Dominos" ,990, "2021-12-10",""),
(4 ,"SW1005", 707 ,50 ,"Pizza hut", 2475 ,"2021-12-11","");

select * from abc.swiggy;
/*finding out count of duplicate entries*/
select id,count(id) from abc.swiggy
group by id having count(id)>1;
/*removing duplicate entries from the table*/
create table abc.swiggy1
as select distinct * from abc.swiggy;
drop table abc.swiggy;
rename table abc.swiggy1 to abc.swiggy;
/*printing row number 4 to 9*/
select * from abc.swiggy limit 3,6;
/*latest order placed by customers*/
select order_id,outlet,order_date from abc.swiggy
order by order_date desc limit 5;
/**/
select order_id,partner_code,order_date,
(case
    when comments="" THEN  "no issues"
    else comments
end)as comments
 from abc.swiggy;
 /*print outletwise order count,cumulative order count,total bill amount,cumulative bill amount*/
 select outlet,count(order_id) as order_count,sum(count(order_id))over (order by outlet) as cummulative_count
 ,sum(bill_amount) as bill,sum(sum(bill_amount))over (order by outlet) as cum_bill from abc.swiggy
 group by outlet;
 /*print cust_id wise,outlet wise 'total nunmber of orders'*/
 select cust_id,
 sum(if(outlet='Dominos',1,0))Dominos,
 sum(if(outlet='KFC',1,0))KFC,
 sum(if(outlet='Pizza Hut',1,0))Pizza_hut
 from abc.swiggy
 group by 1;
 
 Select cust_id,
 sum(if(outlet='KFC',bill_amount,0))KFC,
 sum(if(outlet='Dominos',bill_amount,0))Dominos,
 sum(if(outlet='Pizza Hut',bill_amount,0))Pizza_hut
 from abc.swiggy
 group by 1;
 
 
 

