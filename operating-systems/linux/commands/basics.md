# Basics

<div class="row row-cols-md-2"><div>

Every linux command is a **process**. While you can learn more about [processes here](/operating-systems/linux/env/index.md#processes-and-scheduling) 🤓, some important takeaway are:

* a process returns `0` if successful ✅, and `not 0` otherwise ❌.
* each process has a unique identifier called `pid`
* a process can be killed using `CTRL+C`
* use `&` to run a process in the background
</div><div>

Commands usually have an option "help". ⛪

```bash
$ man -h
$ find -help
$ gcc --help
```

⚠️ There is no echo/feedback when writing a password.
</div></div>

<hr class="sep-both">

## Process-related commands

++++++

[**top/htop** - list processes]

<div class="row row-cols-md-2"><div>

**Usage** 🐚: list all running processes, and their memory usage. This is the same as Windows task manager.

**Example** 🔥:

```ps
$ top
```
</div></div>

[**ps** - list/find processes]

<div class="row row-cols-md-2"><div>

**Usage** 🐚: list processes according to some criteria.

**Example** 🔥:

See all processes

```ps
$ ps -A # only user processes
$ ps -e # all
$ ps -ef # add more information
$ ps aux # add even more information
$ ps axjf # view process tree
```

Every process "bash"

```ps
$ ps -C bash
```

List processes by PID (`-s` for SID)

```ps
$ ps -p 12563
$ ps -p 12560,12563
$ ps -p {12590..12600}
```
</div><div>


List processes for a given user (`-g` for a group)

```ps
$ ps -u username
```

List processes by terminal identifier, or a path to the terminal

```ps
$ ps -t pts/0
$ ps -t /dev/pts/0
```

Change the output

```ps
$ ps -j # basic
$ ps -l # long
$ ps -o pid,ppid
$ ps -o pid,ppid,pgid,tpgid,sid
```
</div></div>

[**fg** - to foreground]

<div class="row row-cols-md-2"><div>

**Usage** 🐚: bring processes from the background to the foreground.

**Example** 🔥:

```ps
$ some_command &
[1] 89
$ fg
$ fg 1 # same
$ fg %1 # same
```
</div></div>

[**bg** - to background]

<div class="row row-cols-md-2"><div>

**Usage** 🐚: bring processes, that were not started using `&`, to the background.

**Example** 🔥:

```ps
$ some_command
# CTRL-Z
[1]+  Stopped
$ bg
$ bg 1 # same
$ bg %1 # same
```
</div></div>

[**jobs** - background processes]

<div class="row row-cols-md-2"><div>

**Usage** 🐚: list running background processes. Not available in every shell.

**Example** 🔥:

```ps
$ sleep 50&
[1] 36
$ jobs
[1]+  Running        sleep 50 &
```
</div></div>

[**kill** - send signals]

<div class="row row-cols-md-2"><div>

**Usage** 🐚: kill a process/send a signal.

**Example** 🔥:

All are sending "SIGTERM" <small>(soft kill, allow cleanup)</small>

```ps
$ kill pid
$ kill 15  pid
$ kill -s TERM  pid
$ kill -SIGTERM  pid
```
</div><div>

Other signals:

* `-9` / SIGKILL: kill without cleanup
* `-19` / SIGSTOP: suspend
* ...

You can use `-l` to see the code for a given signal

```bash
$ kill -l SIGSTOP
19
```
</div></div>

++++++

<hr class="sep-both">

## Strings manipulation

<div class="row row-cols-md-2 mx-0"><div>

When using commands, you will most likely use, or have to use strings. Most of the time, quotes are optional, and command arguments do not need to be quoted 🎯.

```ps
$ echo Hello, World
$ echo 'Hello, World'
$ echo "Hello, World"
```

Concatenation is also implicit. All of these are the same:

```ps
$ cat abc
$ cat "a"bc
$ cat "ab"c
$ cat "abc"
$ cat "a""bc"
```
</div><div>

There are times when we **must quote** an argument 🎣. For instance, when there is a space inside a name/path.

```
$ ls /Documents/my bookmarks/ # ❌
$ ls "/Documents/my bookmarks/" # ✅
$ ls '/Documents/my bookmarks/' # ✅
$ ls /Documents/my\ bookmarks/ # ✅
```

👉 The main difference between single and double quote is that in the former, variable are NOT interpreted. Refer to the [scripts section](/operating-systems/linux/scripts/index.md).

<details class="details-n">
<summary><code>expr</code>: substring, indexOf...</summary>

Length of a string

```bash
$ expr length "Sarah"
5
```

Extract a substring <small>("3" characters in "Sarah" from index "2")</small>

```bash
$ expr substr "Sarah" 2 3
ara
```

Index of a character in a string <small>(index of S/w in Sarah)</small>

```bash
$ expr index "Sarah" S
1
$ expr index "Sarah" w
0
```
</details>
</div></div>

<hr class="sep-both">

## Calculations

<div class="row row-cols-md-2 mx-0"><div>

You may want to do some stuff involving calculations. The shell won't interpret any calculations, so you must use `$[...]` or `$((...))` to evaluate something.

```ps
$ four=$[3+1]
$ four=$((3+1)) # same
```
</div><div>

Example of increasing a variable by one <small>(loops are covered in scripts)</small>.

```bash
i=0
while [ $i -lt 5 ]; do
   i=$[i+1] 
done
```
</div></div>

<hr class="sep-both">

## Pipes

[![linux2](../../../cybersecurity/_badges/thm/linux2.svg)](https://tryhackme.com/room/linux2)

<div class="row row-cols-md-2 mt-3"><div>

It's possible for a command output, to be used as the next command input using a pipe: **their_output | is_my_input**.

**Example** 🔥:

The command `wc -l` is used to count the number of lines in a text. The text could be a file, or some input like below:

```
$ wc -l
aaa
bbb
2 # two lines
```

➡️ As a reminder, use `CTRL+D` to indicate the end of the input.
</div><div>

The command `find . -name toto` find recursively every file named "toto" starting from the folder '`.`'. Its output is something like:

```ps
$ find . -name toto
./mem/all_toto_copy/toto
./mem/all_toto/toto
[...]
./mem/toto
```

Using a pipe, we can send the output of `find` to `wc`, and find the number of files (lines) returned by `find`:

```ps
$ find . -name toto | wc -l
57 # find returned 57 lines
```
</div></div>

<hr class="sep-both">

## Chaining commands

[![linuxfundamentalspart1](../../../cybersecurity/_badges/thm/linuxfundamentalspart1.svg)](https://tryhackme.com/room/linuxfundamentalspart1)
[![linux2](../../../cybersecurity/_badges/thm/linux2.svg)](https://tryhackme.com/room/linux2)

<div class="row row-cols-md-2"><div>

There are three reasons to chain commands:

* ✅ execute a command if the previous one was successful (`&&`)
* ❌ execute any command until one is successful (`||`)
* 🤝 put many commands in one line/statement (`;`)

For the two first ones, a command is said to be successful is the process exit code is **zero**. Otherwise, it failed.

```
$ cat not_found # a non-successful command
$ echo $?
1 # failure
```
</div><div>

**Examples** 🔥: 

Execute two commands in one go

```ps
$ ls toto; ls tata
```

Execute the second `ls` if the first was successful.

```ps
$ ls toto && ls tata
```

Execute the second `ls` if the first failed.

```ps
$ ls toto || ls tata
```
</div></div>

<hr class="sep-both">

## Redirections

[![linuxfundamentalspart1](../../../cybersecurity/_badges/thm/linuxfundamentalspart1.svg)](https://tryhackme.com/room/linuxfundamentalspart1)
[![linux2](../../../cybersecurity/_badges/thm/linux2.svg)](https://tryhackme.com/room/linux2)

<div class="row row-cols-md-2"><div>

Redirections allow us to:

* 🛁 fill `stdin` with a source such as a file
* 🗃️ redirect `stdout` to a file
* 🚩 redirect `stderr` to a file

There are multiple and varied uses:

* 🚀 fill commands needing user input with data from a file
* 🧑‍🏭 store results that we took a long time to compute, to avoid losing them or having to compute them again
* 🧯 redirect error to `/dev/null` <small>(discard errors)</small>
* 🪲 store errors for debugging purposes
* ...

**Examples** 🔥:

Redirect `stdout` to a file (save result)

```bash
$ echo "Hello, World" > myFile
```

Append `stdout` to a file

```bash
$ echo "Hello, World" >> myFile
```
</div><div>

Use a file instead of user input

```bash
$ tee < original.txt
Hello, World
```

Redirect errors to a file/discard them

```bash
$ cat not_found 2> onl_errors_will_be_stored_here
$ cat not_found 2> /dev/null # discard them
```

Merge `stderr` with `stdout` <small>(uncommon usage)</small>

```bash
$ cat not_found 2>&1
```

Discard `stdout`, but keep `stderr` <small>(uncommon usage)</small>

```bash
$ echo xxx &> /dev/null
```

Redirect both `stdout` and`stderr` <small>(uncommon usage)</small>

```bash
$ echo xxx > output.txt 2>&1
```
</div></div>

<hr class="sep-both">

## Special

<div class="row row-cols-md-2"><div>

#### Command substitution

Command substitution is mainly used in scripts, to store the result of a command inside a variable. In a nutshell, a command output is used as a parameter of another command: **xxx $(yyy)** or **xxx \`yyy\`**.

**Example** 🔥: all of these commands are the same

```ps
$ ls ~
$ ls `echo ~`
$ ls $(echo ~)
```
</div><div>

#### Subshell

A subshell is a shell that is launched within another shell, allowing us to execute commands without changing the parent shell environment.

**Example** 🔥: In the example below, we create a variable in a subshell, and print it. We also try to print the variable outside the subshell, but since the variable does not exist, the output is empty.

```bash!
$ (cat=toto; echo "1. $cat") && echo "2. $cat"
1. toto
2.
```

👉 It could be used to temporarily change location, set an environment variable for one command...
</div></div>

<hr class="sep-both">

## 👻 To-do 👻

Stuff that I found, but never read/used yet.

<div class="row row-cols-md-2"><div>

* terminal shortcuts <small>(CTRL +/-/L/D, scroll button...)</small> and CTRL+SHIFT+T to open a terminal.
</div><div>


</div></div>