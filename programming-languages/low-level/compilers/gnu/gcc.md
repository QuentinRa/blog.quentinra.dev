# GNU Compiler Collection

<div class="row row-cols-md-2"><div>

`gcc` and `g++` are both part of GNU Compiler Collection. `g++` is a version of GCC with pre-defined options for C++ code.

You install them, and everything necessary for devs, using:

```shell!
$ sudo apt-get install build-essential # gcc, cmake...
$ sudo apt-get install manpages-dev    # man pages for devs
```

➡️ We usually use [CMake](/tools-and-frameworks/others/build/cmake/index.md) and [Makefiles](/tools-and-frameworks/others/build/makefile/index.md) to automate the compilation.
</div><div>
</div></div>

<hr class="sep-both">

## GCC/G++ Usage

<div class="row row-cols-md-2"><div>

#### Basic usage

Compile and generate an executable `a.out`.

```shell!
$ gcc file.c
$ g++ file.cpp
```

#### Common usage

Partially compile files that depend on each other <small>(#include)</small>, then assemble them in an executable `a.out`.

```shell!
$ gcc -c file1.c       # generate "file1.o" object file
$ gcc -c file2.c       # generate "file2.o" object file
$ gcc file1.o file2.o  # generate "a.out"
```

➡️ For `g++`: replace `gcc` with `g++` and `.c` with `.cpp`.

🚀 One-line command: `gcc -c *.c && gcc *.o && rm *.o`
</div><div>

#### Other options

Commonly used options:

* `-o`: set the executable name <small>(default=a.out)</small>
* `-std=value`: specify a standard such as `c99` or `c++11`
* `-I/path/to/xxx`: include a folder with header files
* `-g`: add information for debuggers (ex: [GDB](/programming-languages/low-level/compilers/gdb/index.md))

Common compliance/warnings options:

* `-Wall`: enable compiler warnings
* `-Wextra`: enable additional compiler warnings
* `-Werror`: mark compiler warnings as compilation errors
* `-Wpedantic`: enable strict ISO conformance
* `-ansi`: C89 compliance <small>(rarely used)</small>

Less commonly used options:

* `-E`: generate intermediate files
* `-S`: generate assembly code
</div></div>

<hr class="sep-both">

## 👻 To-do 👻

Stuff that I found, but never read/used yet.

<div class="row row-cols-md-2"><div>

* `-L lib`
* `-Z ...`
* `-MM` (deps)
</div><div>
</div></div>