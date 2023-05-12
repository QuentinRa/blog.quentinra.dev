# Server Message Block (SMB)

[![networkservices](../../../cybersecurity/_badges/thmp/networkservices.svg)](https://tryhackme.com/room/networkservices)

<div class="row row-cols-md-2"><div>

Server Message Block (SMB) is a protocol used for Windows file exchange system. It's similar to [NFS](nfs.md) for Linux.

[Samba](https://www.samba.org/) is making both file exchange systems of Linux (NFS), and Windows (SMB) work together.

🐊️ **Port**: 445 (TCP) <small>(139/TCP before)</small>

It's mostly used to share files internally by connecting computers, printers... to a shared folder called **share** 📂.

**List shares** (`-L`)

```ps
$ smbclient -L IP
$ smbclient -L IP -U username
$ smbclient -L IP -U username -p port
```

**Connect to a share** <small>(you may provide username/port too)</small>

```ps
$ smbclient //IP/share_name
$ smbclient smb://IP/share_name # same
```

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
</div></div>

<hr class="sep-both">

## SMB vulnerabilities ☠️

[![kenobi](../../../cybersecurity/_badges/thm-p/kenobi.svg)](https://tryhackme.com/room/kenobi)

<div class="row row-cols-md-2"><div>

* Using nmap you can try to:

```ps
# find users and shares
$ nmap IP -p 445 --script=smb-enum-shares.nse,smb-enum-users.nse
# find the operating system
$ nmap IP -p 445 --script smb-os-discovery.nse
```

* Try `Anonymous` user with no password (`-N`)

```ps
# list shares
$ smbclient -L IP -U Anonymous -N
# connect to a share
$ smbclient //IP/share_name -U Anonymous -N
# test Anonymous share
$ smbclient //IP//Anonymous -U Anonymous -N
```
</div><div>

* You can also use `smbmap` to find users/shares/files/...

```ps
$ smbmap -H IP
```

* You can use [enum4linux](https://github.com/CiscoCXSecurity/enum4linux) (0.7k ⭐) to find shares, and users.

```ps
$ enum4linux options IP
$ enum4linux -a IP
# -a : list all
# -U : list of users
# -M : list of devices
# -S : list of shares
# -o : print os information
# -i : print printer information
# -v : verbose
```

* [CVE-2017-0144](https://attackerkb.com/topics/xI1y9OoEgq/cve-2017-0144-ms17-010) - EternalBlue - MS17-010

[![blue](../../../cybersecurity/_badges/thm-p/blue.svg)](https://tryhackme.com/room/blue)

A vulnerability in the SMB protocol allowing Remote Code Execution (RCE). It was discovered by the NSA and stolen by hackers,
</div></div>

<hr class="sep-both">

## 👻 To-do 👻

Stuff that I found, but never read/used yet.

<div class="row row-cols-md-2"><div>

* SMBenum
</div><div>
</div></div>