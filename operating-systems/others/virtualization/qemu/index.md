# QEMU

<div class="row row-cols-md-2"><div>

[QEMU](https://github.com/qemu/qemu) is virtualization software.

```
$ sudo apt install qemu
$ qemu-system-x86_64 -h
```
</div><div>

...
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
* `qemu-img create -f qcow2 xxx.qcow2 1G` (format name size, create a hard-drive) (native QEMU format, opt)
* `-drive file=xxx.qcow2,media=disk,if=virtio`
* `qemu-system-x86_64 -boot d -cdrom xxx.iso -m 2048 -hda /path/xxx.qcow2`
* `--enable-kvm` (faster, if available)
</div><div>
</div></div>