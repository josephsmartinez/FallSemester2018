1. Can a station on an IP network can have 1 or more physical interfaces? if so what other interfaces?

2. Each interface has the what properties?

3. IP packet live in what? and included what?

4. IP packets are also known as?

5. IP addresses have how many bits?

6. List the network and broadcast address for the following IPs:
- a. Host 66.22.180.99/14  netmask 255.252.0.0 (which is /14)
- b. Host 131.94.133.12/16 netmask 255.255.0.0 (which is /16)
- c. Host 68.45.167.245/19 netmask 255.255.224.0 (which is /19)
- d. Host 199.45.78.199/18 netmask 255.255.192.0 (which is /18)

7.

8. What formula can calculate how many networks you will create when you subnet?

9. Subnet the following:
- 200.45.60.0/22 from 1 network with 2^10 (1024) hosts to
some number of networks with 64 addresses each.
-

10. How  can an organization divide more space within an IP address?

11.

12.

13. Originally you had how many main classes of IP addresses?

14.

15.

16. Datagrams contain between __ and ___ octets.

17.

18. IP addresses are divided up into what two parts?

19.

20. The IP header contains what?

21

22. What is ICMP?

23

24. What is meant by "Best Effort Delivery" regarding IPs?

25

26

27. What is an MTU?

28. Fragmentation and Re-assembly happens when?

29

30



Answers:
1. Yes
2. An IP address &  A netmask
3. Payload of Ethernet frames with header and data
4. IP datagrams Bytes or Octets
5. 32
6. a. is on network 66.20.0.0/14. The networks broadcast address is 66.23.255.255
b. is on network 131.94.0.0/16. The networks broadcast address is 131.94.255.255
c. is on network 68.45.160.0/19. The networks broadcast address is 68.45.191.255
d. is on network 199.45.64.0/18. The networks broadcast address is 199.45.127.255
7.
8. 2^(Y-X)  X=old subnet length, Y=new subnet length
9. a. X=22, Y=26 so 2^(Y-X) == 2^4 = 16 new subnets
b.
10. Subnetting
11.
12.
13. Three: Class A (8bit), B (16bit), and C (24bit)
14.
15.  
16. 1 octet and 65,535 octets (216- 1)
17.
18. Networking and Host
19.   
20. Destination Address, Source Address, Identification, Protocol, Total, Length.
21
22. Internet Control Message Protocol, It is used by network devices, including routers, to send error messages and operational information.
23
24. Network layer - IP - can detect and report errors without actually fixing them.
25
26
27. Maximum transmission unit is the largest packet or frame size, specified in octets (eight-bit bytes) that can be sent in a packet- or frame-based network such as the internet.
28. Re-assembly at destination, and Fragmentation
29
30
