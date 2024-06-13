# Server Message Block (SMB)

[![footprinting](../../../cybersecurity/_badges/htb/footprinting.svg)](https://academy.hackthebox.com/course/preview/footprinting)
[![networkservices](../../../cybersecurity/_badges/thmp/networkservices.svg)](https://tryhackme.com/room/networkservices)
[![adventofcyber2](../../../cybersecurity/_badges/thm/adventofcyber2/day10.svg)](https://tryhackme.com/room/adventofcyber2)
[![adventofcyber4](../../../cybersecurity/_badges/thm/adventofcyber4/day4.svg)](https://tryhackme.com/room/adventofcyber4)

<div class="row row-cols-lg-2"><div>

Server Message Block (SMB) is a protocol used for Windows file exchange system. It's similar to [NFS](/operating-systems/networking/protocols/nfs.md) for Linux.

[Samba](https://www.samba.org/) is making both file exchange systems of Linux (NFS), and Windows (SMB) work together. It implements [CIFS](/operating-systems/networking/protocols/cifs.md).

🐊️ **Port**: 445 (TCP) <small>(139/TCP before)</small>

It's mostly used to share files internally by connecting computers, printers... to a shared folder called **share** 📂 ([def](/operating-systems/windows/_knowledge/index.md#shared-folders)).


For any `smbclient` commands, you can use:

```ps
$ smbclient -U username [...] # specify username
$ smbclient -p port [...]     # specify port
```

**List shares**

```ps
$ smbclient [...] -L IP
PS> net view \\IP
PS> net share
```
</div><div>

**Connect to a share**

```shell!
$ smbclient //IP/share_name [...]
$ smbclient smb://IP/share_name [...] # same
$ impacket-smbclient 'username':'password'@IP
```

You may have to add `--option='client min protocol=NT1'` <small>(old target)</small>.

**Common commands**

```shell!
smb> help      # list every command
smb> pwd       # get the current folder
smb> ls folder # list files in folder
smb> cd folder # move to folder
smb> stat file # show information
smb> more file # read a file remotely
smb> put /local/path /remote/path # upload
smb> get /remote/path /local/path # download
smb> exit # there is also "q" and "quit"
```

⚠️ Don't forget to look for hidden files.
</div></div>

<hr class="sep-both">

## Common SMB Usages

<div class="row row-cols-lg-2"><div>

#### Dump everything in a share

You can use `smbget`:

```ps
$ smbget --recursive smb://username@IP/share_name
$ smbget --recursive smb://username:password@IP/share_name
```

#### Linux — Set up a SMB server

You can use [impacket](tools/impacket.md) to create a SMB server on your machine using a script. But, when the script is terminated, the server is terminated too.

📚 This is useful to transfer files between Windows and Linux.
</div><div>

#### Windows Share Access

* You can use `copy` to download/upload files.

```shell!
PS> # use current user credentials to log in
PS> copy \\IP\share\file # Download
PS> copy file \\IP\share # Upload
```

* You can mount a share as a network drive (`s:`). This allows you to access the share with custom credentials.

```shell!
CMD> net use s: \\IP\share_name /user:username password
```
```ps
PS> $credential = New-Object System.Management.Automation.PSCredential 'username', $(ConvertTo-SecureString 'password' -AsPlainText -Force)
PS> New-PSDrive -Name "S" -Root "\\IP\share_name" -PSProvider "FileSystem" -Credential $credential
```

* You can access a share from the file explorer using `smb://[...]`
* You may use `dir` to list the contents of a share

```ps
$ dir \\wsl$
$ dir s:\* /s /b
```
</div></div>


<hr class="sep-both">

## SMB Pentester Notes ☠️

<div class="row row-cols-lg-2"><div>

#### Enumeration

[![attacking_common_services](../../../cybersecurity/_badges/htb/attacking_common_services.svg)](https://academy.hackthebox.com/course/preview/attacking-common-services)

* Using [nmap](/cybersecurity/red-team/tools/scanners/ports/nmap.md) you can try to:

```ps
# find users and shares
$ nmap -p 139,445 --script=smb-enum-shares.nse,smb-enum-users.nse IP
# find the operating system
$ nmap -p 139,445 --script smb-os-discovery.nse IP
# run every smb script
$ nmap -p 139,445 --script "*smb*" IP
```

* If [msrpc](rpc.md) is available, we may be able to use it to query information such as users, host information, os information, etc.

#### FootHold

[![password_attacks](../../../cybersecurity/_badges/htb/password_attacks.svg)](https://academy.hackthebox.com/course/preview/password-attacks)
[![attacking_common_services](../../../cybersecurity/_badges/htb/attacking_common_services.svg)](https://academy.hackthebox.com/course/preview/attacking-common-services)
[![active_directory_enumeration_attacks](../../../cybersecurity/_badges/htb/active_directory_enumeration_attacks.svg)](https://academy.hackthebox.com/course/preview/active-directory-enumeration--attacks)
[![kenobi](../../../cybersecurity/_badges/thm-p/kenobi.svg)](https://tryhackme.com/room/kenobi)
[![attacktivedirectory](../../../cybersecurity/_badges/thm-p/attacktivedirectory.svg)](https://tryhackme.com/r/room/attacktivedirectory)
[![blog](../../../cybersecurity/_badges/thm-p/blog.svg)](https://tryhackme.com/r/room/blog)

* Try `Anonymous` user with no password <small>(`-N` or `-no-pass`, a.k.a. null session)</small>

```ps
# list shares
$ smbclient -L IP -U Anonymous -N
# connect to a share
$ smbclient //IP/share_name -U Anonymous -N
# test Anonymous share
$ smbclient //IP//Anonymous -U Anonymous -N
# additional usage
$ smbclient [...] -c "command" -W "domain"
```

* The password may be weak and vulnerable to [brute force](/cybersecurity/red-team/s2.discovery/techniques/network/auth.md).

```shell!
$ hydra -L user.list -P password.list smb://IP -V -f
$ nxc smb IP -u username -p password.list
$ nxc smb IP -u username.list -p password
```

* You can also use [metasploit](/cybersecurity/red-team/tools/frameworks/metasploit/index.md)

```shell!
$ msfconsole -q
msf6> use auxiliary/scanner/smb/smb_login
```
</div><div>

#### Exploitation

[![active_directory_enumeration_attacks](../../../cybersecurity/_badges/htb/active_directory_enumeration_attacks.svg)](https://academy.hackthebox.com/course/preview/active-directory-enumeration--attacks)
[![adventofcyber2](../../../cybersecurity/_badges/thm/adventofcyber2/day10.svg)](https://tryhackme.com/room/adventofcyber2)
[![ccpentesting](../../../cybersecurity/_badges/thm-p/ccpentesting.svg)](https://tryhackme.com/room/ccpentesting)
[![attacktivedirectory](../../../cybersecurity/_badges/thm-p/attacktivedirectory.svg)](https://tryhackme.com/r/room/attacktivedirectory)

* We can use [crackmapexec](/cybersecurity/red-team/tools/cracking/auth/cme.md)/[nxc](/cybersecurity/red-team/tools/cracking/auth/nxc.md) to list shares+accesses, and automatically fetch information about the host/network.

```ps
$ crackmapexec smb IP -u 'username' -p 'password' --shares
$ crackmapexec smb [...] # many more options
```

* We can use [smbmap](https://github.com/ShawnDEvans/smbmap) <small>(1.7k ⭐)</small> to list users/shares+access/files/...

```ps
$ smbmap -H IP
$ smbmap -H IP -u 'username' -p 'password'
$ smbmap [...] -x 'command' -d 'domain' -s 'share'
```

* We can use [enum4linux](https://github.com/CiscoCXSecurity/enum4linux) <small>(1.0k ⭐)</small> or [enum4linux-ng](https://github.com/cddmp/enum4linux-ng) <small>(1.0k ⭐)</small> to list shares, devices, users, along basic information about the host.

```shell!
$ sudo apt-get install enum4linux-ng
$ enum4linux-ng IP -A
$ enum4linux-ng IP <options>
$ enum4linux-ng IP <options> -u 'username' -p 'password'
```
```ps
# -A : list all
# -U : list of users
# -M : list of devices
# -S : list of shares
# -o : print os information
# -i : print printer information
```

* PsExec <small>(see [impacket](tools/impacket.md#psexec) client)</small> is a tool that allows administrators to run commands on Windows hosts. It relies on SMB.

#### Well-Known CVEs

[![shells_and_payloads](../../../cybersecurity/_badges/htb/shells_and_payloads.svg)](https://academy.hackthebox.com/course/preview/shells--payloads)
[![blue](../../../cybersecurity/_badges/thm-p/blue.svg)](https://tryhackme.com/room/blue)
[![blue](../../../cybersecurity/_badges/htb-p/blue.svg)](https://app.hackthebox.com/machines/Blue)

* [CVE-2017-0144](https://attackerkb.com/topics/xI1y9OoEgq/cve-2017-0144-ms17-010) - EternalBlue - MS17-010

A vulnerability in the SMB protocol allowing Remote Code Execution (RCE). It was discovered by the NSA and stolen by hackers.

➡️ See: `ms17_010_eternalblue`, `ms17_010_psexec`, etc.

* [CVE-2020-0796](https://nvd.nist.gov/vuln/detail/CVE-2020-0796) - SMBGhost - Unauthenticated RCE

[![legacy](../../../cybersecurity/_badges/htb-p/legacy.svg)](https://app.hackthebox.com/machines/Legacy)

* [CVE-2008-4250](https://nvd.nist.gov/vuln/detail/CVE-2008-4250) - Unauthenticated RCE

[![lame](../../../cybersecurity/_badges/htb-p/lame.svg)](https://app.hackthebox.com/machines/Lame)

* Samba username map script - Command Execution
</div></div>

<hr class="sep-both">

## SMB Relay Attacks

[![attacking_common_services](../../../cybersecurity/_badges/htb/attacking_common_services.svg)](https://academy.hackthebox.com/course/preview/attacking-common-services)
[![breachingad](../../../cybersecurity/_badges/thm/breachingad.svg)](https://tryhackme.com/r/room/breachingad)

<div class="row row-cols-lg-2"><div>

SMB relay is an attack in which we relay the hash to another machine instead of cracking it. It only works if SMB signing is disabled.

We can use [impacket](tools/impacket.md) script or [responder MultiRelay](https://github.com/lgandx/Responder/blob/master/tools/MultiRelay.py).

```shell!
$ impacket-ntlmrelayx --no-http-server -smb2support -t IP -c '<command>'
```

You would usually have a [responder](/cybersecurity/red-team/tools/utilities/networking/responder.md) running with `SMB=Off`.

```ps
$ sudo responder -I tun0
```
</div><div>
</div></div>

<hr class="sep-both">

## 👻 To-do 👻

Stuff that I found, but never read/used yet.

<div class="row row-cols-lg-2"><div>

* SMBenum
* smbclient can run commands (`!cmd`)
</div><div>
</div></div>