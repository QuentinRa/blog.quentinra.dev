# Arithmetic instructions

[Go back](..)

Note that 

* ``Rd`` : destination register, for instance ``r0``
* ``Rn`` : from register, for instance ``r0``
* ``Operand2`` : a value like `#0` for 0

```asm6502
@ Rd = Rn + Operand2
add Rd,Rn,Operand2

@ Rd = Rn - Operand2
sub Rd,Rn,Operand2

@ Rd = Operand2 - Rn
rsb Rd,Rn,Operand2
```

