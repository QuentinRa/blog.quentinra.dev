# Fourth step - Privilege Escalation

[![operatingsystemsecurity](../../_badges/thmp/operatingsystemsecurity.svg)](https://tryhackme.com/room/operatingsystemsecurity)

<div class="row row-cols-md-2"><div>

Privilege Escalation 🔑 is the fourth step of the pentester activities. We attempt to escalate from a regular user to an administrative account by exploiting a vulnerability in the system.

This is an important step otherwise we may not have enough privilege to access data, leave a backdoor, or for most [post-exploitation](../s5.post-exploitation/index.md) tasks.

We want to access account with the higher level of privileges:

* `root` > `sudoers` > ALL on [Linux](/operating-systems/linux/knowledge/index.md#sudo)
* `NT AUTHORITY\SYSTEM` > `Administrator` > ALL on [Windows](/operating-systems/windows/knowledge/index.md#permissions-and-users)
</div><div>

Escalation can be **horizontally**/laterally <small>(another user with the same level of privileges)</small> and **vertically** <small>(a higher level of privileges)</small>.

**Learn** 🎓

* [Ignitetechnologies/Privilege-Escalation](https://github.com/Ignitetechnologies/Privilege-Escalation) (2.8k ⭐, CTFs)

**Tools**

* [Meterpreter](../s3.exploitation/tools/metasploit.md#meterpreter) (scripts for Linux/Windows)
</div></div>

<hr class="sep-both">

## Linux privilege escalation 🦆

<div class="row row-cols-md-2"><div>

[![linprivesc](../../_badges/thm/linprivesc.svg)](https://tryhackme.com/room/linprivesc)
[![commonlinuxprivesc](../../_badges/thmp/commonlinuxprivesc.svg)](https://tryhackme.com/room/commonlinuxprivesc)
[![commonlinuxprivesc](../../_badges/thmp/commonlinuxprivesc.svg)](https://tryhackme.com/room/commonlinuxprivesc)
[![linux_privilege_escalation](../../_badges/poat/linux_privilege_escalation.svg)](https://github.com/swisskyrepo/PayloadsAllTheThings/blob/master/Methodology%20and%20Resources/Linux%20-%20Privilege%20Escalation.md)

[Linux](/operating-systems/linux/knowledge/index.md) privilege escalation may be achieved by exploiting:

* 💎 Exploiting [sudo](linux/sudo.md)
* ⏰ Exploiting [scheduled tasks](linux/tasks.md) <small>(cron tasks)</small>
* 🔑 Finding [credentials](linux/credentials.md) <small>(config, logs, ssh keys...)</small>
* 💥 Exploiting the [kernel](linux/kernel.md)
* 🐸 Misconfigured [file permissions](linux/perms.md)
* 🎠 Misconfigured [NFS shares](/operating-systems/networking/protocols/nfs.md#nfs-vulnerabilities-)

You may want to find [who/where you are](linux/id.md) first.
</div><div>

There are many **automated scripts** that will investigate usual places, services, files... that you may want to look at. You will still have to understand the output, dig into it...

* [linPEAS](https://github.com/carlospolop/PEASS-ng/tree/master/linPEAS) <small>(12.2k ⭐, shell script)</small>
* [LinEnum](https://github.com/rebootuser/LinEnum) <small>(5.9k ⭐, shell script)</small>
* [traitor](https://github.com/liamg/traitor)  <small>(5.9k ⭐, go script, 👻)</small>
* [linux-smart-enumeration](https://github.com/diego-treitos/linux-smart-enumeration) a.k.a. LSE <small>(2.7k ⭐n shell script)</small>
* [linuxprivchecker](https://github.com/sleventyeleven/linuxprivchecker) <small>(1.3k ⭐, python script)</small>
* [pwncat-cs](/cybersecurity/red-team/s3.exploitation/shell/pwncat.md) <small>(2.0k ⭐, reverse shell with escalation suggester)</small>
</div></div>

<hr class="sep-both">

## Windows privilege escalation 🪟

<div class="row row-cols-md-2"><div>

[Windows](/operating-systems/windows/knowledge/index.md) privilege escalation may be achieved by exploiting:

* 💎 Exploiting [UAC](windows/uac.md)
* ⏰ Exploiting [scheduled tasks](windows/tasks.md)
* 🔑 Finding [credentials](windows/credentials.md) <small>(config, logs, passwords...)</small>
* 🐸 Misconfigured [services](windows/services.md)

You may want to find [who/where you are](windows/id.md) first. To exploit Windows bins/scripts/bins, refer to [LOLBAS](https://github.com/LOLBAS-Project/LOLBAS) <small>(5.5k ⭐)</small>.
</div><div>

There are many **automated scripts** that will investigate usual places, services, files... that you may want to look at. You will still have to understand the output, dig into it...

* [WinPeas](https://github.com/carlospolop/PEASS-ng/tree/master/winPEAS) <small>(12.2k ⭐, binary, `.\winPEASany_ofs.exe`)</small>
* [PrivescCheck](https://github.com/itm4n/PrivescCheck) <small>(2.1k ⭐, powershell script, `powershell -ep bypass -c ". .\PrivescCheck.ps1; Invoke-PrivescCheck"`)</small>
* [PowerSploit](https://github.com/PowerShellMafia/PowerSploit/tree/master/Privesc) <small>(10.6k ⭐,  powershell script, archived, `powershell -ep bypass -c ". .\PowerUp.ps1; Invoke-AllChecks"`. Older: [PowerTools](https://github.com/PowerShellEmpire/PowerTools/tree/master/PowerUp) and [PowerUp](https://github.com/HarmJ0y/PowerUp))</small>.
</div></div>

<hr class="sep-both">

## 👻 To-do 👻

Stuff that I found, but never read/used yet.

<div class="row row-cols-md-2"><div>

* [Old - Windows](_old/windows/index.md)
* [WADComs](https://github.com/WADComs/WADComs.github.io) (1k ⭐)/[wadcoms website](https://wadcoms.github.io/)

Windows

* PSReadLine (command history)
* [Seatbelt](https://github.com/GhostPack/Seatbelt)
* [JAWS](https://github.com/411Hall/JAWS)
* [frizb](https://github.com/frizb/Windows-Privilege-Escalation) (0.7k ⭐)
</div><div>

Rooms

* [linprivesc](https://tryhackme.com/room/linprivesc) (hint/notes, network)
* [windowsprivesc20](https://tryhackme.com/room/windowsprivesc20) 🐍🐍🐍

Courses

* [payatu.com](https://payatu.com/guide-linux-privilege-escalation)
* [udemy.com](https://www.udemy.com/course/linux-privilege-escalation/)
</div></div>