# First step - Investigation

[![passiverecon](../../_badges/thm/passiverecon.svg)](https://tryhackme.com/room/passiverecon)

<div class="row row-cols-lg-2"><div>

Investigation 🔎, a.k.a. passive recon (reconnaissance) is the first step of the pentester activities during an external penetration testing.

It involves gathering information about the target from afar 👓️, meaning with **no direct interaction with the target** 👀.

🌱 The goal is to find as much information as possible.

🚿️ You can also infer data, for instance, if a company has many customers, then they may have a support page/customer service.

</div><div>

Common activities:

* 🧑‍💻 Learn more about the company <small>(roles, services...)</small>, the technologies, programming languages and software they use...

* 🐟 Find a potential attack vector

* 🧑 Find information about their employees, their emails, their social accounts, their leaked passwords...

* ...
</div></div>

<hr class="sep-both">

## OSINT Gathering

<div class="row row-cols-lg-2"><div>

#### Social Networks — LinkedIn 🧑🐟

You can easily find company employees using LinkedIn.

* ☑️ Are they still claiming to be in the company?
* ✍️ Note down their first name, last Name
* ☎️ Is there an email/phone number in their description?
* 🌍 Did they link a personal blog in their description?
* 🎯 Did they set up some contact emails?

The main problem is that many profiles may not be visible from our account. You can use solutions to access LinkedIn API. For marketing purposes, they are also returning professional and personal emails <small>(if any is known or had leaked)</small>. Refer to [LinkedIn OSINT Tools](/cybersecurity/red-team/s1.investigation/tools/osint/linkedin.md).
</div><div>

#### Deep/Dark Web — Data Leaks 🧑🐟

Data Leaks includes credentials <small>(username, password, hash)</small>, IPs, addresses, and domains. They are the result of a breach or an user being compromised by an [infostealer](https://en.wikipedia.org/wiki/Infostealer). Given a domain <small>(ex: example.com)</small> or an email <small>(ex: toto@example.com)</small>, we can find data leaks using:

| Name                                              | Pricing | API | Uncensored |
|---------------------------------------------------|--------|-----|---------|
| [Aura](https://scan.aura.com/) 👑                   | `[FREE]` | ❌   | ❌       |
| [BreachDirectory](https://breachdirectory.org/)   | `[FREEMIUM]` | ✅   | ❌   |
| [DeHashed](https://dehashed.com/) 👑              |`[PAID]`|✅| ✅       |
| [HackCheck](https://app.hackcheck.io)             |`[PAID]`|✅| ???       |
| [LeakBase](https://leakbase.io)                   |`[PAID]`|❌| ???       |
| [LeakCheck](https://leakcheck.io/) 👑👑👑         |`[PAID]`|✅| ✅       |
| [LeakedDomains](https://leaked.domains)           |`[PAID]`|✅| ???    |
| [LeakLookup](https://leak-lookup.com/)            |`[PAID]`|✅| ???    |
| [LeakPeek](https://leakpeek.com/)                 |`[PAID]`|❌| ✅       |
| [ProxyNova](https://www.proxynova.com/tools/comb) |`[FREE]`|❌| ✅       |
| [Snusbase](https://www.snusbase.com) 👑👑         |`[PAID]`|✅ | ✅       |
| [WeLeakInfo](https://weleakinfo.io/)              |`[PAID]`|✅ | ???       |

We can find infostealers and their collected data using:

| Name                                                 | Pricing | API | Uncensored |
|------------------------------------------------------|--------|-----|------------|
| [HackedList](https://hackedlist.io/)                 |`[PAID]`|✅| ???        |
| [HudsonRock](https://cavalier.hudsonrock.com/docs) 👑 | `[FREE]` | ✅   | ❌          |
| [WhiteIntel](https://whiteintel.io/) 👑                | `[FREEMIUM]` | ✅   | ❌          |

There are costly but powerful platforms to monitor telegram and the dark/deep web:

* [Intelligence X](https://intelx.io/) <small>(👻)</small>
* [SearchLight Cyber](https://slcyber.io/) <small>(👻)</small>
* [SocRadar](https://socradar.io/) <small>(Very limited as a free user)</small>
* [Kela Cyber](https://www.kelacyber.com/) <small>(Only keep accessible the last 2 years)</small>
* [DarkOwl](https://www.darkowl.com/) <small>(Too many unparsed breaches and records are similar to what DeHashed returns)</small>

Additional services:

* [Have I Been Pwned](https://haveibeenpwned.com/) `[FREEMIUM]`: website to list data leaks given an email
* [LeakCheck](https://wiki.leakcheck.io/en/api/public) `[FREE]`: API to list data leaks given an email
* [CyberNews](https://cybernews.com/personal-data-leak-check/) `[FREE]`: API to list some data leaks given an email
* [Mozilla Monitor](https://monitor.mozilla.org/breaches) `[FREE]`: find information for each breach
* [DDoSecrets](https://data.ddosecrets.com/?C=M&O=A) `[FREE]`: download data breaches

📚 From infostealers, you can identify login portals, identifiant formats per portal, password policy, etc. Later, you can try brute force with a few passwords.
</div></div>

<hr class="sep-both">

## Tools and methods 🗺️

<div class="row row-cols-md-2 mt-3"><div>

* [OSINT gathering](/cybersecurity/red-team/s1.investigation/techniques/osint.md) 🧑‍💻🧑: any publicly available information
* [DNS analysis](/cybersecurity/red-team/s1.investigation/techniques/dns_analysis.md) 🧑‍💻🐟: DNS records, subdomains, IPs, emails...
* [Google dorking](/cybersecurity/red-team/s1.investigation/techniques/dorking.md) 🧑‍💻🐟🧑: find anything indexed by google
* [Shodan](/cybersecurity/red-team/s1.investigation/tools/shodan.md) 🐟: find exposed and potentially vulnerable IoT devices
* [Maltego](/cybersecurity/red-team/s1.investigation/tools/maltego.md) 🧑‍💻 🐟: find websites, domains, social media accounts...
* [Data leaks](/cybersecurity/red-team/s1.investigation/techniques/data_leaks.md) 🧑: find leaked data (passwords...)
</div><div>

Websites

* [Wayback machine](/cybersecurity/red-team/s1.investigation/tools/wayback.md) 🐟: see previous versions of the website

Internal Assessments

* [Passive Network Discovery](/cybersecurity/red-team/s1.investigation/techniques/passive_network_discovery.md) 🃏: map the internal network

Others

* [TheHarvester](/cybersecurity/red-team/s1.investigation/tools/theHarvester.md) <small>(Automated OSINT+DNS checking)</small>
</div></div>

<hr class="sep-both">

## 👻 To-do 👻

Stuff that I found, but never read/used yet.

<div class="row row-cols-lg-2"><div>

* cloud-based services and platforms investigation
* Wireless network reconnaissance
</div><div>
</div></div>