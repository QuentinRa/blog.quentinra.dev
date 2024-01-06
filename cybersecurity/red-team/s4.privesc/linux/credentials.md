# Credentials

[![linuxprivesc](../../../_badges/thm/linuxprivesc.svg)](https://tryhackme.com/room/linuxprivesc)
[![ignite](../../../_badges/thm-p/ignite.svg)](https://tryhackme.com/room/ignite)
[![chillhack](../../../_badges/thm-p/chillhack.svg)](https://tryhackme.com/room/chillhack)

<div class="row row-cols-lg-2"><div>

You may try to look for credentials.

* 🔐 command history <small>(ex: ~/.bash_history)</small>
* 🌍 browser history
* 🛣️ [logs](/cybersecurity/blue-team/topics/logs.md) (`/var/log/`)
* 🐚 backups <small>(.old, .bak...)</small>
* ✉️ conversations/mails (`/var/mail/`)
* 🌳 website configurations (`.env`)
* ...

You often find interesting files in easy CTFs using:

```shell!
$ find / -user $(whoami) -type f 2>/dev/null | grep -v /proc | grep -v /sys
$ find / -type f -writable 2>/dev/null | grep -v /proc | grep -v /sys
```
</div><div>

Manually find interesting files

* `ls -ahl /root/`: test if root's home is readable
* `ls /`: look for unexpected folders in `/`

<br>

Find credentials, keys, tokens, passwords:

```ps
$ find / -name .ssh 2> /dev/null
$ find / -name *id_dsa* 2> /dev/null
```
</div></div>