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

[**id** - xxx]

👻 To-do 👻

[**whoami** - xxx]

👻 To-do 👻

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

👻 To-do 👻

[**mv** - move or rename]

👻 To-do 👻

[**cp** - copy or rename]

👻 To-do 👻

[**rm/rmdir** - delete]

👻 To-do 👻

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