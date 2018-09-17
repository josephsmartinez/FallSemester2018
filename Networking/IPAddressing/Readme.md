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
  Class B - 128.0.0.0 -> 191.255.255.255
  Class C - 192.0.0.0 -> 223.255.255.255

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
