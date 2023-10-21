# Makefile

<div class="row row-cols-md-2"><div>

Makefiles are files in which a developers define **rules** ✍️ to compile files, build an executable, and run it. 

* 📃 You define the dependencies between files
* 🚀 Only changed files and those dependent on them are recompiled
* 🏡 Users write simple commands such as `make build` <small>(no "gcc [...]")</small>
* 🌍 Commonly used to build Linux applications

Makefiles are mainly used in C/C++, while they can be used for any language, different tools such as CMake are used instead.

👉 [Official documentation](https://www.gnu.org/software/make/manual/html_node/) (GNU)
</div><div>

**Create an empty Makefile** 🌱

```ps
$ touch Makefile
$ nano Makefile # edit
```

**Execute a rule** 🌴

```ps
# in the directory with the Makefile
$ make # the first rule
$ make rule_name # a specific rule
```
</div></div>

<hr class="sep-both">

## Getting started

<div class="row row-cols-md-2"><div>

**Breakdown of a rule** 🏡

```makefile!
target: deps
    compilation_command
```

* 🎯 `target` is the file that the command will generate <small>(ex: `a.out`)</small>.
* 🪴 `deps` is a list of targets, that need to be compiled first
* 🌴 `compilation_command` is a command that uses the dependencies to build the target.

**Example** 🔥

We got a file `main.c` and we want to generate an executable `a.out`. We will first define the rule for the executable:

```makefile!
# ❌ bad
a.out: main.c
    gcc -o a.out main.c
```

We can compile and run our program. 

But this is not the correct approach. ⚠️

If `main.c` had many dependencies, then all will be listed as dependencies of `a.out`. Every time we ask `make` to compile the latest `a.out`, every dependency will be checked instead of one.
</div><div>

Instead, we usually use intermediate files, such as `.o` in C.

```makefile!
# ✅ correct
a.out: main.o
    gcc -o a.out main.o
```

We don't need to specify how a `.o` is compiled, as this is one of the **compilation rules** 📝 that Makefile [knows](https://www.gnu.org/software/make/manual/html_node/Catalogue-of-Rules.html). Still, you can do it:

```makefile!
main.o: main.c
    gcc -c main.c -o main.o
```

For other languages or in some cases, you may have to define your own compilation rules. For instance, in C, we would have:

```makefile!
# define how, from any .c, we can get the .o
%.o: %.c
    gcc -c -o $@ $<
```

The final makefile content will be something like this:

```makefile!
a.out: main.o
    gcc -o a.out main.o

%.o: %.c
    gcc -c -o $@ $<
```
</div></div>

<hr class="sep-both">

## Dependencies

<div class="row row-cols-md-2"><div>

Makefile dependencies are files that when changed, imply that we need to recompile our target.

In C, we could describe dependencies like this:

* 🌱 Usually, each `.o` is associated with their `.c`
* 📄 Usually, each `.o` is associated with their `.h`
* 🌍 A `.o` can be associated with the `.h` they use
* 🗃️ A `.o` should be associated with the `.o` matching the `.h` they use
* ❌ We don't usually see a `.o` associated with another `.c`
</div><div>

Because of the existing compilation rules, some dependencies are implicit and can be omitted. Giving us:

```yaml!
main.o: file1.o file2.o
file1.o: file1.h
file2.o: # none
```
</div></div>

<hr class="sep-both">

## Makefile Basics

<div class="row row-cols-md-2"><div>

#### Variables

We usually start a Makefile by defining some variables, to avoid copy-pasting code and ease the maintenance of our Makefile 👌.

Some quite used names for variables are `CC` and `CFLAGS`.

```makefile!
CC=gcc                 # C Compiler
CFLAGS=-Wall           # C Compiler flags

CXX=g++                # C++ Compiler
CXXFLAGS=-std=c++11    # C++ Compiler flags
```

To use them in some rules:

```makefile!
my_program: deps
    $(CC) $(CFLAGS) -o my_program ...
```

⚠️ Variables such as `CC` are known to makefile [pre-defined rules](https://www.gnu.org/software/make/manual/html_node/Catalogue-of-Rules.html), so you don't need to write your own rule to set some compilation flags.
</div><div>

#### Multilines

You can use `\ ` for multiline instructions:

```makefile!
O_FILES = file1.o file2.o \
        main.o
```

#### PHONY rules

Makefile only runs a task if the output or its dependencies have been updated. Tasks marked as `.PHONY` are always executed.

```makefile!
.PHONY: clean xxx yyy zzz

# 'make clean'
clean:
    rm -rf a.out *.o
    
# ...
```
</div></div>

<hr class="sep-both">

## Advanced Makefiles

<div class="row row-cols-md-2"><div>

#### Assigment Operators

There are multiple operators to assign variables:

* `=`: assign a value to a variable
* `:=`: immediately compute the value of the variable
* `::=`: only compute the value when the variable is actually used
* `?=`: assign if the variable isn't defined
* `+=`: append our value to the variable
* `!=`: execute a command and store the output in the variable

➡️ We usually prefer always using `:=` rather than `=`.

<br>

#### External Build Folder

To add a build folder (or a source folder), simply use paths inside all targets. Note that the build folder must be created inside the makefile.

You can do that using prerequisite (`|`) which are rules executed before evaluating any dependencies.

```makefile!
SRC_DIR := src
BUILD_DIR := build

$(BUILD_DIR)/%.o: $(SRC_DIR)/%.cpp | $(BUILD_DIR)
    $(CXX) $(CXXFLAGS) -c -o $@ $<
	
# prerequisite: create the build directory
$(BUILD_DIR):
    mkdir -p $@
```
</div><div>

#### Makefile utilities

Makefiles support many commands inside `$()`:

* `$(wildcard *.cpp)`: find files matching the glob-pattern
* `$(strip string)`: remove leading and trailing whitespaces
* `$(shell command)`: execute a shell command
* `$(findstring XXX,input_str)`: execute a shell command
* `$(subst from,to,input_str)`: replace `from` with `to` in `input_str`
* `$(eval XXX += yyy)`: you can execute code inside eval
* `$(foreach var,list,op)`: execute `op` on each entry  of `list`
* `$(addprefix prefix, list)`: prefix all elements with `prefix`
* `$(notdir list)`: generate a list of all filenames

A common usage is to automate source and object files detection:

```makefile!
# Source files and object files
SRCS := $(wildcard $(SRC_DIR)/*.cpp)
OBJS := $(patsubst $(SRC_DIR)/%.cpp,$(BUILD_DIR)/%.o,$(SRCS))
```

<br>

#### Makefile if statements

You can use `ifeq` to check if two values are equal <small>(resp. `ifneq`)</small>. You can use `ifdef` to check if a variable is defined <small>(resp. `ifndef`)</small>.

```makefile!
ifeq (v1,v2)
    # some code
endif

ifdef XXX
    # some code
endif
```
</div></div>

<hr class="sep-both">

## Random notes

<div class="row row-cols-md-2"><div>

#### Define macros

You can define macros and call them wherever you want.

```makefile!
# note: for some variables such as $@, $<, etc.
#       you need to add another "$": $$@, $$<, etc.
define my_function
    @echo "Compiling $(2) into $(1)"
endef

my_rule:
    $(call generate_rule, build/main.o, src/main.cpp)
```

#### Simple Text Substitution

You can use `text:from=to` to substitute `from` with `to` in `text`.
</div><div>

#### Include Another Makefile

You can create separate makefiles, for instance, if you have multiple compilers, you can create a file <small>(often, a `.mk`)</small> with variables for each compiler, and conditionnaly import them.

```makefile!
include gcc.mk      # include cannot fail
-include opt.mk     # include can fail
```

#### Verbosity

By default, when we run a command from a makefile, it is echoed inside the terminal. We can use `@` to disable this "echo".

```makefile!
my_target:
    @echo "This is a command"
```
</div></div>