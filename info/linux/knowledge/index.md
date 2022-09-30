# Operating System

This course is a gathering of general knowledge shared between most, if not all, Linux-based distributions such as Debian, Ubuntu, Fedora, Arch Linux... Most of Linux-based distributions are free, open-source, light, secure, and performant. As the source-code is exposed, anyone can improve it, modify, and know how the underlying system is doing its job.

> **Note**: as of now, Linux-based distributions will be referred as Linux.

<hr class="sl">

## Terminal

Linux in its simplest form is a **terminal** (console, `invite de commande`). Inside a terminal, we can write commands interpreted by something called **Shell**. There are multiple Shell languages that we can use <small>(sh, csh, tcsh, ksh, bash)</small>, but **most Linux distribution are using bash** <small>(bourne again shell)</small>, an improved version of sh.

![Linux: Terminal](_images/terminal.png)

Later, or in any other course, you may find commands introduced with "something" before the command. **THIS IS NOT A PART OF THE COMMAND**, but a token that indicates where we can execute the command.

```shell
$ some_command_working_everywhere
sh > some_command_at_least_work_in_sh
bash > some_command_at_least_work_in_bash
```

<details class="details-e">
<summary>Practice time</summary>

* Open a terminal
  * Look for "Terminal" in your application
  * Or, use `CTRL+SHIFT+T`
</details>

<hr class="sr">

## Commands

<div class="row row-cols-md-2"><div>

A command is basically **a name**, that may be followed by options, and arguments. Usually, everyone is only saying arguments instead of differencing options/arguments, the difference being that options starts with `-`.

* you are writing commands right after the `$`
* press <kbd>ENTER</kbd> to execute a command
* press <kbd>CTRL-C</kbd> to cancel a command
* press <kbd>CTRL-D</kbd> to end the input of a command waiting for input
* Usually, options can be merged <small>(ex: `-l -a` is the same as `-la`)</small>.
* Most commands have an option "help": `-h`, `-help`, or `--help`

</div><div>

```bash
$ ls
$ ls toto.txt
$ ls -l -a
$ ls -la
$ ls -la toto/
```

**There is some documentation for most commands.**

```bash
$ man ls
```
</div></div>

<hr class="sl">

## Text Editors

<div class="row row-cols-md-2"><div>

Text editors, or file editors, are tools allowing you to view, and edit a file. If you have a graphical interface, you may use the usual tools: vscode, sublime text, JetBrains' IDEs, emacs... But, if you only have a terminal, the most used are

* `vim` <small>(there is a course on this website)</small>, or `neovim`
* `nano`
* `emacs` <small>(vim > emacs, change my mind 😒)</small>
</div><div>

I think nano is the easiest to learn.

* **Open a file in nano**: `nano file.txt` <small>(created if it does not exists)</small>
* **Save a file in nano**: `CTRL+S`
* **Quit nano**: `CTRL+X`

If you only need to see the contents of a file, then you can use the commands `cat`, `less`, `head`, and `tail`.
</div></div>

<hr class="sr">

## Permissions, and users

<div class="row row-cols-md-2"><div>

There are 3 well-known levels of permissions

* <kbd>r</kbd> (4): can read
* <kbd>w</kbd> (2): can write <small>(=can edit+save, can create)</small>
* <kbd>x</kbd> (1): can execute a script, can move through a repository

Permissions are coded on 7 bits. `r+w` means `4+2=6`. We are usually using numbers instead of letters, because it's shorter.
</div><div>

Permissions are assigned on a file/folder, and are applied according to the target of the permissions

* <kbd>u</kbd>: user, applied to the user (owner)
* <kbd>g</kbd>: group, applied to the main group of the user <small>(ex: students_2022)</small>
* <kbd>o</kbd>: others, applied to everyone else
</div></div>

Permissions are something like `u=r+w, g=r, o=r`. We usually use numbers. The syntax can be shortened to `u=6, g=4, o=4`, and because the order `ugo` is fixed, we can shorten it again to `644`. **This shortened version is the most used one**.

<details class="details-e">
<summary>Commands</summary>

* <kbd>ls -l</kbd>: to view the permissions of a file/folder
* <kbd>chmod</kbd>: to change the permissions of a file/folder
* <kbd>umask</kbd>: to change the default permissions when a file/folder is created
* <kbd>chown</kbd>: to change the owner of a file/folder
</details>

<details class="details-e">
<summary>Practical knowledge</summary>

![Permissions Linux](_images/perms.png)

* Ignore the first `-` for now
* The 3 following letters `rw-` are the permissions of `u`: read+write.
* The 3 following letters `r--` are the permissions of `g`: read.
* The 3 following letters `r--` are the permissions of `o`: read.
* Ignore `1`
* The following string `listro` is the name of the user `u`
* The following string `listro` is the name of the group `g`
</details>

<details class="details-e">
<summary>Root / Administrator</summary>

There is a super-user, usually called root, that have every control on the machine. Root can delegate this power to others users by making them a part of the "sudoers" group. The command to do an action using elevated permissions is different according to the Linux-distribution, but the command **sudo** is the most well-know one.

![super-user/sudo bash](_images/sudo.png)

**Notice the # before every command**: in some tutorials, including ours, you will see a `#` instead of the usual `$` before a command needing elevated privileges.
</details>

<hr class="sl">

## Paths

...