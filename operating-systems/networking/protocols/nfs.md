# Network File System (NFS)

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