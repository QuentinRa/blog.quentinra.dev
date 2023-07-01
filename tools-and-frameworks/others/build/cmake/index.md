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
# in the directory with the CMakeLists.txt
$ cmake .
$ make # example for a makefile
$ ./my_program # the executable named "my_program"
```
</div></div>

<hr class="sep-both">

## Basic CMakeLists.txt

👉 *You can support multiple languages, such as both C and C++, by adding languages after the project name: `project("untitled" C CXX)`.*

<div class="row row-cols-md-2"><div>

#### C project

This project will generate an executable called `my_program`. To generate this project, it will compile `main.c` and its dependencies.

```scss!
cmake_minimum_required(VERSION 3.18.4) // cmake version
project(untitled C) // project "untitled" in C

set(CMAKE_C_STANDARD 99) // standard C99

add_executable(my_program main.c main.h)
```
</div><div>

#### C++ project

This project will generate an executable called `my_program`. To generate this project, it will compile `main.cpp` and its dependencies.

```scss!
cmake_minimum_required(VERSION 3.18) // cmake version
project(untitled CXX) // project "untitled" in C++

set(CMAKE_CXX_STANDARD 14) // in C++14

add_executable(my_program main.cpp main.hpp)
```
</div></div>

<hr class="sep-both">

## Libraries

<div class="row row-cols-md-2"><div>

#### Using math.h

```scss!
target_link_libraries(my_program PRIVATE m)
```
</div><div>

#### Using pthread.h

```scss!
set(THREADS_PREFER_PTHREAD_FLAG ON)
find_package(Threads REQUIRED)
target_link_libraries(my_app PRIVATE Threads::Threads)
```
</div></div>

<hr class="sep-both">

## 👻 To-do 👻

Stuff that I found, but never read/used yet.

<div class="row row-cols-md-2"><div>

* [Akagi201/learning-cmake](https://github.com/Akagi201/learning-cmake)
* include_directories

</div><div>
</div></div>