# Services

<hr class="sl">

## Remote Desktop Protocol - 3389 (tcp)

<div class="row row-cols-md-2"><div>

[Remmina](https://github.com/FreeRDP/Remmina) (1.8k ⭐) that can be installed with `apt install remmina` is an easy-to-use tool allowing you to open access a remote desktop.

* `remmina`: start the graphical interface
    * Enter the IP of the target
    * Enter the credentials
    * Connect
* Then, I would advise to toggle "dynamic resolution update" in the left menu, so that you have a bigger screen.
</div><div>

There is also [rdesktop](https://github.com/rdesktop/rdesktop) (1.1k ⭐).
</div></div>

<hr class="sr">

## File Transfer protocol - 21 (tcp)

<div class="row row-cols-md-2"><div>

FTP (File Transfer protocol) is a protocol used to transfer (upload, download) files from one computer to another. Use port **21** by default <small>(22 for SFTP=Secure FTP)</small>, while data is transferred via port 20.

```bash
$ ftp ip
ftp> pwd # path to current folder
ftp> ls folder # list files
ftp> cd folder # move to folder
ftp> put /local/path /remote/dest # upload
ftp> get /remote/path /local/dest # download
ftp> less file # read file
ftp> exit # exit
ftp> bye # same
```
</div><div>

* Anonymous user may have been enabled

```bash
$ ftp anonymous@ip
```
</div></div>

<hr class="sl">

## Samba - 445 (or 139 before, tcp)

[![kenobi](../_badges/kenobi.svg)](https://tryhackme.com/room/kenobi)

<div class="row row-cols-md-2"><div>

[Samba](https://www.samba.org/) that is making both file exchange system of Linux (NFS), and Windwos (SMB) work together. It's mostly used to share file internally, by connecting every computer, printer... to a **share**, a shared folder.

Find shares using nmap

```bash
$ nmap -p 445 --script=smb-enum-shares.nse,smb-enum-users.nse ip
```

Connect to a share <small>(try without submitting a password)</small>

```bash
$ smbclient //IP/share_name
```
</div><div>
Once connected, you can use theses

```bash
smb> pwd # get current folder
smb> ls folder # list files in folder
smb> cd folder # move to folder
smb> put /local/path /remote/path # upload
smb> get /remote/path /local/path # download
smb> exit
```

Download everything in a share

```bash
$ smbget -R smb://IP/share_name
```
</div></div>