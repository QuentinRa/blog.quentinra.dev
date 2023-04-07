# Cybersecurity

<div class="row row-cols-md-2"><div>

Cybersecurity involves securing IT systems against external threats. There are 3 categories of people:

* ⬜ **White hats**: hackers that follow the rules, try to benefit others
* 🌫️ **Grey hats**: hackers that are usually not following the rules, but often benefiting others <small>(take down malicious websites)</small>
* ⬛ **Black hats**: criminals/hackers. See [blackhat.com](https://www.blackhat.com/).

👉 White hats are also called Ethical hackers.
</div><div>

IT specialists are usually in one of of the following teams:

* 🟥 [Red team](/cybersecurity/red-team/_knowledge/index.md): offensive team
* 🟦 [Blue team](/cybersecurity/blue-team/_knowledge/index.md): defensive team

There is also the 🟪 Purple team, which is a mix of both. This a modern team created to facilitate exchange between both teams.
</div></div>

<hr class="sep-both">

## Terminology

<div class="row row-cols-md-2"><div>

This section regroups common terms used in red and blue team.

* **Vulnerability**/**weakness**: a failure/flaw in a system
* **Exploits**: code that makes use of a vulnerability to gain access to a machine, install malware, steal data...
* **0 Day**/Zero day: an unknown vulnerability that was just discovered
</div><div>

Some well-known cyberattacks ([source](https://www.malwarebytes.com/))

* **ransomware** 🔒: lock your system, and ask for a ransom.
* **adware** 📰: hide, and show ads in the browser, may monitor the user to show relevant ads.
* **spyware** 🕵️: hide, monitor users, steal credentials...
* **trojans horse** 🎠: programs that pretend to do something, while actually doing something malicious
* **cryptojacking** ⛏️: hide, and mine currencies on your computer
* **virus** 😎: attached to a program, replicate, and spread
</div></div>

<hr class="sep-both">

## Famous attacks

<table class="table table-bordered table-striped border-dark mt-4">
<thead><tr><th>Classification</th><th>Notes</th></tr></thead>

<tr><td>Estonia (2007)<br><b>DDOS</b></td><td>

The first major attack against a country. A Russian group used botnets from 87 countries to attack Estonian banks/...
</td></tr>

<tr><td>Stuxnet (2010)<br><b>SCADA</b></td><td>

The first attack targeting SCADA systems. An infected USB key was connected a computer on the internal network. One of the 3 viruses of the "olympic games" along **DuQu**, and **Flame**. Supposedly made by the NSA, and Iran.
</td></tr>

<tr><td>Mirai botnet (2016)<br><b>DDoS</b></td><td>

...
</td></tr>

<tr><td>WannaCry (2017)<br><b>Ransomware</b></td><td>

Use a vulnerability in Windows. The exploit was created by the NSA and  stolen by hackers in 2013. The NSA notified Microsoft when this virus was released so that they patch it. Used in 2017 by North Korea, infected 200 000 computers. Auto-replicating virus, asking for a ransom. The NSA added a kill switch to the exploit, allowing anyone knowing it to stop the propagation.
</td></tr>

<tr><td>SolarWinds (2020)<br><b>Supply-chain</b></td><td>

...
</td></tr>
</table>

<hr class="sep-both">

## 👻 To-do 👻

Stuff that I found, but never read/used yet.

<div class="row row-cols-md-2"><div>

* [Old - Getting Started](/_kmp/_cybersecurity/cybersecurity/index.md)
* [Old - Virtual Machines](/_kmp/_cybersecurity/cybersecurity/vms.md)
* [Old - H@king box](/_kmp/_cybersecurity/cybersecurity/hacking_box.md)
* CIS (cyber-defense, hardening kits - build kit content)

Random

* [Old - CyberDefense](/_kmp/_cybersecurity/defense/general/index.md)

XXX

* threatmap
* ShadowServer
* [getcybersafe](https://www.getcybersafe.gc.ca/en)
</div><div>

Exploitation

* [Old - bruteforce](/_kmp/_cybersecurity/exploitation/services/bruteforce.md)
* SQL
  * [Old - Database](/_kmp/_cybersecurity/exploitation/database/index.md)
  * [Old - SQLi](/_kmp/_cybersecurity/exploitation/database/sqli/index.md)
  * [Old - sqlmap](/_kmp/_cybersecurity/exploitation/database/sqlmap/index.md)
* [Old - General](/_kmp/_cybersecurity/exploitation/general/index.md)
* [Old - Shell](/_kmp/_cybersecurity/exploitation/general/shell.md)
* [Old - msfconsole](/_kmp/_cybersecurity/exploitation/general/metasploit/msfconsole.md)

Priv. Esc.

* [Old - General](/_kmp/_cybersecurity/privilege-escalation/index.md)
* [Old - Linux](/_kmp/_cybersecurity/privilege-escalation/linux/index.md)
* [Old - Windows](/_kmp/_cybersecurity/privilege-escalation/windows/index.md)
</div></div>