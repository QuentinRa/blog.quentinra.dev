# First step - Investigation

[![passiverecon](../../_badges/thm/passiverecon.svg)](https://tryhackme.com/room/passiverecon)

<div class="row row-cols-md-2"><div>

Investigation 🔎, a.k.a. passive recon <small>(reconnaissance)</small> 🕊️ is the **first** step of the pentester activities.

It involves gathering information about the target from afar 👓️, meaning with **no direct interaction with the target** 👀.

<br>

**Goal/Objectives** 🎯: find as much as possible

* 🧑‍💻 Learn more about the company <small>(roles, services...)</small>, the programming languages and software they use...

* 🐟 Find a potential attack vector <small>(ex: a subdomain owned by the company for another purpose, hosted on the same network as their main website, and that may be vulnerable)</small>

* 🧑 Find information about their employees, their emails, their social accounts, their leaked passwords...

* ...
</div><div>

**Tools and methods** 🗺️

* [OSINT gathering](tools/osint.md) 🧑‍💻🧑: any publicly available information
* [DNS analysis](tools/dns.md) 🐟: domain, subdomains...
* [WHOIS analysis](tools/whois.md) 🧑‍💻: domain owner, contact information...
* [Google dorking](tools/dorking.md) 🧑‍💻🐟🧑: find anything indexed by google
* [Shodan](tools/shodan.md) 🐟: find exposed and potentially vulnerable IoT devices
* [Maltego](tools/maltego.md) 🧑‍💻 🐟: find websites, domains, social media accounts...

</div></div>