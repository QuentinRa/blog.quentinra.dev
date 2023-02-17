# System calls

[Go back](../index.md#syntax)

That's one of the core principles of the assembly. These are the only function you may use.

* `exit` (1) : end program
* `fork` (2)
* `read` (3) : read(int, char*, int)
* `write` (4) : write(int, char*, int)
* `open` (5)
* `close` (6)

Check them out with `less /usr/include/arm-linux-gnueabihf/asm/unistd.h`.

`write` and `read` have a signature where the arguments are

* where
  * 0: stdin  
  * 1: stdout  
  * 2: stderr
* what: string, your text
* length: string length