# TCP IP
IP Connectionless

- Every packet is treated individually and separately.
- Packets can arrive at different times and it is up the server to re-organize the packets
- no guarantee packets arrive

## Layor 4 - TCP & UDP
UDP (User Datagram Protocol)
UDP is connection less
- Does not guarantee the delivery
- unreliability

TCP (Transmission Control Protocol)
- Provides delivery acknowledgement and reliability
Socket
- Combination of: IP address of a host, port number used, and transport protocol used

TCP allow session multiplexing
- Single host with single IP address is able to communicate with multiple server
- connection must first established between server and receiver
- segmentation: MTU depend on physical medium
MTU of fast ethernet is 1500 bytes
TCP support 65495 bytes

- Maximum segment size is the largest amount of data
- MSS should be set small enough
- TCP support MSS and path MTU discovery
- Sender and receiver can automatically determine transmission
- flow control, to avoid sending data too quickly
- TCP uses a sliding window to control flow of data
- UDP does not implement flow control

### UDP Header
16 bit source port | 16 bit destination port
16 bit UDP length  | 16 but UDP checksum
                  DATA
Maximum 8 bytes
Maximum 65,535 bytes

### TCP
Transport Layer Protocol
Access to the network layer for applications
Connection oriented
Full duplex-mode operation
Error checking
Sequencing of data packets
acknowledgement of receipt
data recovery features

### TCP Header

16 | 16
32
32

### Port Number

```

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
```

Well known ports -<= 1023
Registered ports - 1024 to 49151
Dynamically assigned port 49152 to 65535
NOTE: port numbers vary from vendor implementation (Linux, Windows, Mac, etc...)
