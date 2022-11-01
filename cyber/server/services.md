# Protocols & services notes

[![protocolsandservers](../_badges/protocolsandservers.svg)](https://tryhackme.com/room/protocolsandservers)
[![protocolsandservers2](../_badges/protocolsandservers2.svg)](https://tryhackme.com/room/protocolsandservers2)

Most entries in this course are partial knowledge about protocols/services extracted from the [Protocols & Services course](/info/networking/protocols/index.md), with cybersecurity related notes about them. The former course is more about describing the services, and the client that may be used to interact with them.

<hr class="sr">

## File Transfer protocol - 21 (tcp)

[See FTP Protocol for more information](/info/networking/protocols/index.md#-ftp---21-tcp)

<div class="row row-cols-md-2"><div>

FTP (File Transfer protocol) is a protocol used to transfer (upload, download) files from one computer to another. Use port **21** by default <small>(22 for SFTP=Secure FTP)</small>, while data is transferred via port 20.

```bash
$ ftp user@ip
ftp> ...
```
</div><div>

* Anonymous user may have been enabled

```bash
$ ftp anonymous@ip
```
</div></div>

<hr class="sl">

## Samba - 445 (or 139 before, tcp)

[See Samba service for more information](/info/networking/protocols/index.md#samba---445-or-139-before-tcp)

[![kenobi](../_badges/kenobi.svg)](https://tryhackme.com/room/kenobi)

<div class="row row-cols-md-2"><div>

[Samba](https://www.samba.org/) is making both file exchange system of Linux (NFS), and Windwos (SMB) work together. It's mostly used to share file internally, by connecting every computer, printer... to a **share**, a shared folder.

Find shares using nmap

```bash
$ nmap -p 445 --script=smb-enum-shares.nse,smb-enum-users.nse ip
```
</div><div>

* Try connecting without submitting a password

```bash
$ smbclient //IP/share_name
```
</div></div>