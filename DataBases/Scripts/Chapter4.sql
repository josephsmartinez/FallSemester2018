/*********************
  CREATING TABLES
**********************/

--Creating a table is done with the create table command.
--When we create a table we need to indetify the data types

--Lets create a celebrities table
--Create the celebrities table with a primary key amd itentity column
create table Celebrities
(
    id int,
	firstName varchar(250) not null,
	lastName varchar(250) not null,
	Address varchar(500) null,
	Income money null,
	ownsAirplane bit,
	CONSTRAINT PK_Int PRIMARY KEY (id)
)
GO


insert into celebrities
values
(1, 'Johnny','Utah','12342', 500000,0),
(2, 'Tim','Flyer','12342', 500000,1)

--If we want to remove an entire table structure and all its data, we use the DROP
--command

--Example:
drop table Celebrities --NOTE: This will remove the entire table

--After the table is dropped, recreate the table

/*********************
  WORKING WITH VIEWS
**********************/

--Views are objects that you can query just like tables, but they are essentially
--a stored query.

--Creating a View
create view PilotCelebrities
as
(
	select * from Celebrities
	where ownsAirplane = 1
)
GO

--Should only show Tim Flyer
select * from PilotCelebrities

/*********************
  WORKING WITH INDEXES
**********************/
select * from celebrities


-- Indexes are created in the database to speed up retrieval when queries
-- involve certain columns

--Creating indexes
--Single Column
create index idx_Celeb_lastName
on Celebrities (lastname)
go

--drop the index
drop index idx_celeb_lastname on celebrities


--Multiple Column index
create index idx_lastName2
on celebrities (firstname,lastname)

/***************************************
  WORKING WITH LEGAL VALUE CONSTRAINTS
***************************************/

-- Legal value constraints: There are constraints that we place on our
--table columns to only allow certain values

--only allow the income to be between 1 and 999999
alter table Celebrities
add constraint chk3_Income check (income between 1 and 999999  )

--another wayt to write the constraint
alter table Celebrities
add constraint chk4_Income check (income > 1 and income < 999999  )

--Example of a table creation with a legal value constraint
CREATE TABLE Products_2
(
    ProductID int PRIMARY KEY,
    UnitPrice money,
    CONSTRAINT CK_UnitPrice2 CHECK(UnitPrice > 0 AND UnitPrice < 100)
)
GO

/**********************************
  WORKING WITH TABLE MODIFICATIONS
***********************************/

--Modifying a column in the celebrities table to another data type
alter table celebrities
alter column middlename char(50)


--Drop the Primary Key from a table
alter table Celebrities
drop pk_INT

--Add a column to a table
alter table celebrities
add IsCEO bit

--Drop a column from a table
alter table celebrities
drop column IsCEO

--Alter the data type
alter table celebrities
alter column lastName varchar(500) null

--rename column (must be done with system procedure sp_Rename)
sp_rename 'celebrities.middlename' ,'mname'

/*****************************
  WORKING WITH FOREIGN KEYS
******************************/

-- FOREIGN KEY CONSTRAINT

--Creating foreign key constraints
--Given that we have the customers table, lets create a customer profile
--table to hold profile information for the customer.
--This table must be created on the sames database where the customer table resides (TAL)

CREATE TABLE dbo.CustomerProfiles
(
	ProfileId int NOT NULL PRIMARY KEY,
	UserName varchar(50) NOT NULL,
	ProfileCustomerNum char(3)
	constraint fk_customerNumber FOREIGN KEY (ProfileCustomerNum)
	REFERENCES Customer(CustomerNum)
)

select * from Customer

--this insert should fail, customer 777 does not exist
insert into CustomerProfiles
(profileId, username, ProfileCustomerNum)
values
(1,'user1',777)

--this insert should be successful, customer 126 does exists
insert into CustomerProfiles
(profileId, username, ProfileCustomerNum)
values
(1,'user1',126)

--this insert should be successful, nulls are allowed with FKS
insert into CustomerProfiles
(profileId, username, ProfileCustomerNum)
values
(2,'user2',null)

--Creating a Foreign Keys through an Alter statement
ALTER TABLE CustomerProfiles
ADD CONSTRAINT fk_profilecustomerNum
FOREIGN KEY (ProfileCustomerNum)
REFERENCES Customer(CustomerNum)



/*****************************
  WORKING WITH SCHEMAS
******************************/

--NOTE: Schemas are container for which objects belong to
-- For example, in the statement
select * from dbo.rep
--dbo is a schema (the default database owner schema)

--Schemas are useful to group objects together for administrative and management services
-- For example

GRANT SELECT ON SCHEMA :: dbo TO sqluser WITH GRANT OPTION

--Creating Schemas, further reading
http://technet.microsoft.com/en-us/library/dd207005.aspx


/*****************************
  WORKING WITH SYSTEM CATALOG
******************************/
--The object catalog is a set of system objects in the database that describe all
--the user objects that have been created


--System Catalog sample Queries
--sysobjects
--syscolumns
--sysconstraints
--sysforeignkeys

--Retrieve all the tables in the database
select * from sys.tables

--Objects that belong to schemas
select * from sys.objects

--Xtype U - User tables
select xtype,name,* from sysobjects
where xtype = 'U'

--Xtype V - Views
select xtype,name,* from sysobjects
where xtype = 'V'

--Select all the columns that are in the Customer table
select * from sys.columns
where object_id in (select id from sysobjects
where name = 'Customer')

--select information on the views
SELECT name AS view_name,
   schema_id
  ,SCHEMA_NAME(schema_id) AS schema_name
  ,create_date
  ,modify_date
FROM sys.views;

--Select all the tables that dont have a primary key
SELECT SCHEMA_NAME(t.schema_id) AS schema_name
    ,t.name AS table_name
FROM sys.tables t
WHERE object_id NOT IN
   (
    SELECT parent_object_id
    FROM sys.key_constraints
    WHERE type_desc = 'PRIMARY_KEY_CONSTRAINT' -- or type = 'PK'
    );

--Select all the Primary keys in the DB
 SELECT parent_object_id,*
    FROM sys.key_constraints
    WHERE type_desc = 'PRIMARY_KEY_CONSTRAINT'

--Find the  SP in the database
SELECT name AS procedure_name
    ,SCHEMA_NAME(schema_id) AS schema_name
    ,type_desc
    ,create_date
    ,modify_date
FROM sys.procedures;


/*****************************
  WORKING WITH USER DEFINED FUNCTIONS
******************************/

-- User Defined functions allow us to create logic that operates on data in the query

create function dbo.DatePlus30days
(
	@currentDate datetime
) returns datetime
as
begin
	declare @returnDateTime datetime
	select @returnDateTime = dateadd(day, 30, @currentDate)
	return @returnDateTime
end
go

--Call the function in your query and pass in data
select dbo.DatePlus30days('09/14/16')
