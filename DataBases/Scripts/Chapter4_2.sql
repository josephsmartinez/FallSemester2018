

--Adding a Legal Value Constraints
alter table Celebrities
 add constraint chk_Tst check (id between 1 and 99999)

-- FOREIGN KEY CONSTRAINT

--Creating foreign key constraints
--Given that we have the customers table


drop table customerprofiles

CREATE TABLE dbo.CustomerProfiles
(
	ProfileId int NOT NULL PRIMARY KEY,
	UserName varchar(50) NOT NULL,
	ProfileCustomerNum char(3)
	constraint fk_customerNumber FOREIGN KEY (ProfileCustomerNum)
	REFERENCES Customer(CustomerNum)
)

--or through an alter
ALTER TABLE CustomerProfiles
ADD CONSTRAINT fk_profilecustomerNum
FOREIGN KEY (ProfileCustomerNum)
REFERENCES Customer(CustomerNum)


--SCHEMAS

--NOTE: Schemas are container for which objects belong to
-- For example, in the statement
select * from dbo.rep
--dbo is a schema (the default database owner schema)

--Schemas are useful to group objects together for administrative and management services
-- For example

GRANT SELECT ON SCHEMA :: dbo TO sqluser WITH GRANT OPTION

--Creating Schemas, further reading
http://technet.microsoft.com/en-us/library/dd207005.aspx


/*
Documentation for object catalog views can be found in MSDN
http://technet.microsoft.com/en-us/library/ms189783.aspx

The system catalog cotains information about the database. What
tables are in the database? What views have been defined?

*/

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

--STORED PROCEDURES
-- A stored procedure is an independt boody of logic that can be executed in the database
-- which can modify objects in the SQL database

--Add an additional column to the Celebrities table
alter table celebrities
add typeOfCar varchar(50)

alter table celebrities
drop column typeOfChar


drop procedure UpdateCelebrities
go
--why must we use GO?

--Creating a stored procedure to update our celebrities table
Create procedure UpdateCelebrities
(
   @FirstName varchar(500) = null,
   @Address varchar(500) ,
   @Income money,
   @MarriedToAKardasian bit,
   @IsBabyDaddyMommy bit,
   @lastName varchar(250),
   @TypeOfCar varchar(50)
)
As
Begin
	Print 'Entering our Update Procedure'

	if exists(select * from Celebrities where lastName = @lastName)
	Begin

		print 'Doing an update'

		--Update the fields
		update Celebrities
		set firstName = isnull(@FirstName,firstname),
		Address = @Address,
		Income =  @Income,
		MarriedToAKardasian = @MarriedToAKardasian,
		IsBabyDaddyMommy = @IsBabyDaddyMommy,
		TypeOfCar = @TypeOfCar

		where lastName = @lastName

	End
	else
	Begin

		print 'Doing an insert'

		--Insert a new record
		--Insert the values into the Celebrities table
		insert into Celebrities
		(firstName,Address,Income,MarriedToAKardasian,
		IsBabyDaddyMommy,lastName,TypeOfCar)
		values
		(@FirstName,@Address,@Income,@MarriedToAKardasian,
		@IsBabyDaddyMommy,@lastName,@TypeOfCar)
	end
End
--End of UpdateCelebrities
GO


--Execute our UpdateCelebrities Stored Procedure
exec UpdateCelebrities
@Address = '9232 Star Island',
@Income = 500000,
@MarriedToAKardasian = 1,
@IsBabyDaddyMommy = 0 ,
@lastName = 'FilthyRich'
@TypeOfCar = 'Porsche'



select * from Celebrities




--Create an SP to Delete a record on a particular field
Create procedure DeleteCelebrities
(
	@LastName varchar(250)
)
As
Begin
	delete from Celebrities
	where lastName = @LastName

End
GO


exec dbo.DeleteCelebrities @lastName = 'FilthyRich'
