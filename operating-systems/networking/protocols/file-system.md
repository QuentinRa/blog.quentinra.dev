# Network file system

<hr class="sep-both">

## Samba

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

## Network File System (NFS)

<div class="row row-cols-md-2 mt-2"><div>

Network File System (NFS) is a protocol allowing a computer to mount a remote folder on its local file system.

🐊️ **Port**: 2049 (TCP)

Remote Procedure Calls (RPC) are used to exchange with the server.

**List mounts** 🗺️

```bash
$ showmount -e IP
# see NFS exports
$ cat /etc/exports
```
</div><div>

**Mount/Unmount** 🤘

The command below will mount the remote folder `/share` inside `/tmp/share` on our machine. It means that when we browse `/tmp/share`, we will see the files inside `/share` on the remote host.

```bash
#  sudo apt install nfs-common
$ mkdir /tmp/share
$ sudo mount -t nfs IP:/share /tmp/share/ -nolock
# there is also variants (with/without vers=2): 
# sudo mount -o rw,vers=2 IP:/share /tmp/share/
# unmount
$ sudo umount /tmp/share
```
</div></div>

<hr class="sep-both">

## 👻 To-do 👻

Stuff that I found, but never read/used yet.

<div class="row row-cols-md-2"><div>

NFS

* nfs-utils
* rpcinfo
* nfsstat
* nfswatch
* DoS
</div><div>
</div></div>