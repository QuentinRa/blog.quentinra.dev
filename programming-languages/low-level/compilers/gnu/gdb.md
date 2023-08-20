# GNU Debugger

<div class="row row-cols-md-2"><div>

GNU Debugger (GDB) is a debugging software mainly used to debug C/C++ programs. It can be installed using:

```shell!
$ sudo apt-get install gdb
```

To use it with [GCC/G++](/programming-languages/low-level/compilers/gcc/index.md) executables <small>(clang and others too)</small>, don't forget to add the `-g` option when you compile them.
</div><div>

To load a program within GDB, use:

```shell!
$ gdb a.out                  # ./a.out
$ gdb --args a.out arg1 arg2 # ./a.out arg1 arg2
```
</div></div>

<hr class="sep-both">

## Common Usage

<div class="row row-cols-md-2"><div>

You'll place a breakpoint in the code. When one is reached, the code will stop, allowing you to inspect variables...

```text!
(gdb) break line_number
(gdb) b line_number
(gdb) break file.c:line_number      
```

To **display the code for line numbers**:

```text!
(gdb) list         # or l | list the next 10 lines
(gdb) l start,end  # code lines from "start" to "end"
```

To **run the program** until the next breakpoint:

```text!
(gdb) run      # or r 
```

A few commands you might use **once the execution was halted**:

```text!
(gdb) continue  # c | resume the execution
(gdb) step      # s | execute the current line
(gdb) next      # n | execute the next line
```
</div><div>

To **print** the value of a variable or an expression:

```text!
(gdb) print ...
(gdb) p ...
(gdb) p[s]@n ...  # print n entries of an array
```

To **print the stack trace**:

```text!
(gdb) backtrace   # or bt
```

To **quit**:

```text!
(gdb) quit        # or q
```
</div></div>

<hr class="sep-both">

## 👻 To-do 👻

Stuff that I found, but never read/used yet.

<div class="row row-cols-md-2"><div>

* `watch`
* `x`
</div><div>


</div></div>