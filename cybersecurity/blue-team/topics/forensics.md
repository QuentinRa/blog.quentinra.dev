# Digital forensics

[![introdigitalforensics](../../_badges/thm/introdigitalforensics.svg)](https://tryhackme.com/room/introdigitalforensics)
[![defensivesecurityhq](../../_badges/thm/defensivesecurityhq.svg)](https://tryhackme.com/room/defensivesecurityhq)
[![adventofcyber4](../../_badges/thm/adventofcyber4/day11.svg)](https://tryhackme.com/room/adventofcyber4)

<div class="row row-cols-lg-2"><div>

Forensics is the art of investigating crimes. Digital forensics is the same, but for cyber crimes.

* 💡 Memory forensics are investigations of a memory capture of a running machine to analyze suspect behaviors. [Volatility](../tools/forensics/volatility.md) is a well-known memory forensic tool.

* 🎁 [File investigation](../../purple-team/files/index.md) may help to find where a file is from...

* 🔎 ...

</div><div>

...
</div></div>

<hr class="sep-both">

## 👻 To-do 👻

Stuff that I found, but never read/used yet.

<div class="row row-cols-lg-2"><div>

[![mirai](../../_badges/htb-p/mirai.svg)](https://app.hackthebox.com/machines/Mirai)

* RM doesn't delete a file. It changes the metadata to indicate that the memory space is available.

```shell!
$ debugfs -w /dev/sdb
debugfs> lsdel
$ testdisk /dev/sdb # similar to debugfs
```
</div><div>

[![oh_my_grub](../../_badges/rootme/forensic/oh_my_grub.svg)](https://www.root-me.org/en/Challenges/Forensic/Oh-My-Grub)

Source: [jasonmurray](https://jasonmurray.org/posts/2021/mountvmdk/).

```shell!
sudo apt install qemu-utils
sudo modprobe nbd
sudo qemu-nbd -r -c /dev/nbd1 root-disk001.vmdk 
ls -al /dev/nbd1p*
mkdir p1 && sudo mount /dev/nbd1p1 ./p1
sudo SHELL=/bin/bash chroot p1

sudo apt-get install libguestfs-tools
sudo mkdir /mnt/vmdk
sudo guestmount -a root-disk001.vmdk -i --ro /mnt/vmdk
sudo ls -lah /mnt/vmdk/
sudo SHELL=/bin/bash chroot /mnt/vmdk/
sudo umount /mnt/vmdk
sudo rm -rf /mnt/vmdk
```
</div></div>