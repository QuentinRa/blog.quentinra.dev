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