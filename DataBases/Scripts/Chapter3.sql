--REMEMBER, EXECUTE EACH STATEMENT SEPARATELY TO LEARN WHAT IT DOES!!

--In case you are curious, we can
-- change the  fonts and colors for SQL Server Management studio
https://msdn.microsoft.com/en-us/ms173754.aspx

/*****************************************
  CREATING A TABLE AND INSERTING RECORDS
******************************************/

--DDL statements (Data Definition Languange)
-- Drop statement and Create statement

--Creating a table structure
create table Student
(
	studentNum char(9) not null primary key,
	FirstName varchar(50) not null,
	LastName varchar(50) not null,
	AddressLine1 varchar(250) not null,
	AddressLine2 varchar(250) null,
	birthdate date null,
	gpa decimal(8,2) null,
	createdOn datetime default(getdate()) -- The default statement defaults a value into the table
)

--inserting two records into the table
insert into Student
(studentNum, FirstName, LastName,AddressLine1,birthdate,gpa)
values
('000000001', 'Steve','Masters', '1234 West Drive','01/30/83',4.0)

insert into Student
(studentNum, FirstName, LastName,AddressLine1,birthdate,gpa)
values
('000000002', 'Jennifer','Masters', '1234 West Drive','04/30/83',4.0)

--Lets query the data we inserted
select * from student

/*********************
  DELETING RECORDS
**********************/

--Deleting records
--We can delete records with the delete command
--we  must usually use the delete command with  a where statement to
--identify  which records we want to delete

--this will delete only one record
delete from student where  studentnum ='000000002'

/*********************
  DROPPING TABLES
**********************/
--Drop statement removes table structure and and data (cannot be undone)
--lets execute the statement below to remove the entire student table
drop table student

/*********************
  BUILDING COMPLEX QUERIES
**********************/

--Working with the TAL database:

--Example of using a computation operation with numbers
select CreditLimit - balance as availablecredit  --"as" is a label we give to our output
from customer

--Example of using computation to concatenate a literal and a varchar data column
select 'Awesome ' + customername from customer

--Example of using an alias to rename a column and
--a condition with the WHERE clause
select customername as VIPName, Street as VIPStreet,*
 from customer
where Creditlimit > 7000

--Using an aggregate function AVG to calculate the average for the all the values in the query
select avg(balance) as avgbalance
 from customer
where Creditlimit > 7000


--Example of an inner query in combination with the IN statement.
--The inner query is execuated first.
select * from customer
where balance in
(select balance from customer
where balance > 1000)

--Example of  IN operator with a list of numbers
select customername,creditlimit,* from
customer where CreditLimit in (2000,7500,5001)

--Subqueries
select repnum,* from
customer where customername in ('Toys Galore','The Everything Shop')

--Not Operator
select * from customer where city != 'Fullton' and city != 'Mesa'

--between operator
select * from customer where balance between 575 and 935.75

select * from customer
where repnum in (select  repnum from rep where Commission >25000 )

--Using Wildcards!

---% in SQl Server is the wildcard for any characters, for any length
select * from customer
where customerName like '%Store%'

select * from customer
where city like 'F_llt_n'

select * from customer
where city like 'F%_l%'

select * from customer
where city ='F%_l%'

select * from customer
where customername like 'Cards%More'

--_ in SQL Server is the wildcard for any character, for a length of 1
select * from customer
where customerName like '_line''s'

-- RTRIM trims any spaces from the right side of a value, LTRIM trims any from the left side
select city, customername,
ltrim(rtrim(street))  as street
from customer
order by city asc,customername asc

/*********************
  UPDATING EXISTING DATA
**********************/

--UPDATE statement used to update a field based on a condition
update customer
set customername = 'Johnson''s Department Store2'
where customerNum = 386

/*********************
  AGGREGATE FUNCTIONS
**********************/

--Aggregate function COUNT gives the count of the records in the query
select count(*) from customer
where City = 'grove'

--Aggregate function AVG gives the average of the records in the query
select avg(balance) from customer
where City = 'grove'

-- Subquery
select * from orderline where itemnum in
(select itemnum from item where storehouse = 3)

/*********************
  GROUPING DATA
**********************/

--Group By

--The GROUP BY clause is used to group records by similar values, which in this case is grouping
--the customer records by the similar repnum. In addition, we are using
--the aggregate functions on the group for COUNT and SUM.
--Out of this record set, we use the HAVING clause to filter those records out whose count
--is greater or equal to 3
select count(*) as NumberOfCustomers,sum(balance) as TotalBalancePerRep,
repnum from customer
group by repnum
having count(*) >= 3

select count(*) as NumberOfCustomers,sum(balance) as TotalBalancePerRep,
repnum from customer
group by repnum
having sum(balance) > 7000

/***********************************
  WORKING SELECT INTO (MAKE A TABLE
*********************************/

--Using the make a table functionality. This creates a new table named ValerieCustomer
--when the INTO clause is used. Table must not exists.
select * into REP30Table
from customer
where repnum = 30

select * from rep30table


--The DROP statement will remove an entire object from the database (with all its data)
--BE CAREFUL! It is commented for safety, uncomment to use.
--DROP table rep30table

/*********************
  WORKING WITH JOINS
**********************/

--Common join using INNER JOIN
select customername, rtrim(rep.LastName) + ','
+ rep.FirstName as RepName
from customer inner join rep
on customer.repnum = rep.repnum


--Another Way to do a join, using a WHERE clause
select customername, rep.FirstName,Rep.lastName from customer, rep
where customer.repnum = rep.repnum

/*********************
  WORKING WITH UNIONS
**********************/

--Performing a UNION or UNION ALL with 2 result sets
select customername, rep.FirstName,Rep.lastName from customer, rep
where customer.repnum = rep.repnum
union all
select customername, rep.FirstName,Rep.lastName from customer, rep
where customer.repnum = rep.repnum and rep.repnum = 45



/*********************
  ADVANCED QUERY
**********************/

--Putting different commands together in one query
select
repnum,
count(*)as numberrecords,
avg(balance) as Balance,
sum(creditlimit) as CredSum
from customer
where CreditLimit > 7000
group by repnum
having count(*) > 3
order by balance



--GO is a keyword used by many SQL Editors and Parsers to separate batches. Can be used for scoping SQL statements together
https://msdn.microsoft.com/en-us/library/ms188037.aspx

--Example for MSDN
DECLARE @MyMsg VARCHAR(50)
SELECT @MyMsg = 'Hello, World.'
GO -- @MyMsg is not valid after this GO ends the batch.
-- Yields an error because @MyMsg not declared in this batch.
PRINT @MyMsg
GO


SELECT @@VERSION;
-- Yields an error: Must be EXEC sp_who if not first statement in
-- batch.
sp_who
GO
