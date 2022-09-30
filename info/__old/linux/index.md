# Linux

Linux is an operating system, on which a lot of distributions such as Debian, Arch Linux, Fedora, Ubuntu, and so on... are based. I'm not an expert, so in this course, you will only learn the basics.

<hr class="sl">

## Console

* your are writing commands right after the `$`
* press <kbd>ENTER</kbd> to execute a command
* press <kbd>CTRL-C</kbd> to cancel a command
* press <kbd>CTRL-D</kbd> to end the input of a command waiting for input

* `# ls`: the command must be **run as administrator**

<hr class="sl">

## Users and permissions

<details class="details-e mt-3">
<summary>Run as administrator / sudo</summary>

On Windows, whenever you need to install a program (in Program Files), you need to run it as administrator. It means that you are running the program in a privileged mode. We got the same thing on Linux with `sudo`.

You can run a command as administrator such as ls with `sudo ls`. You can run a bash as administrator with `sudo bash`.

<div class="text-center">

![Linux sudo](images/sudo.png) (Notice the # at the end, as we told you before)
</div>

> **Pro tip**: You should not able to do that on servers/... that you don't own (you shouldn't be able to on Windows too).<br>
> **Pro tip**: You may give someone the "right" do use sudo, by adding the user in the "sudoers". Simply call `sudo usermod -a -G sudo username`.
</details>

<details class="details-e mt-3">
<summary>File / Folders</summary>

You may also restrict who can read (r), write (w), or execute/access (x) your files. Linux is considering 3 kinds of users

* **u**: you
* **g**: users of your main group (ex: `promo2023`)
* **o**: any other user

And 3 (there is more) kind of permissions

* **r** (4): can read
* **w** (2): can write
* **x** (1): can execute a script, can access a directory <small>(it means that if there is a folder without x in a path, even if we got r or w, we won't be able to work with this file)</small>

The permissions are a set of 3 numbers, for each kind of user. In binary, 000=0, 001=1, 010=2, 100=4, etc. As you saw, I put 4 after r, it means that 100=4=r. If we got 110=6=4+2=r+w, it means that the user can write and read.

* `110 100 100`: u (6=r+w), g (4=r), o (4=r) 
* `111 101 100`: u (7=r+w+x), g (5=r+x), o (4=r)

> * `chmod +x file`: give x to every user
> * `chmod u+x file`: give x to u
> * `chmod u+rw file`: give rw to u
> * `chmod 751 file`: give rwx to u, rx to g, x to o
</details>

<hr class="sr">

## Edit files

A lot of times, you will have to open/edit files. You need to use a terminal editor, and you may use

* `vim` (there is a tutorial on this website), `neovim`, or `vim`
* `nano` (easy, good when you need to copy-paste something)
* `emacs` <s>(vim > emacs, change my mind 😂)</s>

Let's say you need to edit `file.txt`, you can do `vim file.txt`. If the file do not exists, then it will be created.

> If you need to see the content of a file, you may also use
> * <kbd>cat file.txt</kbd> (print the whole file)
> * <kbd>less file.txt</kbd> (print the file in the screen, you can use `up`/`down` to move up/down in the file, use `q` to exit)
> * <kbd>head file.txt</kbd> (see the first 10 lines)
> * <kbd>tail file.txt</kbd> (see the last 10 lines)

If you have a graphical interface, feel free to use SublimeText, Atom, Emacs, VSCode, or even overkill editors such as IntelliJ, PHPStorm, etc. 

<hr class="sl">

## File system

On Windows, you were using the file explorer. On Linux, you still got the notion of folder (`dossier/catalogue`) and file (`fichier/fichier régulier`). A sequence a folder, separated by a separator (`/` on Linux, `\` on Windows), that may ends with a file, is called a **path** (`chemin`).

* A path starting by the **root** (`Racine`) <small>(the folder containing every other folder/file)</small>, is called **absolute path**
  * Windows: `C:` (usually)
  * Linux: `/`
* A path that is not absolute, is called **relative path**. The path is relative to the current folder you are in.
  * Windows: `.\Desktop\toto.txt`
  * Linux: `./Desktop/toto.txt`

We are using a lot relative path, as they are shorter. Every path is absolute, but we are able to use some shortcuts

* **.** (dot): alias for the current directory
* **..** (dot dot): alias for the parent directory
* **~** (tilde): alias for the HOME directory (`Domicile`). On Windows, this is the folder in which you got Desktop, Documents, ... which is `C:\Users\calistro`. And Linux, aside for some users (ex: root), it would be `/home/calistro`.
  * The home for each user is stored in `/etc/passwd`
  * The home of the current user, is stored in `$HOME`

> **Pro tip**: a file starting by a **.** (dot) is hidden.<br>
> **Pro tip**: in a path, following slashes are merged, so `//bin////../bin` is the same as `/bin/../bin` which is `/bin`.<br>
> **Pro tip**: the parent of the root, is the root itself. It means that `/../` is the same as `/`