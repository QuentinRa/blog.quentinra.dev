# Blue team

<div class="row row-cols-md-2"><div>

The blue team is specialised in defense which involves protecting the systems, proactively and not.

* 🛡️ Secure the system/business activities <small>(and document them)</small>
* 🔎 Monitor logs <small>(traffic, user activity...)</small>
* 👮 Detect and stop attacks <small>(as fast as possible)</small>
* 🚓 Do digital forensics
* 🐬 Track down hackers
* 🖋️ Do security awareness training
* 🔁 Ensure their measures/systems/... are still up-to-date
</div><div>

Some jobs in the blue team are:

* **Security Architect** 👷‍♂️: plan the security of activities and systems in accordance to the business needs and requirements.
* **Security Analyst** 📝: analyse, and remediate to issues. Develop security plans to keep the company safe, and implement them.
* **Incident responder** 🧑‍🚒: handle and remediate to incidents
* **Digital Forensics** 🔎: investigate attacks, and policies violations.
* **Malware Analyst**/**Reverse-engineer** 💥: analyse/detect malware, statically <small>(read the code)</small>, and dynamically <small>(see what it does)</small>.
* **Security researcher** 🔓: research on Linux, hashing algorithms...
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

R

* **Advanced Persistent Threat** (APT): usually, a hacker wants to remain as long as possible within an infected network. They are using backdoors, and keep updating the code to avoid being discovered.
* **Endpoint Detection and Response** (EDS)
* **Deceptive security**
</div><div>

<details class="details-n">
<summary>SOC/Threat intelligence/hunting/modeling</summary>

* Security Operation Center (SOC): a team of cybersecurity professionals working 24/7 <small>(detect unusual activity, vulnerabilities, intrusions, violations, training/awareness)</small>. They are using the firewall/DNS/DHCP/... logs, Network security monitoring (NSM), and they might use a SIEM.
* Threat Intelligence: dig information about actual and potential enemies, and prepare in case they attack you.
* Threat hunting: if a machine is suspected to have been intruded, they start hunting to confirm their assumption.
* Threat modeling: review, and improve the security measures (STRIDE, PASTA)
</details>

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