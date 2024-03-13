# Identification

[![windows_privilege_escalation](../../../../_badges/htb/windows_privilege_escalation.svg)](https://academy.hackthebox.com/course/preview/windows-privilege-escalation)
[![windowsprivesc20](../../../../_badges/thmp/windowsprivesc20.svg)](https://tryhackme.com/room/windowsprivesc20)

<div class="row row-cols-lg-2"><div>

**Users**

* `whoami`: username
* `whoami /groups`: current user groups
* `whoami /priv`: current user privileges
* `Get-LocalGroup`+`net localgroup`: list groups
* `Get-LocalUser`: list users
* `net user username`: info about a user
* `net localgroup users`: list users in the group "users"
* `net localgroup administrators`: list local administrators
* `net group "Domain Admins" /dom`: list domain administrators

**Security**

* `Get-MpComputerStatus`: Windows defender status
* `wmic qfe` or `Get-HotFix | ft -AutoSize`: installed hotfixes
* List all AppLocker rules or Query status given user and program

```ps
PS> Get-AppLockerPolicy -Effective | select -ExpandProperty RuleCollections
PS> Get-AppLockerPolicy -Local | Test-AppLockerPolicy -path C:\Windows\System32\cmd.exe -User Everyone
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
* `systeminfo`: info about the system <small>(OS+Product+System info...)</small>
* `hostname`: info about the host <small>(ex: `website-dev` -> role of the user)</small>
* `netstat`: see real-time networking requests
* `netstat -ano`: list connections
* `ls Env:` or `set`: see environment variables
* `wmic product get name,version,vendor`: list software installed using "normal" means, e.g., using the OS
* `tasklist /svc`: list running processes
* `query user`: list logged users
</div></div>