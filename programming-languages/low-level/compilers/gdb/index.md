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