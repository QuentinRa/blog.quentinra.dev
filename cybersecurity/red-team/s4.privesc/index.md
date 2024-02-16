# Red Team - Fourth step - Privilege Escalation

[![operatingsystemsecurity](../../_badges/thmp/operatingsystemsecurity.svg)](https://tryhackme.com/room/operatingsystemsecurity)

<div class="row row-cols-lg-2"><div>

Privilege Escalation 🔑 is the fourth step of the pentester activities. We attempt to escalate from a regular user to an administrative account by exploiting a vulnerability in the system.

This is an important step otherwise we may not have enough privilege to access data, leave a backdoor, or for most [post-exploitation](../s5.post-exploitation/index.md) tasks.

We want to access account with the higher level of privileges:

* `root` > `sudoers` > [...] on [Linux](/operating-systems/linux/_knowledge/index.md#sudo)
* `NT AUTHORITY\SYSTEM` > `Administrator` > [...] on [Windows](/operating-systems/windows/_knowledge/index.md#permissions-and-users)
</div><div>

Escalation can be **horizontally**/laterally <small>(another user with the same level of privileges)</small> and **vertically** <small>(a higher level of privileges)</small>.

**Learn** 🎓

* [Ignitetechnologies/Privilege-Escalation](https://github.com/Ignitetechnologies/Privilege-Escalation) <small>(3.0k ⭐, CTFs)</small>

**Tools**

* [Meterpreter](/cybersecurity/red-team/tools/frameworks/metasploit/index.md#meterpreter) (scripts for Linux/Windows)
</div></div>

<hr class="sep-both">

## Privilege Escalation Basics

<div class="row row-cols-lg-2"><div>

Each operating system has its own set of escalation vectors while they share similarities. The most common point is that we want to gather information about the environnement.

* **User information** 🧑: it may be used to determine your level of access, your role, along with username naming conventions

* **Host information** 💻: it may be used to find if there are well-known vulnerabilities or misconfigurations.

* **Network information** 🌍: from the outside, we mostly only saw a portion of the internal network. We find find that the host is running a FTP server only available from the inside.

Additionally, look for folders where you can download and run scripts, along with the machine configuration to configure them properly. 
</div><div>

I compiled a list of handy commands per operating system:

* [Linux Environment Identification](linux/utils/id.md)
* [Windows Environment Identification](windows/id.md)

You will also have to look for installed tools and apps along with their versions. You will need these to look for [CVEs and exploits](/cybersecurity/red-team/s3.exploitation/index.md#vulnerability-databases) related to local escalation privilege.
</div></div>

<hr class="sep-both">

## Linux privilege escalation 🦆

<div class="row row-cols-lg-2"><div>

[![linprivesc](../../_badges/thm/linprivesc.svg)](https://tryhackme.com/room/linprivesc)
[![commonlinuxprivesc](../../_badges/thmp/commonlinuxprivesc.svg)](https://tryhackme.com/room/commonlinuxprivesc)
[![commonlinuxprivesc](../../_badges/thmp/commonlinuxprivesc.svg)](https://tryhackme.com/room/commonlinuxprivesc)
[![linuxprivilegeescalation](../../_badges/htb/linuxprivilegeescalation.svg)](https://academy.hackthebox.com/course/preview/linux-privilege-escalation)
[![linux_privilege_escalation](../../_badges/poat/linux_privilege_escalation.svg)](https://github.com/swisskyrepo/PayloadsAllTheThings/blob/master/Methodology%20and%20Resources/Linux%20-%20Privilege%20Escalation.md)

[Linux](/operating-systems/linux/_knowledge/index.md) privilege escalation may be achieved by exploiting:

* 💎 Exploiting [sudo](linux/topics/sudo.md)
* ⏰ Exploiting [scheduled tasks](linux/topics/tasks.md) <small>(cron tasks)</small>
* 🔑 Finding [credentials/files](#credential-hunting) <small>(config, logs, ssh keys...)</small>
* 💥 Exploiting the [kernel](linux/topics/kernel.md)
* 🐸 Misconfigured [file permissions](linux/topics/perms.md)
* 📦 Look for [unmounted drives/medias](linux/topics/drives.md)
* 👻 Look for printers (`lpstat`)

External tools/services

* 🎠 Misconfigured [NFS shares](/operating-systems/networking/protocols/nfs.md#nfs-vulnerabilities-)
* 🎠 Misconfigured [Docker socket/permissions](/operating-systems/others/virtualization/docker/index.md#docker-pentester-notes-)
* 🎠 Misconfigured [Tmux sessions](/operating-systems/linux/env/others/tmux/index.md)

⚠️ Don't forget hidden files.
</div><div>

There are many **automated scripts** that will investigate usual places, services, files... that you may want to look at. You will still have to understand the output, dig into it...

* [linPEAS](https://github.com/carlospolop/PEASS-ng/tree/master/linPEAS) <small>(13.9k ⭐ | shell script)</small>
* [LinEnum](https://github.com/rebootuser/LinEnum) <small>(6.4k ⭐ | shell script | 2020 🪦)</small>
* [traitor](linux/tools/traitor.md)  <small>(6.3k ⭐ | go script compiled to binary | 2022 ☠️)</small>
* [linux-smart-enumeration](https://github.com/diego-treitos/linux-smart-enumeration) a.k.a. LSE <small>(3.0k ⭐ | shell script)</small>
* [linuxprivchecker](https://github.com/sleventyeleven/linuxprivchecker) <small>(1.4k ⭐ | python script, 2021 🪦)</small>
* [pwncat-cs](/cybersecurity/red-team/s3.exploitation/shell/tools/pwncat.md) <small>(2.3k ⭐ | reverse shell with priv. esc. suggester | 2022 ☠️)</small>

Additional references

* [GTFOBins](linux/tools/gtfobins.md)
* [Injection](linux/utils/injection.md)
* [Rootbash](linux/utils/rootbash.md)
* [Restricted Shells](linux/random/restricted_shells.md)

<details class="details-n">
<summary>Special escalation vectors</summary>

[![ctf](../../_badges/thm-p/ctf.svg)](https://tryhackme.com/room/ctf)

* The SSH banner (`/etc/update-motd.d/00-header`), which is executed as root, is using a script that we could edit.
</details>
</div></div>

<hr class="sep-both">

## Windows privilege escalation 🪟

[![windowsprivesc20](../../_badges/thmp/windowsprivesc20.svg)](https://tryhackme.com/room/windowsprivesc20)
[![windows_privilege_escalation](../../_badges/poat/windows_privilege_escalation.svg)](https://github.com/swisskyrepo/PayloadsAllTheThings/blob/master/Methodology%20and%20Resources/Windows%20-%20Privilege%20Escalation.md)

<div class="row row-cols-lg-2"><div>

[Windows](/operating-systems/windows/_knowledge/index.md) privilege escalation may be achieved by exploiting:

* 💎 Exploiting [UAC](windows/uac.md)
* ⏰ Exploiting [scheduled tasks](windows/tasks.md)
* 🔑 Finding [credentials](#credential-hunting) <small>(config, logs, passwords...)</small>
* 💥 Exploiting [services](windows/services.md)
* 🐸 Exploiting [privileges](windows/perms.md)

<br>

Additional references

* [LOLBAS](https://lolbas-project.github.io/#) <small>(6.3k ⭐)</small> 
* [hijacklibs](https://hijacklibs.net/) <small>(0.5k ⭐)</small>
* [frizb](https://github.com/frizb/Windows-Privilege-Escalation) <small>(0.7k ⭐, checklist, 2020 🪦)</small>
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

## Credential Hunting

[![linuxprivesc](../../_badges/thm/linuxprivesc.svg)](https://tryhackme.com/room/linuxprivesc)
[![windowsprivesc20](../../_badges/thmp/windowsprivesc20.svg)](https://tryhackme.com/room/windowsprivesc20)
[![password_attacks](../../_badges/htb/password_attacks.svg)](https://academy.hackthebox.com/course/preview/password-attacks)
[![linuxprivilegeescalation](../../_badges/htb/linuxprivilegeescalation.svg)](https://academy.hackthebox.com/course/preview/linux-privilege-escalation)

<div class="row row-cols-lg-2"><div>

You may try to look for credentials. **Try password/key reuse**.

* 🔐 command history <small>(ex: ~/.bash_history, \*hist\*)</small>
* 🌍 browser history and [saved passwords](others/browser.md)
* 🛣️ [logs](/cybersecurity/blue-team/topics/logs.md) (`/var/log/`)
* 🐚 backups <small>(.old, .bak, xxx~...)</small>
* ✉️ conversations/mails (`/var/mail/`)
* 🌳 website configurations (`.env`)
* 👜 check the registry <small>(Windows, admin required)</small>
* ...

Manually dig for interesting or unexpected files

* `/`: look for unexpected folders in `/`
* `/root/`: test if administrator home is readable
* `~/Desktop`: look for documents, passwords...
* `~/Documents`: look for documents, passwords...
* `%appdata%`: look for sensitive applications data

#### Linux Juicy Notes

[![linuxprivesc](../../_badges/thm/linuxprivesc.svg)](https://tryhackme.com/room/linuxprivesc)
[![password_attacks](../../_badges/htb/password_attacks.svg)](https://academy.hackthebox.com/course/preview/password-attacks)
[![linuxprivilegeescalation](../../_badges/htb/linuxprivilegeescalation.svg)](https://academy.hackthebox.com/course/preview/linux-privilege-escalation)
[![ignite](../../_badges/thm-p/ignite.svg)](https://tryhackme.com/room/ignite)
[![chillhack](../../_badges/thm-p/chillhack.svg)](https://tryhackme.com/room/chillhack)
[![validation](../../_badges/htb-p/validation.svg)](https://app.hackthebox.com/machines/Validation)

You often find interesting files in easy CTFs using:

```shell!
$ find / -user $(whoami) -type f 2>/dev/null | grep -v /proc | grep -v /sys
$ find / -type f -writable 2>/dev/null | grep -v /proc | grep -v /sys
```

Find credentials, keys, tokens, passwords:

```ps
$ find / -name .ssh 2> /dev/null
$ find / -name *id_rsa* 2> /dev/null
$ find / -wholename "*.git/config" 2> /dev/null | xargs grep "url"
```
</div><div>

#### Windows Juicy Notes

[![windowsprivesc20](../../_badges/thmp/windowsprivesc20.svg)](https://tryhackme.com/room/windowsprivesc20)
[![password_attacks](../../_badges/htb/password_attacks.svg)](https://academy.hackthebox.com/course/preview/password-attacks)

Read PowerShell console history:

```shell!
PS> type $Env:userprofile\AppData\Roaming\Microsoft\Windows\PowerShell\PSReadline\ConsoleHost_history.txt
CMD> type %userprofile%\AppData\Roaming\Microsoft\Windows\PowerShell\PSReadline\ConsoleHost_history.txt
```

List saved credentials by Windows:

```shell!
PS> cmdkey /list
PS> # use 'admin' saved credentials to start cmd.exe
PS> runas /savecred /user:admin cmd.exe
```

Some known locations:

```powershell
# Internet Information Services (IIS) = the default web server
PS> type C:\inetpub\wwwroot\web.config | findstr connectionString
PS> type C:\Windows\Microsoft.NET\Framework64\vX.X.XXXXX\Config\web.config | findstr connectionString
# Windows Deployment Services (credentials of the admin that
# deployed the OS image to several hosts, referred as "Unattended")
PS> type C:\Unattend.xml
PS> type C:\Windows\Panther\Unattend.xml
PS> type C:\Windows\Panther\Unattend\Unattend.xml
PS> type C:\Windows\system32\sysprep.inf
PS> type C:\Windows\system32\sysprep\sysprep.xml
# Putty
PS> reg query HKEY_CURRENT_USER\Software\SimonTatham\PuTTY\Sessions\ /f "Proxy" /s
# VNC servers
# FileZilla
PS> type C:\xampp\FileZilla Server\FileZilla Server.xml
PS> type C:\Program Files\FileZilla Server\FileZilla Server.xml
```
</div></div>

<hr class="sep-both">

## Linux Escalation Recipe

<div class="row row-cols-lg-2"><div>

First, find who you are, if you are in interesting groups:

```ps
$ id
```

If you're in `sudo`, try running sudo without/with password.

```ps
$ sudo -l -n
```

Look for interesting files "relatively" to your current user:

```ps
$ find / -user $(whoami) -type f 2>/dev/null | grep -v /proc | grep -v /sys
$ find / -type f -writable 2>/dev/null | grep -v /proc | grep -v /sys
$ ls /opt # why not
$ find /opt/ \( -amin -5 -o -mmin -5 \) 2> /dev/null # recently modified/edited?
```

Look for suspicious permissions:

```ps
$ find / -perm -u=s -type f -ls 2>/dev/null
$ find / -perm -g=s -type f -ls 2>/dev/null
$ getcap -r / 2>/dev/null
```
</div><div>

Look for interesting network services:

```ps
$ netstat -antp | grep -i list
```

As a reminder, you may use tunneling tools to access internal local websites such as [chisel](/cybersecurity/red-team/tools/utilities/tunneling/chisel.md) or [ssh](/operating-systems/networking/protocols/ssh.md).

Finally, look for users and services in `/etc/passwd`. Also, go look in `/home` for user homes, and try to see if you can access them.

Remember to test for password reuse and [default credentials](/cybersecurity/red-team/_knowledge/topics/wordlists.md#accounts).

Once this is done, you can try to run automated tools. They will return a large output, but it will way less than if you did it manually.

* Interesting configuration files
* Interesting files that may contain a password
* Interesting sockets
* Interesting kernel exploits 
* ...
</div></div>

<hr class="sep-both">

## 👻 To-do 👻

Stuff that I found, but never read/used yet.

<div class="row row-cols-lg-2"><div>

Courses

* [payatu.com](https://payatu.com/guide-linux-privilege-escalation)
* [udemy.com](https://www.udemy.com/course/linux-privilege-escalation/)

Random

* [WADComs](https://github.com/WADComs/WADComs.github.io) (1k ⭐)/[wadcoms website](https://wadcoms.github.io/)
* Metasploit PRO
* Create custom modules, `-m` or `loadpath` to load them, [doc](https://www.rubydoc.info/github/rapid7/metasploit-framework/Msf)
* Test cracked credentials on any user
</div><div>

Exploiting Services

* [MySQL user-defined functions](https://redteamnation.com/mysql-user-defined-functions/)
* [PrintSpoofer](https://github.com/itm4n/PrintSpoofer)

Credentials

* Mimikatz, Kiwi, pypykatz
* [LaZagne](https://github.com/AlessandroZ/LaZagne)

Training

* [allinonemj](https://tryhackme.com/room/allinonemj) (LXC)
</div></div>