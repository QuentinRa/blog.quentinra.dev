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