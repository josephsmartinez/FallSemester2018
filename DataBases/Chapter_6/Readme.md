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
