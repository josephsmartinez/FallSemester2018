# Review Questions Chapter Three
```
CHAR(n)
command
compound condition
CREATE TABLE
DATE
DECIMAL (p, q)
DELETE
FROM clause
GROUP BY clause
HAVING clause
INSERT
INTEGER
INTO clause
ORDER BY clause
reserved word
SELECT clause
simple condition
SMALLINT
SQL (Structured Query Language)
subquery
UPDATE
WHERE clause
```
## Questions
1. Describe the process of creating a table in SQL and the different data types you can use for fields.  
- You can use the `CREATE TABLE` command to create a table by describing the layout.  
Data Type: (Some but not all)  
INTEGER  
SMALLINT  
DECIMAL  
CHAR  
DATE  

2. What is the purpose of the WHERE clause in SQL? Which comparison operators can you use in a WHERE clause?  
- SELECT-FROM-**WHERE**  
- `WHERE` specifies the conditions to be applied the data after FROM  

3. How do you write a compound condition in an SQL query? When is a compound condition true?  
- Compound statement are form using two or more conditional statements using: AND and OR  
- AND: only if both or all conditions are true  
- OR: if only one condition is true  

4. What is a computed field? How can you use one in an SQL query? How do you assign a name to a computed field?
- Computed field are derived from existing fields and can involve: addition (+), subtraction (-), manipulation (\*), and division (/)  
- `SELECT CustomerNum, CustomerName, CreditLimit-Balance AS AvailableCredit FROM Customer`  
                                        (Computation)       (Computed field name)

5. How do you use the LIKE and IN operators in an SQL query?
- In the case of conditions involving non-exact matches, using `LIKE` operator with a wildcard (\*) would be appropriate.
- The `IN` acts like the OR conditional operator, except it hold a collection of values to be checked.  
Example:  
- `SELECT Customer, CustomerName, Street, CreditLimit FROM Customer WHERE CreditLimit=7500 OR CreditLimit=10000 OR CreditLimit=15000;`
- `SELECT Customer, CustomerName, Street, CreditLimit FROM Customer WHERE CreditLimit IN (7500, 10000, 15000);`

6. How do you sort data in SQL? When there is more than one sort key, how do you indicate which one is the major sort key? How do you sort data in descending order?
- Using the `ORDER BY` clause  
- The major key is listed first, and the minor is listed after  
- Using `DESC`  
Example: `SELECT CustomerNum, CustomerName, Street, CreditLimit FROM Customer ORDER BY CreditLimit DESC, CustomerName;`

7. What are the SQL built-in functions? How do you use them in an SQL query?
- SQL built-in functions, also known as **aggregate functions** calculate the number of entries like: SUM, AVG, MAX, MIN, COUNT  
Example: `SELECT COUNT(*) AS CustomerCount SUM(Balance) AS BalanceTotal FROM Customer`  
Returns the total number of customers and calculates the total of the all the customers' balances  

8. What is a subquery? When is a subquery executed?
- When a query is placed inside another (nested), also known as subquery  
- The inner (nested) subquery will be evaluated first, then the outer query  

9. How do you group data in SQL? When you group data in SQL, are there any restriction on the item that you can include in the SELECT clause? Explain?
- Using the `GROUP BY` clause
- The `HAVING` clause is to groups, as the `WHERE` clause is to rows  
- Example: `SELECT RepNum, COUNT(*) AS NumCustomer, AVG(Balance) AS AverageBalance FROM Customer WHERE CreditLimit<10000 GROUP BY RepNum HAVING COUNT(*)>2 ORDER BY RepNum`  
Reps with more than two customers having credit limits of less than $10,000

10. How do you join table in SQL?
  1. In the `SELECT` clause, list all fields to display
  2. In the `FROM` clause, list al tables involved in the query
  3. In the `WHERE` clause, give the condition that will restrict it to the rows that have common values in matching fields
  - It is necessary to qualify the field name  

11. How do you qualify the name of a field in an SQL query? When is it necessary to do so?
- When there is potential ambiguity in listing field name, you must qualify the fields involved.
Example: `SELECT CustomerNum, CustomerName, Rep.RepNum, LastName, FirstName FROM Customer, Rep WHERE Customer.RepNum=Rep.Num ORDER BY customerNum;`  
                                                                                                       (qualifying field name [table].[column])  

12. How do you take the union of two tables in SQL? What criteria must the tables meet to make a union possible?
- Using the `UNION` clause
- The two table involved in a union must have the same structure  

13. Describe the three update commands in SQL?
  1. `INSERT`
  2. `UPDATE`
  3. `DELETE`

14. How do you save the results of an SQL query as table?
- Using the  `INTO` clause  
Example: `SELECT * INTO SmallCust FROM Customer WHERE CreditLimit <= 7500;`   
- The implementation of Oracle does not support the query above. A table would have to be created before hand.

15. In Example 1, why is the data type for the PostalCode field CHAR and not SMALLINT of INTEGER? Is the length of the field long enough? Why or why not?
- The field is a non computed field and thus is not required to be a integer type.
- The field is large enough, however, if the field needed to handle zip codes formatted via 12345-123 then no.

16. You need to delete the OrderLine table from the TAL Distributors database. Will the following command work?
`DELETE FROM OrderLine;`
- Yes, as mentioned within page 101. Use the `WHERE` clause to specify a condition to select the records to delete, without it, the table would be deleted. 
