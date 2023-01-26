# Arithmetic instructions

[Go back](../index.md#instructions)

Note that 

* `Rd` : destination register, for instance `r0`
* `Rn` : from register, for instance `r0`
* `Operand2` : a value like `#0` for 0

```asm6502
; Rd = Rn + Operand2
add Rd,Rn,Operand2

; Rd = Rn - Operand2
sub Rd,Rn,Operand2

; Rd = Operand2 - Rn
rsb Rd,Rn,Operand2

; exclusive or
eor Rd,Rn,Operand2
```

For the multiplication instructions, you got 3

```asm6502
; result in a 32-bits value in Rd
; can't store a lot of values in 32 bits
mul Rd, Rn, Rm

; 64 bits
; only for signed numbers
smull RdLo, RdHi, Rn, Rm

; 64 bits
; only for unsigned numbers
umull RdLo, RdHi, Rn, Rm
```

RdLo are the 32 bits with the lesser weight and RdHi are the 32bits with the higher weight.