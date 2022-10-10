# Operating System

This course is a gathering of general knowledge shared between most, if not all, Linux-based distributions such as Debian, Ubuntu, Fedora, or Arch Linux... Most Linux-based distributions are free, open-source, light, secure, and performant. As the source code is public, anyone can improve it, modify it, and know how the underlying system is doing its job.

> **Note**: Linux-based distributions will be referred to as Linux. GNU/Linux will be referred to as Linux too. Let's keep things simple, and tidy.

<hr class="sl">

## Terminal

<div class="row row-cols-md-2"><div>

Linux in its simplest form is a **terminal** (console, `invite de commande`). Inside a terminal, we can write commands interpreted by something called **Shell**. There are multiple Shell languages that we can use <small>(sh, csh, tcsh, ksh, bash)</small>, but **most Linux distributions are using bash** <small>(bourne again shell)</small>, an improved version of sh.

![Linux: Terminal](_images/terminal.png)

> To open a terminal
> * Look for "Terminal" in your Applications
> * Or, use the shortcut `CTRL+SHIFT+T`

> Use `CTRL +`, and `CTRL -` to increase/decrease zoom
</div><div>

Most "commands" that you will see are written like `$ xxx`: **`$` IS NOT A PART OF THE COMMAND**, but a token that indicates **where** we can execute the command. It could be `#`, `sh >`...

```shell
$ command_working_everywhere
sh > command_at_least_working_in_sh
bash > command_at_least_working_in_bash
```
</div></div>

<hr class="sr">

## Commands

<div class="row row-cols-md-2"><div>

A command is **a name**, which may be followed by **arguments**, including some usually called **options**; the difference being that an option starts with a `-`.

* you are writing commands right after the `$`
* press <kbd>ENTER</kbd> to execute a command
* press <kbd>CTRL-C</kbd> to cancel/kill a command
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

* **Open a file in nano**: `nano file.txt` <small>(created if it does not exist)</small>
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

Permissions are something like `u=r+w, g=r, o=r`. We usually use numbers. The syntax can be shortened to `u=6, g=4, o=4`, and because the order `ugo` is fixed, we can shorten it again to `644`. **This shortened version is the most used one** <small>(in commands, verbally...)</small>.

<details class="details-e">
<summary>Commands</summary>

* <kbd>ls -l</kbd>: to view the permissions of a file/folder
* <kbd>chmod</kbd>: to change the permissions of a file/folder
* <kbd>umask</kbd>: to change the default permissions when a file/folder is created
* <kbd>chown</kbd>: to change the owner of a file/folder
</details>

<details class="details-e">
<summary>Root / Administrator</summary>

There is a super-user, usually called root, that has absolute control over the machine. `root` can delegate this power to others by making them a part of the "sudoers" group. The command to do an action using elevated permissions is different according to the Linux distribution, but the command **sudo** is the most well-known one.

![super-user/sudo bash](_images/sudo.png)

**Notice the # before every command**: in some tutorials, including ours, you will see a `#` instead of the usual `$` before a command needing elevated privileges.
</details>

<details class="details-e">
<summary>Practical knowledge: <code>ls -l</code> to see permissions</summary>

![Permissions Linux](_images/perms.png)

* Ignore the first `-` for now
* The 3 following letters `rw-` are the permissions of `u`: read+write.
* The 3 following letters `r--` are the permissions of `g`: read.
* The 3 following letters `r--` are the permissions of `o`: read.
* Ignore `1`
* The following string `listro` is the name of the user `u`
* The following string `listro` is the name of the group `g`
</details>

<hr class="sl">

## Paths

In both Linux, and Windows, there is a notion of **Path**. A path is made of one or more folders (`dossier/catalogue`), and may lead to a file (`fichier`).

<table class="table table-bordered table-striped border-dark">
<thead>
<tr><th>Notion</th><th>Windows</th><th>Linux</th></tr>
</thead>
<tbody>

<tr><td><b>A path</b> (<code>chemin</code>)
</td><td><code>C:\Users\user\Documents\</code></td><td><code>/usr/home/user/Documents/</code></td></tr>

<tr><td><b>Separator</b><br>
Something that is separating folders in a path.
</td><td><code>\</code> (backslash)</td><td><code>/</code> (slash)</td></tr>

<tr><td><b>root</b> (<code>racine</code>)<br>
The folder is containing every other folder.
</td><td><code>C:\</code></td><td><code>/</code></td></tr>

<tr><td><b>(user) home</b> (<code>domicile</code>)<br>
The folder with every file belonging to "user".
</td><td><code>C:\Users\user\</code></td><td><p><code>/usr/user/home/</code></p>

* The path to the home is stored inside `$HOME`
* The home of every user is recorded in `/etc/passwd`
</td></tr>

<tr><td><b>hidden files</b> (<code>fichiers cachés</code>)<br>
Files that are not visible by default.
</td><td>❌ defined manually<td>any file starting with <code>.</code> (dot), such as <code>.config</code></td></tr>

<tr><td><b>"Program files"</b><br>
Folders used to store programs/commands.
</td>
<td>
<code>C:\Program Files\</code><br>
<code>C:\Program Files (x86)\</code><br>
<code>%appdata%</code>
</td>
<td>
<code>/bin/</code><br>
<code>/usr/bin/</code><br>
<code>/usr/local/bin/</code>
</td>
</tr>
</tbody>
</table>

<details class="details-e">
<summary>Absolute and relative paths</summary>

* A path starting by the root is called **absolute path** (`chemin absolu`).
* A path that is not absolute, is called **relative path** (`chemin relatif`). We can create such paths using shortcuts:

<table class="table table-bordered table-striped border-dark">
<thead>
<tr><th>Shortcut</th><th>Description</th><th>Example</th></tr>
</thead>
<tbody>

<tr><td><kbd>.</kbd> (dot)</td><td>Path to <b>current</b> folder<br><small>(=output of <code>pwd</code>)</small></td><td>

If the current folder is `/usr/toto/home/`, then `./toto.txt` is an alias for `/usr/toto/home/toto.txt`.
</td></tr>
<tr><td><kbd>..</kbd> (2 dots)</td><td><b>Parent</b> folder of the current folder.</td><td>

If the current folder is `/usr/toto/home/`, then `..` is an alias for `/usr/toto/`.

* `root` is its own parent (`/../` is the same as `/`)

</td></tr>
<tr><td><kbd>~</kbd> (tilde)</td><td>Path to user <b>home</b></td><td>

If the home of the current user is `/usr/user/home/`, then `~` would mean the exact same path.
</td></tr>
</tbody></table>
</details>

<details class="details-e">
<summary>Notes</summary>

* Following slashes are merged into one <small>(ex: `///` is the same as `/`)</small>
* "Everything is a file": hard drive (/mnt/), a terminal (/dev/), a command (/bin/)...
</details>

<details class="details-e">
<summary>Commands</summary>

* <kbd>pwd</kbd>: see the path of the current folder
* <kbd>cd</kbd>: move to another folder
* <kbd>ls</kbd>: to list every file/folder in a directory
* <kbd>ls -a</kbd>: to list every file, including hidden files, in a directory
</details>

<hr class="sr">

## Environment variables

...

<hr class="sl">

## Glob-patterns, and regex

<div class="row row-cols-md-2 mt-4"><div>

**Glob-patterns** (`motifs`) are a sort of simplified version of regex, mainly used to do requests given a pattern. For instance, `ls *.h` is listing every file (and directory) ending with `.h`.

If the shell notices a pattern, then it will try to replace any matching content where the pattern was used. With this, `ls *.h` would become something like `ls toto.h lili.h`, then will be executed.

<table class="table table-bordered table-striped border-dark">
<thead>
<tr><th>Wildcards</th><th>Description</th></tr>
</thead>
<tbody>

<tr><td><code>x</code> (a character)</td><td>the character 'x'</td></tr>
<tr><td><code>*</code> (asterisk)</td><td>a possibly empty suite of characters</td></tr>
<tr><td><code>?</code> (question mark)</td><td>one character</td></tr>
<tr><td><code>[abc]</code></td><td>one character which is either a, b, or c.</td></tr>
<tr><td><code>[^abc]</code><br><code>[!abc]</code></td><td>any character which is not a, nor b, nor c.</td></tr>
</tbody></table>

**Note**: you may use ranges in `[]` such as `[0-9]`, or `[a-z]`, or shortcuts such as `[[:digit:]]` (a number), `[[:upper:]]` (uppercase), .`[[:lower:]]` (lowercase), `[[:space:]]` (space, tab, newline...), `[[:alnum:]]` (any alphanumeric character).

**Note**: You may want to use a token as a character such as "*", "?"...

* Use `[]` to escape it: `[?]`
* Or using `\` (backslash) which is its purpose: `\*`

</div><div>

**Regular expressions** (`expressions régulières`), commonly referred to as **regex**, are an enhanced version of glob-patterns used by tools such as `grep`, `sed`, and most, if not all, programming language.

* Every glob-pattern exists too in regexes
* But, `?` is now replaced with `.`

And, some new tokens were introduced

<table class="table table-bordered table-striped border-dark">
<thead>
<tr><th></th><th>Description</th></tr>
</thead>
<tbody>

<tr><td><code>x?</code></td><td>an optional character 'x'</td></tr>
<tr><td><code>x+</code></td><td>at least x times this character</td></tr>
<tr><td><code>^x</code></td><td>lines starting with x</td></tr>
<tr><td><code>[abc]</code></td><td>lines ending with x</td></tr>
<tr><td><code>(x|y)</code></td><td>either x or y</td></tr>
<tr><td><nobr><code>x{n, m}</code></nobr></td><td>at least $n$ times x, up to $m$ times, leave either empty if no limit</td></tr>
<tr><td><code>(ab)+</code></td><td>at least one time 'ab'</td></tr>
</tbody></table>

Something to note with regexes is the notion of groups. You can write some expression, and wrap it into escaped parenthesis `\(some_part_of_my_regex\)`. By doing so, you created a group, that may be later referred to as `$1`/`\1` if this was the first one. This is useful to extract some parts of the matching result.
</div><div>
</div></div>

<details class="details-e">
<summary>Commands</summary>

Most well-known usages of **glob-patterns** are in commands such as `ls`, `cat`, `gcc`, or more generally, commands taking a variable amount of files. For instance, in Java, some programmers are using `java *.java` to compile every `.java`.

For **regexes**, you will most likely use them

* <kbd>sed</kbd>: find, and replace matching text with some other text
* <kbd>grep</kbd>: find matching text, or files having the matching text
* <kbd>awk</kbd>: sort of `grep`
</details>