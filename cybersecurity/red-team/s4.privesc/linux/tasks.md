# Scheduled tasks

[Go back](../index.md#linux-privilege-escalation-)


[![startup](../../../_badges/thm-p/startup.svg)](https://tryhackme.com/room/startup)

<div class="row row-cols-md-2"><div>

Scheduled tasks on Linux are called [cron jobs](/operating-systems/linux/knowledge/index.md#cron-jobs).

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
</div></div>