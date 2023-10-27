# Command Basics

<div class="row row-cols-md-2"><div>

Commands usually have an option "help". ⛪

```shell!
$ man -h
$ find -help
$ gcc --help
```

⚠️ There is no echo/feedback when writing a password.
</div><div>
</div></div>

<hr class="sep-both">

## Strings manipulation

<div class="row row-cols-md-2 mx-0"><div>

When using commands, you will most likely use, or have to use strings. Most of the time, quotes are optional, and command arguments do not need to be quoted 🎯.

```ps
$ echo Hello, World
$ echo 'Hello, World'
$ echo "Hello, World"
```

Concatenation is also implicit. All of these are the same:

```ps
$ cat abc
$ cat "a"bc
$ cat "ab"c
$ cat "abc"
$ cat "a""bc"
```
</div><div>

There are times when we **must quote** an argument 🎣. For instance, when there is a space inside a name/path.

```
$ ls /Documents/my bookmarks/ # ❌
$ ls "/Documents/my bookmarks/" # ✅
$ ls '/Documents/my bookmarks/' # ✅
$ ls /Documents/my\ bookmarks/ # ✅
```

👉 The main difference between single and double quote is that in the former, variable are NOT interpreted. Refer to the [scripts section](/operating-systems/linux/shells/scripts/index.md).

<details class="details-n">
<summary><code>expr</code>: substring, indexOf...</summary>

Length of a string

```shell!
$ expr length "Sarah"
5
```

Extract a substring <small>("3" characters in "Sarah" from index "2")</small>

```shell!
$ expr substr "Sarah" 2 3
ara
```

Index of a character in a string <small>(index of S/w in Sarah)</small>

```shell!
$ expr index "Sarah" S
1
$ expr index "Sarah" w
0
```
</details>
</div></div>

<hr class="sep-both">

## Calculations

<div class="row row-cols-md-2 mx-0"><div>

You may want to do some stuff involving calculations. The shell won't interpret any calculations, so you must use `$[...]` or `$((...))` to evaluate something.

```ps
$ four=$[3+1]
$ four=$((3+1)) # same
```
</div><div>

Example of increasing a variable by one <small>(loops are covered in scripts)</small>.

```shell!
i=0
while [ $i -lt 5 ]; do
   i=$[i+1] 
done
```
</div></div>

<hr class="sep-both">

## Pipes

[![linux2](../../../cybersecurity/_badges/thm/linux2.svg)](https://tryhackme.com/room/linux2)

<div class="row row-cols-md-2 mt-3"><div>

It's possible for a command output, to be used as the next command input using a pipe: **their_output | is_my_input**.

**Example** 🔥:

The command `wc -l` is used to count the number of lines in a text. The text could be a file, or some input like below:

```
$ wc -l
aaa
bbb
2 # two lines
```

➡️ As a reminder, use `CTRL+D` to indicate the end of the input.
</div><div>

The command `find . -name toto` find recursively every file named "toto" starting from the folder '`.`'. Its output is something like:

```ps
$ find . -name toto
./mem/all_toto_copy/toto
./mem/all_toto/toto
[...]
./mem/toto
```

Using a pipe, we can send the output of `find` to `wc`, and find the number of files (lines) returned by `find`:

```ps
$ find . -name toto | wc -l
57 # find returned 57 lines
```
</div></div>

<hr class="sep-both">

## Chaining commands

[![linuxfundamentalspart1](../../../cybersecurity/_badges/thm/linuxfundamentalspart1.svg)](https://tryhackme.com/room/linuxfundamentalspart1)
[![linux2](../../../cybersecurity/_badges/thm/linux2.svg)](https://tryhackme.com/room/linux2)

<div class="row row-cols-md-2"><div>

There are three reasons to chain commands:

* ✅ execute a command if the previous one was successful (`&&`)
* ❌ execute any command until one is successful (`||`)
* 🤝 put many commands in one line/statement (`;`)

For the two first ones, a command is said to be successful is the process exit code is **zero**. Otherwise, it failed.

```
$ cat not_found # a non-successful command
$ echo $?
1 # failure
```
</div><div>

**Examples** 🔥: 

Execute two commands in one go

```ps
$ ls toto; ls tata
```

Execute the second `ls` if the first was successful.

```ps
$ ls toto && ls tata
```

Execute the second `ls` if the first failed.

```ps
$ ls toto || ls tata
```
</div></div>

<hr class="sep-both">

## Redirections

[![linuxfundamentalspart1](../../../cybersecurity/_badges/thm/linuxfundamentalspart1.svg)](https://tryhackme.com/room/linuxfundamentalspart1)
[![linux2](../../../cybersecurity/_badges/thm/linux2.svg)](https://tryhackme.com/room/linux2)

<div class="row row-cols-md-2"><div>

Redirections allow us to:

* 🛁 fill `stdin` with a source such as a file
* 🗃️ redirect `stdout` to a file
* 🚩 redirect `stderr` to a file

There are multiple and varied uses:

* 🚀 fill commands needing user input with data from a file
* 🧑‍🏭 store results that we took a long time to compute, to avoid losing them or having to compute them again
* 🧯 redirect error to `/dev/null` <small>(discard errors)</small>
* 🪲 store errors for debugging purposes
* ...

**Examples** 🔥:

Redirect `stdout` to a file (save result)

```shell!
$ echo "Hello, World" > myFile
```

Append `stdout` to a file

```shell!
$ echo "Hello, World" >> myFile
```
</div><div>

Use a file instead of user input

```shell!
$ tee < original.txt
Hello, World
```

Redirect errors to a file/discard them

```shell!
$ cat not_found 2> onl_errors_will_be_stored_here
$ cat not_found 2> /dev/null # discard them
```

Redirect `stdout` to`stderr` <small>(uncommon usage)</small>

```shell!
$ >&2 echo "xxx"
$ echo "xxx" >&2
```

Merge `stderr` with `stdout` <small>(uncommon usage)</small>

```shell!
$ cat not_found 2>&1
```

Discard `stdout`, but keep `stderr` <small>(uncommon usage)</small>

```shell!
$ echo xxx &> /dev/null
```

Redirect both `stdout` and`stderr` <small>(uncommon usage)</small>

```shell!
$ echo xxx > output.txt 2>&1 # ⚠️ Order is important
```
</div></div>

<hr class="sep-both">

## Special

<div class="row row-cols-md-2"><div>

#### Command substitution

Command substitution is mainly used in scripts, to store the result of a command inside a variable. In a nutshell, a command output is used as a parameter of another command: **xxx $(yyy)** or **xxx \`yyy\`**.

**Example** 🔥: all of these commands are the same

```ps
$ ls ~
$ ls `echo ~`
$ ls $(echo ~)
```
</div><div>

#### Subshell

A subshell is a shell that is launched within another shell, allowing us to execute commands without changing the parent shell environment.

**Example** 🔥: In the example below, we create a variable in a subshell, and print it. We also try to print the variable outside the subshell, but since the variable does not exist, the output is empty.

```shell!
$ (cat=toto; echo "1. $cat") && echo "2. $cat"
1. toto
2.
```

👉 It could be used to temporarily change location, set an environment variable for one command...
</div></div>

<hr class="sep-both">

## 👻 To-do 👻

Stuff that I found, but never read/used yet.

<div class="row row-cols-md-2"><div>

* terminal shortcuts <small>(CTRL +/-/L/D, scroll button...)</small>
* CTRL+SHIFT+T to open a terminal.
</div><div>
</div></div>