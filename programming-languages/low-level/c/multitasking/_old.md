# Threads and processes

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