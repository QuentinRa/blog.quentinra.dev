# Getting started

[![beginnerpathintro](../_badges/thm/beginnerpathintro.svg)](https://tryhackme.com/room/beginnerpathintro)
[![startingoutincybersec](../_badges/thm/startingoutincybersec.svg)](https://tryhackme.com/room/startingoutincybersec)
[![defensivesecurity](../_badges/thmp/defensivesecurity.svg)](https://tryhackme.com/room/defensivesecurity)
[![careersincyber](../_badges/thmp/careersincyber.svg)](https://tryhackme.com/room/careersincyber)
[![pentestingfundamentals](../_badges/thm/pentestingfundamentals.svg)](https://tryhackme.com/room/pentestingfundamentals)
[![principlesofsecurity](../_badges/thm/principlesofsecurity.svg)](https://tryhackme.com/room/principlesofsecurity)

A lot of stuff to get started in cybersecurity, including websites to learn, practice, find news, look for news, CVE lookup, and websites to check if your credentials leaked, or stuff like that. 

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

Look for vulnerabilities (bugs, loopholes) in the tools/software of a company, try to exploit them, and suggest patches.
</td>
<td>

Prevent attacks <small>(firewall, IPS)</small>. Monitor, and analyze traffic... Detect, and stop attacks as fast as possible. Investigate/Do Forensics. Find attack paths/track down hackers.

Do awareness, document the network/devices, update, and ensure that the company is protected against known vulnerabilities.
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

* **Rules of Engagement (ROE)**: an agreement between a penetration tester and the system owner, defining the scope <small>(servers)</small>, and the rules <small>(techniques allowed)</small>. Everything outside the scope is illegal (ex: [SANS ROE template](https://sansorg.egnyte.com/dl/bF4I3yCcnt/)).

* You can have no knowledge about the target <small>(black box)</small>, a partial knowledge <small>(grey box)</small>, or a complete knowledge <small>(white box)</small>. According to your knowledge of the application, you will test different things.

</td>
<td>

* **SIEM**: A Security Information and Event Management system is centralizing information from various places in one interface <small>(login attempts...)</small>.
* **Security Operation Center** (SOC): a team of cybersecurity professionals working 24/7 <small>(detect unusual activity, vulnerabilities, intrusions, violations, training/awareness)</small>. They are using the firewall/DNS/DHCP/... logs, Network security monitoring (NSM), and they might use a SIEM.
* **Threat Intelligence**: dig information about actual and potential enemies, and prepare in case they attack you.
* **Threat hunting**: if a machine is suspected to have been intruded, they start hunting to confirm their assumption.
* **Threat modeling**: review, and improve the security measures (STRIDE, PASTA)
* **Defence in Depth**: use of multiple layers of security, along with various tactics, to slow down any intruder
</td></tr>

<tr><td>Jobs</td>
<td>

* **Red Teamer**: play the hacker, and provide feedback from an enemy perspective. They are testing the company response.
* **Penetration tester**: Try to find vulnerabilities in a system, a network, or an application. Perform security assessments, and audits. Recommend actions to prevent attacks.
* **Security Engineer**: implement, and maintain security controls, handle threats protection... to help prevent cyberattacks, and protect data.

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
> There are **Grey hats**: hackers that are usually not following the rules, but often benefit others <small>(take down malicious websites)</small><br>
> And, obviously, there are [**Black hats**](https://www.blackhat.com/) (criminals/hackers).

<hr class="sep-both">

## Random vocabulary

<div class="row row-cols-md-2"><div>

* **Cyber/Data Breach**: a leak of data
* **Vulnerability**/**weakness**: a failure/flaw in a system
* **Exploits**: code that makes use of a vulnerability to gain access to a machine, install malware, steal data...
* **Social engineering**: hackers manipulate someone, to make them compromise the system, or do something that benefits them.
* **Incident**: something unexpected occurred, which could be an intrusion

<br>

A look at cyberattacks categories ([source](https://www.malwarebytes.com/))

* **ransomware** 🔒: lock your system, and ask for a ransom.
* **adware** 📰: hide, and show ads in the browser, may monitor the user to show relevant ads.
* **spyware** 🕵️: hide, monitor users, steal credentials...
* **phishing** 🎣: pose as someone trustworthy, in order to steal your information
* **spoofing** 🎣: usurp someone else identity, to get access, steal data...
* **trojans horse** 🎠: programs that pretend to do something, while actually doing something malicious
* **DDoS** 💥: send false traffic in bulk to take down servers
* **cryptojacking** ⛏️: hide, and mine currencies on your computer
* **virus** 😎: attached to a program, replicate, and spread
</div><div>

* **0 Day**/Zero day: an unknown vulnerability that was just discovered
* **Advanced Persistent Threat** (APT): usually, a hacker wants to remain as long as possible within an infected network. They are using backdoors, and keep updating the code to avoid being discovered.
* **RansomwareAsAService** (RAAS): hackers selling their skills to other hackers, in exchange for a part of their benefices. There is also "MalwareAsAService" (MAAS), which is the same but with malware.

<br>

* The security triad **CIA**: Confidentiality <small>(only allowed users can read it)</small>, Integrity <small>(not tampered)</small>, Availability <small>(available when needed)</small>. The opposite is DAD <small>(Disclosure, Alternation, and Destruction)</small>.
* **Principle of the least privileges**: based on the role, and the data being shared.
  * Privileged Identity Management (PIM): from organization role to system role
  * Privileged Access Management (PAM): manage the role that a privileged user has.
  * Models: Bell-LaPadula, Biba Model

<br>

* **Intrusion Detection System** (IDS): a system detecting intrusions.
* **Intrusion Prevention System** (IPS): a system blocking detected intrusions.
* **Endpoint Detection and Response** (EDS)
* **Deceptive security**
* **Virtual Private Network** (VPN): it ensures both integrity <small>(not tampered)</small>, and confidentiality <small>(can't read it)</small> of the network traffic.
* **Host firewall**: a program shipped with the Operating System to filter packets as a firewall does
</div></div>

> **Random**: most CTF challenges use the infamous rockyou.txt wordlist of passwords <small>(from a data breach of rockyou.com in 2009)</small>, through they were most likely not user passwords.

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

<tr><td>WannaCry (2017)<br><b>Ransomware</b></td><td>

Use a vulnerability in Windows. The exploit was created by the NSA and  stolen by hackers in 2013. The NSA notified Microsoft when this virus was released so that they patch it. Used in 2017 by North Korea, infected 200 000 computers. Auto-replicating virus, asking for a ransom. The NSA added a kill switch to the exploit, allowing anyone knowing it to stop the propagation.
</td></tr>
</table>

<hr class="sep-both">

## Learning, & Practicing

You can use [cybersecurityeducation.org](https://www.cybersecurityeducation.org/) to find degrees, certifications...

<div class="row row-cols-md-2"><div>

**Learning**

* [TryHackMe](https://tryhackme.com/) (THM): a lot of free courses, and a guide enjoyable/gratifying place to start learning, although you will have to go to other sites later
* [academy.hackthebox.com](https://academy.hackthebox.com/catalogue): you pay to enroll in courses, you have some starter "money", and you get back all <small>(tier-0, newcomers)</small>, or a part of your credits, once you finished the course.

**Others that I didn't check out yet**

* [hackerone.com](https://www.hackerone.com/hackers)
* [PortSwigger](https://portswigger.net/web-security)
* [rapid7](https://www.rapid7.com/fundamentals/)
* [codered.eccouncil.org](https://codered.eccouncil.org/)
* [hackerrank](https://www.hackerrank.com/)
* [sans.org: cyberaces](https://www.sans.org/cyberaces/)
* [Red Team Nation](https://redteamnation.com/)
* [cybr.com](https://cybr.com/)
* [academy.tcm-sec.com](https://academy.tcm-sec.com/)
* [appsec-labs.com](https://appsec-labs.com/online-training/)
* [pentesterlab](https://www.pentesterlab.com/)
* [cybertalents](https://cybertalents.com/)
* [crowdstrike](https://www.crowdstrike.com/cybersecurity-101/)
</div><div>

**Practicing** (CTF = capture the flag)

* [HackTheBox](https://hackthebox.com/) (HTB)
* [root me](https://www.root-me.org/)
* [TryHackMe](https://tryhackme.com/) (THM)
* [OverTheWire](https://overthewire.org/wargames/)
* [vulnhub](https://www.vulnhub.com/)
* [capturetheflag.withgoogle.com](https://capturetheflag.withgoogle.com/beginners-quest)
* [List of CTFs websites](https://hacktoday.io/t/list-of-hacking-ctf-challenge-sites/1980)
* [attackdefense](https://attackdefense.com/)
* See the webserver page for vulnerable web applications to test your skills such as OWASP JuiceShop, DVWA...

**Bug bounty programs** [bug bounty programs list](https://www.bugcrowd.com/bug-bounty-list/)

Some companies are giving bounties to ethical hackers that detected exploits in their infrastructures.

* [bounty.github.com](https://bounty.github.com/) (GitHub)
* [huntr.dev](https://huntr.dev/) (open-source repositories)
* [BugBountyHunter.com](https://www.bugbountyhunter.com/)
* [intigriti.com](https://www.intigriti.com/)

</div></div>

<hr class="sep-both">

## News

<div class="row row-cols-md-2 mt-3"><div>

Nothing much yet.

* [hackerone.com](https://www.hackerone.com/resources)
* [cybernews.com](https://cybernews.com/news/)
* [thehackernews.com](https://thehackernews.com/)
* [threatpost.com](https://threatpost.com/)
</div><div>

**Did you credentials leak?**

* [have i been pwned?](https://haveibeenpwned.com/)
* [cybernews check](https://cybernews.com/personal-data-leak-check/) 
* [leakcheck](https://leakcheck.io/) (premium?)
* [dehashed](https://dehashed.com/) (premium?)
* [monitor.firefox.com](https://monitor.firefox.com/)
* [breachdirectory](https://www.breachdirectory.org/) (you can see some half-censured passwords)

There is also [vigilante.pw](https://github.com/wedataintelligence/Vigilante.pw/blob/master/data.csv) / [breaches.net](https://breaches.net/) / [nuclearleaks.com](https://nuclearleaks.com/search) / [monitor.firefox.com](https://monitor.firefox.com/breaches) listing information about data leaks.
</div></div>

<hr class="sep-both">

## Blogs

This is a list of blogs that I want to check out one day. There are too many piling up, so I filter them and keep the most interesting ones.

<div class="row row-cols-md-4 mt-3"><div>

* [CrackItDown](https://web.archive.org/web/20210923121550/https://www.crackitdown.com/)
* [hacktricks.xyz](https://book.hacktricks.xyz/welcome/readme)
* [guru99.com](https://www.guru99.com/ethical-hacking-tutorials.html)
* [PayloadsAllTheThingsWeb](https://swisskyrepo.github.io/PayloadsAllTheThingsWeb/)
* [amandinegh](https://amandinegh.gitbook.io/cyberadventure/)
* [PENTESTING-BIBLE](https://github.com/blaCCkHatHacEEkr/PENTESTING-BIBLE) (11k ⭐)
* [Infosec_Reference](https://github.com/rmusser01/Infosec_Reference) (4.6k ⭐)
* [mikadmin.fr](https://mikadmin.fr/blog/)
* [dhilipsanjay CTFs](https://dhilipsanjay.gitbook.io/ctfs/)
* [TheDutchHacker](https://www.thedutchhacker.com/)
* [0xrick](https://0xrick.github.io/categories/)
* [cyber-security-base-19](https://github.com/rage/cyber-security-base-19)
* [ctf101.org](https://ctf101.org/)
* [tbhaxor.com](https://tbhaxor.com/)
* [zachkenney](https://zachkenney.me/)
* [n3t-hunt3r](https://n3t-hunt3r.gitbook.io/pentest-book/)
* [ropnop](https://blog.ropnop.com/)
* [infosecinstitute](https://resources.infosecinstitute.com/)
* [hacksplaining](https://www.hacksplaining.com/lessons)
* [complexsecurity](https://complexsecurity.io/)
</div><div>

* [auth0.com](https://auth0.com/blog/)
* [MayADevBe](https://mayadevbe.me/)
* [ryanplatten](https://ryanplatten.com/various-journal-entries/)
* [kalilinuxtutorials](https://kalilinuxtutorials.com/)
* [mrash.co](https://mrash.co/)
* [sckull](https://sckull.github.io/)
* [ctf.ac](https://ctf.ac/)
* [narancsblog](https://narancsblog.com/category/thm/)
* [xapax](https://xapax.github.io/security/#)
* [total-oscp-guide](https://github.com/alexb49/total-oscp-guide)
* [fr33s0ul.tech](https://fr33s0ul.tech/index.html)
* [yberethical](https://blog.cyberethical.me/)
* [dailycompute](https://dailycompute.net/)
* [ammmy7580](https://ammmy7580.gitbook.io/)
* [hacking-capture](https://hacking-capture.github.io/)
* [steflan](https://steflan-security.com/)
* [g0tmi1k](https://blog.g0tmi1k.com/)
* [fredtep](https://fredtep.com/)
* [null-byte](https://null-byte.wonderhowto.com/)
* [wonderhowto](https://www.wonderhowto.com/)
</div><div>

* [razrsec](https://blog.razrsec.uk/)
* [stawm](https://stawm.design.blog/)
* [qz.sg](https://blog.qz.sg/)
* [saharshtapi](https://saharshtapi.github.io/)
* [vitcher97](https://vitcher97.blogspot.com/)
* [marcorei7](https://marcorei7.wordpress.com/)
* [thefluffy007](https://thefluffy007.com/)
* [beginninghacking](https://beginninghacking.net/)
* [aptx1337](https://aptx1337.github.io/)
* [shishirsubedi](https://shishirsubedi.com.np/)
* [hackofalltrades](https://hackofalltrades.dev/)
* [cybersecnerds](https://cybersecnerds.com/)
* [raw.pm](https://blog.raw.pm/)
* [nairitya03](https://nairitya03.github.io/CTF-WriteUps/)
* [robertmuwanga](https://robertmuwanga.netlify.app/)
* [hacktoday](https://hacktoday.io/)
* [ThePacketBender](https://github.com/ThePacketBender/notes)
* [fredtep](https://fredtep.com/)
* [null-byte](https://null-byte.wonderhowto.com/)
* [wonderhowto](https://www.wonderhowto.com/)
</div><div>

* [deltreey](https://deltreey.blogspot.com/)
* [bryce-simpson](https://bryce-simpson.netlify.app/)
* [hambyhacks](https://hambyhacks.github.io/)
* [6rian](https://www.6rian.com/)
* [cybersecbits](https://cybersecbits.com/)
* [jarrodrizor](https://jarrodrizor.com/)
* [0xv3r4x](https://0xv3r4x.github.io/)
* [trailofbits](https://trailofbits.github.io/ctf/)
* [lkmidas](https://lkmidas.github.io/)
* [bees](https://bees.substack.com/archive)
* [goron](https://gitlab.com/goron/security_whitepapers/-/tree/master)
* [pentestlab](https://pentestlab.blog/)
* [enigma0x3](https://enigma0x3.net/)
* [hackingarticles](https://www.hackingarticles.in)
* [motasem](https://motasem-notes.net/)
* [thehackerish](https://thehackerish.com/)
* [secjuice](https://www.secjuice.com/)
* [cnil](https://www.cnil.fr/fr/cybersecurite)
</div>

</div>

<hr class="sep-both">

## 👻 TODO 👻

Stuff that I found, but never read/used yet.

<div class="row row-cols-md-2"><div>

Read writeups about

* [THM/owasptop10](https://tryhackme.com/room/owasptop10)
* [THM/uploadvulns](https://tryhackme.com/room/uploadvulns)
* [THM/vulnversity](https://tryhackme.com/room/vulnversity)
* [THM/basicpentestingjt](https://tryhackme.com/room/basicpentestingjt)
* [THM/owasptop10](https://tryhackme.com/room/owasptop10)
* [THM/startup](https://tryhackme.com/room/startup)
* [THM/steelmountain](https://tryhackme.com/room/steelmountain) (premium)
* Daily Bugle ([cenaras](https://cenaras.wordpress.com/2020/07/14/example-post-3/))

Next

* Explore the JuiceShop (see [THM/JuiceShop](https://tryhackme.com/room/owaspjuiceshop))
* [Mobile app testing](https://github.com/OWASP/owasp-mastg)

Articles

* [breach attack](https://www.acunetix.com/blog/articles/breach-attack/)
* [elastic](https://www.elastic.co/guide/en/security/current/es-overview.html)
* [attack.mitre](https://attack.mitre.org/tactics/enterprise/)
</div><div>

Courses

* udemy learn ethical hacking from scratch
* udemy python and ethical hacking from scratch

Random

* [ocd-mindmaps](https://orange-cyberdefense.github.io/ocd-mindmaps/)
* [bugtraq](https://bugtraq.securityfocus.com/archive)
* [cxsecurity](https://cxsecurity.com/) / [cifrex](https://cifrex.org/)
* [packetstormsecurity](https://packetstormsecurity.com/)

Attacks

* [Email_injection](https://en.wikipedia.org/wiki/Email_injection)
* [HTTP_header_injection](https://en.wikipedia.org/wiki/HTTP_header_injection)
* [Session_fixation](https://en.wikipedia.org/wiki/Session_fixation)
* Pass-The-Hash Attack
</div></div>