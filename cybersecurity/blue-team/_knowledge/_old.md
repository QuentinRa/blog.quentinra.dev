# Old

<hr class="sep-both">

## 👻 To-do 👻

Stuff that I found, but never read/used yet.

<div class="row row-cols-md-2"><div>

* [getcybersafe](https://www.getcybersafe.gc.ca/en)
* CIS (cyber-defense, hardening kits - build kit content)
* ShadowServer
* Threatmap
* HACKING GOOGLE series
* XCCDF (Extensible Configuration Checklist Description Format)

MFA

* [yubico](https://www.yubico.com/)
* Google Passkeys / Windows Hello / iCloud Passkeys
* Something you know, have, are

R

* **Advanced Persistent Threat** (APT): usually, a hacker wants to remain as long as possible within an infected network. They are using backdoors, and keep updating the code to avoid being discovered.
* **Endpoint Detection and Response** (EDS)
* **Deceptive security**

Endpoint Protection

* antivirus
* anti-malware
* intrusion prevention

CMDB

* Configuration Managment Database
* inventory software/hardware/... basically every asset?
* auto-discovery?
* lansweeper
</div><div>

* [Security Control Framework](https://securecontrolsframework.com/)
* Identify and Access management (IAM/GIA) - **Lifecycle** (Authorization creep - remove previous roles/lifecycle)
* XACML
* The five "As" in security

Least privilege

* Privileged Identity Management (PIM): from organization role to system role
* Privileged Access Management (PAM): manage the role that a privileged user has.

[![redteamfundamentals](../../_badges/thm/redteamfundamentals.svg)](https://tryhackme.com/room/redteamfundamentals)

* red-team simulate enough [TTPs](https://csrc.nist.gov/glossary/term/Tactics_Techniques_and_Procedures) for the blue team to learn to react
* MITRE ATT&CK Framework

[![adventofcyber4](../../_badges/thm/adventofcyber4/day1.svg)](https://tryhackme.com/room/adventofcyber4)

* Cybersecurity Framework (CSF) by NIST
* MITRE ATT&CK Framework (TTPs, [mitre](https://tryhackme.com/room/mitre))

Threat intelligence

[![defensivesecurityhq](../../_badges/thm/defensivesecurityhq.svg)](https://tryhackme.com/room/defensivesecurityhq)

* Cisco Talos Intelligence <small>(Threat intelligence platform)</small>
* internxt <small>(security tools/services)</small>
* Open Threat Exchange (OTX) <small>(Threat intelligence platform)</small>
* secalerts <small>(Threat intelligence platform)</small>
* stack.watch <small>(web apps monitoring)</small>
* cyware <small>(Threat intelligence platform)</small>
* [pulsedive](https://pulsedive.com/)
* fireeye

<details class="details-n">
<summary>SOC/Threat intelligence/hunting/modeling</summary>

[![defensivesecurityhq](../../_badges/thm/defensivesecurityhq.svg)](https://tryhackme.com/room/defensivesecurityhq)

* Security Operation Center (SOC): a team of cybersecurity professionals working 24/7 <small>(detect unusual activity, vulnerabilities, intrusions, violations, training/awareness)</small>. They are using the firewall/DNS/DHCP/... logs, Network security monitoring (NSM), and they might use a SIEM.
</details>

<details class="details-n">
<summary>Random Security Controls</summary>

YYY

* Block an IP after $n$ failed attempts within $x$ seconds
* Use a strong password policy
* Delay authentication attempts (throttle) to slow down attacks
* Use a CAPTCHA while taking into account that they are services to "bypass" them
* Use two-Factor authentication

ZZZ

* "root", "bin", "adm", "operator", "admin", "administrator", "bureaucrat", "steward", "checkuser", "oversight", "sysop", "bot", etc.
* [username policy](https://en.wikipedia.org/wiki/Wikipedia:Username_policy#Inappropriate_usernames)

XXX

* Set up a robust password policy
    * Length, Complexity, Periodic updates, Lock, History...
    * Lock accounts for X minutes of inactivity
    * Add strong authentication (two-factor/MFA)
* Secure external devices
    * Disable booting using an external device
    * Detect and prevent them to install something/be installed
    * Use an antivirus to scan them
    * Forbid the use of local printers <small>(over secured network printers)</small>
    * Disable autorun <small>(execution of code)</small> when connecting devices
* User permissions
    * Setup access control <small>(no excessive privileges, no shared accounts...)</small>. Only administrator should be allowed to disable/configure security-related tools.
    * Ask for a password to edit BIOS configuration
    * Disallow to remotely start a device
    * Disable unneeded programs and services
    * Disable/Limit the use of local user accounts <small>(if not required)</small>
    * Do not give admin privilege to local accounts <small>(unless required)</small>
    * Ensure we can't use a workstation without a password
    * Limit access to the Windows registry

➡️ For root/administrator accounts, the password should be updated regularly, and its usage should be justified.

➡️ Tell users when they are not allowed to access something, or when it is monitored, and when it can lead to prosecution.
</details>
</div></div>