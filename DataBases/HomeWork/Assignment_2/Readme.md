# TAL Distributors Exercises

## Question 1 Rafael Serrano, Andres Ruiz, Michael Rodriguez, Richard Orfao
1. Using your knowledge of TAL Distributors, determine the functional dependencies that exist in the following table. After determining the functional dependencies, convert this table to an equivalent collection of tables that are in third normal form.


### Old Table:
```Item (ItemNum, Description, OnHand, Category, Price, (OrderNum, OrderDate, CustomerNum, CustomerName, RepNum, LastName, FirstName, NumOrdered, QuotedPrice))
```
### Dependencies:
```ItemNum -> Description, Category, Price, OnHand                          OrderNum -> CustomerNum, CustomerName, OrderDate                              RepNum -> LastName, Firstname      
CustomerNum ->CustomerName                                                    ItemNum, OrderNum -> NumOrdered, QuotedPrice
```
### New Tables:
```Item (ItemNum, Description, OnHand, Category, Price)
Orders(OrderNum,OrderDate)                                                    OrderLine (OrderNum, OrderDate, ItemNum, CustomerNum, QuotedPrice, NumOrdered)
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
