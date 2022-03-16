import mysql.connector
con = mysql.connector.connect(host="localhost", user="root", password="Aspire@123", database="queryy1")
my_cursor=con.cursor()

# query1="CREATE TABLE employee( emp_ID int primary key, emp_NAME varchar(50) not null, DEPT_NAME varchar(50), SALARY int);"
# my_cursor.execute(query1)

# sql="INSERT INTO employee (emp_ID,emp_NAME,DEPT_NAME,SALARY) VALUES (%s, %s,%s,%s)"
# val=[
#     (101, 'Mohan', 'Admin', 4000),
#     (102, 'Rajkumar', 'HR', 3000),
#     (103, 'Akbar', 'IT', 4000),
#     (104, 'Dorvin', 'Finance', 6500),
#     (105, 'Rohit', 'HR', 3000),
#     (106, 'Rajesh',  'Finance', 5000),
#     (107, 'Preet', 'HR', 7000),
#     (108, 'Maryam', 'Admin', 4000),
#     (109, 'Sanjay', 'IT', 6500),
#     (110, 'Vasudha', 'IT', 7000),
#     (111, 'Melinda', 'IT', 8000),
#     (112, 'Komal', 'IT', 10000),
#     (113, 'Gautham', 'Admin', 2000),
#     (114, 'Manisha', 'HR', 3000),
#     (115, 'Chandni', 'IT', 4500),
#     (116, 'Satya', 'Finance', 6500),
#     (117, 'Adarsh', 'HR', 3500),
#     (118, 'Tejaswi', 'Finance', 5500),
#     (119, 'Cory', 'HR', 8000),
# ]

# my_cursor.executemany(sql, val)

# con.commit()
# q1="SELECT *FROM(SELECT *FROM employee ORDER BY emp_Id DESC LIMIT 3) tbl1 ORDER BY emp_Id LIMIT 1"
# my_cursor.execute(q1)
# for data in my_cursor:
#     print(data)
# # display the details of employees with highest and lowest salaries based on departments
# q2="SELECT x.* from employee e join (select *, max(SALARY) over (partition by DEPT_NAME) as max_salary, min(SALARY) over (partition by DEPT_NAME) as min_salary from employee) x on e.emp_id = x.emp_id and (e.SALARY = x.max_salary or e.SALARY = x.min_salary) order by x.DEPT_NAME, x.SALARY" 
# my_cursor.execute(q2)
# for data in my_cursor:
#     print(data)

# #Add columns to the exixting table
# q3="ALTER TABLE employee ADD CONTACT VARCHAR(20) NOT NULL AFTER DOB,ADD LAST_NAME varchar(40) NOT NULL AFTER emp_NAME"
# my_cursor.execute(q3)
# for data in my_cursor:
#     print(data)

# ## update the values to the newly added column in an exixting table

# q1="UPDATE employee SET DOB = '2000-01-10', LAST_NAME='Kumar',CONTACT='9857462471',WORK_AREA='Bengaluru' where emp_Id=101"
# q2="UPDATE employee SET DOB = '2001-12-10', LAST_NAME='Raj',CONTACT='9857362471',WORK_AREA='Bengaluru' where emp_Id=102"
# q3="UPDATE employee SET DOB = '1998-03-16', LAST_NAME='Sekar',CONTACT='9877462471',WORK_AREA='Chennai' where emp_Id=103"
# q4="UPDATE employee SET DOB = '1997-05-15', LAST_NAME='Kumar',CONTACT='9897462471',WORK_AREA='Bengaluru' where emp_Id=104"
# q5="UPDATE employee SET DOB = '1996-08-13', LAST_NAME='Kurnal',CONTACT='9257462471',WORK_AREA='Chennai' where emp_Id=105"
# q6="UPDATE employee SET DOB = '2001-06-11', LAST_NAME='Kathir',CONTACT='6757462471',WORK_AREA='Chennai' where emp_Id=106"
# q7="UPDATE employee SET DOB = '2002-01-13', LAST_NAME='Karthik',CONTACT='7857462471',WORK_AREA='Bengaluru' where emp_Id=107"
# q8="UPDATE employee SET DOB = '2003-09-14', LAST_NAME='Sekar',CONTACT='7897462471' ,WORK_AREA='Coimbatore' where emp_Id=108"
# q9="UPDATE employee SET DOB = '1997-08-12', LAST_NAME='Kumaravel',CONTACT='6757462471',WORK_AREA='Chennai' where emp_Id=109"
# q10="UPDATE employee SET DOB = '1996-02-10', LAST_NAME='Mani',CONTACT='9859462471',WORK_AREA='Bengaluru' where emp_Id=110"
# q11="UPDATE employee SET DOB = '1990-03-21', LAST_NAME='Kumar',CONTACT='7687462471' ,WORK_AREA='Coimbatore'where emp_Id=111"
# q12="UPDATE employee SET DOB = '1983-02-15', LAST_NAME='Kathiravel',CONTACT='8857462471',WORK_AREA='Chennai' where emp_Id=112"
# q13="UPDATE employee SET DOB = '2001-06-11', LAST_NAME='Kathir',CONTACT='6757462471',WORK_AREA='Coimbatore' where emp_Id=113"
# q14="UPDATE employee SET DOB = '2009-01-13', LAST_NAME='Karthik',CONTACT='7857462471',WORK_AREA='Chennai' where emp_Id=114"
# q15="UPDATE employee SET DOB = '2010-09-14', LAST_NAME='Sekar',CONTACT='7897462471',WORK_AREA='Coimbatore' where emp_Id=115"
# q16="UPDATE employee SET DOB = '1998-08-12', LAST_NAME='Kumaravel',CONTACT='6757462471',WORK_AREA='Chennai' where emp_Id=116"
# q17="UPDATE employee SET DOB = '1996-02-10', LAST_NAME='Mani',CONTACT='9859462471',WORK_AREA='Coimbatore' where emp_Id=117"
# q18="UPDATE employee SET DOB = '1990-03-21', LAST_NAME='Kumar',CONTACT='7687462471',WORK_AREA='Chennai' where emp_Id=118"
# q19="UPDATE employee SET DOB = '1995-02-15', LAST_NAME='Kathiravel',CONTACT='8857462471',WORK_AREA='Coimbatore' where emp_Id=119"

# my_cursor.execute(q1)
# my_cursor.execute(q2)
# my_cursor.execute(q3)
# my_cursor.execute(q4)
# my_cursor.execute(q5)
# my_cursor.execute(q6)
# my_cursor.execute(q7)
# my_cursor.execute(q8)
# my_cursor.execute(q9)
# my_cursor.execute(q10)
# my_cursor.execute(q11)
# my_cursor.execute(q12)
# my_cursor.execute(q13)
# my_cursor.execute(q14)
# my_cursor.execute(q15)
# my_cursor.execute(q16)
# my_cursor.execute(q17)
# my_cursor.execute(q18)
# my_cursor.execute(q19)

# # #fetch the details of employees who work in the same area but in different departments.
# query5="SELECT distinct emp_NAME,WORK_AREA,DEPT_NAME FROM employee WHERE WORK_AREA IN (SELECT WORK_AREA FROM employee group BY WORK_AREA HAVING COUNT(*) > 1)order by WORK_AREA"
# query5="SELECT distinct a.emp_ID,a.emp_NAME,a.WORK_AREA,a.DEPT_NAME from employee a, employee b where a.WORK_AREA = b.WORK_AREA and a.DEPT_NAME<>b.DEPT_NAME and a.emp_ID<>b.emp_ID order by b.WORK_AREA"
# query5="SELECT emp_NAME,WORK_AREA,DEPT_NAME FROM employee WHERE WORK_AREA IN(SELECT WORK_AREA FROM (SELECT WORK_AREA, ROW_NUMBER() OVER (PARTITION BY DEPT_NAME ORDER BY DEPT_NAME) AS row_num FROM employee)as temp_table WHERE row_num>1)order by WORK_AREA"
# my_cursor.execute(query5)
# for data in my_cursor:
#     print(data)
    
