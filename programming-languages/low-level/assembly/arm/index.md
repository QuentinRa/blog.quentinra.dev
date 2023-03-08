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
message: .asciz "Hello, World\n"
message_len: .word 13
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
    ldr r1, =message
    ldr r2, =message_len
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

👉 Both are correct, but in the former, we only used system calls.
</div></div>

<hr class="sep-both">

## ARM basics

<div class="row row-cols-md-2"><div>

#### Registers 🗃️

Registers are used to store values such as function parameters.

* `r0` to `r6`, `r8` to `r10` are used to store values
* `r7`: store system call value
* `r11`: store fp <small>(Frame pointer)</small>
* `r12`: store ip <small>(Intra Procedural Call)</small>
* `r13`: store sp <small>(Stack Pointer)</small>
* `r14`: store lr <small>(Link Register, next instruction)</small>
* `r15`: store pc <small>(Program Counter, current instruction)</small>

➡️ Given a function call: `sum(5, 3)` in C, in assembly, you will store `5` in `r0` <small>(first argument)</small> and `3` in `r1` <small>(second argument)</small>, then call the function.

<br>

#### Variables 🗝️

We usually either use constants or variable to store values. The syntax is `label: type value`, with type:

* `.ascii`: string converted to ASCII
* `.asciz`: same but add a `\0` at the end
* `.word`: an integer

```arm
number: .word 4 @ int number = 4;
```
</div><div>

#### System calls 🧑‍🏭

While you can use some functions such as printf <small>(if imported)</small>, most of the time, you will only be able to use **system calls**.

Each system call is identified by a code: `exit` (1), `fork` (2),  `read` (3), `write` (4), `open` (5), and `close` (6). You can find them here:

```bash!
$ less /usr/include/arm-linux-gnueabihf/asm/unistd.h
```

Once you prepared the registers `r0-r6`, to call a system call, first set the `r7` register will the system call number, then call `swi` <small>(same as svc)</small>:

```arm
mov r7, #1 @ swi will call exit
swi #0
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

```arm
tab: .word 1,5,7,46,89
taille: .
```

* The `dot` means the number of numbers we wrote **right before** so 5 here. Do it right after your tab declaration or it won't work.
</div></div>