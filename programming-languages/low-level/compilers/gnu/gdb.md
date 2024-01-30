# GNU Debugger

<div class="row row-cols-lg-2"><div>

GNU Debugger (GDB) is a debugging software mainly used to debug C/C++ programs. It can be installed using:

```shell!
$ sudo apt-get install gdb
```

To use it with [GCC/G++](/programming-languages/low-level/compilers/gnu/gdb.md) executables <small>(clang and others too)</small>, or at least to ease your work, don't forget to add the `-g` flag during compilation.
</div><div>

To load a program within GDB, use:

```shell!
$ gdb a.out                  # ./a.out
$ gdb -q a.out               # quiet mode
$ gdb --args a.out arg1 arg2 # ./a.out arg1 arg2
```
</div></div>

<hr class="sep-both">

## Common Usage 📚

<div class="row row-cols-lg-2"><div>

You'll place a breakpoint in the code. When one is reached, the code will stop, allowing you to inspect variables...

```text!
(gdb) break line_number
(gdb) b line_number
(gdb) break file.c:line_number      
(gdb) b *address
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

## Additional Notes

<div class="row row-cols-lg-2"><div>

#### GDB PEDA Assistance

[![attacking_common_applications](../../../../cybersecurity/_badges/htb/attacking_common_applications.svg)](https://academy.hackthebox.com/course/preview/attacking-common-applications)

You can use [peda](https://github.com/longld/peda) <small>(5.7k ⭐)</small> to debug Linux binaries. It's a Python script over GDB that make it easier to use GDB.

```shell!
$ git clone https://github.com/longld/peda.git ~/peda
$ echo "source ~/peda/peda.py" >> ~/.gdbinit
$ gdb ./some_program
(gdb) do_as_usual
```
</div><div>

#### Disassembly

[![stack_based_buffer_overflows_linux_x86](../../../../cybersecurity/_badges/htb/stack_based_buffer_overflows_linux_x86.svg)](https://academy.hackthebox.com/course/preview/stack-based-buffer-overflows-on-linux-x86)
[![attacking_common_applications](../../../../cybersecurity/_badges/htb/attacking_common_applications.svg)](https://academy.hackthebox.com/course/preview/attacking-common-applications)

You can disassemble the code using:

```shell!
(gdb) set disassembly-flavor att   # Linux team, default
(gdb) set disassembly-flavor intel # Windows team
(gdb) disassemble main
(gdb) disas main
```

The format is something like:

* Memory address
* Address jump <small>(e.g., `+x` since the previous address)</small>
* Assembler instruction
* Operands <small>(e.g., registers and suffixes)</small>

For a permanent change ✨:

```shell!
$ echo "set disassembly-flavor intel" >> ~/.gdbinit
```
</div></div>


<hr class="sep-both">

## 👻 To-do 👻

Stuff that I found, but never read/used yet.

<div class="row row-cols-lg-2"><div>

* `watch`
* `x`
</div><div>


</div></div>