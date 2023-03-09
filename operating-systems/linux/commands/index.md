# Linux commands

<div class="row row-cols-md-2 mt-4"><div>

...
</div><div>

...
</div></div>

<hr class="sep-both">

## Terminal-related

++++++

[**echo/printf** - print text]

<div class="row row-cols-md-2"><div>

**Usage** 🐚: print text, usually for debugging or displaying instructions/results

**Example** 🔥:

```bash
$ echo Hello, World
$ echo 'Hello, World'
$ echo "Hello, World"
```
</div><div>

**-n** 🧪: to remove the newline

```bash
$ echo -n "Hello, World"
```

**alt** ⚔️: You can also use `printf "format" arguments`:

```bash
printf "%s\n" "Hello, World"
```
</div></div>

[**cat/tac** - display a file]

<div class="row row-cols-md-2"><div>

**Usage** 🐚:

* `cat` is commonly used display a file.
* `cat` is intended to be used to merge multiple files in one, and display the output.

👉 `tac` is printing the file from the end to the start. And concatenating files after reversing their lines.

**Example** 🔥:

```bash!
$ cat file
# the content here
```

```bash!
# read for stdin
$ cat -
```
</div><div>

➡️ Concatenating files

```bash!
$ cat f0 f1
f0
f1 Line 1
f1 Line 2
```

```bash!
$ tac f0 f1
f0
f1 Line 2
f1 Line 1
```

Create a file f2 with input from f0, f1, and stdin.

```bash!
$ cat f0 f1 - > f2
```
</div></div>

[**less/more** - read a file]

<div class="row row-cols-md-2"><div>

**Usage** 🐚: both are used to browse files/content from the CLI.

👉 `more` is rarely used as there is `cat` for short files, and `less` is more appropriate for large files.
</div><div>

**Example** 🔥:

```bash!
$ more file
$ less file
```

👉 Use UP/DOWN to move, and Q to exit.
</div></div>

[**clear** - clear the terminal]

<div class="row row-cols-md-2"><div>

**Usage** 🐚: clear the terminal

**Example** 🔥:

```bash!
$ clear
```
</div><div>

👉 You may use the shortcut <kbd>CTRL+L</kbd>.
</div></div>

[**shopt** - configure the shell]

<div class="row row-cols-md-2"><div>

**Usage** 🐚: change the terminal behavior

**Example** 🔥:

Enable an option <small>(ex: nullglob)</small>

```bash
$ shopt -ps nullglob
```
</div><div>

Disable an option <small>(ex: nullglob)</small>

```bash
$ shopt -pu nullglob
```

> The `nullglob` option is replacing patterns with the null string if there are no matches.
</div></div>

++++++

<hr class="sep-both">

## Computer information

++++++

[**id** - user info]

<div class="row row-cols-md-2"><div>

**Usage** 🐚: info about a user

**Example** 🔥:

```bash!
$ id # current user
$ id username # some user
```
</div></div>

[**whoami** - user username]

<div class="row row-cols-md-2"><div>

**Usage** 🐚: username of the current user

**Example** 🔥:

```bash!
$ whoami
username
```
</div></div>

++++++

<hr class="sep-both">

## Computer management

++++++

[**apt** - package manager]

👻 To-do 👻

[**dkpg** - package manager]

👻 To-do 👻

[**snap** - package manager]

👻 To-do 👻

++++++

<hr class="sep-both">

## File management

++++++

[**pwd** - current directory]

**Usage** 🐚: echo the path to the working directory

**Example** 🔥:

```bash
$ pwd
/home/listro
```

[**ls/dir** - list files]

👻 To-do 👻

[**cd** - navigate to ...]

<div class="row row-cols-md-2"><div>

**Usage** 🐚: move to another directory

**Example** 🔥:

```bash!
$ cd folder
```
</div><div>

Move to the HOME folder

```bash!
$ cd
$ cd ~
```

Move to the previous folder

```bash!
$ cd -
```
</div></div>

[**mkdir** - create a folder]

<div class="row row-cols-md-2"><div>

**Usage** 🐚: create one or more folders

**Example** 🔥:

```bash!
$ mkdir folder
```
</div><div>

Create every non-existing folder in a path

```bash!
$ mkdir -p folder0/folder1/folder2
```
</div></div>

[**🔎** - create a file]

👻 To-do 👻

[**mv** - move or rename]

<div class="row row-cols-md-2"><div>

**Usage** 🐚: takes a list of folders/files to move, and a destination. Move all files/folders to the destination.

**Example** 🔥:

```bash!
$ mv toto ./all_toto/
$ mv toto -t ./all_toto/ # same
$ mv toto1 toto_2 ./all_toto/
```
</div><div>

**Rename**

```bash!
$ mv toto toto0
```
</div></div>

[**cp** - copy files/folders]

<div class="row row-cols-md-2"><div>

**Usage** 🐚: takes a list of folders/files to copy, and a destination. Copy all files/folders to the destination.

**Example** 🔥:

```bash!
$ cp toto ./all_toto/
$ cp toto1 toto_2 ./all_toto/
```
</div><div>

To create a copy

```bash!
$ cp toto toto0 # ⚠️ toto still exists
```

**-r** ⚠️: required to copy a folder and its content

```bash
$ cp -r all_toto/ all_toto_copy
```
</div></div>

[**rm/rmdir** - delete]

<div class="row row-cols-md-2"><div>

**Usage** 🐚: use `rm` to remove files/folders. `rmdir` is usually not used.

**Example** 🔥:

```bash!
$ rm file
$ rm file0 file1
```

👉 `rm` by default is asking for confirmation.

```bash!
$ rm -f file # do not ask (f=force)
$ rm -i file # ask
```
</div><div>

👉 Delete a folder

```bash
$ rm -d folder # if the folder is empty
$ rm -r folder # -R is doing the same
```

👉 Delete a folder and to not ask for confirmation

```bash
$ rm -rf folder # usual f + r
```
</div></div>

++++++

<hr class="sep-both">

## User management

++++++

[**useradd** - add a user]

👻 To-do 👻

[**deluser** - delete a user]

👻 To-do 👻

++++++

<hr class="sep-both">

## 👻 To-do 👻

Stuff that I found, but never read/used yet.

<div class="row row-cols-md-2"><div>

* [old](_old.md)
</div><div>

</div></div>