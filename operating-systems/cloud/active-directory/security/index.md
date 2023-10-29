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

## Kerberos

<div class="row row-cols-lg-2"><div>

Kerberos is a protocol used to provide secure authentication over non-secure networks. It replaces NetNTLM.

When a user logs in, their credentials are sent to the Kerberos server for verification. Upon successful login, the server generates a **ticket-granting ticket (TGT)** 🎫.

When the user wants to access a network resource, such as a shared folder, the computer requests the Kerberos server using the TGT and requests access. If the request is accepted, the Kerberos server will give them a **Ticket Granting Service (TGS)** 🎟️.
</div><div>
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
* [kerbrute](https://github.com/ropnop/kerbrute)
</div><div>

* Hardening AD ([ref](https://blog.netwrix.fr/2019/05/06/securiser-votre-annuaire-ad-contre-les-attaques-de-malware/))
* [Hacking Active Directory](https://tryhackme.com/module/hacking-active-directory)

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
</div></div>