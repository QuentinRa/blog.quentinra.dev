# ARM Assembly

<div class="row row-cols-md-2"><div>

Assembly language are low-level language directly interacting with the processor such as an Intel processor.

ARM assembly is one of the assembly language used for **RISC processors** <small>(Reduced Instruction Set Computing)</small> such as ARM processors.

* 🧐 Simplified instruction set compared to CISC processors
* 🚀 Usually more performant
* ⚡ Usually has a lower power consumption
* 📱 ARM processors are quite used in IoT/embedded systems/...

**Where to learn?** 🎓

* [davespace.co.uk](http://www.davespace.co.uk/arm/introduction-to-arm/) <small>(⛪)</small>
* [cburch.com](http://www.cburch.com/books/arm/index.html) <small>(😎)</small>
* [azeria-labs.com](https://azeria-labs.com/writing-arm-assembly-part-1/) <small>(😎)</small>
* [arm.com](https://developer.arm.com/documentation) <small>(👻)</small>
</div><div>

👉 **Assemble**: transform an assembly file `.s` into an object file `.o`

```bash!
$ as -gstabs -o file.o file.s
```

👉 **Link**: link one or more object files into an executable `a.out`

```bash!
$ ld -O0 file.o
```

👉 **Execute**: execute your program

```bash!
$ ./a.out
```

➡️ It's worth noting that you can use both Assembly and C together by using `gcc -c file.c` to generate an object file <small>(useful for testing a partial assembly code with a function implemented in C)</small>.

➡️ You can dump the assembly code of a C program with `objdump -d a.out`. See also the `disassemble` command.
</div></div>

<hr class="sep-both">

## File structure

<div class="row row-cols-md-2"><div>

An ARM file usually starts with `.equ` directives. They are the constants we define, such as the system calls numbers.

```arm
.equ SYS_EXIT, 1
.equ SYS_WRITE, 4
```

They are usually followed by the optional `.arm` directive, to indicate that the code should be assembled for ARMv4T or newer.

```arm
.arm
```

The code is then followed by an optional `.data` directive, in which we can declare variable that we will use in the code.

```arm
.data
hw: .asciz "Hello, World\n"
hw_len: .word 13
```

For a function to be used in another file, it must be global function. This includes the entrypoint function, usually `_start` or `main`.

```arm
.global _start
```
</div><div>

Then, we define the code of the function like so:

```arm
.text
_start:
    @ write(1, "Hello, World", 12)
    mov r0, #1
    ldr r1, =hw
    ldr r2, =hw_len
    mov r7, #SYS_WRITE
    swi #0
    
    @ exit(0)
    mov r0, #0
    mov r7, #SYS_EXIT
    swi #0
.end
```

Compile, and execute. This code prints "Hello, World". Another way to code the same function would be:

```arm
_start:
    @ printf("Hello, World")
    ldr r0, =message
    bl printf
    @ return 0
    mov r0, #0
    bx lr
.end
```
</div></div>

<hr class="sep-both">

## 👻 To-do 👻

Stuff that I found, but never read/used yet.

<div class="row row-cols-md-2"><div>

* [old](_old.md)
* SIMD (Single Instruction Multiple Data) instruction set
* [azerialabs](https://azm.azerialabs.com/)
</div><div>

</div></div>