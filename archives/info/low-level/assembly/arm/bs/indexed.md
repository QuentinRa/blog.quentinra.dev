# Complex shifts

[Go back](../..)

**Pre-indexed**

You can make a shift before loading in Rd a value at an address

```asm6502
ldr r3, [r2, #-8]
; | cond | 010 | 0 | 0 | 0 | 1 | 0010 | 0011 | 0000 0000 1000 |
; condition (eq, ...) | 010 = code de ldr | pré-indexed ? | unsigned ? | write back ? |
; 1 | r2 (shifted register) | r3 (destination register) | constante

ldr r3, [r2, r1, lsl#16] @ r3 = r2 + r1 * 2^16
; | cond | 010 | 1 | 0 | 0 | 1 | 0010 | 0011 | 10 000 | 00 | 0001 |
; condition (eq, ...) | 010 = code de ldr | pré-indexed ? | unsigned ? | write back ? |
; 1 | r2 | r3 | shift amount : 16 | type de shift : 00 = lsl | r1
```

You can add a `!` to change the shifted register.

```asm6502
ldr r3, [r2, #-8]!
```

**Post-indexed**

You can make a shift after loading in Rd a value at an address

```asm6502
ldr r3, [r2], r1
```