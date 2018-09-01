# CTS4348 –Unix/Linux System Administration  – Fall 2018 – Semester Project
## Florida International University – University Park

Throughout the term, a series of hands-on exercises will be assigned each week.  
Each student will be responsible for creating a VirtualBox VM in his/her own System, and then install and maintain the workstation as a Linux-based web server.  

The first task to get things going is to create your VirtualBox VM in your own system. To do so, follow the VirtualBox VM Creation Guide available from the main course web page.  

Each student is to create and maintain a webpage in your VirtualBox VM in which to keep a running log of all server activities, detailing:  
- Server name
- The hardware elements of the workstation (virtualized hardware)
- Which Linux version/distribution is installed
- The hostname and network setup
- All software packages you manually installed, updated or changed

### Weekly Tasks:
1. Create a VirtualBox VM in your own System and install the CentOS 7 Linux Distro in it.   Additional information on this task will be discussed in class.  
<hr>

2. Make your machine an operational webserver  
- Set up and create your website on your Linux machine with the following information (server name, ip address, portal default page, etc)
  - Server Name
  - The hardware elements of the workstation (virtualized hardware)
  - Which Linux version/distribution is installed
  - The hostname and network setup
  - All software packages installed, updated or changed
- Include your profile listing skills set, academic interests, picture, and anything else you’d - like to include.
- Make sure to create and maintain an activity journal and make it accessible from your portal.
- Use your creativity to design and layout your portal.
<hr>

3. After updating your system with latest patches, configure firewall to open up port 80 to access your web site from the outside world. To do this, follow these steps:  
- `vi /etc/sysconfig/iptables`
- Add the following rules before the reject rule:
  - `-A RH-Firewall-1-INPUT -m state --state NEW -m tcp -p tcp --dport 80 -j ACCEPT`
- Make sure this reject rule is the last rule in the config file, just before the COMMIT command.
  - `-A RH-Firewall-1-INPUT -j REJECT --reject-with icmp-host-prohibited`
- Reload iptables and restart routing:
  - `/etc/init.d/iptables restart`
- Use instructions given in class for configuring `firewalld` in CentOS 7.
<hr>


4. Implement Web Server Directory-level Access Protection  

A) Protect access to your journal pages on your web server. The assumption in this exercise is that you have created a separate subdirectory in your web site `/var/www/html` under which you will maintain your journal page(s).  

In the default page of your web site, provide a link to your journal pages so that when the visitor clicks on that link, an authentication dialog box appears. If the incorrect user name and password is entered, your server should display a failure page, otherwise access to your journal page should be granted.  

You may implement directory-level authentication using a mechanism of your choice. A simple mechanism you may consider is Apache’s built-in directory-level security access or a combination of `htpasswd` user database and `.htaccess` authentication rules files. To discover more detail information on this, do a Google search on htaccess or htpasswd keywords.  

B) Create `profe` user account manually (see details here)  
`update /etc/passwd, /etc/shadow, /etc/group and create the home directory`  

C) Customize shell prompt for account `profe` to display, user id, followed by `‘@’` symbol, followed by host name, followed  current system time, followed by absolute path of current directory, followed by `‘#’` symbol, followed by shell command history number, all this enclosed in squared brackets, and a blank space after the closing squared bracket.  

### Here’s an example of what the shell prompt should look like:
`profe@jose-test 09:57 PM /var/www/html #554`  


5. Add the `profe` account to the list of `sudoers` and allow this account the same privileges as the super user account. Make sure to document the steps in your journal or in your HOW-TOs collection. Alternatively, you may add the `profe` account to the `wheel` group to give super user privileges to this account.  

6. Configure your Apache Web Server to enable requests to `/~user/` to serve the user’s `public_html` directory. For example, `profe` wants to set up his own personal web page. In his home directory he creates a subdirectory called `public_html` with proper permissions. Then inside this directory he creates a default web page (ie., `index.html`) and other html documents to make a personal portal. Any one in the world can visit profe’s web page by typing his user id after the domain name that hosts his web page. For example: `http://131.94.134.14/~profe/`   or   `http://localhost/~profe/`   -  To test your setup you may use any regular account you might have set up on your server or you may use profe.  The following is a screenshot of Internet Explorer displaying profe’s web page set up on my test virtual machine:  

7. Download and Install Webmin – Web Based System Administration Tool (http://www.webmin.com/download.html)  
- Download RPM
  - https://sourceforge.net/projects/webadmin/files/webmin/1.870/webmin-1.870-1.noarch.rpm/download  
  - The above link points to an older version of the tool. You may choose to download and install the latest version release available to date.
  - `wget` https://users.cs.fiu.edu/~osorioj/webmin-1.870-1.noarch.rpm
- Install package (www.webmin.com/rpm.html)
  - `rpm -U webmin-1.870-1.noarch.rpm`
  - Note: the file referenced above may differ as it depends on the version of the tool that you have downloaded to your Server.
  - It takes the installer a little bit of time to display installation progress while it matches your OS.
  - The package is installed in `/usr/libexec/webmin`
- Remove RPM package once successfully installed. This to minimize disk usage on server.
- Configure Firewall to open up port 10000
  - `vi /etc/sysconfig/iptables`
  - Add the rule: -A RH-Firewall-1-INPUT -m state --state NEW -m tcp -p tcp --dport 10000 -j ACCEPT
  - Restart IP Routing: service iptables restart
  - Use instructions given in class for configuring firewalld in CentOS 7.
- Access Webmin through Internet Browser
  - http://localhost:10000/
  - https://localhost:10000/
  - Log on using root user id and password.  
- Browse the ***Webmin*** portal and familiarize with the various options it provides.

8. Download and ***Install Usermin*** – Web Based User Administration Tool (http://www.webmin.com/udownload.html)  
- Download RPM
  - https://sourceforge.net/projects/webadmin/files/usermin/1.730/usermin-1.730-1.noarch.rpm/download
  - The above link points to an older version of the tool. You may choose to download and install the latest version release available to date.
  - `wget` https://users.cs.fiu.edu/~osorioj/usermin-1.730-1.noarch.rpm
- Install package (http://www.webmin.com/urpm.html)
  - rpm –U usermin-1.730-1.noarch.rpm
  - Note: the file referenced above may differ as it depends on the version of the tool that you have downloaded to your Server.
  - The package is installed in /usr/libexec/webmin
  - Service usermin start
- Configure Firewall to open up port 20000
  - `vi /etc/sysconfig/iptables`
  - Add the rule: `-A RH-Firewall-1-INPUT -m state --state NEW -m tcp -p tcp --dport 20000 -j ACCEPT`
  - Restart IP Routing: `service iptables restart`
  - Use instructions given in class for configuring `firewalld` in CentOS 7.
- Access Webmin through Internet Browser
  - http://localhost:20000/
  - Log on using a regular user account
- Browse the Usermin portal and familiarize with the various options it provides.

9. Add a Webmin user with the same webmin privileges as the root account.  

10. Download and install in your server the `mkpasswd` tool. Use the following command to identify the proper package that includes this tool `yum whatprovides */mkpasswd`. Document in your How To’s purpose and use of the `mkpasswd` tool.  


--End














Note: all activities must be completed by November 12th, 2018. I will start evaluating your servers on this date. Do not wait until the last minute to start working on these activities.



Up
