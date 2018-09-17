# Networking

### Key Terms
Network Protocols, set of rules that governs communication
DHCP (Dynamic Host Configuration Protocol), Assign an IP address to a device
NIC (Network Interface Card)
DNS (Domain Name System), Covert name or domain names
OSPF ?
ISP ?
BGP ?
SDN (Software Defined Networking)

OSI (Open System Interconnection Model) -> Develop by Internation Organization of Standardization (ISO)
1. Physical
Binary Transmission
- 0 and 1
- Define the electrical mechanical procedural and functional specifications for activating maintaining and
deactivating the physical link
- Physical devices and cabling
```
Cable Specification:
- maximum cable length
- electrical specifications
- radio specifications
- modulation techniques
- line coding
- bits synchronization
- fiber, copper, wireless, dsl
```

2. Data Link
Access to Media
- Defines how data is formatted for transmission and how access to the network is controlled
Ethernet
- MAC address (48bits) which is broken into two parts: OUI (Organization Unique Identifier) and Unique Portion
- Identifier of a NIC
- Formatted according to the rules of ethernet
- May traverse WAN link that uses PPP (Point to Point Protocol)
Physical Links
- Characteristics may vary
- Ethernet
- PPP
- DSL

3. Network
Data Delivery
- routes data packets
Layer 3 Switches
- Have router capabilities
- Selects the best path to deliver data base on criteria such as: cost, hop count, bandwidth, longest match of network address
- **IP does not provide any reliability on the successful transmission of data only path determination and logical addressing**
- Reliability is provided by the application layer
```
OSPF (Open Shortest Path First)
BGP (Border Gateway Protocol)
IS-IS (Intermediate System-to-Intermediate System)
```

4. Transportation (End to End connections)
- Message segmentation
- Handles transportation issues between host
- Ensures data transport reliability
- Establishes maintains and terminates virtual circuits
```
  TCP                           UDP
  3-Way Handshake               User Datagram Protocol
  - If a package is missing     - Dose not provide reliability
  it will be retransmitted      - Drop packets are lost
                                - Lightweight
                                Example: VoIP
                                  - Does not require the re-transmission of
                                  packets
```
Flow Control - manage data transmission
Session Multiplexing - multiplexing several message streams or sessions onto one logical link

5. Session (Insterhost Communication)
- Establishment maintenance and termination of session between applications
- Security, Name Recognition, Logging
- NetBIOS (Network Basic IO System) and PPTP (Point-to-Point Tunneling Protocol)

6. Presentation
- Ensure that data us readable by receiving system
- Formats data to be presented to application layer
- Structures database
- Negotiates data transfer syntax for application layer
- Provides encryption

7. Application
- FTP, Telnet, HTTP (Protocol)
- Provides access for users
- Provides network services to application processess
- Provides user authentication

(A)ll (P)eople (S)leeping (T)hrough (N)etworking (D)on't (P)ass  


Application                    Application
Presentation                   Presentation
Session                        Session
Transportation <--Segments-->  Transportation
Networking     <--Packets-->   Networking
DataLink       <--Frames-->    DataLink
Physical       <--Bits-->      Physical

## Differnet Types of Models
**OSI**
Application
Presentation
Session
Transportation
Networking
DataLink
Physical

**TCP/IP**
Application
Transportation
Internet
Networking Access

**Hybrid**
Application
Transportation
Networking
DataLink
Physical

## Host Communication
- How does host B know what whether the traffic arriving at layer 2
is IPv4 or IPv6?

### DataLink -> Networking
```
Application
Transportation
Networking  -------
                  ^   Type Number ? NIC (IPv4 or IPv6)
                  |   The type field informs the device
DataLink ----------   which process to send the traffic to.
Physical
```
### Networking -> Transportation
```
Application
Transportation ----------  
                        ^   Protocol Number TCP or UDP
                        |   
Networking     -------
DataLink   
Physical
```
### Transportation -> Application
```
Application     -------
                        ^   Port Number 
                        |   
Transportation ----------  
Networking  
DataLink   
Physical
```
