https://www.thegeekdiary.com/error-530-permission-denied-when-user-logs-in-to-vsftpd-server-via-ftp/
https://www.tecmint.com/install-ftp-server-in-centos-7/
https://www.tecmint.com/setup-ftp-anonymous-logins-in-linux/
http://slacksite.com/other/ftp.html

To configure passive mode for vsftpd you need to set some parameters in vsftpd.conf.

pasv_enable=Yes
pasv_max_port=10100
pasv_min_port=10090
This enables passive mode and restricts it to using the eleven ports for data connections. This is useful as you need to open these ports on your firewall.

iptables -I INPUT -p tcp --destination-port 10090:10100 -j ACCEPT
If after testing this all works then save the state of your firewall with

service iptables save
which will update the /etc/sysconfig/iptables file.

To do this is CentOS 7 you have to use the new firewalld, not iptables:

Find your zone:

# firewall-cmd --get-active-zones
public
  interfaces: eth0
My zone is 'public', so I set my zone to public, add the port range, and after that we reload:

# firewall-cmd --permanent --zone=public --add-port=10090-10100/tcp
# firewall-cmd --reload
What happens when you make a connection

Your client makes a connection to the vsftpd server on port 21.

The sever responds to the client telling it which port to connect to from the range specified above.

The client makes a data connection on the specified port and the session continues.
