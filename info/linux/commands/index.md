# List of essentials linux commands

...

<hr class="sl">

## Basics

...

<hr class="sr">

## Permissions

<details class="details-e" open>
<summary><code>chmod</code>: change a file/folder permissions</summary>

<div class="row row-cols-md-2"><div>

* The format is either
  * the shortened syntax (ex: `700`)
  * **Grant perms**: the target `+` permissions
  * **Revoke perms**: the target `-` permissions

Notes

* If there is no target, they are applied to all
* Targets are "u", "g", "o", "ug", "uo", "go", "ugo"
* Permissions are "r", "w", "x", "rw", "rx", "wx", "rwx"
</div><div>

```bash
chmod +x target
chmod -x target

chmod u+x target
chmod u+rw target
chmod u+rw,g+r target

# u=rwx, g=rx, o=x
chmod 751 target
```
</div></div>
</details>