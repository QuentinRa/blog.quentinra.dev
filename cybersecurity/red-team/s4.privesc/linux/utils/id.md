# Identification

[![linuxprivilegeescalation](../../../../_badges/htb/linuxprivilegeescalation.svg)](https://academy.hackthebox.com/course/preview/linux-privilege-escalation)
[![linprivesc](../../../../_badges/thm/linprivesc.svg)](https://tryhackme.com/room/linprivesc)
[![commonlinuxprivesc](../../../../_badges/thmp/commonlinuxprivesc.svg)](https://tryhackme.com/room/commonlinuxprivesc)
[![commonlinuxprivesc](../../../../_badges/thmp/commonlinuxprivesc.svg)](https://tryhackme.com/room/commonlinuxprivesc)
[![adventofcyber2](../../../../_badges/thm/adventofcyber2/day11.svg)](https://tryhackme.com/room/adventofcyber2)

<div class="row row-cols-lg-2"><div>

**Users**

* `w`: who is logged in, and what they are doing
* `who`: who is logged in
* `whoami`: username
* `last`: list of last logged users
* `id`: username, group...
* `groups`: list groups
* `/etc/groups`: see members for each group
* `finger`: return a summary of information about a user

**Machine**

* `echo $0`: language used by the current shell
* `uname -a`: info about the kernel
* `hostname`: info about the host <small>(ex: `website-dev` -> role of the user)</small>
* `/proc/version`: information about the machine kernel
* `/etc/*release`: information about the operating system
* `/etc/issue`: an alternative to find the OS/version
* `ps -e` / `top`: see running processes, first column==owner
* `env`: see environment variables
* `lscpu`: list information about the CPU
</div><div>

**Permissions**

* `umask`: see the default perms on newly created files
* `find / -writable -type d 2>/dev/null`: find writable directories
* `/etc/passwd`: usernames, their groups, their home, and their shell
* `/etc/shadow` <small>(root)</small>: username, and their hashed password
* `/etc/sudoers` <small>(root)</small>: sudoers, and rules applied to them, if any

**Services**

* Apache: `apache2 -v` / `apache2ctl -M`
* Sudo: `sudo -V`
* PostgresSQL: `psql -V`
* MySQL: `mysql --version`
* Port and services: `/etc/services`
* Apps: `dpkg -l`

**Network**

* Ports: `netstat -antp | grep -i list`
</div></div>