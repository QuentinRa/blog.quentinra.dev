# X86 Assembly Language

<div class="row row-cols-lg-2"><div>

Assembly languages are low-level languages directly interacting with a processor such as an Intel or an ARM processor.

X86 assembly is one of the assembly languages used for CISC processors <small>(Complex Instruction Set Computing)</small> such as Intel processors.

* 🧐 Rich instruction set compared to RISC processors
* 🧩️ Versatile and capable of handling a wide range of tasks
* 💻 Commonly used in desktop and server environments
* 🚨 May consume more power while power-efficient options exist

X86 transitioned from 32-bit to 64-bit architecture with x86-64.
</div><div>

**Where to learn?** 🔥

* [x86-64 Stanford Reference](https://web.stanford.edu/class/cs107/resources/x86-64-reference.pdf) <small>(👻)</small>
</div></div>

<hr class="sep-both">

## Basic Overview

[![stack_based_buffer_overflows_linux_x86](../../../../cybersecurity/_badges/htb/stack_based_buffer_overflows_linux_x86.svg)](https://academy.hackthebox.com/course/preview/stack-based-buffer-overflows-on-linux-x86)

<div class="row row-cols-lg-2"><div>

#### .data

Global and static variables.

#### .bss

Statically allocated variables. [ref](https://stackoverflow.com/questions/8145243/x86-asm-linux-using-the-bss-section#8145374).

#### .text

Contains the assembler instructions. Can be read-only.
</div><div>

#### Common Instructions

Random instructions:

```x86asm
mov destination, source ; put value into registry
```
</div></div>

<hr class="sep-both">

## X86 Registers

[![stack_based_buffer_overflows_linux_x86](../../../../cybersecurity/_badges/htb/stack_based_buffer_overflows_linux_x86.svg)](https://academy.hackthebox.com/course/preview/stack-based-buffer-overflows-on-linux-x86)

<div class="row row-cols-lg-2"><div>

#### General-Purpose Registers

Used for general-purpose computation and storage.

| x86 | x86-x64 | Description                                          |
|-----|---------|------------------------------------------------------|
| EAX    | RAX     | Accumulator register for arithmetic/data operations  |
| EBX    | RBX     | Base register, often used as a pointer to data.      |
| ECX    | RCX     | Counter register, frequently used as a loop counter. |
| EDX    | RDX     | Data register, used in some operations.              |

#### Index Registers

They can be used to access/write values in arrays.

| x86 | x86-x64 | Description             |
|-----|---------|-------------------------|
| ESI | RSI     | Index to access a value |
| EDI | RDI     | Index to write a value  |
</div><div>

#### Stack Registers

As the stack grows, it is logically divided into sections called Stack Frames, with each frame corresponding to an individual function.

| x86 | x86-x64 | Description                        |
|-----|---------|------------------------------------|
| ESP | RSP     | Stack pointer. Head of the stack.  |
| EBP | RBP     | Base pointer. Bottom of the stack. |

⚠️ As a reminder, the head is the last value added (LIFO).

#### Pointer Registers

| x86 | x86-x64 | Description                                    |
|-----|---------|------------------------------------------------|
| EIP    | RIP     | Instruction Pointer. Next instruction address. |
</div></div>

<hr class="sep-both">

## X86 Functions

<div class="row row-cols-lg-2"><div>
</div><div>

#### Function Prologue And Epilogue

[![stack_based_buffer_overflows_linux_x86](../../../../cybersecurity/_badges/htb/stack_based_buffer_overflows_linux_x86.svg)](https://academy.hackthebox.com/course/preview/stack-based-buffer-overflows-on-linux-x86)

Each function using stack frames will perform a suite of steps called the prologue and the epilogue to save the previous pointers values during the execution and restore them at the end.

```x86asm
push ebp        ; prologue
mov ebp,esp
sub esp,value   ; allocate space for variables
...
mov esp, ebp    ; epilogue
pop ebp
ret
```

You can alternatively use `leave` for the epilogue.
</div></div>