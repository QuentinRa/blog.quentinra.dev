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
</div><div>

<hr class="sr">

## Permissions

...

<hr class="sl">

## Paths

...