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

## Operating system 🦘

<div class="row row-cols-md-2"><div>

We usually use a Linux distro, mostly on a VM, to practice.

#### Kali Linux

You can [download Kali ISO here](https://www.kali.org/get-kali/#kali-virtual-machines). On Virtual Box, you have to select Linux 2.6/3.x/4.x/5.x (64-bits) and tune the settings.

* **Username**: kali / **Password**: kali
* Don't forget to use `sudo apt update` / `sudo apt upgrade`

<details class="details-n">
<summary>Swap to another keyboard layout 🔥</summary>

* First, log in
* Click on Kali icon (top left)
* Search "Keyboard"
* Select the Keyboard Utility
* Go to the layout tab
* Add a keyboard layout <small>(ex: fr-FR/AZERTY)</small>
* Remove the unused QWERTY layout

> The change is applied immediately... But on the login screen, the keyboard layout will still be QWERTY ⚠️.
</details>

<details class="details-n">
<summary>Tips and tricks 🪄</summary>

* Use the <kbd>right arrow</kbd> key to use the suggested command

* In the top-right corner, you can find your IP address (tun0)
</details>
</div><div>

#### Parrot Linux 🦜

[Parrot](https://www.parrotsec.org/) is a popular alternative to Kali Linux.

<br>

#### BlackArch 😶‍🌫️

[BlackArch](https://www.blackarch.org/) is mostly used by ArchLinux users, as an alternative to Parrot and Kali Linux.
</div></div>

<hr class="sep-both">

## CTF virtual machines 🔫

<div class="row row-cols-md-2"><div>

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

#### Game of Active Directory 🛟

The [Game of Active Directory (GOAD)](https://github.com/Orange-Cyberdefense/GOAD) (1.9k ⭐) is an [Active directory](/operating-systems/active-directory/_knowledge/index.md) Lab. It was designed by the French company "Orange".

<br>

#### Web applications 🌍

* See [OWASP Juice Shop](https://github.com/juice-shop/juice-shop) (7.9k ⭐) / [THM juiceshop](https://tryhackme.com/room/owaspjuiceshop)
* See [OWASP mutillidae](https://github.com/webpwnized/mutillidae) (1.0k ⭐) / [THM mutillidae](https://tryhackme.com/room/owaspmutillidae)
* [Damn Vulnerable Web Application (DVWA)](https://github.com/digininja/DVWA) (7.4k ⭐) / [THM DVWA](https://tryhackme.com/room/dvwa)
* [WebGoat](https://github.com/WebGoat/WebGoat) (5.6k ⭐)
* [pygoat](https://github.com/adeyosemanputra/pygoat) (0.1k ⭐, django)
* [bwapp](http://www.itsecgames.com/download.htm) (0.1k ⭐, 💀 since 2014) and [bWapp solutions](https://github.com/skiptomyliu/solutions-bwapp) (0.1k ⭐).
</div></div>

<hr class="sep-both">

## Transfer files 🛅

<div class="row row-cols-md-2"><div>

You will often want to transfer files between your machine, and the target. Mostly during privilege escalation and post-exploitation.

#### Python webserver 🐍

<i class="small">On the "host" where the file is:</i>

```shell!
$ python -m http.server port # port > 1023
$ sudo python -m http.server port # port <= 1023
```

<i class="small">On the "client" that need the file:</i>

```shell!
$ # Download on Linux
$ wget HOST_IP:port/script.sh -o /tmp/script.sh
PS> # Download on Windows
PS> wget HOST_IP:port/script.ps1 -o $Env:TMP/script.ps1
```

</div><div>

* You may try with `python2`, and `python3` if `python` is unavailable.
* You may use copy-paste if appropriate ✂️
* You may have to use `curl` or `iws` (Windows-only) instead of `wget`

```shell!
$ curl HOST_IP:port/script.sh -o /tmp/script.sh
PS> curl HOST_IP:port/script.ps1 -o $Env:TMP/script.ps1
PS> iws HOST_IP:port/script.ps1 -o $Env:TMP/script.ps1
```

#### netcat 🐈

```ps
# host
$ nc CLIENT_IP port < file.sh
# client
$ nc -lvp port > file.sh
```

#### services 🕳️

You may use FTP/SCP/NFS... if applicable.
</div></div>

<hr class="sep-both">

## Wordlists ⛪

<div class="row row-cols-md-2"><div>

A wordlist is a list of words, mostly used during discovery, exploitation for enumeration or password cracking.

* 🏝️ Find common hidden directories on a web server
* 🔑 Test common passwords
* ...

On Kali Linux, you can use the commands `wordlists` or `seclists` to move to the location where the wordlists are stored.

* package seclists | [GitHub](https://github.com/danielmiessler/SecLists) (43k ⭐)

```
/usr/share/seclists/Passwords/darkweb2017-top10000.txt
/usr/share/seclists/Usernames/xato-net-10-million-usernames.txt
...
```

* package wordlists | [GitHub](https://github.com/drtychai/wordlists) (0.1k ⭐)

```
/usr/share/wordlists/rockyou.txt
/usr/share/wordlists/dirb/others/best1050.txt
/usr/share/wordlists/dirb/others/best110.txt
...
```
</div><div>

CTFs are usually using the infamous `rockout.txt` for passwords  <small>(from a data breach of rockyou.com in 2009)</small>. On Kali Linux, run `wordlists` and press Y to extract it. Location: `/usr/share/wordlists/rockyou.txt`.

#### Fast wordlist generation

```shell!
$ echo {A..Z} | tr ' ' '\n' > AZ.lst
$ echo {0..99} | tr ' ' '\n' > 0_to_99.lst
$ echo user{0..9} | tr ' ' '\n' > user_0_to_9.lst
$ echo {admin,adm,user} | tr ' ' '\n' > simple_list.lst
```

#### Tune wordlists

If the minimum length for a password is 6 characters, you may want to remove shorter passwords. Refer to the [regex](/programming-languages/others/regex/index.md) section.

```shell!
$ # only keep 4 letters passwords
$ egrep '^.{4}$' /usr/share/wordlists/rockyou.txt > /tmp/4rock.lst
```

You may also want to merge wordlists...

```shell!
$ cat wordlist1 wordlist2 wordlist3 > wordlist123
```

</div></div>

<hr class="sep-both">

## 👻 To-do 👻

Stuff that I found, but never read/used yet.

<div class="row row-cols-md-2"><div>

* [Awesome-Hacking-Resources](https://github.com/vitalysim/Awesome-Hacking-Resources)
* [CAPEC](https://capec.mitre.org/)
* [Attack tatics](https://attack.mitre.org/tactics/enterprise/)
</div><div>

* [hb](/_kmp/_cybersecurity/_in/hb.txt.md)
* [htb](/_kmp/_cybersecurity/_in/htb.md)
* [notes](/_kmp/_cybersecurity/_in/notes.md)
* [stuff](/_kmp/_cybersecurity/_in/stuff.txt.md)
* [security index](/_kmp/_cybersecurity/_in/security/index.md)
</div></div>