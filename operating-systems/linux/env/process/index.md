# Processes

<div class="row row-cols-lg-2"><div>

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

## Process States

<div class="row row-cols-lg-2"><div>

Processes can be in various states, including:

* Running 🛣️: actively executed on the CPU 
* Sleeping 💤: waiting for an event or a resource <small>(ex: I/O)</small>
* Stopped 🤖: halted or paused
* ...

When a process finishes its task, it will terminate itself. We can forcefully terminate a process using the [signal](#signals) `CTRL+C`.
</div><div>

When a process is terminated, it returns an exit code:

* If the process successfully executed the task ✅: `0`
* Otherwise, if it failed ❌: `not 0` <small>(usually from 1 to 255)</small>

We can use `$?` to query the exit code of the previous process:

```shell!
$ /bin/false
$ echo $?
1
$ /bin/true && echo $?
0
```
</div></div>

<hr class="sep-both">

## Foreground and background

[![linuxfundamentalspart1](../../../../cybersecurity/_badges/thm/linuxfundamentalspart1.svg)](https://tryhackme.com/room/linuxfundamentalspart1)

<div class="row row-cols-lg-2"><div>

A foreground process is a process receiving input from the user, while a background process is running but not receiving input.

They can only be one foreground process at a time inside a [session](#sessions). We use background processes to run long tasks that are not requiring user input. Background processes:

* 😵 can't read and may not be able to write output on the terminal
* 🔕 aren't receiving signals, except **CTRL-Z** (suspend)
</div><div>

To run a command in the background, use `&`:

```shell!
$ sleep 10 &
```
</div></div>

<hr class="sep-both">

## Process-related commands

++++++

[**top/htop** - list processes]

<div class="row row-cols-lg-2"><div>

**Usage** 🐚: list all running processes, and their memory usage. This is the same as Windows task manager.

**Example** 🔥:

```ps
$ top
```
</div></div>

[**ps** - list/find processes]

<div class="row row-cols-lg-2"><div>

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

<div class="row row-cols-lg-2"><div>

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

<div class="row row-cols-lg-2"><div>

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

<div class="row row-cols-lg-2"><div>

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

<div class="row row-cols-lg-2"><div>

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

## Random Notes

<div class="row row-cols-lg-2"><div>

#### Process scheduling

The scheduler job is to to maximize the use of available resources while ensuring that each process receives a fair share of the CPU time.

To the user, it looks like applications are running in parallel, but its pseudo-parallelism. As the scheduler lets each process use the CPU a little bit, they are all running a little, and we won't notice that they are not executed at the same time.

👉 Some scheduling algorithm: round-robin, priority based...

<br>

#### Signals

Signals can be used for communication between processes or between a user and a process. The most well-known process is `CTRL+C`. It forcefully terminates a foreground process.
</div><div>

#### Sessions

Every process is attached to a session identifiable with the **SID** <small>(Session identifier)</small> attribute. Most sessions are attached to a terminal (`/dev/tty`).

Sessions are partitioned into [groups of processes](https://en.wikipedia.org/wiki/Process_group). A signal sent to a group is dispatched to every process of the group.

If a session dies, then the [signal](#signals) SIGHUP is sent to every process.
</div></div>