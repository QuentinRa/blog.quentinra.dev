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

A [process](/operating-systems/linux/architecture/index.md#processes-and-scheduling) is both a program, and it's environment.

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
#include <unistd.h> // fork
#include <sys/wait.h> // wait

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
pid_t child_pid = wait(&status); // store it if you need it
if (WIFEXITED(status)) { // if exited
    int exit_code = WEXITSTATUS(status); // get code
    // ...
}
```

⚠️ Actually, `wait` is blocking the parent until a **signal** is received. This could be another signal than the exit one:

* `WIFEXITED(status)`: process was killed
* `WIFSIGNALED(status)`: process was killed (manually)
* `WCOREDUMP(status)`: process was killed (core dump)
* `WIFSTOPPED(status)`: process was stopped
* `WIFCONTINUED(status)`: process was restarted

And you want some convenient functions:

* `WEXITSTATUS(status)`: return the exit code if applicable
* `WTERMSIG(status)`: return the terminating signal code
* `WSTOPSIG(status)`: return the stopping signal code

<details class="details-n mb-4">
<summary><code>waitpid</code>: more versatile wait</summary>

```c
int waitpid(int pid, int *status, int options);
// example
waitpid(-1, &status, 0);
```

* `pid`: $-1$ <small>(any)</small>, $0$ <small>(any child in the group)</small>, $>0$ <small>(a specific process)</small>. Aside from $-1$, $-n$ is the same as $n$.
* `options`: can be used to ignore some signals/...
</details>
</div><div>

#### Signals

When using <kbd>CTRL+C</kbd>, you're actually sending a signal to a program.

* `code`: from 1 to 31 included
* `function`: for instance, for 9 (kill): `exit(130)`.

You can change how your code will respond to a signal.

```c
#include <signal.h>

void handler(int signum) {
    // do something
}

int main() {
    // sig_t signal(int code, void (*handler)(int));
    if (SIG_ERR == signal(9, handler)) {
        perror("Using custom handler for 9 failed");
        exit(1);
    } else {} // ok
}
```

You can use `kill` (the function/the command) to send a signal

```c
// if pid = 0 then all process in our group
// if pid = -1 then all process
// else send a signal to the one with <pid>
int kill(pid_t pid, int signal_code);
```

You can wait for a signal using `pause` or `sleep`

```c
#include <unistd.h>
sleep(1000); // wake up by itself after 1s
pause(); // won't wake up by itself
```

#### Pipes

A `pipe` is a read/write stream in which both processes can exchange. To understand pipe, you must first understand **file descriptors** which in short, are numbers representing a file (see [System calls](/_programming/code/c/system_calls/index.md)).

The function `pipe` is creating two file descriptors

* `tab[0]`: to read using the system call `read`
* `tab[1]`: to write using the system call `write`

<details class="details-n">
<summary>Example: sending "Hello World" to the original</summary>

```c
#include <unistd.h>
#include <wait.h>

int main() {
    int length = 11 + 1; // \0
    char buf[length];
    int tab[2];
    pipe(tab);

    switch (fork()) { // add -1
        case 0: // the child write Hello World
            write(tab[1], "Hello World", length);
            break;
        default:
            wait(NULL); // wait for the child to write
            read(tab[0], &buf, length); // read
            // ...
            break;
    }

    close(tab[0]);
    close(tab[1]);
}
```
</details>

You can also use *named pipes*. These are created and accessible from the file system (ex: using `ls`).

```c
// int mkfifo(const char* name, mode_t mode);
int fd = mkfifo("filename", 0777);
```
</div></div>

<hr class="sep-both">

## Process replacement

<div class="row row-cols-md-2"><div>

The code executed by a process can be replaced, for instance, if you want to run a command or another executable.

We are using variants of the system call `exec`. If the process is successfully replace, then the code after the exec is NEVER called, otherwise, the `exec` functions will return `-1`.

```c
exec[...]([...]);
perror("exec failed"); // ❌ only called if "exec" fails
```

#### `execl`: take a list of arguments

```c
// signature 🗺️
int execl(const char* ref, const char * args, ..., NULL);
// example 🔥
execl("/bin/ls", "ls", "-la", ".", NULL);
```

* 👉 The first argument is the path to the executable
* 👉 The second argument is the process name shown using `ps`
* 👉 The following arguments are the parameters passed to the executable. The last argument must be `NULL`.
</div><div>

#### `execle`: also take an environment

👉 The last argument is an array of environment variables. The last value must be `NULL`.

```c
// signature 🗺️
int execle(const char* ref, const char * args, ..., NULL, char* const envp[]);
// example 🔥
char *envp[] = {"TARGET=.", NULL};
execle("/bin/ls", "ls", "-la", "$TARGET", NULL, envp);
```

#### `execlp`: use the PATH to find the executable

👉 The first argument is now a name that we will look for in the PATH, instead of an absolute path to the executable.

```c
// signature 🗺️
int execle(const char* name, const char * args, ..., NULL);
// example 🔥
execle("ls", "ls", "-la", ".", NULL);
```

#### `execv`: use an array instead of a list

There are also variant: `execvp` and `execvpe`... like for `execl`.

```c
// signature 🗺️
int execv(const char* ref, const char * argv[]);
// example 🔥
char *args[] = {"ls", "-l", NULL};
execv("/bin/ls", args);
```
</div></div>

<hr class="sep-both">

## 👻 To-do 👻

Stuff that I found, but never read/used yet.

<div class="row row-cols-md-2"><div>

* [old](_old.md)
* `FILE* stream = fopen(FIFO_PATH, "r+");`
* `dup/dup2/dup3`
</div><div>

* adding exercises from ens
</div></div>