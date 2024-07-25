# AppArmor

<div class="row row-cols-lg-2"><div>

AppArmor can be used to define policies for programs. It can be used to define access controls beyond the permissions of the user.

AppArmor is path-based: the target and the restrictions are paths.

```shell!
$ sudo apt-get install apparmor apparmor-utils
```

Use the command `aa-genprof` to generate a policy for a program. The command `aa-complain` can be used to monitor violations.
</div><div>
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