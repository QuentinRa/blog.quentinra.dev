# Scheduled tasks

[![linprivesc](../../../_badges/thm/linprivesc.svg)](https://tryhackme.com/room/linprivesc)
[![linuxprivesc](../../../_badges/thm/linuxprivesc.svg)](https://tryhackme.com/room/linuxprivesc)
[![commonlinuxprivesc](../../../_badges/thmp/commonlinuxprivesc.svg)](https://tryhackme.com/room/commonlinuxprivesc)
[![startup](../../../_badges/thm-p/startup.svg)](https://tryhackme.com/room/startup)
[![bashed](../../../_badges/htb-p/bashed.svg)](https://app.hackthebox.com/machines/Bashed)
[![celestial](../../../_badges/htb-p/celestial.svg)](https://app.hackthebox.com/machines/Celestial)
[![bash_cron](../../../_badges/rootme/app_script/bash_cron.svg)](https://www.root-me.org/en/Challenges/App-Script/Bash-cron)

<div class="row row-cols-lg-2"><div>

Scheduled tasks on Linux are called [cron jobs](/operating-systems/linux/_knowledge/index.md#cron-jobs). You may try [to inject some code](injection.md) for instance, using environment variables.

```ps
# tasks of the current user
$ crontab -l
# list every system-wide cron task
$ ls -la /etc/cron*
```

⚠️ System-wide cron tasks and user tasks are **not** stored in the same place. Only root can browse/list other users' cron tasks.

```ps
# tasks of the user 'root'
$ sudo ls /var/spool/cron/crontabs/root
$ sudo crontab -l -u root # same
```
</div><div>

But, there is another way to find users' cron tasks. You can monitor Linux processes, for instance, using [pspy](https://github.com/DominicBreuker/pspy) (3.2k ⭐) which can monitor Linux processes without root permissions.

```ps
$ # use wget/... to fetch the static binary
$ chmod +x /tmp/pspy
$ /tmp/pspy
```

⏰ In CTFs, they usually run every minute or every 5 minutes.

⚠️ If you create a script that is executed by a cron task, ensure the user reading the file has access to it <small>(if they are not root)</small>.
</div></div>