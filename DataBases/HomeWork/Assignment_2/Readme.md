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
