# What you will find in this course

* how to start programming in `C`
* almost all you need to know to write/read any kind of `C` programs
* how to use ``ncurses`` to create terminal interfaces
* how to do ``networking`` or use `threads` in `C`

If you want some little knowledge about programming before
starting, this page should help you : [First timer](sub/first-time.md).

## Start programming in C

...

## Advanced programming in C

...

## Using ncurses

NCurses is a graphic library to create beautiful
interfaces in a terminal. I you do know the
great ``VIM`` editor, then the interface was made with
ncurses. It's simple and really easy to learn.

...

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

## Networking

...

## Sources

* Denis MONNERAT ([IUT-SF](http://www.iut-fbleau.fr/) teacher)
* Luc HERNANDEZ ([IUT-SF](http://www.iut-fbleau.fr/) teacher)
* Selma NABOULSI ([IUT-SF](http://www.iut-fbleau.fr/) teacher)
* Denis MONNERAT ([IUT-SF](http://www.iut-fbleau.fr/) teacher)
* Frédéric GERVAIS ([IUT-SF](http://www.iut-fbleau.fr/) teacher)
* Pierre PETRIK ([IUT-SF](http://www.iut-fbleau.fr/) teacher)
* Luc DARTOIS ([IUT-SF](http://www.iut-fbleau.fr/) teacher)
* Pierre VALARCHER ([IUT-SF](http://www.iut-fbleau.fr/) teacher)
* Renaud RIOBOO ([IUT-SF](http://www.iut-fbleau.fr/) teacher)
* Christophe MOUILLERON ([ENSIIE](https://www.ensiie.fr/) teacher)
* Julien FOREST ([ENSIIE](https://www.ensiie.fr/) teacher)
* Quentin RAMSAMY–AGEORGES ([ENSIIE](https://www.ensiie.fr/) student)