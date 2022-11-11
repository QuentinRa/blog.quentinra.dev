# Compromise a Windows host

[![windowsfundamentals1xbx](../../_badges/thm/windowsfundamentals1xbx.svg)](https://tryhackme.com/room/windowsfundamentals1xbx)
[![windowsfundamentals2x0x](../../_badges/thm/windowsfundamentals2x0x.svg)](https://tryhackme.com/room/windowsfundamentals2x0x)
[![windowsfundamentals3xzx](../../_badges/thm/windowsfundamentals3xzx.svg)](https://tryhackme.com/room/windowsfundamentals3xzx)
[![retro](../../_badges/thm/retro.svg)](https://tryhackme.com/room/retro)
[![blue](../../_badges/thm/blue.svg)](https://tryhackme.com/room/blue)
[![ice](../../_badges/thm/ice.svg)](https://tryhackme.com/room/ice)
[![blaster](../../_badges/thm/blaster.svg)](https://tryhackme.com/room/blaster)

<hr class="sep-both">

## Knowledge about Windows

*It will, most likely, not change your life much if you know this, but, it's interesting I think.*

<div class="row row-cols-md-2"><div>

**File system**

Modern versions of Windows are using the New Technology File System (**NTFS**). Before, FAT16/32, and HPFS were used. FAT is still used for stuff like USB keys. NTFS is a file system that can repair itself in case of failure, using logs. It's known as a journaling file system.

**Task Manager** (`taskmgr`)

* Shortcut: <kbd>CTRL+SHIFT+ESC</kbd>
* List running processes
* This guide is quite complete [Windows Task Manager](https://www.howtogeek.com/405806/windows-task-manager-the-complete-guide/)

**Control panel** (`control`)

* This is the entry point to most settings
* In the top-right corner, it's possible to switch to another view <small>(ex: small icons)</small>, in which you may discover menus that you never opened before, but may but useful one way or another.

**Windows Update** (`control /name Microsoft.WindowsUpdate`)

A service looking for updates, downloading them, and asking <small>(or, forcing since Windows 10)</small> the user to install them. They are typically released on the 2nd Tuesday of each month (Patch Tuesday), unless there is an important patch.

**Windows security** / **Windows defender**

A set of tools to protect your Windows. There is an antivirus, which has a "ransomware protection" feature. There is a firewall to set rules for your network traffic. [SmartScreen](https://learn.microsoft.com/en-us/windows/security/threat-protection/microsoft-defender-smartscreen/microsoft-defender-smartscreen-overview) was design to protects against phishing or malware, and there is a tab with security features such as Core isolation.
</div><div>

**Users**

* `Administrator`: manage users, apps, groups, system-wide settings...
* `Standard User`: can use apps, can access their files

When there is a need for a user to elevate, Windows will show the User Account Control (UAC), in which a root user can press "yes", and a non-root user will have to log in using an account having sufficient privileges to do the requested action.

There is one funny/easy exploit using UAC to get root: [CVE-2019-1388](https://github.com/nobodyatall648/CVE-2019-1388).

**Permissions**

Windows has 7 categories of permissions: Read, Write, Read & Execute, List Folder Contents, Modify, Full Control. You can learn more about them in this [article](https://learn.microsoft.com/en-us/previous-versions/windows/it-pro/windows-2000-server/bb727008(v=technet.10)#understanding-file-and-folder-permissions). Permissions are controlled by Discretionary Access Control List (DACLs), see the `icacls` command.

The administrator can set permissions for a group, and users may be in multiple groups.

**BitLocker**

The Trusted Platform Module (TPM) hardware component providing security against tampering, or many other things. BitLocker was designed "to help protect user data, and to ensure that a computer has not been tampered with while the system was offline", as per [Microsoft](https://docs.microsoft.com/en-us/windows/security/information-protection/bitlocker/bitlocker-overview).
</div></div>

<hr class="sep-both">

## Windows handy commands

*For a complete list of commands, you may check [Windows server shell reference](https://learn.microsoft.com/en-us/windows-server/administration/windows-commands/windows-commands).*

<div class="row row-cols-md-2"><div>

Most Linux commands are available, although they are aliases to Windows commands

* `cd`: move to another folder
* `ls`: list files in a folder
* `pwd`: path to the current directory
* `cat`: print (usually small) files
* `find`: find a file/folder
* `wget`: download something
* `clear`: clear the terminal
* `gcm command`: find the executable given a command ([source](https://stackoverflow.com/questions/304319/is-there-an-equivalent-of-which-on-the-windows-command-line))

cmd commands

* `cd` / `find`
* `dir`: same as ls
* `type`: same as cat
* `cls`: same as clear

Open a Windows shell

* `powershell`: Linux-friendly console
* `cmd`: The traditional Windows console. Most commands in this course won't work on it. CMD options are usually like `/xxx`.
* `wmic` ([doc](https://learn.microsoft.com/en-us/windows-server/administration/windows-commands/wmic)): a deprecated console since Windows 10 21H1 
</div><div>

Learn more about your environment

* `whoami`: see your username, or `NT AUTHORITY\SYSTEM` (root)
* `whoami /groups`: see your groups
* `hostname`: see hostname
* `ipconfig`: network configuration
* `netstat`: monitor network traffic
* `systeminfo`: see infos about the system
* `Get-ChildItem -Path Env:`: see environment variables
* `$Env:windir`: print the value of one environment variable
* `$Env:xxx = 'yyy'`: set an environment variable

Infos on a Local Machine

* `Get-LocalGroup`: list groups (users, administrators...)
* `Get-LocalUser`:list users
* `net localgroup users`:list users in the group "users"
* `net localgroup administrators`: list administrators
* `net user username`: infos about an user

> **Get help**: `help command`, `command help`, `command /?`, or `command /help`.
</div></div>

<hr class="sep-both">

## Windows environment

*Note that you may not be able to use Linux paths such as `/` instead of `c:\\`, as I'm using bellow.*

<div class="row row-cols-md-2"><div>

**Look for (sensitive?) information** 🔑

* `cd /`: the root, maybe you will find something interesting?
* `/Users`: usually, each folder is associated with a user
  * `/Users/xxx/Desktop`
  * `/Users/xxx/Documents`
  * You should also check the trash-box
  * Check browser history / credentials...
* Maybe check `%appdata%`

<br>

**Windows files** <small>(it may not be `/Windows`, see `$Env:windir`/`$Env:systemroot`)</small>

* in a file explore, enter `%windir%` (or `%systemroot%`)
* `/Windows/System32/config/`: location where the **Security Account Manager** (**SAM**) database file is stored. This file is used to store users, their passwords, their groups... Modern versions of Windows use the NT hash format, commonly referred as NTLM, as the previous format was LM.
</div><div>

**Windows services** <small>(usually use "Win✖️R" to open one)</small>. These are shortcuts to find in one action the menu you are looking for. Note that extension such as ".exe", or ".msc" are optional.

* `lusrmgr.msc`: list of users/groups
* `msconfig`: see services, manage system configurations
* `lsass` is responsible for authentication within Windows. There is [mimikatz/kiwi](https://github.com/gentilkiwi/mimikatz) (16.2k ⭐) to extract passwords from the memory. For instance, if there is a task running belonging to a user, even if they are not logged in, we can get their password.
* `winver`: show Windows version+build, and licence holder.
* `control system`: open system info (Device/Windows specifications)
* `msinfo32`: system info (raw, can search) + hardware and services
* `UserAccountControlSettings`: change UAC settings
* `compmgmt` is responsable for managing **shares**, **running tasks**, **listing events** ([doc](https://learn.microsoft.com/en-us/windows/win32/eventlog/event-types), monitor performance (`perfmon`/`resmon`), or even manage device hardware/services. 
* `regedt32/regedit`: open Windows registry, a database used to store information needed to configure the system for users/applications/devices <small>(ports in use, applications...)</small>. See the [doc](https://learn.microsoft.com/en-us/troubleshoot/windows-server/performance/windows-registry-advanced-users).

<br>

**Random**

* Kerberos is the authentication system in Windows domains.
</div></div>

<hr class="sep-both">

## Windows privilege escalation

<div class="row row-cols-md-2"><div>

Privilege escalation refer to a process of obtaining super-administrator (a.k.a. Administrator) privileges, starting from a regular user.

* [LOLBAS](https://github.com/LOLBAS-Project/LOLBAS) (4.8k ⭐): similar to GTFOBins on Linux, exploit the Windows executables 
</div><div>

Scripts

* [WinPeas](https://github.com/carlospolop/PEASS-ng/tree/master/winPEAS) (10.5k ⭐)
* [PrivescCheck](https://github.com/itm4n/PrivescCheck) (1.8k ⭐)
* There was [PowerUp](https://github.com/HarmJ0y/PowerUp) (222⭐) that was deprecated over [PowerTools](https://github.com/PowerShellEmpire/PowerTools/tree/master/PowerUp) (1.8k ⭐) that was deprecated again over [PowerSploit](https://github.com/PowerShellMafia/PowerSploit/tree/master/Privesc) (10k ⭐) which is now archived 😂

Guides

* [Windows-Privilege-Escalation](https://github.com/frizb/Windows-Privilege-Escalation) (641 ⭐)
</div></div>

<hr class="sep-both">

## Volume Shadow Copy Service (VSS)

<div class="row row-cols-md-2"><div>

The Volume Shadow Copy Service (VSS) is handling the creation, and management of **shadow copies**/**snapshot** of the data backed up.  They are stored in the volume information of each drive that has the feature enabled.

They may allow a system admin to restore the system after an attack. So, hackers will most likely check them, and delete them. There may exist a "offline" version of these shadow copies.
</div><div>

To manage them

* Right-click on a hard-drive
* Select Shadow copies

> See [Volume Shadow Copy Service](https://learn.microsoft.com/en-us/windows-server/storage/file-server/volume-shadow-copy-service)
</div></div>

<hr class="sep-both">

## Alternate Data Streams (ADS)

<div class="row row-cols-md-2"><div>

On a file system using NTFS, ADS allow files to have more than one stream (`flux`) of data. By default, every file has only one stream: **:$DATA**. You can inspect a file using

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

They can be used by Windows to store data, such as identifier on a file telling the operating system that this file was download from the Internet.

Hackers can use that to store malicious code inside a file. They can execute it like this later, for instance using a legit/non-malicious application

```powershell
> $(Resolve-Path .\file.exe:stream)
```

More about it:

* [Introduction to Alternate Data Streams](https://www.malwarebytes.com/blog/news/2015/07/introduction-to-alternate-data-streams)
</div></div>

<hr class="sep-both">

## Active directory

<div class="row row-cols-md-2"><div>

You can acquire NTHash/NTLM hashes by dumping the SAM database, from the Active Directory database: `NTDS.dit`.
</div><div>

[Active Directory Exploitation Cheat Sheet](https://github.com/S1ckB0y1337/Active-Directory-Exploitation-Cheat-Sheet) (3.4k ⭐)
</div></div>