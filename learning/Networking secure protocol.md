# Networking Secure Protocol

# TLS
Transport layer security (TLS): this adds confidentiality, integrity and authenticy. So all the protocols will have "S" at the end stands for "Secure"

Eg:- 
HTTP -> HTTPS
POP3 -> POP3S
SMTP -> SMTPS

The first step for a server or client that needs to identify itself is to get a Signed TLS Certificate


1. First the server admin created a "Certificate Signing Request" (CSR) and submits it to "Certificate Authority" (CA)
2. CA verifies the CSR and issues a digital certificate 

#### (Keep in mind) SSL -> Secure Sockets layer 

# HTTPS

HTTP relies of TCP and uses port 80 by default


How web browser requests a page over HTTP
After resolving the domain name to an IP address, the client will do this
1. Establish a TCP 3 way handshake with the target server 
2.  Communicate using the HTTP protocol

What hapens with HTTPS (HTTP over TLS)
1. Establish a 3 way handshake with the target server 
2. establish a TLS session
3. communicate using the http protocol


Adding TLS to HTTP leads to all packets being encrypted


The insecure versions use the default TCP ports 

| Protocol | Default Port |
| HTTP| 80|
|smtp|25| 
|POP3|110|
|IMAP|143|
|FTP|21|


The secure port version 

| Protocol | Default Port |
| HTTPS| 443|
|SMTPS|465 and 587| 
|POP3S|995|
|IMAPS|993|
|FTPS|990|

# SSH (Secure Shell)
Creates a secure "tunnel" to route other protocols through ssh. This setup is like a VPN like connection 

# SFTP (SSH File transfer protocol) and FTPS (File transfer protocol)

 