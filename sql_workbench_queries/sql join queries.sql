use queryy1;
 -- drop table manager;
-- create table projects
-- (
-- project_id varchar(10),
-- project_name varchar(50),
-- team_member_id varchar(50)
-- );
-- Create table manager
-- (
-- manager_id varchar(10),
-- manager_name varchar(50),
-- DEPT_NAME varchar(50)
-- );

-- Insert into projects values
-- 	('p1','Data Migration',101),
--     ('p1','Data Migration',103),
-- 	('p1','Data Migration','M2'),
--     ('p2','ETL TOOL','M3'),
-- 	('p2','ETL TOOL',115);
-- Insert into manager values
-- 	('M1','man1','HR'),
--     ('M2','man2','IT'),
--     ('M3','man3','Admin'),
--     ('M4','man4','Fiance'),
--    ('M5','man5','HR'),
--    ('M7','man7','Technician');
-- ALTER TABLE employee
--   ADD manager_id varchar(50)
--     AFTER DEPT_NAME;
    
-- UPDATE employee SET manager_id='M1' where emp_Id=101;
-- UPDATE employee SET manager_id='M1' where emp_ID=102;

-- UPDATE employee p
-- JOIN (
--     SELECT 111 as emp_ID, 'M1' as man_id
--     UNION ALL
--     SELECT 112, 'M1'
--     UNION ALL
--     SELECT 113,'M2'
--     UNION ALL
--     SELECT 114,'M5'
--     UNION ALL
--     SELECT 115, 'M4'
--     UNION ALL
--     SELECT 116,'M3'
--     UNION ALL
--     SELECT 117,'M2'
--     UNION ALL
--     SELECT 118, 'M1'
--     UNION ALL
--     SELECT 119,'M2'
--     UNION ALL
--     SELECT 110,'M5'
-- ) vals ON p.emp_ID= vals.emp_ID
-- SET  manager_id = man_id;

##Inner join
##	Fetch the employee name and the manager names they belong to

-- select distinct e.emp_NAME, m.manager_name,e.DEPT_NAME,e.manager_id
-- from employee e
-- join manager m 
-- on e.manager_id=m.manager_id;

##Inner join
##Fetch the employee name and the manager names they belong to
-- select e.emp_NAME, m.manager_name,e.DEPT_NAME,e.manager_id
-- from employee e left join manager m ##priorotize the left table
-- on e.manager_id=m.manager_id;
##Right join
##Fetch the employee name and the manager names they belong to
-- select e.emp_NAME, m.manager_name,e.DEPT_NAME,e.manager_id
-- from employee e right join manager m ##priorotize the right table
-- on e.manager_id=m.manager_id;

##Fetch the details of all employees,their department ,manager and the projects they work on
-- select e.emp_ID,e.emp_NAME,m.manager_name,p.project_name,l.login_date
-- from employee e
-- left join manager m on e.manager_id=m.manager_id
-- left join login_details l on l.login_id=e.emp_ID
-- left join projects p on p.team_member_id=e.emp_ID;

-- ##Using Full join
-- select e.emp_NAME,m.manager_name
-- from employee e
-- left join manager m on e.manager_id=m.manager_id
-- union
-- select e.emp_NAME,m.manager_name
-- from employee e
-- right join manager m on e.manager_id=m.manager_id

##Cross join
-- select e.emp_NAME,m.manager_name
-- from employee e
-- cross join manager m;

-- create table company
-- (
-- company_name varchar(50),
-- company_headquarters varchar(50)
-- );
-- Insert into company values
-- ('Company ABC','Headquarters1')
## to fetch the employees and their company details
-- select e.emp_NAME,m.manager_name,c.company_name,c.company_headquarters
-- from employee e
-- inner join manager m on e.manager_id=m.manager_id
-- cross join company c

##Natural join
-- select e.emp_NAME,m.manager_name
-- from employee e
-- natural join manager m;

##Self join
-- create table family
-- (
-- family_id varchar(20),
-- name varchar(30),
-- age int,
-- parent_id varchar(20)
-- );
-- Insert into family values
-- ('F1','David',4,'F6'),
-- ('F2','Carol',14,' '),
-- ('F3','David Baskar',12,'F5'),
-- ('F4','Michael',40,' '),
-- ('F5','Johnson',37,'F3'),
-- ('F6','George',70,'F5'),
-- ('F7','Dravid',8,'F4');

##to fetch the child name and their age corresponding to their parent name and age 
-- Select child.name as child_name, child.age as chid_age, parent.name as parent_name,parent.age as parent_age
-- from family as child
-- left join family as parent
-- on child.parent_id=parent.family_id


