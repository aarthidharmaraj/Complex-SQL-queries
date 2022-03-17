Use queryy1;
## to display the person with highest salary above the average salary
##using Scalar subquery 
-- select * from employee
-- where SALARY>(select avg(SALARY) from employee);

-- ##using join statements
-- select * from employee e1
-- join (select avg(SALARY) avge from employee)avg_sal
-- on e1.SALARY>avg_sal.avge;

##Find the employees having highest salary in each department 
## Using multi-row subquery
-- select * from employee
-- where (DEPT_NAME, SALARY) in (
-- 					select DEPT_NAME, max(SALARY)
-- 					from employee 
-- 					group by DEPT_NAME)group by DEPT_NAME

##Single column ,multi row subquery
##Find employees who haven't logged 

-- select * from employee
-- where emp_NAME not in (select distinct user_name from users)

##correlated subquery
##find the employees with highest salary than the average salary of that department
-- select * from employee e1
-- where SALARY>(select avg(SALARY) from employee e2 where e2.DEPT_NAME=e1.DEPT_NAME);

#Find employees who haven't logged 
-- select distinct user_name from login_details a
-- where not exists(select 1 from employee b where a.user_name=b.emp_NAME )

##subquery inside a subquery
##find departments who's employees salaries are better than the average of all departments
-- select * from(select DEPT_NAME , sum(SALARY) as total_sal_dept
-- 	from employee group by DEPT_NAME)salar
-- 	join(
-- 	select avg(total_sal_dept) as avge
-- 			from(
-- 				select DEPT_NAME , sum(SALARY) as total_sal_dept
-- 				from employee group by DEPT_NAME)x)avg_sal
-- 	on salar.total_sal_dept > avg_sal.avge	

##using with clause

-- with salaries as 
-- 	(select DEPT_NAME , sum(SALARY) as total_sal_dept
-- 	from employee group by DEPT_NAME)
-- select * from salaries
-- 	join(
-- 	select avg(total_sal_dept) as avge
-- 			from salaries)avg_sal
-- 	on total_sal_dept > avg_sal.avge	

##Using subqueries in select clause and using case
##select employees and add remaarks to them for those having hidhest salary than the average salary

-- select * , (case when SALARY >( select avg(SALARY) from employee)
-- 	then 'Higher than the average'
--     else 'Less than the average'
--     end)as  REMARKS
-- from employee

##same question using subquery under from clause and cross join
-- select * , (case when SALARY > avg_sal.sal
-- 	then 'Higher than the average'
--     else 'Less than the average'
--     end)as  REMARKS
-- from employee
-- cross join( select avg(SALARY)sal from employee)avg_sal

##Insert data into emolyee history table from login and employee table without duplicate records.
-- drop table employee_history;
-- create table employee_history(
-- emp_ID int,
-- emp_NAME varchar(50),
-- DEPT_NAME varchar(50),
-- SALARY int,
-- login_date date,
-- location varchar(50)
-- );
-- insert into employee_history
-- select e.emp_ID, e.emp_NAME,e.DEPT_NAME,e.SALARY,lo.login_date,e.WORK_AREA from employee e
-- join login_details lo
-- on lo.login_id=e.emp_ID
-- where not exists(select 1 from employee emp where emp.emp_ID=e.emp_ID); ## to avoid repition and returns with zero row

## give 10% increament to employees in bangalore location based on salary earned by them in each department , by considering employees in employee_history table
