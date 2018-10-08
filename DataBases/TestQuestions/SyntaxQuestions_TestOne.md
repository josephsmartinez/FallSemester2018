# Syntax Questions

35. Based on the code above, list the number, name, credit limit, and balance for all customers with credit limits that exceed their balances.
```
SELECT CustomerNum, CustomerName, CreditLimit, Balance
FROM Customer
WHERE CreditLimit>Balance ;
```
36. Based on the code above, list the number, name, and balance of all customers with balances greater than or equal to $2,000 and less than or equal to $5,000.
```
SELECT CustomerNum, CustomerName, Balance
FROM Customer
WHERE Balance BETWEEN 2000 AND 5000 ;
```
37. Based on the code above, list the number, name, and available credit for all customers with credit limits that exceed their balances.
```
SELECT CustomerNum, CustomerName, CreditLimit-Balance
AS AvailableCredit
FROM Customer
WHERE CreditLimit>Balance ;
```
38. Based on the code above, list the number, name, and complete address of every customer located on a street that contains the letters “Oxford”.
```
SELECT CustomerNum, CustomerName, Street, City, State, PostalCode
FROM Customer
WHERE Street LIKE "%Oxford%" ;
```
39. Based on the code above, list the number, name, street, and credit limit of all customers. Order the customers by name within descending credit limit.
```
SELECT CustomerNum, CustomerName, Street, CreditLimit
FROM Customer
ORDER BY CreditLimit
DESC, CustomerName ;
```
40. Based on the code above, for each sales rep, list the rep number, the number of customers assigned to the rep, and the average balance of the rep’s customers. Group the records by rep number and order the records by rep number.
```
SELECT RepNum, COUNT(*), AVG(Balance)
FROM Customer
GROUP BY RepNum
ORDER BY RepNum ;
```
41. Based on the code above, list the number and name of all customers that are either represented by sales rep 30 or that currently have orders on file, or both.
```
SELECT CustomerNum, CustomerName,
FROM Customer
WHERE RepNum='30'
UNION
SELECT Customer.CustomerNum, CustomerName,
FROM Customer, Orders
WHERE Customer.CustomerNum=Orders.CustomerNum ;
```
42. Based on the code above, list the descriptions of all items that are located in Storehouse3 and for which there are more than 20 units on hand.
```
SELECT Description
FROM Item
WHERE Storehouse='3' AND OnHand>20 ;
```
43. Based on the code above, list the descriptions of all items that are located in Storehouse 3 or for which there are more than 20 units on hand, or both.
```
SELECT Description
FROM Item
WHERE Storehouse='3' OR OnHand>20 ;
```
44. Based on the code above, list the descriptions of all items that are not in Storehouse 3. Based on the code above, list the descriptions of all items that are not in Storehouse
```
SELECT Description FROM Item WHERE NOT Storehouse='3' ;
```
45. Based on the code above, find how many items are in category TOY.
```
SELECT COUNT(*) FROM Item WHERE Category='TOY' ;
```
46. Based on the code above, list the complete student table.
```
SELECT * FROM Student ;
```
47. Based on the code above, list the name of every student whose postal code is 10113.
```
SELECT FirstName, LastName FROM Student WHERE PostalCode='10113' ;
```
48. Based on the code above, find the name of the student whose ID is 1167.
```
SELECT FirstName, LastName FROM Student WHERE StudentID='1167' ;
```
49. Based on the code above, change the postal code of the student with ID 11433 to
14455.
```
UPDATE Student SET PostalCode='14455' WHERE StudentID='11433' ;
```
50. Based on the code above, delete any row in the OrderLine table in which the item number is MT03.
```
DELETE FROM OrderLine WHERE ItemNum='MT03' ;
```

10. The following command will enable Jones to retrieve data from the Customer table, but not to take any other action: GRANT SELECT ON Customer Jones ;

- False
- The following command will enable user Jones to retrieve data from the Customer table but not take any other action.
- `GRANT SELECT ON Customer TO Jones`

18. To create an index named RepBal with the keys RepNum and Balance and with the balances listed in descending order, the command is ____.
```
CREATE INDEX RepBal ON
Customer (RepNum, Balance DESC);
```
21. To create the primary key clause for the Customer table on the CustomerNum field, the correct statement is ____.
```
PRIMARY KEY (CustomerNum)
```
22. To create the primary key clause for the OrderLine table on the OrderNum and ItemNum fields, the correct statement is ____.
```
PRIMARY KEY (OrderNum, ItemNum)
```
24. Which of the following statement fragments will only allow a CreditLimit of $5,000, $7,500, or $15,000?
```
CHECK (CreditLimit IN (5000, 7500, 15000))
```
25. The CHECK clause can be included in the ____ command.
```
ALTER TABLE
```
16. The ____ command will create an application program's or individual user's picture of the database.
```
CREATE VIEW
```
19. The ____ statement will take away user privileges to the database.
```
REVOKE
```
