# Cybersecurity

[![beginnerpathintro](../_badges/thm/beginnerpathintro.svg)](https://tryhackme.com/room/beginnerpathintro)
[![startingoutincybersec](../_badges/thm/startingoutincybersec.svg)](https://tryhackme.com/room/startingoutincybersec)

<div class="row row-cols-lg-2"><div>

Cybersecurity involves securing IT systems against external threats. There are 3 categories of people:

* ⬜ **White hats**: hackers that follow the rules, try to benefit others
* 🌫️ **Grey hats**: hackers that are usually not following the rules, but often benefiting others <small>(take down malicious websites)</small>
* ⬛ **Black hats**: criminals/hackers. See [blackhat.com](https://www.blackhat.com/).

👉 White hats are also called Ethical hackers.
</div><div>

IT specialists are usually in one of the following teams:

* 🟥 [Red team](/cybersecurity/red-team/_knowledge/index.md): offensive team
* 🟦 [Blue team](/cybersecurity/blue-team/_knowledge/index.md): defensive team

There is also the 🟪 Purple team, which is a mix of both. This is a modern team created to facilitate exchange between both teams.
</div></div>

<hr class="sep-both">

## Terminology

<div class="row row-cols-lg-2"><div>

This section regroups common terms used in red and blue teams.

* **Vulnerability**/**weakness**: a failure/flaw in a system
* **Exploits**: code that makes use of a vulnerability to gain access to a machine, install malware, steal data...
* **0 Day**/Zero day: an unknown vulnerability that was just discovered
* **CTF** <small>(Capture The Flag)</small>: a training exercise to help students learn about cybersecurity, by solving challenges and capturing the flag.
* **Advanced Persistent Threat** (APT): a hacker wants to remain as long as possible within an infected network. They are using backdoors, and keep updating the code to avoid being discovered.
</div><div>

Some well-known malware types ([source](https://www.malwarebytes.com/))

* **ransomware** 🔒: locks your system and asks for a ransom.
* **adware** 📰: they hide and show ads in the browser. They may monitor the user to show relevant ads.
* **spyware** 🕵️: they hide, monitor users, and steal credentials...
* **trojan horse** 🎠: they are programs pretending to do something, while actually performing some malicious activities.
* **cryptojacking** ⛏️: hides and mines currencies on your computer.
* **virus** 😎: attached to a program, replicates itself, and spreads.
</div></div>

<hr class="sep-both">

## Famous attacks

<table class="table table-bordered border-dark table-dark bg-transparent mt-4">
<thead><tr><th>Classification</th><th>Notes</th></tr></thead>

<tr><td>Estonia (2007)<br><b>DDOS</b></td><td>

The first major attack against a country. A Russian group used botnets from 87 countries to attack Estonian banks/...
</td></tr>

<tr><td>Stuxnet (2010)<br><b>SCADA</b></td><td>

The first attack aimed at SCADA systems. An infected USB key was connected to a computer on the internal network. One of the 3 viruses of the "olympic games" along **DuQu**, and **Flame**. Supposedly made by the NSA and Iran.
</td></tr>

<tr><td>Mirai botnet (2016)<br><b>DDoS</b></td><td>

...
</td></tr>

<tr><td>WannaCry (2017)<br><b>Ransomware</b></td><td>

Use a vulnerability in Windows. The exploit was created by the NSA and stolen by hackers in 2013. The NSA notified Microsoft when this virus was released so that they patch it. Used in 2017 by North Korea, infected 200 000 computers. Auto-replicating virus, asking for a ransom. The NSA added a kill switch to the exploit, allowing anyone knowing it to stop the propagation.
</td></tr>

<tr><td>SolarWinds (2020)<br><b>Supply-chain</b></td><td>

...
</td></tr>
</table>

<hr class="sep-both">

## Learn 🎓

<div class="row row-cols-lg-2"><div>

**Theoretical** 🔨

* [TryHackMe](https://tryhackme.com/) <small>(a.k.a. THM)</small>:  many free courses, enjoyable/gratifying
* [academy.hackthebox.com](https://academy.hackthebox.com/catalogue): not many "free" courses, and they are mixing too many subjects in one course <small>(sort of MOOCs)</small>

<br>

**Practical** 🔫

* [HackTheBox](https://hackthebox.com/) (HTB)
* [root me](https://www.root-me.org/)
* [TryHackMe](https://tryhackme.com/) (THM)
* [OverTheWire](https://overthewire.org/wargames/)/[UnderTheWire](https://underthewire.tech/wargames)
* [vulnhub](https://www.vulnhub.com/)
* [capturetheflag.withgoogle.com](https://capturetheflag.withgoogle.com/beginners-quest)
* [List of CTFs websites](https://hacktoday.io/t/list-of-hacking-ctf-challenge-sites/1980)
* [attackdefense](https://attackdefense.com/)
* [virtualhackinglabs](https://www.virtualhackinglabs.com/)
* [pwnable.kr](https://pwnable.kr/)

<br>

**Bug bounty programs** 💰 ([bug bounty programs list](https://www.bugcrowd.com/bug-bounty-list/))

Some companies are giving bounties to ethical hackers that detected exploits in their infrastructures.

* [bounty.github.com](https://bounty.github.com/) (GitHub)
* [huntr.dev](https://huntr.dev/) (open-source repositories)
* [BugBountyHunter.com](https://www.bugbountyhunter.com/)
* [intigriti.com](https://www.intigriti.com/)
* [zerodayinitiative](https://www.zerodayinitiative.com/)
* [ssd-disclosure](https://ssd-disclosure.com/)

<br>

**News** 📰

* [hackerone.com](https://www.hackerone.com/resources)
* [cybernews.com](https://cybernews.com/news/)
* [thehackernews.com](https://thehackernews.com/)
* [threatpost.com](https://threatpost.com/)
</div><div>

**CTF Events** 🎮

* [picoctf](https://www.picoctf.org/), [404ctf](https://www.404ctf.fr/), France Cybersecurity Challenge (FCSC), HackTM CTF
* [Buckeyectf](https://ctf.osucyber.club/), [idek](https://ctf.idek.team/), [downunderctf](https://downunderctf.com/)
* [esaip ctf](https://ctf.esaip.org/), [HackSecuReims](https://hacksecureims.eu/), [TRACS](https://tracs.viarezo.fr/), [lactf](https://github.com/uclaacm/lactf-archive/tree/main)
* [HTB Events](https://www.hackthebox.com/events/), [tjctf](https://tjctf.org/), [intigriti](https://bugology.intigriti.io/intigriti-monthly-challenges), [flare-on](https://flare-on.com/)
* Kringlecon, Yogosha, Flag4all, TCP1P, ZITF, Patriot, ACS
* [mkarmous](https://github.com/mohamedaymenkarmous/CTF) <small>(0.1k ⭐)</small>, [sajjadium](https://github.com/sajjadium/ctf-archives/) <small>(1.0k ⭐)</small>
<br>

**Not tested** 👻 - may be either theoretical, practical, or both.

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
* [cybersecurityeducation.org](https://www.cybersecurityeducation.org/)
* [securityawareness](https://securityawareness.usalearning.gov/)
* [bugbountyhunter training](https://www.bugbountyhunter.com/training/)
* [notsosecure](https://notsosecure.com/security-training)
* [cyberhack](https://cyberhack.site/)
* [application.security](https://application.security/)
* [securecodewarrior](https://www.securecodewarrior.com/)
* [hacksplaining](https://www.hacksplaining.com/)
* [ringzer0ctf](https://ringzer0ctf.com/)
* Udemy, Coursera, nowsecure...
</div></div>


<hr class="sep-both">

## Websites 🌍

<div class="row row-cols-lg-2"><div>

#### HackTheBox Write-Ups

* [0xdf](https://0xdf.gitlab.io/)
* [hackthebox-writeups](https://github.com/Hackplayers/hackthebox-writeups/tree/master)
* [dhilipsanjay](https://dhilipsanjay.gitbook.io/ctfs/)
* [0xrick](https://0xrick.github.io/categories/#hack-the-box)
* [TheDutchHacker](https://www.thedutchhacker.com/category/write-ups/hack-the-box/)
* [h0axhacks](https://h0axhacks.com/)
* [bluewalle](https://bluewalle.github.io/)
* [sh1n0bi](https://sh1n0bi.github.io/blog)
* [complexsecurity](https://complexsecurity.io/hack-the-box)
* [reboare](https://reboare.github.io)
* [0xb0b](https://0xb0b.gitbook.io)

#### TryHackMe Write-Ups

* [dhilipsanjay](https://dhilipsanjay.gitbook.io/ctfs/) <small>(60+, 2024)</small>
* [TheDutchHacker](https://www.thedutchhacker.com/category/write-ups/tryhackme/)
* [bluewalle](https://bluewalle.github.io/)
* [fr33s0ul](https://fr33s0ul.tech/tag/ctf/)
* [nairitya03](https://nairitya03.github.io/CTF-WriteUps/)
* [0xv3r4x](https://0xv3r4x.github.io/)
* [complexsecurity](https://complexsecurity.io/try-hack-me)
* [mrash](https://mrash.co)
* [narancsblog](https://narancsblog.com/)
* [jaxafed](https://jaxafed.github.io)
* [0xb0b](https://0xb0b.gitbook.io)
* [chaudhary1337](https://chaudhary1337.github.io/) <small>(45+, 2021 🪦)</small>

#### PortSwigger Write-Ups

* [complexsecurity](https://complexsecurity.io/portswigger-academy)
</div><div>

#### CTF Write-Ups 🤖

* [lkmidas](https://lkmidas.github.io/)
* [trailofbits](https://trailofbits.github.io/ctf/exploits/binary1.html)
* [4nuit](https://github.com/4nuit/Writeup/)

#### Useful bits of knowledge 🌱

Still at human scale and useful to learn some topics.

* [0xrick](https://0xrick.github.io/categories/#hack-the-box), [mikadmin](https://mikadmin.fr/blog/) <small>(20 or so)</small>
* [n3t-hunt3r](https://n3t-hunt3r.gitbook.io/pentest-book/), [ctf101](https://ctf101.org/) <small>(20 or so)</small>
* [tbhaxor.com](https://tbhaxor.com/) <small>(150 articles or so)</small>
</div></div>

<hr class="sep-both">

## Blogs 🌍

This is a list of blogs that I want to check out one day. There are too many piling up, so I filter them and keep the most interesting ones.

<div class="row row-cols-md-4 mt-3"><div>

* [CrackItDown](https://web.archive.org/web/20210923121550/https://www.crackitdown.com/)
* [guru99.com](https://www.guru99.com/ethical-hacking-tutorials.html)
* [amandinegh](https://amandinegh.gitbook.io/cyberadventure/)
* [PENTESTING-BIBLE](https://github.com/blaCCkHatHacEEkr/PENTESTING-BIBLE) (11k ⭐)
* [Infosec_Reference](https://github.com/rmusser01/Infosec_Reference) (4.6k ⭐)
* [xapax](https://github.com/xapax/security)
* [kalilinuxtutorials](https://kalilinuxtutorials.com/)
* [cyberethical.me](https://blog.cyberethical.me/)
* [pencer.io](https://pencer.io/)
* [Kartibok](https://github.com/Kartibok/Capture-the-Flag/)
* [Awesome-Hacking-Resources](https://github.com/vitalysim/Awesome-Hacking-Resources)
* [awesome-pentest-cheat-sheets](https://github.com/coreb1t/awesome-pentest-cheat-sheets)
* [redteam.guide](https://redteam.guide/)
* [jivoi](https://github.com/jivoi/pentest)
* [cybersec-2](https://cybersec-2.gitbook.io)
* [HowToHunt](https://github.com/KathanP19/HowToHunt)
* [D13David](https://github.com/D13David/ctf-writeups)
* [SuperStormer](https://github.com/SuperStormer/writeups)
* [Seraphin](https://github.com/Seraphin-/ctf)
* [MasonCompetitiveCyber](https://github.com/MasonCompetitiveCyber)
* [apocalypse](https://github.com/hackthebox/cyber-apocalypse-2024)
* [HackademINT](https://github.com/HackademINT/)
* [DownUnderCTF](https://github.com/DownUnderCTF)
* [GCC-ENSIBS](https://github.com/GCC-ENSIBS/)
* [project-sekai-ctf](https://github.com/project-sekai-ctf)
* [learn-cyber.net](https://learn-cyber.net/)
* [mizu.re](https://mizu.re/)
* [nzeros.me](https://nzeros.me/)
* [deusx64](https://deusx64.ai/) (reverse/bin)
* [exploit.education](https://exploit.education/)
</div><div>

* [it-kombinat](https://it-kombinat.github.io/pcs/index.html)
* [h0j3n](https://h0j3n.github.io/)
* [pwn.college](https://pwn.college/)
* [pentestlab](https://pentestlab.blog/)
* [CSbyGB](https://github.com/CSbyGB/pentips)
* [auth0.com](https://auth0.com/blog/)
* [MayADevBe](https://mayadevbe.me/)
* [ryanplatten](https://ryanplatten.com/various-journal-entries/)
* [hacking-capture](https://hacking-capture.github.io/)
* [steflan](https://steflan-security.com/)
* [g0tmi1k](https://blog.g0tmi1k.com/)
* [fredtep](https://fredtep.com/)
* [null-byte](https://null-byte.wonderhowto.com/)
* [wonderhowto](https://www.wonderhowto.com/)
* [hackstreetboys](https://atom.hackstreetboys.ph/)
* [infosecjunky](https://infosecjunky.com/)
* [speedguide](https://www.speedguide.net/)
* [curiositykillscolby](https://curiositykillscolby.com/)
* [defaultcredentials](https://defaultcredentials.com/)
* [exploit-notes.hdks](https://exploit-notes.hdks.org/)
* [fastiraz](https://fastiraz.gitbook.io/)
* [tpetersonkth](https://tpetersonkth.github.io)
* [fuzzy.land](https://fuzzy.land/)
* [corkami](https://github.com/corkami/docs/)
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
* [robertmuwanga](https://robertmuwanga.netlify.app/)
* [hacktoday](https://hacktoday.io/)
* [ThePacketBender](https://github.com/ThePacketBender/notes)
* [fredtep](https://fredtep.com/)
* [null-byte](https://null-byte.wonderhowto.com/)
* [wonderhowto](https://www.wonderhowto.com/)
* [thehackerish](https://thehackerish.com/)
* [secjuice](https://www.secjuice.com/)
* [cybersins.com](https://cybersins.com/)
* [daily-swig](https://portswigger.net/daily-swig)
* [codecurmudgeon](https://codecurmudgeon.com/wp/)
</div><div>

* [bryce-simpson](https://bryce-simpson.netlify.app/)
* [hambyhacks](https://hambyhacks.github.io/)
* [6rian](https://www.6rian.com/)
* [cybersecbits](https://cybersecbits.com/)
* [jarrodrizor](https://jarrodrizor.com/)
* [bees](https://bees.substack.com/archive)
* [goron](https://gitlab.com/goron/security_whitepapers/-/tree/master)
* [pentestlab](https://pentestlab.blog/)
* [hackingarticles](https://www.hackingarticles.in)
* [motasem](https://motasem-notes.net/)
* [exploits.run](https://exploits.run/)
* [0xnirvana](https://0xnirvana.gitbook.io/writeups/)
* [robertmuwanga](https://robertmuwanga.netlify.app/)
* [niekdang](https://niekdang.wordpress.com/)
* [highon.coffee](https://highon.coffee/)
* [infinitelogins](https://infinitelogins.com/)
* [4nuit](https://github.com/4nuit/Hacking)
* [Anlominus](https://github.com/Anlominus)
* [thehacker.recipes](https://www.thehacker.recipes)
* [0xff](https://ctf.0xff.re)
* [warlocksmurf](https://warlocksmurf.github.io/)
* [HackThisSite](https://github.com/HackThisSite/CTF-Writeups)
</div>

</div>

<hr class="sep-both">

## 👻 To-do 👻

Stuff that I found, but never read/used yet.

<div class="row row-cols-lg-2"><div>

* [darknetdiaries](https://darknetdiaries.com/)
* [infosecinstitute](https://resources.infosecinstitute.com/)
* [cnil](https://www.cnil.fr/fr/cybersecurite)
</div><div>
</div></div>