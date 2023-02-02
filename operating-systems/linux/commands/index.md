# List of essential Linux commands

A lot of commands, that can be used on Linux-based distributions, along with their most useful options, and some tips about their usage. This includes commands such as `sudo`, `apt`, `man`, `ls`, `cd`, `pwd`, `echo`, `printf`, `cat`, `less`, `mkdir`, `touch`, `cp`, `mv`, `rm`, `ln`, `chmod`, `umask`, `chown`, and many more.

**Note**: some commands are not listed here

<blockquote>
<div class="row row-cols-md-2"><div>

* `test`<sup>1</sup>: take a condition, and exit with 0 if true, 1 if false
* `seq` <sup>1</sup>: generate a list of numbers
* `read` <sup>1</sup>: to read input from the user
* `exit` <sup>1</sup>: exit the shell with an exit code
* `env/printenv` <sup>2</sup>: list all environment variables
* `getent` <sup>2</sup>: get an entry such as "passwd"
* `hexdump` <sup>3</sup>: convert some text to octal/hexadecimal
* `k#n` <sup>3</sup>: convert a number $n$ in radix-$k$ to decimal
</div><div class="small">

<sup>1</sup> see [Linux - Scripts](../scripts/index.md)<br>
<sup>2</sup> see [Linux - Main course](../knowledge/index.md) <br>
<sup>3</sup> see [Linux - Radix](../../../_archives/maths/radix/index.md)
</div></div>
</blockquote>

<span class="h4 fs-4">➡️ If there is a command that you don't understand, check out [explain shell](https://explainshell.com/).
</span>

<hr class="sr">

## Less-editor

<div class="row row-cols-md-2"><div class="align-self-center">

*This isn't an official way to call it*, but there is a command called `less` allowing you to read a usually big amount of text in a terminal editor. Less-editor is used by **man**, and some other commands.

There are QUITE a lot of options. Simply press <kbd>h</kbd> to see all of them.
</div><div>

* <kbd>arrow up</kbd>: to move up,
* <kbd>arrow down</kbd>: to move down
* <kbd>q</kbd>: to quit
* <kbd>/something</kbd>: search "something"
  * <kbd>Enter or n</kbd>: go to the next match
  * <kbd>N</kbd>: go back to the previous match
</div></div>

<hr class="sl">

## System

<details class="details-e mt-4">
<summary><code>sudo</code>: elevate to administrator</summary>
<div class="row row-cols-md-2"><div>

Execute a command `<command>` as root.

```bash
$ sudo <command>
# ex: ls /
$ sudo ls /
```
</div><div>

Elevate the shell. In an elevated shell, there is no need to add `sudo` before each command.

```bash
$ sudo -s
```
</div></div>
</details>

<details class="details-e">
<summary><code>apt/aptitude/dpkg</code>: install/update packages/OS</summary>
<div class="row row-cols-md-2"><div>

`apt` is the default package manager on many well-known Linux-based distributions such as Ubuntu/Debian.

```bash
# operations on the package "aptitude"
sudo apt install aptitude # install the package as well as its dependencies
sudo apt update aptitude # search for an update
sudo apt upgrade aptitude # install the update
sudo apt remove aptitude  # uninstall the package
sudo apt auto-remove # uninstall the package as well as its useless dependencies
# update OS
sudo apt dist-upgrade
```
</div><div>

When installing packages, you are prompted `Do you want to continue? [Y/n]` (you need to enter `Y`). You can skip this, using `-y`.

```bash
sudo apt install -y aptitude
```

`aptitude`, which needs to be installed, is doing the same as `apt`, but there is a graphical interface included.

```bash
sudo aptitude # press 'q' to quit
sudo aptitude install nano
```

And, you can use this to install a `.deb`

```bash
$ sudo dpkg -i xxx.deb
```
</div></div>
</details>

<details class="details-e">
<summary><code>man/apropos/whatis</code>: manual for most commands</summary>
<div class="row row-cols-md-2"><div>

**Note**: man may have to be installed.

```bash
$ man man
```

Commands usually have an option "help".

```bash
$ man -h
$ find -help
$ gcc --help
```

Display one-line manual page descriptions

```bash
$ whatis whatis
whatis (1) - display one-line manual page descriptions
```
</div><div>

Entries in the manual are split into sections. To access a command in a specific section, simply add the section number before the command.

```bash
$ man 1 man
```

You can use `apropos` to search in which section a command is.

```bash
$ apropos fopen
fopen (3)            - stream open functions
fopencookie (3)      - opening a custom stream
$ man 3 fopen
```
</div></div>
</details>

<div class="row row-cols-md-3"><div>
<details class="details-e">
<summary><code>clear</code>: clear the terminal</summary>

```bash
$ clear
```

You may use the shortcut <kbd>CTRL+L</kbd>.

</details>
</div><div>
<details class="details-e">
<summary><code>alias</code>: create an alias for a command</summary>

If you want `ls` to always use `-la`:
```bash
$ alias la='ls -la'
$ la
# same as ls -la
```

You can see every alias created using:

```bash
$ alias
```

**Note**: aliases aren't permanent. Add them in your `.bashrc`.
</details>
</div><div>
<details class="details-e">
<summary><code>update-alternatives</code>: switch PHP/Python/Java... version</summary>

**Note**: it's only available on Debian-based distributions, from what I read.

```bash
$ sudo update-alternatives --config php
```

> c++, cc, nc, php, java...
</details>
</div></div>

<div class="row row-cols-md-2"><div>
<details class="details-e">
<summary><code>shopt</code>: change terminal behavior</summary>

Enable an option (ex: nullglob)

```bash
$ shopt -ps nullglob
```

Disable an option (ex: nullglob)

```bash
$ shopt -pu nullglob
```

> By default, if a pattern returns nothing, some commands fail. This option will make any pattern without results return an empty "null" string.

</details>
</div><div>
<details class="details-e">
<summary><code>xrandr</code>: set the size, orientation, brightness of the screen</summary>

Set the brightness to "0.5"

```bash
$ xrandr --output DP-2 --brightness 0.5
```
</details>
</div></div>

> Random:
> 
> * you can use `xdg-open` to open a PDF, or an URL.
> * you can use `getent passwd` <small>(get entry)</small> instead of `cat /etc/passwd`

<hr class="sr">

## Must know

<details class="details-e mt-4">
<summary><code>ls/dir</code>: list all files in a directory</summary>
<div class="row row-cols-md-2"><div>

**Note**: `dir` is working exactly like `ls`, we are using the shorter one.

List all files in the given directory. If none, work on the current directory. If a file is given, show information about the file.

* `-l` : shows a lot of information (l=long)
* `-a`: show hidden files
* `-R`: recursive
* `-p`: add a trailing "/" to repositories

```bash
$ ls
$ ls . # same as "ls"
$ ls folder
$ ls *.txt # show every .txt
```

</div><div>

```bash
$ ls -l file # info on file
$ ls -la folder # info + hidden
```

* `-A`: hide ".", and ".."
* `-s`: show size
* `--format="format"`: use a custom format
* `--hide="pattern"`: hide files matching "pattern"
* `-S`: sort by size
* `-t`: sort by last modified date
* `-u`: sort by last access date
</div></div>
</details>

<div class="row row-cols-md-2"><div>
<details class="details-e">
<summary><code>cd</code>: move to another directory</summary>

```bash
$ cd folder
$ cd ~
$ cd # same as cd ~
```

You may go back to the previous folder because using `cd`

```bash
$ cd -
```
</details>
</div><div>
<details class="details-e">
<summary><code>pwd</code>: echo the working directory</summary>

```bash
$ pwd
/home/listro
```
</details>
</div></div>

<div class="row row-cols-md-2"><div>
<details class="details-e">
<summary><code>echo/printf</code>: display something</summary>

```bash
$ echo Hello, World
$ echo "Hello, World"
```

To remove the newline, use `-n`:

```bash
$ echo -n "Hello, World"
```

You can also use `printf "format" arguments`:

```bash
printf "%s\n" "Hello, World"
```
</details>
</div><div></div>

</div>

<details class="details-e">
<summary><code>cat/tac/less/more</code>: print/display a file</summary>
<div class="row row-cols-md-2"><div>

`cat` is the most used command to see the content of a file, while `less` is also quite used for big files, as we can scroll up/down. `more` is an in-between, working like `cat` for small files, and a bit like `less` for big files.

```bash
$ cat file
$ more file # use up/down, and q
$ less file # use up/down, and q
```

But, `cat` is originally a command to concatenate files/input, and output the result.

```bash
$ cat f0 f1
f0
f1 Line 1
f1 Line 2
```
</div><div>

The command `tac` is doing the same, but each file is reversed.

```bash
$ cat f0 f1
f0
f1 Line 1
f1 Line 2
$ tac f0 f1
f0
f1 Line 2
f1 Line 1
```

`cat` may be used on some input

```bash
$ cat
$ cat -
$ cat f0 f1 - > ok
```
</div></div>
</details>

<hr class="sl">

## Manage files and folders

Create

<div class="row row-cols-md-2"><div>
<details class="details-e">
<summary><code>mkdir</code>: create directories</summary>

```bash
$ mkdir folder
```

Create every non-existing folder in a path

```bash
$ mkdir -p folder0/folder1/folder2
```
</details>
</div><div>
<details class="details-e">
<summary><code>touch</code>: may create file, update the last modified date</summary>

Create a file if needed, otherwise, update the last modified date. **It is important to note that this command is not clearing the contents of the existing file if any**.

```bash
$ touch a_file
```
</details>
</div></div>

<details class="details-e">
<summary><code>echo/truncate/...</code>: create an empty file / clear the contents of a file</summary>
<div class="row row-cols-md-2"><div>

You can create a file using echo, with a redirection

```bash
$ echo -n "" > file
$ echo -n > file # some are allowing this syntax
```

But, the syntax above may be shortened quite a bit

```bash
# Not working everywhere, but quite well-known
$ > file
# Should work everywhere
$ :> file
```
</div><div>

Another wordy way is using `cp`

```bash
$ cp /dev/null file
```

Or, using `truncate`

```bash
$ truncate -s 0 file
```
</div></div>
</details>

Move, copy, and/or rename

<div class="row row-cols-md-2"><div>
<details class="details-e">
<summary><code>cp</code>: copy (+rename) files/folders</summary>

`cp` is taking a list of folders/files to copy, and a destination

```bash
$ cp toto ./all_toto/
$ cp toto1 toto_2 ./all_toto/
```

To rename something

```bash
$ cp toto toto0
```

To copy a **folder**, along with its content

```bash
$ cp -r all_toto/ all_toto_copy
```
</details>
</div><div>
<details class="details-e">
<summary><code>mv</code>: move (+rename) files/folders</summary>

`mv` is taking a list of folders/files to move, and a destination

```bash
$ mv toto ./all_toto/
$ mv toto -t ./all_toto/ # same
$ mv toto1 toto_2 ./all_toto/
```

To rename something

```bash
$ mv toto toto0
```
</details>
</div></div>

Delete, and create links

<div class="row row-cols-md-2"><div>
<details class="details-e">
<summary><code>rm/rmdir</code>: to remove files/folders</summary>

`rm` is taking a list of files to remove.

```bash
$ rm file
$ rm file0 file1
```

`rm` by default is asking for confirmation.

```bash
$ rm -f file # do not ask (f=force)
$ rm -i file # ask
```

To delete a folder <small>(there is also `rmdir`, but it's garbage 😒)</small>

```bash
$ rm -d folder # if the folder is empty
$ rm -r folder # -R is doing the same
$ rm -rf folder # usual f + r
```
</details>
</div><div>
<details class="details-e">
<summary><code>ln</code>: to create links</summary>

To create a symbolic link

```bash
$ ln -s target_of_the_sl dest_of_the_generated_sl
```
</details>
</div></div>

<hr class="sr">

## Permissions

<details class="details-e mt-4">
<summary><code>chmod</code>: change a file/folder permissions</summary>

<div class="row row-cols-md-2"><div>

Use <kbd>+</kbd> to grant perms..

```bash
$ chmod u+x target
$ chmod g+rw target
$ chmod ug+r target
$ chmod g+x,o+rx target
```

If there is nothing before "+", Grant to <kbd>a</kbd> (alias of <kbd>ugo</kbd>)

```bash
$ chmod +x target
$ chmod a+x target # same
$ chmod ugo+x target # same
```
</div><div>

Use <kbd>-</kbd> instead of <kbd>+</kbd> to revoke permissions.

```bash
$ chmod -x target
$ chmod u-x target
$ chmod ug-rw target
```

Grant "perms" using the shortcut number.

```bash
# u=rwx, g=rx, o=x
$ chmod 751 target
# u=rwx, g=, o=
$ chmod 700 target
```

</div></div>
</details>

<div class="row row-cols-md-2"><div>
<details class="details-e">
<summary><code>umask</code>: change default permission for new files</summary>

A call to `umask` return the **missing** permissions with a leading `0`.

```bash
$ umask
0026 # meaning 751 by default
$ umask -s
u=rwx,g=rx,o=r
$ umask 0026
$ umask u=rwx,g=rx,o=r
```

</details>
</div><div>

<details class="details-e">
<summary><code>chown</code>: change the owner of a file/folder</summary>

```bash
$ ls -l toto.txt
-rw-r-xr-x 1 n1 n [...] toto.txt 
$ chown n2 toto.txt
-rw-r-xr-x 1 n2 n [...] toto.txt
$ chown n2:m toto.txt
-rw-r-xr-x 1 n2 m [...] toto.txt
```

You may use `-R` (recursive), and `-h` (do not deference symbolic links).
</details>
</div></div>

<hr class="sl">

## Search

<details class="details-e mt-4">
<summary><code>find</code>: search for files</summary>
<div class="row row-cols-md-2"><div>

The starting point is `find folder`, which explores recursively, and lists every file inside `folder`. You may

* Apply filters
  * `-type`: f=files only, d=folders only 
  * `-empty`: empty only
  * `-name "pattern"`: files' names matching "pattern"
* Execute an action on each result
  * `-exec ... \;`: `{}` is the current file on which you may perform an action. `...` is some placeholder for your code that will use `{}`.
  * `-execdir ... {} \;`: same as `-exec`, but each command is executed in the folder of `{}`, and not in the folder where the `find` was executed.
* Use other options
  * `-quit`: exit when one result is found
  * `-printf`: change output
  * `-mindepth value`: minimum depth (default=0)
  * `-maxdepth value`: maximum depth (depth=none)

<details class="details-e">
<summary>Not frequently used options</summary>

* `-mtime n` and `-atime n`: changed/accessed in the last $n$ days
* `-cmin n` and `-amin n`: changed/accessed in the last `n` minutes
* `-newer file`: modified after `file`
* `-size vu`: `v` is the value, `u` is the unit (ex: `4M` for 4 Mb)
* `-perms 0744` or `-perms a=x` or `-writable` or `-perm -o w` or `-222`: files matching the given perms
* `-user username`: files belonging to username
* `-group group_name`: files belonging to the group "group_name"

You can add `+` or `-` before $n$ / $vu$ to indicate any value higher (resp. lower) than the provided one.

find a file with a modified (`mt`, accessed is `at`) date of 2020-09-12. We are using ranges, but you may include only one of them.

```bash
$ find / -newermt 2020-09-11 ! -newermt 2020-09-13
```

</details>
</div><div>

Find every file named "ocaml" <small>(see the latest example to fix "errors")</small>

```bash
$ find / -name "ocaml" -type f
```

Find every folder called `bin` <small>(see the latest example to fix "errors")</small>

```bash
$ find / -name "bin" -type d
```

Execute the command `file` on every file called `hello_world` in the current directory.

```bash
$ find . -name "hello_world" -type f -maxdepth 1 -exec file '{}' \;
```

Get rid of errors when using find as find is trying to read directories without having sufficient permissions.

```bash
$ find / -name "bin" 2> /dev/null
```
</div></div>
</details>

<div class="row row-cols-md-3"><div>
<details class="details-e">
<summary><code>locate</code>: search in a file database</summary>

The local database must be updated manually `sudo updatedb`.

```bash
$ locate find
```
</details>
</div><div>

<details class="details-e">
<summary><code>which</code>: first matching command</summary>

```bash
$ which find
/usr/bin/find
```
</details>
</div><div>

<details class="details-e">
<summary><code>whereis</code>: search in PATH</summary>

```bash
$ whereis ls
ls: /bin/ls /usr/share/man/man1/ls.1.gz
```
</details>
</div></div>

<hr class="sr">

## Users, and groups

<div class="row row-cols-md-3 mt-4"><div>
<details class="details-e">
<summary><code>useradd</code>: add a user</summary>

```bash
$ useradd username
# -m = create home
$ useradd username -g usergroup -b custom/path/to/home -m
```
</details>
</div><div>

<details class="details-e">
<summary><code>groupadd</code>: add a group</summary>

```bash
$ groupadd group_name
```
</details>
</div><div>

<details class="details-e">
<summary><code>passwd</code>: set password</summary>

Change the password of the current user.

```bash
$ passwd
```
</details>
</div></div>

<div class="row row-cols-md-3"><div>
<details class="details-e">
<summary><code>deluser</code>: delete a user</summary>

```bash
$ deluser username
```
</details>
</div><div>

<details class="details-e">
<summary><code>delgroup</code>: delete a group</summary>

```bash
$ delgroup group_name
```
</details>
</div><div>

<details class="details-e">
<summary><code>su</code>: change current user</summary>

```bash
$ su root
```

If you want to log in as another user (ex: move the their home...), use

```bash
$ su -l root
$ su - root # same
```
</details>
</div></div>

<div class="row row-cols-md-3"><div>
<details class="details-e">
<summary><code>id</code>: info about a user</summary>

```bash
$ id # current user
$ id username # some user
```
</details>
</div><div>

<details class="details-e">
<summary><code>whoami</code>: username of the current user</summary>

```bash
$ whoami
```
</details>
</div><div>

<details class="details-e">
<summary><code>usermod</code>: add user to sudoers</summary>

```bash
$ sudo usermod -a -G sudo username
```
</details>
</div></div>

<div class="row row-cols-md-3"><div>
<details class="details-e">
<summary><code>uname</code>: info about the machine</summary>

```bash
$ uname # show OS name
$ uname -s # same
$ uname -rv # kernel
$ uname -m # architecture (x64, x86...)
$ uname -a # all
```
</details>
</div></div>

<hr class="sl">

## Utilities

<div class="row row-cols-md-2 mt-4"><div>
<details class="details-e">
<summary><code>file</code>: show image resolution, basic info on a file/folder..</summary>

```bash
$ file folder
folder: directory
$ file image.jpg
image.jpg: JPEG image data, JFIF standard 1.01, resolution (DPI), density 72x72, segment length 16, comment: "CREATOR: gd-jpeg v1.0 (using IJG JPEG v90), quality = 90", baseline, precision 8, 1080x1350, components 3
```
</details>
</div><div>
<details class="details-e">
<summary><code>stat</code>: show a lot of informations about a file/folder</summary>

```bash
$ stat folder
$ stat file
$ stat toto -c "Size: %s -- Name: %n -- Perms: %a / %A -- type: %F"
Size: 4096 -- Name: toto -- Perms: 755 / drwxr-xr-x -- type: directory
```
</details>
</div></div>


<div class="row row-cols-md-2"><div>
<details class="details-e">
<summary><code>diff</code>: show the differences between two files</summary>

```bash
$ diff f0 f1 -q
Files f0 and f1 differ
$ diff f0 f1
# one-bellow-the-other diff
$ diff f0 f1 -y
# side-by-side diff
```
</details>
</div><div>
<details class="details-e">
<summary><code>patch</code>: apply a patch of the differences between two files</summary>

Generate a patch

```bash
$ diff f0 f1 -u
# ...
$ diff f0 f1 -u > f0.patch 
```

Then, you can use `patch` to apply the differences with `f1` to `f0`.

```bash
$ patch < f0.patch
```

</details>
</div></div>

<div class="row row-cols-md-2"><div>
<details class="details-e">
<summary><code>wget</code>: get a file/folder from a URL</summary>

```bash
$ wget https://path/to/file
$ wget -d https://path/to/folder/
```
</details>
</div><div>
<details class="details-e">
<summary><code>curl</code>: can be used to make requests</summary>

**Note**: you may have to install it.

* GET

```bash
$ curl https://example.com
$ curl --request GET https://example.com
$ curl -X GET https://example.com
```

* Request headers

```bash
$ curl -I https://example.com
```
</details>
</div></div>

<details class="details-e">
<summary><code>tar</code>: compress files (tar.gz, gz, tgz...), and decompress them</summary>
<div class="row row-cols-md-2"><div>

Compress <small>(`c`=create, `v`=verbose, `z`=compress, `f`=archive name)</small>

```bash
$ tar -cvzf archive_name.tar.gz file0 file1 # ...
```
</div><div>

Decompress <small>(`x`=decompress, `v`=verbose, `f`=archive name)</small>

```bash
$ tar -xvf archive_name.tar.gz
```
</div></div>
</details>

<div class="row row-cols-md-3"><div>
<details class="details-e">
<summary><code>zip/unzip</code>: zip/unzip a .zip</summary>

```bash
$ zip toto.zip f0 f1 f2
$ unzip toto.zip
```

View the contents of a zip

```bash
$ zipinfo toto.zip
$ unzip -l toto.zip
```
</details>
</div><div>
<details class="details-e">
<summary><code>date</code>: show the data</summary>

```bash
$ date
Mon 12 Oct 2020 08:32:11 PM EDT
```
</details>
</div><div>
<details class="details-e">
<summary><code>time</code>: track a command duration</summary>

```bash
$ time sleep 5
real    0m5.002s
user    0m0.001s
sys     0m0.000s
```
</details>
</div></div>

<div class="row row-cols-md-3"><div>
<details class="details-e">
<summary><code>tee</code>: read input, and output input</summary>

It's most likely more proper to use this than `cat` to output the content of a file.

```bash
$ tee < file
```

But the useful usage of tee is taking one input, and sending the output to many destinations.

```bash
$ tee output1 output2 < file
# also shows the content of the file here
$ tee output1 output2
Hello # CTRL-D
Hello
```

</details>
</div><div>
<details class="details-e">
<summary><code>du</code>: estimate file space usage</summary>

* `s` to summarize the result (one result per argument)
* `h` to use a human-readable format (add units...)

```bash
$  du -sh folder
8.0K folder
```
</details>
</div><div>
<details class="details-e">
<summary><code>tree</code>:  list files in a tree-like format</summary>

```bash
$ tree .
```
</details>
</div></div>

<hr class="sr">

## String utilities

<details class="details-e mt-4">
<summary><code>grep</code>: search file having a pattern in them</summary>
<div class="row row-cols-md-2"><div>

List files having 'toto' in them

```bash
$ grep "toto" *
$ grep --color "toto" * # highlight match
```

Best options

* `-r` recursive <small>(`-R` to follow links too)</small>
* `-i` Ignore case
* `-v` Inverse pattern
* `-c`: number of matches per file
* `-n`: add line number before each match
* `-o` show only the matched part
* `-H` show the file before every match
* `-w` words-only <small>("XxtotoxX" won't match "toto")</small>
</div><div>

Less frequently used

* `-L`: stop when match found, show files without matches
* `-l`: stop when match found, show file with matches
* `-q`: no output, use the exit code to indicate if a match was found (0), or not (1).

By default, if you are using `?`, `(`, or any character used by regexes, it won't be interpreted (`?` won't be considered as "optional"). You have two choices, using `-E` (extended), or escaping them

```bash
$ grep "opt?" *
# match "opt?"
$ grep "opt\?" *
# match "op" with "t" optional
$ grep -E "opt?" *
# same as grep -E
$ egrep "opt?" *
```
</div></div>
</details>

<details class="details-e">
<summary><code>sed</code>: search, and replace, or "play" with a file</summary>
<div class="row row-cols-md-2"><div>

One of the uses of "sed" is generating an output of a file after applying a modification. **sed does not change the content of the file**, use a redirection if that's what you want.

The syntax is `sed '<number><letter><args>' <file>`.

* `i`: add a line with "XXX" before (`i`) every line
* `a`: add a line with "XXX" after (`a`) every line
* `p`: duplicate every line
* `d`: delete every line
* `c`: replace every line with "XXX"
* `e`: execute the command before every line <small>(you may add parenthesis to make things cleaner)</small>

```bash
$ sed 'iXXX' file
$ sed 'cXXX' file
$ sed 'aXXX' file
$ sed 'p' file
$ sed 'e(echo hello)' file
```

Instead of applying a command to every line, you can pick some lines

```bash
$ sed '1iXXX' file # line 1
$ sed '1,3iXXX' file # line 1 to 3
$ sed '$iXXX' file # last line
$ sed '1p' file # duplicate first
$ sed '1d' file # delete first
# ...
```
</div><div>

The most well-known use case of `sed` is to replace something with something else.

The syntax is `sed 's/pattern/replaced_with/option`.

* `pattern`: refer to the regex section to write a pattern
* `option`:
  * `none`: first match of each line
  * `g`: every match is replaced
  * `n`: replace the nth match of each line
* `replaced_with`: it's usually some text

Replace every "e" with "E"

```bash
$ sed "s/e/E/g" file
```

Replace the first "e" of each file with "&lt;First E&gt;"

```bash
$ sed "s/e/E/" file
$ sed "s/e/E/1" file
```

Comment out every line starting with "S".

```bash
$ sed "s/^\(S.*\)/# \1./" file
```

To break down this sed, we are matching a line starting (`^`), followed by a 'S', and by 0, or more (`*`) characters (`.`). 

Because we need to print a `#`, then the line, we need to store the line. We are doing that using `\(\)` around the part we want to capture, and in the replacement text, we are using `\1` to reference the first capture group `\(\)`, as you may have multiple of them.
</div></div>
</details>

<div class="row row-cols-md-2"><div>
<details class="details-e">
<summary><code>awk</code>: extract columns (cut), rearrange columns...</summary>

[The_AWK_Programming_Language](https://ia903404.us.archive.org/0/items/pdfy-MgN0H1joIoDVoIC7/The_AWK_Programming_Language.pdf) & [To awk or not](https://pmitev.github.io/to-awk-or-not/)

`awk` is considering space (`-F` to change) as a separator for columns. The first column is `$1`, the nth column is `$n`. `$0` means every column.

The syntax is `awk 'target {action}' file`.

* `target`: is something to filter where the action is applied
* `action`: print

By default, `awk` prints every column.

```bash
$ awk '{print}' file
$ awk -F' ' '{print $0}' file # same
```

Only print the first column of lines having AT LEAST 6 columns (`NF`)

```bash
$ awk 'NF > 6 {print $1}' file
```

Print the first, and the third column, if the file has at least 3 lines (`NR`)

```bash
$ awk 'NR > 3 {print $1 $3}' file
```
</details>
</div><div>
<details class="details-e">
<summary><code>tr</code>: replace a character with another/delete a character</summary>

Replace "c" with "n"

```bash
$ cat file | tr 'c' 'n'
```

Can be used to insert new lines

```bash
$ cat file | tr 'c' '\n'
$ stat file -c "Size: %s\nName: %n\nPerms: %a / %A\ntype: %F" | tr '\\n' '\n'
```

Delete a character

```bash
$ cat file | tr -d 'W'
```

</details>
</div></div>

<div class="row row-cols-md-2"><div>
<details class="details-e">
<summary><code>wc</code>: count words/lines/characters</summary>

Use `-l` for lines, `-w` for words, and `-c` for characters.

```bash
$ cat file.txt | wc -l
7560 # lines
$ wc -w
Hello
World # <CTRL-D>
2
```
</details>
</div><div>
<details class="details-e">
<summary><code>nl</code>: number lines of files</summary>

Number non-empty lines

```bash
$ nl file
$ nl -bt file
```

Number all lines

```bash
$ nl -ba file
```
</details>
</div></div>

<div class="row row-cols-md-2"><div>
<details class="details-e">
<summary><code>head/tail</code>: show the $n$ first/last lines of a file</summary>

Both a working the same, `head` is for the first lines, `tail` is for the last lines, so I will only introduce one.

```bash
# first 10 lines
$ head f
# first 5 lines
$ head f -n 5
$ head f -n +5
# all lines, aside from the last 3 lines
$ head f -n -5
```
</details>
</div><div>
<details class="details-e">
<summary><code>cut</code> 😎: extract data</summary>

```bash
$ cat /etc/passwd
root:x:0:0:root:/root:/bin/bash
```

In this file, values are separated with `:`. For cut, if you consider `:` as a separator, it looks like this `f1:f2:f3:f4:f5:f6:f7`. These values "f" are called fields, and you can extract them.

```bash
$ cat /etc/passwd | cut -d: -f1
root
$ cat /etc/passwd | cut -d: -f1-3
root:x:0
$ cat /etc/passwd | cut -d: -f1,3
root:0
```
</details>
</div></div>

<div class="row row-cols-md-2"><div>
<details class="details-e">
<summary><code>sort</code>: output the sorted file</summary>

```bash
$ sort
$ sort -d
```

* `-b`: ignore leading blanks
* `-r`: reverse (z to a)

You can define a separator (`:`), and sort only a column.

```bash
$ sort s -t: -k2 # sort by second column
3:a
1:b
2:c
$ sort s -t: -k2.0 # column.nth character
$ sort s -t: -k2.0,2.1 # range
```

</details>
</div><div>
<details class="details-e">
<summary><code>expr</code>: substring, indexOf...</summary>

Length of a string

```bash
$ expr length "Sarah"
5
```

Extract a string of "3" characters from "Sarah" starting from index "2"

```bash
$ expr substr "Sarah" 2 3
ara
```

Index of ...

```bash
$ expr index "Sarah" S
1
$ expr index "Sarah" w
0
```


</details>
</div></div>

<hr class="sl">

## Processes

<details class="details-e mt-4">
<summary><code>ps</code>: list running processes</summary>
<div class="row row-cols-md-2"><div>

See all processes

```bash
$ ps -A # same as 'ps aux'
$ ps -e # same
$ ps -ef # add more information
$ ps axjf # view process tree
```

Every process "bash"

```bash
$ ps -C bash
```

List processes by PID (`-s` for SID)

```bash
$ ps -p 12563
$ ps -p 12560,12563
$ ps -p {12590..12600}
```

</div><div>

List processes for a given user (`-g` for a group)

```bash
$ ps -u username
```

List processes by terminal identifier, or a path to the terminal

```bash
$ ps -t pts/0
$ ps -t /dev/pts/0
```

Change the output

```bash
$ ps -j # basic
$ ps -l # long
$ ps -o pid,ppid
$ ps -o pid,ppid,pgid,tpgid,sid
```
</div></div>
</details>

<div class="row row-cols-md-3"><div>
<details class="details-e">
<summary><code>fg</code>: bring processes to the foreground</summary>

```bash
$ some_command &
[1] 89
$ fg
$ fg 1 # same
$ fg %1 # same
```
</details>
</div><div>
<details class="details-e">
<summary><code>bg</code>: bring processes to the background</summary>

```bash
$ some_command
# CTRL-Z
[1]+  Stopped
$ bg
$ bg 1 # same
$ bg %1 # same
```
</details>
</div><div>
<details class="details-e">
<summary><code>job</code>: list background processes</summary>

```bash
$ sleep 50&
[1] 36
$ jobs
[1]+  Running        sleep 50 &
```
</details>
</div></div>

<div class="row row-cols-md-2"><div>
<details class="details-e">
<summary><code>top/htop</code>: list all running processes</summary>

You may check/install `htop` instead of `top`.

```bash
$ top
```
</details>
</div><div>
<details class="details-e">
<summary><code>kill</code>: kill a process/send a signal</summary>

All are sending "SIGTERM" (soft kill, allow cleanup)

```bash
$ kill pid
$ kill 15  pid
$ kill -s TERM  pid
$ kill -SIGTERM  pid
```

* `-9` / SIGKILL: kill without cleanup
* `-19` / SIGSTOP: suspend

You can use `-l` to see the code for a given signal

```bash
$ kill -l SIGSTOP
19
```
</details>
</div></div>

<hr class="sep-both">

## 👻 To-do 👻

Stuff that I found, but never read/used yet.

<div class="row row-cols-md-2"><div>

* subshell
* `less -r`: read with colors?
* `mktemp`
* `ranger`
* pretty CSV ([article](https://www.stefaanlippens.net/pretty-csv.html))

```bash
wget https://github.com/alexhallam/tv/releases/download/1.4.30/tidy-viewer_1.4.30_amd64.deb
sudo dpkg -i tidy-viewer_1.4.30_amd64.deb
echo "alias tv='tidy-viewer'" >> ~/.bashrc
source ~/.bashrc
```
</div><div>

* `uniq / uniq -c`
* `find / -type f -a \( -perm -u+s -o -perm -g+s \)`
* `find / -type f -perm -04000 -ls 2>/dev/null`
* `\"'(safe and vuln)'\"")`
* `help`/`info`
* `xargs`
* `env X=val ./myScript`
* `strace/strings` [link](https://jvns.ca/strace-zine-v3.pdf)
</div></div>