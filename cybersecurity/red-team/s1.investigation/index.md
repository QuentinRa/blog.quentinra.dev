# First step — Investigation

[![passiverecon](../../_badges/thm/passiverecon.svg)](https://tryhackme.com/room/passiverecon)

<div class="row row-cols-lg-2"><div>

Investigation 🔎, a.k.a. passive recon (reconnaissance) is the first step of the pentester activities during an external penetration testing.

It involves gathering information about the target from afar 👓️, meaning with **no direct interaction with the target(s)** 👀.

🌱 The goal is to find as much information as possible.

🚿️ You can also infer data, for instance, if a company has many customers, then they may have a support page/customer service.

📚 This could also mean passively observing the network activity if we are already within the company network.
</div><div>

Common activities:

* 🧑‍💻 Learn more about the company <small>(roles, services...)</small>, the technologies, programming languages and software they use...

* 🐟 Find a potential attack vector <small>(website, provider, etc.)</small>

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
* [social-analyzer](https://github.com/qeeqbox/social-analyzer) `[FREE]` <small>(11.6k ⭐)</small>: same as holehe
* [GHunt](https://github.com/mxrch/GHunt) `[FREE]` <small>(15.7k ⭐)</small>: gmail, groups, drives...
* [Twint](https://github.com/twintproject/twint) `[FREE]` <small>(15.8k ⭐, 2021 🪦)</small>: Twitter scrapping tool
* [ProtOSINT](https://github.com/pixelbubble/ProtOSINT) `[FREEMIUM]` <small>(0.3k ⭐, 2021 🪦)</small>: Obsolete
* [Osintgram](https://github.com/Datalux/Osintgram) <small>(8.4k⭐)</small> and [Instaloader](https://github.com/instaloader/instaloader) <small>(8.7k ⭐)</small>: Instagram

There are multiple solutions to identify email addresses given a company domain <small>(e.g. example.com)</small>. But, such solutions are not always trustworthy. For instance, they may return delete emails or AI-generated emails when the mail server was hardened.

* [hunter](https://hunter.io/) `[FREEMIUM]`: Company emails
* [Tomba](https://tomba.io/domain-search) `[FREEMIUM]`: Company emails
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

#### GitHub Investigation — Find Targets 🧑🐟

Assuming you have identified a GitHub/GitLab organization or a username associated with the company, you can use:

* **GitHub**: [Gitrob 🪦](https://github.com/michenriksen/gitrob) <small>(5.9k ⭐, dev names, languages, projects...)</small>
* **Git**: [shhgit 🪦](https://github.com/eth0izzle/shhgit) <small>(3.8k ⭐, find secrets)</small>
* **Github**: [GitFive](https://github.com/mxrch/GitFive) <small>(0.8k ⭐, search by email/username)</small>

#### Phone Investigation — Find Accounts 🧑🐟

Assuming you have identified a phone number, you can use:

* [PhoneInfoga](https://github.com/sundowndev/phoneinfoga) <small>(13.0k ⭐)</small> `[FREE]`
</div><div>

#### Deep/Dark Web — Data Leaks 🧑🐟

Data Leaks includes credentials <small>(username, password, hash)</small>, IPs, addresses, and domains. They are the result of a breach or an user being compromised by an [infostealer](https://en.wikipedia.org/wiki/Infostealer). Given a domain <small>(ex: example.com)</small> or an email <small>(ex: toto@example.com)</small>, we can find data leaks using:

| Name                                             | Pricing | API | Uncensored |
|--------------------------------------------------|--------|-----|------------|
| [Aura](https://scan.aura.com/) 👑👑              | `[FREE]` | ❌   | ❌          |
| [BreachDirectory](https://breachdirectory.org/)  | `[FREEMIUM]` | ✅   | ❌          |
| [DeHashed](https://dehashed.com/) 👑             |`[PAID]`|✅| ✅          |
| [Enzoic](https://www.enzoic.com/)                 |`[PAID]`|✅| ✅          |
| [HackCheck](https://app.hackcheck.io) 👑👑👑     |`[PAID]`|✅| ✅         |
| [LeakBase](https://leakbase.io)                  |`[PAID]`|❌| 👻         |
| [LeakCheck](https://leakcheck.io/) 👑👑👑        |`[PAID]`|✅| ✅          |
| [LeakedDomains](https://leaked.domains)          |`[PAID]`|✅| 👻         |
| [LeakLookup](https://leak-lookup.com/)           |`[PAID]`|✅| 👻         |
| [LeakPeek](https://leakpeek.com/)                |`[PAID]`|❌| ✅          |
| [ProxyNova](https://www.proxynova.com/tools/comb) |`[FREE]`|❌| ✅          |
| [Snusbase](https://www.snusbase.com) 👑          |`[PAID]`|✅ | ✅          |
| [WeLeakInfo](https://weleakinfo.io/)             |`[PAID]`|✅ | 👻         |

We can find infostealers and their collected data using:

| Name                                                | Pricing      | API | Uncensored |
|-----------------------------------------------------|--------------|-----|------------|
| [HackedList](https://hackedlist.io/)                | `[PAID]`     |✅| ???        |
| [HudsonRock](https://cavalier.hudsonrock.com/docs) 👑 | `[FREE]`     | ✅   | ❌          |
| [HudsonRock](https://cavalier.hudsonrock.com/docs) 👑👑 | `[PAID]`     | ✅   | ✅          |
| [WhiteIntel](https://whiteintel.io/)                | `[FREEMIUM]` | ✅   | ❌          |

There are costly but powerful platforms to monitor telegram and the dark/deep web:

* [Intelligence X](https://intelx.io/) <small>(👻)</small>
* [SearchLight Cyber](https://slcyber.io/) <small>(👻)</small>
* [DarkAtlas](https://darkatlas.io) <small>(👻)</small>
* [SocRadar](https://socradar.io/) <small>(Very limited as a free user)</small>
* [Kela Cyber](https://www.kelacyber.com/) <small>(Only the last 2 years of data, quite good, relatively costly)</small>
* [DarkOwl](https://www.darkowl.com/) <small>(Too many unparsed breaches, limited capabilities but cheaper)</small>

Additional services:

* [Have I Been Pwned](https://haveibeenpwned.com/) `[FREE]` `[API]`: lists breaches with a description
* [Have I Been Pwned](https://haveibeenpwned.com/) `[FREEMIUM]`: lists breaches given an email
* [LeakCheck](https://wiki.leakcheck.io/en/api/public) `[FREE]` `[API]`: lists breaches given an email
* [CyberNews](https://cybernews.com/personal-data-leak-check/) `[FREE]`: lists breaches given an email
* [Mozilla Monitor](https://monitor.mozilla.org/breaches) `[FREE]`: finds information on a breach (limited)
* [DDoSecrets](https://data.ddosecrets.com/?C=M&O=A) `[FREE]`: download data breaches

📚 From infostealers logs, you can identify login portals, username formats per login portal, password policy, etc. Later, you can try brute force a login portal with a few possible passwords.
</div></div>

<hr class="sep-both">

## Discovering Information

<div class="row row-cols-lg-2"><div>

By examining [DNS](/operating-systems/networking/protocols/dns.md) records and certificates issued for a domain, we can passively learn about:

* 🗺️ Public domains and subdomains used by the company
* 📮 Mail Server configuration through MX records
* ✍️ Externally connected apps through TXT records
* 🧑 Targets for social engineering attacks
* 🛣️ Servers and IP ranges
* ...

#### Discovering Hosts — IP Ranges

[![active_directory_enumeration_attacks](../../_badges/htb/active_directory_enumeration_attacks.svg)](https://academy.hackthebox.com/course/preview/active-directory-enumeration--attacks)

IP ranges are given by the client during a pentest, but there are some platforms which can be used to access this public information.

* [arin](https://www.arin.net/resources/) (US) and [ripe](https://www.ripe.net/) (EU)
* [BGP Toolkit](https://bgp.he.net/), [BGP View](https://bgpview.io/)+[API](https://api.bgpview.io/)
* [netcraft](https://sitereport.netcraft.com/)
* [VirusTotal](https://www.virustotal.com/gui/domain/example.com/details)

From an IP, you can get the ASN using [ipwhois](https://ipwhois.io/).

#### Discovering Information — DNS Records + Registrar

[![footprinting](../../_badges/htb/footprinting.svg)](https://academy.hackthebox.com/course/preview/footprinting)
[![web_information_gathering](../../_badges/htb/web_information_gathering.svg)](https://academy.hackthebox.com/course/preview/information-gathering---web-edition)
[![passiverecon](../../_badges/thm/passiverecon.svg)](https://tryhackme.com/room/passiverecon)

You can find social engineering information on non-european websites by investigating the registrar information.

* [whois](/operating-systems/networking/protocols/dns.md#whois-domain-registrar-data)
* [viewdns](https://viewdns.info/)
* [netcraft](https://sitereport.netcraft.com/)
* [VirusTotal](https://www.virustotal.com/gui/domain/example.com/details)
* [domain.glass](https://domain.glass/)

The target may expose things in their DNS records. Aside from during CTFs, we only learn about external solutions from TXT records.

* [nslookup](/operating-systems/networking/protocols/dns.md#nslookup-ipdomain-lookup)/[dig](/operating-systems/networking/protocols/dns.md#dig-ipdomain-lookup)
* [domain.glass](https://domain.glass/)
* [viewdns](https://viewdns.info/)
* [VirusTotal](https://www.virustotal.com/gui/domain/example.com/details)
</div><div>

#### Discovering Information — Technologies

We may want to determine what hosts are known, what is running on each host, and what URLs are known. We can use:

* [InternetDB](/cybersecurity/red-team/s1.investigation/tools/shodan.md) `[FREE]`: Open Ports, Technologies
* [Shodan](/cybersecurity/red-team/s1.investigation/tools/shodan.md) `[FREEMIUM]`: Open Ports, Technologies
* [Wayback machine](/cybersecurity/red-team/s1.investigation/tools/wayback.md) `[FREE]`: see previous versions of the website
* [Google dorking](/cybersecurity/red-team/s1.investigation/techniques/dorking.md) `[FREE]`: find anything indexed by google

#### Discovering Subdomains — Certificate Transparency (CT)

[![footprinting](../../_badges/htb/footprinting.svg)](https://academy.hackthebox.com/course/preview/footprinting)
[![web_information_gathering](../../_badges/htb/web_information_gathering.svg)](https://academy.hackthebox.com/course/preview/information-gathering---web-edition)
[![passiverecon](../../_badges/thm/passiverecon.svg)](https://tryhackme.com/room/passiverecon)
[![subdomainenumeration](../../_badges/thmp/subdomainenumeration.svg)](https://tryhackme.com/room/subdomainenumeration)

Most companies are using an SSL/TLS certificate per domain. Since certificates are public, we can inspect them to find subdomains.

* [crt.sh](https://crt.sh/) `[FREE]`: the most used platform
* [ctfr](https://github.com/UnaPibaGeek/ctfr) <small>(1.9k ⭐, 2020 🪦)</small> `[FREE]`: tool to access crt.sh
* [ct search](https://ui.ctsearch.entrust.com/ui/ctsearchui)  `[FREE]`: include expired certificates
* [censys](https://search.censys.io/) `[???]`: 👻
* [netcraft](https://sitereport.netcraft.com/) `[???]`: 👻

Most of these have a **clear limitation**: some companies are using wildcard certificates e.g. `*.example.com` which hides their subdomains.

#### Discovering Subdomains — Known Subdomains

[![footprinting](../../_badges/htb/footprinting.svg)](https://academy.hackthebox.com/course/preview/footprinting)
[![web_information_gathering](../../_badges/htb/web_information_gathering.svg)](https://academy.hackthebox.com/course/preview/information-gathering---web-edition)
[![passiverecon](../../_badges/thm/passiverecon.svg)](https://tryhackme.com/room/passiverecon)

Some websites are keeping track of every DNS they found while monitoring and investigating the web.

* [VirusTotal](https://www.virustotal.com/gui/domain/example.com/relations) `[FREEMIUM]`: the best reference
* [RapidDNS](https://rapiddns.io) `[FREE]`: not useful
* [SubdomainsFinder](https://subdomainfinder.c99.nl/) `[FREE]`: not useful
* [DNS Dumpster](https://dnsdumpster.com/) `[FREE]`: not useful
* [Sublist3r](/cybersecurity/red-team/tools/enumeration/dns/sublist3r.md) `[FREE]`: unmaintained
* [Subfinder](/cybersecurity/red-team/tools/enumeration/dns/subfinder.md) `[FREE]`: free with some FREEMIUM/PAID APIs


📚 Use them for each wildcard certificate returned using CT.

#### Discovering Information — Multipurpose tools

A few tools you may use:

* [TheHarvester](/cybersecurity/red-team/s1.investigation/tools/theHarvester.md) `[FREE]`: ???
* [Maltego](/cybersecurity/red-team/s1.investigation/tools/maltego.md) `[FREEMIUM]`: DNS Records, Subdomains
* [knock](https://github.com/guelfoweb/knock/) `[FREE]`: Subdomains + Shodan Data
* [Uncover](https://github.com/projectdiscovery/uncover) `[FREEMIUM]`: ???
</div></div>

<hr class="sep-both">

## OneAudit Investigation

*From a domain to a complete report about the company external surface using passive recon tools.*

<div class="row row-cols-lg-2"><div>

We developed [oneaudit](https://github.com/quentinra/oneaudit) <small>(0.01k ⭐)</small> to ease and automate the process of external passive recon. It is built over many existing tools.

#### 1. OneAudit Subdomains Investigation

Given a domain such as `example.com`, we can list its subdomains using: `oneaudit automate -d example.com -o .output -vv`.

![OneAudit Subdomains](_images/oneaudit_subdomains.png)

<br>

#### 2. OneAudit Hosts Investigation

We want to investigate each IP owned by the target company. Companies can have public hosts not associated with a domain, or not with a domain that we identified. If you identified any interesting IP ranges, add them to the scan. The command is: `oneaudit automate -d example.com -o .output -vv -s '<found>,A.B.C.D/24'`.

![OneAudit Subdomains](_images/oneaudit_hosts.png)

📚 Some company registered have their own IP Ranges. Make sure to check every ASN you found before running the command with `-s`.
</div><div>

#### 3. OneAudit Employees Investigation

So far, we focused on machines. We now want to investigate every employee that is currently working in the target company. You can do that using: `oneaudit automate [...] --format first.last`. 

Run the command with `-vv` to confirm if your format seems likely <small>("verified" means "the mail existed", stats are shown at the end of the logs)</small>.

![OneAudit Employees](_images/oneaudit_employees.png)

⚠️ If you still cannot guess the format, skip this step for now.

📚 Look for contact forms or Whois/ASN records for emails.

<br>

#### 4. OneAudit Leaks Investigation

Finally, we want to find leaked passwords as they may still be used. We may uncover additional emails from old leaks. You can fetch the leaks <small>(with or without a target list)</small> with: `oneaudit [...] --qleaks`.

![OneAudit Employees](_images/oneaudit_leaks.png)

Breach dates are often invalid due to them sometimes surfacing years later to the marketplace, either individually or in a "new" compilation.
</div></div>

<hr class="sep-both">

## 👻 To-do 👻

Stuff that I found, but never read/used yet.

<div class="row row-cols-lg-2"><div>

* cloud-based services and platforms investigation
* Wireless network reconnaissance
* [Passive Network Discovery](/cybersecurity/red-team/s1.investigation/techniques/passive_network_discovery.md): map the internal network
</div><div>
</div></div>