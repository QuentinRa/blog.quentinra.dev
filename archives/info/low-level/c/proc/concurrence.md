# Concurrence

[Go back](../../../__old/c)

We will use something called a ``mutex`` to prevent
multiple threads to modify a variable.

When a mutex variable is locked, then any thread that
wants to lock it (in order to use it) will have to wait
for the mutex to be unlocked.

A thread will lock the mutex, or wait. Then use a variable
and unlock the mutex. When unlock, it's random which one
of the waiters will gain access to the mutex.

**Init a mutex**

```c
pthread_mutex_t mutex_var = PTHREAD_MUTEX_INITIALIZER;
```

**Ask for lock**

```c
int pthread_mutex_lock(pthread_mutex_t *mutex);
```

**Unlock after use**

```c
int pthread_mutex_unlock(pthread_mutex_t *mutex);
```

### Example

```c
pthread_mutex_t mutex_var = PTHREAD_MUTEX_INITIALIZER;

int variable_globale = 5;

void *fonction_thread(void *args){
 // on essaye de lock le mutex
 pthread_mutex_lock(&mutex_var);
 // seulement la personne qui a réussi à verrouillé le mutex peut modifier
 // cette variable donc pas de problème
 variable_globale++;
 // on déverrouille pour que le prochain thread puisse modifier la variable
 pthread_mutex_unlock(&mutex_var);
}
```