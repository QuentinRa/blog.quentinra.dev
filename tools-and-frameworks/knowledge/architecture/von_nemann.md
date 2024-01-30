# Von Nemann Model

<div class="row row-cols-lg-2"><div>

The Von Neumann architecture or Von Neumann model, is a theoretical computer architecture. It includes:

* 👨‍🔬 A processing unit <small>(ALU)</small>
* 🤖 A control unit <small>(CU)</small>
* 🏠 Registers <small>(IR, PC, ...)</small>
* 🛣️ I/O mechanisms
* ...

This page further extends [general architectural notes](index.md) with a few notes related to Von Nemann Model.  
</div><div>
</div></div>

<hr class="sep-both">

## General Overview

[![stack_based_buffer_overflows_linux_x86](../../../cybersecurity/_badges/htb/stack_based_buffer_overflows_linux_x86.svg)](https://academy.hackthebox.com/course/preview/stack-based-buffer-overflows-on-linux-x86)

<div class="row row-cols-lg-2"><div>

#### Central Processing Unit (CPU)

The CPU is the combination of the ALU and the CU. When the CPU is contained on a single integrated circuit (IC) or chip, when often call it a "microprocessor." Some well-known CPU architectures are:

* x86/i386 - (AMD & Intel)
* x86-64/amd64 - (Microsoft & Sun)
* ARM - (Acorn RISC Machine)

#### Control Unit (CU)

The control unit reads the instructions, delegate the tasks to other components such as the ALU, while ensuring that all instructions are handled in the correct order, one by one. 

Executing one instruction involves five functions:

* **Fetching**: read `IP`/`PC` and locate the instruction. Update `IR`.

* **Decoding**: decode the instruction. Determine the data needed and the operations to be performed. Coordinate with ALU.

* **Read Register**: read data from registers.

* **Execute**: execute an operation (`opcode, r1, r2`)

* **Write dest**: write the result to the destination register

The CPU can write and read data from the RAM. For reference, for a file, a register will contain the file descriptor pointing to the RAM.
</div><div>

#### Arithmetical Logical Unit (ALU)

This unit is responsible for calculations and logical operations.

#### Instruction

An instruction includes a few elements such as:

* 📚 The `opcode` determining which operation is executed
* 🤖 The `operands` which are the registers used by the operation. It includes a destination register `Rd` and often two others.
* 🗃️ It may include additional information for complex operations

Refer to your processor [ISA](https://en.wikipedia.org/wiki/Instruction_set_architecture) for which opcodes/instructions are supported. ISA are classified in categories such as:

* **CISC**: many operations, some are rarely used
* **RISC**: only the more common operations
* **See also**: VLIW, EPIC, MISC, and OISC

#### Bus system

A communication system used by system components such as the CPU or I/O devices to transfer data between each other.
</div></div>

<hr class="sep-both">

## Computer Memory

[![stack_based_buffer_overflows_linux_x86](../../../cybersecurity/_badges/htb/stack_based_buffer_overflows_linux_x86.svg)](https://academy.hackthebox.com/course/preview/stack-based-buffer-overflows-on-linux-x86)

<div class="row row-cols-lg-2"><div>

#### Primary Memory

Primary memory is volatile, meaning that its contents are lost when the power is turned off. It includes the RAM and cache memory.

The Random Access Memory (RAM) is used to store data that is actively being used or processed by the CPU.

➡️ See also:  DRAM <small>(SDRAM, EDO/BEDO DRAM, DDR SDRAM)</small>

➡️ See also: SRAM (Static Random Access Memory)
</div><div>

#### Secondary Memory

Secondary memory refers to storage devices that are used to store data for the long term. It includes hard disk drives (HDDs), solid-state drives (SSDs), CDs, DVDs, and USB drives.

📚 Electronic devices have the Read-Only Memory (ROM) that they use to store the firmware <small>(see also:  PROM, EPROM, EEPROM)</small>.

📚 Flash memory is a non-volatile memory that can be electrically erased and reprogrammed.
</div></div>

<hr class="sep-both">

## Registers

[![stack_based_buffer_overflows_linux_x86](../../../cybersecurity/_badges/htb/stack_based_buffer_overflows_linux_x86.svg)](https://academy.hackthebox.com/course/preview/stack-based-buffer-overflows-on-linux-x86)

<div class="row row-cols-lg-2"><div>

Registers are small, fast storage locations within the CPU itself.

#### Program Counter (PC)

The program counter (PC) or instruction pointer (IP) on Intel x86 is a register containing the address of the next instruction to execute.

It's sometimes called instruction address register (IAR).

#### Instruction Register (IR)

The instruction register (IR) is a register that contains the current instructions being decoded or executed.
</div><div>
</div></div>

<hr class="sep-both">

## Heap and Stack

[![stack_based_buffer_overflows_linux_x86](../../../cybersecurity/_badges/htb/stack_based_buffer_overflows_linux_x86.svg)](https://academy.hackthebox.com/course/preview/stack-based-buffer-overflows-on-linux-x86)

<div class="row row-cols-lg-2"><div>

The Stack memory is a LIFO data structure in the RAM containing:

* The return address of the executed function
* The function parameters of the executed function
* Frame pointers, if added during compilation
* Local variables
* Compiled code

The head of the stack address is stored in the stack pointer (SP).
</div><div>
</div></div>

<hr class="sep-both">

## 👻 To-do 👻

Stuff that I found, but never read/used yet.

<div class="row row-cols-lg-2"><div>

* Each app has its memory space and others can't access it
</div><div>

</div></div>