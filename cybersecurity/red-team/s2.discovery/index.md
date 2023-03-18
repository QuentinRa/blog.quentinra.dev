# Second step - Discovery

[![activerecon](../../_badges/thm/activerecon.svg)](https://tryhackme.com/room/activerecon)

<div class="row row-cols-md-2"><div>

Discovery 🏝️, a.k.a. active recon (reconnaissance) 🕊️ is the second step of the pentester activities.

It involves gathering information about the target by probing their network or systems 🛶️, to find exploitable vulnerabilities.

* 🎯 Host discovery <small>(OS, version...)</small>
* 🕸️ Network discovery <small>(architecture...)</small>
* 🧭 Systems, services and application discovery <small>(FTP, APIs...)</small>
* ...

Unlike passive discovery, as you are directly interacting with the target, you are likely to be detected and caught 🚓.
</div><div>

**Goals/Objectives** 🗺️

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

* [ping]() 🥅: ...
* [traceroute and tracepath]() 🥅: ...
</div><div>

Vulnerabilities scanners

* [Nessus](tools/nessus.md): port scanning, find vulnerabilities, quite noisy/slow
</div></div>

<hr class="sep-both">

## 👻 To-do 👻

Stuff that I found, but never read/used yet.

<div class="row row-cols-md-2"><div>

* aquatone <small>(port scanning, subdomain/website enumation)</small>
  * automate the process of inspecting the website on a port, given a (supposedly long) list of IP addresses.
  * can take reports generated with nmap/masscan
* file analysis (comments, parameters, sensitive data...)
* Hping3
* OpenVAS
* QualysGuard
* Acunetix
* Nexpose
</div><div>

* Medusa
* Empire
* SET (Social Engineer Toolkit)
* OWASP ZAP
* WebScarab
* Vega
* Aircrack-ng
* Reaver
* Kismet
* [Cain and Abel](https://github.com/xchwarze/Cain)
</div></div>