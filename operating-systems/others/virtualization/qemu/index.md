# QEMU

<div class="row row-cols-md-2"><div>

[QEMU](https://github.com/qemu/qemu) is an open-source emulator.  There is a GUI called [virt-manager](https://github.com/virt-manager/virt-manager).

```shell!
$ sudo apt install qemu-system-x86
$ qemu-system-x86_64 -h
```

* [Documentation](https://www.qemu.org/docs/master/) ⛪
* [Wiki](https://wiki.qemu.org/Documentation) 🔥
</div><div>

QEMU uses the `.qcow2` <small>(QEMU Copy On Write)</small> format for hard-drives.

```shell!
$ # format (.qcow2) | drive_name | drive_size
$ qemu-img create xxx.qcow2 1G
$ qemu-img create -f qcow2 xxx.qcow2 4G
```
</div></div>

<hr class="sep-both">

## 👻 To-do 👻

Stuff that I found, but never read/used yet.

<div class="row row-cols-md-2"><div>

TAP network

* `-netdev tap, id=net0,...`
* `-device xxx,netdev=net0,mac=...` (NIC: model, net, MAC)
* `ip tuntap add xxx tap0 mode tap`

Random

* `[...],hostfwd=tcp::2222-:22`
* `-nographic`
* `shutdown -h now`
* `-m 2048` (RAM=2048 Mb)
* `-nographic` (no console, terminal-only)
* `qemu-img create -f qcow2 xxx.qcow2 1G` (format name size, create a hard-drive) (native QEMU format, opt, QEMU Copy On Write)
* `-drive file=xxx.qcow2,media=disk,if=virtio`
* `qemu-system-x86_64 -boot d -cdrom xxx.iso -m 2048 -hda /path/xxx.qcow2`
* `-enable-kvm`,`--enable-kvm` (faster, if available)
</div><div>

* [baeldung: QEMU from terminal](https://www.baeldung.com/linux/qemu-from-terminal)
</div></div>