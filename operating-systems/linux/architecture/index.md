# Linux Architecture 🧪

An experimental set of notes about Linux internals. These notes extends [Architecture](/operating-systems/others/architecture/index.md).

<hr class="sr">

## Common files and folders

<div class="row row-cols-md-2"><div>

#### Special folders

The root of every folder is `/`.

##### User  Home (<code>domicile</code>) 🏡

Each user has its own folder, with their documents...

* The home of `username` is commonly at `/home/username/`
* See the environment variable `$HOME`.
* See the file `/etc/passwd` for the path of each user home
* The home folder of `root` is usually at `/root`

<br>

##### Binaries ⚒️

Folders used to store commands... such as `/bin/`, while `/usr/bin/` and `/usr/local/bin/` are also commonly used.

<br>

##### System folders 🏭

System configurations are commonly stored in `/etc/`. System logs and application logs are usually stored in `/var/log/`.

<br>

##### Other folders 🧑‍💻

* `/mnt`: mounted device/hard drives <small>(D:, USB...)</small>
* `/tmp`: a trash folder cleaned on reboot
</div><div>

#### Special files

Any file starting with <code>.</code> (dot) such as <code>.config</code> are **hidden files** 🤐.

##### Empty file 🧭

The file `/dev/null` is a sort of "trash file" in which everything you write inside is deleted. It's useful when redirecting error output.

<br>

##### Configuration files 🏭

* `/etc/passwd`: username, their UID, their GID, their home folder
* `/etc/shadow` <small>(root)</small>: users and their hashed password
* `/etc/group`: list of groups and their GID
* `/etc/hosts` <small>(root)</small>: map a domain to an IP, can be edit manually

<br>

##### /etc/sudoers

The file `/etc/sudoers` is a system configuration file defining which commands a user can run as another user, usually root.

For instance, to run any command as `root` without a password:

```ps
username ALL=(ALL) NOPASSWD:ALL 
```

Here, `tar` can be run as `user2` without password:

```ps
username ALL=(user2) NOPASSWD:/bin/tar
```
</div></div>

<hr class="sep-both">

## Processes and scheduling

*🚢 This section is further developed in the [Multitasking notes](/programming-languages/low-level/c/multitasking/index.md) in C programming.* <small>(**Signals, pipes, sockets, semaphores, mutexes, condition variables...**)</small>

<div class="row row-cols-md-2"><div>

A process is a box with stuff related to the execution of a program:

* 🔑 a pid <small>(process id, unique)</small>
* 💍 a ppid <small>(process id of the parent, -1 if the parent is dead)</small>
* 📄 a code to execute <small>(current instruction, next instruction...)</small>
* 🪸 an environment <small>(file descriptors, parameters, permissions...)</small>
* 🧪 some data <small>(variables, environment variables, stack...)</small>
* ...

When a machine boots up, the kernel process is started, with the pid 0. It starts a **daemon process** called `init` or `systemd` with the pid 1, which is the parent of every process.

👉 A **daemon** is a process that never ends. By convention, their name usually ends with `d`.

👉 Processes are stored in `/proc/`, in a folder named after their PID.

👉 If a parent process dies, their children **won't die**, and will be assigned $-1$ as their PPID.

➡️ Signals are used by processes to communicate. For instance, `CTRL+C` is firing a signal to forcefully kill a foreground process.

<br>

#### Process scheduling

The scheduler job is to to maximize the use of available resources while ensuring that each process receives a fair share of the CPU time.

To the user, it looks like applications are running in parallel, but its pseudo-parallelism. As the scheduler lets each process use the CPU a little bit, they are all running a little, and we won't notice that they are not executed at the same time.

👉 Some scheduling algorithm: round-robin, priority based...
</div><div>

#### Process termination

When a process dies, they are returning a code: $0$ is everything went fine ✅, and not $0$, if an error occurred ❌. You can use `$?` to see the exit code of the last process that died.

```bash!
$ echo $?
```

<br>

#### Sessions

Every process is attached to a session, which can be found with their value for **SID** (Session identifier). Most sessions are attached to a terminal (`/dev/tty`).

Sessions are partitioned into [groups of processes](https://en.wikipedia.org/wiki/Process_group). A signal sent to a group, is dispatched to every process of the group.

If a session dies, then the signal **SIGHUP** is sent to every process.

<br>

#### Foreground and background processes

A foreground process is a process receiving input from the user, while a background process is running but not receiving input.

They can only be one foreground process at a time inside a session. We use background processes to run long task not requiring user input. Background processes

* 😵 can't read, and may not be able to write on the terminal
* 🔕 aren't receiving signals, except **CTRL-Z** (suspend)

To run a command in the background, use `&`:

```ps
$ sleep 10 &
```
</div></div>

