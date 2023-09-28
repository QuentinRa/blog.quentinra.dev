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

**Execute a target** 🌴

```ps
$ mkdir build && cd build
$ cmake ..     # folder with the CMakeLists.txt
$ make         # execute the generated Makefile
$ ./my_program # execute our "my_program"
```
</div></div>

<hr class="sep-both">

## CLI Usage

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
* `CMAKE_SOURCE_DIR`: path to the folder with the top-level cmakelists
* ...
</div></div>

<hr class="sep-both">

## Basic Usage

<div class="row row-cols-md-2"><div>

#### Basic CMakeLists.txt

These two lines are the only required lines.

```js!
cmake_minimum_required(VERSION 3.18)
project(your_project_name)
```

The project function is quite powerful:

```js!
project(your_project_name C CXX) // C and C++
project(your_project_name VERSION 1.0 LANGUAGES C CXX)
```
</div><div>

#### Compiler

Common compiler-related configuration:

```js!
set(CMAKE_SYSTEM_NAME Linux)
set(CMAKE_C_COMPILER gcc)
set(CMAKE_CXX_COMPILER g++)

set(CMAKE_C_STANDARD 99)
set(CMAKE_CXX_STANDARD 17)
```

The default value is `/`. Mostly used when cross-compiling.

```js!
set(CMAKE_FIND_ROOT_PATH /opt/xxx/)
```
</div></div>

<hr class="sep-both">

## Core Syntax

<div class="row row-cols-md-2"><div>

#### Logging

We commonly add logging messages using `message`:

```js!
message(STATUS "message")      // messages for users
message(WARNING "message")     // warning messages
message(DEBUG "message")       // debug messages
message(TRACE "message")       // trace
message(FATAL_ERROR "message") // raise an error
```

<br>

#### Variables

You can use variables with `${VARIABLE_NAME}`.

```js!
set(VARIABLE_NAME)
set(VARIABLE_NAME VARIABLE_VALUE)
unset(VARIABLE_NAME)
```

Some examples:

```js!
set(MY_NUMBER 3.4)
set(MY_BOOL TRUE)
set(MY_OPTION ON)
set(MY_CONDITION YES)
set(MY_STR something) // risky, always quote strings
set(MY_STR "something")
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

<br>

#### File Functions

There are many file utilities:

```js!
file(READ  filename CONTENT_READ)
file(WRITE filename "CONTENT")
file(APPEND filename "CONTENT")
file(DOWNLOAD URL filename)
```
</div></div>

<hr class="sep-both">

## Conditions and statements

<div class="row row-cols-md-2"><div>

#### Conditions

`TRUE`, `ON`, `YES` and non-zero numbers are all true. `OFF`, `NO`, `FALSE`, zero, and empty strings are all false.

As always, you have basic utilities:

* `NOT CONDITION`
* `CONDITION1 AND CONDITION2`
* `CONDITION1 OR CONDITION2`

And there are some common operators:

* `DEFINED VARIABLE`: true if a variable is defined
* `TARGET VARIABLE`: true if a target is defined
* `EQUAL`, `LESS`, `LESS_EQUAL`, `GREATER`, and `GREATER_EQUAL` which are used to compare numeric values
* `A VERSION_XXX B` such as `VERSION_EQUAL`: compare software versions 
</div><div>

There are also some special operators:

* `"A" STREQUAL "B"`: true if both strings are equal
* `"STR" MATCHES "REGEX"`: true if `REGEX` matches `STR`
* `item IN_LIST myList`: true if `item` is inside `myList`

<br>

#### Statements

The syntax is:

```php!
if (CONDITION)
elseif ()
else ()
endif ()
```
</div></div>

<hr class="sep-both">

## Functions

<div class="row row-cols-md-2"><div>

The syntax to declare a function is as follows:

```js!
function(FUNCTION_NAME)
endfunction()

function(FUNCTION_NAME ARG0)
endfunction()

function(FUNCTION_NAME ARG0 ARG1)
endfunction()
```

To call a function:

```js!
function_name(ARG0 ARG1)
FUNCTION_NAME(ARG0 ARG1 ARGN)
```
</div><div>

There is some pre-defined variables:

* `${ARGC}`: count of arguments
* `${ARGV}`: list of arguments
* `${ARG0}`: the first argument
* `${ARGN}`: additional arguments after the last expected one

You can't return a value, and variables created within a function are deleted, unless you use:

```js!
set(VARIABLE_NAME VARIABLE_VALUE PARENT_SCOPE)
```
</div></div>

<hr class="sep-both">

## Advanced Topics

<div class="row row-cols-md-2"><div>

#### Multi-modules project

It's common to have big projects made of smaller units that can be configured and manipulated separately. 

You will create a `CMakeLists.txt` inside each submodule.

```js!
add_library(libA SHARED src/libA.cpp)

target_include_directories(libA PUBLIC ${CMAKE_CURRENT_SOURCE_DIR}/include)
```

The top-level `CMakeLists.txt` will include them.

```cpp
cmake_minimum_required(VERSION 3.18)
project(untitled2)

...

# include nested ./libA/CMakeLists.txt
add_subdirectory(libA)
```
</div><div>

#### Custom Output Directories

This is an example for GNU directories:

```js!
set(CMAKE_ARCHIVE_OUTPUT_DIRECTORY "${CMAKE_BINARY_DIR}/lib")
set(CMAKE_LIBRARY_OUTPUT_DIRECTORY "${CMAKE_BINARY_DIR}/lib")
set(CMAKE_RUNTIME_OUTPUT_DIRECTORY "${CMAKE_BINARY_DIR}/bin")
```

<br>

#### Custom Modules and Include

When we include something, it will look for it inside `CMAKE_MODULE_PATH` unless you provide the relative path to it. 

```js!
// load custom modules
list(APPEND CMAKE_MODULE_PATH "${CMAKE_SOURCE_DIR}/cmake/modules")
```

You can include them using:

```js!
include(ModuleName)
include("folder/xxx.cmake")
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
</div><div>

CMake will automatically detect the languages from the sources files extensions. It will then try to find the compiler and call it with CMake default parameters for it.

```js!
// ex: add_executable(Hello hello.cpp)
add_executable(TargetName TargetFiles)
```
</div></div>