use queryy1;
-- drop table weatherpk;
-- create table weatherpk
-- (
-- id int primary key,
-- city varchar(50),
-- temperature int,
-- day date
-- );

-- insert into weatherpk values
-- (1, 'London', -1, ('2021-01-01')),
-- (2, 'London', -2, ('2021-01-02')),
-- (3, 'London', 4, ('2021-01-03')),
-- (4, 'London', 1, ('2021-01-04')),
-- (5, 'London', -2, ('2021-01-05')),
-- (6, 'London', -5, ('2021-01-06')),
-- (7, 'London', -7, ('2021-01-07')),
-- (8, 'London', 5, ('2021-01-08')),
-- 	(9, 'London', -1, ('2021-01-09')),
-- 	(10, 'London', -2, ('2021-01-10')),
-- 	(11, 'London', 4, ('2021-01-11')),
-- 	(12, 'London', -1, ('2021-01-12')),
-- 	(13, 'London', -2, ('2021-01-13')),
-- 	(14, 'London', -5, ('2021-01-14')),
-- 	(15, 'London', -7, ('2021-01-15')),
-- 	(16, 'London', -5, ('2021-01-16')),
--     (17, 'London', 1, ('2021-01-17')),
-- 	(18, 'London', -2, ('2021-01-18')),
-- 	(19, 'London', -4, ('2021-01-19')),
-- 	(20, 'London', -1, ('2021-01-20')),
-- 	(21, 'London', -2, ('2021-01-21'));

##Finding n consecutive records where temperature is below zero with table having a primary key.
-- with t1 as ##create as a separate table inside
-- 		(select *,
--         row_number() over (order by id) as rn ,
--         id - row_number() over (order by id) as diff ##subtract that to find consecutive records
-- 		from weatherpk w
-- 		where w.temperature < 0),
-- 	t2 as ##partition the column of table t1 wih respect to difference column
-- 		(select *,
-- 		count(*) over (partition by diff order by diff) as no_ofrecords ##count the number of partitions 
-- 		from t1)
-- select id, city, temperature, day
-- from t2
-- where t2.no_ofrecords = 3;

use queryy2;
-- Create table weather_no_pk
-- (
-- city varchar(50),
--  temperature int
-- );
-- insert into weather_no_pk values
-- 	( 'London', -1),
-- 	('London', -2),
-- 	('London', 4),
-- 	('London', 1),
-- 	('London', -2),
-- 	('London', -5),
-- 	('London', -7),
-- 	('London', 5),
-- 	('London', -1),
-- 	('London', -2),
-- 	('London', 4),
-- 	( 'London', -1),
-- 	( 'London', -2),
-- 	('London', -5),
-- 	('London', -7),
-- 	('London', -5),
--     ( 'London', 1),
-- 	('London', -2),
-- 	('London', -4),
-- 	('London', -1),
-- 	('London', -2);
-- ##Finding n consecutive records where temperature is below zero with table having a primary key.
--  with W as 
-- 	(select * ,row_number() over() as id 
--     from weather_no_pk ),##create a manual coulmn as id and do other operations
-- 	t1 as ##create as a separate table inside
-- 		(select *,
--         row_number() over (order by id) as rn ,
--         id - row_number() over (order by id) as diff ##subtract that to find consecutive records
-- 		from  w ##using the table created by with clause 
-- 		where temperature < 0),
-- 	t2 as ##partition the column of table t1 wih respect to difference column
-- 		(select *,
-- 		count(*) over (partition by diff order by diff) as no_ofrecords ##count the number of partitions 
-- 		from t1)
-- select id, city, temperature
-- from t2
-- where t2.no_ofrecords = 3;

-- create table orders
--   (
--     order_id    varchar(20) primary key,
--     order_date  date        not null
-- );

-- insert into orders values
--   ('ORD1001', ('2021-01-01')),
--   ('ORD1002', ('2021-02-01')),
--   ('ORD1003',('2021-02-02')),
--   ('ORD1004',('2021-02-03')),
--   ('ORD1006', ('2021-05-01')),
--   ('ORD1007',('2021-12-25')),
--   ('ORD1008',('2021-12-26'));

with
  t1 as
		(select *, row_number() over(order by order_date) as rn,
		 order_date - (row_number() over(order by order_date)) as diff
		from orders),
	t2 as
		(select *, count(1) over (partition by diff) as cnt
		from t1)
select order_id, order_date
from t2
where cnt >= 3;