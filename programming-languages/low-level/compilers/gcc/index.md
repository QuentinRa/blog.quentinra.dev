# GNU Compiler Collection

<div class="row row-cols-md-2"><div>

`gcc` and `g++` are both part of GNU Compiler Collection. `g++` is a version of GCC with pre-defined options for C++ code.

**Basic usage**: compile and generate an executable `a.out`

```shell!
$ gcc file.c
$ g++ file.cpp
```

**Common usage**: partially compile files that depend on each other <small>(#include)</small>, then assemble them in an executable `a.out`.

```shell!
$ gcc -c file1.c       # generate "file1.o" object file
$ gcc -c file2.c       # generate "file2.o" object file
$ gcc file1.o file2.o  # generate "a.out"
```

➡️ For `g++`: replace `gcc` with `g++` and `.c` with `.cpp`.
</div><div>

...
</div></div>

<hr class="sep-both">

## 👻 To-do 👻

Stuff that I found, but never read/used yet.

<div class="row row-cols-md-2"><div>

*  `-I/path/to/header -L lib -Z ...`

```text!
gcc -std=c99 -g # add info for gdb
--MM # deps -ansi # c89 -Wall # warnings -pedantic # conformity
-E # intermediate files
sudo apt-get install build-essential gdb
sudo apt-get install manpages-dev
```
</div><div>


</div></div>