# MQL Commands for the data within TAL & Colonial Datasets

## Colonial Queries
### SELECT
SELECT something FROM tablename; `*` represents "all"  
`SELECT * FROM Customer;`

Pull First Names only  
`SELECT FirstName FROM Customer`

Pull First and Last Names  
`SELECT FirstName, LastName FROM Customer`

### Simple Criteria
When the record to display must satisfy the condition  
`SELECT FirstName, Address, City, State, PostalCode, Phone FROM Customer WHERE FirstName="Larry"`  


### Compound Criteria
'AND' Syntax  
```
SELECT column1, column2, ...
FROM table_name
WHERE condition1 AND condition2 AND condition3 ...;
```
Example 'AND'
`SELECT FirstName, Address FROM Customer WHERE City='Londonderry' AND FirstName='Liam'`

<hr>

'OR' Syntax  
```
SELECT column1, column2, ...
FROM table_name
WHERE condition1 OR condition2 OR condition3 ...;
```
Example 'OR'
```
SELECT FirstName, LastName, Phone FROM Customer WHERE city='Londonderry' or city='Lowell'
```
<hr>

'NOT' Syntax  
```
SELECT column1, column2, ...
FROM table_name
WHERE NOT condition;
```
Example 'NOT'

### Organizing Data
Order the column by  
```
SELECT * FROM `Customer` ORDER BY `City` ASC
```

###
