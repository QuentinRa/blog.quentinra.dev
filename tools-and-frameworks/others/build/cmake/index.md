# CMake

<div class="row row-cols-md-2"><div>

CMake 🏝️ is a cross-platform language and tool to build, and run a program. It's a higher level tool that will generate a file for a lower-level build tool <small>(such as a [Makefile](/tools-and-frameworks/others/build/makefile/index.md))</small> according to the platform.

The syntax is similar to a C program, but it's usually considered to be hard to learn or master 🪜.

👉 CMake automatically detect and handle dependencies, making it easier to use for large or complex projects.
</div><div>

**Create a CMakeLists.txt**

```ps
$ touch CMakeLists.txt
$ nano CMakeLists.txt # edit
```

**Execute a rule** 🌴

```ps
# in the directory with the CMakeLists.txt
$ cmake .
$ make # example for a makefile
$ ./my_program # the executable named "my_program"
```
</div></div>

<hr class="sep-both">

## 👻 To-do 👻

Stuff that I found, but never read/used yet.

<div class="row row-cols-md-2"><div>

* [Akagi201/learning-cmake](https://github.com/Akagi201/learning-cmake)

```scss!
set(CMAKE_SYSTEM_NAME Generic)
set(CMAKE_C_COMPILER_WORKS 1)
set(CMAKE_CXX_COMPILER_WORKS 1)

project("xxx" C CXX)

include(CMakeListsPrivate.txt)

if(EXISTS ${CMAKE_CURRENT_SOURCE_DIR}/xxx.txt)
endif()

add_custom_target(
    Production ALL
    COMMAND xxx "${CMAKE_BUILD_TYPE}"
    WORKING_DIRECTORY ${CMAKE_CURRENT_SOURCE_DIR}
)
```
</div><div>

```scss!
cmake_minimum_required(VERSION 3.18)
project(xxx)

set(CMAKE_CXX_STANDARD 14)

add_executable(xxx main.cpp)
```

```scss!
cmake_minimum_required(VERSION 3.18.4)
project(untitled C)

set(CMAKE_C_STANDARD 99)

add_executable(xxx main.c)
```
</div></div>