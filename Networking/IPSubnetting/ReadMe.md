# IP Subnetting

### Cheat Sheet for Conversion
```
IP BITS
128 64 32 16 8 4 2 1
```
## Binary Rules
Example IP: 15.100.123.50
Net Mask: 255.255.255.0

### Network / Subnet Address
- fill the host portion of an address with binary 0's
15.100.123.00
00001111.01100010.0111101.00000000

### Broadcast Address
- Fill the host portion of an address with binary 1's
15.100.123.255
00001111.01100010.0111101.11111111

### First Host
- File the host portion of an address with binary 0's except for the last bit which is 1
15.100.123.1
00001111.01100010.0111101.00000001

### Last Host
- File the host portion of an address with binary 1's except for the last bit which is 0
15.100.123.254
00001111.01100010.0111101.11111110

## Examples
Covert the following into the Subnet, Broadcast, FirstHost, and LastHost Address  
`IP: 172.16.35.123/20` == `172.16.0010 | 0011.01111011`  
- Subnet: 172.16. 0010 | 0000 . 00000000 == 172.16.32.0
- Broadcast: 172.16. 0010 | 1111 . 11111111 == 172.16.47.225
- FirstHost: 172.16. 0010 | 0000 . 00000001 = 172.16.32.1
- LastHost: 172.16. 0010 | 1111 . 11111110 = 172.16.47.224

### Cheat Sheet for Conversion | Quick Method
```
IP BITS
128   64   32   16     8     4     2     1
128   192  224  240    248   252   254   255

ie. 256-128 = 128, 256-64=192, ..., 256-1=255
```
## Examples
Covert the following into the Subnet, Broadcast, FirstHost, and LastHost Address  
`IP: 172.16.35.123/20` and Netmask: `255.255.240.0`

Subtract the mask value that is not 255 from 256: `256-240 = 16`
This tells us the subnet are increasing by 16 at a time.
```
172.16.0.0
172.16.16.0
172.16.32.0
            <------ 172.16.35.123/20
172.16.48.0
```
Thus:
- Subnet: 172.16. 0010 | 0000 . 00000000 == 172.16.32.0
- FirstHost: 172.16. 0010 | 0000 . 00000001 = 172.16.32.1
For the Broadcast & LastHost we can take the next network address minus -1 (Broadcast) or -2 (LastHost)
`172.16.48.0`
- Broadcast: 172.16. 0010 | 1111 . 11111111 == 172.16.47.225
- LastHost: 172.16. 0010 | 1111 . 11111110 = 172.16.47.224

## Number of Hosts Supported
- Stealing bit away from the host portion of an address
- Allocating the stolen bits to the network portion of a new address
**Two Important rules:**  
- When ask for the number of host:  Hosts = 2^n - 2 **Count from right to left**
- When ask for the number of networks: Network = 2^n **Count from left to right**

### Short Cut Table
```
2^1 = 2
2^2 = 4
2^3 = 8
2^4 = 16
2^5 = 32
2^6 = 64
2^7 = 128
2^8 = 256
2^9 = 512
2^10 = 1024
```

### Question: ABC ltd. has been allocated subnet 10.1.1.0/24 for a small office. You need to split this subnet into smaller subnet that support 14 machines.

1. Decide which formula to use:
- When ask for the number of host:  Hosts = 2^n - 2 **Count from right to left**
- When ask for the number of networks: Network = 2^n **Count from left to right**
**We will use host**

2. 2^4 - 2 = 14
- We now know that we need to steal 4bits from the host and allocate that to the network portion

3. Covert the host portion of the original network into binary
- Original Network:
10.1.1.0/24  Mask: 255.255.255.0
10.1.1.00000000

4. Host portion is 8bits and only 4bits are required to support 14 hosts
```
Network                 Subnet    Host
10.1.1.                 0000      0000
Mask: 10.1.1.           1111      0000
Mask: 255.255.255.240
```

5. Work out the new subnet mask (do not count the host bits)
- Work out the various subnets
```
Network                   Subnet      Host
1st network = 10.1.1.     0000        0000=10.1.1.0/28
2st network = 10.1.1.     0001        0000
3st network = 10.1.1.     0010        0000
4st network = 10.1.1.     0011        0000
...
Last network = 10.1.1.    1111        0000
```
