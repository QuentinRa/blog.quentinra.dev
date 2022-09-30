# Linux

<details class="details-e mt-3">
<summary>File / Folders</summary>

> * `chmod +x file`: give x to every user
> * `chmod u+x file`: give x to u
> * `chmod u+rw file`: give rw to u
> * `chmod 751 file`: give rwx to u, rx to g, x to o
</details>

> If you need to see the content of a file, you may also use
> * <kbd>cat file.txt</kbd> (print the whole file)
> * <kbd>less file.txt</kbd> (print the file in the screen, you can use `up`/`down` to move up/down in the file, use `q` to exit)
> * <kbd>head file.txt</kbd> (see the first 10 lines)
> * <kbd>tail file.txt</kbd> (see the last 10 lines)

<hr class="sl">

## File system

<details class="details-e">
<summary>Practical knowledge</summary>

* In the screen bellow, the first value `-` indicates that this is a file. It would be `d` for a folder, `l` for a link...
* The 3 following letters `rw-` are the permissions of `u`: read+write.
* The 3 following letters `r--` are the permissions of `g`: read.
* The 3 following letters `r--` are the permissions of `o`: read.
* The following number `1` is the number of links.
* The following string `listro` is the name of the user `u`
* The following string `listro` is the name of the group `g`
</details>


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