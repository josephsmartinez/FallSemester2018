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
###New Table:
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
