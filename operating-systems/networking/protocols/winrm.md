# Windows Remote Management (WinRM)

<div class="row row-cols-lg-2"><div>

WinRM is a protocol that if enabled, allows administrators to remotely connect to a server using a remote shell.

🐊️ **Ports**

* 5985 (TCP, HTTP)
* 5986 (TCP, HTTPS)

WinRM is a SOAP-based protocol.
</div><div>
</div></div>

<hr class="sep-both">

## WinRM vulnerabilities ☠️

<div class="row row-cols-lg-2"><div>

You can use [evil-winrm](https://github.com/Hackplayers/evil-winrm) (3.9k ⭐) to pop a powershell via WinRM if we have access. On Windows, we can use `Test-WSMan`.

```ps
$ evil-winrm -i IP -u username -p password
```
</div><div>

See also: [RogueWinRM](https://github.com/antonioCoco/RogueWinRM)  (0.5k ⭐).
</div></div>

<hr class="sep-both">

## 👻 To-do 👻

Stuff that I found, but never read/used yet.

<div class="row row-cols-lg-2"><div>

* Windows Remote Shell (WinRS)
* nmap `wsman`
</div><div>
</div></div>