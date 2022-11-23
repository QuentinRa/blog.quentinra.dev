# Declaration

[Go back](../index.md#)

As you could expect, that's the same file that for the main function but with another global name.

You can declare multiples functions in one file but I'm not doing that.

```asm6502
        .arm
        .data
        .text

        ; some documentation here
        ; prototype is: int max(int, int);
        .global max

max:
 ; code
 ; ...
.end
```