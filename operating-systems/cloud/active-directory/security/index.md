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

You can also use [cme](/cybersecurity/red-team/tools/cracking/auth/cme.md)/[nxc](/cybersecurity/red-team/tools/cracking/auth/cme.md) which automatically dump it:

```ps
$ nxc smb IP -u 'username' -p 'password' --ntds
```
</div><div>

#### Kerberos

[![password_attacks](../../../../cybersecurity/_badges/htb/password_attacks.svg)](https://academy.hackthebox.com/course/preview/password-attacks)

Kerberos is a protocol used to provide secure authentication over non-secure networks. It replaces NTLM and NetNTLM.

When a user logs in, their password is hashed and sent to Kerberos server along with the timestamp for verification. Upon successful login, the server generates a **ticket-granting ticket (TGT)** 🎫.

When the user wants to access a network resource, such as a shared folder or a database, the computer requests a ticket from the Key Distribution Center (KDC) using the TGT. If the request is accepted, the KDC will give them a **Ticket Granting Service (TGS)** 🎟️ that they can use solely for the requested service.
</div></div>

<hr class="sep-both">

## 👻 To-do 👻

Stuff that I found, but never read/used yet.

<div class="row row-cols-lg-2"><div>

* BloodHound (map AD environment, identify attack paths/priv. esc.)
* Strong password policy
* prevent access to dangerous websites
* [adPEAS](https://github.com/61106960/adPEAS) (0.4k ⭐)
* [UltimateAppLockerByPassList](https://github.com/api0cradle/UltimateAppLockerByPassList) (1.5k ⭐)
* [Active Directory Exploitation Cheat Sheet](https://github.com/S1ckB0y1337/Active-Directory-Exploitation-Cheat-Sheet) (3.4k ⭐)
* [AD mindmap orange](https://orange-cyberdefense.github.io/ocd-mindmaps/)
* [kerbrute](https://github.com/ropnop/kerbrute)
* [DPAT](https://github.com/clr2of8/DPAT)/[NtdsAudit](https://github.com/dionach/NtdsAudit)
* [kerbrute](https://github.com/ropnop/kerbrute) + [username_generator](https://github.com/shroudri/username_generator)
</div><div>

* Hardening AD ([ref](https://blog.netwrix.fr/2019/05/06/securiser-votre-annuaire-ad-contre-les-attaques-de-malware/))
* [Hacking Active Directory](https://tryhackme.com/module/hacking-active-directory)
* `\\<domain_controller>\NETLOGON` (share, store logon scripts/...)

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