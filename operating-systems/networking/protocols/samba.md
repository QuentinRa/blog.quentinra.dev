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