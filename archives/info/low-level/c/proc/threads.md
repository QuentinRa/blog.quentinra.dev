# Threads

[Go back](../../../__old/c)

**Beware**, before starting that to use threads, you
must compile in ``gcc`` for instance with
the ``-lpthread`` option (or `-pthread` if
some expert pass by here since ``l`` stands for linux).

A threads will be characterized by a ``function``, meaning
simply create a ``function`` then a `thread` executing this
function and this ``function`` will run in parallel of
your code.

```c
// do not forget -pthread
#include <pthread.h>
```

## Create a thread

```c
int pthread_create(pthread_t *thread, const pthread_attr_t *envr, 
                   void* (*function) (void*), void* args);
```

* ``thread`` : an empty variable to store thread_id
* ``envr`` : environment, `NULL` may be your usual value
* ``function`` : a function taking a `void*` and returning a `void*`
* ``args`` : an argument that will be send to your function

> Note that ``void*`` is used to refer to any kind of pointer.
> You would need to cast a pointer to ``void*``, but inside
> your function, just cast it back to your type of pointer.
> That's how we do something generic in C.

## End of your thread

At the end of the execution of your thread, you may 
or not return an exit code using

```c
void pthread_exit(void *code);
```

## Wait

You process can wait for a thread to end using
``pthread_join`` but you would need the it stored
by ``pthread_create`` in ``thread`` variable for us.

```c
int pthread_join(pthread_t thread_id, void **code);
 ```

``code`` might be NULL or that's a pointer of
an empty variable having the type returned by your
exit.

## Example

```c
void *fonction(void *args);

int main(void){
 pthread_t mon_thread; //futur thread
 int args = 5;
 //création du thread
 pthread_create(mon_thread, NULL, fonction,(void*) &args);
 //attends la fin de l'exécution de la fonction
 pthread_join(mon_thread, NULL);
 return EXIT_SUCCESS;
}

void *fonction(void *args){
 int fonction_args = *((int*) args);
 //fonction_args contient 5
 printf("%d", fonction_args);
 pthread_exit(NULL);//code de retour
}
```