import mysql.connector
con = mysql.connector.connect(host="localhost", user="root", password="Aspire@123", database="queryy1")
my_cursor=con.cursor()

# query1= "CREATE TABLE users1 (userid int primary key,username varchar(30) not null,email varchar(50))"
# my_cursor.execute(query1)

# sql="INSERT INTO users1(userid,username,email) VALUES (%s, %s,%s)"
# val=[
#       (1, 'Reshma', 'reshma@gmail.com'),
#     (2, 'Farhana', 'farhana@gmail.com'),
#     (3, 'Robin', 'robin@gmail.com'),
#     (4, 'Robin', 'robin@gmail.com'),
#     (5, 'Reshma', 'reshma@gmail.com'),
#     (6, 'Rocky', 'rock@gmail.com'),
#     (7, 'Sumit', 'sumit@gmail.com'),
#      (8, 'Robin', 'robin@gmail.com'),
#      (9, 'Sumit', 'sumit@gmail.com'),
#     (10, 'Reshma', 'reshma@gmail.com'),
#     (11, 'Farhana', 'farhana@gmail.com'),
#     (12, 'Robin', 'robin@gmail.com'),
#     (13, 'Robin', 'robin@gmail.com'),
#     (14, 'Reshma', 'reshma@gmail.com'),
#     (18, 'Rocky', 'rock@gmail.com'),
#     (17, 'Sumit', 'sumit@gmail.com')
# ]
# my_cursor.executemany(sql, val)

# con.commit()
 #SQL query to fetch all the duplicate records from a table 
# query2="SELECT * from users1 ORDER BY username"
# my_cursor.execute(query2)
# for db in my_cursor:
#     print(db[0])
# query3="SELECT username,COUNT(username) FROM users1 GROUP BY username HAVING COUNT(username) > 1"
# my_cursor.execute(query3)
# for db in my_cursor:
#     print(db)
##Using delete and rownumber() , deleting  the duplicate rows

# query4="DELETE FROM users1 WHERE userid IN(SELECT userid FROM (SELECT userid, ROW_NUMBER()OVER (PARTITION BY username ORDER BY username) AS row_num FROM users1)as temp_table WHERE row_num>1)"  
# my_cursor.execute(query4)
# query="SELECT * from users1"
# my_cursor.execute(query)
# for db in my_cursor:
#     print(db)

## using inner join method 
# query4="DELETE S1 FROM users1 AS S1 INNER JOIN users1 AS S2 WHERE S1.user_id > S2.user_id AND S1.user_name=S2.user_name" 
# my_cursor.execute(query4)
# query="SELECT * from users1"
# my_cursor.execute(query)
# for db in my_cursor:
#     print(db)
