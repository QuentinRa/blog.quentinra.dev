# Network security

<div class="row row-cols-md-2"><div>

**Common security controls** 🛫

* Disable insecure/unused services/protocols
* Secure remote connections <small>(timeout, max number of connections, disable internet if not required, use strong passwords or a certificate...)</small>
* Harden network interfaces <small>(timeout/keepalive, ACLs...)</small>
* Change default parameters <small>(WPA, SSID, SNMP...)</small>
* ...
</div><div>

In security, we often categorize the traffic into two types

* **East-West traffic** 🏡: traffic between two internal hosts/apps
* **North-South traffic** 🌍: traffic with an external network

Security controls are determined based on the type of traffic.
</div></div>

<hr class="sep-both">

## Common networking attacks

<div class="row row-cols-md-2"><div>

**Sniffing** 🐛: without or with a weak encryption, an actor can listen to exchanged packets, to learn more about the network architecture, and to find the weak point.

**Spoofing** 🪪: an actor can usurp another machine identity to fake messages coming from the victim <small>(ex: MAC spoofing)</small>.

**Tampering** 😈: without integrity checks, an actor can tamper with messages without the sender/receiver being aware of it

**MITM** (Man-in-the-middle) 🥷: an actor intercepts communications and modify or manipulate the data being transmitted.
</div><div>

**Password** 🔑: we must ensure that administrators/managers do not use weak/compromised passwords.

**DoS** 🔥: Denial of Service. Attackers send malicious packets to slow down a host; they generate a high level of traffic...

➡️ See DDoS, Reflection/amplification DoS, Smurf DDoS, or the ping of death, Spoofed disconnect attack, CTS flood...
</div></div>

<hr class="sep-both">

## Firewalls

<div class="row row-cols-md-2"><div>

A firewall is a solution present in every modern secure network. It is used to filter 👮, and block unauthorized traffic ⛔.

There are many kind of firewalls, that operate at multiple OSI layers.

* [Network firewall](../topology/index.md#networking-devices)
* Host-based firewall
* Application firewall <small>(ex: on webservers against SQLi/XSS...)</small>
* Proxy firewall
* Next-generation firewall (NGFW) <small>(combine application and network firewalls. Intrusion prevention, deep packet inspection, block malware...)</small>
* Hybrid firewall
* Cloud firewall
</div><div>

There are two kind of firewall architectures:

* **Stateless firewalls** 🧑: check every packet
* **Stateful firewalls** 🚗: check the session/connection
</div></div>

<hr class="sep-both">

## Network zoning

<div class="row row-cols-md-2"><div>

Network zoning is a form of [network segmentation](../topology/index.md#network-segmentation) that focuses on security rather than performances or similar reasons that could lead to network segmentation.

The focuses is in creating zones with devices that shares the same security requirements/level, to apply specific appropriate security controls according to the security level of the group.

➡️ Traffic between zones are filtered by firewalls/...

➡️ You can sort devices by CIA level, like if a device need up to 4 hours of unavailability, then A=high...

</div><div>

#### Demilitarized Zone (DMZ)

A Demilitarized Zone (DMZ) is a physical or logical subnet separating two networks, often a LAN and a WAN. It's usually used to isolate public servers from internals servers. For instance,

* Web servers
* Email servers
* VPN servers
* DNS servers
* ...
</div></div>

<hr class="sep-both">

## Access control lists (ACLs)

<div class="row row-cols-md-2"><div>

Access control lists (ACLs) are used to control traffic flow on a network interface by allowing or denying traffic based on specific criteria.

* 🚛 one ACL for each enabled protocol
* ✈️ one ACL per direction <small>(incoming and outgoing)</small>
* 🎯 you can create one ACL for each interface

They can be used on many types of network devices. There are two types of ACLs:

* ✋ **Standard ACLs**: filter based on the IP address
* ⛔ **Extended ACLs**: filter based on the source and destination IP address and port, the protocol...
</div><div>

Extended ACLs are usually placed near the source of the traffic, preventing the forbidden traffic to leave the subnet. 

👉 Avoid useless bandwidth usage.

Standard ACLs are usually placed near the destination of the traffic, and they filter based on the source, regardless of the destination. 

👉 We only define the source, so we need to ensure only allowed sources are allowed.
</div></div>

<hr class="sep-both">

## TCP/IP Protocol Stack Security

<div class="row row-cols-md-2 mt-3"><div>

The set of protocols that make up the TCP/IP suite, a.k.a. as the TCP/IP protocol Stack, is exposed to some vulnerabilities.

* **Weak authentication**

👉 The source and the destination of packets is not guaranteed, an attacker can easily spoof them. 💥 Spoofing ➡️ Implement authentication and access control.

* **Lack of Integrity Protection**

👉 Messages can be tampered. 💥 ICMP Redirect. Packet injection. ➡️ Use encryption and digital signatures.

* **Confidentiality**

👉 Messages sent as cleartext. 💥 Sniffing ➡️ Use encryption/a VPN.
</div><div>

* **Availability**

👉 Can be make unavailable. 💥 DoS, spoofing, poisoning. ➡️ Use firewalls, IDS/IPS...

* **Accounting** <small>(track network usage)</small>

👉 It's difficult to find the source because it can be spoofed. ➡️ Implement logging and auditing to track network traffic.

* **Non-repudiation** <small>(user denying having performed some action)</small>

👉 IP addresses can be spoofed. 💥 The hacker claim that someone else used his IP for the attack.  ➡️ Use digital signatures and encryption to ensure that we know who sent the packet.
</div></div>

<hr class="sep-both">

## 👻 To-do 👻

Stuff that I found, but never read/used yet.

<div class="row row-cols-md-2"><div>

* Advanced Malware Protection (AMP)
* Duo (two-factor)
* Identity Services Engine (ISE)
* Umbrella
* Secure Access Service Edge (SASE)

Access

* Network Access Control (NAC): allow based on user+device
</div><div>

Firewall applicative

* Application-level gateway (FTP, SIP, or HTTP)

ACLs

* DAC: each owner allow access
* MAC: allowed by a central entity
* RBAC
* RB-RBAC: if condition then permission (mails to folder)
* ABAC: based on the value of the request attributes, resources, env
* Where ACLs?: Database (no), Middleware/API (usually here), Client (dangerous is directly interacting with the API)
</div></div>