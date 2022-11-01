# Protocols & services

Any knowledge related to protocols, and services, such as ftp, ssh, sftp, scp, telnet, smtp...

<hr class="sep-both">

## Open a shell on a remote machine

<div class="row row-cols-md-2 mt-3"><div class="border-end border-dark">

### 🔓 Telnet - 23 (tcp)

No encryption, be it the credentials or the data exchanged.

...
</div><div class="border-st art border-dark ps-4">

### 🔒 SSH - 22 (tcp)

```bash
$ ssh login@ip
$ ssh login@ip -u port
```
</div></div>

<hr class="sep-both">

## Transfer files to/from a remote machine

<div class="row row-cols-md-2 mt-3"><div class="border-end border-dark">

### 🔓 ftp - 21 (tcp)

No encryption, be it the credentials or the data exchanged.

```bash
$ ftp ip
$ ftp login@ip
ftp> commands
```

Once in a FTP shell, you may use the commands defined in the [RFC](https://www.rfc-editor.org/rfc/rfc959).

<details class="details-e">
<summary>FTP commands summary</summary>

```bash
ftp> pwd # path to current folder
ftp> ls folder # list files
ftp> cd folder # move to folder
ftp> put /local/path /remote/dest # upload
ftp> get /remote/path /local/dest # download
ftp> less file # read file
ftp> exit # exit
ftp> bye # same
```
</details>

</div><div class="border-st art border-dark ps-4">

### 🔒 scp/sftp - 22 (tcp)

Secure version of FTP built over SSH.

```bash
# upload
$ scp file_to_upload user@ip:remote/path/
# download
$ scp user@ip:remote/path/ local_path_to_dest
```

> Use `scp -r` to download/upload a folder will all its content.
</div></div>

<hr class="sep-both">

## Samba - 445 (or 139 before, tcp)

<div class="row row-cols-md-2"><div>

[Samba](https://www.samba.org/) is making both file exchange system of Linux (NFS), and Windwos (SMB) work together. It's mostly used to share file internally, by connecting every computer, printer... to a **share**, a shared folder.

Connect

```bash
$ smbclient //IP/share_name
$ smbclient smb://IP/share_name
```

Download everything in a share

```bash
$ smbget -R //IP/share_name
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
</div></div>

<hr class="sep-both">

## Remote Desktop Protocol (RDP) - 3389 (tcp)

<div class="row row-cols-md-2"><div>

A protocol used to connect a desktop with a graphical interface to another computer over a network connection.

There is [rdesktop](https://github.com/rdesktop/rdesktop) (1.1k ⭐).

There is [FreeRDP](https://github.com/FreeRDP/FreeRDP) (7.5k ⭐), and there is a graphical version too [xfreerdp-gui](https://github.com/wyllianbs/xfreerdp-gui) (29 ⭐).

```bash
$ xfreedrp /u:x /p:y /v:ip
```
</div><div>

There is [Remmina](https://github.com/FreeRDP/Remmina) (1.9k ⭐, `apt install remmina`) which is an easy-to-use graphical.

* `remmina`: start the graphical interface
    * Enter the IP of the target
    * Enter the credentials
    * Connect
* Then, I would advise to toggle "dynamic resolution update" in the left menu, so that you have a bigger screen.
</div></div>