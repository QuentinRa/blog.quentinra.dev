# Signals

[Go back](../../../__old/c)

We can communicate using signals.

* ``code`` : a number from 1 to 31 included
* ``function`` : called when signal is received

Some signals

* ``CTRL-C`` : kill
* ``CTRL-Z`` : interruption

This might help.

```c
#include <signal.h>
```

## Overriding a signal

```c
// called like this signal(code, handler);
sig_t signal(int code, void (*handler)(int)) ;
```

It may be hard to read but it's just saying that
this is a function that takes a code
and a function `handler`
taking an ``int`` and returning nothing. The name may
be changed.

``SIG_ERR`` is returned if overriding failed.

## Send a signal

You can use the (not) rightly named ``kill`` function.

```c
// if pid = 0 then all process in our group
// if pid = -1 then all process
// else kill some process
int kill(pid_t pid, int signal_code);
```

## Wait for a signal

You can pause your program waiting for a signal
using

```c
int pause(void);
```

or using ``sleep``. Note that sleep is also
waiting for a signal but stop waiting after ``n`` ms.

```c
unsigned int sleep(unsigned int ms);
```