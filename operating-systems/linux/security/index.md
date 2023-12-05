# Linux Security

[![linuxsystemhardening](../../../cybersecurity/_badges/thmp/linuxsystemhardening.svg)](https://tryhackme.com/room/linuxsystemhardening)
[![linuxfundamentals](../../../cybersecurity/_badges/htb/linuxfundamentals.svg)](https://academy.hackthebox.com/module/details/18)

<div class="row row-cols-lg-2"><div>
...
</div><div>

...
</div></div>

<hr class="sep-both">

## 👻 To-do 👻

Stuff that I found, but never read/used yet.

<div class="row row-cols-lg-2"><div>

* 💀 Grub (Linux bootloader) to reset the root password
  * ✅ BIOS and UEFI firmwares allow a boot Password
  * `grub2-mkpasswd-pbkdf2` (generate a hash to add to configuration)
  * [Ubuntu](https://help.ubuntu.com/community/Grub2/Passwords)
* Encryption systems
  * many modern Linux distributions ship with LUKS (Linux Unified Key Setup)
  * `sudo cryptsetup -y -v luksFormat device`
  * `sudo cryptsetup luksOpen device name`
  * `sudo cryptsetup luksOpen --type luks device name`
  * `sudo cryptsetup luksDump device`
  * `sudo mount /dev/mapper/name dest`
* [linux-securite](https://wonderfall.space/linux-securite/)
* [apparmor](https://www.apparmor.net/) (`aa-status`, shipped with many linux distros, application profiles to define which resources they can access)
* [SELinuxProject](https://github.com/SELinuxProject) (enforce access control on processes/files, labels, policy rules between labeled)
* Disable root account (`/sbin/nologin`) +service (`www-data`)
* Strong password policy
* Use LTS
  * https://ubuntu.com/about/release-cycle
  * https://access.redhat.com/support/policy/updates/errata/
* [Protection_ring](https://en.wikipedia.org/wiki/Protection_ring)
</div><div>

<details class="details-n">
<summary>LXC Linux Containers</summary>

Linux Containers (LXC). Virtualization technology. Uses cgroups and namespaces for isolation. Lightweight. Can have docker + LXC? Kernel must support virtualization.

```shell!
$ sudo apt-get install lxc lxc-utils -y
$ sudo lxc-create -n xxx -t yyy
$ lxc-ls 
$ lxc-start/stop/restart -n xxx
$ lxc-config -n xxx -s storage/network/security
$ lxc-attach -n xxx [-f /path/to/share]
```
</details>

Upgrade packages.

```
$ sudo apt update
$ sudo apt upgrade
$ sudo apt-get dist-upgrade
```

Disable `ssh` login for root/..., and change the default port.

```powershell
$ sudo vim /etc/ssh/sshd_config
$ sudo systemctl restart sshd
```

Install a firewall.

```powershell
$ sudo apt install fail2ban
$ sudo cp /etc/fail2ban/jail.conf /etc/fail2ban/jail.local
$ sudo vim /etc/fail2ban/jail.local
```
</div></div>