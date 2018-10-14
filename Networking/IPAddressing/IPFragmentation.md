IP Fragmentation
IP fragmentation and Maximum transmission unit (MTU)

IP datagrams can be up to 65535 octets (bytes) long. The layer 2 protocol used may not allow frames larger than some specified size (ethernet uses 1500 bytes of payload). The largest data payload of any layer 2 protocol is called the MTU - Maximum Transmission Unit - for that layer 2 protocol.

If you want to put a IP packet larger than 1500 bytes on a ethernet you have to fragment the packet into N smaller packets (N>1).

You take the data portion of the IP packet and divide it on a 8 octet (byte) boundary. Then you put it into smaller IP packets, with the same header information, except you need to set the ID field the same on all the fragments and set the MF (more fragments) bit on all the fragments other than the last one. You also need set the fragment offset to the location the data in each fragment should go in the original packet (divided by 8).

Example. Here is a 4096 byte ICMP packet fragmented into 3 ip fragments


The original packet     

    0                   1                   2                   3
    0 1 2 3 4 5 6 7 8 9 0 1 2 3 4 5 6 7 8 9 0 1 2 3 4 5 6 7 8 9 0 1
   +-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+
   |0 1 0 0|0 1 0 1|0 0 0 0 0 0 0 0|  Len = 4096                   |
   +-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+
   |         Ident = 0             |0 0 0|  Fragment Offset = 0    |
   +-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+
   |  Time to Live | ICMP = 1      |         Header Checksum       |
   +-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+
   |                       Source Address                          |
   +-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+
   |                    Destination Address                        |
   +-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+
   |                    IP payload data 4076 bytes                 |
   |    8 octets of ICMP header and 4068 octets of icmp payload   |
   +-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+


Fragmented into 3 packets

    0                   1                   2                   3
    0 1 2 3 4 5 6 7 8 9 0 1 2 3 4 5 6 7 8 9 0 1 2 3 4 5 6 7 8 9 0 1
   +-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+
   |0 1 0 0|0 1 0 1|0 0 0 0 0 0 0 0|  Len = 1500                   |
   +-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+
   |         Ident = 0x2a44        |0 0 1|  Fragment Offset = 0    |
   +-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+
   |  Time to Live | ICMP = 1      |         Header Checksum       |
   +-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+
   |                       Source Address                          |
   +-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+
   |                    Destination Address                        |
   +-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+
   |                    IP payload data 1480 bytes                 |
   |    8 octets of ICMP header and 1472 octets of icmp payload    |
   +-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+

    0                   1                   2                   3
    0 1 2 3 4 5 6 7 8 9 0 1 2 3 4 5 6 7 8 9 0 1 2 3 4 5 6 7 8 9 0 1
   +-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+
   |0 1 0 0|0 1 0 1|0 0 0 0 0 0 0 0|  Len = 1500                   |
   +-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+
   |         Ident = 0x2a44        |0 0 1|Fragment Offset = 185    | (1480/8)
   +-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+
   |  Time to Live | ICMP = 1      |         Header Checksum       |
   +-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+
   |                       Source Address                          |
   +-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+
   |                    Destination Address                        |
   +-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+
   |                    IP payload data 1480 bytes                 |
   |                   1480 octets of icmp payload                 |
   +-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+

    0                   1                   2                   3
    0 1 2 3 4 5 6 7 8 9 0 1 2 3 4 5 6 7 8 9 0 1 2 3 4 5 6 7 8 9 0 1
   +-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+
   |0 1 0 0|0 1 0 1|0 0 0 0 0 0 0 0|  Len = 1136                   |
   +-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+
   |         Ident = 0x2a44        |0 0 0|  Fragment Offset = 370  | (2960/8)
   +-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+
   |  Time to Live | ICMP = 1      |         Header Checksum       |
   +-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+
   |                       Source Address                          |
   +-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+
   |                    Destination Address                        |
   +-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+
   |                    IP payload data 1116 bytes                 |
   |                   1116 octets of icmp payload                 |
   +-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+

If any fragment of a packet is lost, the reassembly will timeout and the entire set of fragments needs to be sent again. Timeouts vary, 15 seconds is suggested to start with.
Here is a pcap file of a ping request from 131.94.133.12 to 131.94.57.61. The ping requested a IP packet of 4096 octets in length (4068 of data, 8 for ICMP header, and 20 for IP header). It was split into 3 fragments (just like above). The replys were also split into 3 fragments.

Key things to remember:

1. IP fragmentation is done when a station needs to send a IP packet that is larger than the MTU of the Layer 2 network technology it wants to send it on.

2. The original packet will be divided into smaller packets, on a 8 byte boundary.

3. Each fragment contains information letting the receiving station know where it fits in the original datagram.

	1. First fragment has MF bit set (=1)  and Fragment offset=0
	2. Middle fragments have MF bit set and Fragment offset != 0
	3. Last fragment has MF bit clear (=0) and frag offset !=0
4. Receiving station will start a timer upon receiving a fragment. If the timer expires before all the fragments arrive, then the original packet is declared lost. The station that was receiving and trying to re-assemble the packet would then send an ICMP TTL exceeded (type=11) fragmentation reassembly time exceeded (code=1).
ICMP protocol
ICMP - RFC 792 Internet Control Message Protocol

This is a layer 4 protocol used to signal information about layer 3 events.


 EDST | ESRC | TYPE | IP header | ICMP header | ICMP data | ECRC
^                   ^           ^                         ^      ^
|                   ^           |- Layer 4 ICMP packet -- |      |
|                   | -----  Layer 3 IP datagram  ------- |      |
| -------------------  Layer 2 Ethernet frame  ----------------- |

The Ethernet type = 0800 (IP)
The IP header will have a protocol value of 1



Dest unreachable message
    0                   1                   2                   3
    0 1 2 3 4 5 6 7 8 9 0 1 2 3 4 5 6 7 8 9 0 1 2 3 4 5 6 7 8 9 0 1
   +-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+
   |     Type      |     Code      |          Checksum             |
   +-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+
   |                             unused                            |
   +-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+
   |      Internet Header + 64 bits of Original Data Datagram      |
   |               Usually 28 octets (20+8)                        |
   +-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+

Type = 3
Code  0 = net unreachable;
      1 = host unreachable;
      2 = protocol unreachable;
      3 = port unreachable;
      4 = fragmentation needed and DF set;
      5 = source route failed.
      6 = Destination Network Unknown
      7 = Destination Host Unknown
      8 = Source Host Isolated
      9 = Communication with Destination Network is
          Administratively Prohibited
     10 = Communication with Destination Host is
          Administratively Prohibited
     11 = Destination Network Unreachable for Type of Service
     12 = Destination Host Unreachable for Type of Service
     13 = Communication Administratively Prohibited      [RFC1812]
     14 = Host Precedence Violation                      [RFC1812]
     15 = Precedence cutoff in effect                    [RFC1812]






Source quench

Type = 4
Code   0



TTL exceeded

Type = 11
Code   0 = time to live exceeded in transit;
       1 = fragment reassembly time exceeded.  



Redirect
    0                   1                   2                   3
    0 1 2 3 4 5 6 7 8 9 0 1 2 3 4 5 6 7 8 9 0 1 2 3 4 5 6 7 8 9 0 1
   +-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+
   |     Type      |     Code      |          Checksum             |
   +-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+
   |                   Gateway Internet Address 		   |
   +-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+
   |      Internet Header + 64 bits of Original Data Datagram      |
   |               Usually 28 octets (20+8)                        |
   +-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+

type = 5
Code  0 = Redirect datagrams for the Network.
      1 = Redirect datagrams for the Host.
      2 = Redirect datagrams for the Type of Service and Network.
      3 = Redirect datagrams for the Type of Service and Host.





Echo Request / Echo Reply
    0                   1                   2                   3
    0 1 2 3 4 5 6 7 8 9 0 1 2 3 4 5 6 7 8 9 0 1 2 3 4 5 6 7 8 9 0 1
   +-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+
   |     Type      |     Code      |          Checksum             |
   +-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+
   |           Identifier          |        Sequence Number        |
   +-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+
   |     Data ...
   +-+-+-+-+-


Type
      8 for echo message
      0 for echo reply message.
Code  0



Other types of messages

timestamp, parameter problem, netmask...




Site listing all the ICMP types and codes http://www.iana.org/assignments/icmp-parameters
Good site for microsoft troubleshooting tools http://support.microsoft.com/default.aspx?scid=kb;en-us;314067
