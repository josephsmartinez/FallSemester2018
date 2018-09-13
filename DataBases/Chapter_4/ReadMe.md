# Review Questions Chapter Three

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
foreign key
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
5. Describe the GRANT statement and explain hoe it relates to security. What types of privileges may be granted? How are they revoked?


6. Write the SQL commands to grant the following privileges:
- a. User Stetson must be able to retrieve data from the Customer table.
- b. User Webster and Bremer must be able to add new order and order lines

7. Write the SQL commands to revoke user Stetson privileges.

8. What is the system catalog? Name three items about which the catalog maintains information.

9. Write the SQL commands to obtain the following information from the system catalog.

- a. List every table that you created.
- b. List every field in the Customer tables and its associated data types.
- c. List every table that contain a field named itemNum

10. Why is it a good idea for the DBMS to update the catalog automatically when a change is name in the database structure? Could users cause problems by updating the catalog themselves? Explain

11. What are nulls? Which field cannot accept null values? Why?

12. State the three integrity rules. Indicate the reasons for enforcing each rule.

13. The Order table contains a foreign key, CustomerNum, that must match the primary key of the Customer table. What type of update to the Order table would violate referential integrity? If deletes do cascade, what would happen when a customer was deleted?

14. How would you use SQL to change a tables structure? What general types of changes are possible? Which command are used to implement these changes?

15. What are stored procedures? What purpose do they serve?

16. What are triggers? What purpose do they serve? How do you gain the functionality of a trigger using Access 2013?

17. You have a table that contains the following field: MemberLastName, MemberFirstName, Street, City, Street, PostalCode, and MembershipFee. These are 75,000 records in the tables. What indexes would you create for the tables and why would you create these indexes?

18. Toys Galore currently has a credit limit of $75,000. Because Toys Galore has an excellent credit rating, TAL Distributors is increasing the company's credit limit to $10,000. If you the SQL query in Question 2b after the credit limit has been increased, would Toys Galore be included in the query results? Why or why not?
