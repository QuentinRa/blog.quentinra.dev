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
* SSH
  * `/etc/ssh/sshd_config`
  * `PermitRootLogin no`
  * `PubkeyAuthentication yes`
  * `PasswordAuthentication no`
  * `ssh-copy-id username@server`: add to remote server our public key
* Sudoers: `usermod -aG wheel username` (Fedora, RedHat)
* Disable root account (`/sbin/nologin`)
* Stong password policy
* Disable login to service accounts (www-data...)
* See `/etc/group` to see members of a group
* `dnf update/yum update` (Fedora, Redhat)
  * `cat /etc/apt/sources.list`
* Use LTS
  * https://ubuntu.com/about/release-cycle
  * https://access.redhat.com/support/policy/updates/errata/
</div></div>