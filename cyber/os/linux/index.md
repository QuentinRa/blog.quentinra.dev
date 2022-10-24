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

* [LinEnum](https://github.com/rebootuser/LinEnum) (5k ⭐): a script shell
* [traitor](https://github.com/liamg/traitor)  (5k ⭐): a script in Go
* [linux-smart-enumeration](https://github.com/diego-treitos/linux-smart-enumeration) (2k ⭐): a script shell
* [linuxprivchecker](https://github.com/sleventyeleven/linuxprivchecker) (1k ⭐): a python script
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