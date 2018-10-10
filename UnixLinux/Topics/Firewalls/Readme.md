
## How To Set Up a Firewall Using FirewallD on CentOS 7
https://www.digitalocean.com/community/tutorials/how-to-set-up-a-firewall-using-firewalld-on-centos-7


## MANAGING ICMP REQUESTS
5.11.2. Blocking or Unblocking ICMP Requests
When your server blocks ICMP requests, it does not provide the information that it normally would. However, that does not mean that no information is given at all. The clients receive information that the particular ICMP request is being blocked (rejected). Blocking the ICMP requests should be considered carefully, because it can cause communication problems, especially with IPv6 traffic.
To see if an ICMP request is currently blocked:
~]# firewall-cmd --query-icmp-block=<icmptype>
To block an ICMP request:
~]# firewall-cmd --add-icmp-block=<icmptype>
To remove the block for an ICMP request:
~]# firewall-cmd --remove-icmp-block=<icmptype>

https://access.redhat.com/documentation/en-us/red_hat_enterprise_linux/7/html/security_guide/sec-managing_icmp_requests


## How to Block Ping ICMP Requests to Linux Systems
https://www.tecmint.com/block-ping-icmp-requests-to-linux/


-----------------------
# Ubuntu
##  ufw - program for managing a netfilter firewall
You should be able to disable logging via
`sudo ufw logging off`


https://askubuntu.com/questions/184290/why-im-getting-this-ufw-block-in-my-syslogs
