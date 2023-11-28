# Simple Network Management Protocol (SNMP)

<div class="row row-cols-lg-2"><div>

The Simple Network Management Protocol (SNMP) is an old protocol from 1990-2000 that is still quite used by companies to manage and monitor network devices <small>(routers, switch, firewalls...)</small>.

The goal is to ensure that network devices are operating efficiently and effectively in real-time.
</div><div>

 SNMP uses the following ports
 
* **UDP/161** ⛵: to send and receive SNMP messages
* **TCP/161** ⛴️: sometimes used instead of UDP to send messages
* **UDP/162** 🔥️: to send trap messages (reports)
</div></div>

<hr class="sep-both">

## Knowledge

<div class="row row-cols-lg-2"><div>

The **Management Information Base (MIB)** 📂 is a component used to store information about network devices. This is a tree-like structure with each node called an **object** 📰 and carrying information such as:

* ✈️ the number of packet that transited by this node
* 💦 the CPU utilization of a server
* ...

A **agent** 👮 is a module that runs on a network device and read/store information about the device inside the MIB.
</div><div>

The **SNMP manager** 👑 is a software that retrieves data from the MIB by asking the agent associated with each device. It runs on a network management system (NMS).

The SNMP manager can also send instructions to the agent to set or change the values of objects. The agent will update its associated device to match the instruction.

Agents can send messages also known as "traps" without being request, for instance, when a problem is detected 🔥.
</div></div>

<hr class="sep-both">

## Configuration

<div class="row row-cols-lg-2"><div>

You can configure SNMP using commands, such as:

* `show snmp`: display the current configuration
* `snmp-server community [...]`: configure a community
* `no snmp-server community [...]`: delete a community
* `snmp-server location [...]`: set the location <small>(for humans)</small>
* `snmp-server host [...]`: define the hosts <small>(for traps...)</small>
</div><div>

You can also configure it on a Windows Server as follows:

* Start the **Server Manager**
* Click on "Add roles and features"
* Press Next thrice
* In Features, select "SNMP Service"

Once installed, open "Services" and find the SNMP service. Right-click on edit, and edit the properties however you want.
</div></div>

<hr class="sep-both">

## SNMPv2c

<div class="row row-cols-lg-2"><div>

SNMPv2c is still used by some companies even if it's advised to use SNMPv3 as the latter is more secure. SNMPv2c

* ❌ is not scalable. Companies will experience performance problems that may lead to longer delays, and decrease the employees' efficiency.
* ❌ is not reliable: error messages can be misinterpreted as they may be incomplete or incorrect.
* ❌ is vulnerable: spoofing, tampering, sniffing...
</div><div>

* ✅ Community strings can be set up. They are password-like string, that need to be complex and changed regularly. Only those with the correct community string can fetch data from a network device. By default, anyone can fetch data it. A community can be read-only (RO) or Read-Write (RW).

Commands: `snmpget`, `snmpwalk`, `snmpset`, `snmptrap`...

➡️ A company can use both SNMPv2c and SNMPv3, it allows a softer migration, but it increases the complexity of the task.
</div></div>

<hr class="sep-both">

## SNMPv3

<div class="row row-cols-lg-2"><div>

Migrating to SNMPv3 can be hard, but it may be required to comply with some regulations <small>(PCI DSS, HIPAA)</small>. Overall it's more robust, performant, reliable and secure.

* ❌ some device may not be compatible with SNMPv3
* ❌ employees need to learn SNMPv3 <small>(cost/...)</small>
* ✅ the provider <small>(ex: CISCO, IBM, SolarWinds...)</small> can provide some seamless support to upgrade from SNMPv2c
* ✅ SNMPv3 has a more reliable error-management system
</div><div>

* ✅ SNMPv3 has a more secure <small>(integrity checks, encryption, access management with USM/VACM, authentication...)</small>
* ✅ SNMPv3 is more performant

Commands: `snmpget`, `snmpwalk`, `snmpset`, `snmpinform`...
</div></div>

<hr class="sep-both">

## SNMP vulnerabilities ☠️

<div class="row row-cols-lg-2"><div>

#### Common SNMPv2c community strings

You can use `snmpwalk` to list SNMP variables from SNMP devices. Two common community strings are `public` and `private`.

```
$ snmpwalk -v 2c -c community_string IP OID
```

➡️ The OID for sysName is `1.3.6.1.2.1.1.5.0`.
</div><div>

#### Brute force SNMPv2c community strings

You can brute force community strings with [onesixtyone](https://github.com/trailofbits/onesixtyone) (0.4k ⭐):

```ps
$ onesixtyone -c wordlist IP
```
</div></div>

<hr class="sep-both">

## 👻 To-do 👻

Stuff that I found, but never read/used yet.

<div class="row row-cols-lg-2"><div>

* SNMP ACLs (SNMP tcp/161): separate ACLs specifically for SNMP, they are more granular than the generic ACLs
    * ip/range of ips
    * a version of SNMP
    * a community (SNMPv2c?)
</div><div>
</div></div>