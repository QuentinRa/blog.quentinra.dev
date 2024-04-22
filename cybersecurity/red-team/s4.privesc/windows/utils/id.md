# Windows Environment Mapping

[![windows_privilege_escalation](../../../../_badges/htb/windows_privilege_escalation.svg)](https://academy.hackthebox.com/course/preview/windows-privilege-escalation)
[![active_directory_enumeration_attacks](../../../../_badges/htb/active_directory_enumeration_attacks.svg)](https://academy.hackthebox.com/course/preview/active-directory-enumeration--attacks)
[![adenumeration](../../../../_badges/thm/adenumeration.svg)](https://tryhackme.com/r/room/adenumeration)
[![windowsprivesc20](../../../../_badges/thmp/windowsprivesc20.svg)](https://tryhackme.com/room/windowsprivesc20)

<div class="row row-cols-lg-2"><div>

#### Windows Users-Related Functions

* `whoami`: username
* `whoami /groups`: current user groups
* `whoami /priv`: current user privileges
* `Get-LocalGroup` or `net localgroup`: list groups
* `Get-LocalUser`: list users
* `net user username`: info about a user
* `net localgroup users`: list users in the group "users"
* `net localgroup administrators`: list local administrators
* `qwinsta`: currently logged users

<br>

#### Windows Security-Related Functions

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

<br>

#### Windows Machine-Related Functions

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
</div><div>

#### Windows Active Directory-Related Functions

Enumeration <small>(often monitored, not all results)</small>

* `net groups /domain`: list domain groups
* `net group "Domain Admins" /dom`: list domain administrators
* `net accounts /domain`: password policy
* `net share`: list shares
* `net user /domain`: list all users within a domain
* `net user "username" /domain`: query information about a specific user

Utilities

* `%logonserver%`: domain controller name
* `%USERDOMAIN%`/`$Env:USERDOMAIN`: active directory domain name
* `nltest /dsgetdc:<domain_name>`: domain controller information
* `wmic ntdomain`: domain and domain controller information

We may be able to use the [active directory module](https://learn.microsoft.com/en-us/powershell/module/activedirectory/?view=windowsserver2022-ps) or [install it](#installing-the-snap-ins).

```ps
PS> Import-Module ActiveDirectory
PS> # Add -Server domain on external workstations
PS> Get-ADDomain                                     # List domain information
PS> Get-ADUser -Filter {ServicePrincipalName -ne "$null"} -Properties ServicePrincipalName
PS> Get-ADUser -Filter 'Name -like "*xxx"' -Properties ServicePrincipalName
PS> Get-ADUser -Filter 'userAccountControl -band 128' -Properties userAccountControl
PS> Get-ADUser -Identity username [...]
PS> Get-ADTrust -Filter *                            # List Domain Trusts
PS> Get-ADGroup -Filter * | select name              # List groups
PS> Get-ADGroup -Identity "Backup Operators"         # Group Details
PS> Get-ADGroup -Identity "XXX" -Properties * | Select -ExpandProperty Members
PS> Get-ADGroupMember -Identity "Backup Operators"   # Group Members
PS> Get-ADObject -Filter 'badPwdCount -gt 0' -includeDeletedObjects # Search Objects
PS> Get-ADTrust -Filter * # AD Module
```

The tool [dsquery](https://learn.microsoft.com/en-us/previous-versions/windows/it-pro/windows-server-2012-R2-and-2012/cc732952(v=ws.11)) may be available. It must be run in an elevated prompt. Refer to [LDAP Filters](/operating-systems/networking/protocols/ldap.md) to find specific accounts.

```ps
PS> dsquery user
PS> dsquery computer
PS> dsquery * "CN=Users,DC=example,DC=com"
PS> dsquery * -filter "..."
PS> dsquery * -filter "..." -attr [...]
PS> dsquery * -filter "..." -attr a b -limit 5
PS> dsquery [...] | dsget user -desc
```

You can use [PowerView](/cybersecurity/red-team/tools/utilities/windows/powersploit.md) or [SharpView](/cybersecurity/red-team/tools/utilities/windows/powersploit.md):

```ps
PS> Get-DomainUser -Identity username -Domain example.com
PS> Get-DomainGroupMember -Identity "Domain Admins" -Recurse
PS> Get-DomainTrustMapping
PS> Test-AdminAccess -ComputerName TARGET_HOST
PS> Get-DomainUser -SPN -Properties samaccountname,ServicePrincipalName
PS> .\SharpView.exe Get-DomainUser -Identity username
```

You can use [BloodHound](/cybersecurity/red-team/tools/utilities/windows/bloodhound.md) to collect and analyze the data.

You can use [Microsoft Management Console](#microsoft-management-console-mmc) to browse AD objects as if you were on the domain controller and maybe edit them too.

Refer to [LAPS](/operating-systems/windows/security/index.md) to enumerate for accounts related to LAPS.
</div></div>

<hr class="sep-both">

## Microsoft Management Console (MMC)

[![adenumeration](../../../../_badges/thm/adenumeration.svg)](https://tryhackme.com/r/room/adenumeration)

<div class="row row-cols-lg-2"><div>

Microsoft Management Console (MMC) is always installed on Windows hosts, while AD snap-ins may not. It can be used to allow some employees to browse and edit objects such as users.

To open it: <kbd>Windows + R</kbd> and enter <kbd>MMC</kbd>.

See also: [Remote Server Administration Tools (RSAT)](https://learn.microsoft.com/en-us/windows-server/remote/remote-server-administration-tools).

#### Installing The Snap-Ins

*If you are using your own machine as administrator.*

On Windows 11 Pro, open `optional features` using the search bar. Click on `view features` and install `RSAT: Active Directory Domain Services and Lightweight Directory Tools`.

Use `Click File -> Add/Remove Snap-in` to add all three AD snap-in. Configure each using `Change Forest/Domain` and set the domain/root domain to the target domain.
</div><div>

#### Using Microsoft Management Console (MMC)

A few random notes:

* Click on `View -> Advanced Features` to view all objects/attributes
* Click on `Active Directory Users and Computers` to view all OUs
</div></div>