UDP and TCP protocols

A end point is a IP address and a port. A connection (or "flow" is defined as protocol (tcp/udp) and LocalIP/LocalPort and RemoteIP/RemotePort. IE a connection is a pair of end points. So every flow consists of 5 unique things (protocol, source IP, destination IP, source port, destination port).

TCP/UDP ports below 1024 (1-1023) are reserved for system (root/administrator) processes and are usually used for "well known" services. Applications usually bind to these ports in passive mode, waiting for active connections from clients. Ports from 1024 up to 65535 are called ephemeral ports and can be used by servers, but are also available as a pool for the OS to use to make client connects (active connections) to servers.

UDP
RFC 768

IP protocol number 17

Provides
	Basic Data Transfer
	Multiplexing


                  0      7 8     15 16    23 24    31  
                 +--------+--------+--------+--------+
                 |     Source      |   Destination   |
                 |      Port       |      Port       |
                 +--------+--------+--------+--------+
                 |                 |                 |
                 |     Length      |    Checksum     |
                 +--------+--------+--------+--------+
                 |                                     
                 |          data octets ...            
                 +---------------- ...                 

A connection is defined as LocalIP/LocalPort and RemoteIP/RemotePort

Checksum computed on pseudo header. If checksum = 0 then no checksum...

Pseudo header is:

                  0      7 8     15 16    23 24    31
                 +--------+--------+--------+--------+
                 |          source address           |
                 +--------+--------+--------+--------+
                 |        destination address        |
                 +--------+--------+--------+--------+
                 |  zero  |protocol|   UDP length    |
                 +--------+--------+--------+--------+
                 |               .....               |
                 |      UDP payload of IP packet     |
                 |               .....               |
                 +--------+--------+--------+--------+



Example applications

DNS - port 53
NFS - port 2049
TFTP - port 69
TCP
RFC 793

IP protocol number 6

Provides

Basic Data Transfer
Multiplexing
Virtual circuit (stream)
Reliability
Flow Control
Full duplex - data can move in both directions of a given LocalIP/LocalPort and RemoteIP/RemotePort session.

It uses a three way handshake to START connections - SYN - SYN/ACK - ACK

The active participant (client) sends a SYN (synchronize) to the passive participant.
The passive participant (server) sends a SYN to the active participant and at the same time an ACK (acknowledge)
The active participant (client) sends a ACK to the passive participant.
Uses a sliding window protocol. Each end ACK's receipt of data but transmitter can send more data (up to the window size) without it being ACK'ed. The window size is variable. The receiver specifies the window size the transmitter can use. The receiver can even advertise a zero window size to tell the transmitter to stop sending. Thus providing a type of flow control.

On fast data rate media, with a long round trip time latency you sometimes need a window > 65535 (the maximum that cna be specified with 16 bits) so RFC 1323 extended TCP by adding a window scale option that can multiply the window size given in the header.

The TCP protocol can "piggyback" ACK with data being sent the other direction.

Data can arrive out of order. TCP presents correct order to applications.

Sending application will pass data to TCP which will buffer the data and then send to remote TCP which will also buffer and then pass to remote application.

Data can be "pushed" , IE sent even when buffer is not full. This is done by setting a PSH flag in the TCP header.

A RST in a TCP header indicates a Reset, IE The if an application shuts down and more data comes in for it, a RST might be sent. Also a RST will be sent if NO application is listening on a port.

Passive connections (listen). Servers do this. They specify the local port to listen on and accept connections from clients.

Active connections (connect). Clients do this. They use a random local port and connect to an specified remote port.

Example applications

SMTP (mail)	port 25
SSH (secure shell)	port 22
HTTP (web)	port 80
HTTPS (SSL secured web)	port 443


  TCP Header Format

    0                   1                   2                   3   
    0 1 2 3 4 5 6 7 8 9 0 1 2 3 4 5 6 7 8 9 0 1 2 3 4 5 6 7 8 9 0 1
   +-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+
   |          Source Port          |       Destination Port        |
   +-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+
   |                        Sequence Number                        |
   +-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+
   |                    Acknowledgment Number                      |
   +-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+
   |  Data |           |U|A|P|R|S|F|                               |
   | Offset| Reserved  |R|C|S|S|Y|I|            Window             |
   |       |           |G|K|H|T|N|N|                               |
   +-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+
   |           Checksum            |         Urgent Pointer        |
   +-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+
   |                    Options                    |    Padding    |
   +-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+
   |                             data                              |
   +-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+



Checksum MUST be computed. Uses a pseudo header

                     +--------+--------+--------+--------+
                     |           Source Address          |
                     +--------+--------+--------+--------+
                     |         Destination Address       |
                     +--------+--------+--------+--------+
                     |  zero  |protocol|    TCP Length   |
                     +--------+--------+--------+--------+
                     |               .....               |
                     |      TCP payload of IP packet     |
                     |               .....               |
                     +--------+--------+--------+--------+







You can use the netstat command on many system (MS/Linux/Apple) to see the connections a computer has.

Some good links

Wikipedia page on TCP

Pcaps of udp and tcp connections

Good overview of some of the details of how tcp algorithms work

Good breakdown of the details of the header

Some more about the 3way handshake

More details on the protocol, with RFC references for each field

A configurable flash demo of the sliding window protocol

Yet another in depth description of TCP

Private address space

rfc1918

10.0.0.0/8
172.16.0.0/12
192.168.0.0/16
Don't want to use on public Internet. Sites should not allow onto public Internet.

Some sites use for links between routers internally.

Often NAT is used to translate from one or more public addresses to one or more private addresses.
