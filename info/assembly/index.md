# Assembly (ARM)

You will usually run some programs on your computer.
These programs are written in the machine language,
so many 0 and 1. The level higher than binary
code is assembly. That's an human-readable language
of the machine code. You may use that a lot of you
do what we call "reverse-engineering" like exploring
the code of a program.

You can learn about Intel assembly but here we will
learn about ARM processor assembly language. The reason
of that choice is because the RISC family of processors
whose ARM belong to is still quite used.

<hr class="sl">

## Introduction

First you need a RISC kind of processor. If you got
a raspberry (cost is around 30$) then you should use it.
You can also use this 
[great (yet not really useful here) tool](https://azm.azerialabs.com/) to write some code
but you won't be able to compile it.

The commands that we will use are

* ``as``: assemble, create a `.o` file
* ``ld``: link, create a `.out` file

If you got good eyes, you should have notice that this
is the same that in C, with ``gcc -c``(.o) and `gcc` (.out).
That's really is the case, in fact you can fix assembly
code with ``C`` code and doing that helped me quite a
lot to learn assembly, like writing the code in ``C`` then
removing the function in C and writing it in ``ARM``.

<hr class="sr">

## Start writing some code

You will write a file ``.s`` then you can do

```bash
# file.o
as -gstabs -o file.o file.s
# a.out
ld -O0 file.o
# run
./a.out
```

Here a basic file that should work

```asm6502
.equ SYS_EXIT, 1
.equ SYS_WRITE, 4

    .arm
    .data

hw: .asciz "Hello, World\n"
hw_len: .word 13

    .text
    .global _start

_start :
    @ write
    mov r0, #1
    ldr r1, =hw
    ldr r2, =hw_len
    mov r7, #SYS_WRITE
    swi #0
    
    @ exit
    mov r0, #0
    mov r7, #SYS_EXIT
    swi #0
.end
```

You can get the assembly code of a ``C`` program
with ``objdump -d a.out``.

<hr class="sl">

## Syntax

The language is quite easy to learn, since there
isn't much of syntax
  
* [File Structure](syntax/file.md)
* [Registers](syntax/registers.md)
* [Variables](syntax/variables.md)
* [System calls](syntax/sys.md)
* [Constants](syntax/constants.md)

Comments are made with `@` or `#` or  ``;``.

<hr class="sr">

## Instructions

The main idea is that you will move into registers
value. The first register is the first argument of a
function, ...

For instance, the system call ``write(1, "test", 4)``
means that we want

* r0: 1
* r1: "test"
* r2: 4

For that, you will need function to move value into
a register. You may also need instruction to do arithmetic
operations like +, -, ...

* [Move-related instructions](syntax/move.md)
* [Arithmetic-related instructions](syntax/arithmetic.md)
* [System call call](syntax/swi.md)