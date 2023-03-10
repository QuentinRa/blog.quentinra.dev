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

## File system

<div class="row row-cols-md-2 mt-3"><div>

A **path** 🛣️ is a suite of one or more folders 📂 that may lead to a regular file 📄. They are separated by a separtor which is: `/` <small>(slash)</small>.

```ps
$ pwd
/usr/home/toto/Documents/
```

The root folder <small>(similar to C: on Windows)</small> contains every other folder. It's the leading `/` of every path.

<br>

#### Regular and non-regular files

On Linux, "everything is a file". Folders, hard drives <small>(/mnt/)</small>, terminals <small>(/dev/)</small>, commands <small>(/bin/)</small>... Regular files are "normal" files. 

See the first character of the output of `ls -l`.
</div><div>

#### Absolute and relative paths

A path starting by the root is called **absolute path**. Otherwise, a path is called **relative path**. There are 3 shortcuts:

* <kbd>.</kbd> <small>(dot)</small>: will be replaced with the absolute path to the working directory. See the `pwd` command.
* <kbd>..</kbd> <small>(dot dot)</small>: will be replaced with the parent folder of `.`
* <kbd>~</kbd> <small>(tilde)</small>: path to user home, same as `$HOME`

🦐 `root` is its own parent <small>(`/../` is the same as `/`)</small>.

🧪 Following slashes are merged <small>(`///` becomes `/`)</small>.
</div></div>

<hr class="sep-both">

## Users and permissions

<div class="row row-cols-md-2"><div>

Permissions are assigned on a file/folder, and are applied according to the target 🎯 of the permissions (ownership)

* <kbd>u</kbd>: user, applied to the user (owner)
* <kbd>g</kbd>: group, applied to the main group of the user <small>(ex: students_2022)</small>
* <kbd>o</kbd>: others, applied to everyone else

There are 3 well-known levels of permissions 🔒

* <kbd>r</kbd> (4): can read
* <kbd>w</kbd> (2): can write <small>(=can edit+save, can create)</small>
* <kbd>x</kbd> (1): can execute a script, can move through a folder

Giving us something like: `u=r+w, g=r, o=r`.
</div><div>

There is a super-user 🦸, usually called **root**, that has absolute control over the machine 👑. They can delegate their privileges to users called **sudoers**. The command to execute something "as root" is:

```ps
# execute "cat [...]" as administrator
$ sudo cat /etc/shadow
```

➡️ See `man sudo_root`.
</div></div>

<hr class="sep-both">

## Environment variables

<div class="row row-cols-md-2"><div>

Environment variables (`Variables d’environnement`) are global variables, mostly used by commands/applications to access information about the system, save configurations...

* **HOME**: path to the current user home
* **USER**: username of the current user
* **LANG**: language of the current user
* **SHELL**: path to the shell
* **PWD**: path to the current folder
* **RANDOM**: return a random value
* **DISPLAY**: [identify display](https://unix.stackexchange.com/questions/16815/what-does-display-0-0-actually-mean)

And, there is **PATH**. This variable is used to store a list of folders. When you write a command on Linux, then **the shell will look for the command's file in the PATH**, starting from the first folder inside.

➡️ On Linux, folders in the PATH are separated with `:`.
</div><div>

Print all environment variables

```bash
$ env
$ printenv
```

Print the value of one environment variable

```bash
$ echo $PATH
$ printenv PATH
$ env | grep "^PATH="
```

Set an environment variable

```bash
$ export VAR_NAME=value
```

Add `/home/toto/bin` to the PATH

```bash
$ export PATH=/home/toto/bin:$PATH
```

</div></div>

<hr class="sep-both">

## 👻 To-do 👻

Stuff that I found, but never read/used yet.

<div class="row row-cols-md-2"><div>

* [old](_old.md)
</div><div>


</div></div>