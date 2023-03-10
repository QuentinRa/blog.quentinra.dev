# Knowledge about Linux

<div class="row row-cols-md-2"><div>

<br>

<p class="text-center">

<img alt="Linux Logo" src="/courses/operating-systems/linux/knowledge/_images/linux.png" width="128"/>
</p>

Linux is a family of Unix-like operating systems, often called distros, such as Debian, Ubuntu, Fedora, or Arch Linux... They were designed to be free, open-source, light, secure, and performant.

➡️ Each distro has its pro and cons according to what specific usage they were designed for <small>(ex: gaming, security, performance...)</small>.
</div><div>

Linux in its simplest form is a **command-line interface** (CLI), commonly referred to as terminal/shell <small>(or console/command prompt)</small>.

![Linux: Terminal](_images/terminal.png)

Inside the CLI, we can run commands interpreted by a **shell** 🐚.  There are multiple shell languages <small>(sh, csh, tcsh, ksh, bash)</small>, however most Linux distributions are using **bash** <small>(bourne again shell)</small> 🔥. Most shell languages are improved versions of sh 🪦.

👉 Note that shell, the CLI, and a terminal are not the same thing, although they are closely related, hence the common misuse.
</div></div>

<hr class="sep-both">

## Commands 

<div class="row row-cols-md-2"><div>

A command has **a name**, which may be followed by **arguments**, including some usually called **flag**/**switches** (`options`). The difference between both is that a flag starts with a `-`.

Below are some examples with the command `ls`:

<div class="row row-cols-md-2"><div>

No arguments.

```ps
$ ls
```

One argument.

```ps
$ ls toto.txt
$ ls "toto.txt"
```
</div><div>

Two flags.

```ps
$ ls -l -a
$ ls -la
```

Two arguments with one flag.

```ps
$ ls -la toto/
```
</div></div>
</div><div>

A few takeaways:

* 🛣️ you are writing commands right after the `$`
* 👉 press <kbd>ENTER</kbd> to execute a command
* 💥 press <kbd>CTRL-C</kbd> to cancel/kill a command
* ✅ press <kbd>CTRL-D</kbd> to end the input
* 🚀 Usually, flags can be merged <small>(ex: `-l -a` is the same as `-la`)</small>.
* 🗺️ Most commands have an option "help": `-h`, `-help`, or `--help`

🌍 **Browse the manual** (`man`) to learn more about some command

```bash
$ man ls
```

🤘 Use **tab key to autocomplete** commands/paths

```bash
$ ls /<TAB>
# will display every path starting with "/"
```
</div></div>

<hr class="sep-both">

## 👻 To-do 👻

Stuff that I found, but never read/used yet.

<div class="row row-cols-md-2"><div>

* [old](_old.md)
</div><div>


</div></div>