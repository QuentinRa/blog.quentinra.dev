# List of essential Linux commands

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

<div class="row row-cols-md-3"><div>
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

<hr class="sl">

## Utilities

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
</div><div>
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

* `find / -type f -a \( -perm -u+s -o -perm -g+s \)`
* `find / -type f -perm -04000 -ls 2>/dev/null`
* `\"'(safe and vuln)'\"")`
* `help`/`info`
* `xargs`
* `env X=val ./myScript`
* `strace/strings` [link](https://jvns.ca/strace-zine-v3.pdf)
</div></div>