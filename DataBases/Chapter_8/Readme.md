# Review Questions Chapter Eight

1. What is a DBA? Why is this position necessary?
- The DBA is the database administrator, or the person responsible for the database. The DBA is necessary because his responsibilities are critical to success in a database environment, especially when the database is shared among many users.

2. What are the DBA’s responsibilities regarding access privileges?
### The DBA’s responsibility regarding access privileges is to:
- determine access privileges for all users
- enter the appropriate authorization rules in the DBMS catalog
- ensure that users access the database only in ways to which they are entitled
- documents the access privilege policy; top-level management approves the policy
- communicates the policy to management and to all users.

3. What are the DBA’s responsibilities regarding security?
- After the DBA determines the access privileges for each user, the DBA creates security policies and procedures, obtains management approval of the policies and procedures, and then distributes them to authorized users.

- The DBA uses the DBMS’s security features, such as encryption, authentication, authorizations, and views, and uses special security programs, if necessary. Finally, the DBA monitors database usage to detect potential security violations and takes corrective action if a violation occurs.

4. What is a disaster recovery plan?
- A disaster recovery plan is a plan that specifies the ongoing and emergency actions and procedures required to ensure data availability, even if a disaster occurs.  

-A disaster recovery plan must include plans for protecting an organization’s data against hard drive failures and electrical power loss.  In order to protect against hard drive failures, organizations often use a redundant array of inexpensive/independent drives (RAID), in which database updates are replicated to multi-drives.  

- To protect against electrical power interruptions and outages, organization use an uninterruptible power supply (UPS), which is a power source such as a battery or fuel cell, for short interruptions and a power generator for longer outages.  

5. What are data archives? What purpose do they serve? What is the relationship between a database and its data archives?

- Certain data, although no longer needed in the production database, must be kept for future reference. A data archive is a place for storing this type of data.

- The use of data archives lets an organization keep data indefinitely, without causing the database to become unnecessarily large. Data can be removed from the database and placed in the data archive, instead of just being deleted.

6. Name five categories that you usually find on a DBMS evaluation and selection checklist.

- The DBA leads the DBMS evaluation and selection effort.  To evaluate the DBMS candidates objectively, the DBA usually prepares a checklist of desirable features for a DBMS and evaluates each prospective purchase of a DBMS against the checklist.  Five categories that can be found on a DBMS evaluation and selection checklist are:
- data definition
- data dictionary
- integrity
- vendor support
- concurrent update.  

7. What is a shared lock? What is an exclusive lock?

- A shared lock permits other users to read the data.

- An exclusive lock prevents other users from accessing the data in any way.

8. What is a LAN?

- A LAN is a local area network.  It is a configuration of several computers connected together that allows users to share a variety of hardware and software resources.  One of these resources is the database.  

- In a LAN, support for concurrent update is very important because many users might be updating the database at the same time.  

9. What is context-sensitive help?

- Context-sensitive help means that if a user is having trouble and asks for help, the DBMS will provide assistance for the particular feature being used at the time the user asks for help.

10. What is an intranet?

- An intranet is a private network that is contained within an enterprise. It may consist of many interlinked local area networks and also use leased lines in the wide area network. Typically, an intranet includes connections through one or more gateway computers to the outside Internet.

11. After a DBMS has been selected, what is the DBA’s role in DBMS maintenance?

- The DBA installs the DBMS, makes any changes to its configuration when they are required, determines whether it is appropriate to install a new version of the DBMS when it becomes available, applies any vendor fixes to problems, coordinates problem resolution, and coordinates the users so that their needs are satisfied without unduly affecting other users.

12. What are the DBA’s responsibilities with regard to the data dictionary?

- The DBA’s responsibility with regards to the data dictionary is to maintain the data dictionary.  

- The DBA must establish naming convention for its content such as tables, fields, indexes, and so on.  

- The DBA creates the data definitions for all tables, as well as for any data integrity rules and user views.  

- The DBA also updates the contents of the data dictionary.  

- The DBA creates and distributes appropriate reports from data dictionary to users, programmers, and other people in the organization.

13. Who trains computer users in an organization? What is the DBA’s role in this training?

- The DBA does some of the training of computer users. The DBA coordinates other training, such as that provided by software vendors.

14. What are the DBA’s database design responsibilities?

- The DBA establishes a sound methodology for database design and ensures that all database designers follow the same methodology.  The DBA verified that the designers obtain all pertinent information from the appropriate users.  After the database designers complete the information-level design, the DBA does the physical-level design.  
- The DBA establishes documentation standards for all the steps in the database design process.  
- The DBA makes sure that these standards are followed, and that the documentation is kept up to date.  
- The DBA ensures that the appropriate personnel have access to the documentation that they need.  
- The DBA reviews all changes to requirements and determines whether the changes will require that modifications be made to the database.  If changes are necessary, the DBA makes the changes in the design and in the data in the database.  
- The DBA verifies that programmers modify all programs and documentation affected by the change.

15. What is the difference between production and test systems?
- The production system is the hardware, software, and database for the users; the test system is a separate system that programmers use to develop new programs and
modify existing programs.

16. What is meant by “tuning a design?”

- Tuning a design is when the DBA changes the database design to improve the performance.  

- The DBA can make some performance changes to the database design by creating and deleting indexes, splitting tables, and changing the table design.

17. How can splitting a table improve performance?

- If users access only certain fields in a table, splitting the table results in smaller tables than the original; the smaller amount of data moves faster between disk and memory and across a network.

18. What is denormalization?

- Denormalization converts a table that is in third normal form to a table that is no longer in third normal form.  Denormalizing introduces anomaly problems but can decrease the number of disk accesses required by certain types of transactions, thus improving performances.  

19. You are employed as a DBA for a medical practice. You have implemented multiple safeguards to protect patient privacy and conform to HIPAA regulations. What other practical, common-sense measures should you take to ensure that the database system is secure? Identify at least three measures and explain the purpose of each one.

Some steps would be:
- determine access privileges for all users
- enter the appropriate authorization rules in the DBMS catalog
- ensure that users access the database only in ways to which they are entitled
- documents the access privilege policy; top-level management approves the policy
- communicates the policy to management and to all users.
Then:
Employ security features, such as encryption, authentication, authorizations, and views, and uses special security programs, if necessary. Finally, monitor database usage to detect potential security violations and takes corrective action if a violation occurs.

20. For credit card processing, stock exchanges, and airline reservations, data availability must be continuous. There are many other examples of mission-critical applications. Research the Internet to find four additional mission-critical applications and explain why data availability must be continuous for these applications. Be sure to cite your references.


[Travel](http://revistadelafacultaddeingenieria.com/index.php/ingenieria/article/viewFile/2192/2152)
[Insurance](http://www-935.ibm.com/services/uk/en/attachments/pdf/IBM_BAO_Big_Data_Insurance_WEB.pdf)
[Navigation Software (Autonomous Vehicles)](https://www.sdcexec.com/software-technology/article/12218394/nextgeneration-navigation-when-big-data-drives-innovation-drivers-win-advertorial)
[Hospital Records](http://www.ijcte.org/vol10/1190-D3004.pdf)  
