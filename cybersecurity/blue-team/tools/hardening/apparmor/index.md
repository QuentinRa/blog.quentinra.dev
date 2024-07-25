# AppArmor

[![apparmor_jail_introduction](../../../../_badges/hacktricks/linux_hardening/privilege_escalation/docker_security/apparmor.svg)](https://www.root-me.org/en/Challenges/App-Script/AppArmor-Jail-Introduction)

<div class="row row-cols-lg-2"><div>

AppArmor can be used to define policies for programs. It can be used to define access controls beyond the permissions of the user.

AppArmor is path-based: the target and the restrictions are paths.

```shell!
$ sudo apt-get install apparmor apparmor-utils
```

Use the command `aa-genprof` to generate a policy for a program. The command `aa-complain` can be used to monitor violations.
</div><div>

To check if there is an apparmor policy in place:

```ps
$ cat /proc/self/attr/current
```

📚 `unconfined` means there is no apparmor.

</div></div>

<hr class="sep-both">

## AppArmor With Docker

<div class="row row-cols-lg-2"><div>

AppArmor is commonly used with docker. Given, `my_apparmor_conf`:

```bash!
#include <tunables/global>

profile docker_apparmor flags=(attach_disconnected,mediate_deleted) {
    #include <abstractions/base>

    # Allow them to execute commands
    /bin/** ix,
    /usr/bin/** ix,

    # Forbid access to the flag
    / r,
    /** r,
    deny /flag.txt r,
}
```
</div><div>

The following `Dockerfile`:

```dockerfile!
FROM debian:bookworm-slim
RUN apt-get update && apt-get install -y apparmor bash
WORKDIR /home/dummy
RUN cp /bin/bash bash
RUN echo "flag{you_found_me}" > /home/dummy/flag.txt
```

Run these commands:

```ps
$ docker build -t apparmor_dummy .
$ sudo apparmor_parser -r ./my_apparmor_conf
$ docker run -it --rm --security-opt "apparmor=docker_apparmor" apparmor-dummy
```

And the flag should be neither readable nor modifiable.
</div></div>

<hr class="sep-both">

## AppArmor Bypasses

<div class="row row-cols-lg-2"><div>

#### Unconstrained Mode

[![apparmor_jail_introduction](../../../../_badges/rootme/app_script/apparmor_jail_introduction.svg)](https://www.root-me.org/en/Challenges/App-Script/AppArmor-Jail-Introduction)

Some configurations may allow executables or libraries to be loaded in unconstrained mode: the policy is not applied on them.

```bash!
/usr/bin/head ux,
/lib/x86_64-linux-gnu/ld-*.so mrux,
...
```

You need to find a way to exploit them:

```shell!
root# cat flag.txt 
cat: flag.txt: Permission denied
root# head flag.txt 
flag{you_found_me}
root# /lib/x86_64-linux-gnu/ld-linux-x86-64.so.2 cat flag.txt
flag{you_found_me}
```

<br>

#### Nested Profiles — Broad Rules

If a profile is applied on a specific executable, the rules of the parent may be overridden by the new profile.

```bash!
profile docker_apparmor flags=(attach_disconnected,mediate_deleted) {
    /tmp/bash px -> custom_apparmor,
    deny /flag.txt r,
}

profile custom_apparmor flags=(attach_disconnected,mediate_deleted) {
    # The rule on /flag.txt is overriden
    / r,
}
```
</div><div>

#### Mount Permission

More on this later. Refer to the `unshare` command.

```bash!
mount,
```

<br>

#### Nested Profiles — Lax File Permissions

[![apparmor_jail_introduction](../../../../_badges/rootme/app_script/apparmor_jail_introduction.svg)](https://www.root-me.org/en/Challenges/App-Script/AppArmor-Jail-Introduction)

If we have enough permissions to replace an executable, we may be able to create an unconstrained executable.

Assuming we are forced to use a constrained executable `/opt/wrapper`, and other executables are not constrained.

```bash!
/opt/wrapper px -> wrapper_profile,
```

If we have write access to `/opt/wrapper`, we can link it to an unconstrained executable and effectively bypass the `wrapper_profile`.

```shell!
$ ln -s /bin/bash /opt/wrapper
$ exit # and connect back or whatever you did to get in
```
</div></div>