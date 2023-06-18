# Users management

...

<hr class="sep-both">

## 👻 To-do 👻

Stuff that I found, but never read/used yet.

<div class="row row-cols-md-2"><div>

Access control

* Discretionary Access Control (DAC): the owner of a resource define access rights for others. Ex: Unix File System.
* Mandatory Access Control (MAC): access based on labels assigned to subjects (ex: users) and objects (ex: files), allowed by a central entity
* Role-Based Access Control (RBAC): each role is given permissions, and users are given roles based on what they do in the organization.
* Rule-Based Access Control (RBAC): rules that determine what someone can do based on who they are <small>(ex: IP...)</small>
  * RB-RBAC and not RBAC?
  * if condition then permission (mails to folder)
* Time-Based Access Control (TAC): access is granted during an interval of time <small>(ex: working hours)</small>
* ABAC: based on the value of the request attributes, resources, env
* XACML

➡️ Tell users when they are not allowed to access something, or when it is monitored, and when it can lead to prosecution.
</div><div>

IAM

* Identify and Access management (IAM/GIA)
* Has a lifecycle
* Authorization creep: remove previous roles/lifecycle
* Privileged Identity Management (PIM): from organization role to system role
* Privileged Access Management (PAM): manage the role that a privileged user has.

Others

* Password policy
  * Length, Complexity, Periodic updates, Lock, History... 
  * Lock accounts for X minutes of inactivity 
  * Add strong authentication (two-factor/MFA)
  * [yubico](https://www.yubico.com/)
  * Google Passkeys / Windows Hello / iCloud Passkeys
  * Something you know, have, are
  *  For root/administrator accounts, the password should be updated regularly, and its usage should be justified.
* [Username policy](https://en.wikipedia.org/wiki/Wikipedia:Username_policy#Inappropriate_usernames)
</div></div>