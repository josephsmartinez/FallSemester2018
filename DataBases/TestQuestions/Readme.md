# COP 4703 Midterm Review

## Chapter 1…………………

1. Redundancy wastes space because you are storing different types of data in the same place.

- False, it's the same type of data.
Redundancy also leads to difficult querying, limited security, and size limitations

2. When you need to change data, redundancy makes your changes more cumbersome and time-consuming.  

- True

3. An entity is also defined as an attribute.
- Flase

- An entity is a person, place, object, event, or idea for which you want to store and process data. Each entity has its own table. The attributes of an entity become the columns in the table.

4. An attribute is a characteristic or property of an entity.

- True, Attributes describe and provide details about entities

5. An attribute is known as a row in most databases.

- False, Rows are commonly known as records, which provide all information about the entity.

6. A database will not only hold information about multiple types of entities, but also information about the relationships among these multiple entities.
True, which is why there is a difference between relational and non-relational database

7. Each table in a database represents two or more entities.

- False, Each entity has its own table.

8. The relationship between different entities (in different tables) is handled by their
common columns.

True, This is why keys become important in defining relationships between tables

9. Software packages, called database management systems, can do the job of
manipulating databases for you.  

- True

10. Programs created with Visual Basic, Java, Perl, PHP, or C++ can access the database
directly, rather than having to access it through the DBMS.

- False, Many advanced text editors and IDEs have plug-ins that allow developers to access database.

11. To create forms to use with a database you must write a program.

- Flase, There must be a way for user to interact with the DBMS. This can done using languages like: Java, Python, JavaScript, and PHP.

12. Sharing data is one advantage of database processing.

- True, Data sharing leads to larger pools of data that can be collected and maintained.

13. An advantage of using the database approach to processing is that it facilitates Consistency.

- True, The database approach to processing offers nine clear advantages (PG 13)

14. A DBA can assign passwords to prevent unauthorized users from accessing the data.

- True, A DBA can manage users and create policies

15. There is a greater impact of failure in a nondatabase, file-oriented system.

- True, Data can be lost or inconsistent

16. Storing the same data in more than one place is called ____.

- Redundancy

17. A(n) ____ is also called a field or column in many database systems.

- Attribute

18. A(n) ____ is a person, place, object, event, or idea for which you want to store and process data.

- Entity

19. A(n) ____ is the computer counterpart to an ordinary paper file you might keep in a file cabinet or an accounting ledger.

- Record (PG14)

20. The ____ of an entity become the columns in the database table.

- Attribute

21. Unlike a typical data file, a database can store information about multiple ____.

- Entities

22. A visual way to represent a database is with a(n) ____.

- View

23. Popular ____ include Access, Oracle, DB2, MySQL, and SQL Server.

- Relational Databases

24. During the ____ process, a database expert determines the structure of the required database.

- Database Design

25. ____ are screen objects used to maintain, view, and print data from a database.

- Forms

26. Which of the following statements is correct?  **WHAT LOL!**

27. An integrity constraint is a rule that ____.

- An integrity constraint is a rule that data must follow in the database

28. A database has ____ if the data in it satisfies all established integrity constraints.

- Integrity

29. ____ is the prevention of unauthorized access to the database.

- Security

30. A(n) ____ frees programmers who write database access programs from having to engage in mundane data manipulation activities, such as adding new data and deleting existing data.

- DBMS

31. A person who is in charge of a database within an organization is often called the database ____.

- Database Admin

32. A good ____ should provide an opportunity for users to incorporate integrity constraints when they design the database.

- DBA

33. A DBMS lets you assign users to ____.

- DBMS lets you assign users to groups

34. ____ is a property that lets you change the structure of the database without requiring you to change the programs that access the database.

- Data Independence

35. One disadvantage of a database system is ____.

- Larger file size
- Increased complexity
- Greater impact of failure
- More difficult recovery

36. In a(n) ____________________ relationship between two entities, each occurrence of the first entity is related to many occurrences of the second entity and each occurrence of the second entity is related to only one occurrence of the first entity.

- One to many

37. A program, or collection of programs, through which users interact with a database is
known as a(n) _________________________.

- DBMS

38. In an E-R diagram, ____________________ represent entities.

- Rectangles represent entities

39. In an E-R diagram, ____________________ represent relationships between connected entities.

- Line

40. In an E-R diagram, the ____________________ at the end of a line indicates the “many” part of the one-to-many relationship between two entities.

- Line with a dot at the end

41. A group of people in charge of a database within an organization is often called the ____________________.

- DBAs

42. The problem of inconsistency in data is a direct result of ____________________.

- Direct result of redundancy and not providing integrity constraints

43. Eliminating ____________________ not only saves space but also makes the process of updating data much simpler.

- Redundancy

44. A good _________________________ has many features that allow users to gain access to data in a database without having to do any programming.

- View

45. A database file requires a large amount of disk space and internal ____________________. substantial amount of internal memory

# Chapter 2………………

1. A relational database handles entities, attributes, and relationships by storing each entity in its own table.

- True, Each entity is stored in its own table. (PG31)

2. The attributes of an entity become the fields or columns in a table.

- True, The attributes of an entity become the fields or columns in the table. (PG31)

3. Each column in a table should have a unique name, and entries in each column should all “match” this column name.

- True, Each column in a table should have a unique name, and all entries in each column should be consistent with this column name. (PG31)

4. In a relation, the order of the columns is important.

- False,  The order in which columns and rows appear in a table should be immaterial.

5. In a relation, the order of rows is important.

- In addition, each row should be unique. After all, when two rows in a table contain identical data, the second row does not provide any information that you do not already have. In addition, for maximum flexibility, the order in which columns and rows appear in a table should be immaterial (unimportant under the circumstances; irrelevant.). (PG31)

6. A relational database is a collection of relations.

- True

7. An unnormalized relation is a table that has more than one row.

- False, some of the entries contain repeating groups and, thus, are not single-valued. Such a structure is called an unnormalized relation.

8. A column whose value uniquely identifies a given row in the table is the secondary key.

- False, that would be the primary key
- Secondary, columns that are of interest strictly for the purpose of retrieval

9. A query is a question represented in a way that the DBMS can recognize and process.

- True

10. QBE is a visual approach to writing queries.

- Query-By-Example (QBE)
- An approach to writing queries that is very visual. With QBE, users ask their questions by entering column names and other criteria using an on-screen grid, and data appears on the screen in tabular form. (PG33)

11. Access automatically adds double quotation marks around values in the design grid that are formatted as Short Text fields when you run the query or move the insertion point to another cell in the design grid.

- Access automatically adds double quotation marks around the value when you run the query or move the insertion point to another box in the design grid. (PG 37)

12. The comparison operators are `+, *, %, and /`.

- False
- `<,  >,  =, !=`

13. The comparison operators are also known as relational operators.

- comparison operator, also called a relational operator (PG 37)

14. In an AND criterion, the overall criterion is true if either of the individual criteria is true.

- False
- AND ==> `T&T = T, T&F=F, F&T=F, F&F=F`

15. The concept of grouping means that statistics will be calculated for individual records.

- True, functions in combination with grouping, where calculations affect groups of records.
- Grouping simply means creating groups of records that share some common characteristic.

16. A relation is a(n) ____.

- Association between entities

17. Based on the statement below, which of the following is the primary key?
`Rep (RepNum, LastName, FirstName, Street, City, State, PostalCode Commission,Rate)`

- RepNum, it is the first listed attribute

18. When duplicate column names exist in a database and you need to indicate the column to which you are referring, ____.

- Ture, which is called qualifying the field

19. Rows are also called ____.
- Records

20. The ____ key of a table is the column or collection of columns that uniquely identifies a given row in that table.
- Primary Key

21. The compound criteria (conditions) are created by using ____.

- AND, OR

22. Count, Sum, Avg, Max, and Min are a few of the built-in statistics or ____ functions that can be used in a query.

- Aggregate Function

23. If you are sorting records by more than one field, the more important field is called the ____.

- Major sort key, The other is the minor sort key

24. A query that changes data is a(n) ____ query.

- UPDATE

25. A ____ query creates a new table using the query results.

- CREATE TABLE

# Chapter 3………………

1. SQL uses commands to create tables, update tables, and retrieve data from tables.

- True

2. You can use the SQL CREATE TABLE command to insert rows into a table.

- False, You use INSERT statement

3. A valid name for a table might be tbl$Student.

- False
### Some common restrictions placed on table and column names by DBMSs are as follows: (PG72)
- The names cannot exceed 18 characters.
- The names must start with a letter.
- The names can contain only letters, numbers, and underscores ( _ ).
- The names cannot contain spaces.

4. CHAR data types are numbers without a decimal part.

- False, Stores a character string n characters long. You use the CHAR type for fields that contain letters and other special characters and for fields that contain numbers that will not be used in calculations (PG349).

5. Fields will appear in the query results in the order in which they are listed in the SELECT clause.

- True

6. In a SELECT statement, the WHERE clause is mandatory.

- False

7. Instead of listing all the field names in the SELECT clause, you can use the @ symbol.

- False

8. A simple condition includes the field name, a comparison operator, and either another field name or a value.

- True

9. There are two versions of the “not equal to” operator: <> and !=.

- True, Notice that there are two versions of the “not equal to” operator: < > and !¼. You must use the correct one for your version of SQL. If you use the wrong one, your system will generate an error, in which case, you will know to use the other version. Access uses the < > version of the “not equal to” operator. (PG77)

10. When you connect simple conditions using the AND operator, all the simple conditions must be false for the compound condition to be true.

- False

11. Preceding a condition by the NOT operator reverses the truth or falsity of the original condition.

- True

12. The BETWEEN operator is an essential feature of SQL.

- False

13. You can combine values in character fields.

- True

14. The IN operator provides a concise way of phrasing certain conditions.

- True

15. There is no difference between the COUNT function and the SUM function.

- False

- There are two differences between COUNT and SUM—other than the obvious fact that they are computing different statistics. In the case of SUM, you must specify the field for which you want a total and the field must be numeric. (PG90)

- Is there a difference between count and sum?

- Count gives you the number of records
- Sum gives you the accumulation of an specific attribute.

16. You can use the GROUP BY clause and the ORDER BY clause in the same SELECT
Statement.

- True

17. The HAVING clause is to groups what the WHERE clause is to rows.

- True

18. When rows are grouped, one line of output is produced for each group.

- True

19. A WHERE and a HAVING clause cannot be included in the same query.

- False

20. For each pair of tables to be joined, a condition must be included indicating how the tables are related.

- True

21. When you use a name containing a space in Access SQL, you must ____.

- Enclose it in square brackets

22. Many versions of SQL require you to end a command with a ____.

- Semicolon ;

23. The basic form of an SQL retrieval command is ____.

- SELECT-FROM-WHERE

24. When used after the word SELECT, the ____ symbol indicates that you want to include all fields in the query results in the order in which you described them to the DBMS when you created the table.

- `*`

25. To use a wildcard, include the ____ operator in the WHERE clause.

- Like

26. In versions of SQL other than Access, the ____ is used as a wildcard to represent any collection of characters.

- percent sign ( % )

27. In Access SQL, the ____ is used as a wildcard to represent any individual character.

- question mark (?)


28. The ____ function calculates the number of entries in a table.

- Count

29. When a subquery is used, ____ is(are) evaluated first.

- the subquery query


30. The ____ clause can be used to create groups of records.

- Group By


31. When rows are grouped, ____.

- one line of output is produced for each group


32. To make changes to existing data in a table, you would use the ____ command.

- Update

33. To add new data to a table, use the ____ command.

- Insert


34. You can save the results of a query as a table by including the ____ clause in the

- You can save the results of a query as a table by including the INTO clause in the query

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
# Chapter 4………………
1. Views cannot be used to examine table data.
- False

2. An individual can use a view to create reports, charts, and other objects that show database data.

- True

3. A view is a physical table in the DBMS.

- False

4. To create a view in Access, you simply create and then save a query.
True.


5. One advantage of using views is that they provide data dependence.

- False


6. One advantage of a view is that different users can view the same data in different ways.

- True

7. Indexes can increase the efficiency with which data is retrieved from the database.

- True

8. When you create an index whose key has a single field, you have created what is called a single-column index.

- True

9. The command DEL INDEX CustList; would remove the index named CustList.

- False, it is DROP INDEX

10. The following command will enable Jones to retrieve data from the Customer table, but not to take any other action: GRANT SELECT ON Customer Jones ;

- False
- The following command will enable user Jones to retrieve data from the Customer table but not take any other action.
- `GRANT SELECT ON Customer TO Jones`

11. Referential integrity is specified using the FOREIGN KEY clause in the SELECT command.

- False
- Referential integrity is the rule that if table A contains a foreign key that matches the primary key of table B, the values of this foreign key must match the value of the primary key for some row in table B or be null.
- To specify a foreign key, you need to specify both the field that is a foreign key and the table whose primary key it is to match.

12. Legal-values integrity is the property that states that no record can exist in the database with a value in the field other than one of the legal values.

- True

13. Information about tables in the database is kept in the system catalog.

- True

14. A stored procedure is placed on a client computer.

- False

15. Access supports stored procedures.

- False

16. The ____ command will create an application program's or individual user's picture of the database.

- CREATE VIEW

17. A row-and-column subset ____ consists of a subset of the rows and columns in some individual table.

- View???

18. To create an index named RepBal with the keys RepNum and Balance and with the balances listed in descending order, the command is ____.
```
CREATE INDEX RepBal ON
Customer (RepNum, Balance DESC) ; ???
```
19. The ____ statement will take away user privileges to the database.
```
REVOKE
```
20. In Access, a key symbol appears in the row selector of the field that is the ____ key.

- Primary

21. To create the primary key clause for the Customer table on the CustomerNum field, the correct statement is ____.

- PRIMARY KEY (CustomerNum)

22. To create the primary key clause for the OrderLine table on the OrderNum and ItemNum fields, the correct statement is ____.

- PRIMARY KEY (OrderNum, ItemNum)

23. Essentially, setting the value in a given field to ____ is similar to not entering a value in it at all.

- Null

24. Which of the following statement fragments will only allow a CreditLimit of $5,000, $7,500, or $15,000?

- CHECK (CreditLimit IN (5000, 7500, 15000))

25. The CHECK clause can be included in the ____ command.

- ALTER TABLE

26. In SQL, you use the CHECK clause to enforce ____ integrity.

- Legal-values

# Chapter 5………………

1. A table that is in first normal form is better than one that is in second normal form.

- False.
- **4th > 3rd > 2nd > 1st**

2. To correct update anomalies in a database, tables must be converted into various types of normal forms.

- True

3. If B is functionally dependent on A, you can also say that B functionally determines A.

- True

4. Functional dependencies can be determined by looking at sample data.

- False

5. Removal of repeating groups is the starting point in the quest to create tables that are as free of problems as possible.

- True

6. In general, when converting a non-first normal form table to first normal form, the primary key will usually include the original primary key concatenated with the key to the repeating group.

- True

7. A table that is in first normal form may contain problems that will require you to restructure it.

- True

8. If the primary key of a table contains only a single column, the table is automatically in first normal form.
False.

9. In a dependency diagram, the arrows below the boxes indicate the normal dependencies.

- False

10. Tables that are in second normal form do not contain problems.

- False

11. The most recent definition of third normal form is referred to as the Boyce-Codd normal form.

- True

12. The primary key in a table will be a determinant.

- True

13. Converting to third normal form always avoids the problems related to dependencies.

- False

14. The normalization process used to convert a relation or collection of relations to an equivalent collection of third normal form tables is a crucial part of the database design process.

- True

15. By splitting relations to achieve third normal form tables, you create the need to express interrelation constraints.

- True

16. Potential problems in the design of a relational database are known as ____.

- Update anomalies

17. The fact that column B is functionally dependent on column A can be written as ____.

- A → B

18. If B (an attribute) is functionally dependent on A, we can also say that ____.

- A functionally determines B

19. The ____ is a column (or collection of columns) A such that all other columns are functionally dependent on A and no subcollection of the columns in A has this property.

- Primary Key

20. The definition for ____ also defines a candidate key.

- Primary Key.

21. A(n) ____ is a column or collection of columns on which all columns in the table are functionally dependent.

- Candidate key

22. An alternate key is a ____.

- Column that could be a primary key but was not chosen.

23. A table is in first normal form if it does not contain ____.

- Repeating groups

24. A table that contains a repeating group is called a(n) ____.

- Unnormalized relation.

25. If there is more than one possible choice for the primary key, and one of the possibilities is chosen to be the primary key, the others are referred to as ____.

- Alternate keys

26. From all the ____ keys, one is chosen to be the primary key.

- Candidate

27. Which of the following contains a repeating group? !!!NOTE!!! Question Broken! Equivalent question found on Quizlet... Which of the following contains a repeating group?
```​
​Orders (OrderNum, OrderDate, (ItemNum, NumOrdered) )
​Orders (OrderNum, ItemNum, NumOrdered )
​Orders (OrderNum, OrderDate)
​Orders (OrderNum, OrderDate, ItemNum, NumOrdered )
Orders (OrderNum, OrderDate, (ItemNum, NumOrdered) )
```
28. A column is a nonkey column if it is ____.

- Not a part of the primary key.

29. Another name for a nonkey column is a ____.

- Non-key attribute.

30. Second normal form can be defined as a table that is in first normal form but that contains no ____.

- Partial dependencies.

# Chapter 6………………
1. The information-level design methodology involves representing the individual user view as a collection of tables, refining them to eliminate any problems, and then merging them into a cumulative design.

- True

2. A design that supports all user views is called a constructive design.

- False

3. The second step in creating a user view is to represent the user view as a collection of tables.

- False

4. The first step in creating a user view is to normalize the tables.

- False

5. When provided with a user view or some sort of stated requirement, you must develop a collection of tables that will support it.

- True

6. The primary key is a unique identifier.

- True

7. The basic relationships among entities are: one-to-many, many-to-many, and one-to one.

- True

8. In a one-to-many relationship, the primary key of the “many” table becomes the foreign key of the “one” table.

- False

9. Careful planning in the early stages of the normalization process will usually avoid the need to consider fourth normal form.

- True

10. You create a many-to-many relationship by creating a new table whose primary key is the combination of the primary keys of the original tables.

- True

11. There are two types of primary keys that you can use in your database design.

- False

12. A foreign key is a column or collection of columns in one table that is required to match the value of the primary key for some row in another table, or be null.

- True

13. In DBDL, you represent a table by listing all columns and then underlining the primary key.

- True

14. In an entity-relationship diagram, rectangles represent foreign keys.

- False

15. When you use an E-R diagram to represent a database, it visually illustrates all the information listed in the DBDL.

- True

16. In an E-R diagram, a dashed line represents an identifying relationship and a solid line
represents a nonidentifying relationship.

- False

17. Nulls are used when a value is either unknown or inapplicable.

- True

18. When you combine third normal form tables, the result will always be in third normal form.

- False

19. The use of an “m” and an “n” in an E-R diagram indicates a many-to-many relationship.

- True

20. A weak entity is a column or collection of columns that could have been chosen as a primary key, but was not.

- False

21. A set of requirements that is necessary to support the operations of a particular database user is known as a(n) ____.

- User View

22. The properties of the entities you choose as you design the user view will become the ____ in the appropriate tables.

- Columns

23. If each employee works in a single department and each department has only one employee, the relationship between employees and departments is ____.

- One-to-one

24. A(n) ____ is a primary key that consists of a column that uniquely identifies an entity, such as a person’s Social Security number.

- Natural Key

25. A column that you create for an entity to serve solely as the primary key and that is visible to users is called a(n) ____.

- Artificial Key

26. A(n) ____ is a system-generated primary key that is usually hidden from users.

- Surrogate key

27. When a DBMS creates a(n) ____ key, it is usually an automatic numbering data type, such as the Access AutoNumber data type.

- Surrogate

28. A natural key is also called a(n) ____ key.

- Intelligent

29. Which of the following shows sample DBDL documentation for the Employee table?
```
Employee (EmployeeNum, LastName, FirstName, Street, City, State, PostalCode, WageRate, SocSecNum, DepartmentNum)
AK SocSecNum
SK LastName
FK DepartmentNum→Department
```
30. An alternative to the primary key of a table is listed with the ____ abbreviation in DBDL.

- AK

31. Combining the following two tables would result in ____.
```
Employee (EmployeeNum, LastName, FirstName, WageRate, SocSecNum, DepartmentNum)
Employee (EmployeeNum, LastName, FirstName, Street, City, State, PostalCode)
Employee (EmployeeNum, LastName, FirstName, WageRate, SocSecNum, DepartmentNum, Street, City, State, PostalCode)
```
32. Independent entities have ____ in an E-R diagram.

- Square Corners.

33. An entity that does not require a relationship to another entity for identification is called a(n) ____.

- Independent Entity.

34. A relationship that is necessary for identification is called a(n) ____.

- Identifying Relationship

35. Convert the following table to first normal form:
```
Branch (BranchNum, BranchName, (BookCode, Title, OnHand) )
Branch (BranchNum, BranchName, BookCode, Title, OnHand)???
```
