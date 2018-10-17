# Forward Recovery & Back Recovery (Rollback) Scenario
### Joseph Martinez
About:  
- Current prod database is damaged and is not available. Assume that we have a copy of the production database from a couple of days ago, and the full copy of the transaction log. We can use out database backup (a couple of days old) and apply the transactions of the transaction log because they contain the after images).

- Assume that our production database has a set of transaction which are executed so that our database is in an inconsistent state. We want to essentially do a rollback of the transactions that were committed. We can do this because we have access to the before images of the committed transaction in the transaction log.   

<hr>

### / /Mount the docker container to the host server
root@ubuntu_server /var/log/docker/mysqlLogs # `docker container run -d -p 3307:3307 --name mysqldb --mount type=bind,src=/var/log/docker/mysqlLogs,target=/var/log  -e MYSQL_ROOT_PASSWORD=password  mysql`  
root@ubuntu_server /var/log/docker/mysqlLogs # `docker run --name myadmin -d --link mysqldb:db -p 8080:80 phpmyadmin/phpmyadmin`  
root@ubuntu_server /var/log/docker/mysqlLogs # `docker exec -it 8561f95d997a  /bin/bash`  

### // Check the database inside the running container
root@mysql_container:/var/log# `mysql -u root -p`  
mysql> `show databases`
```
+--------------------+
| Database           |
+--------------------+
| COLONIAL           |
| TAL                |
| information_schema |
| mysql              |
| performance_schema |
| sys                |
| test               |
+--------------------+
7 rows in set (0.00 sec)
```
mysql> `exit;`  

### // Dump the TAL database
root@mysql_container:/var/log# `mysqldump --databases TAL > /var/log/TAL.sql.backup`  
root@mysql_container:/var/log# `exit`  

### // Verify the file in the server's mount point
root@ubuntu_server /var/log/docker/mysqlLogs # `ls`  
**TAL.sql.backup**  

### // Drop the TAL database
root@ubuntu_server /var/log/docker/mysqlLogs # `docker exec -it 8561f95d997a  /bin/bash`  
root@mysql_container:/var/log# `mysql -u root -p`  
mysql> `drop database TAL;`  
mysql> `show databases;`  
```
+--------------------+
| Database           |
+--------------------+
| COLONIAL           |
| information_schema |
| mysql              |
| performance_schema |
| sys                |
| test               |
+--------------------+
6 rows in set (0.00 sec)
```
mysql> `exit;`  

### // Reload a dump file written by mysqldump
root@mysql_container:/var/log#  `cp /var/log/TAL.sql.backup /var/log/TAL.sql`  
root@mysql_container:/var/log#  `mysql -u root -p  < /var/log/TAL.sql`  
root@mysql_container:/var/log# `mysql -u root -p`  
mysql> `show databases;`  
```
+--------------------+
| Database           |
+--------------------+
| COLONIAL           |
| TAL                |
| information_schema |
| mysql              |
| performance_schema |
| sys                |
| test               |
+--------------------+
7 rows in set (0.01 sec)
```
mysql> `use TAL;`  
```
Reading table information for completion of table and column names
You can turn off this feature to get a quicker startup with -A
Database changed
mysql> show tables;
+---------------+
| Tables_in_TAL |
+---------------+
| Customer      |
| Item          |
| OrderLine     |
| Orders        |
| Rep           |
+---------------+
5 rows in set (0.00 sec)
```
mysql> `describe Customer;`  
```
+--------------+--------------+------+-----+---------+-------+
| Field        | Type         | Null | Key | Default | Extra |
+--------------+--------------+------+-----+---------+-------+
| CustomerNum  | char(3)      | NO   | PRI | NULL    |       |
| CustomerName | char(35)     | NO   |     | NULL    |       |
| Street       | char(20)     | YES  |     | NULL    |       |
| City         | char(15)     | YES  |     | NULL    |       |
| State        | char(2)      | YES  |     | NULL    |       |
| PostalCode   | char(5)      | YES  |     | NULL    |       |
| Balance      | decimal(8,2) | YES  |     | NULL    |       |
| CreditLimit  | decimal(8,2) | YES  |     | NULL    |       |
| RepNum       | char(2)      | YES  |     | NULL    |       |
+--------------+--------------+------+-----+---------+-------+
9 rows in set (0.00 sec)
```
mysql> `select * from Customer;`  
```
+-------------+-------------------------------+--------------------+------------+-------+------------+---------+-------------+--------+
| CustomerNum | CustomerName                  | Street             | City       | State | PostalCode | Balance | CreditLimit | RepNum |
+-------------+-------------------------------+--------------------+------------+-------+------------+---------+-------------+--------+
| 126         | Toys Galore                   | 28 Laketon St.     | Fullton    | CA    | 90085      | 1210.25 |     7500.00 | 15     |
| 260         | Brookings Direct              | 452 Columbus Dr.   | Grove      | CA    | 90092      |  575.00 |    10000.00 | 30     |
| 334         | The Everything Shop           | 342 Magee St.      | Congaree   | CA    | 90097      | 2345.75 |     7500.00 | 45     |
| 386         | Johnson's Department Store    | 124 Main St.       | Northfield | CA    | 90098      |  879.25 |     7500.00 | 30     |
| 440         | Grove Historical Museum Store | 3456 Central Ave.  | Fullton    | CA    | 90085      |  345.00 |     5000.00 | 45     |
| 502         | Cards and More                | 167 Hale St.       | Mesa       | CA    | 90104      | 5025.75 |     5000.00 | 15     |
| 586         | Almondton General Store       | 3345 Devon Ave.    | Almondton  | CA    | 90125      | 3456.75 |    15000.00 | 45     |
| 665         | Cricket Gift Shop             | 372 Oxford St.     | Grove      | CA    | 90092      |  678.90 |     7500.00 | 30     |
| 713         | Cress Store                   | 12 Rising Sun Ave. | Congaree   | CA    | 90097      | 4234.60 |    10000.00 | 15     |
| 796         | Unique Gifts                  | 786 Passmore St.   | Northfield | CA    | 90098      |  124.75 |     7500.00 | 45     |
| 824         | Kline's                       | 945 Gilham St.     | Mesa       | CA    | 90104      | 2475.99 |    15000.00 | 30     |
| 893         | All Season Gifts              | 382 Wildwood Ave.  | Fullton    | CA    | 90085      |  935.75 |     7500.00 | 15     |
+-------------+-------------------------------+--------------------+------------+-------+------------+---------+-------------+--------+
12 rows in set (0.00 sec)
```
mysql> `exit;`  

<hr>

Resources:  
## MySQL Backup and Recovery  
1.4.1 Dumping Data in SQL Format with mysqldump  
[Dumping Data](https://dev.mysql.com/doc/mysql-backup-excerpt/5.7/en/mysqldump-sql-format.html)  
1.4.2 Reloading SQL-Format Backups  
[Reloading Data](https://dev.mysql.com/doc/mysql-backup-excerpt/5.7/en/reloading-sql-format-dumps.html)
