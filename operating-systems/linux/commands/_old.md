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

<details class="details-e">
<summary><code>xrandr</code>: set the size, orientation, brightness of the screen</summary>

Set the brightness to "0.5"

```bash
$ xrandr --output DP-2 --brightness 0.5
```
</details>

* you can use `xdg-open` to open a PDF, or an URL.
* you can use `getent passwd` <small>(get entry)</small> instead of `cat /etc/passwd`

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

* `find / -type f -a \( -perm -u+s -o -perm -g+s \) -ls`
* `\"'(safe and vuln)'\"")`
* `help`/`info`
* `xargs`
* `env X=val ./myScript`
* `strace/strings` [link](https://jvns.ca/strace-zine-v3.pdf)
</div></div>