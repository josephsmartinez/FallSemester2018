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

- Information about locks
`see man lpcs`



