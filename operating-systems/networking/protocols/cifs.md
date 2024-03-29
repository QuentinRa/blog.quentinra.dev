#  Common Internet File System (CIFS)

[![attacking_common_services](../../../cybersecurity/_badges/htb/attacking_common_services.svg)](https://academy.hackthebox.com/course/preview/attacking-common-services)

<div class="row row-cols-lg-2"><div>

The Common Internet File System (CIFS) protocol was developed by Microsoft for file sharing. It's built over the [SMB](/operating-systems/networking/protocols/smb.md) protocol.

🐊️ **Ports**: 445 (TCP) <small>(the only SMB port used by CIFS)</small>

To mount a remote file system that supports the CIFS protocol:

```shell!
$ sudo mount -t cifs -o username=xxx,password=xxx //IP/share_name /mount/point
$ sudo mount -t cifs -o username=xxx,password=xxx //IP/"share name" /mount/point
```
</div><div>

You may have to install `cifs-utils` beforehand:

```shell!
$ sudo apt-get install cifs-utils
```
</div></div>