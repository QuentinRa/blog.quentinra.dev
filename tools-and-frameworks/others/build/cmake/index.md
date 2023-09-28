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

💡 You can build only specific targets using `-t target`.

<br>

#### Log Level

You can set the verbosity of cmake to one of `ERROR`, `WARNING`, `NOTICE`, `STATUS`,
`VERBOSE`, `DEBUG`, or `TRACE`.

```shell!
$ cmake --log-level=ERROR ...
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

You can pass arguments to the build tool:

```shell!
$ cmake [...] -- -j 4 # ex: "make -j 4"
```

<br>

#### Override Variables

You can override the value of some variables using `-D`:

```shell!
$ cmake -D VAR_NAME=VAR_VALUE ...
```

Common pre-defined variables:

* `CMAKE_BUILD_TYPE`: the kind of build such as `Release` or `Debug`
* ...
</div></div>

<hr class="sep-both">

## CMake Basic Usage

<div class="row row-cols-md-2"><div>

#### Basic CMakeLists.txt

These two lines are the only required lines.

```js!
cmake_minimum_required(VERSION 3.18)
project(your_project_name)
```

<br>

#### Variables

You can use variables with `${VARIABLE_NAME}`.

```js!
set(VARIABLE_NAME)
set(VARIABLE_NAME VARIABLE_VALUE)
unset(VARIABLE_NAME)
```
</div><div>

#### Lists Functions

Lists are variables with comma-separated values (`a;b;...`).

```js!
set(myList "a;b;...")
set(myList A B...)
```

You have many functions to operate on lists:

```js!
// list(OPERATION DESTINATION_VARIABLE ARGS)
list(LENGTH MY_LIST_LENGTH myList) // get the length
list(APPEND myList A B...)         // add values
```

#### File Functions

...

```js!
file(WRITE filename "CONTENT")
```
</div></div>

<hr class="sep-both">

## Multi-modules project

<div class="row row-cols-md-2"><div>

It's common to have big projects made of smaller units that can be configured and manipulated separately. 

You will create a `CMakeLists.txt` inside each submodule.

```js!
add_library(libA SHARED src/libA.cpp)

target_include_directories(libA PUBLIC ${CMAKE_CURRENT_SOURCE_DIR}/include)
```
</div><div>

The top-level `CMakeLists.txt` will include them.

```cpp
cmake_minimum_required(VERSION 3.18)
project(untitled2)

...

# include nested ./libA/CMakeLists.txt
add_subdirectory(libA)
```
</div></div>

<hr class="sep-both">

## 👻 To-do 👻

Stuff that I found, but never read/used yet.

<div class="row row-cols-md-2"><div>

* [_old](_old.md)
* cmake-gui
* ccmake
* Contextual Logs
* `cmake --install /path/`
* `XXX-config.cmake`/`XXXConfig.cmake`
* `find_package`
* `PARENT_SCOPE`
</div><div>

CMake will automatically detect the languages from the sources files extensions. It will then try to find the compiler and call it with CMake default parameters for it.

```js!
// ex: add_executable(Hello hello.cpp)
add_executable(TargetName TargetFiles)
```
</div></div>