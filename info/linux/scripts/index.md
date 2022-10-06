# Scripts (bash)

<div class="row row-cols-md-2 mt-4"><div>

Scripts are simply files with usually many Linux commands, usually written in Bash, as it is the default shell language in many Linux-based distributions. You can see scripts as programs, and you will execute them like you do with programs.

A script is usually written in a file `name.sh`, regardless of the language used in the script, but this isn't mandatory. Here, is a simple script show "Hello, World", in a file `example.sh`

```bash
#!/bin/bash

echo "Hello, World!"
```
</div><div>

1. Create a script `example.sh` <small>(or, get a script somewhere, and got to "2.")</small>

```bash
$ touch example.sh
```

2. Allow the script to be executed

```bash
$ chmod +x example.sh
```

3. Execute the script

```bash
$ ./example.sh
$ bash < ./example.sh # or, in rare cases
```
</div></div>

> **It's important to remember that scripts are just a chain of commands**, and everything below can be used outside a script.

<hr class="sl">

## POSIX standard

<div class="row row-cols-md-2 mx-0"><div class="align-self-center">

The Portable Operating System Interface (**POSIX**) is a family of standards (`normes POSIX`) that defines what we should, and shouldn't do, to make our apps compatibles across a maximum of operating systems.

**DO only use allowed POSIX syntax in your scripts.**
</div><div>

❌ DO NOT USE `((`, `[[`, `]]`, and `))`

```bash
for (( i = 0; i < 10; i++ )); do
    # code
done

echo $((0+1))

if [[ 5 > 3 ]]; then
  # code
fi
```

❌ DO NOT USE `&&`, `||`, and they can only be used in `[[]]` anyway

</div></div>

<hr class="sr">

## Introduction

<div class="row row-cols-md-2 mt-2"><div>

Every script **should** start with a directive telling the shell in which language the script is. It is mostly a link to the interpreter.

* Traditional way for a script (bash)

```bash
#!/bin/bash
```

* Best way for a script (bash)

```bash
#!/usr/bin/env bash
```

Also, this is how you do comments

```bash
# this is a comment
```
</div><div>

It's important for you to remember that in shell, **0 means success**, **anything else**, usually 1, **means failure**. In conditions:

* **0 means TRUE**
* **NOT 0 means FALSE**

This MUST be engraved in your mind, because in many other languages, such as in C, `if (1)` is TRUE, while in bash, `if (1)` is FALSE.

**Pro-tip**: you can use `echo $?` to see the exit code of the previous command executed.

```bash
$ true # /bin/true is a command returning 0
$ echo $?
0
```

</div></div>

<hr class="sl">

## Variables, and their usage

<div class="row row-cols-md-2 mt-4"><div>

You can declare a variable with `=`, without ANY SPACES.

```bash
number=5
text1=Hello
text2="Hello, World"
```

You can even store the output of a command

```bash
command_output1=`ls -la .`
command_output2=$(ls -la .)
```
</div><div>

Add **$ before a variable name**.

```bash
echo $number
echo ${number} # same
```

There is no need to use "quotes" to concatenate

```bash
$ echo $text1 $number
Hello 5
$ echo "$text1 $number" # same
$ echo "$text1" $number # same
```
</div></div>

<hr class="sr">

## Branching, and the command `test`

<div class="row row-cols-md-2 mt-4"><div>

The usual if, else if (elif), and else.

```bash
if test1; then
  # code
fi

if test1; then
    # code
elif test2; then
    # code
fi

if test1; then
    # code
else
    # code
fi
```

A test is a **command** exiting with the code 0 (TRUE), or a number between 1, and 255 (FALSE). This could be expressed like this

```bash
if `exit 1`; then 
  echo "ok";
else 
  echo "ko"; # will execute this as '1' is FALSE
fi
```

While `exit 1` could be replaced with `false`, as if you followed, `false` is a command exiting with `1`.

</div><div>

Fortunately, you got a command called <kbd>test</kbd> which is taking a condition, and returning 0 if true, 1 otherwise. This command has a shortcut: <kbd>[]</kbd> which is doing the exact same thing.

```bash
if test toto == toto; then 
  echo "ok";
fi
# same
if [ toto == toto ]; then 
  echo "ok";
fi
```

<details class="details-e">
<summary>Operators</summary>

* `a -lt b`: true if $a \lt b$ <small>(lesser than)</small>
* `a -le b`: true if $a \le b$ <small>(lesser equals)</small>
* `a -eq b`: true if $a = b$ <small>(equals)</small>
* `a -ne b`: true if $a \neq b$ <small>(not equals)</small>
* `a -ge b`: true if $a \ge b$ <small>(greater equals)</small>
* `a -gt b`: true if $a \gt b$ <small>(greater than)</small>
* `-z $variable`: true, if `$variable` is empty

Others

* `str1 == str2`: true if "str1" is the same as "str2"
* `str1 != str2`: true if "str1" is the different than "str2"
</details>

<details class="details-e">
<summary>Special conditions (is file, exists...)</summary>

* `-f path`: true, if path is leading to a regular file
* `-d path`: true, if path is leading to a folder
* `-a path`: true, if path is leading to a system file
* `-w path`: true, if path is writable
</details>

<details class="details-e">
<summary>Chain expressions (AND, OR)</summary>

Of course, you can chain expressions, with equivalents of `&&`, and `!!`

```bash
# and
$ test toto == toto -a test toto == toto
# or
$ test toto == toto -o test tata == toto
# not
$ test ! toto == tata
$ test toto != tata
```
</details>

Examples

```bash
$ path=~/some_folder_that_exists
$ test -f $path; echo $?
1
$ test -d $path; echo $?
0
$ if [ -d $path ]; then echo "Folder+exists."; fi
Folder+exists.
```

</div></div>