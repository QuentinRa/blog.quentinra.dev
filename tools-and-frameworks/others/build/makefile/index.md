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

## Dependencies

<div class="row row-cols-md-2"><div>

Makefile dependencies are files that, if changed, mean that we need to recompile our target. 

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

## Extra

<div class="row row-cols-md-2"><div>

#### Variables

We usually start a Makefile by defining some variables, to avoid copy-pasting code and easing the maintaining of our Makefile 👌.

Some quite used names for variables are `CC` and `CFLAGS`.

```makefile!
CC=gcc # compiler
CFLAGS=-Wall # compiler flags, -lm...
```

To use them in some rules:

```makefile!
my_program: ...
        $(CC) $(CFLAGS) -o my_program ...
```
</div><div>

#### Multilines

You can use `\ ` for multiline instructions:

```makefile!
O_FILES = file1.o file2.o \
        main.o
```

#### PHONY rules

Makefile only call a task if the file or its dependencies were updated. An exception are tasks marked as `.PHONY`

```makefile!
.PHONY: clean xxx yyy zzz

# make clean
clean:
    rm -rf a.out *.o
    
# ...
```
</div></div>

<hr class="sep-both">

## 👻 To-do 👻

Stuff that I found, but never read/used yet.

<div class="row row-cols-md-2"><div>
</div><div>
</div></div>