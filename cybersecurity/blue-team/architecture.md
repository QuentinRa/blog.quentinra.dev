# Architecture guidelines

<div class="row row-cols-md-2"><div>

A cybersecurity architect design and oversee the implementation of security solutions within an organization's IT infrastructure.

Cybersecurity architects are responsible for identifying potential security risks and recommending measures to strengthen the security architecture of the IT infrastructure.
</div><div>

...
</div></div>

<hr class="sep-both">

## Workstations

<div class="row row-cols-md-2 mt-3"><div>

**General**

* Setup access control
* Setup [logging and monitoring](/cybersecurity/blue-team/logs.md)

**System**

* Ask for a password to edit BIOS configuration
* Disable booting using an external device
* Disallow to remotely start a device
* Disable/Limit local user account <small>(if not required)</small>
* Do not give admin privilege to local accounts <small>(unless required)</small>
</div><div>

**User**

* Ensure we can't use a workstation without a password
* Disable unneeded programs
* Limit access to registry
* Only administrator should be allowed to disable/configure security-related tools.
* Disallow/Disable bluetooth if not required
* Use secure wireless networks <small>(if applicable)</small>
* Set up a robust password policy
  * Length, Complexity, Periodic updates, Lock, History...
  * see [Active Directory - Password Policy](/operating-systems/windows/active-directory/index.md#configure-tcpip-parameters)
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