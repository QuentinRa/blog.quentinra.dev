# Examples

[Go back](..)

Basic example

```asm6502
mov r0, #6 @mets 6 dans r0
; test if r0 value is 6
; remember that the test is doing
; Rn - Operand2
; so 6 - 6 = 0 here
; then guess the flags with that (Z = true, ...)
cmp r0, #6

; is Z is true then add 6
addeq r0, #6
; if Z is false then add 4
addne r0, #4
```

s flag example

```asm6502
mov r0, #2
; test if r0 (2) is equals to 6
; 2-6 = -4
; Z = false, N = true ...
cmp r0, #6

; if Z is false, then add 4
; and change NZCV with
; 2+4 = 6
; Z = false, N = false, ...
addnes r0, #4
```