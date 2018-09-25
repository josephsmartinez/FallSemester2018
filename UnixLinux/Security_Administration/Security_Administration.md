# CompTIA Linux+ (LX0-104)

## 10.1 Security Administration
Audit system for files with suid/sgid bit set
Set user ID bit allows a program to run as the owner of the file instead of the current user
passwd is an example as it is allowed to write to /etc/passwd whereas a user cannot

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

### Actively scan with nmap
`yum install nmap`

Basic scan nmap
`nmap [host]`

Reserved port scan
`nmap -v`

Stealth SYN and OS Detection
`nmap -sS -O 192.168.0.1/24`

### Limits
Setup limits on user logins, processes and memory usage
View limits
`ulimit -a` Can temporarily set limits

To persistently set limits
`/etc/security/limits.conf`

NOTE: DOS Attacks can come from the network or within the user by hogging CPU space.

### Sudo configuration and usage
`sudo` Executes command as root

Password cached for five minutes by default
User must be authorized to run sudo
In some distros (like Ubuntu) simply add 'sudo' group as a secondary group
In others (like RedHat) you must create your own group and add it to /etc/sudoers
`visudo`
dpezet ALL=(ALL)
%techsupport localhost=/sbin/mount /mnt/cdrom, /sbin/umount /mnt/cdrom

### Turn off network services not in use
Extended Internet Daemon (xinetd) /etc/xinetd.conf (If present) yum install xinetd /etc/xinietd.d/*

**TCP wrappers** | Any service that links to `libwrap` you can create a `.allow` or `.deny` **ONLY USE ONE allow or deny**
Network access control system to filter connections Applies to anything that depends on libwrap (like xinetd)
`ldd /usr/sbin/sshd | grep wrap`
`/etc/hosts.allow`
`/etc/hosts.deny`
sshd : 192.168.0.1
OR sshd : 192.168.0.0/255.255.255.0
ALL : ALL Deny is checked first, then allow overrides it

## SECTION COMMANDS:
Listening port and programs
`netstat -tp`
Get idle ports too
`netstat -atp`
Processes Running
`top`
List dynamic libraries
`ldd`
