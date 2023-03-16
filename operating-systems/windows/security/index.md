# XXX

<hr class="sep-both">

## 👻 To-do 👻

Stuff that I found, but never read/used yet.

<div class="row row-cols-md-2"><div>

* lusrmgr.msc: can be used to find entrypoints (weak passwords, groups with too many perms)
* msconfig (find malware?)/winver (outdated?)/control system (open ports...)/msinfo32 (outdated?)/compmgmt (scheduled tasks...)/regedit (misconfiguration...): info can help in find vulnerabilities
* lsass (bypass?)/UserAccountControlSettings: identify weakness
* Process Explorer
* Sysinternals Suite
* PowerSploit...
* Mimikatz...
* Microsoft Security Compliance Toolkit (SCT)
* CIS-CAT
</div><div>

**Windows Update** (`control /name Microsoft.WindowsUpdate`)

A service looking for updates, downloading them, and asking <small>(forcing since Windows 10)</small> the user to install them. They are usually released on the 2nd Tuesday of each month (Patch Tuesday).

**Windows security** / **Windows defender**

A set of tools to protect your Windows. There is an antivirus, which has a "ransomware protection" feature. There is a firewall to set rules for your network traffic. [SmartScreen](https://learn.microsoft.com/en-us/windows/security/threat-protection/microsoft-defender-smartscreen/microsoft-defender-smartscreen-overview) was designed to protect against phishing or malware, and there is a tab with security features such as Core isolation.

**BitLocker**

The Trusted Platform Module (TPM) hardware component provides security against tampering along with many other things. BitLocker was designed "to help protect user data and to ensure that a computer has not been tampered with while the system was offline", as per [Microsoft](https://docs.microsoft.com/en-us/windows/security/information-protection/bitlocker/bitlocker-overview).
</div></div>