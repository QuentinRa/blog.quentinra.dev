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

## Demilitarized Zone (DMZ)

<div class="row row-cols-md-2"><div>

A Demilitarized Zone (DMZ) is a physical or logical subnet separating two networks, often a LAN and a WAN. It's usually used to isolate public servers from internals servers. For instance,

* Web servers
* Email servers
* VPN servers
* DNS servers
* ...
</div><div>
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