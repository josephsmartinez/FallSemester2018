# TAL Distributors Exercises

## Question 1 Rafael Serrano, Andres Ruiz, Michael Rodriguez, Richard Orfao
1. Using your knowledge of TAL Distributors, determine the functional dependencies that exist in the following table. After determining the functional dependencies, convert this table to an equivalent collection of tables that are in third normal form.


### Old Table:
```Item (ItemNum, Description, OnHand, Category, Price, (OrderNum, OrderDate, CustomerNum, CustomerName, RepNum, LastName, FirstName, NumOrdered, QuotedPrice))
```
### Dependencies:
```
ItemNum -> Description, Category, Price, OnHand
OrderNum -> CustomerNum, CustomerName, OrderDate
RepNum -> LastName, Firstname
CustomerNum ->CustomerName
ItemNum, OrderNum -> NumOrdered, QuotedPrice
```
### New Tables:
```Item (ItemNum, Description, OnHand, Category, Price)
Orders(OrderNum,OrderDate)
OrderLine (OrderNum, OrderDate, ItemNum, CustomerNum, QuotedPrice, NumOrdered)
Customer (CustomerNum, RepNum, CustomerName)
Rep (RepNum, LastName, FirstName)
```

## Question 2  Nick and Ellwood
2. List the functional dependencies in the following table that concern invoicing (an application TAL Distributors is considering adding to its database), subject to the specified conditions. For a given invoice (identified by the Invoice-Num), there will be a single customer. The customer’s number, name, and complete address appear on the invoice, as does the date. Also, there may be several different items appearing on the invoice. For each item that appears, display the item number, description, price, and number shipped. Each customer that orders a particular item pays the same price. Convert this table to an equivalent collection of tables that are in third normal form.

### Dependencies:
```InvoiceNum -> CustomerNum, Lastname, Firstname,City, State, Zipcode, Date
ItemNum-> Description, Price
```
### New Table:
```Items ( itemNum, Description, OnHand, Category, Price)
Orders (CustomerNum, itemNum, OrderNum, OrderDate, NumOrdered, QuotedPrice)
Customer (CustomerName,CustomerNum, RepNum, LastName, FirstName)
```


## Question 3  Joseph M, Josh S, Stuart Simmons, David C
3. The requirements for TAL Distributors have changed.
A number and a name now identify each storehouse. Units of each item may be stored in multiple storehouses, and it is important to know precisely how many items are stored in each storehouse. In addition, TAL Distributors now wants to manage information about the suppliers from which it purchases items. For each item, TAL Distributors needs to know the number and name of each supplier as well as the expected lead time for delivering each item. (Lead time is the amount of time a supplier is expected to take to deliver the item after TAL Distributors has ordered it.) Each item can have many suppliers, and each supplier can supply many items. Using this information, convert the following unnormalized relation to fourth normal form:

### Dependencies:
```ItemNum -> Description, Category, Price
StorehouseNum -> StorehouseName, OnHand
SupplierNum -> SupplierName, LeadTime
```
### Old Table:
```Item (ItemNum, Description, Category, Price, (StorehouseNum, StorehouseName, OnHand), (SupplierNum, SupplierName, LeadTime))
```
### New Table:
```Item (itemNum Description, SupplierName, Category, Price)
Supplier (ItemNum, SupplierNum,LeadTime, SupplierName, Description)
StoreHouse(StorehouseNum , StorehouseName, OnHand)
```

## Question 4  Nick Carballo
4. What changes would you need to make to the normalized tables in Exercise 3 to support the following additional requirements:

- a. TAL needs to keep track of the price a supplier charges for an item. Different suppliers can charge different prices for the same item.
Add an additional field to the Supplier table named SupplierPrice.
```Supplier (ItemNum, SupplierNum,LeadTime, SupplierName, Description,SupplierPrice)
```
- b. Each storehouse has a manager who is identified by a manager number, a manager last name, and a manager first name.
Add a new table called Manager.  This would have manager number, a manager last name, and a manager first name.  
You then would add ManagerNumber to the Storehouse table.
```StoreHouse(StorehouseNum , StorehouseName,ManagerNum, OnHand)
```
## Question 5 Nick Carballo
5. TAL Distributors is considering changing its business model so that many sales reps can represent one customer and one sales rep can represent many customers. Using this information, convert the following unnormalized relation to fourth normal form.

### Old Tables:
```Customer (CustomerNum, CustomerName, Street, City, State, PostalCode,
Balance, CreditLimit, (RepNum, LastName, FirstName, Street, City, State, PostalCode, Commission, Rate))
```
###New Tables:
```
Rep(Repnum,Lastname, FirstName, Street, City,State,PostalCode, Commision,Rate)

Customer(CustomerNum,CustomerName,Street,City,State,PostalCode,CreditLimit,Balance)
CustomerAccount (CustomerNum,RepNum, CreditLimit,balance)
```

## Question 6 Michael Rodriguez, Richard Orfao, Andres Ruiz
6. Convert the following unnormalized relation to fourth normal form using the same requirements as in Question 5  

**(many sales reps can represent one customer and one sales rep can represent many customers)**.  
```
Rep (RepNum, LastName, FirstName, Street, City, State, PostalCode,
Commission, Rate, (CustomerNum, CustomerName, Street, City, State, PostalCode, Balance, CreditLimit))
```

4NF:      
```
Rep (RepNum, Lastname, Firstname, Street City, State, PostalCode, Rate)
Customer (CustomerNum, CustomerName, Street, City, State, PostalCode)
CustomerAcct (CustomerNum, RepNum, CreditLimit, Balance)    
RepComission (RepNum, CustomerNum, Commision)
```

# Colonial Adventure Tours Case
## Question 1
1. Using the types of entities found in the Colonial Adventure Tours database (trips, guides, customers, and reservations), create an example of a table that is in first normal form but not in second normal form and an example of a table that is in second normal form but not in third normal form. In each case, justify your answers and show how to convert to the higher forms.

- Step1:
Creating an example table in the 1st normalization form, with no repeating groups:
```
Reservation (ReservationID, TripID, TripDate, TripName, StartLocation, Distance, MaxGrpSize, Type, Season, NumPersons, TripPrice, OtherFees, CustomerNum, LastName, FirstName, Address, City, State, PostalCode, Phone, GuideNum, GuideLastName, GuideFirstName, GuideAddress, GuideCity, GuideState, GuidePostalCode, PhoneNum, HireDate)
```

- Step2:
Converting into the 2nd normalization form. Identifying the primary keys for each subset:
```
(CustomerNum,
(ReservationID,
(TripID,
(GuideNum,
````
Regrouping the Columns as per dependencies:  
```
(CustomerNum, LastName, FirstName, Address, City, State, PostalCode, Phone)
(ReservationID, TripID, TripDate, NumPersons, TripPrice, OtherFees, CustomerNum)
(TripID, TripName, StartLocation, Distance, MaxGrpSize, Type, Season)
(GuideNum, GuideLastName, GuideFirstName, GuideAddress, GuideCity, GuideState, GuidePostalCode, PhoneNum, HireDate)
```
Assigning the names for newly assigned tables and renaming the required fields:  
```
Customer (CustomerNum, LastName, FirstName, Address, City, State, PostalCode, Phone)
Reservation (ReservationID, TripID, TripDate, NumPersons, TripPrice, OtherFees, CustomerNum)
Trip (TripID, TripName, StartLocation, Distance, MaxGrpSize, Type, Season)
Guide (GuideNum, LastName, FirstName, Address, City, State, PostalCode, PhoneNum, HireDate)
```
Each table is containing a primary key, with no grouping values

- Step3:
Converting to the 3rd normalization form and creating new tables and naming these tables and put the entire collection together, giving the following: Also creating a new table TripGuides, for linking between Trip and Guide tables:
```
Customer (CustomerNum, LastName, FirstName, Address, City, State, PostalCode, Phone)
Reservation (ReservationID, TripID, TripDate, NumPersons, TripPrice, OtherFees, CustomerNum)
Trip (TripID, TripName, StartLocation, Distance, MaxGrpSize, Type, Season)
Guide (GuideNum, LastName, FirstName, Address, City, State, PostalCode, PhoneNum, HireDate)
TripGuides (TripID, GuideNum)
```

As you see the TripGuides table the coulmns TripID, GuideNum are showing multivalued dependency hence the 4th normalization form has been achieved.

## Question 2
2. Colonial Adventure Tours is considering changing the way it handles reservations. Instead of storing the number of persons associated with one reservation, the company would like to store the name and address of each person associated with each reservation. If Colonial Adventure Tours decides to implement this change, the trip price and other fees amount for each trip would be dependent on only the trip ID. Determine the multivalued dependencies in the following table, and then convert this table to an equivalent collection of tables that are in fourth normal form.
```
Reservation (ReservationID, TripID, TripDate, TripPrice, OtherFees, (CustomerNum, CustomerLastName, CustomerFirstName, Address, City, State, PostalCode, Phone))
```
- Step1:
Breaking the group of Columns to create 1st normalization form.
```
Reservation (ReservationID, TripID, TripDate, TripPrice, OtherFees, CustomerNum, CustomerLastName, CustomerFirstName, Address, City, State, PostalCode, Phone).
```
- Step2:
Converting into the 2nd normalization form. Identifying the primary keys for each subset:
```
(ReservationID,
 (CustomerNum,
(TripID,
```
Regrouping the Columns as per dependencies:
```
(ReservationID, TripDate, TripPrice, OtherFees, CustomerNum, TripID)
(CustomerNum, CustomerLastName, CustomerFirstName, Address, City, State, PostalCode, Phone)
(TripID, CustomerNum)
Assigning the names for the newly assigned tables, renaming the necessary fields;
Reservation (ReservationID, TripDate, TripPrice, OtherFees, CustomerNum, TripID)
Customer (CustomerNum, CustomerLastName, CustomerFirstName, Address, City, State, PostalCode, Phone)
CustomerTrip (TripID, CustomerNum)
```
- Step3:
Converting to the 3rd normalization form and creating new tables and naming these tables and put the entire collection together, giving the following:
```
Reservation (ReservationID, TripDate, TripPrice, OtherFees, CustomerNum, TripID)
Customer (CustomerNum, CustomerLastName, CustomerFirstName, Address, City, State, PostalCode, Phone)
CustomerTrip (TripID, CustomerNum)
```
As we can see the above tables were already in 4th normal form; CustomerTrip is containing multivalued columns, both are satisfying multivalued dependency. Hence we can say that, the 4th normalization has been achieved.

## Question 3
3. Identify the functional dependencies in the following un-normalized table. Convert the table to third normal form. Is the result also in fourth normal form? Why or why not?
```
Trip (TripID, TripName, StateAbbreviation, StateName, (GuideNum, GuideLast, GuideFirst))
```
- Step1:
Breaking the group of Columns to create 1st normalization form.
```
Trip (TripID, TripName, StateAbbreviation, StateName, GuideNum, GuideLast, GuideFirst)
```
- Step2:
Converting into the 2nd normalization form. Identifying the primary keys for each subset:
```
(TripID,
(GuideNum,
```
Regrouping the Columns as per dependencies:
```
(TripID, TripName, StateAbbreviation, StateName)
(GuideNum, GuideLast, GuideFirst)
```
Assigning the names for the newly assigned tables, renaming the necessary fields:
```
Trip (TripID, TripName, StateAbbreviation, StateName)
Guide (GuideNum, GuideLast, GuideFirst)
```
- Step3:
Converting to the 3rd normalization form and creating new tables and naming these tables and put the entire collection together, giving the following: Also creating a new table called TripGuides for linking between Trip and Guide tables:
```
Trip (TripID, TripName, StateAbbreviation, StateName)
Guide (GuideNum, GuideLast, GuideFirst)
TripGuide (TripID, GuideNum)
```
Dependencies are:
```
TripGuide.TripID -> Trip.TripID
TripGuide.GuideNum -> Guide.GuideNum
Trip table:
TripID -> TripName
Guide table:
GuideNum -> (GuideLast, GuideFirst)
```
After converting into the 3rd normalization form the result will also satisfy the 4th normalization form’s rule of multivalued dependency. The columns TripID and GuideNum are dependent with the other tables. However, their occurrences were not the same in two tuples. Hence we can say that the end result of the 3rd normalization form is also in the 4th normalization form.

## Question 4
4.	Currently, each trip is identified with only season. For example, the Arethusa Falls trip is offered only in the Summer season. Colonial Adventure Tours is considering offering the same trip in more than one season; that is, the Arethusa Falls trip could be offered in both the Summer and Late Spring seasons. Using this new information, identify all dependencies and convert the current Trip table to third normal form. You may need to make some assumptions. Identify these assumptions in your solution.
We have the functional dependency notation:
```
(TripID -> TripName, StartLocation, State, Distance, MaxGrpSize, Type)
(SeasonNum -> Season)
Second Anomolies resolved: (SeasonNum, TripID)
```
And the relation list is as follow:
```
Trip (TripID, TripName, StartLocation, State, Distance, MaxGrpSize, Type)
Season (SeasonNum, Season)
TripSeason (SeasonNum, TripID)
```
Assumptions: In the above relations only the values of the TripID and Season would be repeated to show all of the seasons which the trip is organized. This is compulsory redundancy. Table TripSeason contains foreign keys SeasonNum and TripID for maintaining the many to many relationships with the table Trip. As a trip could be more than one season as well as it is assumed that there could be more than one trip organized in a season.

# Solmaris Condominium Group Case
## Question 1
1. Using the types of entities found in the Solmaris Condominium Group database (condo locations, owners, condo units, service categories, and service requests), create an example of a table that is in first normal form but not in second normal form and an example of a table that is in second normal form but not in third normal form. In each case, justify your answer and show how to convert to the higher forms.
```
ServiceID	CondoID	CategoryNum	Description	      Status	 EstHrs	SpentHrs NextServiceDate
1	        2	      1	          Plumbing	      Done   	 4	      4	       Nil
1	        2	      2	          Heating/AC	  Running	 3	      2	       10-16-2015
2	        5	      6	          Janitorial	  Not Done   1	      0	       10-19-2015
3	        4	      4	          Electrical	  Running	 2	      1	       10-16-2015
3	        4	      5	          Carpentry	      Running	 4	      3	       10-19-2015
4	        1	      1	          Plumbing	      Done	     5	      5	       Nil
5	        2	      2	          Heating/AC	  Not Done   3	      0        10-19-2015
```
The table above is in 1st normal form. Because there are two repeated values in the primary key ServiceID, the primary key must be a composite key of two attributes: ServiceID and CategoryNum.   

2nd normal form
A table is in the second normal form when it is in first normal form and there is only one determinant in the table. In the table above, the determinants are: ServiceID, and CategoryNum. So, the table must be decomposed into two:  
```
CategoryNum	Description	    Status	     EstHrs	  SpentHrs	NextServiceDate
1	          Plumbing	    Done	     4	      4	        Nil
2	          Heating/AC	Running	     3        2	        10-16-2015
6	          Janitorial	Not Done	 1	      0	        10-19-2015
4	          Electrical	Running	     2	      1        	10-16-2015
5	          Carpentry	    Running	     4	      3	        10-19-2015
1	          Plumbing	    Done	     5	      5       	Nil
2	          Heating/AC	Not Done     3	      0	        10-19-2015
```
```
ServiceID	CondoID	CategoryNum
1	        2	      1
1	        2     	  2
2	        5	      6
3	        4	      4
3	        4	      5
4	        1	      1
5	        2     	  2
```
## Question 2
2. Determine the functional dependencies that exist in the following table, and then convert this table to an equivalent collection of tables that are in third normal form:  
`Location (LocationNum, LocationName, (UnitNum, SqrFt, Bdrms, Baths, CondoFee))`
These are the dependencies that exist in the table:  
```
LocationNum -> LocationName
UnitNum -> SqrFt, Bdrms, Baths
LocationNum, UnitNum -> CondoFee
```
After decomposing the table, there should be no functional dependencies so each one is in its third normal form. It is assumed that the condo fee is according to the location as well as units.
```
Location (LocationNum, LocationName)
Unit (SqrFt, Bdrms, Baths)
FeeAcLocationAndUnit (LocationNum, UnitNum, CondoFee)
```
## Question 3
3. Determine the functional dependencies that exist in the following table, and then convert this table to an equivalent collection of tables that are in third normal form:  
```
CondoUnit (CondoID, LocationNum, UnitNum, SqrFt, Bdrms, Baths,
CondoFee, OwnerNum, LastName, FirstName)
```
These are the dependencies that exist in the table:  
```
OwnerNum -> LastName, FirstName
UnitNum -> SqrFt, Bdrms, Baths
LocationNum, UnitNum, CondoID -> CondoFee
```
After decomposing the table, there should be no functional dependencies so each one is in its third normal form. It is assumed that the condo fee is according to the location as well as unit. Each unit has an owner and there could be the same owner for more than one unit.
```
Owner (OwnerNum, LastName, FirstName)
Unit (SqrFt, Bdrms, Baths)
FeeAcLocationAndUnit (CondoID, LocationNum, UnitNum, CondoFee, OwnerNum)
```
## Question 4
4. Solmaris is considering adding tenant information to the database. A tenant is the person occupying a condo; this person may or may not be the condo’s owner. Determine the functional dependencies that exist in the following table, and then convert this table to an equivalent collection of tables that are in third normal form:
```
CondoUnit (CondoID, LocationNum, UnitNum, SqrFt, Bdrms, Baths,
CondoFee, OwnerNum, OwLastName, OwFirstName, TenantNum,
TnLastName, TnFirstName)
```
These are the dependencies that exist in the table:
```
OwnerNum -> OwLastName, OwFirstName
TenantNum -> TnLastName, TnFirstName
UnitNum -> SqrFt, Bdrms, Baths
LocationNum, UnitNum, CondoID -> CondoFee
```
After decomposing the table, there should be no functional dependencies so each one is in its third normal form. It is assumed that the condo fee is according to the location as well as unit. Each unit has an owner and there could be the same owner or tenant for more than one unit. A tenant may or may not be same as owner.
```
Owner (OwnerNum, OwLastName, OwFirstName)
Tenant (TenantNum, TnLastName, TnFirstName)
Unit (SqrFt, Bdrms, Baths)
FeeAcLocationAndUnit (CondoID, LocationNum, UnitNum, CondoFee, OwnerNum, TenantNum)
```
## Question 5
5. What type of relationship exists between tenants and condos? Why? What type of relationship exists between tenants and owners? Why?

### Between Tenants and Condos
**Relationship**  
There is a many to one relationship  
**Reason**  
- Because there could be many condos under a tenant, but no condo may have more than one tenant.  
- CondoID may not be used in the table Tenant as foreign key but TenantNum is to be used in the table Condo Unit. TenantNum would be functionally dependent on CondoID.

### Relationship between Tenants and Owner
**Relationship**
- There is a one to one relationship  
**Reason**
- The above relationship exists because a condo can have one owner and one tenant.
- A tenant could be owner, so that the attribute IsOwner could be included in the table Tenant for specifying if the tenant is owner or not. If it occurs, then the TenantNum is same as OwnerNum.


<hr>
# Review Questions Chapter Six

##Chapter Key Definitions  
### artificial key
### bottom-up design method
Bottom-up design method in which specific user requirements
are synthesized into a design
### cardinality
### category
### complete category
### composite entity
### cumulative design
### Database Design Language (DBDL)
### entity-relationship (E-R) model
### entity subtype
### existence dependency
### IDEF1X
### identifying relationship
A relationship that is necessary for identification
### incomplete category
### independent entity
### information-level design
Database designers design a database that satisfies the organization’s requirements as cleanly as possible
### intelligent key
### mandatory role
### logical key
### many-to-many relationship
### many-to-many-to-many relationship
Multiple records in one table are related to multiple records in another table.
### nonidentifying relationship
A relationship that is not necessary for identification
### natural key
### one-to-many
The One-to-Many relationship is defined as a relationship between two tables where a row from one table can have multiple matching rows in another table. This relationship can be created using Primary key-Foreign key relationship.
### one-to-one relationship
One-to-one relationship implemented by including the primary key of each table as a foreign key in the other
### physical-level design
Designers adapt the information-level design for the specific DBMS that the
organization will use. During the physical-level design, designers must consider the characteristics of the particular DBMS
that the organization will use.
### optional role
### secondary key
### synthetic key
### surrogate key
### top-down design method
Begins with a general database design that models the overall enterprise and repeatedly refines the model to achieve a design that supports all necessary applications
### weak entity
### user view

1. Define the term **user view** as it applies to database design.
- A user view is the set of requirements that is necessary to support the operations of a particular database user.

2. What is the purpose of breaking down the overall design problem into a consideration of individual user views?
- working on individual user views is usually more manageable than attempting to turn the design of the entire database into one large task.

3. Under what circumstances would you not need to break down an overall design into a consideration of individual user views?
- When the view does not support the users, and the data will not be merged into the cumulative design that supports all the user views during the design process.

4. The information-level design method presented in this chapter contains steps that must be repeated for each user view. List the steps and briefly describe the kinds of activities that must take place at each step.
### For each user view, the information-level design method requires you to complete the following steps:
1. Represent the user view as a collection of tables.
2. Normalize these tables.
3. Identify all keys in these tables.
4. Merge the result of Steps 1 through 3 into the cumulative design.

5. Describe the function of each of the following types of keys: `primary, alternate, secondary, and foreign.`
### Primary Key:
The attribute or combination of attributes that uniquely identifies a row or record in a relation is known as primary key.
Single key that is unique and not-null.
### Secondary key:
A field or combination of fields that is basis for retrieval is known as secondary key. Secondary key is a non-unique field. One secondary key value may refer to many records.
### Candidate Key or Alternate key:
A relation can have only one primary key. It may contain many fields or combination of fields that can be used as primary key. One field or combination of fields is used as primary key. The fields or combination of fields that are not used as primary key are known as candidate key or alternate key.
### Foreign Key:
A foreign key is an attribute or combination of attribute in a relation whose value matches a primary key in another relation. The table in which foreign key is created is called as dependent table. The table to which foreign key is refers is known as parent table. Foreign Key value must match an existing value in the parent table or be NULL.

[Difference between primary, alternate, secondary, and foreign](http://cstechpause.blogspot.com/2014/10/difference-between-primary-key.html)

6. Suppose a given user view contains information about employees and projects. Suppose further each employee has a unique EmployeeNum and each project has a unique ProjectNum. Explain how you would implement the relationship between employees and projects in each of the following scenarios:

a. Many employees can work on a given project, but each employee can work on only a single project.
`EmployeeNum -> ProjectNum`
`
b. An employee can work on many projects, but each project has a unique employee assigned to it.
`ProjectNum -> EmployeeNum`

c. An employee can work on many projects, and a project can be worked on by many employees.
`No dependencies would exist (Many to Many)`

7. A database at a college is required to support the following requirements. Complete the information-level design for this set of requirements. Use your own experience to determine any constraints you need that are not stated in the problem. Represent the answer in DBDL.

a. For a department, store its number and name.
```
Department ( DeptNum, DeptName)
```
b. For an advisor, store his or her number and name and the number of the department to which he or she is assigned.
```
Department ( DeptNum, DeptName )
Advisor  ( DeptNum, AdvisorNum, Name )
```
c. For a course, store its code and description (for example, MTH110 or Algebra).
```
Department ( DeptNum, DeptName )
Advisor  (AdvisorNum, Name, DeptNum )
Course ( CourseCode, Description, DeptNum )
```
d. For a student, store his or her number and name. For each course the student has taken, store the course code, course description, and grade received. In addition, store the number and name of the student’s advisor. Assume that an advisor may advise any number of students but that each student has just one advisor.
```
Department ( DeptNum, DeptName )
Advisor  (AdvisorNum, AdvisorNumName, DeptNum )
Course ( CourseCode, CourseDescription, DeptNum)
Student ( StudentNum, StudentName, CourseCode, CourseDescription, Grade, AdvisorNum, AdvisorNumName )
```

8. List the changes you would need to make in your answer to Question 7 if a student could have more than one advisor.
- We would need and **One to Many** relationship. To create a one-to-many relationship, include the primary key of the “one” table as a foreign key in the “many” table
```
Department ( DeptNum, DeptName )
Advisor  (AdvisorNum, AdvisorNumName, DeptNum, StudentNum, StudentName)
Course ( CourseCode, CourseDescription, DeptNum)
Student ( StudentNum, StudentName, CourseCode, CourseDescription, Grade, AdvisorNum, AdvisorNumName )

```

9. Suppose in addition to the requirements specified in Question 7, you must store the number of the department in which the student is majoring. Indicate the changes this would cause in the design in the following two situations:

a. The student must be assigned an advisor who is in the department in which the student is majoring.
```
Department ( DeptNum, DeptName )
Advisor  (AdvisorNum, AdvisorNumName, DeptNum, StudentNum, StudentName)
Course ( CourseCode, CourseDescription, DeptNum )
Student ( StudentNum, StudentName, CourseCode, CourseDescription, Grade, DeptNum, AdvisorNum, AdvisorNumName )
```
b. The student’s advisor does not necessarily have to be in the department in which the student is majoring.

10. Illustrate the physical-level design process by means of the design shown in Question 7. List the tables, identify the keys, and list the special restrictions that programs must enforce.
### For each user view, the information-level design method requires you to complete the following steps:
1. Represent the user view as a collection of tables.
```
Department ()
Advisor ()
Course ()
Student ()
```
2. Normalize these tables.
```
Department (DeptNum)
Advisor (AdvisorNum)
Course (CourseCode)
Student (StudentNum)
```
3. Identify all keys in these tables.
```
Department (DeptNum)
Advisor (AdvisorNum, DeptNum)
Course (CourseCode, DeptNum)
Student (StudentNum, AdvisorNum, CourseCode )
```
4. Merge the result of Steps 1 through 3 into the cumulative design.
```
Department ( DeptNum, DeptName )
Advisor  (AdvisorNum, AdvisorNumName, DeptNum )
Course ( CourseCode, CourseDescription, DeptNum)
Student ( StudentNum, StudentName, CourseCode, CourseDescription, Grade, AdvisorNum, AdvisorNumName )
```
11. Is the database design method top-down or bottom-up? How can you modify this method to gain the advantages to both types of design methods?

- Both strategies have their advantages. The top-down approach lends a more global feel to the project; you at least have some idea where you are headed, which is not so with a strictly bottom-up approach. On the other hand, a bottom-up approach provides a rigorous way of tackling each separate requirement and ensuring that it will be met.

- The requirement from question 7 were given requirement-by-requirement and thus was an example of a bottom-up approach

- After completing the steps for a top-down approach, we can then apply the bottom-up method for examining individual user views.

12. Describe the different ways of implementing one-to-one relationships. Assume you are maintaining information on:
**offices (office numbers, buildings, and phone numbers)**  
**faculty (numbers and names)**  
- No office houses more than one faculty member.  
- No faculty member is assigned more than one office.  

Illustrate the ways of implementing one-to-one relationships using offices and faculty. Which option would be best in each of the following situations?

a. A faculty member must have an office, and each office must be occupied by a faculty member.
- Any time two tables have the same primary key and are joined by a foreign key, a one-to-one relationship exists.
```
offices (officeNumbers, buildings, phoneNumbers)  
faculty (facultyNumbers, names, officeNumbers)

offices (officeNumbers, buildings, phoneNumbers, facultyNumbers)  
faculty (facultyNumbers, names,)
```

b. A faculty member must have an office, but some offices are not currently occupied. You must maintain information about the unoccupied offices in an Office relation.
```
offices (officeNumbers, buildings, phoneNumbers)  
faculty (facultyNumbers, names, officeNumbers)
```

c. Some faculty members do not have an office, but all offices are occupied.
```
offices (officeNumbers, buildings, phoneNumbers, facultyNumbers)  
faculty (facultyNumbers, names,)
```
d. Some faculty members do not have an office, but some offices are not occupied.
```
offices (officeNumbers, buildings, phoneNumbers, facultyNumbers, names)  
```

13. For each of the following collections of relations, give the assumptions concerning the relationship between:**students, courses, and faculty members** that are implied by the collection. In each relation, only the primary keys are shown.

a. Student (StudentNum, CourseNum, FacultyNum)
-
b. Student (StudentNum, CourseNum)
Faculty (CourseNum, FacultyNum)

c. Student (StudentNum, CourseNum)
Faculty (CourseNum, FacultyNum)
StudentFaculty (StudentNum, FacultyNum)

d. Student (StudentNum, CourseNum, FacultyNum)

e. Student (StudentNum, CourseNum)
Faculty (CourseNum, FacultyNum)
StudentFaculty (StudentNum, FacultyNum)

14. Describe the relationship between columns that can be null and entity subtypes. Under what circumstances would these columns lead to more than one entity subtype?

- When the issue is more complicated and more than one column can accept null values.

15. How is it possible to merge a collection of relations that is in third normal form into a cumulative design that is in third normal form but not obtain a collection of relations that is in third normal form? Give an example other than the one described in the text.

- You can attempt to avoid the problem of creating a table that is not in third normal form by being cautious when representing user views.

You would have the following table in this user view:  
`Office (OfficeNum, OfficeLocation, EmployeeNum, LastName, FirstName)`  
Now the normalization process for this user view would produce the following two tables:  
```
Office (OfficeNum, OfficeLocation, EmployeeNum)
Employee (EmployeeNum, LastName, FirstName)
```
When you merge these two tables into the cumulative design, you do not produce any tables that are not in third normal form.

16. Describe the entity-relationship model. How are entities, relationships, and attributes represented in this model? What is a composite entity? Describe the approach to diagrams that use a crow’s foot. Describe how you would represent cardinality in an E-R diagram.

17. Design a survey form of your own. Fill it out as it might have been completed during the database design for Henry Books. For any questions you have too little information to answer, make a reasonable guess. **PG 197**

- Entity information (reps, customers, items, etc.)
- Attributes for entities (name, description, price, etc.)
- Relationships (one-to-one, one-to-many, or many-to-many) significance of the relationship (that is, what determines when two objects are related)
- Functional dependencies (among the columns)
- Processing information (updates to the database, reports that must be produced, processing volume)

```
Henry Books Database Design
Entity information:
- What kind of records will you require to be saved?
- What book information will you require?
- Will you have employees?
- Accounting information?
Attributes
- What information will each record provide that will be useful?
- What attributes will be computed?
Relationships
- What king of associations will the record have with one other?
- Are there restrictions on the relationship between data?
Functional dependencies
- Do you know the number of the book-types to which a section is assigned?
- Is the book dependent on the employee number?
- Can a book be assigned to more than one section?
```
18. Using a document at your own school (for example, a class schedule), determine the attributes present in the document. Using your knowledge of the policies at your school, determine the functional dependencies present in the document. Use these dependencies to create a set of tables and columns that you could use to produce the document.

19. List the changes you would need to make in your answer to Question 7 if you must store the year and the semester in which a student took a course and received a grade.
