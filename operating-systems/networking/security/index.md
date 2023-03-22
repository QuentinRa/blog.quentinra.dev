# Network security

<div class="row row-cols-md-2"><div>

...
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

**Spoofing** 🪪: an actor can usurp another machine identity to fake messages coming from the victim.

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

## 👻 To-do 👻

Stuff that I found, but never read/used yet.

<div class="row row-cols-md-2"><div>

* [old](../_old/security/index.md)
* Advanced Malware Protection (AMP)
* Duo (two-factor)
* Identity Services Engine (ISE)
* Umbrella
* Secure Access Service Edge (SASE)
</div><div>
</div></div>