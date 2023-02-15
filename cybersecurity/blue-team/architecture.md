# Architecture guidelines

<div class="row row-cols-md-2"><div>

A cybersecurity architect design and oversee the implementation of security solutions within an organization's IT infrastructure.

Cybersecurity architects are responsible for identifying potential security risks and recommending measures to strengthen the security architecture of the IT infrastructure.

* **Defense in-depth**: use of multiple layers of security, along with various tactics, to slow down/stop an intruder
</div><div>

Please refer to 

* Regulations <small>(ex: PCI DSS or HIPAA)</small>
* Guidelines
  * NIST, NSA
  * CIS Security
  * SANS <small>(see: critical security controls)</small>
  * Providers <small>(ex: Cisco...)</small>
</div></div>

<hr class="sep-both">

## Workstations

<div class="row row-cols-md-2 mt-3"><div>

**General practices/strategies**

* Setup [logging and monitoring](/cybersecurity/blue-team/logs.md)
* Use secure wireless networks <small>(if applicable)</small>
* Set up a robust password policy
  * Length, Complexity, Periodic updates, Lock, History...
  * see [Active Directory - Password Policy](/operating-systems/windows/active-directory/index.md#configure-tcpip-parameters)
  * Lock accounts for X minutes of inactivity
  * Add strong authentication (two-factor/MFA)

➡️ High-security environments usually use integrity checking tools such as Tripwire, Samhain, OSSEC, or AIDE. They monitor, detect, and analyze changes to system configurations.

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
</div></div>

<hr class="sep-both">

## Networking

<div class="row row-cols-md-2 mt-3"><div>

* Disable insecure/unused protocols
* Remote connections
  * Add a timeout
  * Disable access to internet if not required
</div><div>

* Configure Windows systems TCP/IP parameters to optimize performance and security (see [Active Directory - TCP/IP](/operating-systems/windows/active-directory/index.md#configure-tcpip-parameters))
* See attacks and mitigation in [Network Architecture](/networking/architecture/index.md)
</div></div>

<hr class="sep-both">

## 👻 To-do 👻

Stuff that I found, but never read/used yet.

<div class="row row-cols-md-2"><div>

* PPTP
* MS CHAP V2
</div><div>


</div></div>