# XXX

[![windowsfundamentals3xzx](../../../cybersecurity/_badges/thm/windowsfundamentals3xzx.svg)](https://tryhackme.com/room/windowsfundamentals3xzx)

<div class="row row-cols-lg-2"><div>

...
</div><div>

...
</div></div>

<hr class="sep-both">

## 👻 To-do 👻

Stuff that I found, but never read/used yet.

<div class="row row-cols-lg-2"><div>

[![windowsfundamentals2x0x](../../../cybersecurity/_badges/thm/windowsfundamentals2x0x.svg)](https://tryhackme.com/room/windowsfundamentals2x0x)
[![windowsfundamentals3xzx](../../../cybersecurity/_badges/thm/windowsfundamentals3xzx.svg)](https://tryhackme.com/room/windowsfundamentals3xzx)

* lusrmgr.msc: can be used to find entrypoints (weak passwords, groups with too many perms)
* msconfig (find malware?)/winver (outdated?)/control system (open ports...)/msinfo32 (outdated?)/compmgmt (scheduled tasks...)/regedit (misconfiguration...): info can help in find vulnerabilities
* lsass (bypass?)/UserAccountControlSettings: identify weakness
* Process Explorer
* Sysinternals Suite
* PowerSploit...
* Mimikatz...
* Microsoft Security Compliance Toolkit (SCT)
* CIS-CAT
* SAM database
* Microsoft Defender Application Control
* device guard
* applocker
* Hiren's bootcd
* [SASE](https://www.microsoft.com/en-us/security/business/security-101/what-is-sase)
* sysmon

<details class="details-n">
<summary>Alternate Data Streams (ADS)</summary>

<div class="row row-cols-lg-2"><div>

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
</details>


<details class="details-n">
<summary>Volume Shadow Copy Service (VSS)</summary>

<div class="row row-cols-lg-2"><div>

The Volume Shadow Copy Service (VSS) is handling the creation, and management of **shadow copies**/**snapshot** of the data backed up.

They are stored in the volume information of each drive that has the feature enabled.

They may allow a system admin to restore the system after an attack. So, hackers will most likely check them, and delete them. There may exist an "offline" version of these shadow copies.
</div><div>

To manage them

* Right-click on a hard-drive
* Select Shadow copies

> See [Volume Shadow Copy Service](https://learn.microsoft.com/en-us/windows-server/storage/file-server/volume-shadow-copy-service)
</div></div>
</details>
</div><div>

* `/Windows/System32/config/`: location where the Security Account Manager (**SAM**) database file is stored. This file is used to store users, their passwords, their groups... Modern versions of Windows use the NT hash format, commonly referred to as NTLM, as the previous format was LM.
* [Windows credential guard](https://learn.microsoft.com/en-us/windows/security/identity-protection/credential-guard/credential-guard-how-it-works)

**Windows Update** (`control /name Microsoft.WindowsUpdate`)

A service looking for updates, downloading them, and asking <small>(forcing since Windows 10)</small> the user to install them. They are usually released on the 2nd Tuesday of each month (Patch Tuesday).

**Windows security** / **Windows defender**

A set of tools to protect your Windows. There is an antivirus, which has a "ransomware protection" feature. There is a firewall to set rules for your network traffic. [SmartScreen](https://learn.microsoft.com/en-us/windows/security/threat-protection/microsoft-defender-smartscreen/microsoft-defender-smartscreen-overview) was designed to protect against phishing or malware, and there is a tab with security features such as Core isolation.

**BitLocker**

The Trusted Platform Module (TPM) hardware component provides security against tampering along with many other things. BitLocker was designed "to help protect user data and to ensure that a computer has not been tampered with while the system was offline", as per [Microsoft](https://docs.microsoft.com/en-us/windows/security/information-protection/bitlocker/bitlocker-overview).

* backup the SAM and SYSTEM hashes
    * `reg save hklm\system C:\XXX\system.hive`
    * `reg save hklm\sam C:\XXX\sam.hive`
* Windows Defender Firewall
  * Block access to share if not in the same workgroup?
</div></div>