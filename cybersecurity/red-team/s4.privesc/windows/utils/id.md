# Identification

[![windows_privilege_escalation](../../../../_badges/htb/windows_privilege_escalation.svg)](https://academy.hackthebox.com/course/preview/windows-privilege-escalation)
[![active_directory_enumeration_attacks](../../../../_badges/htb/active_directory_enumeration_attacks.svg)](https://academy.hackthebox.com/course/preview/active-directory-enumeration--attacks)
[![windowsprivesc20](../../../../_badges/thmp/windowsprivesc20.svg)](https://tryhackme.com/room/windowsprivesc20)

<div class="row row-cols-lg-2"><div>

**Users**

* `whoami`: username
* `whoami /groups`: current user groups
* `whoami /priv`: current user privileges
* `Get-LocalGroup` or `net localgroup`: list groups
* `Get-LocalUser`: list users
* `net user username`: info about a user
* `net localgroup users`: list users in the group "users"
* `net localgroup administrators`: list local administrators
* `qwinsta`: currently logged users

**Security**

* `Get-MpComputerStatus`: Windows defender status
* `sc query windefend`: Windows defender status
* `wmic qfe` or `Get-HotFix | ft -AutoSize`: installed hotfixes
* `netsh advfirewall show allprofiles`: network policy
* List all AppLocker rules or Query status given user and program

```ps
PS> Get-AppLockerPolicy -Effective | select -ExpandProperty RuleCollections
PS> Get-AppLockerPolicy -Local | Test-AppLockerPolicy -path C:\Windows\System32\cmd.exe -User Everyone
```

* UAC status

```ps
PS> reg query HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\Policies\System\ /v EnableLUA
PS> reg query HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\Policies\System\ /v ConsentPromptBehaviorAdmin
```

* `net accounts`: Password and Lockout Policy

```text!
Force user logoff how long after time expires?:       Never
Minimum password age (days):                          0
Maximum password age (days):                          42
Minimum password length:                              0
Length of password history maintained:                None
Lockout threshold:                                    Never
Lockout duration (minutes):                           30
Lockout observation window (minutes):                 30
Computer role:                                        SERVER
```
</div><div>

**Machine**

* `ver` <small>(cmd-only)</small>: see Windows version
* `[environment]::OSVersion.Version` <small>(powershell)</small>: see Windows version
* `systeminfo`: info about the system <small>(OS+Product+System info...)</small>
* `hostname`: info about the host <small>(ex: `website-dev` -> role of the user)</small>
* `netstat`: see real-time networking requests
* `netstat -ano`: list connections
* `ipconfig /all`, `arp -a`, and `route print`
* `ls Env:` or `set`: see environment variables
* `wmic product get name,version,vendor`: list software installed using "normal" means, e.g., using the OS
* `tasklist /svc`: list running processes
* `query user`: list logged users
* Refer to [wmic](/operating-systems/windows/_knowledge/index.md#wmic) commands.

**Active Directory**

Enumeration

* `net groups /domain`: list domain groups
* `net group "Domain Admins" /dom`: list domain administrators
* `net accounts /domain`: password policy
* `net share`: list shares
* `net user /domain`: list all users within a domain

Utilities

* `%logonserver%`: domain controller name
* `%USERDOMAIN%`: host domain name
* `wmic ntdomain`: domain and domain controller information
</div></div>