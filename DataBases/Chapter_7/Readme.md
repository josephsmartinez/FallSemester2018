# Review Questions Chapter Seven
```
commit
concurrent update
database password
data dictionary
data independence
deadlock
deadly embrace
decrypting
encryption
forward recovery
growing phase
journal
journaling
locking
log
metadata
nonprocedural language
password
permission
privacy
procedural language
recovery
replica
replicate
rollback
save
shrinking phase
smart card
synchronization
timestamp
timestamping
transaction
two-phase locking
utility services
victim
workgroup
```

1. When users update and retrieve data, what tasks does a DBMS perform that are hidden from the users?

-	In updating and retrieving data, users do not need to know how data is physically structured on disk nor what processes the DBMS uses to manipulate the data. These structures and manipulations are solely the responsibility of the DBMS.

2. What is metadata? Which component of a DBMS maintains metadata?

- Metadata is data about the data in a database. The catalog component of a DBMS maintains metadata about tables, fields, table relationships, views, indexes, users, privileges, and replicated data.

3. How does a catalog differ from a data dictionary?

- Most PC-based DBMSs contain a catalog that maintains metadata about tables, fields, table relationships, views, indexes, users, privileges, and replicated data. Large, expensive DBMSs usually contain a data dictionary that serves as a super-catalog containing the same metadata as a catalog and additional metadata such as that needed to track fragmented data.

4. What is meant by concurrent update?

-	Concurrent update occurs when multiple users make updates to the same database at the same time.

5. Describe a situation that could cause a lost update.

- A lost update could occur in a concurrent update situation when two users attempt to update the same data at the same time, and the DBMS does not does not have concurrency update features such as two-phase locking or timestamping.

6. What is locking and what does it accomplish?

- Locking denies access by other users to data while the DBMS processes one user’s updates to the database. A DMBS uses locking to prevent lost updates.

7. What is a transaction?

- A transaction is a set of steps completed by a DBMS that accomplishes a single user task; the DBMS must successfully complete all transaction steps or none at all for the database to remain in a correct state.

8. Describe two-phase locking.

- Two-phase locking is an approach for handling locks to prevent lost updates. During the first (or growing) phase, the DBMS locks more rows and releases none of the locks. After the DBMS acquires all the locks needed for the transaction and has completed all database updates, there is a second (or shrinking) phase in which the DBMS releases all the locks and acquires no new locks.

9. What is deadlock? How does it occur?

- Deadlock occurs in a concurrent update situation when the first user is waiting for data that has been locked by a second user, and the second user is waiting for data that has been locked by the first user. Unless outside action occurs, each user could wait for the other’s data forever. Deadlock occurs when each of the two users is attempting to access data that is locked by the other user.

10. How do some DBMSs use timestamping to handle concurrent update?

- With timestamping the DBMS assigns to each database update the unique time when the update started; this time is called a timestamp. In addition, every database row includes the timestamp associated with the last update to the row. The DBMS processes updates to the database in timestamp order. If two users try to change the same row at the same time, the DBMS processes the change with the earlier timestamp. The other transaction is restarted and assigned a new timestamp value.

11. What is recovery?
•	Recovery is the process of returning the database to a state that is known to be correct from a state known to be incorrect.

12. What is journaling? What two types of images does a DBMS output to its journal?

- Journaling is a feature of an enterprise DBMS that maintains a journal or log of all updates to the database. This avoids the costly and time-consuming process of having users redo their work. The log is maintained as a separate file from the database. This allows the log to still be available if a catastrophe destroys the database.

-	The two types of images that the DBMS outputs to its journal are the before image and the after image. The before image is a record of what the data in the row looked like in the database before the update. The after image is a record of what the data in the row looked like in the database after the update.

13. When does a DBA use forward recovery? What are the forward recovery steps?

- A DBA uses forward recovery when a catastrophe
destroys a database. Forward recovery consists of two steps. First, the DBA copies the most recent database backup over the live database. Second, the DBMS forward recovery feature uses the log to apply after images for committed transactions.

14. When does a DBA use backward recovery? What does the DBMS do to perform backward recovery?

-	A DBA will use a backward recovery to recover the database to a valid state by undoing the problem transactions. This can occur if the database has not been destroyed, the problem must involve transactions that were either incorrect or, more likely, stopped midstream causing the database to not be in a valid state.

-	To perform a backward recovery also known as a rollback, the DBA must read the log for the problem transactions and apply the before image to undo their updates.

15. What is security?

-	Security is the prevention of unauthorized access, either intentional or accidental, to a database.

16. What is encryption? How does encryption relate to security?

17. What is authentication? Describe three types of authentication.

-	Authentication refers to techniques for identifying the person who is attempting to access the DBMS. Three types of authentication are passwords, biometrics, and database passwords. A password is a string of characters assigned by the DBA to a user that the user must enter to access the database. Biometrics identify users by physical characteristics such as fingerprints, voiceprints, handwritten signatures, and facial characteristics. A database password is a string of characters assigned by the DBA to a database that users must enter before they can access the database.

18. What are authorization rules?

19. What are permissions? Explain the relationship between permissions and workgroups.
-	Permissions specify what kind of access a user has to objects in a database. A workgroup is a group of users, and a DBA usually assigns appropriate permissions to workgroups.

20. How do views relate to security?

21. What is privacy? How is privacy related to security?

-	Privacy refers to the right of individuals to have certain information about them kept confidential. Privacy and security are related because it is only through appropriate security measures that privacy can be ensured.

22. What are integrity constraints? Describe four different ways to handle integrity constraints. Which approach is the most desirable?

23. What is data independence?

-	Data independence is a property that lets you change a database structure without requiring you to change the programs that access the database.

24. What is replication? What is synchronization?

25. Describe three utility services that a DBMS should provide.

-	Some utility services that a DBMS should provide include services that let you change the database structure; services that let you add new indexes and delete indexes that are no longer needed; facilities that let you use the services available from your operating system; services that let you export data to and import data from other software products; services that provide support for easy-to-use edit and query capabilities, screen generators, report generators, and so on; support for both procedural and nonprocedural languages; and support for an easy-to-use menudriven or switchboard-driven interface that allows users to tap into the power of the DBMS without having to resort to a complicated set of commands.

26. What is a procedural language? What is a nonprocedural language?

27. Assume that you need to withdraw $100 from your checking account using your bank’s ATM machine. What set of steps does the DBMS need to perform to complete your transaction?

28. How well does your school’s DBMS fulfill the functions of a DBMS as described in this chapter? Which functions are fully supported? Which are partially supported? Which are not supported at all?
