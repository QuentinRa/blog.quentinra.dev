# Named Pipes

[![windows_privilege_escalation](../../../../_badges/htb/windows_privilege_escalation.svg)](https://academy.hackthebox.com/course/preview/windows-privilege-escalation)

<div class="row row-cols-lg-2"><div>

Windows has a mechanism called "named pipes" for inter-process communication <small>(IPC)</small> ☎️. It works even if the processes are:

* Executed by different users
* Executed on different machines

One process creates the pipe and clients connect to it. You can list every pipe host on your machine using:

```ps
PS> gci \\.\pipe\
```
</div><div>

You can list named pipes on which you have write access:

```shell!
PS> .\accesschk.exe /accepteula -w \pipe\* -v
```

You can list the permissions you have on a named pipe using:

```shell!
PS> .\accesschk.exe /accepteula \\.\Pipe\lsass -v
```

➡️ Look for exploits/PoC to try to exploit them.
</div></div>