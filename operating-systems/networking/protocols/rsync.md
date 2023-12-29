# RSync

[![linuxfundamentals](../../../cybersecurity/_badges/htb/linuxfundamentals.svg)](https://academy.hackthebox.com/course/preview/linux-fundamentals)
[![footprinting](../../../cybersecurity/_badges/htb/footprinting.svg)](https://academy.hackthebox.com/course/preview/footprinting)
[![wordpress](../../../cybersecurity/_badges/hacktricks/rsync.svg)](https://book.hacktricks.xyz/network-services-pentesting/873-pentesting-rsync)

<div class="row row-cols-lg-2"><div>

RSync is a protocol to synchronize the file between two folders, which is usually on different hosts. It's often used on Linux systems.

🐊️ **Port**: 873 (TCP)

It's possible to create rsync modules, which are essentially the same as shared folders such as with [NFS](nfs.md) or [SMB](smb.md).
</div><div>
</div></div>

<hr class="sep-both">

## RSync Pentester Notes ☠️

<div class="row row-cols-lg-2"><div>

* Try to list the rsync modules

```ps
$ sudo nmap -sV -p 873 IP
$ nc -nv IP 873
```

* Enumerate an open module

```ps
$ rsync -av --list-only rsync://IP/module_name
```
</div><div>
</div></div>

<hr class="sep-both">

## 👻 To-do 👻

Stuff that I found, but never read/used yet.

<div class="row row-cols-lg-2"><div>

* `rsync`:  sync two folders, often used for large amount of data, `rsync -av s d` (archive verbose) `-z` `--backup --backup-dir=/xxx` (restore) `--delete` `-e ssh`
* `-e "ssh -p22"`
* Deja Dup, Duplicity
</div><div>
</div></div>