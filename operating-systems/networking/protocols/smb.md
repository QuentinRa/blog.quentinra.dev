# Server Message Block (SMB)

[![networkservices](../../../cybersecurity/_badges/thmp/networkservices.svg)](https://tryhackme.com/room/networkservices)
[![adventofcyber4](../../../cybersecurity/_badges/thm/adventofcyber4/day4.svg)](https://tryhackme.com/room/adventofcyber4)
[![footprinting](../../../cybersecurity/_badges/htb/footprinting.svg)](https://academy.hackthebox.com/course/preview/footprinting)

<div class="row row-cols-lg-2"><div>

Server Message Block (SMB) is a protocol used for Windows file exchange system. It's similar to [NFS](/operating-systems/networking/protocols/nfs.md) for Linux.

[Samba](https://www.samba.org/) is making both file exchange systems of Linux (NFS), and Windows (SMB) work together. It implements [CIFS](/operating-systems/networking/protocols/cifs.md).

🐊️ **Port**: 445 (TCP) <small>(139/TCP before)</small>

It's mostly used to share files internally by connecting computers, printers... to a shared folder called **share** 📂 ([def](/operating-systems/windows/_knowledge/index.md#shared-folders)).

For any commands, you can use:

```ps
$ smbclient [...] -U username # specify username
$ smbclient [...] -p port # specify port
```

**List shares**

```ps
$ smbclient -L IP [...]
# Sharename       Type      Comment
PS> net view \\IP
PS> net share
```

**Connect to a share**

```ps
$ smbclient //IP/share_name [...]
$ smbclient smb://IP/share_name [...] # same
```

➡️ You can also enter `smb://[...]` in a file explorer search bar.

➡️ You can also use [impacket-client](tools/impacket.md#smb-client) if smbclient doesn't work.
</div><div>


Once connected, you can use these:

```shell!
smb> help # list every command
smb> pwd # get current folder
smb> ls folder # list files in folder
smb> cd folder # move to folder
smb> stat file # show information
smb> more file # read a file remotely
smb> put /local/path /remote/path # upload
smb> get /remote/path /local/path # download
smb> exit # there is also "q" and "quit"
```

Download everything in a share

```ps
$ smbget -R //IP/share_name
```

**Create a SMB server**

You can use [impacket](tools/impacket.md) to create a SMB server on your machine using a script. But, when the script is terminated, the server is terminated too.

**Copy a file from/to a SMB share**

```shell!
PS> # use current user credentials to log in
PS> copy \\IP\share\file # Download
PS> copy file \\IP\share # Upload
```

You can mount the share as a network drive (`s:`) if you need to use different credentials. This will make `copy` use these credentials.

```shell!
PS> net use s: \\IP\share_name /user:username password
```
</div></div>

<hr class="sep-both">

## SMB Pentester Notes ☠️

[![kenobi](../../../cybersecurity/_badges/thm-p/kenobi.svg)](https://tryhackme.com/room/kenobi)
[![lame](../../../cybersecurity/_badges/htb-p/lame.svg)](https://app.hackthebox.com/machines/Lame)
[![legacy](../../../cybersecurity/_badges/htb-p/legacy.svg)](https://app.hackthebox.com/machines/Legacy)

<div class="row row-cols-lg-2"><div>

#### Enumeration

* Using nmap you can try to:

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

* Try `Anonymous` user with no password (`-N`)

```ps
# list shares
$ smbclient -L IP -U Anonymous -N
# connect to a share
$ smbclient //IP/share_name -U Anonymous -N
# test Anonymous share
$ smbclient //IP//Anonymous -U Anonymous -N
```

* The password may be weak and vulnerable to [brute force](/cybersecurity/red-team/s2.discovery/techniques/network/auth.md).

```shell!
$ hydra -L user.list -P password.list smb://IP -V -f
$ nxc smb IP -u username -p password.list
```

If you got some error like `invalid reply from target`, it may indicate that the tool doesn't support this SMB dialect. Try metasploit:

```shell!
$ msfconsole -q
msf6> use auxiliary/scanner/smb/smb_login
```
</div><div>

#### Exploitation

* You can use [crackmapexec](/cybersecurity/red-team/tools/cracking/auth/cme.md)/[nxc](/cybersecurity/red-team/tools/cracking/auth/nxc.md) to list shares+accesses, and automatically fetch some basic information about the host.

```ps
$ crackmapexec smb IP --shares -u 'username' -p 'password'
```

* You can use [smbmap](https://github.com/ShawnDEvans/smbmap) <small>(1.6k ⭐)</small> to list users/shares+access/files/...

```ps
$ smbmap -H IP
$ smbmap -H IP -u 'username' -p 'password'
```

* You can use [enum4linux](https://github.com/CiscoCXSecurity/enum4linux) <small>(1.0k ⭐)</small> or [enum4linux-ng](https://github.com/cddmp/enum4linux-ng) <small>(1.0k ⭐)</small> to list shares, devices, users, along basic information about the host.

```shell!
$ sudo apt-get install enum4linux-ng
$ enum4linux-ng IP -a
$ enum4linux-ng IP <options>
$ enum4linux-ng IP <options> -u 'username' -p 'password'
```
```ps
# -a : list all
# -U : list of users
# -M : list of devices
# -S : list of shares
# -o : print os information
# -i : print printer information
```

* PsExec <small>(see [impacket](tools/impacket.md#psexec) client)</small> is a tool that allows administrators to run commands on Windows hosts. It relies on SMB.

#### Well-Known CVEs

* [CVE-2017-0144](https://attackerkb.com/topics/xI1y9OoEgq/cve-2017-0144-ms17-010) - EternalBlue - MS17-010

[![blue](../../../cybersecurity/_badges/thm-p/blue.svg)](https://tryhackme.com/room/blue)
[![blue](../../../cybersecurity/_badges/htb-p/blue.svg)](https://app.hackthebox.com/machines/Blue)

A vulnerability in the SMB protocol allowing Remote Code Execution (RCE). It was discovered by the NSA and stolen by hackers.
</div></div>

<hr class="sep-both">

## 👻 To-do 👻

Stuff that I found, but never read/used yet.

<div class="row row-cols-lg-2"><div>

* SMBenum
* smbclient can run commands (`!cmd`)
</div><div>
</div></div>