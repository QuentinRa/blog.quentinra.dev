# Basics

<div class="row row-cols-md-2"><div>

Every linux command is a **process**. While you can learn more about [processes here](/operating-systems/linux/architecture/index.md#processes-and-scheduling) 🤓, some important takeaway are:

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

## 👻 To-do 👻

Stuff that I found, but never read/used yet.

<div class="row row-cols-md-2"><div>

* subshell
</div><div>

</div></div>