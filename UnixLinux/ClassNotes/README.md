# Fall 18 Linux Class

### HTTP set up
`firewall-cmd --permanent --add-port=80/tcp`
`firewall -cmd --reload`
`firewall-cmd --list-all-zone`
`firewall-cmd --lits-ports`
`firewall-cmd --permanent --add-port=200-300/tcp`
`firewall-cmd --list-services`
`systemctl restart network.service`
`ifup`
`ifdown`

- condig files for network adapters
`/etc/sysconfig/network-script/`

- predefined services config file
`/usr/lib/firewall/service/http.xml`

### File Types in UNIX/Linux
- regualr files (-)
	- text / ascii
	- binary (bag of bytes)
- Directory (d)
directory file are binary files

- file permission level
`type 	--- 	   --- 		    ---
		file-owner group-owner other`

- characters special device (c)
linked to slow I/O devices
`mkdev`

- block speacial device (b)
linux to high speend I/O device

- Local Domain Sockets (S)
a type of internal process communitcation mechanism (IPC)
`mknod`

- named pipes (p)
yet antoher IPC mechanism available to process in UNIX/Linux
`mkfifo`


The send, receive, and reply operations may be synchronous or asynchronous. A synchronous operation blocks a process till the operation completes. An asynchronous operation is non-blocking and only initiates the operation. The caller could discover completion by some other mechanism discussed later.

### Thread Synchronization Mechanisms in Python
http://effbot.org/zone/thread-synchronization.htm

- Information about locks (information about interactive devices)
`see man lpcs`

## Class Notes: 9-5-2018
File Types
- Hard and Soft Links
**Hard Links**, stores block number of target  
Limited to references file object target within local filesystem  
File system manager keeps a reference count on the target object
**Soft Links  / Symbolic**  
Stores path to target  
Can reference file objects that reside on remote or external storage device  
**ln - make links between files**
`ln`


Example with Sym-Link, Devices, etc...

s - Local domain sockets
c - characters
d -
l -

** l , c, s **
```
lrwxrwxrwx  1 root root           4 Aug 22 14:07 rtc -> rtc0
crw-------  1 root root    251,   0 Aug 22 14:07 rtc0
drwxrwxrwt  2 root root          40 Aug 22 14:07 shm/
crw-------  1 root root     10, 231 Aug 22 14:07 snapshot
drwxr-xr-x  2 root root          80 Aug 22 14:07 snd/
lrwxrwxrwx  1 root root          15 Aug 22 14:07 stderr -> /proc/self/fd/2
lrwxrwxrwx  1 root root          15 Aug 22 14:07 stdin -> /proc/self/fd/0
lrwxrwxrwx  1 root root          15 Aug 22 14:07 stdout -> /proc/self/fd/1
```

### Hidden File Permissions (Use Symbolic link `ln` )
`setuid`  
`setgid`  
`dirtybit`  

NOTES:  
Executation a directory:  
allows the user to set the location that directory.

Execute allow the removal of files from a directory, unless using the dirtybit to block other user from modifying the content of the directory.

```
    sS            sS            tT
- - -         - - -         - - -

user owner    group owner   others/
```

`chmod [arguments] [file object]`  
` chmod [OPTION]... OCTAL-MODE FILE...`  
+ set privileges  
- remove privileges  

```
1 - execute
2 - write
3 - execute & write (1 + 2)
4 - read only
5 - read & execute (4 + 1)
6 - read & write (4 + 2)
7 - read, write, execute (4 + 2 + 1)
```

Example:  
chmod a+rwx  
Grant all privileges to all users  

chmod  u+w  
Grant users write access  

chmod a-rx  
Remove read and write from all users  

chmod uo+wx  
Grant user and other write and execute  

chmod g-r  
Remove from group read permissions  

chmod 777  
Grant ALL access  

chmod 123  
Execute : Write : Write & Execute
Owner : Groups : User

chmod 421
Read : Write : Execute
Owner : Groups : User

Symbolic setting file Permissions  
chmod go+w
chmod uo+x

## Changing file owner
`chmod`  
`chown [OPTION]... [OWNER][:[GROUP]] FILE...`  

## Changing group
`chgrp`  
`chgrp [OPTION]... GROUP FILE...`  
