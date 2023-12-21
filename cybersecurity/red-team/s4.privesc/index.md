# Red Team - Fourth step - Privilege Escalation

[![operatingsystemsecurity](../../_badges/thmp/operatingsystemsecurity.svg)](https://tryhackme.com/room/operatingsystemsecurity)

<div class="row row-cols-md-2"><div>

Privilege Escalation 🔑 is the fourth step of the pentester activities. We attempt to escalate from a regular user to an administrative account by exploiting a vulnerability in the system.

This is an important step otherwise we may not have enough privilege to access data, leave a backdoor, or for most [post-exploitation](../s5.post-exploitation/index.md) tasks.

We want to access account with the higher level of privileges:

* `root` > `sudoers` > [...] on [Linux](/operating-systems/linux/_knowledge/index.md#sudo)
* `NT AUTHORITY\SYSTEM` > `Administrator` > [...] on [Windows](/operating-systems/windows/_knowledge/index.md#permissions-and-users)
</div><div>

Escalation can be **horizontally**/laterally <small>(another user with the same level of privileges)</small> and **vertically** <small>(a higher level of privileges)</small>.

**Learn** 🎓

* [Ignitetechnologies/Privilege-Escalation](https://github.com/Ignitetechnologies/Privilege-Escalation) (2.8k ⭐, CTFs)

**Tools**

* [Meterpreter](/cybersecurity/red-team/tools/frameworks/metasploit/index.md#meterpreter) (scripts for Linux/Windows)
</div></div>

<hr class="sep-both">

## Linux privilege escalation 🦆

<div class="row row-cols-md-2"><div>

[![linprivesc](../../_badges/thm/linprivesc.svg)](https://tryhackme.com/room/linprivesc)
[![commonlinuxprivesc](../../_badges/thmp/commonlinuxprivesc.svg)](https://tryhackme.com/room/commonlinuxprivesc)
[![commonlinuxprivesc](../../_badges/thmp/commonlinuxprivesc.svg)](https://tryhackme.com/room/commonlinuxprivesc)
[![linuxprivilegeescalation](../../_badges/htb/linuxprivilegeescalation.svg)](https://academy.hackthebox.com/course/preview/linux-privilege-escalation)
[![linux_privilege_escalation](../../_badges/poat/linux_privilege_escalation.svg)](https://github.com/swisskyrepo/PayloadsAllTheThings/blob/master/Methodology%20and%20Resources/Linux%20-%20Privilege%20Escalation.md)

[Linux](/operating-systems/linux/_knowledge/index.md) privilege escalation may be achieved by exploiting:

* 💎 Exploiting [sudo](linux/sudo.md)
* ⏰ Exploiting [scheduled tasks](linux/tasks.md) <small>(cron tasks)</small>
* 🔑 Finding [credentials](linux/credentials.md) <small>(config, logs, ssh keys...)</small>
* 💥 Exploiting the [kernel](linux/kernel.md)
* 🐸 Misconfigured [file permissions](linux/perms.md)
* 🎠 Misconfigured [NFS shares](/operating-systems/networking/protocols/nfs.md#nfs-vulnerabilities-)

You may want to find [who/where you are](linux/id.md) first.

👉 Multiple techniques may try to exploit [injection](linux/injection.md) or [GTFOBins](linux/gtfobins.md).
</div><div>

There are many **automated scripts** that will investigate usual places, services, files... that you may want to look at. You will still have to understand the output, dig into it...

* [linPEAS](https://github.com/carlospolop/PEASS-ng/tree/master/linPEAS) <small>(13.9k ⭐ | shell script)</small>
* [LinEnum](https://github.com/rebootuser/LinEnum) <small>(6.4k ⭐ | shell script | 2020 🪦)</small>
* [traitor](linux/tools/traitor.md)  <small>(6.3k ⭐ | go script compiled to binary | 2022 ☠️)</small>
* [linux-smart-enumeration](https://github.com/diego-treitos/linux-smart-enumeration) a.k.a. LSE <small>(3.0k ⭐ | shell script)</small>
* [linuxprivchecker](https://github.com/sleventyeleven/linuxprivchecker) <small>(1.4k ⭐ | python script, 2021 🪦)</small>
* [pwncat-cs](/cybersecurity/red-team/s3.exploitation/shell/pwncat.md) <small>(2.3k ⭐ | reverse shell with priv. esc. suggester | 2022 ☠️)</small>
</div></div>

<hr class="sep-both">

## Windows privilege escalation 🪟

[![windowsprivesc20](../../_badges/thmp/windowsprivesc20.svg)](https://tryhackme.com/room/windowsprivesc20)
[![windows_privilege_escalation](../../_badges/poat/windows_privilege_escalation.svg)](https://github.com/swisskyrepo/PayloadsAllTheThings/blob/master/Methodology%20and%20Resources/Windows%20-%20Privilege%20Escalation.md)

<div class="row row-cols-md-2"><div>

[Windows](/operating-systems/windows/_knowledge/index.md) privilege escalation may be achieved by exploiting:

* 💎 Exploiting [UAC](windows/uac.md)
* ⏰ Exploiting [scheduled tasks](windows/tasks.md)
* 🔑 Finding [credentials](windows/credentials.md) <small>(config, logs, passwords...)</small>
* 💥 Exploiting [services](windows/services.md)
* 🐸 Exploiting [privileges](windows/perms.md)

You may want to find [who/where you are](windows/id.md) first. To exploit Windows bins/scripts/bins, refer to [LOLBAS](https://lolbas-project.github.io/#) <small>(5.5k ⭐)</small>.

Other checklists: [frizb](https://github.com/frizb/Windows-Privilege-Escalation) <small>(0.7k ⭐, 2020 🪦)</small>.
</div><div>

There are many **automated scripts** that will investigate usual places, services, files... that you may want to look at. You will still have to understand the output, dig into it...

* [WinPeas](https://github.com/carlospolop/PEASS-ng/tree/master/winPEAS) <small>(13.9k ⭐ | binary | Download and Run `.\winPEASany_ofs.exe`)</small>
* [wesng](https://github.com/bitsadmin/wesng) <small>(3.8k ⭐ | Work locally from an output file 🙌)</small>
* [Seatbelt](https://github.com/GhostPack/Seatbelt) <small>(3.2k ⭐)</small>
* [PrivescCheck](https://github.com/itm4n/PrivescCheck) <small>(2.4k ⭐ | powershell script)</small>
* [JAWS](https://github.com/411Hall/JAWS) <small>(1.5k ⭐ | 2020 🪦)</small>
* [PowerSploit](https://github.com/PowerShellMafia/PowerSploit/tree/master/Privesc) <small>(11.2k ⭐ | powershell script | 2017 🪦 | This is the latest version of [PowerTools](https://github.com/PowerShellEmpire/PowerTools/tree/master/PowerUp) and [PowerUp](https://github.com/HarmJ0y/PowerUp) which are dead too since 2014/2015)</small>.

```ps
$ wes.py --update         # update local database
$ wes.py [...] output.txt # process the selected tool output
PS> powershell -ep bypass -c ". .\PrivescCheck.ps1; Invoke-PrivescCheck"
PS> powershell -ep bypass -c ". .\PowerUp.ps1; Invoke-AllChecks"
```
</div></div>

<hr class="sep-both">

## 👻 To-do 👻

Stuff that I found, but never read/used yet.

<div class="row row-cols-md-2"><div>

Courses

* [payatu.com](https://payatu.com/guide-linux-privilege-escalation)
* [udemy.com](https://www.udemy.com/course/linux-privilege-escalation/)

Random

* [WADComs](https://github.com/WADComs/WADComs.github.io) (1k ⭐)/[wadcoms website](https://wadcoms.github.io/)
* Metasploit PRO
* Create custom modules, `-m` or `loadpath` to load them, [doc](https://www.rubydoc.info/github/rapid7/metasploit-framework/Msf)
</div><div>

Exploiting Services

* [MySQL user-defined functions](https://redteamnation.com/mysql-user-defined-functions/)

Credentials

* Mimikatz, Kiwi, pypykatz
* [LaZagne](https://github.com/AlessandroZ/LaZagne)
</div></div>