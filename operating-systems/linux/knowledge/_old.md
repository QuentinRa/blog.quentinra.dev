# Knowledge about Linux

<hr class="sr">

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

<hr class="sep-both">

## List of essential Linux commands

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