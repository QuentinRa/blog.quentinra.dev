# Threads and processes

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