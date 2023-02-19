# Security Architecture

<div class="row row-cols-md-2"><div>

Security architecture is the process of designing and oversee the implementation of security controls within an organization's IT infrastructure to protect IT assets for harmful actions such as unauthorized access modification or deletion, data disclosure...

Cybersecurity architects are responsible for identifying potential security risks and recommending measures <small>(software, hardware, peoples...)</small> to strengthen the security architecture of the IT infrastructure, **and align with the organization strategy goals and objectives** ✅.

Frameworks like SABSA and TOGAF are methodologies to implement security architecture. 

Additionally, some controls may be enforced:

* 👉 Regulations according to the activity <small>(ex: PCI DSS or HIPAA)</small>
* 👉 Guidelines or industry standards
  * ISO
  * NIST, NSA
  * CIS Security
  * SANS <small>(see: critical security controls...)</small>
  * Providers <small>(ex: Cisco...)</small>
</div><div>

<div class="text-center">

Pillars
</div>

👉 **The security triad (CIA)** is a famous principle used everywhere in security. The opposite is DAD <small>(Disclosure, Alternation, and Destruction)</small>.

* Confidentiality: only those allowed can access resources
* Integrity: only allowed modification can modify resources 
* Availability: resources are available when needed

There is also the french "DICAI" model that extends CIA with Authentication and Identification <small>(verify the identity of users)</small>, and Irrevocability <small>(once performed, cannot be undone)</small>.

👉 **Defense-in-depth** 🕸️: use of multiple layers of security, along with various tactics, to slow down/stop an intruder

👉 **Triple-A principles** 🔒: Authentication <small>(verify the identity)</small>, Authorization <small>(determine the permissions)</small>, and Accounting <small>(logs)</small>.

👉 **Zero trust** 🔎: do not trust anyone/anything, verify everything.

👉 **Principle of least privilege** 👮: everyone, regardless of their role in the company <small>(CEO...)</small>, should have the least privilege that they require to do their job.
</div></div>

<hr class="sep-both">

## Mindset

<div class="row row-cols-md-2 mt-3"><div>

It's important that before thinking about "security" or what makes something "secure", a security architect must think what values it has for the company.

This is done by identifying [risks](/cybersecurity/blue-team/risk.md), prioritizing them, and evaluating their impact along the cost to mitigate them under an acceptable level of risk. Based on these, the security architect will implement more or less security controls as long as "it is worth it".

* The losses are significant
* The losses are not lower than the cost to set up controls
</div><div>

👉 You should view security as a way to enable business, and not preventing it.

👉 Security give a competitive value to product. For instance, by providing a secure way for customers to do purchases on their smartphone, they can increase its value on the market.

👉 Security is essential for cooperation between business. For instance, a company must trust another company that the data they share with them is properly secured/managed.
</div></div>

<hr class="sep-both">

## Security controls

<div class="row row-cols-md-2"><div>

The security architect need to have a broad view of the organization as they will interact with everyone, not only the IT service.

They will have to understand the security needs of the organization, and create principles, policies, guidelines, and standards to design and implement the necessary security controls.
</div><div>

Security controls can be technical or procedural, physical or digital, and should include the cloud and IoT devices.

❌️ Following a checklist is unlikely to meet the business needs or provide real benefits. A security architect mustn't only rely on it, as they need to more sophisticated approach balancing the needs and requirements, risks, and technologies with the security.
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

<details class="details-n">
<summary>Random guidelines</summary>

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
</details>
</div><div>

* BCP (Business continuity Plan)
* DRP (Disaster Recovery Plan?)
* SLAs (Service Level Agreement)
* SLOs (Service Level Objectives)
* SLIs (Server Level Indicators)
* RTO (Recovery Time Objectives)
* RPO (Recovery Point Objective)

<details class="details-n">
<summary>Access Control</summary>

Access control is the process of managing access to resources in a computer system or network using policies and rules.

➡️ ACLs, Access Control Lists, are a specific implementation of access control for a specific resource.

There are multiple access control models, why may be combined in a defense-in-depth strategy.

* **Discretionary Access Control (DAC)**: the owner of a resource define access rights for others. Ex: Unix File System.

* **Mandatory Access Control (MAC)**: access based on labels assigned to subjects (ex: users) and objects (ex: files).

* **Role-Based Access Control (RBAC)**: each role is given permissions, and users are given roles based on what they do in the organization.

* **Rule-Based Access Control (RBAC)**: rules that determine what someone can do based on who they are <small>(ex: IP...)</small>

* **Time-Based Access Control (TAC)**: access is granted during an interval of time <small>(ex: working hours)</small>
</details>

</div></div>