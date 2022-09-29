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

A command is basically **a name**, that may be followed by options, and arguments. Usually, everyone is only saying arguments instead of differencing options/arguments, the difference being that options starts with `-`.

```bash
$ ls
$ ls toto.txt
$ ls -l -a
$ ls -la
$ ls -la toto/
```

**Notes**

* Options can usually be merged. For instance, above, `-l -a` is the same as `-la`.
* Most commands have an option to display some help, try `-h`, `-help`, or `--help`
* There is some documentation for most commands. Try `man some_command`. **THE MANUAL (man) IS A LIFESAVER**.