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

#### Arithmetical Logical Unit (ALU)

This unit is responsible for calculations and logical operations.

#### Control Unit (CU)

The control unit reads the instructions, delegate the tasks to other components such as the ALU, while ensuring that all instructions are handled in the correct order, one by one. 

Executing one instruction involves five functions:

* **Fetching**: read `IP`/`PC` and locate the instruction. Update `IR`.

* **Decoding**: decode the instruction. Determine the data needed and the operations to be performed. Coordinate with ALU.

* **Read Register**: read data from registers.

* **Execute**: execute an operation (`opcode, r1, r2`)

* **Write dest**: write the result to the destination register
</div><div>

#### Instruction

An instruction includes a few elements such as:

* 📚 The `opcode` determining which operation is executed
* 🤖 The `operands` which are the registers used by the operation. It includes a destination register `Rd` and often two others.
* 🗃️ It may include additional information for complex operations

Refer to your processor [ISA](https://en.wikipedia.org/wiki/Instruction_set_architecture) for which opcodes/instructions are supported. ISA are classified in categories such as:

* **CISC**: many operations, some are rarely used
* **RISC**: only the more common operations
* **See also**: VLIW, EPIC, MISC, and OISC

#### Registers

xxx
</div></div>

<hr class="sep-both">

## 👻 To-do 👻

Stuff that I found, but never read/used yet.

<div class="row row-cols-lg-2"><div>

* bus
* RAW (volatile): DRAM (SDRAM, EDO DRAM, BEDO DRAM, DDR SDRAM), Static (SRAM), Cache
* ROW (not volatile): ROM (PROM, EPROM, EEPROM), Flash (USB...)
* Each app has its memory space and others can't access it
</div><div>

</div></div>