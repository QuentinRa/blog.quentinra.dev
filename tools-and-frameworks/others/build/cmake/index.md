# CMake

<div class="row row-cols-md-2"><div>

CMake 🏝️ is a cross-platform language and tool to build, and run programs. It's a higher-level tool that will generate a file for a lower-level build tool <small>(such as a [Makefile](/tools-and-frameworks/others/build/makefile/index.md))</small> according to the platform.

The syntax is similar to a C program, but it's usually considered hard to learn or master 🪜.

👉 CMake automatically detects and handles dependencies, making it easier to use for large or complex projects.
</div><div>

**Create a CMakeLists.txt**

```ps
$ touch CMakeLists.txt
$ nano CMakeLists.txt # edit
```

**Execute a rule** 🌴

```ps
$ mkdir build && cd build
$ cmake ..     # folder with the CMakeLists.txt
$ make         # execute the generated Makefile
$ ./my_program # execute our "my_program"
```
</div></div>

<hr class="sep-both">

## 👻 To-do 👻

Stuff that I found, but never read/used yet.

<div class="row row-cols-md-2"><div>

* [_old](_old.md)
</div><div>
</div></div>