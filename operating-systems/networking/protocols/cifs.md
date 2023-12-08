#  Common Internet File System (CIFS) 

<div class="row row-cols-lg-2"><div>

The Common Internet File System (CIFS) protocol was developed by Microsoft for file sharing. It's build over [SMB](/operating-systems/networking/protocols/smb.md).

🐊️ **Ports**: N/A <small>(uses SMB)</small>

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