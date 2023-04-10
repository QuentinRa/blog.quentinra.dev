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

* [banner grabbing](techniques/banner_grabbing.md) ☠️: get a service banner
* [nmap](tools/nmap.md) 🚪🔥: a stealthy and powerful port scanner
* [Rustscan](tools/rustscan.md) 🚪🔥: a fast port scanner for CTFs
* [Masscan](tools/masscan.md) 🚪: an aggressive port scanner in mass

Network mapping

* [ping](tools/ping.md) 🥅: check if a host respond to pings
* [Packet tracing](tools/trace.md) 🥅: map a network
</div><div>

Vulnerabilities scanners

* [Nessus](tools/nessus.md): port scanning, find vulnerabilities, quite noisy/slow

Websites

* [Website mapping](techniques/mapping.md) 🧭: before investing a website
* [File analysis](techniques/file_analysis.md) 🚪🔥🔑: comments, hidden code, sensitive data...
* [Forced Browsing](techniques/forced_browsing.md) 🚪🔑: find hidden pages/folders
* [IDOR](techniques/idor.md) 🚪🔑: find if you can access someone else content
* [Framework detection](techniques/framework.md) 🚪🔥: find the framework in use - if any
* [Logic flaws](techniques/logic_flaws.md) 🚪: find logic flaws
</div></div>

<hr class="sep-both">

## 👻 To-do 👻

Stuff that I found, but never read/used yet.

<div class="row row-cols-md-2"><div>

* `sudo arp-scan -l -I eth0`
</div><div>
</div></div>