# Red team fundamentals

[![pentestingfundamentals](../../_badges/thm/pentestingfundamentals.svg)](https://tryhackme.com/room/pentestingfundamentals)
[![careersincyber](../../_badges/thmp/careersincyber.svg)](https://tryhackme.com/room/careersincyber)
[![introtooffensivesecurity](../../_badges/thm/introtooffensivesecurity.svg)](https://tryhackme.com/room/introtooffensivesecurity)
[![redteamfundamentals](../../_badges/thm/redteamfundamentals.svg)](https://tryhackme.com/room/redteamfundamentals)
[![redteamengagements](../../_badges/thm/redteamengagements.svg)](https://tryhackme.com/room/redteamengagements)
[![pentestingfundamentals](../../_badges/thm/pentestingfundamentals.svg)](https://tryhackme.com/room/pentestingfundamentals)

<div class="row row-cols-lg-2"><div>

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

* 🎯 The scope of the test <small>(servers, hosts, etc.)</small>
* 🤠 The rules of the test <small>(techniques allowed, no downtime, etc.)</small>
* 💵 Concrete Objectives <small>(system misconfiguration, etc.)</small>
* ...

Everything outside the scope is illegal. See [SANS ROE template](https://sansorg.egnyte.com/dl/bF4I3yCcnt/).

➡️ Note that it's common to record your screen/terminal during the penetration test, either for review, or for evidence of any actions taken.
</div></div>

<hr class="sep-both">

## Methodology

<div class="row row-cols-lg-2"><div>

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

## Operating system 🦘

<div class="row row-cols-lg-2"><div>

We usually use a Linux distro, mostly on a VM, to practice.

#### Kali Linux 🐉

You can [download Kali ISO here](https://www.kali.org/get-kali/#kali-virtual-machines). On Virtual Box, you have to select Linux 2.6/3.x/4.x/5.x (64-bits) and tune the settings.

* **Username**: kali / **Password**: kali
* Don't forget to use `sudo apt update` / `sudo apt upgrade`
* Run `wordlists`, press Y to extract rockyou.txt wordlist. Location: `/usr/share/wordlists/rockyou.txt`.
* Windows binaries and tools: `/usr/share/windows-resources/`

<details class="details-n">
<summary>Swap to another keyboard layout 🔥</summary>

* First, log in
* Click on Kali icon (top left)
* Search "Keyboard"
* Select the Keyboard Utility
* Go to the layout tab
* Add a keyboard layout <small>(ex: fr-FR/AZERTY)</small>
* Remove the unused QWERTY layout

The change is applied immediately... But on the login screen, the keyboard layout will still be QWERTY. ⚠️.

To change the login keyboard, you can use:

```shell!
$ sudo nano /etc/lightdm/lightdm.conf
# add the correct setxkbmap line
[Seat:*]
greeter-setup-script=/usr/bin/setxkbmap fr
$ sudo systemctl restart lightdm
```
</details>

<details class="details-n">
<summary>Tips and tricks 🪄</summary>

* Use the <kbd>right arrow</kbd> key to use the suggested command

* In the top-right corner, you can find your IP address (tun0)

* Heavily use `locate <name>` (don't forget `sudo updatedb`) to search for installed scripts/wordlists/...
</details>

<br>

#### Parrot Linux 🦜

[Parrot](https://www.parrotsec.org/) is a popular alternative to Kali Linux.

* There are a wide range of tools pre-installed
* `sudo 7z x /usr/share/wordlists/rockyou.txt.gz` to extract rockyou.txt wordlist. Location: `/usr/share/wordlists/rockyou.txt`.
* The `.config` hold the UI configuration... You can copy it to another user. You need to log back in to see the changes.
* `sudo apt-get -y install ftp`
* To download Debian 10 packages, `sudo nano /etc/apt/sources.list` and add `deb http://deb.debian.org/debian buster main`, but this is somewhat risky.
</div><div>

#### Exegol Docker 🐐

[Exegol](https://github.com/ThePorgs/Exegol) <small>(1.9k ⭐)</small> is a docker-based hacking environment. It's more appropriate for pentesting rather than daily use as you can have one per audit instead of cloning virtual machines.

```shell!
$ sudo apt install pipx git curl -y
$ curl -fsSL "https://get.docker.com/" | sh
$ pipx install exegol && pipx ensurepath
$ exegol install # install nightly
$ cd /path/to/my/audit/folder
$ exegol start -cwd -fs # use cwd and adjust perms
```

You can open multiple terminals to the docker container by using `exegol start` multiple times. Add `--desktop` to get access to the inbrowser graphical interface <small>(not really required)</small>.

<br>

#### BackBox Linux 🥔

[backbox](https://linux.backbox.org/) is a penetration testing distro.

<br>

#### BlackArch 😶‍🌫️

[BlackArch](https://www.blackarch.org/) is mostly used by ArchLinux users.
</div></div>

<hr class="sep-both">

## CTF virtual machines 🔫

<div class="row row-cols-lg-2"><div>

You may install a system/application on a Virtual Machine, to locally attempt to break into it or test some commands/tools.

#### Metasploit Vulnerable VM 💣

Metasploit is an intentionnally misconfigured/vulnerable VM. There is no graphical interface. You can use AZERTY with `sudo loadkeys fr`.

* [Download Metasploit 2](https://docs.rapid7.com/metasploit/metasploitable-2/)
* [Download Metasploit 3](https://github.com/rapid7/metasploitable3)
* **Username**: `msfadmin`. **Password**: `msfadmin`

<br>

#### DarkStar7471 🌠

DarkStar is a THM staff that made a many rooms on THM. [You can download the VM they used in their rooms here](https://darkstar7471.com/resources.html).
</div><div>

#### Active Directory 🛟

The [Game of Active Directory (GOAD)](https://github.com/Orange-Cyberdefense/GOAD) <small>(4.0k ⭐)</small> is an [Active directory](/operating-systems/cloud/active-directory/_knowledge/index.md) Lab. It was designed by the French company "Orange".

<br>

#### Web applications 🌍

* See [OWASP Juice Shop](https://github.com/juice-shop/juice-shop) <small>(9.3k ⭐)</small> | [THM juiceshop](https://tryhackme.com/room/owaspjuiceshop) | [multi-juicer](https://github.com/iteratec/multi-juicer)
* See [OWASP mutillidae](https://github.com/webpwnized/mutillidae) <small>(1.2k ⭐)</small> | [THM mutillidae](https://tryhackme.com/room/owaspmutillidae)
* [Damn Vulnerable Web Application (DVWA)](https://github.com/digininja/DVWA) <small>(9.1k ⭐)</small> / [THM DVWA](https://tryhackme.com/room/dvwa)
* [WebGoat](https://github.com/WebGoat/WebGoat) <small>(6.4k ⭐)</small>
* [pygoat](https://github.com/adeyosemanputra/pygoat) <small>(0.2k ⭐, django)</small>
* [bwapp](http://www.itsecgames.com/download.htm) <small>(0.1k ⭐, 2014 🪦)</small> and [bWapp solutions](https://github.com/skiptomyliu/solutions-bwapp) <small>(0.2k ⭐)</small>

<br>

#### Random CTFs

* [Root the Box](https://github.com/moloch--/RootTheBox) <small>(0.9k ⭐)</small>
* [fbctf](https://github.com/facebookarchive/fbctf) <small>(6.5k ⭐)</small>
</div></div>

<hr class="sep-both">

## Transfer files 🛅

Moved to a separate page: [Files Transfer](topics/file_transfer.md).

<hr class="sep-both">

## Wordlists ⛪

Moved to a separate page: [wordlists](topics/wordlists.md).

<hr class="sep-both">

## 👻 To-do 👻

Stuff that I found, but never read/used yet.

<div class="row row-cols-lg-2"><div>

* Varonis Cyber Kill Chain
* [cyberkillchainzmt](https://tryhackme.com/room/cyberkillchainzmt)
* [unifiedkillchain](https://tryhackme.com/room/unifiedkillchain)
* [pwndoc](https://github.com/pwndoc/pwndoc) (pentest report)
* [writehat](https://github.com/blacklanternsecurity/writehat) (pentest report)
* Log date/time of pentest, so in the case of attack, you can prove it wasn't you (ex: `Start-Transcript`).
* encrypt VBox VM
* [Penetration Testing Execution Standard](http://www.pentest-standard.org/index.php/Main_Page) (PTES)
* [Open Source Security Testing Methodology Manual](https://www.isecom.org/OSSTMM.3.pdf) OSSTMM
* [MSTG](https://owasp.org/www-project-mobile-security-testing-guide/)
* [Firmware Security Testing Methodology](https://github.com/scriptingxss/owasp-fstm), [lab401](https://lab401.com/)
* [DREAD](https://en.wikipedia.org/wiki/DREAD_(risk_assessment_model))
* [Exegol](https://github.com/ThePorgs/Exegol)
</div><div>

Additional Notes

* Notes (OneNote, Evernote, Notion, Cherrytree)
  * [Joplin](https://joplinapp.org/)
  * keepnote
* List exploited systems (IP, method), compromised users (name, method, type=local?), artifacts created, (system or not) changes, etc.
* AdminExile
</div></div>