# Linux Disks Enumeration

[![mirai](../../../../_badges/htb-p/mirai.svg)](https://app.hackthebox.com/machines/Mirai)

<div class="row row-cols-lg-2"><div>

It's possible that some medias such as USB keys are connect to the host. Look in `/media` for any of them.

```shell!
$ ls /media -lah
$ cat /proc/mounts | grep media
```

The second command will display the block device file associated with the mounted media [partition](/operating-systems/linux/env/files/index.md#edit-a-filesystem).

As this is a file, we can use grep to fix interesting strings on it. We can also dump it to [analyze it](/cybersecurity/blue-team/topics/forensics.md) using either:

```shell!
$ sudo dd if=/dev/sdb of=/tmp/data.bin bs=4M
$ sudo dcfldd if=/dev/sdb of=/tmp/data.bin
```
</div><div>
</div></div>

<hr class="sep-both">

## 👻 To-do 👻

Stuff that I found, but never read/used yet.

<div class="row row-cols-lg-2"><div>

* Unmounted hard drives
* `$ udevadm info -a -n /dev/xxx`
</div><div>
</div></div>