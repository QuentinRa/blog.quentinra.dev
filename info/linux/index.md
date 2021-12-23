# Linux

Linux is an operating system, on which a lot of distributions such as Debian, Arch Linux, Fedora, Ubuntu, and so on... are based. I'm not an expert, so in this course, you will only learn the basics.

You might ask yourself, why are we learning this? Why are we using Linux? From my understanding, Linux is fast, free, open-source/customizable, and reliable. That's why most are installing a Linux-based OS on their servers. It means that as a user, you need to learn how to use the command line.

> **This course will refer to Windows a lot, as we are expecting readers to know Windows**.

<hr class="sl">

## Console

The console (also called terminal/shell/`ìnvite de commande`) may be the only way for you to interact with your Linux OS. This console may use a language such as **sh**, csh, tesh, ksh, **bash**, ... Most are using **Bash**, which is based on **sh**.

<div class="text-center">

![Linux (Bash) console](images/console.png)
</div>

Notes

* your are writing commands right after the `$`
* press <kbd>ENTER</kbd> to execute a command
* press <kbd>CTRL-C</kbd> to cancel a command
* press <kbd>CTRL-D</kbd> to end the input of a command waiting for input

Usually, when writing a command in a tutorial, we are doing one of these. For instance, for the command `ls`, we may write

* `$ ls`: run the command in any kind of shell (sh/bash/...)
* `sh> ls`: run the command in a sh console
* `# ls`: the command must be run with a **privileged** user

<hr class="sr">

## Commands

Commands are the instruction you are typing in the console, in a specific language. We will use **Bash**. A command is made of three parts

* the name of the command (`èx: ls`)
* [optional] the arguments (ex: `ls /`)
* [optional] the arguments that are "options" (ex: `ls -l -a`)

You have a space between the name of the command, and the arguments/options. Some commands are made of multiples words, separated by a `-` such as `sphinx-build`, but MOST common commands on Linux are not like this, so if you are seeing `ls-la`, it's most likely `ls -la` while the one who wrote that forgot the space.

> **Pro tip**: In a lot of commands, options may be merged (`-l -a`=>`-la`).<br>
> **Pro tip**: A lot of commands have an option "help", always try `command -h`, `command -help`, or `command --help`.<br>
> **Pro tip**: You got a manual for a lot of commands. Try `man mycommand`. If some pages are missing, you may need to install `manpages-dev``.