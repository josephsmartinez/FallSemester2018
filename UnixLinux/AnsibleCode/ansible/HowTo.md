# How To's

VM Details: 
venom
venom.com
c-24-23-22-5.hsd1.ca.comcast.net
24.23.22.5


### rdesktop
git clone https://github.com/rdesktop/rdesktop.git
./bootstrap
yum install openssl-devel
yum install libXcursor-devel
yum install pcsc-*
make
make install

## Glass Fish
###  How To Change Port Number For GlassFish
Both Oracle an GlassFish runs by default on port number 8080,results in port conflict
Following are simple steps to change the port number of glassfish server :

Go to the folder where Glassfish is installed.
Locate config folder which is as follows: C:\Program Files\glassfish-3.0.1\glassfish\domains\domain1\config
Open domain.xml using any text editor.
Look for 8080 and change it to some other port number that doesn’t conflict with other port numbers.
Save domain.xml.
Now  remove GlassFish from NetBeans and add it again so that NetBeans IDE understands the new port number.
Restart GlassFish, if it was already running.
http://ohmjavaclasses.blogspot.com/2012/01/how-to-change-port-number-for-glassfish.html

- configure glass fish on boot



To Change the Administration Password GlassFish
https://docs.oracle.com/cd/E19798-01/821-1751/ghgpu/index.html


Notes: 

10/27->28/2018
- changed sshd root access
	PermitRootLogin no
	#StrictModes yes
	MaxAuthTries 3
	MaxSessions 3

- changed /etc/security/limits.conf
	<domain>      <type>  <item>         <value>
	*             -       maxlogins      5
	profe         -       maxlogins      2

- configure FQDN
	venmon.com

- set up virtual hosts
	failed 

- journal pages
  not completed

- glass fish 
	check role

- wordpress
	admin
	%zspA^gklasL&bfZBx

- Cron and Systemd
	check role
	need to add timer for /etc backup 

-  Firewall changes for mailing services
	 firewall-cmd --zone=public --add-service=imap --permanent
	 firewall-cmd --zone=public --add-service=pop3 --permanent
	 firewall-cmd --zone=public --add-service=smtp --permanent
	 firewall-cmd --reload
	 firewall-cmd --list-all

- configuring email services

https://access.redhat.com/documentation/en-us/red_hat_enterprise_linux/6/html/deployment_guide/s3-email-mta-sendmail-default

Setup Basic POP3/IMAP Mail Server in Centos/RHEL
https://www.scopehosts.com/secure/knowledgebase/4/Setup-Basic-POP3orIMAP-Mail-Server-in-CentosorRHEL.html

https://www.server-world.info/en/note?os=CentOS_7&p=mail&f=2

- network.service failed


- Main page needs links to journals and personal profile 
