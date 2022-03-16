use queryy1;
-- create table employee
-- ( emp_ID int primary key
-- , emp_NAME varchar(50) not null
-- , DEPT_NAME varchar(50)
-- , SALARY int);

-- insert into employee values 
--     (101, 'Mohan', 'Admin', 4000),
--     (102, 'Rajkumar', 'HR', 3000),
--     (103, 'Akbar', 'IT', 4000),
--     (104, 'Dorvin', 'Finance', 6500),
--     (105, 'Rohit', 'HR', 3000),
--     (106, 'Rajesh',  'Finance', 5000),
--     (107, 'Preet', 'HR', 7000),
--     (108, 'Maryam', 'Admin', 4000),
--     (109, 'Sanjay', 'IT', 6500),
--     (110, 'Vasudha', 'IT', 7000),
--     (111, 'Melinda', 'IT', 8000),
--     (112, 'Komal', 'IT', 10000),
--     (113, 'Gautham', 'Admin', 2000),
--     (114, 'Manisha', 'HR', 3000),
--     (115, 'Chandni', 'IT', 4500),
--     (116, 'Satya', 'Finance', 6500),
--     (117, 'Adarsh', 'HR', 3500),
--     (118, 'Tejaswi', 'Finance', 5500),
--     (119, 'Cory', 'HR', 8000)
-- SELECT *FROM(SELECT *FROM employee ORDER BY emp_Id DESC LIMIT 2) tbl1 ORDER BY emp_Id LIMIT 1;
-- select *
-- from (
-- select *,
-- row_number() over (order by emp_id desc) as rn
-- from employee e) x
-- where x.rn = 2;

-- display the details of employees with highest and lowest salaries
-- SELECT x.* from employee e 
-- join 
-- (select *, 
-- max(SALARY) over (partition by DEPT_NAME) as max_salary,
--  min(SALARY) over (partition by DEPT_NAME) as min_salary from employee) x 
--  on e.emp_id = x.emp_id and (e.SALARY = x.max_salary or e.SALARY = x.min_salary) 
--  order by x.DEPT_NAME, x.SALARY; 

##Adding an additional column to exixting table
-- ALTER TABLE employee
--   ADD DOB DATE NOT NULL
--     AFTER emp_NAME,
--   ADD Work_AREA varchar(40) NOT NULL
--     AFTER DOB;

##Add values to that newly addedd columns
-- UPDATE employee SET DOB = '2000-01-10', LAST_NAME='Kumar',CONTACT='9857462471',WORK_AREA='Bengaluru' where emp_Id=101;
-- UPDATE employee SET DOB = '2001-12-10', LAST_NAME='Raj',CONTACT='9857362471',WORK_AREA='Bengaluru' where emp_Id=102;
-- UPDATE employee SET DOB = '1998-03-16', LAST_NAME='Sekar',CONTACT='9877462471',WORK_AREA='Chennai' where emp_Id=103;
-- UPDATE employee SET DOB = '1997-05-15', LAST_NAME='Kumar',CONTACT='9897462471',WORK_AREA='Bengaluru' where emp_Id=104;
-- UPDATE employee SET DOB = '1996-08-13', LAST_NAME='Kurnal',CONTACT='9257462471',WORK_AREA='Chennai' where emp_Id=105;
-- UPDATE employee SET DOB = '2001-06-11', LAST_NAME='Kathir',CONTACT='6757462471',WORK_AREA='Chennai' where emp_Id=106;
-- UPDATE employee SET DOB = '2002-01-13', LAST_NAME='Karthik',CONTACT='7857462471',WORK_AREA='Bengaluru' where emp_Id=107;
-- UPDATE employee SET DOB = '2003-09-14', LAST_NAME='Sekar',CONTACT='7897462471' ,WORK_AREA='Coimbatore' where emp_Id=108;
-- UPDATE employee SET DOB = '1997-08-12', LAST_NAME='Kumaravel',CONTACT='6757462471',WORK_AREA='Chennai' where emp_Id=109;
-- UPDATE employee SET DOB = '1996-02-10', LAST_NAME='Mani',CONTACT='9859462471',WORK_AREA='Bengaluru' where emp_Id=110;
-- UPDATE employee SET DOB = '1990-03-21', LAST_NAME='Kumar',CONTACT='7687462471' ,WORK_AREA='Coimbatore'where emp_Id=111;
-- UPDATE employee SET DOB = '1983-02-15', LAST_NAME='Kathiravel',CONTACT='8857462471',WORK_AREA='Chennai' where emp_Id=112;
-- UPDATE employee SET DOB = '2001-06-11', LAST_NAME='Kathir',CONTACT='6757462471',WORK_AREA='Coimbatore' where emp_Id=113;
-- UPDATE employee SET DOB = '2009-01-13', LAST_NAME='Karthik',CONTACT='7857462471',WORK_AREA='Chennai' where emp_Id=114;
-- UPDATE employee SET DOB = '2010-09-14', LAST_NAME='Sekar',CONTACT='7897462471',WORK_AREA='Coimbatore' where emp_Id=115;
-- UPDATE employee SET DOB = '1998-08-12', LAST_NAME='Kumaravel',CONTACT='6757462471',WORK_AREA='Chennai' where emp_Id=116;
-- UPDATE employee SET DOB = '1996-02-10', LAST_NAME='Mani',CONTACT='9859462471',WORK_AREA='Coimbatore' where emp_Id=117;
-- UPDATE employee SET DOB = '1990-03-21', LAST_NAME='Kumar',CONTACT='7687462471',WORK_AREA='Chennai' where emp_Id=118;
-- UPDATE employee SET DOB = '1995-02-15', LAST_NAME='Kathiravel',CONTACT='8857462471',WORK_AREA='Coimbatore' where emp_Id=119;

## displaying details of employees with same work srea but in different departments
select distinct a.emp_ID,a.emp_NAME,a.WORK_AREA,a.DEPT_NAME
from employee a, employee b
where a.WORK_AREA = b.WORK_AREA and a.DEPT_NAME<>b.DEPT_NAME and a.emp_ID<>b.emp_ID
order by b.WORK_AREA;