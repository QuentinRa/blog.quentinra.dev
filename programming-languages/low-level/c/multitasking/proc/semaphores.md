# Semaphores

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