# Wireshark 

- is an opensource, network analyzer tool capable of sniffing and investigating live traffic. 

Usecases 
- detecting and troubleshooting network problems 
- detecting security anomalies
- investigating and learning protocol details

# Packet Dissection 

1. The Frame (Layer 1):This will show you what frame/packet you are looking at and details specific to the Physical layer of the OSI model.
2. Source [MAC] (Layer 2):This will show you the source and destination MAC Addresses; from the Data Link layer of the OSI model.
3. Source [IP] (Layer 3):This will show you the source and destination IPv4 Addresses; from the Network layer of the OSI model.
4. Protocol (Layer 4):This will show you details of the protocol used (UDP/TCP) and source and destination ports; from the Transport layer of the OSI model.
5. Protocol Errors:This continuation of the 4th layer shows specific segments from TCP that needed to be reassembled.
7. Application Protocol (Layer 5):This will show details specific to the protocol used, such as HTTP, FTP and SMB. From the Application layer of the OSI model.
8. Application Data: This extension of the 5th layer can show the application-specific data.

# Packet Number
Wireshark calculates the number of investigated packets and assigns a unique number for each packet. This helps the analysis process for big captures and makes it easy to go back to a specific point of an event.
