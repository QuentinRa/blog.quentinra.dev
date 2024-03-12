# File Transfer Protocol (FTP)

[![protocolsandservers](../../../cybersecurity/_badges/thmp/protocolsandservers.svg)](https://tryhackme.com/room/protocolsandservers)
[![networkservices](../../../cybersecurity/_badges/thmp/networkservices.svg)](https://tryhackme.com/room/networkservices)
[![networksecurityprotocols](../../../cybersecurity/_badges/thmp/networksecurityprotocols.svg)](https://tryhackme.com/room/networksecurityprotocols)
[![adventofcyber2](../../../cybersecurity/_badges/thm/adventofcyber2/day9.svg)](https://tryhackme.com/room/adventofcyber2)
[![footprinting](../../../cybersecurity/_badges/htb/footprinting.svg)](https://academy.hackthebox.com/course/preview/footprinting)

<div class="row row-cols-lg-2"><div>

File Transfer Protocol (FTP) is a widely used protocol to transfer files. It's mostly used externally, unlike SMB or NFS.

🐊️ **Ports**: 21 (TCP/control), and 20 (TCP/data)

🔥 FTP communications are not encrypted.

🔒 There is a secure version called FTPS <small>(port 990, over SSL/TLS)</small>.

```shell!
$ ftp IP # use current user username
$ ftp username@IP
$ ftp username@IP -p port
ftp> help
```

If `username@IP` doesn't work, you can manually connect:

```shell!
$ ftp -n IP
ftp> user username
Password: xxx
```

<details class="details-n">
<summary>FTP protocol internals</summary>

An FTP request is starting with the server sending `USER`, the client answering with a username, the server sending `PASS`, and the user answering back with the password.

There are two modes in FTP: active, and passive. The mode determines the port used to transfer data. Data is transferred via the port 20, while in passive mode, a port higher than 1023 will be used.

There are two channels in an FTP connection: a channel to send commands <small>(also called control)</small>, and one to transfer data. There is also a transfer mode, which could be ASCII, or binary (default). You can enter `type [a|i]` or `ascii|binary` to switch.
</details>
</div><div>

Once in an FTP shell, here some [commands](https://www.rfc-editor.org/rfc/rfc959) you may use:

```shell!
ftp> pwd # path to the current folder
ftp> ls folder # list files
ftp> cd folder # move to folder
ftp> put /local/path /remote/dest # upload
ftp> get /remote/path /local/dest # download
ftp> less file # read file
ftp> exit # exit
ftp> bye # same
```

To download all files:

```ps
$ wget -m --no-passive ftp://username:password@IP
```

And to query information about the server:

```shell!
ftp> syst # information about the system
ftp> stat # same, but there is the version+ftp client name
ftp> status # same as 'stat'
```

➡️ If `put/get` keep failing, try moving to the target folder first.
</div></div>

<hr class="sep-both">

## FTP Pentester notes ☠️

FTP may be used by hackers to find interesting files.  Remember to check for hidden files. ⚠️

<div class="row row-cols-lg-2"><div>

#### Enumeration

[![attacking_common_services](../../../cybersecurity/_badges/htb/attacking_common_services.svg)](https://academy.hackthebox.com/course/preview/attacking-common-services)

* We can use [nmap](/cybersecurity/red-team/tools/scanners/ports/nmap.md) to run basic scripts

```shell!
$ nmap -sC -sV -p 21 IP
```

* We may be able to use FTP bounce to scan for ports

```shell!
$ nmap [...] -b ftp:username:password@IP INTERNAL_IP
```

#### Foothold

[![password_attacks](../../../cybersecurity/_badges/htb/password_attacks.svg)](https://academy.hackthebox.com/course/preview/password-attacks)
[![adventofcyber2](../../../cybersecurity/_badges/thm/adventofcyber2/day9.svg)](https://tryhackme.com/room/adventofcyber2)
[![kenobi](../../../cybersecurity/_badges/thm-p/kenobi.svg)](https://tryhackme.com/room/kenobi)
[![startup](../../../cybersecurity/_badges/thm-p/startup.svg)](https://tryhackme.com/room/startup)
[![cowboyhacker](../../../cybersecurity/_badges/thm-p/cowboyhacker.svg)](https://tryhackme.com/room/cowboyhacker)
[![easyctf](../../../cybersecurity/_badges/thm-p/easyctf.svg)](https://tryhackme.com/room/easyctf)
[![chillhack](../../../cybersecurity/_badges/thm-p/chillhack.svg)](https://tryhackme.com/room/chillhack)
[![blocky](../../../cybersecurity/_badges/htb-p/blocky.svg)](https://app.hackthebox.com/machines/Blocky)

* Anonymous users may have been enabled. Try a blank password.

```ps
$ ftp anonymous@IP
```

* The password may be weak and vulnerable to [brute force](/cybersecurity/red-team/s2.discovery/techniques/network/auth.md).

```shell!
$ hydra -L user.list -P password.list ftp://IP -V -f
```
</div><div>

#### Well-known CVEs

[![lame](../../../cybersecurity/_badges/htb-p/lame.svg)](https://app.hackthebox.com/machines/Lame)

* **ProFTPD 1.3.5**: users could move files from a non-mounted path to the mounted path. You could steal an id_rsa for instance.

* **vsFTPd 2.3.4**: has a backdoor as per [CVE-2011-2523](https://nvd.nist.gov/vuln/detail/CVE-2011-2523).

* **CoreFTP 727** ([ref](https://nvd.nist.gov/vuln/detail/CVE-2022-22836)): can use PUT to arbitrarily upload files

#### Additional Notes

[![lianyu](../../../cybersecurity/_badges/thm-p/lianyu.svg)](https://tryhackme.com/room/lianyu)

* **vsFTPd 3.0.2**: the FTP server may have been misconfigured, and allows access to any file on the host using "`cd ..`".

* It's very uncommon but: `ftp> !/bin/bash`
</div></div>

<hr class="sep-both">

## Random Notes

<div class="row row-cols-lg-2"><div>

#### Simple FTP Server

You can use `pyftpdlib`:

```shell!
$ sudo apt install python3-pyftpdlib
$ python3 -m pyftpdlib --port 21
$ python3 -m pyftpdlib --port 21 --write
```

You can use `twisted` 👻:

```shell!
$ sudo pip3 install twisted
$ sudo python3 -m twisted ftp -p 21 -r .
```
</div><div>
</div></div>

<hr class="sep-both">

## 👻 To-do 👻

Stuff that I found, but never read/used yet.

<div class="row row-cols-lg-2"><div>

* `ftp -p` (passive mode, may bypass some firewall)
* `tftp`
* configuration (`/etc/vsftpd.conf`, `/etc/ftpusers`=deny FTP access)
* hide usernames (`hide_ids=YES`, use `ftp:ftp`)
* nmap `ftp-anon`, `ftp-syst`
</div><div>
</div></div>