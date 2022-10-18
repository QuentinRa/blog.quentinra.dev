# Bash

This course will introduce bash-specific knowledge that should help you write simpler, and maybe better code/commands, using some enhancements introduced with Bash. Note that the features introduced here shouldn't work on every machine, as they will most likely not use bash <small>(zsh. ash, csh, ksh..)</small>.

<hr class="sl">

## Bash

<div class="row row-cols-md-2"><div>

Some nice information

* 1989
* Bourne Again Shell
* Debian and many derivatives, such as Ubuntu

The [man page for bash](https://linux.die.net/man/1/bash) is explaining everything about bash, such as environment variables, control-flow structures...
</div><div>

`~/.bashrc` is a script executed when launching a terminal. You can write alias, permanent changes to environment variables, or builtin inside. You may have to create it. Once you changed its contents, you can update your current terminal using `source ~/.bashrc`.

</div></div>

<hr class="sr">

## Debugging

<div class="row row-cols-md-2"><div>

```bash
$ bash -x script.sh
+ echo Toto
Toto
+ command -v
+ ls .
# ...
```
</div><div>

You can use `-x` to debug your scripts. Each line prefixed with a `+` is the command executed, then you have the command output. It should help you find the command that failed.

You could also add breakpoint, if you want to only have this feature for a part of your code.

<details class="details-e">
<summary>Example of using breakpoints</summary>

```bash
$ cat x.sh
echo "Not debug"
set -x # start
echo "Debug"
set +x # stop
echo "Not debug"
$ ./x.sh
Not debug
++ echo Debug
Debug
++ set +x
Not debug
```
</details>
</div></div>

<hr class="sl">

## History expansion

<div class="row row-cols-md-2"><div>

Bash introduced some patterns that are expanded into a previous command from your history. You history of commands is stored in `~/.bash_history`

* nth command in history, starting from 0

```bash
$ !n
# if failed:
# -bash: !0: event not found
```

* nth command in history, starting from the previous command

```bash
$ !-n
```
</div><div>

* the previous command, same as `!-1`

```bash
$ !!
```

* the most recent command starting with `cat`

```bash
$ !cat
```

* the last command containing "hello"

```bash
$ !?hello
# add a trailing '?' to explicitly close the query
$ !?hello?
```

There is also `!#` which repeats the command-line typed so far. It seems kinda useless for my point of view.
</div></div>

<hr class="sr">

## Braces expansion

<div class="row row-cols-md-2"><div class="align-self-center">

This is most likely one of the coolest features, as we can use this everywhere.

* `{0..5}` is replaced with "0 1 2 3 4 5"
* `{a..e}` is replaced with "a b c d e"
* `{a..e..2}` is replaced with "a c e"
* `{toto,tata,titi}` is replaced with "toto tata titi"
* `{toto,tata,???}` is replaced with "toto tata", and any file matching the glob-pattern "???"

For instance, you can use these in loops, or in glob-patterns.
</div><div>

* Glob-patterns

```bash
$ ls *.{jpg,png,gif}
# is the same as
$ ls *.jpg *.png *.gif
```

* "for i"

```bash
for i in {0..5}; do 
  echo "$i"
done
```
</div></div>

<hr class="sl">

## Enhanced control-flow structures

<div class="row row-cols-md-2"><div>

* You can use `&&` (AND), and `&&` (OR)
* You can use `>`... to compare numbers/strings

```bash
if [ 5 > 3 ] || false; then
  echo "ok";
fi

if [[ 5 > 3  || false ]]; then
  echo "ok";
fi
```
</div><div>

* You can use "for i, i++"

```bash
for (( i = 0; i < 10; i++ )); do
    # code
done
```

* You can use a select statement to select an option

```bash
select name in option1 option2 ; do
  # name is either empty, of equals to option1/option2,
  # and $REPLY is your REPLY
  echo $name with reply: $REPLY
done
```

</div></div>

<hr class="sr">

## Arrays

<div class="row row-cols-md-2"><div>

Create an array

```bash
$ array=(1 2 3 4 5)
```

Get a value

```bash
$ echo ${array[0]}
```

Print all values

```bash
$ echo ${array[@]}
```

Length

```bash
$ echo ${#array[@]}
```
</div><div>

Add a value

```bash
$ array+=(1)
```

Set a value

```bash
$ array[0]=1
```

Remove a value

```bash
$ unset array[0]
```

Iterate an array

```bash
for i in ${array[@]}; do
  echo $i
done
```
</div></div>

<hr class="sl">

## Random notes

<div class="row row-cols-md-2"><div>

This is a command taking a variable number of parameters, and literally doing nothing

```bash
$ :
```

In bash, doing "< file" is a faster way of doing "cat file", according to the manual

```bash
$ < file
```
</div><div>

Bash introduced a new redirection which take some text, and redirect it to the standard output

```bash
$ tee <<< word
word
# is the same as
$ echo word | tee
word
```
</div></div>

<hr class="sr">

## References

* [man bash](https://linux.die.net/man/1/bash)
* [devhints.io](https://devhints.io/bash)