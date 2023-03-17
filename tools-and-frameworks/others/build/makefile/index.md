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