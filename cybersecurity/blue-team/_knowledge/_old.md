# Old

<hr class="sep-both">

## 👻 To-do 👻

Stuff that I found, but never read/used yet.

<div class="row row-cols-md-2"><div>

* [getcybersafe](https://www.getcybersafe.gc.ca/en)
* CIS (cyber-defense, hardening kits - build kit content)
* ShadowServer
* Threatmap
* XCCDF (Extensible Configuration Checklist Description Format)

R

* **Advanced Persistent Threat** (APT): usually, a hacker wants to remain as long as possible within an infected network. They are using backdoors, and keep updating the code to avoid being discovered.

CMDB

* Configuration Managment Database
* inventory software/hardware/... basically every asset?
* auto-discovery?
* lansweeper
</div><div>

* Network security monitoring (NSM)

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