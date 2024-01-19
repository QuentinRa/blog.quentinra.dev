# File permissions

<hr class="sep-both">

## SUID/GUID bit

[![linprivesc](../../../_badges/thm/linprivesc.svg)](https://tryhackme.com/room/linprivesc)
[![linuxprivesc](../../../_badges/thm/linuxprivesc.svg)](https://tryhackme.com/room/linuxprivesc)
[![commonlinuxprivesc](../../../_badges/thmp/commonlinuxprivesc.svg)](https://tryhackme.com/room/commonlinuxprivesc)
[![vulnversity](../../../_badges/thm-p/vulnversity.svg)](https://tryhackme.com/room/vulnversity)
[![kenobi](../../../_badges/thm-p/kenobi.svg)](https://tryhackme.com/room/kenobi)
[![rrootme](../../../_badges/thm-p/rrootme.svg)](https://tryhackme.com/room/rrootme)
[![linprivesc](../../../_badges/thm-p/linprivesc.svg)](https://tryhackme.com/room/linprivesc#task-12)
[![cowboyhacker](../../../_badges/thm-p/cowboyhacker.svg)](https://tryhackme.com/room/cowboyhacker)

<div class="row row-cols-lg-2"><div>

This is a [permission](/operating-systems/linux/_knowledge/index.md#users-and-permissions) on Linux allowing users to execute a file with the permission of the owner (**SUID**) or the group owner (**GUID**).

```ps
# Variants: "-04000" "-4000" | "-4001"
$ find / -perm -u=s -type f -ls 2>/dev/null
$ find / -perm -g=s -type f -ls 2>/dev/null
```

Once you found a file with the SUID bit, either there is a known way to exploit it using [GTFOBins](tools/gtfobins.md), or you have to investigate manually.

<br>

#### pkexec - CVE-2021-4034

`/usr/bin/pkexec` a file installed by default on every major Linux distribution with a **SUID bit** could be exploited to get root. See [arthepsy PoC](https://github.com/arthepsy/CVE-2021-4034) (0.9k ⭐), or [berdav PoC](https://github.com/berdav/CVE-2021-4034) (1.7k ⭐).
</div><div>

#### Manual investigation

[![mustacchio](../../../_badges/thm-p/mustacchio.svg)](https://tryhackme.com/room/mustacchio)

If the script **hand-made**, or **not on GTFOBins**, then you can use refer to (basic) [Reverse Engineering](/cybersecurity/purple-team/reverse/index.md), e.g., the commands below to hopefully find which files and environment variables the script is using

* `strace`: see every system call
* `strings`: extract every readable string

You may be able to make the script do what you want by editing [environment variables or files](injection.md) that it uses.

<br>

#### Executable

When exploiting a command, you will usually want to run another executable. Two commands you will most likely run are:

* `/bin/bash -i`: start an interactive bash
* `/bin/bash -p`: do not drop privilege <small>(SUID, start the bash as root)</small>
</div></div>

<hr class="sep-both">

## Capabilities

[![linprivesc](../../../_badges/thm/linprivesc.svg)](https://tryhackme.com/room/linprivesc)
[![linuxprivilegeescalation](../../../_badges/htb/linuxprivilegeescalation.svg)](https://academy.hackthebox.com/course/preview/linux-privilege-escalation)
[![cap](../../../_badges/htb-p/cap.svg)](https://app.hackthebox.com/machines/Cap)

<div class="row row-cols-lg-2"><div>

Capabilities are a level below SUID/GUID permissions. 

It's possible for an administrator to allow an executable to use some "features" that usually would require root privileges <small>(ex: creating sockets, creating raw TCP packets...)</small>.

Find executables with capabilities

```ps
$ getcap -r / 2>/dev/null
```
</div><div>

➡️ Look for the executable on [GTFOBins](tools/gtfobins.md)

➡️ Use the same techniques as for [SUID/GUID](#suidguid-bit) files not on GTFOBins

```ps
$ getcap -r / 2>/dev/null
/usr/bin/python3 = cap_setuid
$ /usr/bin/python3 -c 'import os; os.execl("/bin/sh", "sh", "-p")'
```
</div></div>

<hr class="sep-both">

## Misconfigured system files

[![linuxprivesc](../../../_badges/thm/linuxprivesc.svg)](https://tryhackme.com/room/linuxprivesc)
[![commonlinuxprivesc](../../../_badges/thmp/commonlinuxprivesc.svg)](https://tryhackme.com/room/commonlinuxprivesc)

<div class="row row-cols-lg-2"><div>

If `/etc/passwd` was <s>intentionally</s> misconfigured or if it is a misconfigured embedded device.

```ps
$ cat /etc/passwd
# if you can write it: make your user part of root group
# if you can write it: add a new user that is part of root group
```

If `/etc/shadow` was <s>intentionally</s> misconfigured

```ps
$ cat /etc/shadow
# if you can read it: try to brute force the password
# if you can write it: change the root password
# (copy a password or generate one mkpasswd -m sha-512 toto)
```
</div><div>

If `/etc/sudoers` was <s>intentionally</s> misconfigured

```ps
$ cat /etc/sudoers
# if you can read it: find users that will be useful to compromise
# if you can write it: add yourself in
# your_user    ALL=(ALL:ALL) ALL
```

Until 1979/Unix V7, passwords were stored in `/etc/passwd`, so a regular user could read them, and try brute-forcing the password.

```ps
$ cat /etc/shadow
- root:x:...
+ root:hashed_password:...
# openssl passwd toto
```
</div></div>