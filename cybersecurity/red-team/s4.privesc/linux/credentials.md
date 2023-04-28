# Credentials

[Go back](../index.md#linux-privilege-escalation-)

[![ignite](../../../_badges/thm-p/ignite.svg)](https://tryhackme.com/room/ignite)

<div class="row row-cols-md-2"><div>

You may try to look for credentials.

* 🔐 command history <small>(ex: ~/.bash_history)</small>
* 🌍 browser history
* 🛣️ [logs](/cybersecurity/blue-team/logs.md) (`/var/log/`)
* 🐚 backups <small>(.old, .bak...)</small>
* ✉️ conversations/mails (`/var/mail/`)
* ...
</div><div>

Find interesting files

* `ls -ahl /root/`: see if there are readable files in root's home
* `ls /`: look for unexpected folders in `/`

Find [SSH](/operating-systems/networking/protocols/ssh.md) credentials

```ps
$ find / -name .ssh 2> /dev/null
$ find / -name *id_dsa* 2> /dev/null
```
</div></div>