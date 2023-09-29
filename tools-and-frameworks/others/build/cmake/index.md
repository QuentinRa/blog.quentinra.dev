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

```cmake
cmake_minimum_required(VERSION 3.18)
project(your_project_name)
```

The project function is quite powerful:

```cmake
project(your_project_name C CXX) # C and C++
project(your_project_name VERSION 1.0 LANGUAGES C CXX)
```

A **target** 📍 is like a build artifact, such as a library or an executable. 

CMake will automatically detect the languages for each target from the sources files extensions.

<br>

#### Compiler

Common compiler-related configuration:

```cmake
set(CMAKE_SYSTEM_NAME Linux)
set(CMAKE_C_COMPILER gcc)
set(CMAKE_CXX_COMPILER g++)

set(CMAKE_C_STANDARD 99)
set(CMAKE_CXX_STANDARD 17)
```

You can set compile options for all or one target:

```cmake
target_compile_options(targetName PRIVATE -Wall -Wextra -Wpedantic [...])
target_compile_features(targetName PRIVATE cxx_std_17)
# enable #DEFINE XXX etc. (same as -DXXX etc.) 
target_compile_definitions(target PRIVATE XXX "YYY=ZZZ" [...])
```
</div><div>

#### Build Executables

You can generate an executable `targetName` using:

```cmake
# build a binary
add_executable(targetName file.c file.h [...])
add_executable(targetName main.cpp main.hpp [...])
```

<br>

#### Build Libraries

You can generate a library `.so` <small>(shared)</small> or `.a` <small>(static)</small> or header-only:

```cmake
add_library(targetName INTERFACE "file.h" [...]) # header-only
add_library(libA SHARED "src/file.cpp" "include/file.h") # .so
add_library(libA STATIC "src/file.cpp" "include/file.h") # .a
add_library(libA "src/file.cpp" "include/file.h") # use default
```

It's up to each library to determine which of its headers are available to others. So, if you want to use `#include "xxx.h"` in sources of another target, **the library must allow it first**.

```cmake!
# ex: include headers in "inc" (PRIVATE) "api" (PUBLIC)
target_include_directories(targetName
    # included files are visible to ours and other targets (api)
    PUBLIC api [...]
    # included files are not visible to ours and other targets (internal)
    PRIVATE internal [...]
    # included files are visible to other targets but not ours
    INTERFACE inc [...]
)
# include system librairies (same as -isystem xxx)
target_include_directories(target SYSTEM ...)
# include librairies (same as -Ixxx)
target_include_directories(target ...)
```
</div></div>

<hr class="sep-both">

## Dependencies

<div class="row row-cols-md-2"><div>

All projects usually have external or internal dependencies 👨‍👩‍👧‍👦.

* An executable requiring a library
* A library requiring another library
* ...

To do this, you should only have to use:

```cmake
target_link_libraries(targetA SCOPE targetB)
target_link_libraries(targetA SCOPE -lxxx)
target_link_libraries(targetA SCOPE -L/path/to/lib/)
target_link_libraries(targetA SCOPE /path/to/lib.a)
target_link_libraries(targetA SCOPE /path/to/lib.so)
```

The scope, which is optional, can be one of:

* `PRIVATE`: dependencies only required to build *targetA*
* `PUBLIC`: dependencies required to build *targetA* and dependencies that require *targetA*
* `INTERFACE`: dependencies required to build dependencies that require *targetA* but not *targetA*

👉 It may be obvious, but we almost always use `PRIVATE`.

👉 The default scope is determined according to the target.
</div><div>

#### External Libraries

For external libraries, e.g., the ones not directly [within the project](#multi-modules-project), we use a **finder** to find some information needed to import them.

```cmake
# sudo apt-get install libxml2 libxml2-dev
find_package(LibXml2 REQUIRED)
```

The line below changes according to how the finder works. The finder documentation usually documents which variables are set.

```cmake
target_link_libraries(libB PRIVATE ${LIBXML2_LIBRARIES})
```

By using `find /usr -name "FindLibXml2.cmake"` <small>(the format is `Find<PKGNAME>.cmake`)</small> I could find the finder.

<details class="details-n">
<summary>Common examples</summary>

Using math.h

```cmake
target_link_libraries(my_program PRIVATE m)
```

Using pthread.h

```cmake
set(THREADS_PREFER_PTHREAD_FLAG ON)
find_package(Threads REQUIRED)
target_link_libraries(my_app PRIVATE Threads::Threads)
```
</details>

#### Custom Finders

We can add folders to [`CMAKE_MODULE_PATH`](#cmake-module-path) where our finders will be located. There is no specific rule/syntax although most follow the same conventions/patterns.

<details class="details-n">
<summary>Example: Custom <code>FindLibXml2.cmake</code></summary>

```cmake
# try to find the library
# store in "LIBXML2_LIBRARIES" the path of the library if found
# Look for "libxml2.so" or "libxml2.dll" in /usr/lib, /usr/local/lib...
# Add "PATHS /custom/path/" to function call to use a custom path)
find_library(LIBXML2_LIBRARIES NAMES xml2 libxml2 REQUIRED)

# find the include directory
# set the variable "LIBXML2_INCLUDE_DIR" with the path to it
# specify the header we want to find to ensure that we really have libxml headers
find_path(LIBXML2_INCLUDE_DIRS NAMES libxml2/libxml/parser.h REQUIRED)

# include another module called FindPackageHandleStandardArgs
include(FindPackageHandleStandardArgs)
# use it to check if we can find LibXml2
find_package_handle_standard_args(LibXml2 DEFAULT_MSG LIBXML2_LIBRARIES LIBXML2_INCLUDE_DIRS)

mark_as_advanced(LIBXML2_LIBRARIES LIBXML2_INCLUDE_DIRS)
```
</details>

<details class="details-n">
<summary>Example: Custom <code>FindLibXml2.cmake</code> using PkgConfig</summary>

```cmake
# sudo apt-get install pkg-config
find_package(PkgConfig REQUIRED)
pkg_check_modules(LIBXML2 REQUIRED libxml-2.0)

include(FindPackageHandleStandardArgs)
find_package_handle_standard_args(LibXml2 DEFAULT_MSG LIBXML2_LIBRARIES LIBXML2_INCLUDE_DIRS)
```
</details>
</div></div>

<hr class="sep-both">

## Core Syntax

<div class="row row-cols-md-2"><div>

#### Logging

We commonly add logging messages using `message`:

```cmake
message(STATUS "message")      # messages for users
message(WARNING "message")     # warning messages
message(DEBUG "message")       # debug messages
message(TRACE "message")       # trace
message(FATAL_ERROR "message") # raise an error
```

<br>

#### Variables

You can use variables with `${VARIABLE_NAME}`.

```cmake
set(VARIABLE_NAME)
set(VARIABLE_NAME VARIABLE_VALUE)
unset(VARIABLE_NAME)
```

Some examples:

```cmake
set(MY_NUMBER 3.4)
set(MY_BOOL TRUE)
set(MY_OPTION ON)
set(MY_CONDITION YES)
set(MY_STR something) # risky, always quote strings
set(MY_STR "something")
```
</div><div>

#### Lists Functions

Lists are variables with comma-separated values (`a;b;...`).

```cmake
set(myList "a;b;...")
set(myList A B...)
```

You have many functions to operate on lists:

```cmake
# list(OPERATION DESTINATION_VARIABLE ARGS)
list(LENGTH MY_LIST_LENGTH myList) # get the length
list(APPEND myList A B...)         # add values
```

<br>

#### File Functions

There are many file utilities:

```cmake
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

```cmake
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

```cmake
function(FUNCTION_NAME)
endfunction()

function(FUNCTION_NAME ARG0)
endfunction()

function(FUNCTION_NAME ARG0 ARG1)
endfunction()
```

To call a function:

```cmake
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

```cmake
set(VARIABLE_NAME VARIABLE_VALUE PARENT_SCOPE)
```
</div></div>

<hr class="sep-both">

## Advanced Topics

<div class="row row-cols-md-2"><div>

#### Multi-modules project

It's common to have big projects made of smaller units that can be configured and manipulated separately. 

You will create a `CMakeLists.txt` inside each submodule.

```cmake
add_library(libA SHARED src/libA.cpp)

target_include_directories(libA PUBLIC ${CMAKE_CURRENT_SOURCE_DIR}/include)
```

The top-level `CMakeLists.txt` will include them.

```cmake
cmake_minimum_required(VERSION 3.18)
project(untitled2)

...

# include nested ./libA/CMakeLists.txt
add_subdirectory(libA)
```
</div><div>

#### Custom Output Directories

This is an example for GNU directories:

```cmake
set(CMAKE_ARCHIVE_OUTPUT_DIRECTORY "${CMAKE_BINARY_DIR}/lib")
set(CMAKE_LIBRARY_OUTPUT_DIRECTORY "${CMAKE_BINARY_DIR}/lib")
set(CMAKE_RUNTIME_OUTPUT_DIRECTORY "${CMAKE_BINARY_DIR}/bin")
```

<br>

#### CMAKE MODULE PATH

The `CMAKE_MODULE_PATH` variable determines where cmake will look for some files. We can add our own folder will our own scripts/modules.

```cmake
list(APPEND CMAKE_MODULE_PATH "${CMAKE_SOURCE_DIR}/cmake")
```

<br>

#### Create Reusable CMake Files

We can create  `.cmake` files with anything we want from variables to functions. There are some predefined ones and we create ours by adding `.cmakes` files in folders in [CMAKE_MODULE_PATH](#cmake-module-path).

```cmake
include(moduleName)
include(folder/moduleName)
```
</div></div>

<hr class="sep-both">

## 👻 To-do 👻

Stuff that I found, but never read/used yet.

<div class="row row-cols-md-2"><div>

* cmake-gui
* ccmake
* Contextual Logs
* `cmake --install /path/`
* `XXX-config.cmake`/`XXXConfig.cmake`
* [Akagi201/learning-cmake](https://github.com/Akagi201/learning-cmake)
* see [clang-tidy](/programming-languages/low-level/compilers/clang/clang-tidy.md) (`cmake -DCMAKE_EXPORT_COMPILE_COMMANDS=ON`)
</div><div>
</div></div>