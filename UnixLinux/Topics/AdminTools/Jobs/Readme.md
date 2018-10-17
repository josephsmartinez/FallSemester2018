# Job Scheduling in Unix and Linx

at and batch
- execute command in the future
- as one-time sceduled jobs
- controlled by atd service
- batch conditionally executes jods if system cpu < 80%

cron, anacron, systemd
- used to schedule recurrent jobs
- controlled by cron service

A cron configuration file is called a crontab

Three levels

system wide / global
/etc/crontab - reg txt

package
/etc/con.d

user
/var/spool/cron/username

contab -e

if root to set up crontab for another user:
crontab

policies:
/etc/cron.d
/etc/cron.d

## at
time specific  < script file
spooler /var/spool/at

utilities:
atq - list pending at jobd
atrm joctl - cancel/ service pending jobs

policies:
/etc/at.allow
/etc/at.deny

time spec:
at noon
at noon + 5 minutes
at 4pm + 5 days
at noon October 15
at 10am /10/20/2018
at 3:00am tomorrow

owner of the jobs is only...?

Structure of contab entries fields:
___ minutes  00-59 = *
___ hour     0-23 = *
___ day of the month = 01 - 31 = *
___ month 01 - 12 = *  
___ day of week 0-6 = * (co=sunday, 6=saturday)

```
# m h dom mon dow  user    command
17  *   *   *   *   root    python /etc/jobs/myjob_script.py
25  6   *   *   *   root    test -x /usr/sbin/anacron || ( cd / && run-parts --report /etc/cron.daily )
47  6   *   *   7   root    test -x /usr/sbin/anacron || ( cd / && run-parts --report /etc/cron.weekly )
52  6   1   *   *   root    test -x /usr/sbin/anacron || ( cd / && run-parts --report /etc/cron.monthly )
```
Time formating options
```
*/2
15-45/5
```

```
5   0   * * * $HOME/bin/backup.sh >> $HOME/tmp/out 2>$1

The output is sent to the owner of the job, if no re-direction is specified.  

15  15  1 * * $HOME/bin/clean.sh

0 22 * * 1-5 mail -s "check log files now!!!" admin@fiu.edu  

23 0-22/2 * * * echo "check something now!!!"

```
