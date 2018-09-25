# Check Default Installation Permissions of the File System

Using the following command check the file system against a fresh installation OS to see if there is any changes. If so, someone may have changed something within the environment which could be a security issue.
User:
```
find / -perm +4000
find / -perm -u+s
Group:
find / -perm +2000
find / -perm -g+s
```

Both:
```
find / -perm +6000
Use nmap and netstat to discover open ports
View listening ports
netstat -tp
netstat -atp
```

NOTE: You may need a way to compare
