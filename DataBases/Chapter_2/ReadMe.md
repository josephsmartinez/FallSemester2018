# Review Questions Chapter Two

1. What is a relation?
### Is a two dimension table in which  
- The entries in the table are single-valued (each location in the table contains only one value)
- Each column has a distinct name
- All values in a column are values of the same attribute
- The order of columns is immaterial
- Each row is distinct
- The order of rows is immaterial

2. What is a relational database?
- A collection of relations

3. What is an unnormalized relation? Is it a relation according to the definition of the word relation?
- No
- unnormalized **entries** contain repeating groups are not single-valued.
- unnormalized relations data can repeat within a column

4. How is the term attribute used in the relation model? What is a more common name for attribute?
- attributes are sometime referred as fields  

5. Describe the shorthand representation of the structure of a relational database. Illiterate this technique by representing the database for Colonial Adventure Tours shown in Figures 1-15 through 1-19 in Chapter 1.
- `Guide (GuideNum, LastName, FirstName, Address, City, State, PostalCode, PhoneNum, HireDate)`

6. What does it mean to qualify a field name? How would you qualify the Street field in the Customer table?
- When duplicate column name exist in a database you need a way to indicate the column to which you are referring to.
- Thus you can write the `RepNum` column in the `Customer` table as `Customer.RepNum` and the `RepNum` column in the `Rep` table as `Rep.RepNum`
- When you combine column name with a table name, you say that you **qualify** the column

7. What is a primary key? What is the primary key for each table in the Colonial Adventure Tours database shown in Figures 1-15 through 1-19 in Chapter 1.
- The **primary key** of a table is the column or collection of columns that uniquely identifies a given row in that table.
- Guide table's primary key -> `GuideNum`
- Primary key's denoted with an **underline**
- Guide (__GuideNum__, LastName, FirstName, Address, City, State, PostalCode, PhoneNum, HireDate)

8. How do you include a field in an Access Query?
- Double click the field in the field list to place it in the design grid

9. How do you indicate criteria in a Access Query?
- Conditions that data must satisfy

10. How do you use an AND criterion to combine criteria in an Access query?
- You can use the **comparison operaters** to create conditions.
- You can also combine criteria to create **compound criteria** or **compound conditions**
- **AND** or **OR**

11. How create a computer field in the access query?
- A **computed field** or **calculated field** is a field that is the result of a calculation using one or more existing fields.

12. In which row of the Access design grid do you include functions? What functions can you use in Access queries?

13. How do you sort data in an Access query?

14. When sorting data on more than one field in a Access query, which field is the major sort key? Which field is the minor sort key? What effect do these keys have on the order in which the rows are displayed.

15. How do you join tables in an Access query?

16. How do you use an update query?

17. When do you use a delete query?

18. When do you use a make-table query?

19. What is relational algebra?

20. Describe the purpose of the SELECT command in relational algebra?

21. Describe the purpose of the JOIN command in relational algebra?

22. Describe the purpose of the UNION command in relational algebra?

23. Describe the purpose of the SELECT command in relational algebra?

24. Are there any restrictions on the tables when using the UNION command? If so, what are these restrictions?

25. Describe the purpose of the INTERSECT command in relational algebra?

26. Describe the purpose of the SUBTRACT command in relational algebra?

27. Describe the purpose of the product  in relational algebra?

28. Describe the results of the division process in relational algebra?

### Critical Thinking

29. In the TAL Distributors database shown in Figure 2-1, the Rep table container four rows and the customer table contains 12 rows. How many rows would be contained in the Cartesian product of these two tables?

30. In Example 23 on page 58,, would you get the same result if you preformed the PROJECT command before the JOIN command? Why or why not?
