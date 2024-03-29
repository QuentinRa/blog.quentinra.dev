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

Additional Notes:

* [ForensicsTools](https://github.com/mesquidar/ForensicsTools) <small>(0.8k ⭐)</small>
</div></div>

<hr class="sep-both">

## Memory Forensics

<div class="row row-cols-lg-2"><div>

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
* [JumpBag](https://sourceforge.net/projects/jumpbag/)
* For VMWare, suspend the machine and locate the `.vmem`
* ...

#### Memory Forensics Dumps

Windows Memory Dumps:

* [MemLabs](https://github.com/stuxnet999/MemLabs)
</div><div>

#### Memory Dump Investigation

You can investigate a memory dump using:

* [Volatility](../tools/forensics/volatility.md) is a popular memory forensic tool.
* [rekall](https://github.com/google/rekall) <small>(1.9k ⭐, 2020 🪦)</small> is both archived and no longer maintained
* [MemProcFS](https://github.com/ufrisk/MemProcFS)  <small>(2.6k ⭐, Windows, Browse FS, [FS_FindEvil](https://github.com/ufrisk/MemProcFS/wiki/FS_FindEvil))</small>
</div></div>

<hr class="sep-both">

## Disk Forensics

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

<br>

#### Investigate Deleted Files

[![mirai](../../_badges/htb-p/mirai.svg)](https://app.hackthebox.com/machines/Mirai)
[![deleted_file](../../_badges/rootme/forensic/deleted_file.svg)](https://www.root-me.org/en/Challenges/Forensic/Deleted-file)

On Linux, `rm` doesn't delete a file, it only delete the file metadata which marks the memory as 'free to use/writable' by the operating system.

Given the image `data.bin`, these methods may be helpful:

```shell!
$ strings data.bin
$ strings -n xxx data.bin
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
$ photorec [...] # recover images using file carving
```
</div><div>

#### Investigate A Disk Dump

Run the command `fdisk -l mydisk` to learn more about the disk such as the unit size and the partitions <small>(note down the Start value)</small>.

You can mount it using `losetup`. Use `losetup -a` to check mounted disks. Assuming `/dev/loop0` is not used and the partition starts at `xxx`:

```
$ sudo losetup -o $((xxx*512)) /dev/loop0 mydisk
$ sudo mount -t vfat /dev/loop0 /mnt/mydisk
$ cd /mnt/mydisk # do what you want
$ sudo umount /mnt/mydisk
$ sudo losetup -d /dev/loop0
```

<br>

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

## Android Digital Forensics

<div class="row row-cols-lg-2"><div>

#### Android Gesture Lock Pattern

[![system_android_lock_pattern](../../_badges/rootme/cryptanalysis/system_android_lock_pattern.svg)](https://www.root-me.org/en/Challenges/Cryptanalysis/System-Android-lock-pattern)

Android phones can be protected by a lock patterns. The  minimum length is often 4, while there is no maximum length.

The top-left dot is index 0, the bottom-right is index 8. The sequence is SHA-1 hashed and store in `/data/system/gesture.key`.

```shell!
$ xxd -p data/system/gesture.key
[...] <--- gesture hash here
```

The fatest way to crack one is to use a rainbow table:

```ps
$ wget https://github.com/mspreitz/ADEL/raw/master/GestureRainbowTable.db
$ sqlite3 GestureRainbowTable.db 'Select * from RainbowTable where hash = "[...]"'
```

➡️ See also: [ADEL](https://github.com/mspreitz/ADEL) <small>(0.1k ⭐)</small>, [androidpatternlock](https://github.com/sch3m4/androidpatternlock) <small>(0.4k ⭐)</small>.
</div><div>
</div></div>

<hr class="sep-both">

## Malware Analysis

[![introduction_to_malware_analysis](../../_badges/htb/introduction_to_malware_analysis.svg)](https://academy.hackthebox.com/course/preview/introduction-to-malware-analysis)

<div class="row row-cols-lg-2"><div>

#### Malware Acquisition Tools

You can use the following sources to find malware:

* [theZoo](https://github.com/ytisf/theZoo) <small>(10.6k ⭐)</small>
* [virusshare](https://virusshare.com/) <small>(👻)</small>
* [hybrid-analysis](https://www.hybrid-analysis.com/file-collections) <small>(👻)</small>
* [malware-traffic-analysis](https://malware-traffic-analysis.net/) <small>(👻)</small>
* [app.any.run](https://app.any.run/) <small>(👻)</small>
* [contagiodump](https://contagiodump.blogspot.com/) <small>(👻)</small>
* [vx-underground](https://vx-underground.org/) <small>(👻)</small>


#### Malware Hashing Techniques

* Import Hashing (IMPHASH)

```py
import sys
import pefile
import peutils
pe = pefile.PE(sys.argv[1])
print(pe.get_imphash())
```

* Fuzzy Hashing (SSDEEP/CTPH)

```ps
$ ssdeep xxx.exe
```
</div><div>

#### Malware Analysis Tools

* [FLOSS](https://github.com/mandiant/flare-floss) <small>(3.0k ⭐)</small>

```ps
$ floss xxx.exe
```

* Section hashing — identify modified sections

```py
for section in pe.sections:
    print (section.Name, "MD5 hash:", section.get_hash_md5())
    print (section.Name, "SHA256 hash:", section.get_hash_sha256())
```
</div></div>

<hr class="sep-both">

## Linux Live Forensics

[![linuxfilesystemanalysis](../../_badges/thm/linuxfilesystemanalysis.svg)](https://tryhackme.com/r/room/linuxfilesystemanalysis)

<div class="row row-cols-lg-2"><div>

Binaries may have been tampered with. You should load yours.

```shell!
$ export PATH=/mnt/xxx/bin:/mnt/xxx/sbin
$ export LD_LIBRARY_PATH=/mnt/xxx/lib:/mnt/xxx/lib64
```

Inspect commonly used directories.

```shell!
$ ls /tmp
$ ls /var/tmp
$ ls /dev/shm
```

While inspecting files, such as using `stat`, you might inspect:

* mtime <small>(content modified)</small>
* ctime <small>(metadata modified)</small>
* atime <small>(accessed, unreliable)</small>
</div><div>

Look for backdoors:

* `/etc/passwd` for uid 0, and check each user groups
* `/etc/sudoers` for unexpected permissions

Additional notes:

* `.bash_history` may contains insight
</div></div>

<hr class="sep-both">

## 👻 To-do 👻

Stuff that I found, but never read/used yet.

<div class="row row-cols-lg-2"><div>

* [Arsenal Image Mounter](https://arsenalrecon.com/products/arsenal-image-mounter)
* [KAPE](https://www.kroll.com/en/services/cyber-risk/incident-response-litigation-support/kroll-artifact-parser-extractor-kape) (triage), [KapeFiles](https://github.com/EricZimmerman/KapeFiles)
* [velociraptor](https://github.com/Velocidex/velociraptor) (artifact gathering)
</div><div>

Intesting files

* `C:\Windows\Prefetch`: programs executed+last execution date
* `%AppData%\Microsoft\Windows\Recent`: recent files
* `USN Journal`: logs of file system changes
* [MFT Parser](https://github.com/EricZimmerman/MFTECmd)
* [mftexplorer](https://www.sans.org/tools/mftexplorer/): metadata for all files
</div></div>