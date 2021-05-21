# Processes : wait

[Go back](..)

When starting a process, you might want as a father,
to wait for your child to do his task and die. We do
that using ``wait`` functions.

If you don't wait, then you child will still live
until the end of his task.

You may use theses libraries

```c
#include<sys/types.h> // ...
#include<sys/wait.h> // wait
```

### Simple wait

``wait`` is a function that will wait for **ONE** child
process to die and will store in `status`, if not `NULL`,
some information. The value returned is the ``pid`` of
the child process.

```c
int wait(int *status) ;

// most basic usage
wait(NULL); // meaning we don't care about status

// with status
int status = -1;
wait(&status);
// result go stored in status
```

Please take note that ``wait`` returns `-1` if there
isn't anymore a process that we can wait for, so you can
make a loop while `while(wait(NULL) != -1);` for instance.

### Exploiting status and waitpid

First of all, wait is an alias of ``waitpid(-1, &status, 0)``.
We will now explain ``waitpid``.

```c
int waitpid(int pid, int *status, int options);
```

Return child process pid or `-1`.  `status` will be described
bellow and ``options`` are rarely used be you may have
to use them is you want a particular behaviour for your ``wait``.

``pid`` of waitpid can be

* ``x < -1`` : any child whose group ID is equals to the absolute value of `x`
* ``-1`` : any child
* ``0`` : any child of the same group
* ``x > 0`` : any process having `x` as `pid`

Finally in status if set, will be stored an int. You can
try to guess the value inside using code like

* ``if(a_is_function(status)){ a_get_function(status) }``
* the main idea is asking first : is my value
of this kind of value
  
    * ``WIFEXITED(status)`` : true if normal exit
    * ``WIFSIGNALED(status)`` : true if killed by a signal
    * ``WCOREDUMP(status)`` : true if killed by a core dump
    * ``WIFSTOPPED(status)`` : true if got stopped
    * ``WIFCONTINUED(status)`` : true if restarted
    
* then you can use a getter to get the value

    * ``WEXITSTATUS(status)`` : exit code
    * ``WTERMSIG(status)`` : signal code
    * ``WSTOPSIG(status)`` : stop signal code

### Example

Comments are in french but still you
should be able to understand.

```c
#include<sys/types.h>
#include<sys/wait.h>
#include<unistd.h>

int main(void){
 if(fork() == 0){ // on devrait vérifier le cas == -1 donc échec
  print("1. On est dans le fils\n");
 } else {
  wait(NULL); // on attends que le fils affiche ses messages
  printf("2. On est dans le père\n"); // on continue le code du père
 }
 printf("mon pid est %d\n",  getpid()); // cette ligne est affichée dans le fils et le père
 return 0;
}
```

Result

```
1. On est dans le fils <CR>
mon pid est 27892 <CR>
2. On est dans le père <CR>
mon pid est 27891 <CR>
```