# Red team fundamentals

[![beginnerpathintro](../../_badges/thm/beginnerpathintro.svg)](https://tryhackme.com/room/beginnerpathintro)
[![startingoutincybersec](../../_badges/thm/startingoutincybersec.svg)](https://tryhackme.com/room/startingoutincybersec)
[![pentestingfundamentals](../../_badges/thm/pentestingfundamentals.svg)](https://tryhackme.com/room/pentestingfundamentals)

<div class="row row-cols-md-2"><div>

The offensive team, also known as the red team 📕, is the team that attack the company, in a pre-defined scope, to help them harden their systems and processes.

* 🔎 Look for vulnerabilities (bugs, loopholes, processes)
* 💥 Try to exploit them
* 💰 Suggest patches/measures to mitigate each vulnerability

It requires someone to be knowledgeable about

* 🌍 **Web**: HTML/CSS/JS/Node/PHP
* 🗃️ **DataBases**: SQL/NoSQL/PLSQL
* 📶 **Networking**: Bash/PowerShell/Network
* ☁️ **Cloud**: docker/...
* ...

There are 3 kind of penetration tests, and according to the type of knowledge you have, you will test different things:

* ⬛ **Black box**: No knowledge about the target 
* 🌫️ **Grey box**: A partial knowledge about the target 
* ⬜ **White box**: A complete knowledge  about the target
</div><div>

Some jobs in the red team are:

* **Red Teamer**: play the hacker, and provide feedback from an enemy perspective. They are testing the company response.
* **Penetration tester**: Try to find vulnerabilities in a system, a network, or an application. Perform security assessments, and audits. Recommend actions to prevent attacks.
* **Security Engineer**: implement, and maintain security controls, handle threats protection... to help prevent cyberattacks, and protect data.

When working with a client, both the penetration tester and the system owner will define **Rules of Engagement (ROE)**

* 🎯 The scope of the test <small>(servers)</small>
* 🤠 The rules of the test <small>(techniques allowed)</small> 
* ...

Everything outside the scope is illegal. See [SANS ROE template](https://sansorg.egnyte.com/dl/bF4I3yCcnt/).
</div></div>

<hr class="sep-both">

## Methodology

<div class="row row-cols-md-2"><div>

The [Cyber Kill Chain](https://www.lockheedmartin.com/en-us/capabilities/cyber/cyber-kill-chain.html) model identifies 7 steps in the hacking process

1. 🔎 **Reconnaissance**: investigate the target <small>(passive, and active recon)</small>
2. 🔫 **Weaponization**: create/prepare an exploit
3. 📩 **Delivery**: deliver your exploit
4. 🎁 **Exploitation**: make the exploit used
5. 💥 **Installation**: install a malware
6. 🧑‍💻 **Command&Control**: get a remote shell on the victim
7. 🍾 **Actions on objective**: accomplish the goal

The [Unified Kill Chain](https://www.unifiedkillchain.com/) is a more developed/detailed version.
</div><div>

For a penetration tester, it's more something like that

* 🔎 **Investigation** (passive): information gathering
* 🔎 **Discovery** (active): enumerate/scan the target to find running applications, and services
* 💥 **Exploitation**: find a way to get in, get a **foothold**
* 👑 **Privilege Escalation**: try to get root/administrator (horizontal/vertical escalation)
* 🧼 **Post-exploitation**: accomplish the goal, hide your traces...
</div></div>

<hr class="sep-both">

## 👻 To-do 👻

Stuff that I found, but never read/used yet.

<div class="row row-cols-md-2"><div>

* [Awesome-Hacking-Resources](https://github.com/vitalysim/Awesome-Hacking-Resources)
* [Roadmap](next.md)

> **Random**: most CTF challenges use the infamous rockyou.txt wordlist of passwords <small>(from a data breach of rockyou.com in 2009)</small>, through they were most likely not user passwords.
</div><div>
</div></div>