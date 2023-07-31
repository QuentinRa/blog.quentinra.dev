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

```yaml!
Checks: >
  -*,                 # remove all
  google-*,           # add all from google
  -google-runtile-int # but remove this one

# WarningsAsErrors: "*"

# Tune some checks
CheckOptions:
  - { key: name, value: xxx }
  - key: name
    value: xxx
```
</div><div>

#### compile_commands.json

For more complex projects, we generate `compile_commands.json` which indicate the command to compile each file. Using [CMake](/tools-and-frameworks/others/build/cmake/index.md):

```shell!
$ cmake -DCMAKE_EXPORT_COMPILE_COMMANDS=ON
$ # build the project ...
$ cat folder_with_compile_commands/compile_commands.json
[{
    "directory": "src",
    "command": "g++ src/source.cpp",
    "file": "source.cpp"
}]
$ clang-tidy -p folder_with_compile_commands source.cpp
```

⚠️ For some reason, if there is no `compile_commands.json` in the current directory, then the file from `folder_with_compile_commands` is copied into the current directory and used for the following calls.
</div></div>