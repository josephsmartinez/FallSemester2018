# Review Questions Chapter Nine
1. What is a distributed database? What is a DDBMS?
- a DBMS capable of supporting and manipulating distributed databases.  

2. What different design decisions do you make to access data rapidly in a centralized database compared to a
distributed database?
- You make design decisions to minimize the number of disk
accesses
- Communication time ¼ access delay þ (data volume / transmission rate)  

3. How does a homogeneous DDBMS differ from a heterogeneous DDBMS? Which is more complex?
- Heterogeneous DDBMSs are more complex than homogeneous DDBMSs and,
consequently, have more problems and are more difficult to manage.

4. What is meant by a local site? by a remote site?
- Systems that support distributed databases should let a user access data at a remote site—a site other than the one at which the user is located—just as easily as the user accesses data from the local site—the site at which the user is located.

5. What is location transparency?
- Location transparency is the characteristic of a DDBMS that users do not need to be aware of the location of data in a distributed database.

6. What is replication? Why is it used? What benefit is derived from using it? What are the biggest potential
problems?
- Replication lets users at different sites use and update copies of a database and
then share their updates with other users.
- Data replication creates update problems that can lead to data inconsistencies.

7. What is replication transparency?
- The steps taken by the DDBMS to update the various copies of data should be done behind the scenes; users should be unaware of the steps.

8. What is data fragmentation? What purpose does data fragmentation serve?
- The main purpose of data fragmentation is to place data at the location where the data is most often accessed.

9. What is fragmentation transparency?
- Users should not be aware of the fragmentation—they should feel as if they are using a single central
database.

10. Why is local control of data an advantage in a distributed database?
- Because each location retains its own data, a location can exercise greater control over that data. With a single centralized database, on the other hand, the central site that maintains the database is usually unaware of all the local issues at the various sites
served by the database.

11. Why is the ability to increase system capacity an advantage in a distributed database?

In a properly designed and installed distributed database, the process of increasing system capacity is often simpler than in a centralized database. If the size of the storage medium at a single site becomes inadequate for its database, you need to increase the capacity of the storage medium only at that site. Furthermore, you can increase the capacity
of the entire database simply by adding a new site.

12. Why is system availability an advantage in a distributed database?

When a centralized database becomes unavailable for any reason, no users can continue processing. In contrast, if one of the local databases in a distributed database becomes unavailable, only users who need data in that particular database are affected; other users can continue processing in a normal fashion. In addition, if the data has been replicated (another copy of it exists in other local databases), potentially all users can continue processing. However, processing for users at the site of the unavailable database will be much less efficient because data that was formerly obtained locally must now be obtained through communication
with a remote site.

13. Why is increased efficiency an advantage in a distributed database?
- When data is available locally, you eliminate network communication delays and can retrieve data faster than with a remote centralized database.

14. What are two disadvantages of updating replicated data in a distributed database?
- Because most of these copies are at sites other than the site initiating the update, each update transaction requires extra time to update each copy and extra time to communicate all the update messages over the network.
- If all updates must be made or none at all, the update transaction fails.

15. What causes query processing to be more complex in a distributed database?
- The complexity occurs because of the difference in the time it takes to send messages between sites and the time it takes to access a disk.

16. What is meant by local deadlock? by global deadlock?
- Local deadlock is deadlock that occurs at a single
site in a distributed database.
- global deadlock involves one transaction that requires a record held by a second transaction at one site, while the second transaction requires a record held by the first transaction at a different site.

17. Describe the two-phase commit process. How does it work? Why is it necessary?
A DDBMS usually prevents this potential inconsistency through the use of two-phase commit. The basic idea of two-phase commit is that one site, often the site initiating the update, acts as coordinator. In the first phase, the coordinator sends messages to all other sites requesting that they prepare to update the database; in other words, each site acquires all necessary locks. The sites do not update at this point, however, but they do send messages to the coordinator stating that they are ready to update. If for any reason any site cannot secure the necessary locks or if any site must abort its updates, the site sends a message to the coordinator that all sites must abort the transaction. The coordinator waits for replies from all sites involved before determining whether to commit the update. If all replies are positive, the coordinator sends a message to each site to commit the update. At this point, each site must proceed with the commit process. If any reply is negative, the coordinator sends a message to each site to abort the update, and each site must follow this instruction. In this way, the DDBMS guarantees consistency.

18. Describe three possible approaches to storing data dictionary entries in a distributed system.

19. What additional factors must you consider during the information-level design of a distributed database?

20. What additional factors must you consider during the physical-level design of a distributed database?

21. List and briefly describe the 12 rules against which you can measure DDBMSs.

22. What is the difference between a file server and a client/server system?

23. In a two-tier client/server architecture, what problems occur when you place the business functions on the clients?
on the server?


24. What is a fat client? What is a thin client?
- When the clients perform the business functions—each client is called a fat client
- To eliminate the fat client maintenance problem, you can place the business functions on the server. Because clients perform only the presentation functions in this arrangement, each client is called a thin client.

25. What is scalability?
- Scalability is the ability of a computer system to continue
to function well as utilization of the system increases.

26. What is a three-tier architecture?
- In a three-tier architecture, the clients perform the presentation functions, a database server performs the database functions, and separate computers (called application servers) perform the business functions and serve as an interface between clients and the database server.

27. List the advantages of a client/server architecture as compared to a file server.

28. What are HTTP and TCP/IP?
- Hypertext Transfer Protocol (HTTP), which is the data communication method used by Web clients and Web servers to exchange
- Transmission Control Protocol/ Internet Protocol (TCP/IP), which is the standard protocol for all communication on the Internet. data on the Internet.

29. What are dynamic Web pages? How can you augment HTML to provide the dynamic capability?
- Web servers use dynamic Web pages, which are pages whose content changes in response to the different inputs and choices made using Web clients.

30. Explain why HTTP is a stateless protocol and what types of techniques are used in e-commerce to deal with this complication.

Business to business (B2B), is an important part of communication across the Internet. Organizations send data from their databases to the databases of other organizations, and those organizations that send data need to receive data in return. In these situations, the structure and meaning of the transmitted data are of utmost importance because organizations structure common data, such as product data and cost data, in their databases in different ways.

31. What is XML? Why was it developed?
Extensible Markup Language (XML), a metalanguage derived from a restricted subset of SGML, is designed for the exchange of data on the Web. Using XML, you can create text documents that follow simple, specific rules for their content and you can define new tags that define the data in the document and the structure of the data so that programs running on any platform can interpret and process the document.

32. What is the purpose of DTDs and XML schemas?
A Document Type Definition (DTD) specifies the elements (tags), the attributes (characteristics associated with each tag), and the element relationships for an XML document. The DTD can be a separate file with a .dtd extension, or you can include it at the beginning of an XML document.

33. What does XSLT accomplish?

XSL Transformations (XSLT), which defines the rules to process an XML document and change it into another document; this other document may be another XML document, an XSL document, an HTML or XHTML document, or most any other type of document.

34. What are the characteristics of OLTP systems?

Among the objectives that organizations have when they use RDBMSs are data integrity, high performance, and ample availability. The leading RDBMSs are able to satisfy these requirements. Typically, when users interact with an RDBMS, they use transactions, such as adding a new order and changing a customer’s sales rep. Thus, these types of systems are called online transaction processing (OLTP) systems.

35. What is a data warehouse?
- A data warehouse is a subject-oriented, integrated, time-variant, nonvolatile collection of data in support of management’s decision-making process.

36. What does it mean when a data warehouse is nonvolatile?
- Nonvolatile means that data is read-only. Data is loaded into a data warehouse periodically, but users cannot update a data warehouse directly.

37. What is a fact table in a data warehouse?
- A fact table consists of rows that contain consolidated and summarized data.

38. When do you use OLAP?
Access to a data warehouse is accomplished through the use of online analytical processing (OLAP) software. OLAP software, whether it’s part of the DBMS or a separate product, is optimized to work efficiently with data warehouses.

39. What three types of actions do users typically perform when they use OLAP software?
- Users perceive the data in a data warehouse as a multidimensional database in the shape of a data cube. OLAP software lets users slice and dice data, drill down data, and roll up data.

40. What is data mining?
Data mining consists of uncovering new knowledge, patterns, trends, and rules from the data stored in a data warehouse.

41. What are the 12 rules against which you can measure OLAP systems?
Multidimensional conceptual view, Transparency, Accessibility, Consistent reporting performance, Client/server architecture, Generic dimensionality, Dynamic sparse matrix handling, Multiuser support, Unrestricted, cross-dimensional operations, Intuitive data manipulation, Flexible reporting, Unlimited dimensions and aggregation levels.

42. What is an OODBMS?
object-oriented database management system (OODBMS) is a database management system in which data and the actions that operate on the data are encapsulated into objects.

43. What is a domain?
- A domain is the set of values permitted for an attribute.

44. How do classes relate to objects?
The term class refers to the general structure. The term object refers to a specific occurrence of a class. Thus, Rep is a class, whereas the data for rep 15 is an object.

45. What is a method? What is a message? How do messages relate to methods?
- Methods are the actions defined for a class.

46. What is inheritance? What are the benefits to inheritance?

A key feature of object-oriented systems is inheritance. For any class, you can define a subclass. Every occurrence of the subclass is also considered an occurrence of the class. The subclass inherits the structure of the class as well as its methods. In addition, you can define additional attributes and methods for the subclass.

47. What is the UML?
- The Unified Modeling Language (UML) is an approach you can use to model all the various aspects of software development for object-oriented systems.

48. What are relationships called in UML?
- Relationships are called associations.

49. What is a visibility symbol in UML?
- Visibility symbols indicate whether other classes can view or change the value in an attribute.

50. What is multiplicity?
- Multiplicity indicates the number of objects that can be related to an individual object at the other end of the relationship.

51. What is generalization?
- Generalization is the relationship between a superclass and a subclass

52. What are the 14 rules against which you can measure object-oriented systems?

53. Use a Web browser to find three examples of static Web pages and three examples of dynamic Web pages,
and note the URLs for each page you find. Explain the purpose of each page and why you believe it was created
as a static page or a dynamic page. For dynamic pages, what kinds of processing happens on each page?

54. Using your knowledge of the college environment, identify three transactions that might be handled by online
transaction processing (OLTP) systems.

55. Using your knowledge of the college environment, identify three questions to answer using online analytical processing
(OLAP) software.
