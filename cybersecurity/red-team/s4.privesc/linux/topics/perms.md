# File permissions

<hr class="sep-both">

## SUID/GUID bit

[![linprivesc](../../../../_badges/thm/linprivesc.svg)](https://tryhackme.com/room/linprivesc)
[![linuxprivesc](../../../../_badges/thm/linuxprivesc.svg)](https://tryhackme.com/room/linuxprivesc)
[![commonlinuxprivesc](../../../../_badges/thmp/commonlinuxprivesc.svg)](https://tryhackme.com/room/commonlinuxprivesc)
[![adventofcyber2](../../../../_badges/thm/adventofcyber2/day11.svg)](https://tryhackme.com/room/adventofcyber2)
[![vulnversity](../../../../_badges/thm-p/vulnversity.svg)](https://tryhackme.com/room/vulnversity)
[![kenobi](../../../../_badges/thm-p/kenobi.svg)](https://tryhackme.com/room/kenobi)
[![rrootme](../../../../_badges/thm-p/rrootme.svg)](https://tryhackme.com/room/rrootme)
[![linprivesc](../../../../_badges/thm-p/linprivesc.svg)](https://tryhackme.com/room/linprivesc#task-12)
[![cowboyhacker](../../../../_badges/thm-p/cowboyhacker.svg)](https://tryhackme.com/room/cowboyhacker)
[![archangel](../../../../_badges/thm-p/archangel.svg)](https://tryhackme.com/r/room/archangel)
[![blog](../../../../_badges/thm-p/blog.svg)](https://tryhackme.com/r/room/blog)

<div class="row row-cols-lg-2"><div>

This is a [permission](/operating-systems/linux/_knowledge/index.md#users-and-permissions) on Linux allowing users to execute a file with the permission of the owner (**SUID**) or the group owner (**GUID**).

```ps
# Variants: "-04000" "-4000" | "-4001"
$ find / -perm -u=s -type f -ls 2>/dev/null
$ find / -perm -g=s -type f -ls 2>/dev/null
```

Once you found a file with the SUID bit, either there is a known way to exploit it using [GTFOBins](../tools/gtfobins.md), or you have to investigate manually.

<br>

#### pkexec - CVE-2021-4034

[![linuxprivilegeescalation](../../../../_badges/htb/linuxprivilegeescalation.svg)](https://academy.hackthebox.com/course/preview/linux-privilege-escalation)
[![pwnkit](../../../../_badges/thm/pwnkit.svg)](https://tryhackme.com/r/room/pwnkit)
[![polkit](../../../../_badges/thm/polkit.svg)](https://tryhackme.com/r/room/polkit)

Policy Kit (Polkit) is part of the Linux authorization system. It used and installed by default on every major Linux distribution.

We can interact with it using the `/usr/bin/pkexec` **SUID** file. See [arthepsy PoC](https://github.com/arthepsy/CVE-2021-4034) <small>(1.0k ⭐)</small>, or [berdav PoC](https://github.com/berdav/CVE-2021-4034) <small>(1.9k ⭐)</small>.

Some distributions were also vulnerable to [CVE-2021-3560](https://nvd.nist.gov/vuln/detail/CVE-2021-3560).

📚 Example Usage: `/usr/bin/pkexec bash`

➡️ See also: `cve_2021_4034_pwnkit_lpe_pkexec` on Metasploit.
</div><div>

#### Manual investigation

[![mustacchio](../../../../_badges/thm-p/mustacchio.svg)](https://tryhackme.com/room/mustacchio)

If the script **hand-made**, or **not on GTFOBins**, then you can use refer to (basic) [Reverse Engineering](/cybersecurity/purple-team/reverse/index.md), e.g., the commands below to hopefully find which files and environment variables the script is using

* `strace`: see every system call
* `strings`: extract every readable string

You may be able to make the script do what you want by editing [environment variables or files](../utils/injection.md) that it uses.

<br>

#### Executable

When exploiting a command, you will usually want to run another executable. Two commands you will most likely run are:

* `/bin/bash -i`: start an interactive bash
* `/bin/bash -p`: do not drop privilege <small>(SUID, start the bash as root)</small>
</div></div>

<hr class="sep-both">

## Capabilities

[![linprivesc](../../../../_badges/thm/linprivesc.svg)](https://tryhackme.com/room/linprivesc)
[![linuxprivilegeescalation](../../../../_badges/htb/linuxprivilegeescalation.svg)](https://academy.hackthebox.com/course/preview/linux-privilege-escalation)
[![linux_capabilities](../../../../_badges/hacktricks/linux_hardening/privilege_escalation/linux_capabilities.svg)](https://book.hacktricks.xyz/linux-hardening/privilege-escalation/linux-capabilities)
[![cap](../../../../_badges/htb-p/cap.svg)](https://app.hackthebox.com/machines/Cap)

<div class="row row-cols-lg-2"><div>

Capabilities are a level below SUID/GUID permissions. They can be applied on files and processes.

```shell!
$ grep Cap /proc/self/status
CapInh:	0000000000000000 -- from parent to child; if requested
CapPrm:	0000000000000000 -- capabilities the process can use
CapEff:	0000000000000000 -- capabilities that are currently enabled
CapBnd:	00000000a80425fb -- the capabilities the processes are allowed to use
CapAmb:	0000000000000000 -- from parent to child; with conditions
$ capsh --decode="00000000a80425fb" # human readable
```

It's possible for an administrator to allow an executable to use some "features" that usually would require root privileges <small>(ex: creating sockets, creating raw TCP packets...)</small>.

Find executables with capabilities

```ps
$ getcap -r / 2>/dev/null
/usr/bin/python3 = cap_setuid+ep
$ /usr/bin/python3 -c 'import os; os.execl("/bin/sh", "sh", "-p")'
```

⚠️ Capabilities are often followed by `+` and a modifier.

* Effective (`e`): the permissions the process can use
* Permitted (`p`): the process can use or drop permissions
* Inheritable (`i`): permissions are inherited by child processes

To retain permitted capabilities when creating a new process, refer to [this thread](https://stackoverflow.com/questions/12141420/losing-capabilities-after-setuid). In Python, you could use [python-prctl](https://pythonhosted.org/python-prctl/).

```py
# Example: binary has 'setuid' with '+p'
# sudo apt install libcap-dev
# pip install python-prctl
import prctl
prctl.cap_effective.setuid=True
```

➡️ Look for the executable on [GTFOBins](../tools/gtfobins.md) or HackTricks.

➡️ Use [Linux Tracers](/cybersecurity/purple-team/reverse/index.md#linux-tracers) and alternatives for files not on GTFOBins
</div><div>

There are roughly 40 capabilities:

* `cap_chown`: could take over `/etc/shadow` to edit a password
* `cap_setuid`: set current user to be root (`0`)
* `cap_setgid`: set the current group to be root, shadow, docker, etc.
* `cap_dac_read_search`: arbitrary file reading, directory listing
* `cap_dac_override`: can write to any file
* `cap_sys_admin`: can mount filesystems
* `cap_sys_time`: arbitrary change the date and time, affect cron tasks
* `cap_kill`: kill a process, which may help if we need to restart it
* `cap_fowner`: we can change the permissions (`chmod`) to /etc/shadow
* `cap_setfcap`: we can set capabilities on any file
* `cap_linux_immutable`: can write to immutable files
* `cap_net_raw`: can create raw packets and sniff raw packets
* `cap_net_bind_service`: can use ports below 1024
* `cap_net_admin`: edit firewall configuration
* `cap_sys_ptrace`: can inject a shellcode into a process memory
* `cap_sys_module`: add and remove kernel modules
* ...

To add or remove capabilities, you can use:

```shell!
$ sudo setcap cap_setuid=eip your_binary
$ sudo setcap -r your_binary
$ sudo setcap --drop=cap_setuid your_binary
```
</div></div>

<hr class="sep-both">

## Special Groups

[![linuxprivilegeescalation](../../../../_badges/htb/linuxprivilegeescalation.svg)](https://academy.hackthebox.com/course/preview/linux-privilege-escalation)
[![linuxfilesystemanalysis](../../../../_badges/thm/linuxfilesystemanalysis.svg)](https://tryhackme.com/r/room/linuxfilesystemanalysis)
[![busqueda](../../../../_badges/htb-p/busqueda.svg)](https://app.hackthebox.com/machines/Busqueda)
[![gamingserver](../../../../_badges/thm-p/gamingserver.svg)](https://tryhackme.com/room/gamingserver)
[![chillhack](../../../../_badges/thm-p/chillhack.svg)](https://tryhackme.com/room/chillhack)
[![marketplace](../../../../_badges/thm-p/marketplace.svg)](https://tryhackme.com/r/room/marketplace)

<div class="row row-cols-lg-2"><div>

DO NOT ASSUME ANYTHING. A user not in a group <small>(not in the `sudo` group</small>, may still be able to perform the action <small>(e.g. run sudo)</small>.

* Users in the `adm` group are able to read all logs. Log management utilities such as [logrotate](https://linux.die.net/man/8/logrotate) may be vulnerable. See also: [logrotten](https://github.com/whotwagner/logrotten).

* See also: [Docker socket/permissions](/operating-systems/others/containers/docker/index.md#docker-pentester-notes-)

* See also: [LXC/LXD permissions](/operating-systems/others/containers/lxc/index.md#pentester-notes-)
</div><div>

* Users in the `shadow` group can read `/etc/shadow`

* Users in the `disk` group can read/write any file
</div></div>

<hr class="sep-both">

## Misconfigured system files

[![linuxprivesc](../../../../_badges/thm/linuxprivesc.svg)](https://tryhackme.com/room/linuxprivesc)
[![commonlinuxprivesc](../../../../_badges/thmp/commonlinuxprivesc.svg)](https://tryhackme.com/room/commonlinuxprivesc)

<div class="row row-cols-lg-2"><div>

If `/etc/passwd` was <s>intentionally</s> misconfigured or if it is a misconfigured embedded device.

```ps
$ cat /etc/passwd
# if you can write it: make your user part of root group
# if you can write it: add a new user that is part of root group
# if you can write it: remove the 'x' to su without password
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