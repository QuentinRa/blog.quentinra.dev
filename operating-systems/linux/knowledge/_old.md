# Knowledge about Linux

<div class="row row-cols-md-2"><div>

Most "commands" in books/... are written like `$ xxx`, but `$` IS NOT a part of the command; this is a token that indicates where we can execute the command. It could be `#`, `sh >`...

```shell
$ command_working_everywhere
# command_requiring_elevated_privileges
sh > command_at_least_working_in_sh
bash > command_at_least_working_in_bash
```
</div><div>

<b>Open a terminal</b>

> * Look for "Terminal" in your Applications
> * Or, use the shortcut `CTRL+SHIFT+T`

<b>Increase/Decrease Zoom</b>

> Use `CTRL +`, and `CTRL -` to increase/decrease zoom

<b>Console mode</b> 🤕 - beginner killer

> You can use CTRL+ALT+F1 to swap to console mode <small>(from F1, up to F6)</small>, while you can use ALT+F7 to swap back 🤤.

<b>Paste something</b>

> Usually, the scroll button will paste any copied content.
</div></div>

> There is no "echo" when writing a password, so don't be confused when you are writing one.

<hr class="sr">

## Commands

<details class="details-e">
<summary>Quoting in bash</summary>

<div class="row row-cols-md-2"><div>

Quotes are not mandatory unless there are some specials characters, such as a space in a path, for instance

```bash
$ ls /Documents/my bookmarks/ # Will not work
$ ls "/Documents/my bookmarks/" # 👌
$ ls '/Documents/my bookmarks/' # 👌
$ ls /Documents/my\ bookmarks/ # 👌
```
</div><div>

The main difference between single and double quotes, is that variables, and nested commands, will still be executed when using double quotes.

```bash
$ echo "$toto" # echo the value inside $toto
$ echo '$toto' # echo "$toto" 
```
</div></div>
</details>

<details class="details-e">
<summary>Exit codes, nested commands, and operators <code>; && ||</code></summary>

<div class="row row-cols-md-2"><div>

Commands (processes) are returning a code:

* $0$: everything went fine
* Not $0$: an error occurred

The exit code of the last command is stored in `$?`

```bash
$ echo $?
```

You can execute a command inside another command <small>(nested)</small>

```bash
$ ls `echo ~` # ls ~
$ ls $(echo ~) # ls ~
```

</div><div>

You can run multiple commands in one go

```bash
$ ls toto; ls tata
```

With the operator `&&`, the next command is only executed if the previous one successfully ended (code=0)

```bash
$ ls toto && ls tata
```

With the operator `||`, every following command is executed until one is successful (code=0)

```bash
$ ls toto && ls tata
```
</div></div>
</details>

<hr class="sl">

## Paths

* `/etc` (folder): "commonplace location to store system files that are used by your operating system"
* `/dev/null` (file): an empty file, a sort of trash file in which everything you write inside is deleted.
* `/etc/shadow` (file): username, and their hashed password
* `/etc/gshadow` (file), and `/etc/group`: groups
* `/var/log/` (folder): log files
* `/mnt` (folder): mounted device/hard drives (D:, USB...)
* `/tmp` (folder): a trash folder cleaned on reboot

XXX

* **Remember** that if you have spaces in your paths, then you must either quote them, or use `\` before any space.
* If you met a crazy guy that named something starting with a `-`, then you need to use `--` before the weird filename. For instance: `cp -- -filename`.

<hr class="sep-both">

## Special files and folders

<div class="row row-cols-md-2"><div>

#### Special folders

**user home** (<code>domicile</code>) 🏡: each user has is own folder, with their documents... A common path: <code>/home/toto/</code>.

See the environment variable `$HOME` and the file `/etc/passwd`.

<br>

**Binaries** ⚒️: folders used to store commands... There are `/bin/`, `/usr/bin/`, and `/usr/local/bin/`.
</div><div>

#### Special files

**hidden files** 🤐: Any file starting with <code>.</code> (dot), such as <code>.config</code>.

<br>

</div></div>

<hr class="sl">

## Calculations

<div class="row row-cols-md-2 mx-0"><div>

You may want to do some stuff involving calculations. The shell won't interpret any calculations, so you must use `$[calculation]` to evaluate something.

```bash
four=$[3+1]
# same
four=$((3+1))
```
</div><div>

Example of increasing a variable by one.

```bash
i=0
while [ $i -lt 5 ]; do
   i=$[i+1] 
done
```
</div></div>

<hr class="sr">

## Input, output, pipes, and redirections

Each command has 1️⃣ one input (0), and 2️⃣ two outputs: standard (1), and error (2).

<div class="row row-cols-md-2"><div>

**Pipe** (`tube`)

It's possible for a command output, to be used as the next command input using a pipe: **his_output | is_my_input**.

The command `wc -l` is used to count the number of lines in a text. The text could be a file, or some input. We want to find out how many files named "toto" were found with `find` using `wc`.

```bash
$ find . -name toto
./mem/mv/all_toto_copy/toto
./mem/mv/all_toto/toto
[...]
./mem/mv/toto
$ find . -name toto | wc -l
57 # find returned 57 lines
```
</div><div>

**Redirections**

We can redirect output to a file. For instance, if a result takes a long time, or you need to do multiple operations on it, you will usually store it, and work on the file. We are doing this using `>`.

```bash
$ echo "Hello, World" > myFile
```

The operator `>` is truncating (=emptying) the file, if you want to append something, use `>>`.

```bash
$ echo "Hello, World" >> myFile
```

You can also load some input from a file, but I don't have any useful examples for now. The command below is giving the content of `original.txt` to the command `tee` which is outputting the content.

```bash
$ tee < original.txt
Hello, World
```

Another very useful usage of redirections, is redirecting errors, meanwhile non-errors message will still be shown.

```bash
$ ls /error 2> onl_errors_will_be_stored_here
$ ls /error 2> /dev/null # redirect to the "trash"
```

Sometimes, you may even want to print errors on the standard output.

```bash
$ ls /error 2>&1
```
</div></div>

<hr class="sep-both">

## List of essential Linux commands

* `exit` <sup>1</sup>: exit the shell with an exit code
* you can use `xdg-open` to open a PDF, or an URL.

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
* `help`/`info`
* `xargs`
* `env X=val ./myScript`
* `strace/strings` [link](https://jvns.ca/strace-zine-v3.pdf)
</div></div>

<hr class="sep-both">

## 👻 To-do 👻

Stuff that I found, but never read/used yet.

<div class="row row-cols-md-2"><div>

* OSS Course
* [gentoo](https://www.gentoo.org/)
* [linux-securite](https://wonderfall.space/linux-securite/)
* ELF
* Cron `cron` process to schedule tasks, with crontab/crontab -l / Automated tasks in Linux / https://crontab-generator.org/ / https://crontab.guru/ / edit `crontab -e` / https://www.crontabs.org/
* [tcsh](https://www.ibm.com/docs/en/zos/2.3.0?topic=shells-writing-tcsh-shell-scripts)
* [ArchTitus](https://github.com/ChrisTitusTech/ArchTitus)
* [yoctoproject](https://www.yoctoproject.org/)

<details class="details-e">
<summary>Services</summary>

`systemctl /bin/systemctl` allows us to interact with the systemd process/daemon.

```bash
sudo systemctl stop xxx.service 
sudo vim /etc/systemd/system/xxx.service 
sudo systemctl status xxx.service 
sudo systemctl daemon-reload
sudo systemctl start xxx.service
sudo systemctl status xxx.service
```

```ini
[Unit]
Description="Some nice description here"

[Service]
ExecStart=/usr/local/bin/nodemon /home/bye/index.js
WorkingDirectory=/home/bye/
Restart=always
RestartSec=10
StandardOutput=syslog
StandardError=syslog
; examples
SyslogIdentifier=byebye
Environment=NODE_ENV=production

[Install]
WantedBy=multi-user.target
```
</details>

* `getent` <sup>2</sup>: get an entry such as "passwd": `getent passwd` <small>(get entry)</small> instead of `cat /etc/passwd`

</div><div>

* [linuxhandbook](https://linuxhandbook.com/)
* [linuxhint](https://linuxhint.com/)
* [linuxize](https://linuxize.com/)
* [shell-tips](https://www.shell-tips.com/)
* [howtouselinux](https://www.howtouselinux.com/)
* [linuxconfig](https://linuxconfig.org/)
* [tecmint](https://www.tecmint.com/)
* [linux-audit](https://linux-audit.com/)
* [oreilly](https://www.oreilly.com/library/view/linux-command-line/9780470251287/)
* [tldp](https://tldp.org/guides.html)
* [linuxshelltips](https://www.linuxshelltips.com/)
* [shellhacks](https://www.shellhacks.com)
</div></div>