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
[![pivoting_tunneling_port_forwarding](../../../cybersecurity/_badges/htb/pivoting_tunneling_port_forwarding.svg)](https://academy.hackthebox.com/course/preview/pivoting-tunneling-and-port-forwarding)
[![active_directory_enumeration_attacks](../../../cybersecurity/_badges/htb/active_directory_enumeration_attacks.svg)](https://academy.hackthebox.com/course/preview/active-directory-enumeration--attacks)

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

From a Windows host, you can use:

```ps
PS> Enter-PSSession -ComputerName "COMPUTER_NAME"
PS> Enter-PSSession -ComputerName "COMPUTER_NAME.example.com" -Credential example\username
```

```ps
PS> $password = ConvertTo-SecureString "password" -AsPlainText -Force
PS> $cred = new-object System.Management.Automation.PSCredential ("example\username", $password)
PS> Enter-PSSession -ComputerName "COMPUTER_NAME" -Credential $cred
```

To avoid the [double hop problem](https://posts.slayerlabs.com/double-hop/) when we get access denied to a resource we should be able to access after multiple hops:

```shell!
PS> Enter-PSSession [...]
session> Register-PSSessionConfiguration -Name xxx -RunAsCredential example\username
session> Restart-Service WinRM
PS> Enter-PSSession [...] -ConfigurationName xxx
```

</div></div>

<hr class="sep-both">

## 👻 To-do 👻

Stuff that I found, but never read/used yet.

<div class="row row-cols-lg-2"><div>

* Windows Remote Shell (WinRS), `MS-PSRP`
* nmap `wsman`
</div><div>
</div></div>