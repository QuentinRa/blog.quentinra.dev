# ARM Assembly

<div class="row row-cols-md-2"><div>

Assembly language are low-level language directly interacting with the processor such as an Intel processor.

ARM assembly is one of the assembly language used for **RISC processors** <small>(Reduced Instruction Set Computing)</small> such as ARM processors.

* 🧐 Simplified instruction set compared to CISC processors
* 🚀 Usually more performant
* ⚡ Usually has a lower power consumption
* 📱 ARM processors are quite used in IoT/embedded systems/...

➡️ It's worth noting that you can use both Assembly and C together by using `gcc -c file.c` to generate an object file. You can dump the assembly code of a C program with `objdump -d a.out`.
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
</div></div>

<hr class="sep-both">

## 👻 To-do 👻

Stuff that I found, but never read/used yet.

<div class="row row-cols-md-2"><div>

* [old](_old.md)
* SIMD (Single Instruction Multiple Data) instruction set
* [azerialabs](https://azm.azerialabs.com/)
</div><div>

* disassemble command

</div></div>