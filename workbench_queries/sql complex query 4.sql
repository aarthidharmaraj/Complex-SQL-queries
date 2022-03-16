##query to Find the top 2 accounts with the maximum number of unique patients on a monthly basis.
-- create database queryy2;
Use queryy2;
-- create table patient_logs
-- (
--   account_id int,
--   date date,
--   patient_id int
-- );

-- insert into patient_logs values
--  (1, '2022-01-03', 100),
-- (1,'2022-01-27', 200),
--  (2, ('2022-01-01'), 300),
-- (2, ('2022-01-21'), 400),
--  (2, ('2022-01-21'), 300),
--  (2, ('2022-01-01'), 500),
-- (3, ('2022-01-20'), 400),
--  (1, ('2022-03-04'), 500),
--  (3,('2022-01-20'), 450);

## to count the number of patients
-- select month,account_id,unique_patients
-- from(
-- 	select *,
-- 	rank() over(partition by month order by unique_patients desc,account_id)as rnk ##order the patients id based on ranking and for same rank ,order based on account_id
-- 	from(
-- 		select month, account_id,count(1) as unique_patients
-- 		from (
-- 		select distinct monthname(date)as month, account_id,patient_id ##to get unique patients
-- 		from patient_logs)pl
-- 		group by account_id,month)x
-- 	)temp
-- where temp.rnk in (1,2); ## to fetch the top rank of unique_patients based on month
