# Class Notes

```
data  -name
|      -type
|
|----column  - attribute
      |      - related
      |
      |----record - relates
              |
              |---- table
                      |
                      |----RDB
                            |
                            DB Cluster
                              |
                              |----Warehouse
```
### Definitions
```
SELECT - column
FROM - data source (Start reading from here)
WHERE - filter (then filters the information)
```
- From customer, show me, all attributes  
`SELECT * FROM customer;`
- Example Simple Query  
`customername AS cname,creditlimit,balance,creditlimit-balance AS availbalance FROM Customer;`
- Example  
`SELECT Street + ' ' + City + ', ' + [State] + ' ' + PostalCode AS FullAddress FROM customer;`
- Example  
`SELECT dbo.customer.CustomerName, dbo.customer.CreditLimit FROM customer`
http://cse.unl.edu/~sscott/ShowFiles/SQL/CheatSheet/SQLCheatSheet.html

## Tuesday 09/04/2018
**NOTE commands may differ from MySql and Sql-Server**
**Some commands may have Syntax errors, please use google to help**
- mysql engine powers the query  
- Standard (agreed on  ) vs policy  
- `SELECT`, `FROM`, `WHERE`, (Having...Optional)  

1. FROM
2. WHERE
3. SELECT

- Select without qualifying the column  
`select CustomerName, CreditLimit from customer`  

- Sample query for count  
`select count (*) from customer where city = 'Grove'`  

- Using a simple criteria  
`select * from customer where city = 'Grove'`  
Returns: 2  

- compound criteria with comparison operators  
-- >, >=, <, <=, =, !=  
`select * from Customer where Balace >= 2000 or City= 'Fullton'`  

- another example  
`select * from Customer where customername = 'Cress Store' or City = 'Mesa' and Balance >= 2500`  

- another example  
`select * from Customer where customername != 'Cress Store' or City = 'Mesa' and Balance >= 2500`  

- null is a special case, use [column] is null  
`select * from customer where city is null`  

- isnull is an operator that checks the column  
-- for null and if true substitutes the next value after the comma   
`select * from Customer where isnull(city, '') = ''`  

- to select records that are not null, you have to use the following format  
`select * from customer where city is not null`  

- Get the balance of all customers into a total summarized value  
-- using the sum function   
`select sum(balance) as allBalance from customer`  

- Lets get the average creditlimit using the average function  
`select AVG(creditlimit) as avglimit from customer`  

- using TOP gives the top N records  
-- you still need to specify the column    
`select top 5 * from customer order by customername asc`  

**The sql engine does not return the values in orders, unless you specify the order from the query.**  

- grouping. Group records that have a similar characteristic  
-- Lets get the average balance per city from our customers  
`select city, avg(balace) from customer group by customer`  

- Find the max balance per city  
`select ciry, max(balace) as maximumBalace from customer group by city`  

- Sorting  
`select * from customer order by city asc, customername desc`  

- Joins allow us to query the records from multiple tables together  
-- To Join: We need  
1. The tables to join
2. The columns to join by

### Type of JOINs
- (INNER) JOIN: Returns records that have matching values in both tables
- LEFT (OUTER) JOIN: Return all records from the left table, and the matched records from the right table
- RIGHT (OUTER) JOIN: Return all records from the right table, and the matched records from the left table
- FULL (OUTER) JOIN: Return all records when there is a match in either left or right table

- **inner join** or natural join: records they join on both tables  
`select customername, firstname, lastname, customer.repnum, rep.repnum from customer inner join rep on customer.repnum = rep.repnum`

- Example within TAL  
Return the customers that only appear in table1 and table2  
`SELECT ORDERS.OrderNum, CUSTOMER.CustomerName, ORDERS.OrderDate FROM ORDERS INNER JOIN CUSTOMER ON ORDERS.CustomerNum=ORDERS.CustomerNum`  

- **Left outer join**: record from the table on left side  
`select cusomername, firstname, lastname, customer.repnum, customer.repnum from cusomer left outer join rep on customer.repnum = rep.repnum`  

- Example within TAL
Returns the customers that appear in the ORDERS tables base on matches from the CUSTOMER table    
`SELECT CUSTOMER.CustomerName, CUSTOMER.CustomerNum FROM CUSTOMER LEFT JOIN ORDERS ON ORDERS.OrderNum = CUSTOMER.CustomerNum ORDER BY CUSTOMER.CustomerName`

- **Right outer join**: record from the table on right side
`SELECT column_name(s) FROM table1 RIGHT JOIN table2 ON table1.column_name = table2.column_name;`

- **Full Join** return all record when there is a match in either left table or right table records.  
`SELECT column_name(s)
FROM table1
FULL OUTER JOIN table2 ON table1.column_name = table2.column_name;`



### Group Class Hands-on Assignment  
