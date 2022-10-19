# System calls

System calls are low-level functions that are directly interacting with the Linux kernel. You would usually use them in assembly, but this will be explained in another course. Rather, this course will focus on system calls in C, as this is hopefully simpler to learn than assembly.

> System functions are defined in `man 2`, such as `man 2 open`.<br>
> You will find inside **imports**, and **signatures** of the system calls.
> 
> **Note**: for now, `fork`, `kill`, `dup/dup2/dup3`, `execv`, `sleep`, `pipe`, along every process-related system-calls, will not be listed in this course.

<hr class="sl">

## `perror` - print system call error message

<div class="row row-cols-md-2"><div>

```c
#include <stdio.h>

void perror(const char *s);
```
</div><div class="align-self-center">

If a system call failed, an error code will be set. You can use `perror` to print the error message, and you can even append your own error message with the parameter `s`.
</div></div>

> **NOTE**: system calls are usually returning **0 upon success, and -1 upon failure**. In any case, they set the variable "errno" with the code indicating what error occurred, and this is what perror will use to tell us more about the error.

<hr class="sr">

## `exit` - kill the process

<div class="row row-cols-md-2"><div>

```c
#include <unistd.h>

void exit(int status);
```
</div><div class="align-self-center">

You will use this to terminate the program.
</div></div>

<hr class="sl">

## `open` - open a file

<div class="row row-cols-md-2"><div>

```c
#include <fcntl.h>

int open(const char *pathname, int flags);
int open(const char *pathname, int flags, mode_t mode);
```

This function returns an `int`, usually called `fd`, short for **file descriptor**, and is used by other system calls. If you didn't know, there are 3 already open file descriptors: 

* stdin, standard input: `0`
* stdout, standard output: `1`
* stderr, standard error output: `2`
</div><div class="align-self-center">

* `pathname` is the path to your file

* `flags` are a list of one, or mode options, separated with a pipe (`|`), used to determine how the file is opened.
  * `O_RDONLY`: read only
  * `O_WRONLY`: write only
  * `O_CREAT`: create if it does not exist
  * `O_TRUNC`: truncate/clear content

* If you are creating a file, you must add a third argument, which is the permissions given to the file, such as `0600`.
</div></div>

<hr class="sr">

## `read` - read a file descriptor

<div class="row row-cols-md-2"><div>

```c
#include <unistd.h>

ssize_t read(int fd, void *buf, size_t count);
```

For instance, here is an example

```c
char str[11];
ssize_t res = read(0, &str, 10);
```

The system call returns `-1` upon failure (see perror), or the number of character read.
</div><div class="align-self-center">

* `fd` is the file descriptor from which you want to read

* `buf` is where you will store what you read. It's usually a char array, but it could be something else.

* `count` is the size of what you want to read.

> You will most likely enter `n` to read `n` chars, but you should note that you implicitly wrote `10 * sizeof(char)`, and as the `sizeof(char)` is `1`, then you can only write `10`.
</div></div>

<hr class="sl">

## `write` - write in a file descriptor

<div class="row row-cols-md-2"><div>

```c
#include <unistd.h>

ssize_t write(int fd, const void *buf, size_t count);
```

For instance, here is an example

```c
ssize_t res = write(1, "Hello, World", 13);
```

The system call returns `-1` upon failure (see perror), or the number of character written.
</div><div class="align-self-center">

* `fd` is the file descriptor in which you want to write

* `buf` is what you want to write. It's usually a string, but it could be something else.

* `count` is the size of what you want to write. Like read, you should use `sizeof(xxx)` if you are writing something else than chars <small>(for which sizeof is usually omitted because it's 1)</small>.
</div></div>

<hr class="sr">

## `lseek` - move through a file

<div class="row row-cols-md-2"><div>

```c
#include <unistd.h>

off_t lseek(int fd, off_t offset, int whence);
```

Note that the function is returning your new offset in the file. To get your offset at any time, you can use this trick:

```c
... = lseek(xxx, 0L, SEEK_CUR);
```
</div><div class="align-self-center">

* `fd` is the file descriptor
* `offset` is a number (long) of character you want to skip starting from "whence"
* `whence` is the location we are moving to before applying the offset.
  * `SEEK_CUR`: do not move, use the current position
  * `SEEK_SET`: move to the start of the file, and apply offset
  * `SEEK_END`: move to the end of the file, and apply offset

If you understood right, to move back to the start, you would do

```c
... = lseek(xxx, 0L, SEEK_SET);
```
</div></div>

<hr class="sl">

## `close` - close a file descriptor

<div class="row row-cols-md-2"><div>

```c
#include <unistd.h>

int close(int fd);
```
</div><div class="align-self-center">

Aside from 0, 1, and 2, every file descriptor should be closed. 

* `fd`: the file descriptor you want to close
* return `0`, or `-1`
</div></div>