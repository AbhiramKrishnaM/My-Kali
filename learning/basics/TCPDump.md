# TCP Dump Basics

This room introduces some basic command-line arguments for using Tcpdump. The Tcpdump tool and its libpcap library are written in C and C++ and were released for Unix-like systems in the late 1980s or early 1990s. Consequently, they are very stable and offer optimal speed. The libpcap library is the foundation for various other networking tools today. Moreover, it was ported to MS Windows as winpcap.

Specify the network interface

- The first thing to decide is which network interface to listen to using ``-i INTERFACE``.
- You can choose to listen on all available interfaces using ``-i any`` alternatively, you can specify an interface you want to listen on, such as ``-i eth0``

``ip address show``(or merely ``ip a s``) would list the available network interfaces. 


Save the Captured Packets

- This can be achieved by saving to a file using ``-w FILE``

Read Captured Packets from a File

- You can use Tcpdump to read packets from a file by using -r FILE.

Limit the Number of Captured Packets

- You can specify the number of packets to capture by specifying the count using ``-c COUNT``

Don’t Resolve IP Addresses and Port Numbers

- To avoid making such DNS lookups, you can use the ``-n`` argument.


# Filtering Expressions 

