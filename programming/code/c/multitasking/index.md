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

When executing your program <small>(i.g. `./a.out`)</small>, the code is executed by the `main` process.

</div><div>

<div class="row row-cols-md-2"><div>

```c
#include <sys/types.h>
#include <unistd.h>
#include <stdio.h>

int main() {
    pid_t pid = fork();
    // executed twice
    printf("%d", pid);
}
```
</div><div>

`fork` will create a copy of the program executing it.

Inside the newly created program, `pid` will be `0`.

Inside the original program, `pid` will be `>0`.

If the `fork` failed, `pid` will be `-1`.
</div></div>

```c
pid_t pid = getpid();
pid_t ppid = getppid(); // -1 if none
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