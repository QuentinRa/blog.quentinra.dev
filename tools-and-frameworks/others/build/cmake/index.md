# CMake

<div class="row row-cols-md-2"><div>

[CMake](https://cmake.org/documentation/) 🏝️ is a cross-platform language and tool to build, and run programs. It's a higher-level tool that will generate a file for a lower-level build tool <small>(such as a [Makefile](/tools-and-frameworks/others/build/makefile/index.md))</small> according to your needs.

The syntax of a cmake file is similar to a C program, but it's usually considered harder to learn and to master 🪜.

💡 CMake automatically detects and handles dependencies, making it easier to use for large or complex projects.
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

## CMake CLI Usage

<div class="row row-cols-md-2"><div>

```shell!
$ cmake -B /path/to/build -S /path/to/sources
-- Configuring done
-- Generating done
-- Build files have been written to: xxx
$ cmake --build /path/to/build
ninja: no work to do.
```
```js!
cmake_minimum_required(VERSION 3.18)
project(untitled2)
```

CMake will automatically detect the languages from the sources files extensions. It will then try to find the compiler and call it with CMake default parameters for it.

```js!
// ex: add_executable(Hello hello.cpp)
add_executable(TargetName TargetFiles)
```
</div><div>

...
</div></div>


<hr class="sep-both">

## 👻 To-do 👻

Stuff that I found, but never read/used yet.

<div class="row row-cols-md-2"><div>

* [_old](_old.md)
* cmake-gui
* ccmake
</div><div>
</div></div>