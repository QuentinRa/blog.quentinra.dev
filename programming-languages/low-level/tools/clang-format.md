# Clang-format

<div class="row row-cols-md-2"><div>

Clang-format is a tool to automatically apply formatting rules on C/C++ code.

```shell!
$ sudo apt install clang-format
$ clang-format --version
$ clang-format -h
```
</div><div>

Clang-format allows you to disable the formatting rules on a scope:

```cpp
// clang-format off
some code here
// clang-format on
```
</div></div>

<hr class="sep-both">

## Common usage

<div class="row row-cols-md-2"><div>

Run clang-format and automatically (`-i`) fix the files.

```shell!
$ clang-format -i file.cpp [...]
```

You can create a `.clang-format` file to define the style applied.

```yaml!
BasedOnStyle: LLVM
Language: Cpp
IndentWidth: 4
ColumnLimit: 80
UseTab: Never
```

</div><div>

You can sort of preview the changes:

```xml!
$ clang-format -output-replacements-xml [...]
<?xml version='1.0'?>
<replacements xml:space='preserve' incomplete_format='false'>
<replacement offset='0' length='0'>  </replacement>
</replacements>
```
</div></div>