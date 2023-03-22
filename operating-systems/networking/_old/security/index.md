# Architecture & Security

➡️ See IDS/IPS such as [pfsense](https://www.pfsense.org/), [snort](https://www.snort.org/) or [suricata](https://suricata.io/).

**Traffic mirroring**

➡️ See the SPAN function on some Cisco switches. See also NetFlow to collect and analyze network traffic data.

➡️ Network or protocol analyzers: Wireshark, tcpdump...

**Triple-A model**: Authentication, Authorization, and Accounting. It's a framework to control who can access the network, and what can they do. These are usually implemented by AAA-servers.

➡️ See the RADIUS or the TACACS+ protocol...

<hr class="sep-both">

## Random protocols/notes

<div class="row row-cols-md-2 mt-3"><div>

* Disable insecure/unused services/protocols
* Remote connections
  * Add a timeout, a max number of connections...
  * Disable access to internet if not required
  * Force the use of strong passwords
  * Use authentication using a certificate <small>(if applicable/...)</small>
* Harden Access Points (AP)
  * Limit the range to the company
  * Disable SSID broadcasting <small>(if applicable)</small>
  * Use non-default settings
  * 💥 Evil twin attack
</div><div>

* Harden network interface
  * Set timeouts/keepalive parameters
  * Use ACLs/network filtering to prevent the network interface from receiving unexpected traffic <small>(ex: as the target of a DoS)</small> or being used with unauthorized or malicious protocols
* Change default parameters <small>(WPA, SSID, SNMP...)</small>
</div></div>

<hr class="sep-both">

## TCP/IP Protocol Stack Security

<div class="row row-cols-md-2 mt-3"><div>

The set of protocols that make up the TCP/IP suite, a.k.a. as the TCP/IP protocol Stack, is exposed to some vulnerabilities.

➡️ See [Active Directory - TCP/IP](/operating-systems/windows/active-directory/index.md#configure-tcpip-parameters).

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

* **Non-repudiation** <small>(user dening having performed some action)</small>

👉 IP addresses can be spoofed. 💥 The hacker claim that someone else used his IP for the attack.  ➡️ Use digital signatures and encryption to ensure that we know who sent the packet.
</div></div>

<hr class="sep-both">

## ARP, DHCP, and DNS security

<div class="row row-cols-md-2"><div>
</div><div>

DNS servers are used to map a domain to an IP address.

**Open DNS resolvers** <small>(DNS allowing everyone to poll data)</small>

👉 An attacker can use them to amplify DDoS attacks. 💥 DDoS ➡️ Configure DNS to not respond to everyone, use rate-limiting.

**Stealthy DNS attacks**

👉 An attacker attempt to secretly alter a DNS records <small>(ex: redirect to a malicious site)</small> ➡️ See DNSSEC.

**DNS cloaking attacks**

👉 An attacker create malicious subdomains to a compromised domain ➡️ Monitor unauthorized DNS changes, DNS pinning...

**DNS tunneling attacks**

👉 Use the DNS protocol to send malicious payload in DNS query to bypass firewalls/... ➡️ DNS firewalls...
</div></div>

<hr class="sep-both">

## ACLs

<div class="row row-cols-md-2"><div>

Access control lists (ACLs) are used to control traffic flow on a network interface by allowing or denying traffic based on specific criteria.

* 🚛 one ACL for each enabled protocol
* ✈️ one ACL per direction <small>(incoming and outgoing)</small>
* 🎯 you can create one ACL for each interface

They can be used on many types of network devices. There are two types of ACLs:

* ✋ **Standard ACLs**: filter based on the IP address
* ⛔ **Extended ACLs**: filter based on the source and destination IP address and port, the protocol...
</div><div>

...
</div></div>

<hr class="sep-both">

## Cisco

<div class="row row-cols-md-2"><div>

ACLs (std <small>(1-99, 1300-1999)</small>, extended <small>(100-199, 2000-2699)</small>, can be a string)

```text!
access-list 10 remark Some text here.
access-list 10 permit 192.168.30.0 0.0.0.255 # std
access-list 103 permit tcp 192.168.30.0 0.0.0.255 any eq 80 # extended
access-list 101 permit tcp host 192.168.1.100 any eq www
access-list 101 deny ip any any
no access-list 10 # delete

show access-lists
```
</div><div>

...
</div></div>