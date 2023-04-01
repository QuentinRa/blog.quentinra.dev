# Blue team

<div class="row row-cols-md-2"><div>

...
</div><div>

...
</div></div>

<hr class="sep-both">

## 👻 To-do 👻

Stuff that I found, but never read/used yet.

<div class="row row-cols-md-2"><div>

* BCP (Business continuity Plan)
* DRP (Disaster Recovery Plan?)
* SLAs (Service Level Agreement)
* SLOs (Service Level Objectives)
* SLIs (Server Level Indicators)
* RTO (Recovery Time Objective): max interruption duration allowed
* RPO (Recovery Point Objective): max data loss duration allowed (1 hour lost?)
</div><div>

<details class="details-n">
<summary>Random Security Controls</summary>


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