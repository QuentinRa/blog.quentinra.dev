# Digital forensics

[![introduction_to_digital_forensics](../../_badges/htb/introduction_to_digital_forensics.svg)](https://academy.hackthebox.com/course/preview/introduction-to-digital-forensics)
[![introdigitalforensics](../../_badges/thm/introdigitalforensics.svg)](https://tryhackme.com/room/introdigitalforensics)
[![defensivesecurityhq](../../_badges/thm/defensivesecurityhq.svg)](https://tryhackme.com/room/defensivesecurityhq)
[![adventofcyber4](../../_badges/thm/adventofcyber4/day11.svg)](https://tryhackme.com/room/adventofcyber4)

<div class="row row-cols-lg-2"><div>

Forensics is the art of investigating crimes. Digital forensics is the same, but for cyber crimes.

* **Memory forensics** 🗺️: dig into a memory capture of a machine to investigate suspect behaviors and map the attack path.

* **Reverse engineering** 🤖: try to understand and investigate suspicious programs. Refer to [this page](/cybersecurity/purple-team/reverse/index.md).

* **File Investigation** ✈️: try to find hidden files, hidden messages, and hidden information in files. Refer to [this page](/cybersecurity/purple-team/files/index.md).
</div><div>

These categories further involve tasks such as:

* **Malware Analysis** 🪲: investigate malware to find what they did, what they do, how they work, etc.
</div></div>

<hr class="sep-both">

## Forensics Tools

*See also: [ForensicsTools](https://github.com/mesquidar/ForensicsTools) <small>(0.8k ⭐)</small>.*

<div class="row row-cols-lg-2"><div>

#### Disk Forensics Tools

[![introduction_to_digital_forensics](../../_badges/htb/introduction_to_digital_forensics.svg)](https://academy.hackthebox.com/course/preview/introduction-to-digital-forensics)
[![introduction_to_malware_analysis](../../_badges/htb/introduction_to_malware_analysis.svg)](https://academy.hackthebox.com/course/preview/introduction-to-malware-analysis)

You can create an image of a disk using:

* [FTK Imager](https://www.exterro.com/digital-forensics-software/ftk-imager) <small>(popular)</small>
* [OSFClone](https://www.osforensics.com/tools/create-disk-images.html)
* [dd/dcfldd](/cybersecurity/red-team/s4.privesc/linux/topics/drives.md)
* [AFF4 Imager](https://github.com/Velocidex/c-aff4)
* ...
</div><div>

#### Memory Forensics Tools

[![introduction_to_digital_forensics](../../_badges/htb/introduction_to_digital_forensics.svg)](https://academy.hackthebox.com/course/preview/introduction-to-digital-forensics)
[![introduction_to_malware_analysis](../../_badges/htb/introduction_to_malware_analysis.svg)](https://academy.hackthebox.com/course/preview/introduction-to-malware-analysis)
[![bpvolatility](../../_badges/thm/bpvolatility.svg)](https://tryhackme.com/room/bpvolatility)

To create a memory dump, you can use:

* [DumpIt.exe](https://www.aldeid.com/wiki/Dumpit)
* [WinPmem](https://github.com/Velocidex/WinPmem) <small>(0.6k ⭐)</small>
* [Redline](https://fireeye.market/apps/211364)
* [FTK Imager](https://www.exterro.com/ftk-imager)
* [memdump](https://www.kali.org/tools/memdump/)
* [LiME](https://github.com/504ensicsLabs/LiME) <small>(1.6k ⭐)</small>
* ...

You can investigate a memory dump using:

* [Volatility](../tools/forensics/volatility.md) is a well-known memory forensic tool.
</div></div>

<hr class="sep-both">

## Disk Forensics

<div class="row row-cols-lg-2"><div>

#### Investigate Deleted Files

[![mirai](../../_badges/htb-p/mirai.svg)](https://app.hackthebox.com/machines/Mirai)
[![deleted_file](../../_badges/rootme/forensic/deleted_file.svg)](https://www.root-me.org/en/Challenges/Forensic/Deleted-file)

On Linux, `rm` doesn't delete a file, it only delete the file metadata which marks the memory as 'free to use/writable' by the operating system.

Given the image `data.bin`, these methods may be helpful:

```shell!
$ strings data.bin
```

```shell!
$ sudo apt install foremost
$ foremost -i data.bin
```

```shell!
$ fls -rp data.bin
r/r * 5:        filename
$ icat -r data.bin 5 > filename
```

```shell!
$ debugfs -w data.bin
debugfs> lsdel
```

```shell!
$ testdisk data.bin
```
</div><div>

#### Investigate A Virtual Machine Dump

[![password_attacks](../../_badges/htb/password_attacks.svg)](https://academy.hackthebox.com/course/preview/password-attacks)
[![oh_my_grub](../../_badges/rootme/forensic/oh_my_grub.svg)](https://www.root-me.org/en/Challenges/Forensic/Oh-My-Grub)

You can mount a `.vmdk`/`.vhd` on Kali Linux using either:

```shell!
$ sudo apt install libguestfs-tools
$ sudo mkdir /mnt/vmdk
$ sudo guestmount -a xxx.vmdk -i --ro /mnt/vmdk
$ sudo ls -lah /mnt/vmdk/
$ sudo SHELL=/bin/bash chroot /mnt/vmdk/
$ sudo umount /mnt/vmdk
$ sudo rm -rf /mnt/vmdk
```

```shell!
$ sudo apt install qemu-utils
$ sudo modprobe nbd
$ sudo qemu-nbd -r -c /dev/nbd1 xxx.vmdk 
$ ls -al /dev/nbd1p* # list the disk partitions
```

You can now mount any partition one by one.

```shell!
$ mkdir p1 && sudo mount /dev/nbd1p1 ./p1
$ sudo SHELL=/bin/bash chroot p1
```

The drive may be [encrypted using BitLocker](/operating-systems/windows/security/index.md#bitlocker-encrypted-drive).
</div></div>

<hr class="sep-both">

## Malware Analysis

[![introduction_to_digital_forensics](../../_badges/htb/introduction_to_digital_forensics.svg)](https://academy.hackthebox.com/course/preview/introduction-to-digital-forensics)

<div class="row row-cols-lg-2"><div>

#### Malware Acquisition Tools

You can use the following sources to find malware:

* [theZoo](https://github.com/ytisf/theZoo) <small>(10.5k ⭐)</small>
* [virusshare](https://virusshare.com/) <small>(👻)</small>
* [hybrid-analysis](https://www.hybrid-analysis.com/file-collections) <small>(👻)</small>
* [malware-traffic-analysis](https://malware-traffic-analysis.net/) <small>(👻)</small>
* [app.any.run](https://app.any.run/) <small>(👻)</small>
* [contagiodump](https://contagiodump.blogspot.com/) <small>(👻)</small>
* [vx-underground](https://vx-underground.org/) <small>(👻)</small>
</div><div>
</div></div>

<hr class="sep-both">

## 👻 To-do 👻

Stuff that I found, but never read/used yet.

<div class="row row-cols-lg-2"><div>

* [Arsenal Image Mounter](https://arsenalrecon.com/products/arsenal-image-mounter)
</div><div>
</div></div>