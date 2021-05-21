# Concurrence

[Go back](..)

We will use something called a ``mutex`` to prevent
multiple threads to modify a variable.

When a mutex variable is locked, then any thread that
wants to lock it (in order to use it) will have to wait
for the mutex to be unlocked.

A thread will lock the mutex, or wait. Then use a variable
and unlock the mutex. When unlock, it's random which one
of the waiters will gain access to the mutex.