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
