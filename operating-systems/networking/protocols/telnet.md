# Telnet

[![protocolsandservers](../../../cybersecurity/_badges/thmp/protocolsandservers.svg)](https://tryhackme.com/room/protocolsandservers)
[![networkservices](../../../cybersecurity/_badges/thmp/networkservices.svg)](https://tryhackme.com/room/networkservices)

<div class="row row-cols-lg-2"><div>

Telnet is a protocol to communicate with another computer. It can be used to send messages in any protocols, as long as you use the protocol "language", which is often hard.

🐊️ **Port**: 23 (TCP)

🔥 Telnet communications are not encrypted.

```ps
$ telnet IP port
# 1. the server sends the protocol banner
# 2. the user writes text while following the protocol
```
</div><div>

As an example, for HTTP version 1.1, you can write

```ps
$ telnet IP 80
GET / HTTP/1.1
Host: example.com
# leave two blank lines (press ENTER twice)
```
</div></div>