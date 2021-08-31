# File Structure

[Go back](../index.md#syntax)

```asm6502
@ constantes called with #constante
.equ nom, valeur  constantes

        .arm
        .data

@ declare variables
name: type value

        .text
        .global _start

_start:

    @ instructions ...

.end
```

The label `_start` is a sort of function name. It's referencing somewhere in the code (the `_start:`) where the code associated with the function is.

This label is special though, it's the `main` function label. When running `a.out` that's this label code that will be run.

**Note**: when calling a `main` in C, you may or not add a `return` at the end. In assembly, you must call exit instructions at the end otherwise your program will crash.