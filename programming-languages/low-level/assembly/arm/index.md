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

Here some checklist:

* ✉️ Set the registers `r0-r6` with the arguments for the system call. Refer to [Functions](#functions) as the process is the same.

```arm
    mov r0, #0 @ the first argument is 0
```

* 🏠 Set he `r7` register with the system call number

```arm
    mov r7, #1 @ example to call exit
```

* 📬 Invoke the system call `swi` <small>(same as svc)</small>:

```arm
    swi #0 @ will call: exit(0);
```
</div></div>

<hr class="sep-both">

## Instructions

<div class="row row-cols-md-2"><div>

Instructions are operations that we can do. For instance, we can put a value inside a register, or calculate a sum of two registers.

* `Rd` or `Rn` are registers such as `r0`, `r1`...
* `Operand2` can be a immediate constant, or a register

**Register-related operations** ️📝

```arm
; mov Rd, Operand2 | store a value in a register
mov r0, #3

@ ldr Rd, =label | load the value of "message" in r0
ldr r0, =message

; ldr Rd, [Rn] | load the value of a pointer stored in r0
ldr r1, [r0]

; str Rd, =label | store the value in Rd in "message"
str r0, =message

; str Rd, [Rn] | store in the pointer in r0 the value in r1
str r1, [r0]
```

You can add a one of these after ldr/str like `ldrb`.

* `b`: load/store the first byte
* `h`: load/store the first two bytes.
</div><div>

**Mathematical operations** 🎒

```arm
; Rd = Rn + Operand2
add Rd, Rn, Operand2

; Rd = Rn - Operand2
sub Rd, Rn, Operand2

; Rd = Operand2 - Rn
rsb Rd, Rn, Operand2

; exclusive or
eor Rd, Rn, Operand2

; Rd = Rn * Rm (32-bits value in Rd)
mul Rd, Rn, Rm

; Rd = Rn * Rm (64-bits, signed only)
smull RdLo, RdHi, Rn, Rm

; Rd = Rn * Rm (64-bits, unsigned only)
umull RdLo, RdHi, Rn, Rm
```

➡️ RdLo are the lower 32 bits while RdHi are the upper 32 bits.
</div></div>

<hr class="sep-both">

## Functions

<div class="row row-cols-md-2"><div>

Let's say we have this code in C:

```c
int sum(int a, int b) {
    return a + b;
}

int x = sum(5, 3);
```

#### Call a function

The first argument is stored in the first register `r0`, the second in the second register `r1`... The output will be stored in `r0`.

```arm
mov r0, #5
mov r1, #3
bl sum @ function call: sum(5, 3)
@ result in r0
```

⚠️ Actually, which registers are used for arguments/the output, is something up to the one that wrote the function.
</div><div>

#### Code a function

You must declare the function as `.global`. Then, implement it as usual.

```arm
@ This function expect a .word in r0 (a)
@ and a .word in r1 (b).
@ It will store the result (a+b) in r0.
.global sum

sum:
    add r0, r0, r1
.end
```

🧼 You should do it in another file, to keep things clean and tidy.
</div></div>

<hr class="sep-both">

## Immediate constants

<div class="row row-cols-md-2"><div>

...
</div><div>

...
</div></div>

<hr class="sep-both">

## Conditions

<div class="row row-cols-md-2"><div>

You can add a condition for an instruction to be executed only if the condition is true. These conditions are checking the 4 flags:

* **N** ➖: is the result Negative?
* **Z** 0️⃣: is the result zero?
* **C** 1️⃣: is the last carry value one?
* **V** 🤯: do we have an overflow?

These flags are either changed after calling a test operation, or by adding the `s` flag to normal operation such as `adds`.

|NZCV bits|Operator| NZCV   |        Detail         |
|----|------|---------------|-------------------------|
|    |  al  |               | Always                  |
|0000|  eq  |      Z        | Last result is 0        |
|0001|  ne  |     !Z        | Last result isn't 0     |
|0100|  mi  |      N        | Last result is negative |
|0101|  pl  |     !N        | Last result is positive |
|1010|  ge  |    N==V       | Greater or equals       |
|1011|  lt  |   N != V      | Lesser than             |
|1100|  gt  | !Z AND (N==V) | Greater than            |
|1101|  le  | Z or (N != V) | Lesser or equals        |
|    |CS, CC|    C, !C      | With/Without carry      |
|    |VS, VC|    V, !V      | With/Without overflow   |
</div><div>

**Test functions** 🧪

```arm
; Comparison: Rn - Operand2
cmp Rn, Operand2

; Comparison: Rn + Operand2
cmn Rn, Operand2

; Bitwise and, this is "&" in C, not "&&"
tst Rn, Operand2

; Bitwise exclusive OR ("|" on C, not "||")
teq Rn, Operand2
```

**Examples** 🔥

```arm
mov r0, #6 @ r0 = 6
; test if r0 value is 6
; Z = true, ...
cmp r0, #6

; "eq" <=> if Z is true
addeq r0, #6 ; add 6 to r0
```

```arm
mov r0, #2
; test if r0 is equals to 6
; Z = false, N = true...
cmp r0, #6

; "ne" <=> if Z is false
addnes r0, #4 ; add 4 + set flags (Z = false, N = false...)
```

</div></div>

<hr class="sep-both">

## Barrel shifter

<div class="row row-cols-md-2"><div>

You can apply modifications on `Operand2` easily using some operators like `>>` or `<<` in C.
</div><div>

...
</div></div>

<hr class="sep-both">

## Arrays

<div class="row row-cols-md-2"><div>

...
</div><div>

...
</div></div>

<hr class="sep-both">

## Advanced

<div class="row row-cols-md-2"><div>

...
</div><div>

...
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