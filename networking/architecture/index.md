# Network architecture

<div class="row row-cols-md-2"><div>

...
</div><div>

...
</div></div>

<hr class="sep-both">

## Security risks

<div class="row row-cols-md-2 mt-4"><div>

**Sniffing**: without or with a weak encryption, an actor can listen to exchanged packets, to learn more about the network architecture, and to find the weak point.

**Spoofing**: an actor can usurp another machine identity to fake messages coming from the victim

**MITM**: xxx

**Tampering**: without integrity checks, an actor can tamper with messages without the sender/receiver being aware of it
</div><div>

**Firewalls**: it's important that the firewall has good access control rules and both the rules and the firewall are up-to-date.

**Logs**: centralized logs are good for users, but they must be secured to ensure that they are not tampered, and they must be closely monitored for the company to detect unusual activity as fast as possible.

**Password**: we must ensure that administrators/managers do not use weak/compromised passwords.
</div></div>

<hr class="sep-both">

## Simple Network Management Protocol (SNMP)

<div class="row row-cols-md-2"><div>

The Simple Network Management Protocol (SNMP) is an old protocol from 1990-2000 that is still quite used by companies to manage and monitor network devices <small>(routers, switch, firewalls...)</small>.

The goal is to ensure that network devices, usually called SNMP "objects" or "agents" are operating efficiently and effectively in real-time. Every information is send to a SNMP manager.

➡️ SNMP uses the port 161 (TCP/UDP).

SNMPv2c is still used by some companies even if it's advised to use SNMPv3 as the latter is more secure. SNMPv2c

* ❌ is not scalable. Companies will experience performance problems that may lead to longer delays, and decrease the employees' efficiency.
* ❌ is not reliable: error messages can be misinterpreted as they may be incomplete or incorrect.
* ❌ is vulnerable: spoofing, tampering, sniffing...
* ✅ Community strings can be set up. They are password-like string, that need to be complex and changed regularly. Only those with the correct community string can fetch data from a network device. By default, anyone can fetch data it.

Commands: `snmpget`, `snmpwalk`, `snmpset`, `snmptrap`...
</div><div>

Migrating to SNMPv3 can be hard, but it may be required to comply with some regulations <small>(PCI DSS, HIPAA)</small>. Overall it's more robust, performant, reliable and secure.

* ❌ some device may not be compatible with SNMPv3
* ❌ employees need to learn SNMPv3 <small>(cost/...)</small>
* ✅ the provider <small>(ex: CISCO, IBM, SolarWinds...)</small> can provide some seamless support to upgrade
* ✅ SNMPv3 has a more reliable error-management system
* ✅ SNMPv3 has a more secure <small>(integrity checks, encryption, access management with USM/VACM, secure authentication...)</small>
* ✅ SNMPv3 is more performant

Commands: `snmpget`, `snmpwalk`, `snmpset`, `snmpinform`...

➡️ A company can use both SNMPv2c and SNMPv3, it allows a softer migration, but it increases the complexity of the task.
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

</div></div>