# Second step - Discovery

[![activerecon](../../_badges/thm/activerecon.svg)](https://tryhackme.com/room/activerecon)

<div class="row row-cols-md-2"><div>

Discovery 🏝️, a.k.a. active recon (reconnaissance) is the second step of the pentester activities.

It involves gathering information about the target by **probing their network or systems** 🛶️, to find exploitable vulnerabilities.

* 🎯 Host discovery <small>(OS, version...)</small>
* 🕸️ Network discovery <small>(architecture...)</small>
* 🧭 Systems, services and application discovery <small>(FTP, APIs...)</small>
* ...

Unlike passive discovery, as you are directly interacting with the target, you are likely to be detected, and maybe caught 🚓.
</div><div>

Common activities are:

* 🚪 Find entry points
  * running services and open ports
  * web applications or APIs
  * wireless network
  * physical devices
  * backdoors
  * ...
* 🔥 Find versions as there may be known vulnerabilities
* 🔑 Find usernames, backups, exposed data
* 🥅 Find the network architecture <small>(firewall/IDS...)</small>
* 💃 Find any social engineering indicators <small>(contact employees...)</small>
* 🌿 Investigate if a third-party/supplier is vulnerable
</div></div>

<hr class="sep-both">

## Tools and methods 🗺️

<div class="row row-cols-md-2"><div>

Scanning and enumeration

* [nmap](tools/nmap.md) 🚪🔥: a stealthy and powerful port scanner
* [Rustscan](tools/rustscan.md) 🚪🔥: a fast port scanner for CTFs
* [Masscan](tools/masscan.md) 🚪: an aggressive port scanner in mass

Network mapping

* [ping](tools/ping.md) 🥅: check if a host respond to pings
* [Packet tracing](tools/trace.md) 🥅: map a network
</div><div>

Vulnerabilities scanners

* [Nessus](tools/nessus.md): port scanning, find vulnerabilities, quite noisy/slow
</div></div>

<hr class="sep-both">

## 👻 To-do 👻

Stuff that I found, but never read/used yet.

<div class="row row-cols-md-2"><div>

* `telnet`/`curl` to fetch banners/headers
* file analysis (comments, parameters, sensitive data...)
* `sudo arp-scan -l -I eth0`
</div><div>

* SET (Social Engineer Toolkit)
* OWASP ZAP
* WebScarab
* Vega
* Aircrack-ng
* Reaver
* Kismet
* MBSA
* [Cain and Abel](https://github.com/xchwarze/Cain)
</div></div>