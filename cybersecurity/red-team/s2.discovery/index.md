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

## Arsenal 🌱

<div class="row row-cols-md-2"><div>

* Spoof User-Agent

You can install an extension to make the target website believe that you are using another browser. Look for **User-Agent Switcher** extensions on Google. You can try them on [whatismybrowser](https://www.whatismybrowser.com/).

* Use a proxy

You may use a proxy as an intermediary for your requests. If you do, then you can use the **FoxyProxy extension** of your browser to easily swap between no proxy, and your proxies configurations.

* [Devtools](/programming-languages/web/_general/index.md#-developer-tools-devtools-): by-pass HTML/JS verifications, hide/remove tags...
</div><div>

* Disable scripts

You may do that to bypass JavaScript verifications. You can use plugins such as [noscript](https://noscript.net/), or ublock by clicking on the following icon

![ublock_disable_scripts](_images/ublock_disable_scripts.png)

* HTTP clients

We usually don't only rely on our web browser to recon/exploit websites, as they are unreliable. You can use [Postman, curl](/programming-languages/others/apis/_general/index.md#-testuse-an-api-) or tools such as the [Burp Suite](../s3.exploitation/tools/burp.md)...

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

Vulnerabilities scanners

* [Nessus](tools/nessus.md): port scanning, find vulnerabilities, quite noisy/slow
* [Nikto](tools/nikto.md): website vulnerability scanner
</div><div>

Websites

* [Website mapping](techniques/mapping.md) 🧭: before investing a website
* [OWASP](tools/owasp.md) 🧭: website security/common vulnerabilities
* [Code analysis](techniques/code_analysis.md) 🚪🔥🔑: comments, hidden code, sensitive data...
* [Forced Browsing](techniques/forced_browsing.md) 🚪🔑: find hidden pages/folders
* [IDOR](techniques/idor.md) 🚪🔑: find if you can access someone else content
* [Framework detection](techniques/framework.md) 🚪🔥: find the framework in use - if any
* [Logic flaws](techniques/logic_flaws.md) 🚪: find logic flaws
* [Account discovery](techniques/account.md) 🔑: find accounts
* [Virtual hosts](techniques/vhosts.md) 🚪: find virtual hosts
* [Subdomains](techniques/subdomains.md) 🚪: find subdomains

➡️ You should check for signs of [well-known vulnerabilities](../s3.exploitation/index.md#common-vulnerabilities-)
</div></div>

<hr class="sep-both">

## Mitigations 🛡️

<div class="row row-cols-md-2 mt-4"><div>

* 🔒 Display generic error messages, disable errors messages, and do not give much information <small>(ex: on invalid login, display the message 'credentials invalid', instead of 'username invalid' or 'password invalid')</small>

* 🚧 Test your endpoints with invalid values: 0, -1, characters, symbols... Test your pages with/without excepted parameters, especially if a hacker tries to access pages in an unexpected order.
</div><div>

* 🔫 Do not trust anything coming from the user, its browser, or even your database. Basically, Zero Trust.
</div></div>

<hr class="sep-both">

## 👻 To-do 👻

Stuff that I found, but never read/used yet.

<div class="row row-cols-md-2"><div>

* `sudo arp-scan -l -I eth0`
* [clFrex](https://cifrex.org/)
</div><div>
</div></div>