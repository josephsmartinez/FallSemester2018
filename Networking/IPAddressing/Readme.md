# Understanding TCP/IP Networking
```
  IP Address / Subnet Mask
    IP Address: 192.168.0.1
    Subnet Mask: 255.255.255.0

  Classless System (This is not used anymore)
      Class A - 255.0.0.0 - 16,777,214 Hosts
      Class B - 255.255.0.0 - 65,534 Hosts
      Class C - 255.255.255.0 - 254 Hosts

  Private vs public IPs
    Private IPs (RFC 1918)
    10.x.x.x
    172.16.x.x
    172.17.x.x...172.31.x.x
    192.168.0.x
    192.168.1.x...192.168.255.x`

  Public
  Class A - 1.0.0.0 -> 126.255.255.255
    127 is reserved for loopback
    0 network is reserved for default newtwork ]
    1 - 126 for class A

    00000000.00000000.00000000.00000000
    Network . ---------hosts---------->

  Class B - 128.0.0.0 -> 191.255.255.255
  Start at 10000000 = 128
  10111111 = 191

  00000000.00000000.00000000.00000000
  Network . Network.--hosts---------->

  Class C - 192.0.0.0 -> 223.255.255.255
  Start 11000000 = 192
  11011111 = 223

  00000000.00000000.00000000.00000000
  Network .Network .Network .--hosts->

  Class A,B,C = Unicast

  Class D = Multicast -> 224.0.0.0 to 239.255.255.255
    11100000 = 224
    11101111 = 239

    239.1.1.1 private multicast address example
    224.0.0.5 is for OSPF (Devices that talk to multiple devices)

  Class E -> 240.0.0.0 to 255.255.255.255
    11111111 = 255
    Reserved of testing

  IPv6 (IS COMMING)

  IPv6 vs IPv4
    IPv4 Characteristics
    32 bit address

    ~4.3 Billion addresses
    IPv6 Characteristics
    128 bit address
    3.4 x 10^38 addresses

  Integrated IPSec
  IP Mobility
  Extensible Headers


  Three pieces needed when setting up a networking on Linux
    IP Address
    Subnet Mask (This will help dictate which IP address are on the same network)
    Gate Way (This for the router)


CompTIA Linux+ (LX0-104)
    8.1 Understanding TCP/IP Networking Part 2

    UDP/TCP/ICMP
        TCP (Emails, Banking Data, etc)
            Transmission Control Protocol
            Reliable transport mechanism
            Both end points are synchronized
            2-Way communication

        UDP (Think of streaming audio and video)
            User Datagram Protocol
            Best-effort transport mechanism

        ICMP
            Internet Control Management Protocol
            Ping and other troubleshooting and status protocols

  THE EXAM WILL TEST YOUR KNOWLEDGE ON THE FOLLOWING PORTS

  Common TCP/UDP Ports

  Port Number   |       Protocol    |      TCP/UDP      
   ----------------|-------------------|-------------------
      20        |       FTP         |      TCP/UDP      
      21        |       FTP         |      TCP          
      22        |       SSH         |      TCP/UDP      
      23        |       TELNET      |      TCP/UDP      
      25        |       SMTP        |      TCP          Simple Email Transfer Protocol (When email skip from server to server)
      53        |       DNS         |      TCP/UDP      
      80        |       HTTP        |      TCP          
      110       |       POP3        |      TCP          outdated
      119       |       NNTP        |      TCP          
      139       |       NetBIOS     |      TCP/UDP      
      143       |       IMAP        |      TCP         Internet Message Access Protocol  
      161       |       SNMP        |      UDP         Simple Network Management Protocol (Useful for checking systems)
      443       |       HTTPS       |      TCP         Over SSL/TLS (When you see the lock during Internet browsing)         
      465       |       SMTP-SSL    |      TCP          
      993       |       IMAPS       |      TCP          
      995       |       POP3S       |      TCP          


      Port Number Ranges

      0 - 1023          Well-Known Port Numbers

      1024 - 49151      Registered Port Numbers

      49152 - 65535     Dynamic Port Numbers
```

## Directed Broadcast Address
- Host send data to all device on a specific netowrk
- Binary 1s in the entire host portion of the address
Network 172.31.0.0
- Directed broadcast = 172.31.255.255
- The host portion is populated with 1s
Routers can route directed broadcast
- disabled by default
- hacking denial of service attacks (DOS) can be done by using
directed broadcast forwarding

## Local Broadcast Address
- communicate with all devices on local network
- address is all binary 1s
11111111.11111111.1111111.111111111
255.255.255.255
- always dropped by routers
- router would need configuring to relay broadcast messages via:
DHCP forwarding or DHCP relay

## Local Loopback Address
- used to let a system send a message to itself for testing
- 127.0.0.1 Class A and has 16 million addresses
- IPv6 is ::1
NOTE: router have loopback addresses which are not the same as the local loopback address

## Private Addresses
RFC1918 - non
Three blocks of IP addresses  
- 1 Class A network
- 16 Class B networks
- 256 class c networks
 Private:  
 - 10.0.0.0 to 10.255.255.255
 - 172.16.0.0 to 172.31.255.255
 - 192.168.0.0 to 192.168.255.255

Example: If IP 10.1.1.1 sends an message to google.com, it would need to be NAT to a public IP like 15.1.1.1 to reach it's destination

## IPV4 Link - Local Addresses
- PC configured for DHCP
When no server is available:  
* range 169.254.0.0/16 (255.255.0.0)
- allow two computers to communicate when there are no DHCP servers available
- can immediately generate the host specific part of the address

## Subnet Mask
Network Address
- used to determine network and host portion
- is a device remote or local

## Network Mask
- allows us to determine the potion of address which is the host and the network

Determine:
Remote: Thus be reached via a default gateway - different subnet
Local: does not require a default gateway - same subnet

- class A, B, and C networks have default mask also known has natural mask.

## Discontiguous Network Mask
- Cisco devices do not support discontinuous mask
11110000.11111111.00000110.11000000 = 240.255.3.191
- Only contiguous subnet mask are supported
11111111.11110000.00000000.0000000 = 255.240.0.0
11111111.11111111.11000000.0000000 = 255.255.192.0
- Network mask must start with 1s

## CIDR (Classless Inter-Domain Routing)
- Introduced in 1993
- Replaces classful IP addressing
- Variable length subnet mask (VLSM)
 Use  10.0.0.0/8 notation
 NOT  10.0.0.0 255.0.0.0 notation

**/X Mask (CIDR Notation)**  
Dotted decimal  Binary Bits
255.255.255.0   /24

Covert mask to binary
11111111.11111111.11111111.00000000
8 + 8 + 8 + 0 = 24
thus 255.255.255.0 can be written as /24

When CIDR is used, the mask can vary and that is what is used today  
255.255.255.240
11111111.11111111.11111111.1111 | 0000
1 = Network host
0 = Host

- Classful network were replaced by CIDR
