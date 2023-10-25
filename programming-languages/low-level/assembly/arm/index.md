# ARM Assembly

<div class="row row-cols-md-2"><div>

Assembly languages are low-level languages directly interacting with a processor such as an Intel or an ARM processor.

ARM assembly is one of the assembly languages used for **RISC processors** <small>(Reduced Instruction Set Computing)</small> such as ARM processors.

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

```shell!
$ as -gstabs -o file.o file.s
```

👉 **Link**: link one or more object files into an executable `a.out`

```shell!
$ ld -O0 file.o
```

👉 **Execute**: execute your program

```shell!
$ ./a.out
```

➡️ It's worth noting that you can use both Assembly and C together by using `gcc -c file.c` to generate an object file <small>(useful for testing partial assembly code with a function implemented in C)</small>.

➡️ You can dump the assembly code of a C program with `objdump -d a.out`. See also the `disassemble` command.
</div></div>

<hr class="sep-both">

## File structure

<div class="row row-cols-md-2"><div>

An ARM file usually starts with `.equ` directives. That's where we define constants, such as system calls numbers we will use.

```arm
.equ SYS_EXIT, 1
.equ SYS_WRITE, 4
```

They are usually followed by the optional `.arm` directive, to indicate that the code should be assembled for ARMv4T or newer.

```arm
.arm
```

The code is then followed by an optional `.data` directive, in which we can declare variables that we will use in the code.

```arm
.data
message: .asciz "Hello, World\n"
message_len: .word 13
```

For a function to be used in another file, it must be a global function. This includes the entry point function, usually `_start` or `main`.

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

We usually either use constants or variables to store values. The syntax is `label: type value`, with type:

* `.ascii`: string converted to ASCII
* `.asciz`: same but add a `\0` at the end
* `.word`: an integer

```arm
number: .word 4 @ int number = 4;
```

<br>

#### Comments

Comments can be written using `@` or `#` or  `;`.
</div><div>

#### System calls 🧑‍🏭

While you can use some functions such as printf <small>(if imported)</small>, most of the time, you will only be able to use [**system calls**](/programming-languages/low-level/c/system_calls/index.md).

Each system call is identified by a code: `exit` (1), `fork` (2),  `read` (3), `write` (4), `open` (5), and `close` (6). You can find them here:

```shell!
$ less /usr/include/arm-linux-gnueabihf/asm/unistd.h
```

Here is a checklist:

* ✉️ Set the registers `r0-r6` with the arguments for the system call. Refer to [Functions](#functions) as the process is the same.

```arm
    mov r0, #0 @ the first argument is 0
```

* 🏠 Set the `r7` register with the system call number

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

Instructions are operations that we can perform. For instance, we can put a value inside a register, or calculate the sum of two registers.

* `Rd` or `Rn` are registers such as `r0`, `r1`...
* `Operand2` can be an immediate constant, or a register

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

You can add one of these after ldr/str like `ldrb`.

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

; Rd = Rn * Rm (32-bit value in Rd)
mul Rd, Rn, Rm

; Rd = Rn * Rm (64-bit, signed only)
smull RdLo, RdHi, Rn, Rm

; Rd = Rn * Rm (64-bit, unsigned only)
umull RdLo, RdHi, Rn, Rm
```

➡️ RdLo are the lower 32 bits, while RdHi are the upper 32 bits.
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
@ This function expects a .word in r0 (a)
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

Immediate constants are constants passed as Operand2 using `#`.

```arm
    mov r0, #1
```

⚠️ Major limitation: immediate constants are not on 32 bits like integers, but on **12 bits**.

* 4 bits 🔁: the rotation of the value to get the number
* 8 bits 🔢: a value that may be rotated to get the number

👉 It means that not every number can be used.
</div><div>

The process to manually calculate if a value can be immediate is:

* Write the **value** on 32 bits
* Rotate the bits by a shift amount which must be a multiple of 2. The goal is to have the number on **8 bits**.
* The value for the rotation is $n$ <small>(in binary)</small> in $2^n$

<details class="details-n">
<summary>Ex: from decimal to immediate constant</summary>

**What's the value of $0001\ 00000001$?**

* 32 bits: $00000000\ 00000000\ 00000000\ 00000001$
* $0001$ means that $n=1$, and the rotation is $2^1=2$
* $01000000\ 00000000\ 00000000\ 00000000$ <small>(after two rotations)</small>
* convert back to decimal: $1073741824 = 2^{30}$
</details>

<details class="details-n">
<summary>Ex: from immediate constant to decimal</summary>

**Test with 748 326**

* 32 bits: $00000000\ 00001011\ 01101011\ 00100110$
* oh no... 19 bits can't fit an 8-bit value
* fail ❌

**Test with 32000**

* 32 bits: $00000000\ 00000000\ 01111101\ 00000000$
* 7 bits fit our 8 bits, so we are good
* **value (8 bits)** 🔢: $01111101$

Find the rotation:

* from $00000000\ 00000000\ 00000000\ 01111101$
* we need to rotate 24 times to get back the number
* oh no... there is no $n$ giving us $2^n = 24$
* fail ❌

**Test with $-58$**

* 32 bits: $10000000\ 00000000\ 00000000\ 00111010$
* 7 bits fit our 8 bits, so we are good
* **value (8 bits)** 🔢: $11101010$

Find the rotation:

* from $00000000 00000000 00000000 11101010$
* we need to rotate 2 times to get back the number
* there is $n=1$ given $2^n = 2$
* **rotation (4 bits)** 🔁: $0001$ <small>(equals to n=1)</small>

👉 The immediate constant stored is $0001\ 11101010$.
</details>
</div></div>

<hr class="sep-both">

## Conditions

<div class="row row-cols-md-2"><div>

You can add a condition for an instruction to be executed only if the condition is true. These conditions are checking the 4 flags:

* **N** ➖: is the result Negative?
* **Z** 0️⃣: is the result zero?
* **C** 1️⃣: is the last carry value one?
* **V** 🤯: do we have an overflow?

These flags are either changed after calling a test operation, or by adding the `s` flag to a normal operation such as `adds`.

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
; test if r0 is equal to 6
; Z = false, N = true...
cmp r0, #6

; "ne" <=> if Z is false
addnes r0, #4 ; add 4 + set flags (Z = false, N = false...)
```

</div></div>

<hr class="sep-both">

## Barrel shifter

<div class="row row-cols-md-2"><div>

You can apply modifications on `Operand2` easily using some operators like `>>` or `<<` in C. It's useful to transform a value "on the fly" 🕺 as the registers are not modified 🥏.

#### Type of shifts

**LSL (Logical Shift Left)**: Move xxx bits to the left, new bits are set to 0. Not fitting bits are lost (left).

👉 Example: $111111111111\ldots \to^{LSL(4)} 11111111\ldots0000$

<br>

**LSR (Logical Shift Right)**: Same as LSL but to the right.

👉 Example: $111111111111\ldots \to^{LSR(4)} 000011111111\ldots$

<br>

**ASR (Arithmetic shift right)**: Write xxx times the sign bit, then Rb. Extra bits on the right are lost.

👉 Example: $001110001000\ldots \to^{ASR(4)} 0000001110001000\ldots$<br>
👉 Example: $101110001000\ldots \to^{ASR(4)} 1111101110001000\ldots$
</div><div>

**ROR (rotate right)**: Write the last xxx bits of Rb then Rb. Extra bits on the right are lost.

👉 Example: $001110001000\ldots0010 \to^{ROR(4)} 00100011100010\ldots$<br>

<br>

**RRX (rotate right Extended)**: RRX is more complicated. It uses two operands: a carry <small>(the C in NZCV)</small> and an amount xxx.

* Do a LSR by one position
* Replace the first bit with the value of the carry
* The last bit becomes the new carry
* repeat until the amount is 0

👉 Example: $0011100010\ldots10 \to^{C = 1\ and\ RRX(2)} 010011100010\ldots$<br>

#### Usage

The format is: `Rb, shift_type shift_amount`.

```arm
@ r1 is shifted by 2 before being added to r0
add r0, r0, r1, lsl #2
```
</div></div>

<hr class="sep-both">

## Arrays

<div class="row row-cols-md-2"><div>

To declare an array, simply list the values.

```arm
array: .word 1,5,7,46,89
```

You will need a variable for the length. **Right-after** declaring your array, "`.`" (dot) contains the number of values in the array.

```arm
array_length: .
```
</div><div>

We use `ldr` to access a value. The index accessed is stored in `r1`.

```arm
ldr r0, =array
mov r1, #0
ldr r2, [r0, r1, LSL #2] @ r2 = array[0]
```

To store a value, we use `str`. The index accessed is stored in `r1`.

```arm
ldr r0, =array
mov r1, #0
mov r2, #77
str r2, [r0, r1, LSL #2] @ array[0] = 77;
```

👉 We use barrel shifting with `#2` since values are on 4 bytes.
</div></div>

<hr class="sep-both">

## Advanced

<div class="row row-cols-md-2"><div>

#### Loops

You can declare a label and use `b` to navigate to it. Using this, we can exit the loop when the condition is true.

```arm
_start:
    mov r0, #5 @ init outside of the loop
loop:
    @ condition to exit
    cmp r0, #0 @ if r0 == 0
    beq exit @ then navigate to exit:
    
    @ update r0
    sub r0, r0, #1 @ r0--
    
    @ do what you want
    @ ...

    @ loop again
    b loop
exit:
    @ ...
```
</div><div>

#### Stack

The stack is a **primordial concept** when calling a function inside functions. It's also useful to empty registries as we don't have a lot. 

🔥 Basically, we can put values in the stack, and take them back later.

⚠️ When calling a function, it may modify registers, potentially leading to unexpected changes. As a result, we may have lost the register value used to return to the calling function.

<div class="row row-cols-md-2"><div>

```arm
4: mov r1, #13
5: bl max;
6: cmp r0, #13
```
</div><div>

When calling `max`, `6` is stored in the `lr` register. If we call another function inside `max`, then this value will be replaced, and lost.
</div></div>

```arm
max:
    push {lr}  @ save the return address to the stack
    @ code ...
    pop {pc}   @ load the return address from the stack
.end
```

More generically, for normal registers:

```arm
push {r0, r1, r2} @ order matters! r0 before r1...
push {r0-r2}      @ can use an interval
```

</div></div>

<hr class="sep-both">

## 👻 To-do 👻

Stuff that I found, but never read/used yet.

<div class="row row-cols-md-2"><div>

* SIMD (Single Instruction Multiple Data) instruction set
* [azerialabs](https://azm.azerialabs.com/)
</div><div>

```arm
@ Pre-indexed
ldr r3, [r2, #-8]
ldr r3, [r2, r1, lsl#16] @ r3 = r2 + r1 * 2^16
ldr r3, [r2, #-8]!

@ Post-indexed
ldr r3, [r2], r1
```
</div></div>