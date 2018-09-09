# Assignment One
## Info Retrieval | In Class Lab

1. Using the Tal Distributors data,  write the following SQL queries:

a. List the number and name of all customers that are represented by rep 30 and have a credit limit of $10,000  
`SELECT CustomerNum, CustomerName FROM CUSTOMER WHERE RepNum='30' AND CreditLimit >= 10000`  

b. Find the total of the balances for all customers represented by rep 15.  
`SELECT SUM(balance) FROM CUSTOMER WHERE repnum = 15`

c. List the category and the sum of the items on hand. Group the results by category.  
`SELECT Category, sum('item') 'OnHand' FROM item`
`SELECT Category, SUM(Price) FROM ITEM GROUP BY Category`

2. Using the Solmaris Condo data, write the following SQL queries:

a.	List the owner number and last name for all owners who live in Pennsylvania and Georgia.  
`SELECT OwnerNum, LastName FROM OWNERS WHERE Pennsylvania AND Georgia;`  
`SELECT OwnerNum, LastName FROM Owner WHERE State='PA' OR State='GA'`  

b.	List the largest Condo Fee for condos in location 2 with 2 or more bedrooms.
`SELECT MAX(CondoFee) FROM CondoUnit WHERE LocationNum=2 AND Bdrms=2`  

c. Delete any condos whose condo fee is less than 150. Insert your own data to test this statement.  
`INSERT INTO CondoUnit (CondoID, LocationNum, UnitNum, SqrFt, Bdrms, Baths, CondoFee, OwnerNum) VALUES (16, 2, 324, 400, 1, 1, 149, "STEVE")`
`DELETE FROM CondoUnit WHERE CondoFee < 150`  

3. Using the Colonial Adventure Tours, write the following SQL queries:  

a. List the reservation ID, customer number, customer last name, and customer first name for all trips that occur after July 1st, 2016.  
`SELECT Reservation.ReservationID, Reservation.CustomerNum, LastName, FirstName FROM Customer, Reservation WHERE Customer.CustomerNum=Reservation.CustomerNum AND Reservation.TripDate > 2016-07-01`

b. Use an update query to change the OtherFees value in the reservation table to $5.00 for all records on which the OtherFees value is 0 and the trip is of type hiking.  
`UPDATE Reservation SET Reservation.OtherFees = 5 WHERE Hiking.OtherFees = 0;`  
`SELECT ReservationID FROM Reservation INNER JOIN Trip ON Trip.TripID=Reservation.TripID AND Reservation.OtherFees=0 AND Trip.Type='Hiking'`  
`UPDATE Reservation INNER JOIN Trip ON Trip.TripID=Reservation.TripID AND Reservation.OtherFees=0 AND Trip.Type='Hiking' SET Reservation.OtherFees=5`  

c.	List the trip name and state for each trip that occurs during the summer season and sort by trip name within each sorted state.  
`SELECT TripName, State FROM Trip WHERE Season='Summer' ORDER BY State, TripName;`

4. An Employee has an employeeid, firstname, lastname, gender, dateofbirth, socialsecurity and can manage multiple projects which have a projectid, description, status, startdate and projectedenddate.  

a.	Write the SQL Script to create tables named EMPLOYEE and PROJECT given the description above. The names, gender, SSN, project status and project description are strings, the ids are numbers and the rest are dates. Use the appropriate SQL Data types. The PROJECT table has an additional column named Manager which will contain the ID of the employee which manages the project.  
```
CREATE DATABASE PROJECTMANAGEMENT;  
USE PROJECTMANAGEMENT;  
CREATE TABLE EMPLOYEE
(employeeid DECIMAL(10,0) PRIMARY KEY,
firstName CHAR(15),
lastName CHAR(15),
gender CHAR(1),
socialsecurity DECIMAL(9,0),
dateofbirth DATE);

CREATE TABLE PROJECT
(Manager DECIMAL(10,0),
stat CHAR(10),
projectid CHAR(10) PRIMARY KEY,
description CHAR(224),
startdate  DATE,
projectedenddate DATE);
```

b.	Given that the two tables have been created, write SQL statements to insert 2 records into the Employee table and 4 records into the Project table. Two of the projects must be managed by the same employee.  
```
INSERT INTO EMPLOYEE
VALUES
('001','Abrams','Miles','M','11122333','1990-1-1');
INSERT INTO EMPLOYEE
VALUES
('002','Jen','Orlando','F','777889999','1970-7-1');
INSERT INTO EMPLOYEE
VALUES
('003','Sara','Keller','F','444556666','1995-2-2');
INSERT INTO PROJECT
VALUES
('001','Complete','AAAAAAAAAA','Create Website','2012-6-3','2012-8-3');
INSERT INTO PROJECT
VALUES
('001','Open','BBBBBBBBBB','Mod Website','2012-8-3','2012-12-3');
INSERT INTO PROJECT
VALUES
('003','Complete','CCCCCCCCCC','Create Backend MVC','2012-6-3','2012-8-3');
INSERT INTO PROJECT
VALUES
('003','Pending','DDDDDDDDDD','Config AI to DB','2012-8-3','2012-12-3');
```

c.	Write a SQL statement to retrieve the first and last name of the employees which manage 2 or more projects. Hint: You need to bring the data from both tables together and aggregate on similar data.  
```
SELECT
  firstName,
  lastName,
  COUNT(PROJECT.Manager) AS Total
FROM
  EMPLOYEE
LEFT JOIN PROJECT ON EMPLOYEE.employeeid = PROJECT.Manager
GROUP BY EMPLOYEE.employeeid,EMPLOYEE.firstName
```

d.	Delete all the employees who have been born before Aug 1st, 1970 and have an SSN starting with 522. To verify the results, first insert some sample data to delete.  
```
SELECT firstName FROM EMPLOYEE WHERE dateofbirth < '1970-06-01' OR ( socialsecurity LIKE '522%');
DELETE FROM EMPLOYEE WHERE dateofbirth < '1970-06-01' OR ( socialsecurity LIKE '522%');
```

5. Create a SQL view to show the representatives from the TAL rep table that have over $22,000 of commission and have at least one customer. Make sure each representative only shows up once.  
```
SELECT FirstName, LastName, Commission FROM REP WHERE REP.Commission >= 20000
```
### Please help with this question, thank you.  
