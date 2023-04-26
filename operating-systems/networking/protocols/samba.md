# Samba

<div class="row row-cols-md-2"><div>

[Samba](https://www.samba.org/) is making both file exchange systems of Linux (NFS), and Windows (SMB) work together.

🐊️ **Port**: 445 (TCP) <small>(139/TCP before)</small>

It's mostly used to share files internally by connecting computersn printers... to a shared folder called **share** 📂.

```bash
$ smbclient //IP/share_name
$ smbclient smb://IP/share_name # same
$ smbclient //IP/share_name -p port
$ smbclient //IP/share_name -U username
```

Download everything in a share

```bash
$ smbget -R //IP/share_name
```
</div><div>

Once connected, you can use theses

```bash
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
</div></div>

<hr class="sep-both">

## Samba vulnerabilities ☠️

[![kenobi](../../../cybersecurity/_badges/thm-p/kenobi.svg)](https://tryhackme.com/room/kenobi)

<div class="row row-cols-md-2"><div>

* Find shares using nmap

```ps
$ nmap IP -p 445 --script=smb-enum-shares.nse,smb-enum-users.nse
```

* Try connecting anonymously with no password (leave blank)

```ps
$ smbclient -L IP -U Anonymous # list shares
$ smbclient //IP/share_name -U Anonymous
$ smbclient //IP//Anonymous -U Anonymous
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
</div></div>

<hr class="sep-both">

## 👻 To-do 👻

Stuff that I found, but never read/used yet.

<div class="row row-cols-md-2"><div>

* SMBenum
</div><div>
</div></div>