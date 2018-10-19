# Scheduling Jobs

```
vim .my.cnf

[client]
user = root
password = playnice

vim /etc/crontab

# For details see man 4 crontabs

# Example of job definition:
# .---------------- minute (0 - 59)
# |  .------------- hour (0 - 23)
# |  |  .---------- day of month (1 - 31)
# |  |  |  .------- month (1 - 12) OR jan,feb,mar,apr ...
# |  |  |  |  .---- day of week (0 - 6) (Sunday=0 or 7) OR sun,mon,tue,wed,thu,fri,sat
# |  |  |  |  |
# *  *  *  *  * user-name  command to be executed
  *  *  *  *  * /usr/bin/mysqldump --defaults-file=/root/.my.cnf -u root --all-databases --single-transaction --quick --lock-tables=false  > /root/Documents/SqlBackup/full-backup-$(date +%F).$(date +"%T").sql
 ```
