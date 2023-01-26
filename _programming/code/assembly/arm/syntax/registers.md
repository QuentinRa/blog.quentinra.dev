# Registers

[Go back](../index.md#syntax)

Register are where we will store the data we will use to call instructions. 

Most of them may be used to store data for a function call or for the function to store the result but some of them are special so you must remember all of them.

* `r0` to `r6`, `r8` to `r10` are used to store values
* `r7`: store system call value
* `r11`: store fp (Frame pointer)
* `r12`: store ip (Intra Procedural Call)
* `r13`: store sp (Stack Pointer)
* `r14`: store lr (Link Register)
* `r15`: store pc (Program Counter)

Since you should not know this but

* `pc` is the address of the current instruction being executed
* `lr` is the address of the next instruction
* `sp` is the address of the stack
* `ip` is ??? (not used yet)
* `fp` is ??? (not used yet)