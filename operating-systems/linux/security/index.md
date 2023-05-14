# Security

[![linuxsystemhardening](../../../cybersecurity/_badges/thmp/linuxsystemhardening.svg)](https://tryhackme.com/room/linuxsystemhardening)

<div class="row row-cols-md-2"><div>
...
</div><div>

...
</div></div>

<hr class="sep-both">

## 👻 To-do 👻

Stuff that I found, but never read/used yet.

<div class="row row-cols-md-2"><div>

* 💀 Grub (Linux bootloader) to reset the root password
  * ✅ BIOS and UEFI firmwares allow a boot Password
  * `grub2-mkpasswd-pbkdf2` (generate a hash to add to configuration)
  * [Ubuntu](https://help.ubuntu.com/community/Grub2/Passwords)
* Encryption systems
  * many modern Linux distributions ship with LUKS (Linux Unified Key Setup)
  * Partition list: `fdisk -l`, `lsblk` or `blkid`
  * Create partition: `fdisk`
  * Mount: `mount xxx yyy`
  * Format: `mkfs.ext4 xxx -L "XXX"`
  * `sudo cryptsetup -y -v luksFormat device`
  * `sudo cryptsetup luksOpen device name`
  * `sudo cryptsetup luksOpen --type luks device name`
  * `sudo cryptsetup luksDump device`
  * `sudo mount /dev/mapper/name dest`
</div><div>

* [apparmor](https://www.apparmor.net/) (`aa-status`, shipped with many linux distros)
* [SELinuxProject](https://github.com/SELinuxProject)
* `nftables` (improved iptables, scalability and performance)
  * `nft add table xxx`
  * `nft list table xxx` (list all chains and rules)
  * `nft add chain xxx yyy { type filter hook [input|output] priority 0 \; }`
  * `nft add fwfilter yyy tcp [sport/dport] 22 accept`
  * `nft delete table xxx`
* `iptables` (input, output, forward=routed through)
* `firewalld and ufw` (cli) fwbuilder (GUI)
  * `sudo ufw allow 22/tcp`
  * `sudo ufw status`
</div></div>