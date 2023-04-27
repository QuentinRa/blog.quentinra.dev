# Fourth step - Privilege Escalation

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

[![linuxfundamentalspart1](../../_badges/thm/linuxfundamentalspart1.svg)](https://tryhackme.com/room/linuxfundamentalspart1)
[![linuxfundamentalspart2](../../_badges/thm/linuxfundamentalspart2.svg)](https://tryhackme.com/room/linuxfundamentalspart2)
[![linuxfundamentalspart3](../../_badges/thm/linuxfundamentalspart3.svg)](https://tryhackme.com/room/linuxfundamentalspart3)
[![linux1](../../_badges/thm/linux1.svg)](https://tryhackme.com/room/linux1)
[![linux2](../../_badges/thm/linux2.svg)](https://tryhackme.com/room/linux2)
[![bashscripting](../../_badges/thm/bashscripting.svg)](https://tryhackme.com/room/bashscripting)
[![linuxstrengthtraining](../../_badges/thm/linuxstrengthtraining.svg)](https://tryhackme.com/room/linuxstrengthtraining)
[![catregex](../../_badges/thm/catregex.svg)](https://tryhackme.com/room/catregex)
[![linuxprivesc](../../_badges/thm/linuxprivesc.svg)](https://tryhackme.com/room/linuxprivesc)
[![commonlinuxprivesc](../../_badges/thmp/commonlinuxprivesc.svg)](https://tryhackme.com/room/commonlinuxprivesc)
[![linprivesc](../../_badges/thm/linprivesc.svg)](https://tryhackme.com/room/linprivesc)
[![linux_privilege_escalation](../../_badges/poat/linux_privilege_escalation.svg)](https://github.com/swisskyrepo/PayloadsAllTheThings/blob/master/Methodology%20and%20Resources/Linux%20-%20Privilege%20Escalation.md)

<div class="row row-cols-md-2"><div>

[Linux](/operating-systems/linux/knowledge/index.md) privilege escalation may be achieved by exploiting:

* 💎 Exploiting [sudo](linux/sudo.md)
* ⏰ Exploiting [scheduled tasks](linux/tasks.md) <small>(cron tasks)</small>
* 🔑 Finding [credentials](linux/credentials.md) <small>(config, logs, ssh keys...)</small>
* 💥 Exploiting the [kernel](linux/kernel.md)
* 🐸 Misconfigured [file permissions](linux/perms.md)
</div><div>

There are many **automated scripts** that will investigate usual places, services, files... that you may want to look at. You will still have to understand the output, dig into it...

* [linPEAS](https://github.com/carlospolop/PEASS-ng/tree/master/linPEAS) <small>(12.1k ⭐, shell script)</small>
* [LinEnum](https://github.com/rebootuser/LinEnum) <small>(5.8k ⭐, shell script)</small>
* [traitor](https://github.com/liamg/traitor)  <small>(5.5k ⭐, go script, 👻)</small>
* [linux-smart-enumeration](https://github.com/diego-treitos/linux-smart-enumeration) a.k.a. LSE <small>(2.7k ⭐n shell script)</small>
* [linuxprivchecker](https://github.com/sleventyeleven/linuxprivchecker) <small>(1.2k ⭐, python script)</small>
* [pwncat-cs](https://github.com/calebstewart/pwncat) <small>(2.0k ⭐, python script, reverse shell, 👻)</small>
</div></div>

<hr class="sep-both">

## 👻 To-do 👻

Stuff that I found, but never read/used yet.

<div class="row row-cols-md-2"><div>

* [Old - General](_old/index.md)
* [Old - Linux](_old/linux/index.md)
* [Old - Windows](_old/windows/index.md)
* `winPEAS`/`linpeas`: enumeration
* many other scripts
* ➡️ `pwncat-cs`: enumeration et exploitation
* ➡️ `traitor`: enumeration et exploitation
* [GTFOBLookup](https://github.com/nccgroup/GTFOBLookup) (0.2k ⭐): offline browser to GTFOBins, LOLBas, and WADComs
* [WADComs](https://github.com/WADComs/WADComs.github.io) (1k ⭐)/[wadcoms website](https://wadcoms.github.io/)
</div><div>

Rooms

* [password found in config+reuse](https://tryhackme.com/room/ignite)
* [linprivesc](https://tryhackme.com/room/linprivesc) (hint/notes, network)
* [windowsprivesc20](https://tryhackme.com/room/windowsprivesc20) 🐍🐍🐍
</div></div>