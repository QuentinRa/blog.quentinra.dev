# List of essentials linux commands

...

<hr class="sl">

## Basics

...

<hr class="sr">

## Permissions

<details class="details-e">
<summary><code>chmod</code>: change a file/folder permissions</summary>

<div class="row row-cols-md-2"><div>

Use <kbd>+</kbd> to grant perms..

```bash
chmod u+x target
chmod g+rw target
chmod ug+r target
chmod g+x,o+rx target
```

If there is nothing before "+", Grant to <kbd>ugo</kbd>

```bash
chmod +x target
chmod +rw target
chmod +rwx target
```
</div><div>

Use <kbd>-</kbd> instead of <kbd>+</kbd> to revoke permissions.

```bash
chmod -x target
chmod u-x target
chmod ug-rw target
```

Grant "perms" using the shortcut number.

```bash
# u=rwx, g=rx, o=x
chmod 751 target
```

</div></div>
</details>