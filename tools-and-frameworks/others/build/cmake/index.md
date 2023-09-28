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

#### Basics

Cmake is commonly used as `cmake ..` then `make` but this is **not** recommended by the documentation.

```shell!
$ cmake -B /path/to/build -S /path/to/sources
-- Configuring done
-- Generating done
-- Build files have been written to: xxx
$ cmake --build /path/to/build
ninja: no work to do.
```

➡️ `cmake ..` is the same as `cmake -B . -S ..` and `make` is the same as `cmake --build .` <small>(if the generator is a Makefile)</small>.

<br>

#### Basic CMakeLists.txt

These two lines are the only required lines.

```js!
cmake_minimum_required(VERSION 3.18)
project(your_project_name)
```
</div><div>

#### Generators

CMake files are compiled to a lower-level tool such as a `Makefile`. This is a generator and CMake supports multiple of them. 

CMake will try to find a suitable generator for your environment, but you can explicitly ask for a generator using:

```shell!
$ cmake -G Ninja            # Use build.ninja
$ cmake -G /usr/bin/ninja   # Use a custom generator
...
```

<br>

#### XXX

Xxx

```shell!
$ cmake -D VAR_NAME=VAR_VALUE ...
```

Common pre-defined variable

* `CMAKE_BUILD_TYPE`: the kind of build such as `Release` or `Debug`
</div></div>


<hr class="sep-both">

## 👻 To-do 👻

Stuff that I found, but never read/used yet.

<div class="row row-cols-md-2"><div>

* [_old](_old.md)
* cmake-gui
* ccmake
</div><div>

CMake will automatically detect the languages from the sources files extensions. It will then try to find the compiler and call it with CMake default parameters for it.

```js!
// ex: add_executable(Hello hello.cpp)
add_executable(TargetName TargetFiles)
```
</div></div>