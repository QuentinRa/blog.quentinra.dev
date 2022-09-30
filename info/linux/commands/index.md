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

<hr class="sr">

## Basics

...

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

If there is nothing before "+", Grant to <kbd>ugo</kbd>

```bash
$ chmod +x target
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
```

</div></div>
</details>