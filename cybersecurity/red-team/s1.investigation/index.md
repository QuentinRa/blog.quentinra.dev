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

[![contentdiscovery](../../_badges/thm/contentdiscovery.svg)](https://tryhackme.com/room/contentdiscovery)
[![breachingad](../../_badges/thm/breachingad.svg)](https://tryhackme.com/r/room/breachingad)
[![adventofcyber2](../../_badges/thm/adventofcyber2/day14.svg)](https://tryhackme.com/room/adventofcyber2)
[![adventofcyber4](../../_badges/thm/adventofcyber4/day3.svg)](https://tryhackme.com/room/adventofcyber4)

<div class="row row-cols-lg-2"><div>

Open-source intelligence "OSINT" encompasses any information that we gather from public sources. Refer to the [osintframework.com](https://osintframework.com/).

#### Social Networks — LinkedIn OSINT 🧑🐟

You can easily find company employees using LinkedIn.

* ☑️ Are they still claiming to be in the company?
* ✍️ Note down their first name, last Name
* ☎️ Is there an email/phone number in their description?
* 🌍 Did they link a personal blog in their description?
* 🎯 Did they set up some contact emails?

The main problem is that many profiles may not be visible from our account. You can use solutions to access LinkedIn API. For marketing purposes, they are also returning professional and personal emails <small>(if any is known or had leaked)</small>. Refer to [LinkedIn OSINT Tools](/cybersecurity/red-team/s1.investigation/tools/osint/linkedin.md).

#### Email Investigation — Find Accounts 🧑🐟

There are multiple solutions to investigate an email address:

* [epieos](https://epieos.com/) `[FREEMIUM]`: Find accounts details
* [spokeo](https://www.spokeo.com/) `[FREEMIUM]`: Find accounts on common websites
* [holehe](https://github.com/megadose/holehe) `[FREE]` <small>(7.6k ⭐)</small>: Find accounts on common websites
* [GHunt](https://github.com/mxrch/GHunt) `[FREE]` <small>(15.7k ⭐)</small>: gmail, groups, drives...
* [Twint](https://github.com/twintproject/twint) `[FREE]` <small>(15.8k ⭐, 2021 🪦)</small>: Twitter scrapping tool
* [ProtOSINT](https://github.com/pixelbubble/ProtOSINT) `[FREEMIUM]` <small>(0.3k ⭐, 2021 🪦)</small>: Obsolete
* [Osintgram](https://github.com/Datalux/Osintgram) <small>(8.4k⭐)</small> and [Instaloader](https://github.com/instaloader/instaloader) <small>(8.7k ⭐)</small>: Instagram

There are multiple solutions to identify email addresses given a company domain <small>(e.g. example.com)</small>. But, such solutions are not always trustworthy. For instance, they may return delete emails or AI-generated emails when the mail server was hardened.

* [hunter](https://hunter.io/) `[FREEMIUM]`: Company emails
* [SkyMEM](https://www.skymem.info/) `[FREEMIUM]`: Email lists
* [EmailSearch](https://emailsearch.io/pricing) `[PAID]`: 👻
* [Snov](https://snov.io/) `[FREEMIUM]`: 👻
* [FindEmails](https://www.findemails.com) `[PAID]`: 👻
* [OSINT Industries](https://app.osint.industries/) `[PAID]`: 👻
* [EmailRep](https://emailrep.io) `[FREEMIUM]`: 👻

📚 Leaks tools supporting domain search can also be used.

#### Username Investigation — Find Accounts 🧑🐟

Assuming you have identified a username that may have been reused across multiple platforms by the target, you can find which one using:

* [Sherlock](https://github.com/sherlock-project/sherlock) <small>(59.8k ⭐)</small> `[FREE]`
* [Maigret](https://github.com/soxoj/maigret) <small>(10.2k ⭐)</small> `[FREE]`
* [NameCheckup](https://namecheckup.com/) `[FREE]`
* [WhatsMyName](https://github.com/WebBreacher/WhatsMyName) <small>(1.7k ⭐)</small> `[PAID]`
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
* [SocRadar](https://socradar.io/) <small>(Very limited as a free user, require credits+platform access)</small>
* [Kela Cyber](https://www.kelacyber.com/) <small>(Only keep accessible the last 2 years, quite good)</small>
* [DarkOwl](https://www.darkowl.com/) <small>(Too many unparsed breaches, no plus value)</small>

Additional services:

* [Have I Been Pwned](https://haveibeenpwned.com/) `[FREEMIUM]`: lists breaches given an email
* [LeakCheck](https://wiki.leakcheck.io/en/api/public) `[FREE]` `[API]`: lists breaches given an email
* [CyberNews](https://cybernews.com/personal-data-leak-check/) `[FREE]`: lists breaches given an email
* [Mozilla Monitor](https://monitor.mozilla.org/breaches) `[FREE]`: finds information on a breach
* [DDoSecrets](https://data.ddosecrets.com/?C=M&O=A) `[FREE]`: download data breaches

📚 From infostealers logs, you can identify login portals, username formats per login portal, password policy, etc. Later, you can try brute force a login portal with a few possible passwords.
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