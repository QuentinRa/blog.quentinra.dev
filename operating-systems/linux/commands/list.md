# Linux commands

<div class="row row-cols-lg-2"><div>

Many Linux commands are complexes and have multiple options or multiple ways to achieve the same purpose. This page describes some uses and some options of commands that are frequently used.

It's possible for each line of a command to become the arguments of another command using `xargs`:

```shell!
$ echo "/" | xargs ls    # ls "/"
```
</div><div>

⛪ If there is a command that you don't understand, **check out** [explain shell](https://explainshell.com/) 🚀.
</div></div>

<hr class="sep-both">

## Manual

++++++

[**man** - commands manual]

<div class="row row-cols-lg-2"><div>

**Usage** 🐚: `man` is a manual for many commands. It may have to be installed.

You can install additional man pages with packages such as `manpages` or `manpages-dev`.

**Example** 🔥:

```ps
$ man man
```

➡️ `man` is a "less editor". See the `less` command.
</div><div>

Entries in the manual are split into sections. To access a command in a specific section, simply add the section number before the command.

```shell!
$ man 1 man
```
</div></div>

[**whatis** - one-line `man`]

[![linux1](../../../cybersecurity/_badges/thm/linux1.svg)](https://tryhackme.com/room/linux1)

**Usage** 🐚: Display a one-line manual page descriptions

**Example** 🔥:

```ps
$ whatis man
man (1) - an interface to the system reference manuals
```

[**apropos** - search in the `man`]

**Usage** 🐚: You can use `apropos` to search a command, or in which section a command is.

**Example** 🔥:

```ps
$ apropos fopen
fopen (3)            - stream open functions
fopencookie (3)      - opening a custom stream
$ man 3 fopen
```

[**info** - alternative to `man`]

<div class="row row-cols-lg-2"><div>

**Usage** 🐚: Alternative to `man`.

**Example** 🔥:

```ps
$ sudo apt install info
$ info ls
```
</div></div>

++++++

<hr class="sep-both">

## Terminal-related

++++++

[**echo/printf** - print text]

[![linuxfundamentalspart1](../../../cybersecurity/_badges/thm/linuxfundamentalspart1.svg)](https://tryhackme.com/room/linuxfundamentalspart1)
[![linux1](../../../cybersecurity/_badges/thm/linux1.svg)](https://tryhackme.com/room/linux1)

<div class="row row-cols-lg-2"><div>

**Usage** 🐚: print text, usually for debugging or displaying instructions/results

**Example** 🔥:

```shell!
$ echo Hello, World
$ echo 'Hello, World'
$ echo "Hello, World"
```

**-e** 🧪: to interpret special characters such as `\n`

```ps
$ echo -e "abc\nde"
abc
de
```
</div><div>

**-n** 🧪: to remove the newline

```shell!
$ echo -n "Hello, World"
```

You can also use `printf "format" arguments`:

```shell!
$ printf "%s\n" "Hello, World"
```
</div></div>

[**cat/tac** - display a file]

[![linuxfundamentalspart1](../../../cybersecurity/_badges/thm/linuxfundamentalspart1.svg)](https://tryhackme.com/room/linuxfundamentalspart1)
[![linux1](../../../cybersecurity/_badges/thm/linux1.svg)](https://tryhackme.com/room/linux1)

<div class="row row-cols-lg-2"><div>

**Usage** 🐚:

* `cat` is commonly used display a file.
* `cat` is intended to be used to merge multiple files in one, and display the output.

👉 `tac` is printing the file from the end to the start. And concatenating files after reversing their lines.

**Example** 🔥:

```shell!
$ cat file
the content here
```

```ps
# read for stdin
$ cat -
```
</div><div>

➡️ Concatenating files

```shell!
$ cat f0 f1
f0
f1 Line 1
f1 Line 2
```

```shell!
$ tac f0 f1
f0
f1 Line 2
f1 Line 1
```

Create a file f2 with input from f0, f1, and stdin.

```shell!
$ cat f0 f1 - > f2
```
</div></div>

[**less/more** - read a file]

<div class="row row-cols-lg-2"><div>

**Usage** 🐚: both are used to browse files/content from the CLI.

👉 `more` is rarely used as there is `cat` for short files, and `less` is more appropriate for large files.

**Example** 🔥:

```shell!
$ more file
$ less file
```
</div><div>

There are QUITE a lot of options. Simply press <kbd>h</kbd> to see all of them.

* <kbd>arrow up</kbd>: to move up,
* <kbd>arrow down</kbd>: to move down
* <kbd>q</kbd>: to quit
* <kbd>/something</kbd>: search "something"
    * <kbd>Enter or n</kbd>: go to the next match
    * <kbd>N</kbd>: go back to the previous match
</div></div>

[**xdg-open** - open ...]

**Usage** 🐚: open a file <small>(txt, pdf...)</small>, a URL... with the default application associated with the file extension.

**Example** 🔥:

```ps
$ xdg-open xxx.pdf
$ xdg-open URL
```

[**tee** 🧽 - one to many]

<div class="row row-cols-lg-2"><div>

**Usage** 🐚: tee can be used to redirect one input to multiple sources. For instance, you can redirect the output to a file and `stdout`.

**Example** 🔥:

Output to both files and the standard output.

```ps
$ tee output1 output2 < file
```

Use `-a`/`--append` to append content.
</div></div>

[<br>]

[**clear** - clear the terminal]

<div class="row row-cols-lg-2"><div>

**Usage** 🐚: clear the terminal

**Example** 🔥:

```shell!
$ clear
```
</div><div>

👉 You may use the shortcut <kbd>CTRL+L</kbd>.
</div></div>

[**shopt** - configure the shell]

<div class="row row-cols-lg-2"><div>

**Usage** 🐚: change the terminal behavior

**Example** 🔥:

Enable an option <small>(ex: nullglob)</small>

```shell!
$ shopt -ps nullglob
```
</div><div>

Disable an option <small>(ex: nullglob)</small>

```shell!
$ shopt -pu nullglob
```

> The `nullglob` option is replacing patterns with the null string if there are no matches.
</div></div>

[**alias** - aliases of commands]

<div class="row row-cols-lg-2"><div>

**Usage** 🐚: create a command that is an alias of another commands with usually some arguments.

**Example** 🔥:

Create a command `la` which is `ls -la`

```ps
$ alias la='ls -la'
$ la
```
</div><div>

See every defined alias

```ps
$ alias
```

⚠️ Aliases are temporary. You must load them every time you open a terminal, such as by adding them in a `.bashrc` in Bash.
</div></div>

++++++

<hr class="sep-both">

## Computer information

++++++

[**id** - user info]

<div class="row row-cols-lg-2"><div>

**Usage** 🐚: info about a user

**Example** 🔥:

```shell!
$ id          # current user
$ id username # some user
```
</div></div>

[**whoami** - user username]

[![linuxfundamentalspart1](../../../cybersecurity/_badges/thm/linuxfundamentalspart1.svg)](https://tryhackme.com/room/linuxfundamentalspart1)

<div class="row row-cols-lg-2"><div>

**Usage** 🐚: username of the current user

**Example** 🔥:

```shell!
$ whoami
username
```
</div></div>

[**uname** - machine info]

<div class="row row-cols-lg-2"><div>

**Usage** 🐚: info about the machine

**Example** 🔥:

```ps
$ uname # show OS name
$ uname -s # same
$ uname -rv # kernel
$ uname -m # architecture (x64, x86...)
$ uname -a # all
```
</div></div>

[**date** - date & time]

<div class="row row-cols-lg-2"><div>

**Usage** 🐚: info about the machine

**Example** 🔥:

```ps
$ date
Mon 12 Oct 2020 08:32:11 PM EDT
```
</div></div>

++++++

<hr class="sep-both">

## Computer management

++++++

[**sudo** - run as]

<div class="row row-cols-lg-2"><div>

**Usage** 🐚: Execute a command `<command>` with elevated privileges.

**Example** 🔥:

Execute a command `<command>` as root.

```ps
# ex: ls /
$ sudo ls /
```
</div><div>

Elevate the shell. In an elevated shell, there is no need to add `sudo` before each command.

```ps
$ sudo -s
```
</div></div>

[**shutdown** - stop/reboot/...]

<div class="row row-cols-lg-2"><div>

**Usage** 🐚: stop or reboot an operating system.

**Example** 🔥:

To shutdown an operating system, use:

```ps
$ shutdown -h now
```
</div><div>

To reboot an operating system, use:

```ps
$ shutdown -r now
$ reboot
```
</div></div>
++++++

<hr class="sep-both">

## File system

++++++

[**pwd** - current directory]

[![linuxfundamentalspart1](../../../cybersecurity/_badges/thm/linuxfundamentalspart1.svg)](https://tryhackme.com/room/linuxfundamentalspart1)

**Usage** 🐚: echo the path to the working directory

**Example** 🔥:

```shell!
$ pwd
/home/listro
```

[**ls/dir/tree** - list files]

[![linuxfundamentalspart1](../../../cybersecurity/_badges/thm/linuxfundamentalspart1.svg)](https://tryhackme.com/room/linuxfundamentalspart1)
[![linux1](../../../cybersecurity/_badges/thm/linux1.svg)](https://tryhackme.com/room/linux1)

<div class="row row-cols-lg-2"><div>

**Usage** 🐚: list all files in a directory. Both are the same, but `dir` is rarely used. `tree` display files in a tree-like format.

**Example for ls/dir** 🔥:

```ps
$ ls # current directory
$ ls . # same as "ls"
$ ls folder
$ ls *.txt # pattern
```

**-l**: print more information about each file

```ps
$ ls -l file # info on file
```

**-a**: print hidden files

```ps
$ ls -a folder
$ ls -la folder # info + hidden
```
</div><div>

**Other options**

* `-R`: recursive
* `-p`: add a trailing "/" to repositories
* `-A`: hide ".", and ".."
* `-s`: show the size
* `--format="format"`: use a custom format
* `--hide="pattern"`: hide files matching "pattern"
* `-S`: sort by size
* `-t`: sort by last modified date
* `-u`: sort by last access date

<br>

**Example for tree** 🔥:

List recursively given a folder.

```ps
$ tree .
```
</div></div>

[**cd** - navigate to ...]

[![linuxfundamentalspart1](../../../cybersecurity/_badges/thm/linuxfundamentalspart1.svg)](https://tryhackme.com/room/linuxfundamentalspart1)

<div class="row row-cols-lg-2"><div>

**Usage** 🐚: move to another directory

**Example** 🔥:

```shell!
$ cd folder
```

Move to the HOME folder

```shell!
$ cd
$ cd ~
```

Move to the previous folder

```shell!
$ cd -
```
</div><div>

The `pushd` and `popd` commands are quite useful when we are often moving between repositories:

```shell!
$ cd /path/to/folderA
$ pushd .    # save
$ cd /path/to/folderB
$ pushd .    # save
$ cd /path/to/folderC
$ popd       # go back to folderB 
$ popd       # go back to folderA 
```
</div></div>

[**mkdir** - create a folder]

[![linuxfundamentalspart2](../../../cybersecurity/_badges/thm/linuxfundamentalspart2.svg)](https://tryhackme.com/room/linuxfundamentalspart2)
[![linuxstrengthtraining](../../../cybersecurity/_badges/thm/linuxstrengthtraining.svg)](https://tryhackme.com/room/linuxstrengthtraining)

<div class="row row-cols-lg-2"><div>

**Usage** 🐚: create one or more folders

**Example** 🔥:

```shell!
$ mkdir folder
```
</div><div>

Create every non-existing folder in a path

```shell!
$ mkdir -p folder0/folder1/folder2
```
</div></div>

[**🔎** - create a file]

[![linuxfundamentalspart2](../../../cybersecurity/_badges/thm/linuxfundamentalspart2.svg)](https://tryhackme.com/room/linuxfundamentalspart2)
[![linux1](../../../cybersecurity/_badges/thm/linux1.svg)](https://tryhackme.com/room/linux1)

<div class="row row-cols-lg-2"><div>

**Usage** 🐚: there is no specific command to create a file, but there are multiple ways to achieve it: `touch`, `cp`, `truncate`, `>`, `:>`...

**Example** 🔥:

👉 `touch`: ensure a file exists, but it may not be empty 🔥. The command create a file or update the last modified date if it exists.

```ps
$ touch afile
```

👉 A trick is to copy `/dev/null` with `cp`

```ps
$ cp /dev/null file
```
</div><div>

👉 A popular way is to use a redirection of the output. Note that all of these syntax may not be supported everywhere.

```ps
$ echo -n "" > file
$ echo -n > file
$ > file
$ :> file
```

👉 You can use truncate to create an empty file or truncate an existing file.

```ps
$ truncate -s 0 file
```
</div></div>

[**ln** - create a link]

<div class="row row-cols-lg-2"><div>

**Usage** 🐚: create a symbolic/hard link

**Example** 🔥:

Create a symbolic link at `output` linking to `target`:

```ps
$ ln -s target output
```
</div></div>

[**mv** - move or rename]

[![linuxfundamentalspart2](../../../cybersecurity/_badges/thm/linuxfundamentalspart2.svg)](https://tryhackme.com/room/linuxfundamentalspart2)
[![linuxstrengthtraining](../../../cybersecurity/_badges/thm/linuxstrengthtraining.svg)](https://tryhackme.com/room/linuxstrengthtraining)
[![linux2](../../../cybersecurity/_badges/thm/linux2.svg)](https://tryhackme.com/room/linux2)

<div class="row row-cols-lg-2"><div>

**Usage** 🐚: takes a list of folders/files to move, and a destination. Move all files/folders to the destination.

**Example** 🔥:

```shell!
$ mv toto ./all_toto/
$ mv toto -t ./all_toto/ # same
$ mv toto1 toto_2 ./all_toto/
```
</div><div>

**Rename**

```shell!
$ mv toto toto0
```
</div></div>

[**cp** - copy files/folders]

[![linuxfundamentalspart2](../../../cybersecurity/_badges/thm/linuxfundamentalspart2.svg)](https://tryhackme.com/room/linuxfundamentalspart2)
[![linuxstrengthtraining](../../../cybersecurity/_badges/thm/linuxstrengthtraining.svg)](https://tryhackme.com/room/linuxstrengthtraining)

<div class="row row-cols-lg-2"><div>

**Usage** 🐚: takes a list of folders/files to copy, and a destination. Copy all files/folders to the destination.

**Example** 🔥:

```shell!
$ cp toto ./all_toto/
$ cp toto1 toto_2 ./all_toto/
```
</div><div>

To create a copy

```shell!
$ cp toto toto0 # ⚠️ toto still exists
```

**-r** ⚠️: required to copy a folder and its content

```shell!
$ cp -r all_toto/ all_toto_copy
```
</div></div>

[**rm/rmdir** - delete]

[![linuxfundamentalspart2](../../../cybersecurity/_badges/thm/linuxfundamentalspart2.svg)](https://tryhackme.com/room/linuxfundamentalspart2)
[![linux2](../../../cybersecurity/_badges/thm/linux2.svg)](https://tryhackme.com/room/linux2)

<div class="row row-cols-lg-2"><div>

**Usage** 🐚: use `rm` to remove files/folders. `rmdir` is usually not used.

**Example** 🔥:

```shell!
$ rm file
$ rm file0 file1
```

👉 `rm` by default is asking for confirmation.

```shell!
$ rm -f file # do not ask (f=force)
$ rm -i file # ask
```
</div><div>

👉 Delete a folder

```shell!
$ rm -d folder # if the folder is empty
$ rm -r folder # -R is doing the same
```

👉 Delete a folder and to not ask for confirmation

```shell!
$ rm -rf folder # usual f + r
```
</div></div>

[<br>]

[**file/stat** - file information]

[![linuxfundamentalspart2](../../../cybersecurity/_badges/thm/linuxfundamentalspart2.svg)](https://tryhackme.com/room/linuxfundamentalspart2)

**Usage** 🐚: `file` is widely used for images or to find the type of file. `stat` is useful to extract the metadata of a file.

**Example** (file) 🔥:

```ps
$ file folder
folder: directory
$ file image.jpg
image.jpg: JPEG image data, JFIF standard 1.01, resolution (DPI), density 72x72, segment length 16, comment: "CREATOR: gd-jpeg v1.0 (using IJG JPEG v90), quality = 90", baseline, precision 8, 1080x1350, components 3
```

**Example** (stat) 🔥:

```ps
$ stat folder
$ stat file
$ stat toto -c "Size: %s -- Name: %n -- Perms: %a / %A -- type: %F"
Size: 4096 -- Name: toto -- Perms: 755 / drwxr-xr-x -- type: directory
```

[**diff/patch** - diff and patch]

<div class="row row-cols-lg-2"><div>

**Usage** 🐚: you can examine the difference between two files using `diff`. You can use `patch` to fix some differences.

**Example** 🔥:

Diff only.

```ps
$ diff f0 f1 -q
Files f0 and f1 differ
$ diff f0 f1
# one below the other diff
$ diff f0 f1 -y
# side-by-side diff
```
</div><div>

Generate a patch

```shell!
$ diff f0 f1 -u
# ...
$ diff f0 f1 -u > f0.patch 
```

Then, you can use `patch` to apply the differences with `f1` to `f0`.

```shell!
$ patch < f0.patch
$ patch -d path/to/xxx [...]  # folder to apply patch on
$ patch -R [...]              # reverse patch
$ patch -p0 [...]             # n slashes skipped
```
</div></div>

[**du** - file/folder size]

**Usage** 🐚: compute a folder/file size

**Example** 🔥:

* `s` to summarize the result (one result per argument)
* `h` to use a human-readable format (add units...)

```ps
$ du -sh folder
8.0K folder
```

[<br>]

[**basename** - get the filename]

<div class="row row-cols-lg-2"><div>

**Usage** 🐚: get the filename from a path.

**Example** 🔥:

```shell!
$ basename /etc/passwd
passwd
```
</div></div>

[**dirname** - parent folder]

<div class="row row-cols-lg-2"><div>

**Usage** 🐚: get the parent folder of a file.

**Example** 🔥:

```shell!
$ dirname /etc/passwd
/etc
$ dirname /etc
/
```
</div></div>

[**realpath** - resolve path]

<div class="row row-cols-lg-2"><div>

**Usage** 🐚: get the absolute path to the given argument. Patterns are evaluated and symoblic links are resolved.

**Example** 🔥:

```shell!
$ realpath ~
/home/folder
```
</div></div>

[<br>]

[**zip/unzip/...** - zip files]

<div class="row row-cols-lg-2"><div>

**Usage** 🐚: zip/unzip a .zip.

**Example** 🔥:

```ps
$ zip toto.zip f0 f1 f2
$ unzip toto.zip
$ gunzip -S .zip toto.zip
```
</div><div>

View the contents of a zip

```ps
$ zipinfo toto.zip
$ unzip -l toto.zip
```
</div></div>

[**tar** - archive/unarchive]

**Usage** 🐚: archive/unarchive tar.gz, gz, tgz...

**Example** 🔥:

Compress <small>(`c`=create, `v`=verbose, `z`=compress, `f`=archive name)</small>

```ps
$ tar -cvzf archive_name.tar.gz file0 file1 # ...
```


Decompress <small>(`x`=decompress, `v`=verbose, `f`=archive name)</small>

```ps
$ tar -xvf archive_name.tar.gz
$ tar -xvjf archive_name.tbz2
```

++++++

<hr class="sep-both">

## User management

++++++

[**su** - swap/log in as user]

[![linux1](../../../cybersecurity/_badges/thm/linux1.svg)](https://tryhackme.com/room/linux1)

<div class="row row-cols-lg-2"><div>

**Usage** 🐚: swap/log in as another user

**Example** 🔥:

```shell!
$ su root
```
</div><div>

👉 Log in as another user <small>(move the their home...)</small>

```shell!
$ su -l root
$ su - root # same
```
</div></div>

[**useradd** - add a user]

**Usage** 🐚: add a user

**Example** 🔥:

```ps
$ useradd username
```

Create a username, give them a group, and define their home folder.

```ps
# -m = create home
$ useradd username -g usergroup -b /path/to/user/home -m
$ adduser username # create everything at once
```

[**usermod** - edit users]

<div class="row row-cols-lg-2"><div>

**Usage** 🐚: add users to a group... Don't forget to log back in for the changes to be applied.

**Example** 🔥:

Add user yyy to group xxx

```ps
$ sudo usermod -a -G xxx yyy
```

Add "username" to sudoers

```ps
$ sudo usermod -a -G sudo username # Debian...
$ sudo usermod -a -G wheel username # Fedora...
```
</div><div>

Change the login username

```ps
$ sudo usermod -l newname oldname
```

Change user UID. You can't change the current user UID.

```ps
$ sudo usermod -u newUID oldUID
```

Lock Account

```ps
$ sudo usermod --lock [...]
```
</div></div>

[**deluser** - delete a user]

<div class="row row-cols-lg-2"><div>

**Usage** 🐚: delete a user

**Example** 🔥:

```ps
$ deluser username
```
</div></div>

[**passwd** - change password]

<div class="row row-cols-lg-2"><div>

**Usage** 🐚: change a user's password

**Example** 🔥:

Change the current user's password:

```ps
$ passwd
```

Change multiple or one user password.

```ps
$ echo "username:password" | chpasswd
```
</div><div>

Delete the current user's password:

```ps
$ passwd -d # automatically logged/no password prompt
```

Change another user's password:

```ps
$ passwd username
```
</div></div>

[**groupadd** - create a group]

<div class="row row-cols-lg-2"><div>

**Usage** 🐚: create a group

**Example** 🔥:

```ps
$ groupadd group_name
```
</div></div>

[**groupmod** - edit groups]

<div class="row row-cols-lg-2"><div>

**Usage** 🐚: edit a group information.

**Example** 🔥:

Change group GID.

```ps
$ sudo groupmod -g newGID oldGID
```
</div><div>

Change the name of the group.

```ps
$ sudo groupmod -n newname oldname
```
</div></div>

[**delgroup** - delete a group]

<div class="row row-cols-lg-2"><div>

**Usage** 🐚: delete a group

**Example** 🔥:

```ps
$ delgroup group_name
```
</div></div>

[<br>]

[**chmod** - file permissions]

[![linux2](../../../cybersecurity/_badges/thm/linux2.svg)](https://tryhackme.com/room/linux2)

<div class="row row-cols-lg-2"><div>

**Usage** 🐚: manage a file/folder permissions

**Example** 🔥:

Use <kbd>+</kbd> to grant perms..

```shell!
$ chmod u+x target
$ chmod g+rw target
$ chmod ug+r target
$ chmod g+x,o+rx target
```

Grant to <kbd>a</kbd> <smalll>(all, alias of <kbd>ugo</kbd>)</small>

```shell!
$ chmod +x target
$ chmod a+x target # same
$ chmod ugo+x target # same
```
</div><div>

Use <kbd>-</kbd> instead of <kbd>+</kbd> to revoke permissions.

```shell!
$ chmod -x target
$ chmod u-x target
$ chmod ug-rw target
```

Grant "perms" using the shortcut number.

```ps
# u=rwx, g=rx, o=x
$ chmod 751 target
# u=rwx, g=, o=
$ chmod 700 target
```
</div></div>

[**chown** - file ownership]

[![linux2](../../../cybersecurity/_badges/thm/linux2.svg)](https://tryhackme.com/room/linux2)

**Usage** 🐚: change the owner of a file/folder

**Example** 🔥:

```ps
$ ls -l toto.txt
-rw-r-xr-x 1 n1 n [...] toto.txt 
$ chown n2 toto.txt
-rw-r-xr-x 1 n2 n [...] toto.txt
$ chown n2:m toto.txt
-rw-r-xr-x 1 n2 m [...] toto.txt
```

You may use `-R` <small>(recursive)</small>, and `-h` <small>(do not deference symbolic links)</small>.

[**umask** - default permissions]

**Usage** 🐚: A call to `umask` return the **missing** permissions with a leading `0`.

**Example** 🔥:

```ps
$ umask
0026 # meaning 751 by default
$ umask -s
u=rwx,g=rx,o=r
$ umask 0026
$ umask u=rwx,g=rx,o=r
```

++++++

<hr class="sep-both">

## Search

++++++

[**which/whereis** - command]

<div class="row row-cols-lg-2"><div>

**Usage** 🐚: find a command

**Example** 🔥:

Find the executable for a command

```ps
$ which find
/usr/bin/find
```
</div><div>

Find any executable for a command in the PATH

```shell!
$ whereis ls
ls: /bin/ls /usr/share/man/man1/ls.1.gz
```
</div></div>

[**find** - file/folder]

[![linuxfundamentalspart1](../../../cybersecurity/_badges/thm/linuxfundamentalspart1.svg)](https://tryhackme.com/room/linuxfundamentalspart1)

<div class="row row-cols-lg-2"><div>

**Usage** 🐚: find a file/folder. There are a ton of options.

**Example** 🔥:

The search is done **recursively** starting from a folder <small>(ex: `/`)</small>. We can indicate a pattern <small>(ex: `toto*`)</small>.

```ps
$ find /
$ find / -name "toto*" # toto toto0...
$ find / -name "toto*" -type f # files
$ find / -name "toto*" -type d # folders
```

You can apply an operation on every file found. For instance, you can copy them somewhere.

```ps
# {} is the path to the match
$ find [...] -exec cp '{}' /tmp/found \;
```

When using find, we may get many errors. We usually redirect them to the "trash".

```ps
$ find [...] 2> /dev/null
```
</div><div>

**Other options**

* `-empty`: empty folders/files only
* `-execdir`: works the same as `-exec`, but in the directory of the match
* `-quit`: exit when one result is found
* `-printf`: change the output format
* `-mindepth value`: minimum depth <small>(default=0)</small>
* `-maxdepth value`: maximum depth

These are rarely used:

* `-mtime n`/`-atime n`: changed/accessed in the last `n` days
* `-cmin n`/`-amin n`: same, but in the last `n` minutes
* `-newer file`: modified after `file`
* `-size n`: a specific size such as `4M`
* `-perms 0744`/`-perms a=x`/`-writable`/.../`-perm -o w`/`-222`: files matching the given perms
* `-user xxx`: files belonging to the user xxx
* `-group xxx`: files belonging to users in xxx

👉 You can add a `+` or `-` such as `-size +4M`.

👉 You can use `!`/`-not` to negate an option. For example, you can use `-not -name`.

👉 You can group conditions too: `\( -name xxx -o -name yyy \)`. Use `-o` for OR and `-a` for AND.
</div></div>

[**locate** - file]

<div class="row row-cols-lg-2"><div>

**Usage** 🐚: search a file in a local database of files. The database must be updated manually `sudo updatedb`.

**Example** 🔥:

```ps
$ locate find
```
</div></div>

++++++


<hr class="sep-both">

## File manipulation

This sections does NOT include file editors.

++++++

[**head/tail** - head/tail of a file]

<div class="row row-cols-lg-2"><div>

**Usage** 🐚: show the $n$ first/last lines of a file. Both a working the same, `head` is for the first lines, `tail` is for the last lines.

**Example** 🔥:

```ps
# first 10 lines
$ head file
```
</div><div>

```ps
# first 5 lines
$ head file -n 5
$ head file -n +5
# all lines, aside from the last 5 lines
$ head file -n -5
$ tail -c nchars file
```
</div></div>

[**grep** - search by content]

[![linuxfundamentalspart1](../../../cybersecurity/_badges/thm/linuxfundamentalspart1.svg)](https://tryhackme.com/room/linuxfundamentalspart1)
[![adventofcyber4](../../../cybersecurity/_badges/thm/adventofcyber4/day2.svg)](https://tryhackme.com/room/adventofcyber4)

<div class="row row-cols-lg-2"><div>

**Usage** 🐚: search files based on their content.

**Example** 🔥:

List files having 'toto' in them

```ps
$ grep "toto" *
$ grep --color "toto" * # highlight match
```

**Best options**

* `-r` recursive <small>(`-R` to follow links too)</small>
* `-i` Ignore case
* `-v` Inverse pattern
* `-c`: number of matches per file
* `-n`: add line number before each match
* `-o` show only the matched part
* `-H` show the file before every match
* `-w` words-only <small>("XxtotoxX" won't match "toto")</small>
</div><div>

**regex mode** 🧪

By default, if you are using `?`, `(`, or any character used by regexes, it won't be interpreted <small>(eg. `?` won't be considered as "optional")</small>.

```ps
$ grep "opt?" * # ❌ match "opt?"
$ grep "opt\?" * # ✅ "t" is optional
$ grep -E "opt?" * # ✅ same as grep -E
$ egrep "opt?" * # ✅ same as grep -E
```

**Less frequently used options**

* `-L`: stop when match found, show files without matches
* `-l`: stop when match found, show files with matches
* `-q`: no output, use the exit code to indicate if a match was found (0), or not (1).
</div></div>

[**sed** - search and replace]

<div class="row row-cols-lg-2"><div>

**Usage** 🐚: sed has many uses. You can apply simple modification on the file, or search and replace something.

**sed does not modify the file**, but output on stdout the modified content, which you can redirect.

**Example - syntax 1** 🔥: <br>`sed '<range><letter><args>' <file>`.

* `i`: add a line with "XXX" before (`i`) every line
* `a`: add a line with "XXX" after (`a`) every line
* `p`: duplicate every line
* `d`: delete every line
* `c`: replace every line with "XXX"
* `e`: execute the command before every line <small>(you may add parenthesis to make things cleaner)</small>

```ps
$ sed 'iXXX' file
$ sed 'cXXX' file
$ sed 'aXXX' file
$ sed 'p' file
$ sed 'e(echo hello)' file
```

Instead of applying a command to every line, you can pick some lines

```ps
$ sed '1iXXX' file # line 1
$ sed '1,3iXXX' file # line 1 to 3
$ sed '$iXXX' file # last line
$ sed '1p' file # duplicate first
$ sed '1d' file # delete first
# ...
```
</div><div>

**Example - syntax 2** 🔥: <br>`sed 's/<pattern>/<replacement>/<flag>' <file>`.

* `pattern`: a [regex](/tools-and-frameworks/knowledge/regex/index.md)
* `flag`:
  * `none`: first match of each line
  * `g`: every match is replaced
  * `n`: replace the nth match of each line
* `replacement`: what to replace the section with

Replace every "e" with "E"

```ps
$ sed "s/e/E/g" file
```

Replace the first "e" of each line with "E"

```ps
$ sed "s/e/E/" file
$ sed "s/e/E/1" file
```

Comment out every line starting with "S". We use a **capture group** 🚩 which is referenced using `\1`.

```ps
$ sed "s/^\(S.*\)/# \1./" file
```

</div></div>

[**awk** - data extraction]

<div class="row row-cols-lg-2"><div>

**Usage** 🐚: most of the time, there are other solutions that are more appropriate such as `sed`. `awk` is a mix of `sed`, `cut`, `tr`...

👉 See also: [The_AWK_Programming_Language](https://ia903404.us.archive.org/0/items/pdfy-MgN0H1joIoDVoIC7/The_AWK_Programming_Language.pdf) & [To awk or not](https://pmitev.github.io/to-awk-or-not/)

`awk` is considering space <small>(`-F` to change)</small> as a separator for columns. The first column is `$1`, the nth column is `$n`. `$0` means every column.

The syntax is `awk 'target {action}' file`.

* `target`: filter where the action is applied
* `action`: print...
</div><div>

**Example** 🔥:

By default, `awk` prints every column.

```ps
$ awk '{print}' file
$ awk -F' ' '{print $0}' file # same
```

Only print the first column of lines having AT LEAST 6 columns (`NF`)

```ps
$ awk 'NF > 6 {print $1}' file
```

Print the first, and the third column, if the file has at least 3 lines (`NR`)

```ps
$ awk 'NR > 3 {print $1 $3}' file
```
</div></div>

[**cut** - data extraction]

<div class="row row-cols-lg-2"><div>

**Usage** 🐚: extract "fields" from a table For instance, given the following file:

```shell!
$ cat /etc/passwd
root:x:0:0:root:/root:/bin/bash
```

For every line, we got values separated by "`:`". These are what we call "fields". For `cut`, the row look like this: `f1:f2:f3:f4:f5:f6:f7`.
</div><div>

**Example** 🔥:

```ps
$ cat /etc/passwd | cut -d: -f1
root
$ cat /etc/passwd | cut -d: -f1-3
root:x:0
$ cat /etc/passwd | cut -d: -f1,3
root:0
```
</div></div>

[**tr** - replace character]

<div class="row row-cols-lg-2"><div>

**Usage** 🐚: replace a character with another, or delete a character.

**Example** 🔥:

Replace whitespaces with the newline character

```ps
$ cat file | tr ' ' '\n'
```
</div><div>

Delete every character `W`

```ps
$ cat file | tr -d 'W'
```
</div></div>

[**nl** - line numbering]

<div class="row row-cols-lg-2"><div>

**Usage** 🐚: number lines of files

**Example** 🔥:

Number non-empty lines

```ps
$ nl file
$ nl -bt file
```
</div><div>

Number all lines

```ps
$ nl -ba file
```
</div></div>

[**wc** - number of lines/...]

<div class="row row-cols-lg-2"><div>

**Usage** 🐚: count words/lines/characters

**Example** 🔥:

Use `-l` for lines, `-w` for words, and `-c` for characters.

```ps
$ cat file.txt | wc -l
7560 # lines
```
</div><div>

You can read something from stdin. Use <kbd>CTRL+D</kbd> to indicate the end of the input.

```ps
$ wc -w
Hello
World # <CTRL+D>
2
```
</div></div>

[**sort** - sort lines]

<div class="row row-cols-lg-2"><div>

**Usage** 🐚: output the sorted file

**Example** 🔥:

```ps
$ sort
$ sort -d
```

* `-b`: ignore leading blanks
* `-r`: reverse (z to a)
</div><div>

You can define a separator (`:`), and only sort a column.

```ps
$ sort s -t: -k2 # sort by second column
3:a
1:b
2:c
$ sort s -t: -k2.0 # column.nth character
$ sort s -t: -k2.0,2.1 # range
```
</div></div>

[**uniq** - duplicates lines]

<div class="row row-cols-lg-2"><div>

**Usage** 🐚: remove lines or indicate how many duplicates there are for each unique line.

**Example** 🔥:

Remove duplicates

```ps
$ uniq < file
```
</div><div>

Add the number of duplicates for each unique line

```ps
$ uniq -c < file
  1: XXX
  1: YYY
  5: ZZZ
```
</div></div>

++++++

<hr class="sep-both">

## Utilities

++++++

[**wget** - download files/folders]

[![linuxfundamentalspart3](../../../cybersecurity/_badges/thm/linuxfundamentalspart3.svg)](https://tryhackme.com/room/linuxfundamentalspart3)

<div class="row row-cols-lg-2"><div>

**Usage** 🐚: download files/folders.

**Example** 🔥:

```ps
$ wget https://path/to/file [...]
$ wget -r [...]          # download a folder
$ wget -O xxx [...]      # output name
$ wget -P xxx [...]      # output location
```
</div><div>

Other helpful options:

```ps
$ wget -d [...]         # debug
$ wget --no-parent [...] # maxdepth 1
$ wget -t 2 [...]        # number of tries
$ wget -T 30 [...]       # timeout
$ wget --no-check-certificate [...] # no SSL
```
</div></div>

[**curl** - do HTTP requests]

[![webrequests](../../../cybersecurity/_badges/htb/webrequests.svg)](https://academy.hackthebox.com/course/preview/web-requests)

<div class="row row-cols-lg-2"><div>

**Usage** 🐚: do GET/POST/... requests.

**Example** 🔥:

GET request.

```ps
$ curl https://example.com    # GET an URL
$ curl -u username:pass [...] # HTTP Basic Auth
$ curl -i [...]               # request headers (any request)
$ curl -k [...]               # ignore SSL errors
$ curl -O [...]               # save ; use remote filename
$ curl -o xxx [...]           # save ; use custom filename
$ curl --silent [...]         # -s | only print the output
```
</div><div>

Craft an [HTTP](/operating-systems/networking/protocols/http.md) request:

```ps
$ curl -X GET [...]           # same as "--request"
$ curl -H "Name: Value" [...] # same as "--header"
$ curl -d "key=value" [...]   # same as "--data"
$ curl -d '{"key":"value"}' [...] # ex: json
$ curl -A "xxx" [...]         # set user-agent
$ curl -b "NAME=VALUE" [...]  # set cookie
$ curl -T file [...]          # upload file using PUT
```

POST request.

```ps
$ curl -X POST 'URL' -d 'key=value' -H 'Content-Type: application/x-www-form-urlencoded'
```
</div></div>

[**time** - execution time]

<div class="row row-cols-lg-2"><div>

**Usage** 🐚: track the time a command takes.

**Example** 🔥:

```ps
$ time sleep 5
real    0m5.002s
user    0m0.001s
sys     0m0.000s
```
</div></div>

[<br>]

[**xrandr** - display settings]

<div class="row row-cols-lg-2"><div>

**Usage** 🐚: set the size, orientation, brightness of the screen...

**Example** 🔥:

Set the brightness to "0.5"

```ps
$ xrandr --output DP-2 --brightness 0.5
```
</div></div>

++++++

<hr class="sep-both">

## 👻 To-do 👻

Stuff that I found, but never read/used yet.

<div class="row row-cols-lg-2"><div>

* [modern-unix](https://github.com/ibraheemdev/modern-unix)
* [pretty CSV](https://www.stefaanlippens.net/pretty-csv.html)
* `mktemp`
* `ranger`
* `hexdump`
* `cloc`, `sloc`
* `column -t` (t=as table)
</div><div>

* `getent` <sup>2</sup>: get an entry such as "passwd": `getent passwd` <small>(get entry)</small> instead of `cat /etc/passwd`
* `dd if=/dev/zero of=bigfile bs=1M`
* `jq '.x.y '`,`'a,b'`

```text!
lsblk==block devices
lsusb==USB devices
lsof==opened files (ex: see if device files are in-use)
lspci==opened PCI devices
```
</div></div>