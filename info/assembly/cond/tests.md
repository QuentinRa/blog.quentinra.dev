# Tests

[Go back](..)

```asm6502
; Comparison : Rn - Operand2
cmp Rn, Operand2

; Comparison : Rn + Operand2
cmn Rn, Operand2

; bit-by-bit logic and, this is a & in C (not &&)
tst Rn, Operand2

; bit-by-bit logic exclusif or
teq Rn, Operand2
```

The result of a test is changing the NZCV flags
like ``cmp Rn, Operand2`` is evaluating `Rn - Operand2`
and if the result is negative then ``N`` flag will be true
etc.

