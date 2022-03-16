import mysql.connector
con = mysql.connector.connect(host="localhost", user="root", password="Aspire@123", database="queryy1")
my_cursor=con.cursor()

## fetch the users who logged in consecutively 3 or more times.
# query="SELECT distinct repeated_names from ( select *, case when user_name = lead(user_name) over(order by login_id) and  user_name = lead(user_name,2) over(order by login_id) then user_name else null end as repeated_names from login_details) x where x.repeated_names is not null"
# my_cursor.execute(query)
# for data in my_cursor:
#     print(data)

## SQL query to interchange the adjacent student names.

# qu="SELECT id,student_name, case when id%2 <> 0 then lead(student_name,1,student_name) over(order by id) when id%2 = 0 then lag(student_name) over(order by id) end as new_student_name from students"
# my_cursor.execute(qu)
# for data in my_cursor:
#     print(data)
# my_cursor.close()


##From the weather table, fetch all the records when London had extremely cold temperature for 3 consecutive days or more.
# qu="SELECT id, city, temperature, day,flag from (select *,case when temperature < 0 and lead(temperature) over(order by day) < 0 and lead(temperature,2) over(order by day) < 0 then 'Y' when temperature < 0 and lead(temperature) over(order by day) < 0 and lag(temperature) over(order by day) < 0 then 'Y' when temperature < 0 and lag(temperature) over(order by day) < 0 and lag(temperature,2) over(order by day) < 0 then 'Y' end as flag from weather)x where x.flag = 'Y'"
# my_cursor.execute(qu)
# for data in my_cursor:
#     print(data)

## to Find the top 2 accounts with the maximum number of unique patients on a monthly basis.

# que="SELECT month,account_id,unique_patients from(select *, rank() over(partition by month order by unique_patients desc,account_id)as rnk  from( select month, account_id,count(1) as unique_patients from (SELECT distinct monthname(date)as month, account_id,patient_id from patient_logs)pl group by account_id,month)x )temp where temp.rnk in (1,2)"
# my_cursor.execute(que)
# for data in my_cursor:
#     print(data)