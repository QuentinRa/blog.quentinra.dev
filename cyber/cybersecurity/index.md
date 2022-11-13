# Getting started

[![beginnerpathintro](../_badges/thm/beginnerpathintro.svg)](https://tryhackme.com/room/beginnerpathintro)
[![startingoutincybersec](../_badges/thm/startingoutincybersec.svg)](https://tryhackme.com/room/startingoutincybersec)
[![defensivesecurity](../_badges/thmp/defensivesecurity.svg)](https://tryhackme.com/room/defensivesecurity)
[![careersincyber](../_badges/thmp/careersincyber.svg)](https://tryhackme.com/room/careersincyber)
[![pentestingfundamentals](../_badges/thm/pentestingfundamentals.svg)](https://tryhackme.com/room/pentestingfundamentals)
[![principlesofsecurity](../_badges/thm/principlesofsecurity.svg)](https://tryhackme.com/room/principlesofsecurity)

A lot of stuff to get started in cybersecurity, including websites to learn, practice, find news, look for news, along with CVE lookup, and websites to check if your credentials leaked, or stuff like that. 

> You may also check [Awesome-Hacking-Resources](https://github.com/vitalysim/Awesome-Hacking-Resources) (GitHub).<br>
> If you are tired, learn [some excuses to not do your job properly](https://cyberwtf.com/).

<hr class="sep-both">

## Cybersecurity jobs

A cyber expert can specialize in offense/defense

<table class="table table-bordered table-striped border-dark">
<thead>
<tr><th></th><th>Offense (Read Team)</th><th>Defense (Blue team)</th></tr>
</thead>
<tbody>

<tr><td>Work</td>
<td>

Look for vulnerabilities (bug, loopholes) in the tools/software of a company, try to exploit them, and suggest patches.
</td>
<td>

Prevent attacks <small>(firewall, IPS)</small>. Monitor, and analyse traffic... Detect, and stop attacks as fast as possible. Investigate/Do Forensics. Find attack paths/track down hackers.

Do awareness, documenting the network/devices, update and ensure that the company is protected against known vulnerabilities.
</td></tr>

<tr><td>Skills</td>
<td>

Knowledgeable in a lot of things

* **Web**: HTML/CSS/JS/Node/PHP
* **DataBases**: SQL/NoSQL/PLSQL
* **Networking**: Bash/PowerShell/Network
* **Cloud**
* ...

</td>
<td>

Knowledgeable about

* malware
* breaches
* Linux/Windows
* Networking
* ...
</td></tr>

<tr><td></td>
<td>

* **Rules of Engagement (ROE)**: agreement between a penetration tester and the system owner, defining the scope (servers), and the rules (techniques allowed). Everything outside the scope is illegal (ex: [SANS ROE template](https://sansorg.egnyte.com/dl/bF4I3yCcnt/)).
* You can have no knowledge about the target <small>(black box)</small>, a partial knowledge <small>(grey box)</small>, or a complete knowledge <small>(white box)</small>. According to your knowlege of the application, you will test different things.

</td>
<td>

* **SIEM**: A Security Information and Event Management system is combine information from various places in one interface <small>(login attempts...)</small>.
* **Security Operation Center** (SOC): a team of cybersecurity professionals working 24/7 <small>(detect unusual activity, vulnerabilities, intrusions, violations, training/awareness)</small>. They are using the firewall/dns/DHCP/... logs, Network security monitoring (NSM), and they might use a SIEM.
* **Threat Intelligence**: dig information about actual and potential enemies, and prepare in case they attack you.
* **Threat hunting**: if a machine is suspected to have been intruded, they start hunting to confirm they assumption.
* **Threat modelling**: review, and improve the security measures (STRIDE, PASTA)
* **Defence in Depth**: try to delay the attack with multiple varied layers of security, with the aim to stopping the hacker momentum
</td></tr>

<tr><td>Jobs</td>
<td>

* **Red Teamer**: play the hacker, provide feedback from an enemy perspective. They are testing the company response.
* **Penetration tester**: Try to find vulnerabilities in a system, a network, or an application. Perform security assessments, and audits. Recommend actions to prevent attacks.
* **Security Engineer**: implement, and maintain security controls, threats protection... to help prevent cyberattacks, and protect data.

</td>
<td>

* **Security Analyst**: Analyse, and remediate to issues. Develop security plans to keep the company safe.
* **Incident responder**: determine how a cyberattack is handled, see [Incident Handling Guide by the NIST](https://nvlpubs.nist.gov/nistpubs/SpecialPublications/NIST.SP.800-61r2.pdf), [OSSTMM](https://www.isecom.org/OSSTMM.3.pdf), [NIST Cybersecurity Framework 1.1](https://www.nist.gov/cyberframework), [NCSC CAF](https://www.ncsc.gov.uk/collection/caf/caf-principles-and-guidance), and [OWASP](https://owasp.org/).
* **Digital Forensics**: investigate attacks <small>(file system, memory, logs)</small>, and policies violations.
* **Malware Analyst**/**Reverse-engineer**: analyse malware, statically <small>(read the code)</small>, and dynamically <small>(see what it does)</small>.
* **Security researcher**: research Linux, hashing algorithms...
</td></tr>
</tbody></table>

> There are **White hats**: hackers that follow the rules, and try to benefit others<br>
> There are **Grey hats**: hackers that are usually not following the rules, but often benefit others <small>(take down malicious website)</small><br>
> And, obviously, there are [**Black hats**](https://www.blackhat.com/) (criminals/hackers).

<hr class="sep-both">

## Random vocabulary

<div class="row row-cols-md-2"><div>

* **Cyber/Data Breach**: a leak of data
* **Vulnerability**/**weakness**: a failure/flaw in a system
* **Exploits**: code that make use of a vulnerability to gain access to a machine, install a malware, steal data...
* **Social engineering**: hackers manipulate someone, to make them compromise the system, or do something that benefit them.
* **Incident**: something unexpect occurred, which could be an intrusion

<br>

A look at cyberattacks categories ([source](https://www.malwarebytes.com/))

* **ransomware** 🔒: lock your system, ask for a ransom.
* **adware** 📰: hide, and show ads in the browser, may monitor the user to show relevant ads.
* **spyware** 🕵️: hide, and monitor user, steal credentials...
* **phishing** 🎣: pose as someone trustworthy, in order to steal your information
* **spoofing** 🎣: usurp someone else identify, to get access, steal data...
* **trojans horse** 🎠: programs that pretend to do something, while actually doing something malicious
* **ddos** 💥: send false traffic in bulk to take down servers
* **cryptojacking** ⛏️: hide, and mine currencies on your computer
* **virus** 😎: attached to a program, replicate, and spread
</div><div>

* **0 Day**/Zero day: an unknown vulnerability that was just discovered
* **Advanced Persistent Threat** (APT): usually, a hacker want to remain as long as possible within an infected network. They are using backdoors, and keep updating the code to avoid being discovered.
* **RansomwareAsAService** (RAAS): hackers selling their skills to other hackers, in exchange for a part of their benefices. There is also "MalwareAsAService" (MAAS), which is the same with malware.

<br>

* The security triad **CIA**: Confidentiality <small>(only allowed users can read it)</small>, Integrity <small>(not tampered)</small>, Availability <small>(available when needed)</small>. The opposite is DAD <small>(Disclosure, Alternation, and Destruction)</small>.
* **Principle of the least privileges**: based on the role, and the data being shared.
  * Privileged Identity Management (PIM): from organisation role to system role
  * Privileged Access Management (PAM): manage the role that a privileged user has.
  * Models: Bell-LaPadula, Biba Model

<br>

* **Intrusion Detection System** (IDS): a system detecting intrusions.
* **Intrusion Prevention System** (IPS): a system blocking detected intrusions.
* **Endpoint Detection and Response** (EDS)
* **Deceptive security**
* **Virtual Private Network** (VPN): it ensures both integrity <small>(not tampered)</small>, and confidentiality <small>(can't read it)</small> of the network traffic.
* **Host firewall**: a program shipped with the Operating System to filter packets as firewall do
</div></div>

> **Random**: most CTF challenges use the infamous rockyou.txt wordlist of passwords <small>(from a data breach of rockyou.com in 2009)</small>, through they were most likely not user passwords.

<hr class="sep-both">

## Famous attacks

<table class="table table-bordered table-striped border-dark mt-4">
<thead><tr><th>Classification</th><th>Notes</th></tr></thead>

<tr><td>Estonia (2007)<br><b>DDOS</b></td><td>

First major attack against a country by a group of russian hackers. They used botnets from 87 countries targeting websites of Estonian banks/...
</td></tr>

<tr><td>Stuxnet (2010)<br><b>SCADA</b></td><td>

First attack targeting SCADA systems. An infected USB key was connected a computer on the internal network. One of the 3 virus of the "olympic games" along **DuQu**, and **Flame**. Supposedly made by the NSA, and Iran.
</td></tr>

<tr><td>WannaCry (2016)<br><b>Ransomware</b></td><td>

Use a breach in Windows, created by the NSA, and stolen by hackers in 2013. The NSA notified Microsoft when this virus was released to make them patch it. Used in 2017 by North Korean on 200 000 computers. Auto-replicating virus, asking for a ransom. The original code was added a kill-switch by the NSA, allowing anyone knowing it to kill the virus.
</td></tr>
</table>

<hr class="sep-both">

## Learning, & Practicing

You can use [cybersecurityeducation.org](https://www.cybersecurityeducation.org/) to find degrees, certifications...

<div class="row row-cols-md-2"><div>

**Learning**

* [TryHackMe](https://tryhackme.com/) (THM): a lot of free courses, and a guide enjoyable/gratifying place to start learning, although you will have to go to other sites later
* [academy.hackthebox.com](https://academy.hackthebox.com/catalogue): you pay to enroll in courses, you have some starter "money", and you get back all <small>(tier-0, newcomers)</small>, or a part of your credits, once you finished the course.
* [hackerone.com](https://www.hackerone.com/hackers)
* [PortSwigger](https://portswigger.net/web-security)
* [rapid7](https://www.rapid7.com/fundamentals/)

**Professional training**

* [hackerrank](https://www.hackerrank.com/)
* [sans.org: cyberaces](https://www.sans.org/cyberaces/)
* [Red Team Nation](https://redteamnation.com/)
* [appsec-labs.com](https://appsec-labs.com/online-training/)

**Other platforms found in the wild**

* [cybr.com](https://cybr.com/)
* [academy.tcm-sec.com](https://academy.tcm-sec.com/)
</div><div>

**Practicing**

* [HackTheBox](https://hackthebox.com/) (HTB)
* [root me](https://www.root-me.org/)
* [TryHackMe](https://tryhackme.com/) (THM)
* [OverTheWire](https://overthewire.org/wargames/)
* [Damn Vulnerable Web Application](https://dvwa.co.uk/)
* [OWASP Juice Shop](https://github.com/juice-shop/juice-shop)
* [vulnhub](https://www.vulnhub.com/)

**Bug bounty programs** [bug bounty programs list](https://www.bugcrowd.com/bug-bounty-list/)

Some companies are giving bounties to ethical hackers that detected exploits in their infrastructures.

* [bounty.github.com](https://bounty.github.com/) (GitHub)
* [huntr.dev](https://huntr.dev/) (open-source repositories)
* [BugBountyHunter.com](https://www.bugbountyhunter.com/)

</div></div>

<hr class="sep-both">

## News

<div class="row row-cols-md-2"><div><br>

* [hackerone.com](https://www.hackerone.com/resources)
* [cybernews.com](https://cybernews.com/news/)
</div><div>

**Did you credentials leak?**

* [have i been pwned?](https://haveibeenpwned.com/)
* [vigilante.pw](https://vigilante.pw/) <small>(reported down as of 08-2021 - "up" in 10-2022, but the new version may not be legit)</small>
* [vigilante GitHub](https://github.com/wedataintelligence/Vigilante.pw/blob/master/data.csv)
* [cybernews check](https://cybernews.com/personal-data-leak-check/)

There are also premium solutions such as [leakcheck](https://leakcheck.io/), or [dehashed](https://dehashed.com/).

</div></div>

<hr class="sep-both">

## Blogs

<div class="row row-cols-md-2 mt-3"><div>

* [CrackItDown](https://web.archive.org/web/20210923121550/https://www.crackitdown.com/) (website dead, still available via the wayback machine)
* [hacktricks.xyz](https://book.hacktricks.xyz/welcome/readme)
* [guru99.com](https://www.guru99.com/ethical-hacking-tutorials.html)
* [PayloadsAllTheThingsWeb](https://swisskyrepo.github.io/PayloadsAllTheThingsWeb/)
* [amandinegh](https://amandinegh.gitbook.io/cyberadventure/)

<br>

* [mikadmin.fr](https://mikadmin.fr/blog/)
* [dhilipsanjay CTFs](https://dhilipsanjay.gitbook.io/ctfs/)
* [TheDutchHacker](https://www.thedutchhacker.com/)
* [0xrick](https://0xrick.github.io/categories/)
* [cyber-security-base-19](https://github.com/rage/cyber-security-base-19)
</div><div>

* [auth0.com](https://auth0.com/blog/)
* [MayADevBe](https://mayadevbe.me/)
* [ryanplatten](https://ryanplatten.com/various-journal-entries/)
* [kalilinuxtutorials](https://kalilinuxtutorials.com/)
* [mrash.co](https://mrash.co/)
* [sckull.github.io/](https://sckull.github.io/)
* [ctf.ac](https://ctf.ac/)
* [narancsblog.com](https://narancsblog.com/category/thm/)
</div></div>