# QEMU

<div class="row row-cols-lg-2"><div>

[QEMU](https://github.com/qemu/qemu) is an open-source emulator.  There is a GUI called [virt-manager](https://github.com/virt-manager/virt-manager).

```shell!
$ sudo apt install qemu-system-x86
$ qemu-system-x86_64 -h
```

* [Documentation](https://www.qemu.org/docs/master/) ⛪
* [Wiki](https://wiki.qemu.org/Documentation) 🔥
</div><div>

QEMU uses the `.qcow2` <small>(QEMU Copy On Write)</small> format for hard drives.

```shell!
$ # format (.qcow2) | drive_name | drive_size
$ qemu-img create xxx.qcow2 1G
$ qemu-img create -f qcow2 xxx.qcow2 4G
```
</div></div>

<hr class="sep-both">

## Common usage

<div class="row row-cols-lg-2"><div>

The most basic usage is to boot on a hard drive:

```shell!
$ qemu-system-x86_64 -hda xxx.qcow2
```

#### Performance flags

```shell!
$ [...] -m 2048        # RAM = 2G
$ [...] -smp 2         # 2 cores
```
</div><div>

#### Interface-related flags

```shell!
$ [...] -nographic     # disable GUI, terminal-only interface
shutdown -h now
$ [...] -sdl           # use the SDL
```

#### Other flags

```shell!
$ [...] -snapshot      # don't save to hard-drive
```
</div></div>

<hr class="sep-both">

## Networking

<div class="row row-cols-lg-2"><div>

#### NAT network

You can use NAT which is the default. The VM will have the same network configuration as the host, but no one can reach the host.

```shell!
$ # both are similar, the latter can be more tuned
$ [...] -net user
$ [...] -netdev user,id=net0 \
    -device virtio-net-pci,netdev=usernet
```
</div><div>

#### TAP Network

A TAP network simulates that the host and the VM are connected physically. Both are on the same network and can reach each other.

```shell!
$ sudo ip tuntap add dev tap0 mode tap
$ sudo ip link set tap0 up
$ qemu[...] -netdev tap,ifname=tap0,id=br0 \
    -device virtio-net-pci,netdev=br0 # ,mac=...
```
</div></div>

<hr class="sep-both">

## 👻 To-do 👻

Stuff that I found, but never read/used yet.

<div class="row row-cols-lg-2"><div>

* QEMU monitor console
* [baeldung: QEMU from terminal](https://www.baeldung.com/linux/qemu-from-terminal)
* `-enable-kvm` (faster, if available)
* `qemu-system-x86_64 -boot d -cdrom xxx.iso [...]`
</div><div>
</div></div>