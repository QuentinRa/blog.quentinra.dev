# Restricted Shells

[![linuxprivilegeescalation](../../../../_badges/htb/linuxprivilegeescalation.svg)](https://academy.hackthebox.com/course/preview/linux-privilege-escalation)
[![escaping_from_jails](../../../../_badges/hacktricks/escaping_from_jails.svg)](https://book.hacktricks.xyz/linux-hardening/privilege-escalation/escaping-from-limited-bash#bash-jails)

<div class="row row-cols-lg-2"><div>

A restricted shell such as `rbash` is a shell that restrict the action of the user to a limited list of commands/arguments. For instance, for rBASH:

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

If you can run commands, refer to [GTFOBins](../tools/gtfobins.md) or their manual. For VIM:

```ruby!
:set shell=/bin/bash
:shell
```
</div></div>

<hr class="sep-both">

## Restricted Bash (rbash)

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