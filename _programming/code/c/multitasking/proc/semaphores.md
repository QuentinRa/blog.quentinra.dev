# Semaphores

[Go back](../../../__old/c)

Let's set ``n`` : a number of resources. Then we want
to prevent more than n access of a resource at the same
time.

Ex: in a shop, n=5 could be understood as the shopkeeper
can only handle 5 clients at the same time.

```c
#include <semaphore.h>
```

### Basic usage

```c
// init
//
// sem will be used to store a semaphore,
//      so it's an empty global variable
// pshared value is 0 (or check the doc)
// n is explained above
//
int sem_init(sem_t *sem, int pshared, unsigned int n);

// like we do with mutex, wait for a resource
// controlled by the semaphore sem,
// to be available
int sem_wait(sem_t *sem);

// unlock a resource, meaning someone waiting can
// take it
int sem_post(sem_t *sem);
```

### Using conditions

You may want to use a condition instead of a number ``n``.
And that's possible.

```c
// create a mutex to protect "cond"
pthread_mutex_t mutex = PTHREAD_MUTEX_INITIALIZER;
// create a condition
pthread_cond_t cond;

//
// then in a function
//

//mutex
pthread_mutex_lock(&mutex);

// wait with mutex and cond
// in a loop on here_a_condition
while(here_a_condition) pthread_cond_wait(&cond, &mutex);

// when thread pass the condition
// here write some code

// tells others to check if 
// they may check the condition
pthread_cond_broadcast(&cond);

// unlock mutex
pthread_mutex_unlock(&mutex);
```

To explain this, we have a global variable ``cond``. Since
it may be accessed by multiples threads, we need a mutex.

The core idea is that a lot of threads will way for
a condition. In a loop so that if the condition is
not triggered then they wait again.

We will use ``pthread_cond_broadcast`` to trigger
all those that are waiting for a condition. They will
try a turn of the loop and may leave if ``here_a_condition``
allows them to.