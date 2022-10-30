# Getting started

[![beginnerpathintro](../_badges/beginnerpathintro.svg)](https://tryhackme.com/room/beginnerpathintro)
[![startingoutincybersec](../_badges/startingoutincybersec.svg)](https://tryhackme.com/room/startingoutincybersec)
[![defensivesecurity](../_badges/defensivesecurity.svg)](https://tryhackme.com/room/defensivesecurity)
[![careersincyber](../_badges/careersincyber.svg)](https://tryhackme.com/room/careersincyber)

A lot of stuff to get started in cybersecurity, including websites to learn, practice, find news, look for news, along with CVE lookup, and websites to check if your credentials leaked, or stuff like that. 

> You may also check [Awesome-Hacking-Resources](https://github.com/vitalysim/Awesome-Hacking-Resources) (GitHub).<br>
> If you are tired, learn [some excuses to not do your job properly](https://cyberwtf.com/).

<hr class="sl">

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

</td>
<td>

* **Security Operation Center** (SOC): a team of cybersecurity professionals <small>(detect unusual activity, weakness, intrusions, violations)</small>
* **Threat Intelligence**: dig information about actual and potential enemies, and prepare in case they attack you.
* A Security Information and Event Management (**SIEM**) system is combine information from various places in one interface <small>(login attempts...)</small>.
</td></tr>

<tr><td>Jobs</td>
<td>

* **Red Teamer**: play the hacker, provide feedback from an enemy perspective. They are testing the company response.
* **Penetration tester**: Try to find vulnerabilities in a system, a network, or an application. Perform security assessments, and audits. Recommend actions to prevent attacks.
* **Security Engineer**: implement, and maintain security controls, threats protection... to help prevent cyberattacks, and protect data.

</td>
<td>

* **Security Analyst**: Analyse, and remediate to issues. Develop security plans to keep the company safe.
* **Incident responder**: determine how a cyberattack is handled, see [Incident Handling Guide by the NIST](https://nvlpubs.nist.gov/nistpubs/SpecialPublications/NIST.SP.800-61r2.pdf).
* **Digital Forensics**: investigate attacks <small>(file system, memory, logs)</small>, and policies violations.
* **Malware Analyst**/**Reverse-engineer**: analyse malware, statically <small>(read the code)</small>, and dynamically <small>(see what it does)</small>.
* **Security researcher**: Linux, Hashing...
</td></tr>
</tbody></table>

> And, obviously, there are [**Black hats**](https://www.blackhat.com/) (hackers).

<hr class="sr">

## Random vocabulary

<div class="row row-cols-md-2"><div>

* **Cyber/Data Breach**: a leak of data
* **Vulnerability**/**weakness**: a failure/flaw in a system
* **Exploits**: code that make use of a vulnerability to gain access to a machine, install a malware, steal data...
* **Social engineering**: hackers manipulate someone, to make them compromise the system, or do something that benefit them.

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

* **Intrusion Detection System** (IDS): a system detecting intrusions...
* **Endpoint Detection and Response** (EDS)
* **Deceptive security**
</div></div>


<hr class="sl">

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

<hr class="sr">

## Learning, & Practicing

<div class="row row-cols-md-2"><div>

**Learning**

* [TryHackMe](https://tryhackme.com/) (THM): a lot of free courses, and a guide enjoyable/gratifying place to start learning, although you will have to go to other sites later
* [academy.hackthebox.com](https://academy.hackthebox.com/catalogue): only tier-0 courses are free, so there is no much to do without paying
* [cybersecurityeducation.org](https://www.cybersecurityeducation.org/) (not tested)
* [hackerone.com](https://www.hackerone.com/hackers) (not tested)
* [PortSwigger](https://portswigger.net/web-security) (not tested)

**Professional training**

* [hackerrank](https://www.hackerrank.com/) (not tested)
</div><div>

**Practicing**

* [HackTheBox](https://hackthebox.com/) (HTB)
* [root me](https://www.root-me.org/)
* [TryHackMe](https://tryhackme.com/) (THM)
* [OverTheWire](https://overthewire.org/wargames/)
* [Damn Vulnerable Web Application](https://dvwa.co.uk/)

**Bug bounty programs** [bug bounty programs list](https://www.bugcrowd.com/bug-bounty-list/)

Some companies are giving bounties to ethical hackers that detected exploits in their infrastructures.

* [bounty.github.com](https://bounty.github.com/) (GitHub)
* [huntr.dev](https://huntr.dev/) (open-source repositories)

</div></div>

<hr class="sl">

## News

<div class="row row-cols-md-2"><div>

**In English**

* [hackerone.com](https://www.hackerone.com/resources)
* [cybernews.com](https://cybernews.com/news/)
</div><div>

**Did you credentials leak?**

* [have i been pwned?](https://haveibeenpwned.com/)
* [vigilante.pw](https://vigilante.pw/) <small>(reported down as of 08-2021 - "up" in 10-2022, but the new version may not be legit)</small>
* [vigilante GitHub](https://github.com/wedataintelligence/Vigilante.pw/blob/master/data.csv)
* [cybernews check](https://cybernews.com/personal-data-leak-check/)

</div></div>

<hr class="sr">

## Exploits / CVE lookup

CVEs take the form: CVE-YEAR-ID.

<div class="row row-cols-md-2"><div>

* [exploit-db.com](https://www.exploit-db.com/), and the command [searchsploit](https://github.com/offensive-security/exploitdb) (7.5k ⭐). Useful to find exploits, and test them.

* [nvd.nist.gov](https://nvd.nist.gov/vuln/search/results?form_type=Basic&results_type=overview&search_type=all): a reference 📌

* [attackerkb.com](https://attackerkb.com/): community reviews on CVEs. There is a tool similar to searchsploit [akb-explorer](https://github.com/horshark/akb-explorer) (33⭐).

* [vulners](https://vulners.com/) (ex: [CVE-2016-1531](https://vulners.com/cve/CVE-2016-1531))) is a big search engines for vulnerabilities.

</div><div>

* [CVE details](https://www.cvedetails.com/): interface easy to use

* [cve.circl.lu](https://cve.circl.lu/): quite readable, as they get to the point, with a readable interface

* [cve.mitre.org](https://cve.mitre.org/cve/), and their new website: [cve.org](https://www.cve.org/). This is basically of big list of CVE, regardless of them being exploitable, or not.

* [security.snyk.io](https://security.snyk.io/): the interface is nicer,  through it's not as generic / covering as much CVEs as others.
</div></div>

<hr class="sl">

## Blogs

<div class="row row-cols-md-2 mt-3"><div>

* [CrackItDown](https://web.archive.org/web/20210923121550/https://www.crackitdown.com/) (website dead, still available via the wayback machine)
* [hacktricks.xyz](https://book.hacktricks.xyz/welcome/readme)
</div><div>

Small blogs

* [mikadmin.fr](https://mikadmin.fr/blog/)
* [dhilipsanjay CTFs](https://dhilipsanjay.gitbook.io/ctfs/)
* [TheDutchHacker](https://www.thedutchhacker.com/)
* [0xrick](https://0xrick.github.io/categories/)
* [cyber-security-base-19](https://github.com/rage/cyber-security-base-19) <small>(down - the didn't paid the hosting provider :3)</small>
* [MayADevBe](https://mayadevbe.me/)
* [ryanplatten](https://ryanplatten.com/various-journal-entries/)
* [kalilinuxtutorials](https://kalilinuxtutorials.com/)
</div></div>