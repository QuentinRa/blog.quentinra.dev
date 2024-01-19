# Linux Containers (LXC)

[![linuxsystemhardening](../../../../cybersecurity/_badges/thmp/linuxsystemhardening.svg)](https://tryhackme.com/room/linuxsystemhardening)
[![linuxfundamentals](../../../../cybersecurity/_badges/htb/linuxfundamentals.svg)](https://academy.hackthebox.com/course/preview/linux-fundamentals)
[![linuxprivilegeescalation](../../../../cybersecurity/_badges/htb/linuxprivilegeescalation.svg)](https://academy.hackthebox.com/course/preview/linux-privilege-escalation)

<div class="row row-cols-lg-2"><div>

[Linux Containers](https://linuxcontainers.org/) (LXC) is a Linux only virtualization method to run multiple Linux systems using the host Linux kernel.

[Docker](../docker/index.md) is built over LXC. It provides additional features and a simplified interface. They share the notion of 'image' and 'container'.

LXC can only be used on Linux hosts. Users part of the `lxd` group can call any commands without sudo.
</div><div>

Random commands:

```shell!
$ lxd init
$ lxc launch ubuntu:22.04 container_name
$ lxc image import image.tar.gz --alias image_name
$ lxc init image_name container_name
$ lxc start container_name
$ lxc exec container_name /bin/bash
```
</div></div>

<hr class="sep-both">

## Pentester Notes ☠️

<div class="row row-cols-lg-2"><div>

Create a container mounting the underlying file system.

```
$ lxc init image_name container_name -c security.privileged=true
$ lxc config device add container_name device_name disk source=/ path=/mnt/hostfs recursive=true
$ cd /mnt/hostfs/ # on the container
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