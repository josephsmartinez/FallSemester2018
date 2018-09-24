# Review Questions Chapter Four
Name: Joseph Martinez

```
arguments
ALTER TABLE
cascade delete
cascade update
catalog
CHECK
client
client/server system
CREATE INDEX
data macro
defining query
Documenter
DROP INDEX
DROP TABLE
entity integrity
FOREIGN KEY
- A foreign key is a field (or collection of fields) in a table whose value is required to match the value
of the primary key for a second table.
GRANT
index
index key
legal-values integrity
multiple-field index
PRIMARY KEY
referential integrity
REVOKE
row-and-column subset view
single-column index
single-field index
stored procedure
Syscolumns
Systables
system catalog
Sysview
trigger
validation rule
validation text
view
```

1. What is view? How do you define a view? Does the data described in a view definition ever exist in that form?    
- A view is an application program or an individual user's picture of the database.
- The view is less involved from the rest of the database and is used represent a simplification.  

2. Using data from the TAL Distributors database, define a view named TopLevelCust. It consists of the [number, name, address, balance, and credit limit] of all customers with credit limits that are greater than equal to $10,000.  
- a. Using SQL, write the view definition for TopLevelCust
```
CREATE VIEW TopLevelCust AS SELECT CUSTOMER.CustomerNum, CUSTOMER.CustomerName, CUSTOMER.Street, CUSTOMER.City, CUSTOMER.Balance, CUSTOMER.CreditLimit FROM CUSTOMER WHERE CUSTOMER.CreditLimit >= 10000;
```
- b. Write an SQL query to retrieve the number and name of all customers as well as the difference between their credit limit and balance in the TopLevelCust view.    
```
SELECT CustomerNum, CustomerName, ABS(CreditLimit - Balance) AS Difference FROM CUSTOMER;
```
- c. Convert the query you wrote in Question 2b to the query that the DBMS will actually execute. **NOT SURE ABOUT THE DIFFERENCE HERE**
```
SELECT CustomerNum, CustomerName, ABS(CreditLimit - Balance) AS Difference FROM CUSTOMER;
```
3. Define a view named ItemOrder. It consist of the [item number, description, price, order number, order date, number ordered, and quoted price] for all order lines currently on file.  
- a. Using SQL, write the view definition for ItemOrder.
```
CREATE VIEW ItemOrder AS SELECT Item.ItemNum, Item.Description, Item.Price, Orders.OrderNum, Orders.OrderDate, OrderLine.QuotedPrice FROM Item
INNER JOIN OrderLine
ON Item.ItemNum=OrderLine.ItemNum
INNER JOIN Orders
ON Orders.OrderNum=OrderLine.orderNum;
```
- b. Write an SQL query to retrieve the item number, description order number, and quoted price for items with quoted prices that exceed $100.
```
SELECT ItemOrder.ItemNum, ItemOrder.Description, ItemOrder.OrderNum, ItemOrder.QuotedPrice FROM ItemOrder WHERE ItemOrder.QuotedPrice > 100
```
- c. Convert the query you wrote in Question 3b to the query that the DBMS will actually execute. **NOT SURE ABOUT THE DIFFERENCE HERE**
```
SELECT ItemOrder.ItemNum, ItemOrder.Description, ItemOrder.OrderNum, ItemOrder.QuotedPrice FROM ItemOrder WHERE ItemOrder.QuotedPrice > 100
```
4. What is an index? What are the advantages and disadvantages of using indexes? How do you use SQL to create an index?
- A database index is a data structure that improves the speed of data retrieval operations on a database table at the cost of additional writes and storage space to maintain the index data structure.
- **Advantages**=the index make certain type of retrieval more efficient.
- **Disadvantages**= 1) Index occupies space 2) When data is updated, the index must be adjusted.  

Creates an index on a table. Duplicate values are allowed:  
`CREATE INDEX index_name ON table_name (column1, column2, ...);`  

Creates a unique index on a table. Duplicate values are not allowed:  
`CREATE UNIQUE INDEX index_name ON table_name (column1, column2, ...);`  

View the indexes defined on a particular table  
`SHOW INDEXES FROM table_name`  

Drop index basic syntax  
`DROP INDEX key_name ON table_name;`  

[What are Indexes?](https://www.guru99.com/indexes.html])

5. Describe the GRANT statement and explain how it relates to security. What types of privileges may be granted? How are they revoked?
- The basic idea of the GRANT statement is that different types of privileges can be granted to users and, if
necessary, later revoked.
`GRANT SELECT ON Customer TO Jones`  
- These privileges include such things as the right to select, insert, update, and delete
table data.
- You can revoke user privileges using the REVOKE statement.
`REVOKE SELECT ON Customer FROM Jones`

6. Write the SQL commands to grant the following privileges:
- a. User Stetson must be able to retrieve data from the Customer table.
`GRANT SELECT ON Customer TO Stetson`
- b. User Webster and Bremer must be able to add new order and order lines
`GRANT INSERT ON Order, OrderLine TO Webster, Bremer`

7. Write the SQL commands to revoke user Stetson privileges.
- You can revoke user privileges using the REVOKE statement.
`REVOKE SELECT ON Customer FROM Stetson`

8. What is the system catalog? Name three items about which the catalog maintains information.
- Information about tables in the database is kept in the system catalog (or the catalog).
- When a user adds a new table, changes the structure of an existing table,
or deletes a table, the DBMS updates the catalog to reflect these changes.

- Systables (information about the tables known to SQL)
- Syscolumns (information about the columns or fields within these tables)
- Sysindexes (information about the indexes that are defined on these tables)
- Sysviews (information about the views that have been created)  
`SELECT Colname, Coltype FROM Syscolumns WHERE Tbname=’Item’;`

9. Write the SQL commands to obtain the following information from the system catalog.
- a. List every table that you created.
`SHOW TABLES;`
- b. List every field in the Customer tables and its associated data types.
`DESCRIBE Customer`
- c. List every table that contain a field named itemNum
`SELECT * FROM information_schema.columns WHERE column_name = 'itemNum'`

10. Why is it a good idea for the DBMS to update the catalog automatically when a change is name in the database structure? Could users cause problems by updating the catalog themselves? Explain
- A DBMS furnishes ways of using the catalog to determine information about the structure of the database.
In some cases, this simply involves using SQL to query the tables in the catalog.
- This is something the DBMS handles automatically so, there is no need for an admin to edit or alter the database catalog.

[MySSQLcatalog](http://michaelmclaughlin.info/db1/lesson-materials/mysql-data-catalog/)

11. What are nulls? Which field cannot accept null values? Why?
- Essentially, setting the value in a given field to null is similar to not entering a value in the field at
all. Nulls are used when a value is missing, unknown, or inapplicable.
- primary key should never be set and allowed to be changed to null values  

12. State the three integrity rules. Indicate the reasons for enforcing each rule.
- **Entity integrity**, is the rule that no field that is part of the primary key may accept null values.
- **A foreign key**, is a field (or collection of fields) in a table whose value is required to match the value
of the primary key for a second table.
- **Referential integrity**, is the rule that if table A contains a foreign key that matches the primary key
of table B, the values of this foreign key must match the value of the primary key for some row in table B or
be null.

13. The Orders table contains a foreign key, CustomerNum, that must match the primary key of the Customer table. What type of update to the Order table would violate referential integrity? If deletes do cascade, what would happen when a customer was deleted?
- An insert into Orders with a foreign key value that does not match a value of the primary keys within the Customer
- Cascade Delete Related Records ensures that the deletion of a Customer record also deletes all Orders  records related to that customer (also known as cascade delete); selecting the Cascade Update Related Fields ensures that changes made to the primary key of a rep record are also made in the related Customer record (also known as cascade update).

14. How would you use SQL to change a tables structure? What general types of changes are possible? Which command are used to implement these changes?
- You can change the database structure by adding and removing tables and fields, by changing the characteristics of existing fields, or by creating and dropping indexes  
- `ALTER TABLE table ADD COLUMN column type options;`
- `ALTER TABLE table DROP COLUMN column;`

15. What are stored procedures? What purpose do they serve?
- If you anticipate running a particular query often, for example, you can improve overall performance by saving the query in a special file called a stored procedure.

16. What are triggers? What purpose do they serve? How do you gain the functionality of a trigger using Access 2013?
- A trigger is an action that occurs automatically in response to an associated database operation such as an INSERT, UPDATE, or DELETE command. Like a stored procedure, a trigger is stored and compiled on the server. Unlike a stored procedure, which is executed in response to a user request, a trigger is executed in response to a command that causes the associated database operation to occur.

- Access does not use the term “trigger” but offers the functionality of triggers through data macros. A data macro enables you to add logic to table events such as adding, changing, or deleting data

17. You have a table that contains the following field: MemberLastName, MemberFirstName, Street, City, Street, PostalCode, and MembershipFee. These are 75,000 records in the tables. What indexes would you create for the tables and why would you create these indexes?
- Create a primary key as the customers can have the same (MemberLastName, MemberFirstName, Street, City, Street, PostalCode, and MembershipFee)
- You could create a column as an index of membershipNumbers that would be unique.

18. Toys Galore currently has a credit limit of $7,500. Because Toys Galore has an excellent credit rating, TAL Distributors is increasing the company's credit limit to $10,000. If you run the SQL query in Question 2b after the credit limit has been increased, would Toys Galore be included in the query results? Why or why not?
- In SQL Server a standard view is nothing but a query. As the underlying data changes, when that query gets accessed, it reflects the changes to the data. It's automatic, but not because some additional action is occurring to refresh the data in the view. Rather, the view, being just a query, retrieved the data from the tables in question.
