# What you will find in this course

* how to start programming in `C`
* almost all you need to know to write/read any kind of `C` programs
* how to use ``ncurses`` to create terminal interfaces
* how to do ``networking`` or use `threads` in `C`

If you want some little knowledge about programming before
starting, this page should help you : [First timer](sub/first-time.md).

<hr class="sl">

## Introduction

After writing some code in ``C``, you need something to compile it. On
Linux systems, you can use

* ``gcc`` (you may use something like `sudo apt-get install gcc`)
* [WSL](https://docs.microsoft.com/en-us/windows/wsl/install-win10)
to use ``gcc`` on Windows
* use some IDE like CLion or VSCode (but with WSL)
* check out docker tutorial (not really what you should try)

Simply write ``gcc -v`` in a terminal to check if you have gcc.
Then you will write ``gcc -o a.out my_file.c`` to create a
file ``a.out`` and write `./a.out` to run your program.

Here is an example file

```c
// libraries
#include<stdio.h>
#include<stdlib.h>

// entry point, function called when program is run
int main(int argc, char *argv[]){
    printf("Hello World"); // print in terminal
    return EXIT_SUCCESS; // job done
}
```

<hr class="sr">

## Start programming in C

The basic element of syntax

* [Types](start/types.md)

<hr class="sl">

## Advanced programming in C

...

<hr class="sr">

## Using ncurses

NCurses is a graphic library to create beautiful
interfaces in a terminal. I you do know the
great ``VIM`` editor, then the interface was made with
ncurses. It's simple and really easy to learn.

You can install ncurses using

* ``sudo apt-get install libncurses5-dev libncursesw5-dev``
* check installed with ``ls -la /usr/include/ncurses.h``

You may check these resources

* <https://tldp.org/HOWTO/NCURSES-Programming-HOWTO/>
* <https://github.com/tony/NCURSES-Programming-HOWTO-examples>

<hr class="sl">

## Threads and processes

Sometimes, you might create a program where you may want to do some tasks
in parallel. When running a program, the system encapsulates the program
and his environment into something called a `process`.

The system uses a ``scheduler`` to run all the process in parallel (or
what we call pseudo-parallelism since they aren't in fact running in
parallel).

Finally, processes might want to communicate between themselves or simply
with you. Un interaction might be ``CTRL-C`` meaning `die`. In fact here,
``CTRL-C`` generates a signal, `9` and the process have a default handler
for this signal : a call ``exit(some_code)``.

* [Processes](proc/process.md)
* [Processes : wait](proc/process-wait.md)
* [Replace process code](proc/exec.md)
* [Communication : signals](proc/signals.md)
* [Communication : pipes](proc/tubes.md)

``Threads`` are some kind of process where some part of
the environment (variables, ...)
are shared with other threads created by a process.
They can be viewed as ``light`` processes.

Since variables are shared, they may be problem if multiples
threads try to modify it.

Also if you have a limited quantity of resources, you
may use semaphores to distribute them and manage your resources
efficiently.

* [Threads](proc/threads.md)
* [Threads : Concurrence](proc/concurrence.md)
* [Threads : Semaphores](proc/semaphores.md)

<hr class="sr">

## Networking

...