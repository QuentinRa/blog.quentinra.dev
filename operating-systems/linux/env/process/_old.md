# Linux Architecture 🧪

<div class="row row-cols-md-2"><div>

* use `&` to run a process in the background
</div><div>
</div></div>

<hr class="sep-both">

## Processes and scheduling

<div class="row row-cols-md-2"><div>

When a machine boots up, the kernel process is started, with the pid 0. It starts a **daemon process** called `init` or `systemd` with the pid 1, which is the parent of every process.

➡️ Signals are used by processes to communicate. For instance, `CTRL+C` is firing a signal to forcefully kill a foreground process.

<br>

#### Process scheduling

The scheduler job is to to maximize the use of available resources while ensuring that each process receives a fair share of the CPU time.

To the user, it looks like applications are running in parallel, but its pseudo-parallelism. As the scheduler lets each process use the CPU a little bit, they are all running a little, and we won't notice that they are not executed at the same time.

👉 Some scheduling algorithm: round-robin, priority based...
</div><div>

#### Sessions

Every process is attached to a session, which can be found with their value for **SID** (Session identifier). Most sessions are attached to a terminal (`/dev/tty`).

Sessions are partitioned into [groups of processes](https://en.wikipedia.org/wiki/Process_group). A signal sent to a group, is dispatched to every process of the group.

If a session dies, then the signal **SIGHUP** is sent to every process.

<br>

#### Foreground and background processes

[![linuxfundamentalspart1](../../../cybersecurity/_badges/thm/linuxfundamentalspart1.svg)](https://tryhackme.com/room/linuxfundamentalspart1)

A foreground process is a process receiving input from the user, while a background process is running but not receiving input.

They can only be one foreground process at a time inside a session. We use background processes to run long task not requiring user input. Background processes

* 😵 can't read, and may not be able to write on the terminal
* 🔕 aren't receiving signals, except **CTRL-Z** (suspend)

To run a command in the background, use `&`:

```shell!
$ sleep 10 &
```
</div></div>

