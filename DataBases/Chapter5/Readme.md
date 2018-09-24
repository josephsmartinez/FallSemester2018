# Review Questions Chapter Five
## DATABASE DESIGN 1: NORMALIZATION
## Name: Joseph Martinez
```
alternate key
Boyce-Codd normal form (BCNF)
candidate key
concatenation
dependency diagram
determinant
first normal form (1NF)
fourth normal form (4NF)
functional dependence
functionally dependent
functionally determines
interrelation constraint
multidependent
multidetermine
multivalued dependence
nonkey attribute
nonkey column
normal form
normalization process
partial dependency
primary key
repeating group
second normal form (2NF)
third normal form (3NF)
unnormalized relation
update anomaly
```
### Review Questions
1. Define functional dependence.  
- A column (attribute) B is functionally dependent on another column A (or possibly a collection of columns) when each value for A in the database is associated with exactly one value of B.

2. Give an example of a column A and a column B such that B is functionally dependent on A. Give an example of a column C and a column D such that D is not functionally dependent on C.

- Question: Assume one of the policies at TAL Distributors is that all reps in any given pay class earn the same commission rate. How might you convey this fact to someone else?

- Answer: You might say, “A rep’s pay class functionally
determines his or her commission rate” or “A rep’s commission rate functionally depends on his or her pay class.”

3. Define primary key.
Column A (or a collection of columns) is the primary key for a relation (table) R, if:  
- Property 1. All columns in R are functionally dependent on A.
- Property 2. No subcollection of the columns in A (assuming A is a collection of columns and not just a single column) also has Property 1.

4. Define candidate key.
- Like a primary key, a candidate key is a column or a collection of columns on which all columns in the table are functionally dependent; the definition for primary key also defines a candidate key.

- Example: Occasionally (but not often), there might be more than one possibility for the primary key. For example, if the TAL Distributors database included an Employee table to store employee numbers and Social Security numbers, either the employee number or the Social Security number could serve as the table’s primary key. In this case, both columns are referred to as candidate keys.

5. Define first normal form.
- A table (relation) is in first normal form (1NF) when it does not contain repeating groups.

- A relation (table) that contains a repeating group (or multiple entries for a single record) is called an unnormalized relation. Removing repeating groups is the starting point in the quest to create tables that are as free of problems as possible.

6. Define second normal form. What types of problems would you find in tables that are not in second normal form?

**Second Normal Form | Defined**
- Second normal form represents an improvement over first normal form because it eliminates update anomalies in these situations. To understand second normal form, you need to understand the term nonkey column.

- A column is a nonkey column (also called a nonkey attribute) when it is not a part of the primary key.

- A table (relation) is in second normal form (2NF) when it is in first normal form and no nonkey column is dependent on only a portion of the primary key.

- In fact, another definition for second normal form is a table that is in first normal form but that contains no partial dependencies.

**Problem form Second Normal Form**
```
These other problems are called update anomalies, and they fall into four categories:

1. Update. A change to the description of item FD11 requires not one change to the table, but two changes—you have to change each row on which item FD11 appears. Changing multiple rows
makes the update process more cumbersome; it also is more complicated logically and takes
more time to update.

2. Inconsistent data. There is nothing about the design that would prohibit item FD11 from having two different descriptions in the database. In fact, if item FD11 were to occur on 20 rows, it could potentially have 20 different descriptions in the database!

3. Additions. You have a real problem when you try to add a new item and its description to the database. Because the primary key for the table consists of both OrderNum and ItemNum, you need values for both columns when you want to add a new row. If you have an item to add, but there are no orders for it yet, what order number do you use? The only solution is to use a fictitious order number and then replace it with a real order number after TAL Distributors receives
an order for the new item. Certainly, this is not an acceptable solution.

4. Deletions. If you deleted order 51608 from the database, you would lose all information about item CD33. For example, you would no longer know that item CD33 is a Wood Block Set (48 piece).
```

7. Define third normal form. What types of problems would you find in tables that are not in third normal form?

**Third Normal Form | Defined**
- A table (relation) is in third normal form (3NF) when it is in second normal form and the only determinants it contains are candidate keys.
```
Redundancy creates the same set of problems examined in the first normal form Orders table. In addition to the problem of wasted space, you have similar update anomalies as follows:

1. Updates. A change to the name of a rep requires not one change to the table, but several, making the update process cumbersome.

2. Inconsistent data. There is nothing about the design that would prohibit a rep from having two different names in the database. In fact, if the same rep represents 20 customers (and thus would be found on 20 different rows), he or she could have 20 different names in the database.

3. Additions. In order to add rep 87 (Mary Webb) to the database, she must already represent at least one customer. If she has not yet been assigned any customers, you must add her record and create a fictitious customer for her to represent. Again, this is not a desirable solution to the problem.

4. Deletions. If you deleted all the customers of rep 45 from the database, you would lose all information concerning rep 45.
```

8. Define fourth normal form. What types of problems would you find in tables that are not in fourth normal form?

- A table (relation) is in fourth normal form (4NF) when it is in third normal form and there are no multivalued dependencies.
- This collection of tables avoids the problems with multivalued dependencies.

9. Define interrelation constraint and give one example of such a constraint. How are interrelation constraints addressed?
- Interrelation constraint, a condition that involves two or more relations.
```
Customer (CustomerNum, CustomerName, Balance, CreditLimit, RepNum, LastName, FirstName)
to
Customer (CustomerNum, CustomerName, Balance, CreditLimit, RepNum)
Rep (RepNum, LastName, FirstName)
Nothing about these two relations by themselves would force the RepNum on a row in the Customer
relation to match a value of RepNum in the Rep relation. Requiring this to take place is an example of an
interrelation constraint. Foreign keys handle this type of interrelation constraint.
```

10. Consider a Student table containing `StudentNum, StudentName, student’s StudentMajor, student’s AdvisorNum, student’s AdvisorName, student’s AdvisorOfficeNum, student’s AdvisorPhone, student’s NumCredits, and student’s Category (freshman, sophomore, and so on)`.
List the functional dependencies that exist, along with the
assumptions that would support those dependencies.

- The Student numbers are unique and any given StudnetNum is associated with the following:  
`StudentNum -> StudentName, StudentMajor, AdvisorNum, AdvisorName, AdvisorOfficeNum, AdvisorPhone, NumCredits, Category`

- The Advisor number are unique and any given AdvisorNum is associated with the following:  
```
AdvisorNum, AdvisorPhone, AdvisorOfficeNum -> AdvisorName
```  
Unless the advisors share phonenumber and office number, all advisor fields would unique except for the name column.

11. Convert the following table to an equivalent collection of tables that are in third normal form. This table contains information about patients of a dentist. Each patient belongs to a household. `Patient (HouseholdNum, HouseholdName, Street, City, State, PostalCode, Balance, PatientNum, PatientName, (ServiceCode, Description, Fee, Date))` The following dependencies exist in the

Patient table:  
```
PatientNum → HouseholdNum, HouseholdName, Street, City, State,
PostalCode, Balance, PatientName
HouseholdNum → HouseholdName, Street, City, State, PostalCode, Balance
ServiceCode → Description, Fee
PatientNum, ServiceCode → Date
```

Revise the table like so:  
```
Patient (HouseholdNum, HouseholdName, Street, City, State, PostalCode, Balance, PatientNum, PatientName)

Service (PatientNum, ServiceCode, Description, Fee, Date)
```
First, for each determinant that is not a candidate key, remove from the table the columns that depend on this determinant. Next, create a new table containing all the columns from the from the original table that depend on this determinant. This would be the PatientNum. Make the determinate the primary key of this new tables.  

12. Using your knowledge of the college environment, determine the functional dependencies that exist in the following table. After determining the functional dependencies, convert this table to an equivalent collection of tables that are in third normal form. (Pg 167)
```
Student (StudentNum, StudentName, NumCredits, AdvisorNum,
AdvisorName, DeptNum, DeptName, (CourseNum, Description, Term, Grade))
```
Functional Dependencies  
```
StudentNum -> StudentName, AdvisorName, CourseNum, Term, Grade
AdvisorNum -> AdvisorName, DeptNum, DeptName, StudentNum
CourseNum, StudentNum -> Description, Term, Grade
```

Tables  
```
Courses (CourseNum, Description, Term)
Student (StudentNum, StudentName, NumCredits, AdvisorNum)
Advisors (AdvisorNum, AdvisorName, DeptNum)
Departments (DeptNum, DeptName)
Grades (StudentNum, CourseNum. Grade)
```

13. Again, using your knowledge of the college environment, determine the functional or multivalued dependencies that exist in the following table. After determining the functional dependencies, convert this table to an equivalent collection of tables that are in **fourth normal** form.  

ActivityNum and ActivityName refer to activities in which a student can choose to participate. For example, activity number 1 might be soccer, activity 2 might be band, and activity 3 might be the debate team.  

A student can choose to participate in multiple activities.  

CourseNum and Description refer to courses the student is taking. `Student (StudentNum, StudentName, ActivityNum, ActivityName, CourseNum, Description)`  

Functional Dependencies  
```
StudentNum -> StudentName
ActivityNum -> ActivityName
CourseNum -> Description
```
Tables  
```
Student (StudentName, StudentNum)
Activity (ActivityName, ActivityNum)
Courses (CourseNum, Description)
```

14. Assume the same scenario as that given in Question 13 but replace `CourseNum and Description` with `AdvisorNum, LastName, and FirstName` as shown. Advisor refers to the advisor responsible for the activity. **One advisor can be responsible for many activities but each activity has only one advisor**.  
`Student (StudentNum, StudentName, ActivityNum, ActivityName, AdvisorNum, LastName, FirstName)`  

Functional Dependencies  
```
StudentNum -> StudentName
ActivityNum -> ActivityName
AdvisorNum -> LastName, FirstName
```
Tables  
```
Student (StudentName, StudentNum)
Activity (ActivityName, ActivityNum)
Advisors (AdvisorNum, LastName, FirstName)
```

15. The requirements shown in Question 11 have changed. **The dentist’s office would like to add the date of the patient’s last payment**. In which relation (table) would you place this attribute? Why?

Patient table:  
```
PatientNum → HouseholdNum, HouseholdName, Street, City, State, LastPayment, PostalCode, Balance, PatientName
HouseholdNum → HouseholdName, Street, City, State, PostalCode, Balance
ServiceCode → Description, Fee
PatientNum, ServiceCode → Date
```

Revise the table like so:  
```
PatientAccount (PatientNum, Balance, LastPayment)
PatientAddress (PatientNum, HouseholdName, HouseholdNum, Street, City, State, PostalCode)
Service (PatientNum, ServiceCode, Description, Fee, Date)
```
NOTE: This may depend if the requirements are to view the balance in the `Service` Table or last general payment made to the dentist office which can be placed in the `PatientAccount` as in the example above.
