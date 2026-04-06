# NMAP

Nmap is an open-source network scanner that was first published in 1997

Before we start, we should mention that uses multiple ways to specify its targets:

    IP range using ``-``  If you want to scan all the IP addresses from 192.168.0.1 to 192.168.0.10, you can write 192.168.0.1-10
    IP subnet using ``/`` If you want to scan a subnet, you can express it as 192.168.0.1/24, and this would be equivalent to 192.168.0.0-255
    Hostname: You can also specify your target by hostname, for example, example.thm

Let’s say you want to discover the online hosts on a network. Nmap offers the -sn option, i.e., ping scan. However, don’t expect this to be limited like ping. Let’s see this in action.


# Scanning a “Local” Network

In this context, we use the term “local” to refer to the network we are directly connected to, such as an Ethernet or WiFi network. In the first demonstration, we will scan the WiFi network to which we are connected. Our IP address is 192.168.66.89, and we are scanning the 192.168.66.0/24 network. The nmap -sn 192.168.66.0/24 command and its output are shown in the terminal below.

``nmap -sn 192.168.66.0/24``

# Scanning a “Remote” Network

Consider the case of a “remote” network. In this context, “remote” means that at least one router separates our system from this network. As a result, all our traffic to the target systems must go through one or more routers. Unlike scanning a local network, we cannot send an ARP request to the target.

``nmap -sn 192.168.11.0/24``