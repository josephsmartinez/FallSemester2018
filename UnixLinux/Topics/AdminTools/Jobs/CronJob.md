# Scheduling Jobs

Creating a New Crontab
The crontab can be created easily by using the crontab command.

To Create or Edit your cron jobs

user@machine:~$ crontab -e
Crontab Commands
crontab -e Edit or create a crontab file if doesn’t already exist.
crontab -l To Display the crontab file.
crontab -r To Remove the crontab file.
crontab -v To Display the last time you edited your crontab file. (This option is only available on a few systems.)



https://www.codementor.io/akul08/the-ultimate-crontab-cheatsheet-5op0f7o4r



### Data Base Back Up
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
https://mariadb.com/kb/en/library/configuring-mariadb-with-mycnf/
