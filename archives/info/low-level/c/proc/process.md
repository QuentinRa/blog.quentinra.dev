# Processes

[Go back](../../../__old/c)

Before everything, you need to know

* that each process have a ``pid``, short for
process ID and will be used to kill it for instance :)
* when starting a program, the main is run is a process
meaning that the number of processes is 1 by default.
  
You may use theses libraries

```c
#include<sys/types.h> // ...
#include<unistd.h> // fork
```

### Create a process

Use ``fork``. It's a function that will duplicate
the father in order to create a new process.
So the code following the ``fork`` will
be run in the father and in the son.

```c
pid_t fork(void);
```

Beware, fork return ``0`` inside the process duplicated
and ``a positive value`` is the new process. You can
use a ``if`` to do a different code in your
processes.

**Note** : a good boy should handle the case were ``fork``
failed. Do not fret using ```perror``` to show
a relevant message

```c
if ( ... == -1 ) {
    // show an error then a message
    perror(... some message ...);
    exit(-1);
}
```

### Get process info

```c
// process pid
pid_t getpid();
// parent pid or -1 if dead
pid_t getppid();
```

### Kill/End process

You can stop the execution of a process
using exit function. Wherever you used this,
the process will be killed, even in a function.

```c
void exit(int code);
```

### Example

Just wait for the next section, there you will have
a simple example.