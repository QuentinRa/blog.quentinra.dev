# Makefile

<div class="row row-cols-md-2"><div>

Makefile are file in which a developer define **rules** ✍️ to compile files, build an executable, and run it. 

* 📃 You define the dependencies between files
* 🚀 Only changed files and those dependent on it are recompiled
* 🏡 Users write simple commands such as `make build` <small>(no "gcc [...]")</small>
* 🌍 Commonly used to build Linux applications

Makefile are mainly used in C, while they can be for any languages, different tools such as CMake are used instead.

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

But this is not a correct approach 👎. Imagine, if `main.c` has many dependencies, then they will all be listed as dependencies to `a.out`. It means that every time we ask `make` to compile the latest `a.out`, every dependency will be checked.
</div><div>

Instead, we usually use intermediate files, such as `.o` in C.

```makefile!
# ✅ correct
a.out: main.o
        gcc -o a.out main.o
```

We don't need to specify how a `.o` is compiled, as this is one of the **compilation rules** 📝 that Makefile knows. Still, you can do it:

```makefile!
main.o: main.c
        gcc -c main.c -o main.o
```

For other languages or in some cases, you may have to define your own compilation rules, for instance, in C, we would have:

```makefile!
%.o: %.c
        gcc -c $< -o $@
```

This rule is similar to the pre-existing one to compile a `.o`. The final output would be like this:

```makefile!
a.out: main.o
        gcc -o a.out main.o

%.o: %.c
        gcc -c $< -o $@
```
</div></div>

<hr class="sep-both">

## Basics

<div class="row row-cols-md-2"><div>

Usually, we start a Makefile by defining variable, and compilation rules, as to avoid copy-pasting code 👌.

Some quite used names for variables are `CC` and `CFLAGS`.

```makefile!
CC=gcc # compiler
CFLAGS=-Wall # compiler flags, -lm...
```

The compilation rules are generic templates to compile file. There are some pre-existing one, such as `*.c` to `*.o`.

```makefile!
%.o: %.c
    $(CC) -c $< -o $@
```
</div><div>

For instance:

```
a.out: main.o
        gcc -o a.out main.o

main.o: main.c
        gcc -c main.c -o main.o
```

As we said, Makefile already know how to compile a `.o`, so we can shorten the code to

```
a.out: main.o
    gcc -o a.out main.o
```

</div></div>

<hr class="sep-both">

## Examples - Makefile in C

<div class="row row-cols-md-2"><div>

The first thing we do in a makefile, is to define variables. They simplify the process of maintaining and updating our Makefile.

```makefile!
CC = gcc # compiler
CFLAGS = -Wall # compiler flags such as -lm...

O_FILES = file1.o file2.o \
          main.o
```

👉 Variable names are up to you

The first rule is usually called `all`. The first rule is the one called when using `make` without arguments.

```makefile!
all : my_program
```
</div><div>

Since we defined that the rule `all` generate a file called `my_program`, we need to define how this file is generated...

```makefile!
my_program : $(O_FILES)
        $(CC) $(CFLAGS) -o my_program $(O_FILES)
```

We need to fine how is file in `$(O_FILES)` are compiled since they are needed to generate `my_program`.

```makefile!
file1.o : file1.h
file2.o : file1.o
main.o : file1.o file2.o
```

Makefile only call a task if the file or its dependencies were updated. An exception are tasks marked as `.PHONY`

```makefile
.PHONY : clean

# make clean
clean :
        rm -f $(O_FILES) my_program
```

</div></div>


<hr class="sep-both">

## 👻 To-do 👻

Stuff that I found, but never read/used yet.

<div class="row row-cols-md-2"><div>
</div><div>
</div></div>