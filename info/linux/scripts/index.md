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

* ❌ **DO NOT USE `((`, `[[`, `]]`, and `))`**
* ❌ **DO NOT USE `&&`<sup>1</sup>, `||`**<sup>1</sup>
* ❌ **DO NOT USE `>`<sup>1</sup>, `<`<sup>1</sup>...** to compare something

<sup>1</sup> such operators are only working inside `[[ ]]`

</div><div>

**Recap of what isn't allowed by POSIX**

```bash
for (( i = 0; i < 10; i++ )); do
    # code
done

echo $((0+1))

if [[ 5 > 3 || 4 > 3 ]]; then
  # code
fi
```

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

<hr class="sl">

## Loops

<div class="row row-cols-md-2 mx-0"><div>

**for i in**: this loop is taking values separated by a space

```bash
for i in "Hello, World!" word2 word3 ; do
    # i will be: Hello, World!
    # ...
done
```

**while**: while is taking a "test" like if.

```bash
while test; do
    # code
done
```

</div><div>

**for i** <small>(here, starting at 1, increment by one, up to 5 included)</small>.

```bash
for i in {1..5}; do
    # code
done
```

```bash
for i in `seq 1 5`; do
    # code
done
```

You can change the increment (one by default)

* `{1..5..2}`: "i" start at 1, incremented by 2, while "i" is lower than 5
* `seq 1 2 5`: same

> Non-POSIX followers can use the real "for i" with i++, which is usually faster.
</div></div>

<hr class="sr">

## Command-line arguments

<div class="row row-cols-md-2 mt-2"><div>

As you can for commands, you can pass arguments to your script.

```bash
$ ./example arg1 "This is arg2" -o arg4 
```

Print the number of arguments, which is stored in `$#`

```bash
echo $#
# 4
```

Print an argument

```bash
echo $0 # ./example
echo $1 # arg1
echo $2 # This is arg2
```

List of all arguments

```bash
echo $@
```
</div><div>

**Note 1**: we are usually NOT using `$0`... directly in the code. We are usually storing them in variables, and using these instead.

```bash
program_name=$0
```

**Note 2**: check the number of arguments, the example below check that there is at least 2 arguments, print a message, and exit with 1 otherwise.

```bash
if [ $# -lt 2 ]; then
    echo "Usage: $0 arg1 arg2"
    echo "Try '$0 -h' for more information."
    exit 1
fi
```

**Note 3**: iterate every argument (DO NOT forget the quotes)

```bash
for i in "$@"; do
  echo $i
done
```
</div></div>

<hr class="sl">

## Builtin functions

<div class="row row-cols-md-2 mt-2"><div>

Builtin function, are functions that are declared inside your script.

```bash
myBuiltin() {
  # code
}
```

Then, you can call the builtin function in your script like this

```bash
myBuiltin arg1 arg2
```

The myBuiltin may take arguments, but the parentheses will always remain empty `()`. In the builtin function, you will access args as you would for command-line arguments!

```bash
# myBuiltin arg1 arg2
myBuiltin() {
  echo $0 # ./example (not myBuiltin)
  echo $1 # arg1
  echo $2 # arg2
  # ...
}
```
</div><div>

A builtin function may return something, but you CAN NOT use `exit`, as it would kill the whole process. Use `return` instead.

```bash
myBuiltin() {
  return $1
}

myBuiltin 5
echo $? # will be "5"
```
</div></div>

<hr class="sr">

## Calculations

<div class="row row-cols-md-2 mx-0"><div>

You may want to do some stuff involving calculations. The shell won't interpret any calculations, so you must use `$[calculation]` to evaluate something.

```bash
four=$[3+1]
```

> Non-POSIX followers can use `$((3+1))`.
</div><div>

Example of increasing a variable by one.

```bash
i=0
while [ $i -lt 5 ]; do
   i=$[i+1] 
done
```
</div></div>

<hr class="sl">

## Read input from the user

<div class="row row-cols-md-2 mx-0"><div>

You can use the command `read` to read input. This command takes a suite of 1, or more variables, and stores a word in each variable. If there is not enough variables, then the last variables is used to store everything that could not be stored.

```bash
$ read x
toto
$ echo $x
toto
```
</div><div>

```bash
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

This code is running indefinitely until "read" fails. Each time the user press <kbd>ENTER</kbd>, the code will loop, and ask for input again. A user can notify the script that the input is done using <kbd>CTRL+D</kbd>, which will make read fail, and end the loop.

```bash
while read x; do
  echo $x
done
```
</div><div>

You can use a nested for to extract each word that was entered.

```bash
while read input; do
  for word in $input; do
    echo $word
  done
done
```

<details class="details-e">
<summary>Test</summary>

**Note**: `<CR>`, for carriage return, means that I pressed enter.

```bash
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
