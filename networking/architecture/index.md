# Architecture & Security

Communications and network are exposed to many risks.

<div class="row row-cols-md-2 mt-4"><div>

<p class="text-center">💥 Attacks and vulnerabilities 💥</p>

**Sniffing**: without or with a weak encryption, an actor can listen to exchanged packets, to learn more about the network architecture, and to find the weak point.

**Spoofing**: an actor can usurp another machine identity to fake messages coming from the victim

**Tampering**: without integrity checks, an actor can tamper with messages without the sender/receiver being aware of it

**MITM** (Man-in-the-middle): an actor intercepts communications and modify or manipulate the data being transmitted.

**Password**: we must ensure that administrators/managers do not use weak/compromised passwords.

**DoS**: Denial of Service. Attackers send malicious packets to slow down a host; they generate a high level of traffic...
</div><div>

<p class="text-center">👉 Solutions or tools 👈</p>

**Firewalls**: firewall are used to block/allow some traffic based on rules. It's important that the access control rules are well crafted. Both the rules and the firewall must be up-to-date.

**Traffic mirroring**: this feature is available on many network switches. It allows us to copy the incoming and ongoing traffic to a monitored device such as a network analyzer or an IDS.

➡️ See the SPAN function on some Cisco switches. See also NetFlow to collect and analyze network traffic data.

➡️ Network or protocol analyzers: Wireshark, tcpdump...
</div></div>

<hr class="sep-both">

## TCP/IP Protocol Stack Security

<div class="row row-cols-md-2 mt-3"><div>

The set of protocols that make up the TCP/IP suite, a.k.a. as the TCP/IP protocol Stack, is exposed to some vulnerabilities.

* **Weak authentication**

👉 The source and the destination of packets is not guaranteed, an attacker can easily spoof them. 💥 Spoofing ➡️ Implement authentication and access control.

* **Lack of Integrity Protection**

👉 The message can be tampered. 💥 ICMP Redirect Option. Packet injection. ➡️ Use encryption and digital signatures.

* **Confidentiality**

👉 The message is sent in clear text. 💥 Sniffing ➡️ Use encryption or a VPN.
</div><div>

* **Availability**

👉 Can be make unavailable. 💥 DoS, spoofing, poisoning. ➡️ Use firewalls, IDS/IPS...

* **Accounting** <small>(track network usage)</small>

👉 It's difficult to find the source because it can be spoofed. ➡️ Implement logging and auditing to track network traffic.

* **Non-repudiation** <small>(user dening having performed some action)</small>

👉 IP addresses can be spoofed. 💥 The hacker claim that someone else used his IP for the attack.  ➡️ Use digital signatures and encryption to ensure that we know who sent the packet.
</div></div>

<hr class="sep-both">

## Simple Network Management Protocol (SNMP)

<div class="row row-cols-md-2"><div>

The Simple Network Management Protocol (SNMP) is an old protocol from 1990-2000 that is still quite used by companies to manage and monitor network devices <small>(routers, switch, firewalls...)</small>.

The goal is to ensure that network devices are operating efficiently and effectively in real-time.

➡️ SNMP uses the port 161 (TCP/UDP).

One if the components is the Management Information Base (MIB) which is used to store information about devices. This is a tree-like structure with each node called an object carrying information like the number of packet that transited by this node, the CPU utilization of a server...

A agent is a module that runs on a network device and store information about the device inside the MIB.

The SNMP manager is a software that retrieves data from the MIB by interacting with the agent associated with the device. It runs on a network management system (NMS). 

The SNMP manager can also send instructions to the agent to set or change the values of objects. The agent will update its associated device to match the instruction.

Agents can send messages also known as "traps" without being request, for instance, when a problem is detected.

➡️ You can configure SNMP on a Windows Server with ADDS. You can also configure the server using commands too such as 

* `show snmp`: display the current configuration
* `snmp-server community [...]`: configure a community 
* `no snmp-server community [...]`: delete a community 
* `snmp-server location [...]`: set the location <small>(for humans)</small>
* `snmp-server host [...]`: define the hosts <small>(for traps...)</small>

</div><div>

SNMPv2c is still used by some companies even if it's advised to use SNMPv3 as the latter is more secure. SNMPv2c

* ❌ is not scalable. Companies will experience performance problems that may lead to longer delays, and decrease the employees' efficiency.
* ❌ is not reliable: error messages can be misinterpreted as they may be incomplete or incorrect.
* ❌ is vulnerable: spoofing, tampering, sniffing...
* ✅ Community strings can be set up. They are password-like string, that need to be complex and changed regularly. Only those with the correct community string can fetch data from a network device. By default, anyone can fetch data it. A community can be read-only (RO) or Read-Write (RW).

Commands: `snmpget`, `snmpwalk`, `snmpset`, `snmptrap`...

➡️ A company can use both SNMPv2c and SNMPv3, it allows a softer migration, but it increases the complexity of the task.

Migrating to SNMPv3 can be hard, but it may be required to comply with some regulations <small>(PCI DSS, HIPAA)</small>. Overall it's more robust, performant, reliable and secure.

* ❌ some device may not be compatible with SNMPv3
* ❌ employees need to learn SNMPv3 <small>(cost/...)</small>
* ✅ the provider <small>(ex: CISCO, IBM, SolarWinds...)</small> can provide some seamless support to upgrade from SNMPv2c
* ✅ SNMPv3 has a more reliable error-management system
* ✅ SNMPv3 has a more secure <small>(integrity checks, encryption, access management with USM/VACM, authentication...)</small>
* ✅ SNMPv3 is more performant

Commands: `snmpget`, `snmpwalk`, `snmpset`, `snmpinform`...
</div></div>

<hr class="sep-both">

## 👻 To-do 👻

Stuff that I found, but never read/used yet.

<div class="row row-cols-md-2"><div>

* Access Control List (ACL): rules determining which traffic is allowed/not allowed.

* SNMP ACLs (SNMP tcp/161)
  * ip/range of ips
  * a version of SNMP
  * a community (SNMPv2c?)
</div><div>


* Streaming network telemetry (modern SNMP?)
* Network Access Control (used with SNMP?)
* DDOS. Amplification and reflexion DoS.
* Address Spoofing, TCP, and UDP Attacks
* ARP vulnerabilities x2 (`arp – a`, `arp –a –d`)
* DNS and DHCP vulnerabilities
* Emails/Social-engineering

</div></div>