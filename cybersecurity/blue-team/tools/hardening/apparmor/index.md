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