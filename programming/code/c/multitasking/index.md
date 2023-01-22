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
#include <unistd.h> // getpid, getppid

int main() { // "pid_t" is an alias of "int"
    pid_t pid = getpid();
    pid_t ppid = getppid(); // -1 if none
}
```
</div><div>

A process can duplicate itself using `fork`. The return value is **0** inside the newly created process, and **>0** in the original

```c
#include <unistd.h> // fork, getpid
#include <stdio.h> // printf
#include <stdlib.h> // exit

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

## Communication between processes

<div class="row row-cols-md-2 mt-3"><div>

#### Wait/Exit code

Usually, we  want to know when our processes are done.

```c
#include <unistd.h>
#include <stdlib.h>
#include <sys/wait.h>

int main() {
    // create 3 processes
    for (int i = 0; i < 3; ++i) {
        if (fork() == 0) {
            // do something for your parent
            exit(i); // SUCCESS
        }
    }
    // wait for each process to die
    for (int i = 0; i < 3; ++i) {
        wait(NULL);
    }
    // do something with what your children did
    exit(0);
}
```

You can also use `while` as wait return `-1` if there is no one to wait for.

```c
while(wait(NULL) != -1);
```

If you want to get the exit code <small>(ex: to check a child failed it's task)</small>

```c
// ➡️ replace "wait(NULL);" with:
int status;
pid_t child_pid = wait(&status);
if (WIFEXITED(status)) { // if exited
    int exit_code = WEXITSTATUS(status); // get code
    // ...
}
```
</div><div>

⚠️ Actually, `wait` is blocking the parent until a signal is received. This could be another signal than the exit one:

* `WIFEXITED(status)`: process was killed
* `WIFSIGNALED(status)`: process was killed (manually)
* `WCOREDUMP(status)`: process was killed (core dump)
* `WIFSTOPPED(status)`: process was stopped
* `WIFCONTINUED(status)`: process was restarted

And you want some convenient functions:

* `WEXITSTATUS(status)`: return the exit code if applicable
* `WTERMSIG(status)`: return the terminating signal code
* `WSTOPSIG(status)`: return the stopping signal code

...
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