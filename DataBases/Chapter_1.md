# Review Question Chapter One

## Key Terms
- attribute
A characteristic or property of an entity

- column
A field and column is a unique order of the same data.

- data file
A file that stores data

- data independence
Lets you change the DB without requiring alterations within the program(s) that accesses it.

- database
A structure that can store information about multiple types of entities, the attributes of those entities and the relationships between the entities.

- database administrator
Admin that maintains the DB

- database design
The overall design and architecture of the database as needed by the business requirements

- database management system
A program that allow the user to interact with the database

- entity-relationship diagram (E-R)
A visual way to represent a database

- field
A field hold a piece of the information about an entity

- form
Screen object used to maintain, view, and print data from the database

- integrity
The database has integrity when the data in it satisfies all established integrity constraints

- integrity constraint
Rule(s) that data must follow the database

- one-to-many relationship
One-to-many relationships is an entity with an association to many other entities

- redundancy
The duplication of data or the storing of data in one or more places

- relationship
Similarities between data or shared entities

- security
Unauthorized access, alterations to the database environment

1. What is redundancy? What problems are associated with redundancy?
- The duplication of data or the storing of data in one or more places
- Redundancy can waste space and errors would need to be changed in more than one place

2. Besides redundancy, what other problems are associated with the non-database approach to processing data?
- Difficult accessing related data across many fields (querying)
- Limited security
- Data sharing
- Inherent size limitation

3. What is entity? an attribute?
- A characteristic or property of an entity
- A entity is a thing (noun) in which as attributes

4. What is a relationship? A one-to-many relationship?
- Relationship is an association between entities
- One-to-many relationships is an entity with an association to many other entities
i.e. Customer to Reps (relationship) vs. Reps to customers (one-to-many relationship)

5. What is a database?
- A structure that can store information about multiple types of entities, the attributes of those entities and the relationships between the entities.

6. How do you create a one-to-many relationship in a database system?
- Each entity has its own table, within that table there will be an attribute of an entity that ties back the root.
- For this example the root may have many children entities, while each child has no attribute with other children entities

7. What is an E-R diagram?
- A visual way to represent a database

8. What is a DBMS?
- Database management system is a program that allow the user to interact with the database

9. What is database design?
- The overall design and architecture of the database as needed by the business requirements

10. What is a form?
- Screen object used to maintain, view, and print data from the database

11. How can you get more information from the same amount of data by using a database approach instead of a non-database approach?
- The data handle within a relational database is non-disjointed, thus allowing access to all collected information without restrictions

12. What is meant by the sharing of data?
- Data of various users can be combined and shared among authorized users, allowing users access to a greater pool of data.

13. What is a DBA? What kinds of responsibilities dies a DBA have in a database environment?
- A DBA is responsible for maintaining and administering the database some duties include: user access, data backups, trouble shooting, sharing data, security, etc.

14. How does consistency result from controlling redundancy?
- Having consistency across the DB would reduce the need to change information manually (redundancy) in the event data was modified.

15. What is an integrity constraint? When does a DB have integrity?
- Rule(s) that data must follow the database
- The database has integrity when the data in it satisfies all established integrity constraints

16. What is security? How does a DBMS provide security?
- Unauthorized access to the database
- Password, user access/right(s) level, groups, etc.

17. What is a DB independence? Why is it useful?
- Lets you change the DB without requiring alterations within the program(s) that accesses it.

18. How is a file size a disadvantage in a database environment?
- A DB and DBMS require a great deal of space to operate

19. How can the complexity of DBMS be a disadvantage?
- Increased complexity beneath the DB system and admin knowledge is critical

20. Why can failure in a database environment be more serious than an error in a non-database environment?
- In a non-oriented system, each user has a complete separate system the failure of any single user's system, does not necessary affect and the other users.

21. Why might recovery of data be more difficult in database environment?
- Database must first be restored, then all known updated must be corrected. The larger the users with access to insert and edit information the larger the complexity.

## Critical Thinking
22. If a database is not maintained or if incorrect data is entered into the database, serious problems can occur. What problems could occur if a
student database in not maintained?
- Student information may be most in the event of system failure or security breach
- Incorrect tabling of records, leading the data corruption and in accuracies
- Software implication that interacts with the database

23. An attribute is characteristic or property if an entity. If person is an entity, would the same attributes be used to describe a person in different databases that store medical, student, and fitness club data? Why or Why not?
- Yes
- Example would be user entity address information. This information can shared across different databases that all have the same required fields describing the same person with a home residence. If the DBs are linked, and the user's change of information is allowed access across all DBs, there would be a level of consistency that would reduce the possibility of unnecessary redundancy.
