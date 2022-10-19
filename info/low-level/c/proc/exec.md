# Replace process code

[Go back](../../../__old/c)

Sometimes, you created a process but you may want
to run an external command such as ``ls``
or another program.

You can do that using the ``exec``, for `execute`
family of commands.

```c
// using a list of arguments
int execl(const char* ref, const char * args, ..., NULL);
// for this version, ref must be a file not a path
// if this is a path then execl will be used
// else it will look in the PATH for your file
int execlp(const char* ref, const char * args, ..., NULL);
// giving an environnement
int execle(const char* ref, const char * args, ..., NULL, char* const envp[]);
// if you don't want to use a list, then use an array
int execv(const char* ref, const char * argv[]);
```

Here so you understand the idea

* ``ref`` : a file or a command linking to a file
* ``args`` : some arguments, if you use a list then the last value must be `NULL`
* ``envp`` : an array of new environment variables

**NOTE** : please, please do remember that when calling
``./a.out`` for a c program, you should know
that ``argv[0]`` is the name of the program. So if you
call a command DO NOT FORGET that the first argument
must be the name of your program. Check the example bellow.

## Example

```c
// calls "ls -la ."
int main(void){
    // I didn't forget "ls"
    // and NULL at the end since I use a list
    execl("/bin/ls", "ls", "-la", ".", NULL);
    perror("exec failed"); // should not appends
    // since this code will be replaced
    return -1;
}
```