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

* `who`: who is logged in
* `echo $0`: language used by the current shell
* `whoami`: username
* `id`: username, group...
* `uname -a`: info about the machine
* `hostname`: info about the host
* `ps`: see running processes
* `env`: see environment variables
* `getent`: shortcut to get entries about something, such as `passwd`
</div></div>

<hr class="sr">

## Linux key files

<div class="row row-cols-md-2 mt-3"><div>

**Look for (sensitive?) information** 🔑

* `/etc/passwd`: usernames, their groups, their home, and their shell
* `/etc/shadow` <small>(root)</small>: username, and their hashed password
* `/etc/group`: groups
* `/etc/gshadow` <small>(root)</small>: groups hashed passwords (if any)
* `/proc/version`: information about the machine
* `cat /etc/*release`: information about the operating system
* `/etc/sudoers` <small>(root)</small>: sudoers, and rules applied to them, if any
* `find / -name id_rsa 2> /dev/null`: rsa credentials

**Logs** 🗺️

* `/var/log/` (folder): log files
* Look for ufw (firewall) logs
* Look for apache logs
* Look for fail2ban logs
* Look for backups <small>(such as emails/conversations/database)</small>
* `~/.bash_history`: there may be something useful in the bash_history
</div><div>

**Cron tasks** ⭐

Cron are the name given to automated tasks on Linux. See `crontab -l` for the tasks of the current user, and `ls -la /etc/cron*` for every cron tasks.

<br>

**Potentially vulnerable services** 😢

* Apache: `apache2 -v` / `httpd -v`
* Sudo: `sudo -V`
</div></div>

<hr class="sl">

## Linux automated exploration

<div class="row row-cols-md-2"><div>

There are many scripts checking if there are "common" files, testing commands... in order to look for information that would be useful for you to reach a higher level of privilege.

* [LinEnum](https://github.com/rebootuser/LinEnum) (5k ⭐): a script shell
* [linuxprivchecker](https://github.com/sleventyeleven/linuxprivchecker) (1k ⭐): a python script
</div><div>

...
</div></div>