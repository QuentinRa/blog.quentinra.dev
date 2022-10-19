# Assembly (ARM)

You will usually run a program on your computer. This is a binary, meaning a file written in the machine language, and made only of 0 and 1. It's quite unreadable for us, so we introduced a language on level above: assembly. You may see it a lot of you do what we call "reverse-engineering" meaning exploring the code of a compiled program.

In this course, we will learn about ARM assembly (you may also want to look at Intel Assembly). The reason for that choice is because the RISC family of processors whose ARM belongs to is still quite used.

<hr class="sl">

## Introduction

First, you need a RISC kind of processor. If you got a raspberry (cost is around 30$) then you should use it. You can also use this [great (yet not useful here) tool](https://azm.azerialabs.com/) to write some code, but you won't be able to compile it.

The commands that we will use are

* `as`: assemble, create a `.o` file
* `ld`: link, create a `.out` file

If you got good eyes, you should have noticed that this is the same that in C, with `gcc -c`(.o) and `gcc` (.out). You can mix assembly code with `C` code and doing that helped me quite a lot to learn assembly, like writing the code in `C` then removing a function in C and writing it in `ARM` (so I didn't have to write everything is looking for the issue when the program was not working).

<hr class="sr">

## Start writing some code

You will write a file `.s` then you can do

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

You can get the assembly code of a `C` program with `objdump -d a.out`. You may also check [disassemble](https://visualgdb.com/gdbreference/commands/disassemble) command.

<hr class="sl">

## Syntax

The language is quite easy to learn, since there isn't much of syntax
  
* [File Structure](syntax/file.md)
* [Registers](syntax/registers.md)
* [Variables](syntax/variables.md)
* [System calls](syntax/sys.md)
* [Constants](syntax/constants.md)

Comments are made with `@` or `#` or  `;`.

<hr class="sr">

## Instructions

The main idea is that you will move values into the registers. The first register is the first argument of a function, ...

For instance, the system call `write(1, "test", 4)` means that we want

* `r0`: 1
* `r1`: "test"
* `r2`: 4

And the result will be stored in `r0`.

We will need instructions to set a value into a register. You may also need instructions to do arithmetic operations like +, -, ...

* [Move-related instructions](syntax/move.md)
* [Arithmetic-related instructions](syntax/arithmetic.md)
* [Make a system call](syntax/swi.md)

<hr class="sl">

## Functions

You are almost ready to write functions. You know that the function parameters must be stored in registers, starting from r0 and that the result will be stored in r0.

Still, you must learn

* the syntax of functions
* how to store registers

For the latter, you should remember that you don't have a lot of registers. And what if a function calls another one? You may want to know how you should manage your registers for that (like pc and lr registers might become messed up after a function call).

* [Declaration](functions/syntax.md)
* [Call](functions/call.md)
* [Stack](functions/stack.md)

<hr class="sr">

## Conditions

You can add a condition for an instruction to be executed only if the condition is true. These conditions are checking the 4 flags

* N: is the result Negative?
* Z: is the result zero?
* C: is the last carry value one?
* V: do we have an overflow?

Usually, the flags are only changed after calling a test function but you may add a `s` at the end of the previous instruction to change the flags like `add` can become `adds` or `addnes` where ne if the condition that we will learn right now.

* [Table of conditions](cond/table.md)
* [Tests](cond/tests.md)
* [Examples](cond/examples.md)

<hr class="sl">

## Loops

Also, note that we have a new instruction `b`, to move to a label like that

```asm6502
loop:
    ; r0 - 0
    ; Z = ???, N = ???, ...
    cmp r0, #0
    ; if Z is true, then move to exit label
    beq exit

    ; update r0, r0--
    sub r0, r0, #1

    ; loop again
    b loop
exit:
    ; ...
```

<hr class="sr">

## Barrel Shifter

You can modify what we called `Operand2` easily using some operators like `>>` or `<<` in C.

* [Instructions](bs/instructions.md)
* [Usage](bs/usage.md)

You will use a lot the Barrel Shifter when manipulating arrays since you need to move from an index to another without needing to do complex operations.

* [Complex shifts](bs/indexed.md)

<hr class="sl">

## Sources

* <https://community.arm.com/developer/ip-products/processors/b/processors-ip-blog/posts/condition-codes-1-condition-flags-and-codes>
* <http://www.cburch.com/books/arm/index.html>
* <https://www.tutorialspoint.com/assembly_programming/assembly_system_calls.htm>
* <https://en.wikipedia.org/wiki/Stack_register>
* <https://www.elprocus.com/what-is-stack-stack-pointer-types-operations-its-application/>
* <http://www.davespace.co.uk/arm/introduction-to-arm/>
* <https://azeria-labs.com/writing-arm-assembly-part-1/>