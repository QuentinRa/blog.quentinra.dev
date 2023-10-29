# Clang-tidy

<div class="row row-cols-lg-2"><div>

Clang-tidy is a tool that performs static code analysis on C++ code, identifying code smells, potential bugs, and other common issues.

```shell!
$ sudo apt install clang-tidy
```
</div><div>
</div></div>

<hr class="sep-both">

## Basic usage

<div class="row row-cols-lg-2"><div>

#### Common commands

We can use clang-tidy without a compilation database, but in such cases, it may result in errors.

```shell!
$ clang-tidy source.cpp         # output report
$ clang-tidy *.cpp > report.txt # save in a file
$ clang-tidy -fix *.cpp         # run automated fixes
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

For more complex projects, we generate `compile_commands.json` which defines the command to compile each file. This file can be generated automatically using [CMake](/tools-and-frameworks/others/build/cmake/index.md):

```shell!
$ cat compile_commands.json
[{
    "directory": "src",
    "command": "g++ src/source.cpp",
    "file": "source.cpp"
}]
$ clang-tidy -p . [...]
```

⚠️ If the folder with the `compile_commands.json` file is different from the current folder (`.`) and there is no `compile_commands.json` in the current folder, it will be copied in the current folder.
</div></div>