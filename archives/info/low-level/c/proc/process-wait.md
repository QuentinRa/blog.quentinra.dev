# Processes : wait

[Go back](../../../__old/c)

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

### Example

Comments are in french but still you
should be able to understand.

```c
#include<sys/types.h>
#include<sys/wait.h>
#include<unistd.h>

int main(void){
 if(fork() != 0){ // we should handle -1 case
  print("1. We are in the son\n");
 } else {
  wait(NULL); // wait for the son to write then die
  printf("2. We are in the father\n"); // then print ours
 }
 printf("My pid is %d\n",  getpid()); // in both father and son
 return 0;
}
```

Try to guess the result !

<p>
  <button class="btn btn-dark" type="button" data-bs-target="#result1" data-bs-toggle="collapse" aria-expanded="false">
    Show result
  </button>
</p>
<div class="collapse" id="result1">
<pre>
<code class="language-none">
1. We are in the son &lt;CR&gt;
My pid is 27892 &lt;CR&gt;
2. We are in the father &lt;CR&gt;
My pid is 27891 &lt;CR&gt;
</code>
</pre>
</div>

### Exploiting status and waitpid

**Note** : you may pass this section unless
you need right now to use status.

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