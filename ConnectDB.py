import mysql.connector as connector


connection = connector.connect(host="localhost",user="admin",password="admin", db = "littlelemondb")

mycursor = connection.cursor()

show_tables_query = "SHOW tables" 

mycursor.execute(show_tables_query)
#retrive tables in a variable
print("Tables de Little_Lemon")

tables = mycursor.fetchall
for table in mycursor:
    print(table)

join_query= """ SELECT c.GuestFirstName, c.GuestLastName, c.ContactInfo, o.BillAmount
FROM Customers c
JOIN Bookings b ON c.CustomerID = b.CustomerID
JOIN Orders o ON b.BookingID = o.BookingID
WHERE o.BillAmount > 60;
 """

mycursor.execute(join_query)

# Fetch results
results = mycursor.fetchall()

# Retrieve column names
cols = mycursor.column_names

# Print column names and records from results using for loop
print("""Data in the "Menu" table:""")
print(cols)
for result in results:
    print(result)