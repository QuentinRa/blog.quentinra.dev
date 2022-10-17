# Bash

This course will introduce bash-specific knowledge that should help you write simpler, and maybe better code/commands, using some enhancements introduced with Bash. Note that the features introduced here shouldn't work on every machine, as they will most likely not use bash <small>(zsh. ash, csh, ksh..)</small>.

<hr class="sl">

## ...

...

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

## Bash expansion

<div class="row row-cols-md-2"><div class="align-self-center">

This is most likely one of the coolest features, as we can use this everywhere.

* `{0..5}` is replaced with "0 1 2 3 4 5"
* `{toto,tata,titi}` is replaced with "toto tata titi"

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

<hr class="sr">

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
</div></div>

<hr class="sl">

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

Get all values

```bash
$ echo ${array[@]}
```
</div><div>

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