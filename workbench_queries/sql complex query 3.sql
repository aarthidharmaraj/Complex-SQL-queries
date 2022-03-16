use queryy1;
-- CREATE table login_details(
-- login_id int primary key,
-- user_name varchar(50) not null,
-- login_date date);

-- insert into login_details values
-- (101, 'Michael', current_date),
-- (102, 'Jameswatt', current_date),
-- (103, 'Stewart', current_date+1),
-- (104, 'Stewart', current_date+1),
-- (105, 'Stewart', current_date+1),
-- (106, 'Michael', current_date+2),
-- (107, 'Michael', current_date+2),
-- (108, 'Stewart', current_date+3),
-- (109, 'Stewart', current_date+3),
-- (110, 'James', current_date+4),
-- (111, 'James', current_date+4),
-- (112, 'James', current_date+5),
-- (113, 'James', current_date+6);

##fetch the users who logged in consecutively 3 or more times.
-- select distinct repeated_names
-- from (
-- select *,
-- case when user_name = lead(user_name) over(order by login_id) #compare with first and next user
-- and  user_name = lead(user_name,2) over(order by login_id) #compare with first and next next user using offset 2
-- then user_name #if so then display user name
-- else null #else print null
-- end as repeated_names #create a separate row and display results
-- from login_details)x
-- where x.repeated_names is not null; ##gives details of users who are not null


## SQL query to interchange the adjacent students names.

-- create table students
-- (
-- id int primary key,
-- student_name varchar(50) not null
-- );
-- insert into students values
-- (1, 'James'),
-- (2, 'Michael'),
-- (3, 'George'),
-- (4, 'Stewart'),
-- (5, 'Robin');

-- select id,student_name,
-- case when id%2 <> 0 then lead(student_name,1,student_name) over(order by id) ##if id is odd, then fetch the adjacent name, if no adjacent name then be the name itself
-- when id%2 = 0 then lag(student_name) over(order by id) end as new_student_name ## if even, then fetch previous name and give them as a new name column
-- from students;


## From the weather table, fetch all the records when London had extremely cold temperature for 3 consecutive days or more.
-- create table weather
-- (
-- id int,
-- city varchar(50),
-- temperature int,
-- day date
-- );

-- insert into weather values
-- (1, 'London', -1, ('2021-01-01')),
-- (2, 'London', -2, ('2021-01-02')),
-- (3, 'London', 4, ('2021-01-03')),
-- (4, 'London', 1, ('2021-01-04')),
-- (5, 'London', -2, ('2021-01-05')),
-- (6, 'London', -5, ('2021-01-06')),
-- (7, 'London', -7, ('2021-01-07')),
-- (8, 'London', 5, ('2021-01-08')); 

-- select id, city, temperature, day
-- from (
--     select *,
--         case when temperature < 0 ##initial when first temperature is low at minus
--               and lead(temperature) over(order by day) < 0 ##next ow temperature
--               and lead(temperature,2) over(order by day) < 0 ##next next row temperature
--         then 'Y' ##displays only the first record
--         when temperature < 0
--               and lead(temperature) over(order by day) < 0 ##inorder to displays all the three records,we need to compare all the three in all aspects ,up and down
--               and lag(temperature) over(order by day) < 0##compares with previous row
--         then 'Y' 
--         when temperature < 0 
--               and lag(temperature) over(order by day) < 0 ##compares with previous row
--               and lag(temperature,2) over(order by day) < 0 ##compares with previous previous row
--         then 'Y'
--         end as flag ##alias name
--     from weather) x
-- where x.flag = 'Y';

