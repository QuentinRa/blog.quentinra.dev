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

[**xxx** - xxx]

xxx

[**xxx** - xxx]

xxx

[**xxx** - xxx]

xxx

++++++

<hr class="sep-both">

## 👻 To-do 👻

Stuff that I found, but never read/used yet.

<div class="row row-cols-md-2"><div>

* subshell
</div><div>

</div></div>