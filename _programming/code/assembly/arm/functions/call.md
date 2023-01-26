# Call

[Go back](../index.md#functions)

To call your function, you can't use `swi`. Just must use `bl`

Let's say we want to call a function `int max(int, int)` then we would have

```asm6502
mov r0, #5
mov r1, #13

; call max(5, 13)
bl max

; in r0, we got 13
```