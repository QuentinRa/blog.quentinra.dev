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

<div class="row row-cols-md-2"><div>

...
</div><div>

...
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