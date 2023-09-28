# Basic CMakeLists.txt

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

set(CMAKE_CXX_STANDARD 14) // standard C++14

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
* see [clang-tidy](/programming-languages/low-level/compilers/clang/clang-tidy.md) (`cmake -DCMAKE_EXPORT_COMPILE_COMMANDS=ON`)
</div><div>
</div></div>