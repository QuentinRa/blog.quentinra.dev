# Processes

<div class="row row-cols-md-2"><div>

A process represents a running program or application. It includes information about the context of execution:

* 🔑 a pid <small>(process id, unique)</small>
* 💍 a ppid <small>(process id of the parent, -1 if the parent is dead)</small>
* 📄 a code to execute <small>(current instruction, next instruction...)</small>
* 🪸 an environment <small>(file descriptors, parameters, permissions...)</small>
* 🧪 some data <small>(variables, environment variables, stack...)</small>
* ...

Processes are stored in `/proc/`, in a folder named after their PID.
</div><div>

➡️ A **daemon** is a process that never ends. By convention, their name usually ends with `d` such as `systemd`.

➡️ If a parent process dies, their children won't die, and will be assigned $-1$ as their PPID.
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
$ kill 15 pid
$ kill -s TERM pid
$ kill -SIGTERM pid
```
</div><div>

Other signals:

* `-9` / SIGKILL: kill without cleanup
* `-19` / SIGSTOP: suspend
* ...

You can use `-l` to see the code for a given signal

```shell!
$ kill -l SIGSTOP
19
```
</div></div>

++++++

<hr class="sep-both">

## 👻 To-do 👻

Stuff that I found, but never read/used yet.

<div class="row row-cols-md-2"><div>

* Signals
* Pipes
* Sockets
* Semaphores
* Mutexes
* Condition variables
</div><div>

* [_old](_old.md)
</div></div>