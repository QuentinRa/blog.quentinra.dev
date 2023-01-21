# Pipes

[Go back](../../../__old/c)

It's another way to communicates between process,
more flexible that signals since you can share
data between processes.

## Unnamed pipes

Theses should be the ones that you will use. Simply
create an array of size 2.

```c
int pipe(int tab[2]);

// used as
int tab[2];
pipe(tab);
```

In this array, 

* ```tab[0]``` : read
* ```tab[1]``` : write

The core idea is that you will be able to write
in this array in the father and read the content in
the children (and vice-versa).

**Note** : you will usually create a pipe, then fork.
Then in the son, you will close read/write if you
don't plan on using it. And in the father you
will close read/write for the same reason. Then
write/read either from the son/father. Don't forget
to close everything at the end.

## named pipes

Theses are pipes working almost like files, and you
can see them using ``ls``.

```c
int mkfifo(const char* name, mode_t mode);
```

Please take note that the file should be created
before hand using `mkfifo`. The file will remain
after the program is close if not destroyed.

## Example

Not really useful as an example since there are
no others processes but still now you should
be able to start.

```c
int main(void){
 int tab[2];

 //pipe va mettre les descripteurs 0 = lecture dans tab[0] et 1 = écriture dans tab[1]
 pipe(tab);

 //exemple écriture dans le pipe
 write(tab[1], "Hello World", 11+1); // le \0 à la fin

 //exemple de lecture dans le pipe
 char buf[25];
 read(tab[0], &buf, 25-1); // le \0 à la fin

 close(tab[1]);
 close(tab[0]);
}
```