# List of essentials linux commands

...

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

<details class="details-e">
<summary><code>apt/aptitude</code>: install/update packages/OS</summary>
<div class="row row-cols-md-2"><div>

`apt` is the default package manager on many well-know Linux-based distributions such as Ubuntu/Debian.

```bash
# operations on the package <aptitude>
sudo apt install aptitude
sudo apt update aptitude
sudo apt upgrade aptitude
sudo apt remove aptitude
sudo apt auto-remove
# update OS
sudo apt dist-upgrade
```
</div><div>

When installing packages, you are prompted `Do you want to continue? [Y/n]` (you need to enter `Y`). You can skip this, using `-y`.

```bash
sudo apt install -y aptitude
```

`aptitude`, which need to be installed, is doing the same as `apt`, but there is a graphical interface included.

```bash
sudo aptitude # press 'q' to quit
sudo aptitude install nano
```

</div></div>
</details>

<hr class="sr">

## Basics

...

<hr class="sl">

## Manage files and folders

Create

<div class="row row-cols-md-2"><div>
<details class="details-e">
<summary><code>mkdir</code>: create directories</summary>

```bash
$ mkdir folder
```

Create every non-existing folder in a path

```bash
$ mkdir -p folder0/folder1/folder2
```
</details>
</div><div>
<details class="details-e">
<summary><code>touch</code>: create file</summary>

Create file if needed, otherwise update the last modified date. **It is important to note that this command is not clearing the contents of the existing file, if any**.

```bash
$ touch a_file
```
</details>
</div></div>

Move, copy, and/or rename

<div class="row row-cols-md-2"><div>
<details class="details-e">
<summary><code>cp</code>: copy (+rename) files/folders</summary>

`cp` is taking a list of folders/files to copy, and a destination

```bash
$ cp toto ./all_toto/
$ cp toto ./all_toto/toto # same
$ cp toto1 toto_2 ./all_toto/
```

To rename something

```bash
$ cp toto ./all_toto/toto0
```

To copy a **folder**, along its content

```bash
$ cp -r all_toto/ all_toto_copy
```
</details>
</div><div>
<details class="details-e">
<summary><code>mv</code>: move (+rename) files/folders</summary>

`mv` is taking a list of folders/files to move, and a destination

```bash
$ mv toto ./all_toto/
$ mv toto ./all_toto/toto # same
$ mv toto1 toto_2 ./all_toto/
```

To rename something

```bash
$ mv toto ./all_toto/toto0
```
</details>
</div></div>

<hr class="sr">

## Permissions

<details class="details-e mt-4">
<summary><code>chmod</code>: change a file/folder permissions</summary>

<div class="row row-cols-md-2"><div>

Use <kbd>+</kbd> to grant perms..

```bash
$ chmod u+x target
$ chmod g+rw target
$ chmod ug+r target
$ chmod g+x,o+rx target
```

If there is nothing before "+", Grant to <kbd>a</kbd> (alias of <kbd>ugo</kbd>)

```bash
$ chmod +x target
$ chmod a+x target # same
$ chmod ugo+x target # same
```
</div><div>

Use <kbd>-</kbd> instead of <kbd>+</kbd> to revoke permissions.

```bash
$ chmod -x target
$ chmod u-x target
$ chmod ug-rw target
```

Grant "perms" using the shortcut number.

```bash
# u=rwx, g=rx, o=x
$ chmod 751 target
# u=rwx, g=, o=
$ chmod 700 target
```

</div></div>
</details>

<div class="row row-cols-md-2"><div>
<details class="details-e">
<summary><code>umask</code>: change default permission for new files</summary>

A call to `umask` return the **missing** permissions with a leading `0`.

```bash
$ umask
0026 # meaning 751 by default
$ umask -s
u=rwx,g=rx,o=r
$ umask 0026
$ umask u=rwx,g=rx,o=r
```

</details>
</div><div>

<details class="details-e">
<summary><code>chown</code>: change the owner of a file/folder</summary>

```bash
$ ls -l toto.txt
-rw-r-xr-x 1 n1 n [...] toto.txt 
$ chown n2 toto.txt
-rw-r-xr-x 1 n2 n [...] toto.txt
$ chown n2:m toto.txt
-rw-r-xr-x 1 n2 m [...] toto.txt
```

You may use `-R` (recursive), and `-h` (do not deference symbolic links).
</details>
</div></div>