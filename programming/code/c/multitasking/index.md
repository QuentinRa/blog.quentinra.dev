# Multitasking

<div class="row row-cols-md-2 mt-3"><div>

By default, a program can only do one thing at a time. There are many cases when we want to do multiple tasks in parallel.

* 🪄 Splitting long tasks in subtasks executed in parallel
* 🚀 Running multiple tasks in parallel
* 👉 Using another program to do a task

Multitasking can be done using **Threads** or **Processes**.
</div><div>

There are a few related topics:

* **Signals**: communication with a process/between processes
* **Pipes**: communication between processes
* ...
</div></div>

<hr class="sep-both">

## Processes

<div class="row row-cols-md-2"><div>

A process is both a program, and it's environment.

* file descriptors <small>(file opened, position of the cursor...)</small>
* variables and environment variables
* pid <small>(process id, unique)</small>
* ppid <small>(process id of the parent, -1 if the parent is dead)</small>

When executing `./a.out`, the code is executed by the `main` process.

```c
#include <sys/types.h>
#include <unistd.h>

int main() { // "pid_t" is an alias of "int"
    pid_t pid = getpid();
    pid_t ppid = getppid(); // -1 if none
}
```
</div><div>

A process can duplicate itself using `fork`. The return value is **0** inside the newly created process, and **>0** in the original

```c
#include <sys/types.h>
#include <unistd.h>
#include <stdio.h>
#include <stdlib.h>

int main() {
    pid_t pid = fork(); // todo: handle pid == -1 (error)
    if (pid == 0) {
        // executed by the newly created process
        printf("Child[%d].\n", getpid());
    } else {
        // executed by the original process
        printf("Parent[%d].\n", getpid());
    }
    exit(0); // executed by both (not inside the if)
}
```

</div></div>

<hr class="sep-both">

## 👻 To-do 👻

Stuff that I found, but never read/used yet.

<div class="row row-cols-md-2"><div>

* [old](_old.md)
</div><div>

* scheduler
* pseudo-parallelism
</div></div>