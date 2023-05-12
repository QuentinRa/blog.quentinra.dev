# Compromise a Windows host

[![windowsfundamentals1xbx](../../_badges/thm/windowsfundamentals1xbx.svg)](https://tryhackme.com/room/windowsfundamentals1xbx)
[![windowsfundamentals2x0x](../../_badges/thm/windowsfundamentals2x0x.svg)](https://tryhackme.com/room/windowsfundamentals2x0x)
[![windowsfundamentals3xzx](../../_badges/thm/windowsfundamentals3xzx.svg)](https://tryhackme.com/room/windowsfundamentals3xzx)
[![windowsprivesc20](../../_badges/thmp/windowsprivesc20.svg)](https://tryhackme.com/room/windowsprivesc20)
[![windows_privilege_escalation](../../_badges/poat/windows_privilege_escalation.svg)](https://github.com/swisskyrepo/PayloadsAllTheThings/blob/master/Methodology%20and%20Resources/Windows%20-%20Privilege%20Escalation.md)

<div class="row row-cols-md-2"><div>

As there isn't much we can do as a regular user, we will try to elevate our level of privileges to Administrator, or system. You may have to do horizontal escalation first, i.g. moving to another account that has the same level of privilege, but may have different permissions.

* Misconfigurations <small>(user permissions...)</small>
* Missing security updates <small>(vulnerable OS, software...)</small>
* Find vulnerable scheduled tasks/services

The **goal is to pop out a PowerShell/CMD as root** (root shell), basically, the same as selecting "run as administrator" for one of them.

</div><div>

There are many **automated scripts** that will investigate usual places, services, files... that you may want to look at. You will still have to understand the output, dig into it...

* [WinPeas](https://github.com/carlospolop/PEASS-ng/tree/master/winPEAS) (10.5k ⭐)
* [PrivescCheck](https://github.com/itm4n/PrivescCheck) (1.8k ⭐)
* [PowerUp](https://github.com/HarmJ0y/PowerUp) (222⭐) that was deprecated over [PowerTools](https://github.com/PowerShellEmpire/PowerTools/tree/master/PowerUp) (1.8k ⭐) that was deprecated again over [PowerSploit](https://github.com/PowerShellMafia/PowerSploit/tree/master/Privesc) (10k ⭐) which is now archived 😂. PowerUp from PowerSploit is still used.

```powershell
PS> .\winPEASany_ofs.exe
PS> powershell -ep bypass -c ". .\PrivescCheck.ps1; Invoke-PrivescCheck"
PS> powershell -ep bypass -c ". .\PowerUp.ps1; Invoke-AllChecks"
```
</div></div>

<hr class="sep-both">

## Learn more about your environment

Aside from commands that are in the Windows notes, here are a few used in cybersecurity.

<div class="row row-cols-md-2"><div>

* `ver` (cmd-only): see Windows version
* `whoami`: see your username <small>(ex: `NT AUTHORITY\SYSTEM`=root)</small>
* `whoami /groups`: see your groups
* `hostname`: see hostname
* `ipconfig`: network configuration
* `netstat`: monitor network traffic
* `systeminfo`: see info about the system
</div><div>

* `Get-LocalGroup`: list groups (users, administrators...)
* `Get-LocalUser`:list users
* `net localgroup users`:list users in the group "users"
* `net localgroup administrators`: list administrators
* `net user username`: info about a user

> Change the keyboard language to French: `Set-WinUserLanguageList -LanguageList  fr-FR, en-US -force` ([source](https://stackoverflow.com/questions/56820526/how-to-change-keyboard-layout-in-windows-console-cmd-or-wsl)).
</div></div>

<hr class="sep-both">

## Windows exploits

<div class="row row-cols-md-2 mt-4"><div>

* ➡️ 2016-08-15 (no CVE?)

[![blaster](../../_badges/thm-p/ice.svg)](https://tryhackme.com/room/blaster)

Bypass User Account Control (UAC) using `eventvwr.exe`. The attack is done by editing the registry, which means you must have sufficient privileges to do so <small>(not necessarily an admin, but not a regular user)</small>.

* [CVE-2017-0144](https://attackerkb.com/topics/xI1y9OoEgq/cve-2017-0144-ms17-010) - EternalBlue - MS17-010

[![blue](../../_badges/thm-p/blue.svg)](https://tryhackme.com/room/blue)

A vulnerability in the SMB protocol allowing Remote Code Execution (RCE). It was discovered by the NSA and stolen by hackers,
</div><div>

* ➡️ [CVE-2019-1388](https://github.com/nobodyatall648/CVE-2019-1388)

[![blaster](../../_badges/thm-p/blaster.svg)](https://tryhackme.com/room/blaster)

Exploit User Account Control (UAC) which is the popup prompted when trying to run a program as administrator.
</div></div>

<hr class="sep-both">

## Find credentials

<div class="row row-cols-md-2 mt-4"><div>

```powershell
# use to start a root shell
PS> runas /savecred /user:admin cmd.exe
```
</div><div>
</div></div>

<hr class="sep-both">

## Windows Services

[![steelmountain](../../_badges/thmp-p/steelmountain.svg)](https://tryhackme.com/room/steelmountain)

<div class="row row-cols-md-2"><div>

Windows services are managed by the Service Control Manager (SCM). You can use scripts such as winPEAS or PowerUp to list Windows services.

* 🗺️ List services

```powershell
PS> Get-Service
CMD> powershell -c "Get-Service"
```

* 🔎 Get more info about a service

```java
PS> sc.exe qc xxx // add .exe!!!
CMD> sc qc xxx
[SC] QueryServiceConfig SUCCESS

SERVICE_NAME: xxx
  [...]
  BINARY_PATH_NAME   : C:\[...]\service.exe
  [...]
```

In CTF, you are usually able to start/stop the service manually

```powershell
PS> sc.exe stop xxx
# do your job
PS> sc.exe start xxx
```

</div><div>

* ➡️ Insecure permissions: the current user may be able to replace the service with a malicious executable (ex: revshell.exe)

```powershell
PS> icacls C:\[...]\service.exe
PS> move C:\[...]\service.exe C:\[...]\service.exe.old
PS> icacls C:\[...]\malicious.exe /grant Everyone:F
```

* ➡️ Unquoted Service Paths: if the service is using a PATH in which there are spaces, the service isn't quoted, and the hacker can create files, then the hacker may create an executable that is executed with the rest of the path in argument.

```powershell
PS> icacls $Env:appdata\Vulnerable Program\service.exe
PS> move C:\[...]\malicious.exe $Env:appdata\Vulnerable.exe
# the service will execute
# $Env:appdata\Vulnerable.exe Program\service.exe
```

* ➡️ Insecure Service Permissions: if we can edit the permissions of a service, for instance, to change the location of the binary. See [accesschk](https://learn.microsoft.com/en-us/sysinternals/downloads/accesschk). If the user is granted `SERVICE_ALL_ACCESS` on the service, then have fun. 

```powershell
# LocalSystem is the highest privileged account available
PS> sc.exe config xxx binPath=C:\[...]\malicious.exe  obj= LocalSystem
```
</div></div>

<hr class="sep-both">

## Volume Shadow Copy Service (VSS)

<div class="row row-cols-md-2"><div>

The Volume Shadow Copy Service (VSS) is handling the creation, and management of **shadow copies**/**snapshot** of the data backed up.  They are stored in the volume information of each drive that has the feature enabled.

They may allow a system admin to restore the system after an attack. So, hackers will most likely check them, and delete them. There may exist an "offline" version of these shadow copies.
</div><div>

To manage them

* Right-click on a hard-drive
* Select Shadow copies

> See [Volume Shadow Copy Service](https://learn.microsoft.com/en-us/windows-server/storage/file-server/volume-shadow-copy-service)
</div></div>

<hr class="sep-both">

## Alternate Data Streams (ADS)

<div class="row row-cols-md-2"><div>

On a file system using NTFS, ADS allows files to have more than one stream (`flux`) of data. By default, every file has only one stream: **:$DATA**. You can inspect a file using

```powershell
> Get-Item -Path SomeFile -Stream *

PSPath        : Microsoft.PowerShell.Core\FileSystem::XXX\toto.pdf::$DATA
PSParentPath  : Microsoft.PowerShell.Core\FileSystem::XXX
PSChildName   : toto.pdf::$DATA
PSDrive       : XXX
PSProvider    : Microsoft.PowerShell.Core\FileSystem
PSIsContainer : False
FileName      : XXX\toto.pdf
Stream        : :$DATA
Length        : 0
```
</div><div>

They can be used by Windows to store data, such as identifiers telling Windows that this file was downloaded from the Internet.

Hackers can use that to store malicious code inside a file. They can execute it like this later, for instance using a legit/non-malicious application

```powershell
> $(Resolve-Path .\file.exe:stream)
```

More about it:

* [Introduction to Alternate Data Streams](https://www.malwarebytes.com/blog/news/2015/07/introduction-to-alternate-data-streams)
</div></div>

<hr class="sep-both">

## Random

<div class="row row-cols-md-2 mt-4"><div>

* ➡️ **AlwaysInstallElevated**: it's possible that an admin allowed programs to be installed without needed Administrator privilege, i.e. without the User Account Control (UAC) popup. If both are set, then you found a golden fish 🎣

```java
PS> reg query HKCU\SOFTWARE\Policies\Microsoft\Windows\Installer
PS> reg query HKLM\SOFTWARE\Policies\Microsoft\Windows\Installer
PS> msiexec /quiet /qn /i $Env:TMP\malicious.msi
```
</div><div>
</div></div>

<hr class="sep-both">

## 👻 To-do 👻

Stuff that I found, but never read/used yet.

<div class="row row-cols-md-2"><div>

Tools

* [LOLBAS](https://github.com/LOLBAS-Project/LOLBAS) (4.8k ⭐): exploit Windows executables
* [adPEAS](https://github.com/61106960/adPEAS) (0.4k ⭐)
* [wmic](https://learn.microsoft.com/en-us/windows-server/administration/windows-commands/wmic): a deprecated console since Windows 10 21H1

Checklists

* [UltimateAppLockerByPassList](https://github.com/api0cradle/UltimateAppLockerByPassList) (1.5k ⭐)
* [Active Directory Exploitation Cheat Sheet](https://github.com/S1ckB0y1337/Active-Directory-Exploitation-Cheat-Sheet) (3.4k ⭐)
* [frizb](https://github.com/frizb/Windows-Privilege-Escalation) (0.7k ⭐)
</div><div>

* `/Windows/System32/config/`: location where the Security Account Manager (**SAM**) database file is stored. This file is used to store users, their passwords, their groups... Modern versions of Windows use the NT hash format, commonly referred to as NTLM, as the previous format was LM.
* [Windows credential guard](https://learn.microsoft.com/en-us/windows/security/identity-protection/credential-guard/credential-guard-how-it-works)
</div></div>

<hr class="sep-both">

## 👻 To-do 👻

Stuff that I found, but never read/used yet.

<div class="row row-cols-md-2"><div>

* [Mercurial-Grabber](https://github.com/NightfallGT/Mercurial-Grabber) (a [real](https://blog.cyble.com/2022/01/18/mercurial-grabber-malware-builder/) malware to steal credential)
* [discoon](https://github.com/RadonCoding/discoon) (another potential real malware)
* [powercat](https://github.com/besimorhino/powercat)
</div><div>

</div></div>