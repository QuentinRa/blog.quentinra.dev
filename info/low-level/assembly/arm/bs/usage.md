# Usage

[Go back](../..)

The form is like

```none
{op}{cond}{S} Rd,Rn,Rb, shift_type shift_amount
```

* `op` is `add`, `mov`, ...
* `cond` is `ne`, `eq`, ...
* `s` is the save flag
* then you have your registers (Rd, Rn)

and now instead of `Operand2`, you could write

* `Rb`, a register that will be used for the shift, but whose value won't be changed
* `shift_type`: ASR, LSL, ...
* `shift_amount`: xxx value

Giving us something like this

```asm6502
; r is shifted by 2
add r0, r0, r1, lsl #2
```