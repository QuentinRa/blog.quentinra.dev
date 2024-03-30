# Scheduled tasks

[![password_attacks](../../../../_badges/htb/password_attacks.svg)](https://academy.hackthebox.com/course/preview/password-attacks)
[![linprivesc](../../../../_badges/thm/linprivesc.svg)](https://tryhackme.com/room/linprivesc)
[![linuxprivesc](../../../../_badges/thm/linuxprivesc.svg)](https://tryhackme.com/room/linuxprivesc)
[![commonlinuxprivesc](../../../../_badges/thmp/commonlinuxprivesc.svg)](https://tryhackme.com/room/commonlinuxprivesc)
[![adventofcyber2](../../../../_badges/thm/adventofcyber2/day9.svg)](https://tryhackme.com/room/adventofcyber2)
[![startup](../../../../_badges/thm-p/startup.svg)](https://tryhackme.com/room/startup)
[![easypeasyctf](../../../../_badges/thm-p/easypeasyctf.svg)](https://tryhackme.com/room/easypeasyctf)
[![archangel](../../../../../cybersecurity/_badges/thm-p/archangel.svg)](https://tryhackme.com/r/room/archangel)
[![teamcw](../../../../_badges/thm-p/teamcw.svg)](https://tryhackme.com/r/room/teamcw)
[![bashed](../../../../_badges/htb-p/bashed.svg)](https://app.hackthebox.com/machines/Bashed)
[![celestial](../../../../_badges/htb-p/celestial.svg)](https://app.hackthebox.com/machines/Celestial)
[![bash_cron](../../../../_badges/rootme/app_script/bash_cron.svg)](https://www.root-me.org/en/Challenges/App-Script/Bash-cron)
[![ultra_upload](../../../../_badges/rootme/realist/ultra_upload.svg)](https://www.root-me.org/en/Challenges/Cracking/Godot-Mono)

<div class="row row-cols-lg-2"><div>

Scheduled tasks on Linux are called [cron jobs](/operating-systems/linux/_knowledge/index.md#cron-jobs). You may try [to inject some code](/cybersecurity/red-team/s4.privesc/linux/utils/injection.md) for instance, using environment variables.

```ps
# tasks of the current user
$ crontab -l
# list every system-wide cron task
$ ls -la /etc/cron*
$ cat /etc/crontab
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

⚠️ If you create a script that is executed by a cron task, **ensure the user reading the file has access to it** <small>(if they are not root)</small>.
</div></div>