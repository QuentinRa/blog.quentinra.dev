# Architecture guidelines

<div class="row row-cols-md-2"><div>

A cybersecurity architect design and oversee the implementation of security solutions within an organization's IT infrastructure.

Cybersecurity architects are responsible for identifying potential security risks and recommending measures to strengthen the security architecture of the IT infrastructure.

* 👉 Refer to regulations <small>(ex: PCI DSS or HIPAA)</small>
* 👉 Follow guidelines
  * NIST, NSA
  * CIS Security
  * SANS <small>(see: critical security controls...)</small>
  * Providers <small>(ex: Cisco...)</small>

</div><div>

* **Defense-in-depth** 🕸️: use of multiple layers of security, along with various tactics, to slow down/stop an intruder

* **Triple-A principles** 🔒: Authentication <small>(verify the identity)</small>, Authorization <small>(determine the permissions)</small>, and Accounting <small>(logs)</small>.

* **Zero trust** 🔎: do not trust anyone/anything, verify everything.

* **Principle of least privilege** ✅: everyone, regardless of their role in the company <small>(CEO...)</small>, should have the least privilege that they require to do their job.
</div></div>

<hr class="sep-both">

## Random guidelines

<div class="row row-cols-md-2 mt-3"><div>

**General practices/strategies**

* Setup [logging and monitoring](/cybersecurity/blue-team/logs.md)
* Use secure wireless networks <small>(if applicable)</small>
* Set up a robust password policy
  * Length, Complexity, Periodic updates, Lock, History...
  * see [Active Directory - Password Policy](/operating-systems/windows/active-directory/index.md#password-and-encryption)
  * Lock accounts for X minutes of inactivity
  * Add strong authentication (two-factor/MFA)

➡️ High-security environments usually use integrity checking tools such as Tripwire, Samhain, OSSEC, or AIDE. They monitor, detect, and analyze changes to system configurations.

➡️ You must do your best to reduce the attack surface. This is mostly done by applying principle like the principle of least privilege, to reduce the risk of lateral movements...

**External devices**

* Disable booting using an external device
* Detect and prevent them to install something/be installed
* Use an antivirus to scan them
* Forbid the use of local printers <small>(over secured network printers)</small>
* Disable autorun <small>(execution of code)</small> when connecting devices
* Change the password of ALL wireless devices.
</div><div>

**User permissions**

* Setup access control <small>(no excessive privileges, no shared accounts...)</small>. Only administrator should be allowed to disable/configure security-related tools.
* Ask for a password to edit BIOS configuration
* Disallow to remotely start a device
* Disable unneeded programs and services
* Disable/Limit the use of local user accounts <small>(if not required)</small>
* Do not give admin privilege to local accounts <small>(unless required)</small>
* Ensure we can't use a workstation without a password
* Limit access to the Windows registry

➡️ For root/administrator accounts, the password should be updated regularly, and its usage should be justified.

➡️ Tell users when their are not allowed to access something, or when it is monitored, and when it can lead to prosecution.

➡️ There must be a balance between security and operation needs. The security should not be too much of a burden.

**Networking**

See attacks and mitigation in [Network Security](/operating-systems/networking/security/index.md).

</div></div>
<hr class="sep-both">

## Access control

<div class="row row-cols-md-2"><div>

Access control is the process of managing access to resources in a computer system or network using policies and rules.

➡️ ACLs, Access Control Lists, are a specific implementation of access control for a specific resource.

There are multiple access control models, why may be combined in a defense-in-depth strategy.

* **Discretionary Access Control (DAC)**: the owner of a resource define access rights for others. Ex: Unix File System.
</div><div>

* **Mandatory Access Control (MAC)**: access based on labels assigned to subjects (ex: users) and objects (ex: files).

* **Role-Based Access Control (RBAC)**: each role is given permissions, and users are given roles based on what they do in the organization.

* **Rule-Based Access Control (RBAC)**: rules that determine what someone can do based on who they are <small>(ex: IP...)</small>

* **Time-Based Access Control (TAC)**: access is granted during an interval of time <small>(ex: working hours)</small>
</div></div>

<hr class="sep-both">

## 👻 To-do 👻

Stuff that I found, but never read/used yet.

<div class="row row-cols-md-2"><div>

* PPTP
* MS CHAP V2
* WAF/DBDS
* IDS/IPS ([snort](https://www.snort.org/), [suricata](https://suricata.io/), [pfsense](https://www.pfsense.org/))
* HIPS/HIDS (Host) and Anti-malwares/EDR 
* NIDS/NIPS (Network)
</div><div>

* BCP (Business continuity Plan)
* DRP (Disaster Recovery Plan?)
* SLAs (Service Level Agreement)
* SLOs (Service Level Objectives)
* SLIs (Server Level Indicators)
* RTO (Recovery Time Objectives)
* RPO (Recovery Point Objective)

</div></div>