# Shell scripts

[![bashscripting](../../../../cybersecurity/_badges/thm/bashscripting.svg)](https://tryhackme.com/room/bashscripting)

<div class="row row-cols-lg-2"><div>

Scripts are simply files with usually many Linux commands, usually written in Bash, as it is the default shell language in many Linux-based distributions. You can see scripts as programs, and you will execute them as you do with programs.

A script is usually written in a file `name.sh`, regardless of the language used in the script, but this isn't mandatory. 

➡️ Scripts are simply files with commands. It means you can execute anything here directly inside a shell, and the other way around.

➡️ Some scripts are only defining variables, functions or aliases and are not executed but only sourced <small>(e.g. imported in the current shell)</small>:

```shell!
$ source ~/.bashrc    # most well-known example
$ . ~/.bashrc         # same as "source"
```
</div><div>

1. Create a script `example.sh` with the contents below

```bash!
#!/bin/bash

echo "Hello, World!"
```

2. Allow the script to be executed

```shell!
$ chmod +x example.sh
```

3. Execute the script

```shell!
$ ./example.sh
Hello, World!
```

➡️ You can also use `bash example.sh` to run a script with `bash`.
</div></div>

<hr class="sl">

## POSIX standard

<div class="row row-cols-lg-2"><div>

The Portable Operating System Interface (POSIX) is a family of standards that defines what we should and shouldn't do to write scripts that work on all POSIX-compliant shells.

Each shell, such as [Bash](/operating-systems/linux/shells/bash/index.md) provides syntax that is not POSIX but can make scripts shorter or simpler.

```bash
for (( i = 0; i < 10; i++ )); do
  # ❌ Bash | Not POSIX-compliant
done

if [[ 5 > 3 || 4 > 3 ]]; then
  # ❌ Bash | Not POSIX-compliant
fi
```
</div><div>

Recap of what isn't allowed by POSIX

* ❌ DO NOT USE `((`, `[[`, `]]`, and `))`
* ❌ DO NOT USE `&&`<sup>1</sup>, `||`<sup>1</sup>
* ❌ DO NOT USE `>`<sup>1</sup>, `<`<sup>1</sup>...

<sup>1</sup> such operators only do what we expect when used in "`[[ ]]`".

</div></div>

<hr class="sr">

## Introduction

<div class="row row-cols-lg-2"><div>

#### Shebang

Every script should start with a directive called **Shebang** 💥 telling the CLI which shell interpreter should be used to run the script.

➡️ Traditional way to request `/bin/bash`

```bash!
#!/bin/bash
```

➡️ Modern way to request `bash`

```bash!
#!/usr/bin/env bash
```

#### Comments

This is how you write comments:

```bash
# this is a comment
```
</div><div>

#### Booleans

It's important for you to remember that in shell, `0` means success, anything else, usually `1`, means failure. For conditions:

* `0` means `TRUE`
* `NOT 0` means `FALSE`

This is important to remember that, because in many other languages, such as in C, `if (1)` is TRUE, while in bash, `if (1)` is FALSE.

#### Exit Code

You can use `echo $?` use query the exit code of the previously executed command:

```shell!
$ true # /bin/true is a command returning 0
$ echo $?
0
```
</div></div>

<hr class="sl">

## Variables, and their usage

<div class="row row-cols-lg-2"><div>

You can assign a variable with `=`, without ANY SPACES. **Note**: a variable exists even without being assigned, but it's empty <small>(=sort of "")</small>.

```bash!
number=5
text1=Hello
text2="Hello, World"
```

You can even store the output of a command to work on it

```bash!
command_output1=`ls -la .`
command_output2=$(ls -la .)
```
</div><div>

Add **$ before a variable name**.

```bash!
echo $number
echo ${number} # same
```

There is no need to use "quotes" to concatenate

```bash!
$ echo $text1 $number
Hello 5
$ echo "$text1 $number" # same
$ echo "$text1" $number # same
```
</div></div>

<hr class="sr">

## Branching, and the command `test`

<div class="row row-cols-lg-2"><div>

The usual if, else if (elif), and else.

```bash!
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

A test is a **command** exiting with the code 0 (TRUE), or a number between 1, and 255 (FALSE). This could be expressed as follows

```bash!
if `exit 1`; then 
  echo "ok";
else 
  echo "ko"; # will execute this as '1' is FALSE
fi
```

While `exit 1` could be replaced with `false`, as if you followed, `false` is a command exiting with `1`.

</div><div>

Fortunately, you got a command called <kbd>test</kbd> which is taking a condition, and returning 0 if true, and 1 otherwise. This command has a shortcut: <kbd>[]</kbd> which is doing the exact same thing.

```bash!
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
* `str1 != str2`: true if "str1" is the different from "str2"
</details>

<details class="details-e">
<summary>Special conditions (is it a file, does it exist...)</summary>

* `-f path`: true, if `path` leads to a regular file
* `-d path`: true, if `path` leads to a folder
* `-a path`: true, if `path` leads to a system file
* `-w path`: true, if `path` is writable
</details>

<details class="details-e">
<summary>Chain expressions (AND, OR)</summary>

Of course, you can chain expressions, with equivalents of `&&`, and `!!`

```bash!
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

```shell!
$ path=~/some_folder_that_exists
$ test -f $path; echo $?
1
$ test -d $path; echo $?
0
$ if [ -d $path ]; then echo "Folder+exists."; fi
Folder+exists.
```
</div></div>

<hr class="sl">

## Loops

<div class="row row-cols-lg-2"><div>

**for i in**: this loop is taking values separated by a space

```bash!
for i in "Hello, World!" word2 word3 ; do
    # i will be: Hello, World!
    # ...
done
```

**iterative for**

```bash!
# for ((i = 1; i <= 5; i++))
for i in `seq 1 5`; do
    # code
done
# for ((i = 1; i <= 5; i+=2))
for i in `seq 1 5 2`; do
    # code
done
```

You can use **break** to forcefully exit a for/while/until, and you can use **continue** to forcefully finish the current iteration, and start the next one. You may apply the keyword on more than one loop.

```bash!
for i in {1..5} ; do
    break
    break 1 # same, break 1 loop
done
```

</div><div>

**while**/**until**: while is taking a "test" like if.

```bash!
while test; do
    # code
done
until test; do
    # code
done
```

You can merge if/elif/else into a **case** statement

```bash!
case $x in
pattern)
  # if $x == pattern
  ;;
pattern1 | pattern2)
  # if [ $x == pattern -o $x == pattern ]
  ;;
*)
  # else = default
;;
esac
```

</div></div>

<hr class="sr">

## Command-line arguments

<div class="row row-cols-lg-2"><div>

#### Pass arguments

You can pass arguments to a script in a similar way than commands:

```shell!
$ ./example arg1 "This is arg2" -o arg4 
```

You can use `$#` to get the number of arguments:

```bash!
echo $#
# 4
```

Each argument is stored in a variable "`$n`"

```bash!
echo $0 # ./example
echo $1 # arg1
echo $2 # This is arg2
```

We can use `$@` to get the list of arguments:

```bash!
echo $@
# echo ./example arg1 "This is arg2" -o arg4
```

There is also `$*` in which is all arguments as a single string.

#### Handle incorrect usages

We often check the number of arguments and display a "usage" message when required arguments are missing:

```bash!
if [ $# -lt 2 ]; then # $0 $1 $2
    echo "Usage: $0 arg1 arg2"
    echo "Try '$0 -h' for more information."
    exit 1
fi
```

#### Proper argument handling

We usually avoid using `$n` directly inside the code. We usually store them inside variables and use them instead.

```bash!
program_name=$0
```
</div><div>

#### Iterate arguments

A common code to iterate arguments <small>(⚠️ do not forget quotes)</small>:

```bash!
for i in "$@"; do
  echo $i
done
```

For more complex uses:

```bash!
while [ $# -gt 0 ]; do
  case "$1" in
    # handle "-xxx yyy"
    -xxx)
      xxx_value="$2"
      shift 2 # consume 2 args
      ;;
    # ...
  esac
done
```

#### Handle command arguments

There are multiple commands that call other commands. To pass command arguments, we commonly use `--` to indicate that all arguments, even if they start with `-`, should be treated as arguments.

```bash!
# Ex: ./call_command.sh [...] -- -flag arg1 arg2
# if we were using a while/esac
# ...
    --)
        command_args="$@"
        break
    ;;
# ...
# call the command with some arguments from our script
# and pass it the command arguments too
some_command [...] ${command_args}
```
</div></div>

<hr class="sl">

## Builtin functions

<div class="row row-cols-lg-2"><div>

Builtin functions, are functions that are declared inside your script.

```bash!
myBuiltin() {
  # code
}
```

Then, you can call the builtin function in your script like this

```bash!
myBuiltin arg1 arg2
```

The myBuiltin may take arguments, but the parentheses will always remain empty `()`. In the builtin function, you will access args as you would for command-line arguments!

```bash!
# myBuiltin arg1 arg2
myBuiltin() {
  echo $0 # ./example (not myBuiltin)
  echo $1 # arg1
  echo $2 # arg2
  # ...
}
```
</div><div>

**Exit code**

A builtin function may return something, but you CAN NOT use `exit`, as it would kill the whole process. Use `return` instead.

```bash!
myBuiltin() {
  return $1
}

myBuiltin 5
echo $? # will be "5"
```

**Return value**

To return something, simply use `echo`.

```bash!
myBuiltin() {
  echo "Hello, World!"
}

text=$(myBuiltin)
echo $text # Hello, World!
```
</div></div>

<hr class="sr">

## Read input from the user

<div class="row row-cols-lg-2"><div>

You can use the command `read` to read input. This command takes a suite of 1, or more variables, and stores a word in each variable. If there are not enough variables, then the last variable is used to store everything that could not be stored.

```bash!
$ read x
toto
$ echo $x
toto
```
</div><div>

```bash!
$ read x
toto tata
$ echo $x
toto tata
$ read x y
toto tata titi
$ echo $x
toto
$ echo $y
tata titi
```
</div></div>

<details class="details-border">
<summary><b>Note</b>: handle newlines / "infinite input"...</summary>

<div class="row row-cols-md-2 mt-4"><div class="align-self-center">

This code is running indefinitely until `read` fails. Each time the user press <kbd>ENTER</kbd>, the code will loop, and ask for input again. A user can notify the script that the input is done using <kbd>CTRL+D</kbd>, which will make `read` fail, and end the loop.

```bash!
while read x; do
  echo $x
done
```
</div><div>

You can use a nested `for` to extract each word that was entered.

```bash!
while read line; do
  for word in $line; do
    echo $word
  done
done
```

<details class="details-e">
<summary>Test</summary>

**Note**: `<CR>`, for carriage return, means that I pressed enter.

```bash!
$ ./example
toto tata <CR>
toto
tata
titi toto tata <CR>
titi
toto
tata
```
</details>
</div></div>
</details>

<hr class="sl">

## Read a file, or Write content in a file

<div class="row row-cols-lg-2"><div>

We are mainly using redirections to read/write files, as the process is the same as reading input from a user, but this time the input/output source is different.

* **Create an empty file `toto.txt`** <small>(note that `touch` DO NOT ensure that the file is empty, so we can't use that)</small>

```bash
# create an empty file
echo -n "" > toto.txt
```

* **Write** user input in `toto.txt`

```bash
while read line; do
    echo $line >> toto.txt
done
```

This can be enhanced by doing the redirection at the end, meaning that every output <small>(every echo...)</small> will be redirected to `toto.txt`.

```bash
while read line; do
    echo $line
done >> toto.txt
```
</div><div>

* **Read** the content of `toto.txt`

```bash
while read line; do
  echo $line
done < toto.txt
```

* **Note 1**: DO NOT USE CAT, stop killing kittens 😿😾

```bash
cat toto.txt | while read line; do
    echo $line
done
```

* **Note 2**: But, you may use the concept with other commands

```bash
head -n 5 toto.txt | while read line; do
    echo $line
done
```
</div></div>

<hr class="sr">

## Random

<div class="row row-cols-lg-2"><div>

You may use "sleep" to pause your script

```shell!
$ sleep 50  # sleep for 50 seconds
$ sleep 50s # same
```
</div><div>

Don't ask why, but if you want a random number in $[10, 20]$.

```shell!
$ echo $[RANDOM%(20-10+1) + 10]
```
</div></div>

<hr class="sep-both">

## 👻 To-do 👻

Stuff that I found, but never read/used yet.

<div class="row row-cols-lg-2"><div>

* `getopts`
* `readonly var=value`
* `env X=val ./myScript`
</div><div>
</div></div>