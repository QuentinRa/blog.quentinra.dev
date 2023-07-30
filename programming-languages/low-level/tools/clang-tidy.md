# Clang-tidy

<div class="row row-cols-md-2"><div>

Clang-tidy is a tool that performs static code analysis on C++ code, identifying code smells, potential bugs, and other common issues.

```shell!
$ sudo apt install clang-tidy
```
</div><div>
</div></div>

<hr class="sep-both">

## Basic usage

<div class="row row-cols-md-2"><div>

#### Common commands

We can use clang-tidy without a compilation database, but in such case, it may result in errors.

```shell!
$ clang-tidy source.cpp         # output report
$ clang-tidy *.cpp > report.txt # save in a file
$ clang-tidy -fix *.cpp         # run automated fixes
$ clang-tidy -header-filter='(xxx\.h|include/*)' [...] # skip
```

#### .clang-tidy

Clang-tidy can be configured in a `.clang-tidy` file.
</div><div>

#### compile-commands.json

For more complex projects, we generate `compile-commands.json` which indicate the command to compile each file. Using [CMake](/tools-and-frameworks/others/build/cmake/index.md):

```shell!
$ cmake -DCMAKE_EXPORT_COMPILE_COMMANDS=ON
$ # build the project ...
$ cat folder_with_compile_commands/compile-commands.json
$ clang-tidy -p folder_with_compile_commands source.cpp
```
</div></div>