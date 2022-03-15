-- create database queryy1
use queryy1;
-- create table users
-- (
-- user_id int primary key,
-- user_name varchar(30) not null,
-- email varchar(50));

-- insert into users values
-- (9, 'Sumit', 'sumit@gmail.com'),
-- (10, 'Reshma', 'reshma@gmail.com'),
-- (11, 'Farhana', 'farhana@gmail.com'),
-- (12, 'Robin', 'robin@gmail.com'),
-- (13, 'Robin', 'robin@gmail.com'),
-- (14, 'Reshma', 'reshma@gmail.com'),
--  (18, 'Rocky', 'rock@gmail.com'),
-- (17, 'Sumit', 'sumit@gmail.com');

-- SQL query to fetch all the duplicate records from a table 
select * from users ORDER BY user_name ;
-- SELECT user_name, COUNT(user_name) FROM users GROUP BY user_name HAVING COUNT(user_name) > 1;

-- Using delete join , deleting  the duplicate rows
DELETE FROM users WHERE user_id IN(  
    SELECT user_id FROM (SELECT user_id, ROW_NUMBER()   
       OVER (PARTITION BY user_name ORDER BY user_name) AS row_num   
    FROM users)as temp_table WHERE row_num>1  
);  
-- using inner join method 
-- DELETE S1 FROM users AS S1  
-- INNER JOIN users AS S2   
-- WHERE S1.user_id > S2.user_id AND S1.user_name=S2.user_name;   
SELECT * FROM users;