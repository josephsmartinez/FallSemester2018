# Tools for common admin task

## System Logging
Logging Daemons  
syslogd (System Logging)  
klogd (Kernel Logging)  
Funnels through syslog in most distros  
Can view syslogs by their files (/var/log/messages)  
`grep eth0 /var/log/*`  
`tail -f /var/log/messages`  
Can create log messages with logger  
logger System rebooted due to hardware change  
`logger -p local0.crit Major issue detected`  
`logger -i -p mail.err "Oh Noes"`  
`/etc/rsyslog.conf`  
`/etc/rsyslog.d/*.conf`  
Settings are defined by:` .`  
Disable/exclude logging with facility.none  
Facilities  
```
| Keyword | Facility | Description          |
|---------|----------|----------------------|
| 0       | kern     | Kernel Messages      |
| 1       | user     | User Level Messages  |
| 2       | mail     | Mail System          |
| 3       | daemon   | System Daemons       |
| 4       | auth     | Security Messages    |
| 5       | syslog   | Syslogd Messages     |
| 6       | lpr      | Line Printer         |
| 7       | news     | NNTP Server          |
| 8       | uucp     | Unix-to-Unix Copy    |
| 9       | clock    | Time Messages        |
| 10      | authpriv | Private Authent.     |
| 11      | ftp      | FTP Daemon           |
| 12      | -        | NTP                  |
| 13      | -        | Log Audit            |
| 14      | -        | Log Alert            |
| 15      | cron     | Cron Daemon          |
| 16      | local0   | Local Use            |
| 17      | local1   | Local Use            |
| 18      | local2   | Local Use            |
| 19      | local3   | Local Use            |
| 20      | local4   | Local Use            |
| 21      | local5   | Local Use            |
| 22      | local6   | Local Use            |
| 23      | local7   | Local Use            |
```
## Severity Levels
```
|Integer  | Severity | Description          |
|---------|----------|----------------------|
| 0       | emerg    | System Unusable      |
| 1       | alert    | Action Required      |
| 2       | crit     | Critical Condition   |
| 3       | err      | Error Condition      |
| 4       | warning  | Warning Condition    |
| 5       | notice   | Normal Condition     |
| 6       | info     | Informational Mesg   |
| 7       | debug    | Debugging Details    |
```
Remote syslogging is possible
`vi /etc/services`
`syslog 514/udp`
`vi /etc/rsyslog.conf`
`. @loghost.mydomain.com:514`
`. @192.168.0.100`

Log Rotation
`/etc/logrotate.conf`

systemd Journals
Replaces SysLog in systemd systems
Maintains compatibility with syslogd

`/var/log/journal/*`
Some systems do not store logs persistently by default because /var/log/journal may not exist
`sudo mkdir -p /var/log/journal then reboot`
`/etc/systemd/journald.conf`

View logs: `journalctl`
