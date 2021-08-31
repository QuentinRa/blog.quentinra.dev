# Tests

[Go back](../index.md#conditions)

Tests are used to set the flags NZCV. For instance, **cpm** (compare) is making the operation **Rn - Operand2**, meaning that the result of this operation will be used to set NZCV.

```asm6502
; Comparison : Rn - Operand2
cmp Rn, Operand2

; Comparison : Rn + Operand2
cmn Rn, Operand2

; Bitwise and, this is "&" in C, not "&&"
tst Rn, Operand2

; Bitwise exclusive OR
teq Rn, Operand2
```

