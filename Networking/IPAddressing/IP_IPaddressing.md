# Intro to IP and IP addressing
**Author: Instructor Eric Johnson**

## Interesting RFCS
[RFC791](http://www.faqs.org/rfcs/rfc791.html)
[binary cheat sheet](http://www.cs.fiu.edu/~esj/cgs4285/binary.html)

## IP packets
Live in the payload of Ethernet frames. Can live as payload of other layer 2 protocols (PPP, token ring as examples)  

IP packets are also known as IP datagrams Bytes are more precisely known as octets.  
```
    0                   1                   2                   3
    0 1 2 3 4 5 6 7 8 9 0 1 2 3 4 5 6 7 8 9 0 1 2 3 4 5 6 7 8 9 0 1
   +-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+
   |Version|  IHL  |Type of Service|          Total Length         |
   +-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+
   |         Identification        |Flags|      Fragment Offset    |
   +-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+
   |  Time to Live |    Protocol   |         Header Checksum       |
   +-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+
   |                       Source Address                          |
   +-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+
   |                    Destination Address                        |
   +-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+
   |                    Options                    |    Padding    |
   +-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+


version         = ip version = 4
IHL             = header length, as a multiple of 4 octets.
                = if no options are included, will be = 5 (indicating 20 bytes)
TOS             = type of service. Usually 0. Different RFCs specify different meanings
Total Length    = total length of the datagram
Identification  = a number used to identify fragments that need to be reassembled
                  into original larger datagram
Flags           = Including the "don't fragment and must fragment bits"
      Bit 0: reserved, must be zero
      Bit 1: (DF) 0 = May Fragment,  1 = Don't Fragment.
      Bit 2: (MF) 0 = Last Fragment, 1 = More Fragments.
          0   1   2
        +---+---+---+
        |   | D | M |
        | 0 | F | F |
        +---+---+---+

Fragment offset = where in original datagram this fragment belongs (units are
                  8 octets.

Time to live    = how long before this datagram is discarded (in hop count)

Protocol        = Layer 4 protocol (TCP/UDP/ICMP/etc)
			TCP=6
			UDP=17
			ICMP=1
Header checksum = Checksum of all header fields
Source address  = 32 bit source IP address
Dest address    = 32 bit destination IP address
Options         = other (variable length) options
```

## IP addresses
32 bit numbers. Usually written as "dotted quads" with 4 decimal numbers separated by a period, each number represents 8 bits of the 32 bit IP address  
```
131.94.130.43 decimal = 4 bytes, in hex = 83 5e 82 2b in binary = 1000 0111 0101 1110 1000 0010 0010 1011
```
IP addresses are divided up into two parts. Network and host. Originally you had 3 main classes of IP addresses.  
```
class a - 8 bits of network, 24 bits to specify hosts
        The first octet is 1-127
class b - 16 bits of network, 16 bits to specify hosts
        The first octet is 128-191
class c - 24 bits of network, 8 bits to specify hosts
        The first octet is 191-223
```
Now the Internet has gone classless. any number of bits can specify network, with the remaining specifying host. THE OLD CLASSES NO LONGER APPLY.  

An organization is given a network assignment from ARIN (or some other regional authority). This will be a network number and a netmask. Once you know the network number and netmask, you can compute what addresses are within that netblock.  
```
network 66.20.0.0/14 - hex 42 14 00 00
               66.         20.          0.          0
        0100 0010   0001 0100   0000 0000   0000 0000
netmask = /14 = 255.252.0.0
	      255.         52.          0.          0.
	1111 1111   1111 1100   0000 0000   0000 0000

so hosts available are

        0100 0010   0001 01xx   xxxx xxxx   xxxx xxxx
(x can be 0 or 1)

        hosts are

	       66.         20.	 anything    anything
        0100 0010   0001 0100   xxxx xxxx   xxxx xxxx

	       66.         21.	 anything    anything
        0100 0010   0001 0101   xxxx xxxx   xxxx xxxx

	       66.         22.	 anything    anything
        0100 0010   0001 0110   xxxx xxxx   xxxx xxxx

	       66.         23.	 anything    anything
        0100 0010   0001 0111   xxxx xxxx   xxxx xxxx


network 131.94.0.0/16 = hex 83 5e 00 00
	      131.         94.             0.          0
        1000 0111   0101 1110   /  0000 0000   0000 0000
netmask = /16 = 255.255.0.0
	      255.        255.             0.          0
	1111 1111   1111 1111   /  0000 0000   0000 0000

        hosts are 131.94.X.X


network 68.45.160.0/19 = hex 44 2d a0 00
	       68.         45.        160.          0
        0100 0100   0010 1101   1010 0000   0000 0000
netmask = /19 = 255.255.224.0
              255.        255.        224.          0
	1111 1111   1111 1111   1110 0000   0000 0000

so hosts available are
        0100 0100   0010 1101   101x xxxx   xxxx xxxx
(x can be 0 or 1)

	      68.	  45.	  160-191.   anything


network 199.45.64.0/18 = hex c7 2d 40 00
              199.         45.         64.          0
        1100 0111   0010 1101   0100 0000   0000 0000
netmask = /18 = 255.255.192.0
              255.        255.        192.          0
	1111 1111   1111 1111   1100 0000   0000 0000

so hosts available are
        1100 0111   0010 1101   01xx xxxx   xxxx xxxx
(x can be 0 or 1)

              199.         45.      64-127.  anything
```
- Every network has a Network address with the host portion of all 0's
- Every network has a Directed Broadcast address with the host portion of all 1's
- Every other host address is available for assignment to a host.

### Questions to think about...
1. Host 66.22.180.99/14  netmask 255.252.0.0 (which is /14) is on network 66.20.0.0/14. The networks broadcast address is 66.23.255.255

2. Host 131.94.133.12/16 netmask 255.255.0.0 (which is /16) is on network 131.94.0.0/16. The networks broadcast address is 131.94.255.255

3. Host 68.45.167.245/19 netmask 255.255.224.0 (which is /19) is on network 68.45.160.0/19. The networks broadcast address is 68.45.191.255

4. Host 199.45.78.199/18 netmask 255.255.192.0 (which is /18) is on network 199.45.64.0/18. The networks broadcast address is 199.45.127.255

### Subnetting
An organization can further divide the address space given to it by "subnetting". IE assigning internally more bits to the network portion of the address space. IE 131.94.0.0/16 can be internally divided into 256 different /24's So before you had one network with 65534 possible hosts, after subnetting you have 256 networks with 256 hosts ( 254 usable hosts) each.  
```
131.94.1.X/24
131.94.2.X/24
...
131.94.255.X/24
```
You can calculate how many networks you will create when you subnet by using a simple formula.**X=old subnet length, Y=new subnet length**.  

**Number of subnets = 2^(Y-X)**. In the above example we started with a /16 and subnetted to a /24.

**So X=16, Y=24. 2^(24-16) == 2^8 == 256 new subnets**. Subnets can be sub-sub-netted as well. 131.94.133.0/24 can be sub-sub-netted into 4 /26 networks of 64 addresses (62 usable hosts). For the above formula X=24, Y=26 so 2^(26-24) == 2^2 = 4 new subnets.  
```
131.94.133.0/26
131.94.133.64/26
131.94.133.128/26
131.94.133.192/26
```
Lets now subnet 200.45.60.0/22 from 1 network with 2^10 (1024) hosts to
some number of networks with 64 addresses each. You need 6 bits to specify the number 0-63, the new networks will need a mask of 32-6 bits, IE at 26 bit netmask. From the number of subnets formula above: X=22, Y=26 so 2^(Y-X) == 2^4 = 16 new subnets.
```
	network 200.45.60.0/22		11001000 . 00101101 . 001111 00 . 00 000000
	old netmask /22 -		11111111   11111111   111111 00   00 000000
	new netmask /26 -		11111111   11111111   111111 11   11 000000
```
So we count up in the 4 bits between the old and the new netmask to
create 16 network of 64 hosts.  

We are counting up in binary on these 4 bit share                     
```
                                                   ||   ||
	200.45.60.0/26			11001000 . 00101101 . 001111 00 . 00 xxxxxx /26
	200.45.60.64/26			11001000 . 00101101 . 001111 00 . 01 xxxxxx /26
	200.45.60.128/26		11001000 . 00101101 . 001111 00 . 10 xxxxxx /26
	200.45.60.192/26		11001000 . 00101101 . 001111 00 . 11 xxxxxx /26
	200.45.61.0/26			11001000 . 00101101 . 001111 01 . 00 xxxxxx /26
	200.45.61.64/26			11001000 . 00101101 . 001111 01 . 01 xxxxxx /26
	200.45.61.128/26		11001000 . 00101101 . 001111 01 . 10 xxxxxx /26
	200.45.61.192/26		11001000 . 00101101 . 001111 01 . 11 xxxxxx /26
	200.45.62.0/26			11001000 . 00101101 . 001111 10 . 00 xxxxxx /26
	200.45.62.64/26			11001000 . 00101101 . 001111 10 . 01 xxxxxx /26
	200.45.62.128/26		11001000 . 00101101 . 001111 10 . 10 xxxxxx /26
	200.45.62.192/26		11001000 . 00101101 . 001111 10 . 11 xxxxxx /26
	200.45.63.0/26			11001000 . 00101101 . 001111 11 . 00 xxxxxx /26
	200.45.63.64/26			11001000 . 00101101 . 001111 11 . 01 xxxxxx /26
	200.45.63.128/26		11001000 . 00101101 . 001111 11 . 10 xxxxxx /26
	200.45.63.192/26		11001000 . 00101101 . 001111 11 . 11 xxxxxx /26
```
Now lets sub-sub-net 200.45.62.64/26 into 8 /29's  
```
	network 200.45.62.64/26		11001000 . 00101101 . 00111110 . 01 000 000
	old netmask /26 -		11111111   11111111   11111111   11 000 000
	new netmask /29 -		11111111   11111111   11111111   11 111 000
```
We are counting up in binary on these 3 bits here  
```                                                                                                                               |||
	200.45.62.64/29			11001000 . 00101101 . 00111110 . 01 000 xxx /29
	200.45.62.72/29			11001000 . 00101101 . 00111110 . 01 001 xxx /29
	200.45.62.80/29			11001000 . 00101101 . 00111110 . 01 010 xxx /29
	200.45.62.88/29			11001000 . 00101101 . 00111110 . 01 011 xxx /29
	200.45.62.96/29			11001000 . 00101101 . 00111110 . 01 100 xxx /29
	200.45.62.104/29		11001000 . 00101101 . 00111110 . 01 101 xxx /29
	200.45.62.112/29		11001000 . 00101101 . 00111110 . 01 110 xxx /29
	200.45.62.120/29		11001000 . 00101101 . 00111110 . 01 111 xxx /29
```
