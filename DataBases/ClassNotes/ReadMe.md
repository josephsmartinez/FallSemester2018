###

```
data  -name
|      -type
|
|----column  - attribute
      |      - related
      |
      |----record - relates
              |
              |---- table
                      |
                      |----RDB
                            |
                            DB Cluster
                              |
                              |----Warehouse
```
### Definitions
```
SELECT - column
FROM - data source (Start reading from here)
WHERE - filter (then filters the information)
```
- From customer, show me, all attributes
`SELECT * FROM customer;`
- Example Simple Query
`customername AS cname,creditlimit,balance,creditlimit-balance AS availbalance FROM Customer;`
- Example
`SELECT Street + ' ' + City + ', ' + [State] + ' ' + PostalCode AS FullAddress FROM customer;`

http://cse.unl.edu/~sscott/ShowFiles/SQL/CheatSheet/SQLCheatSheet.html
