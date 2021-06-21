# Variables

[Go back](..)

The syntax was

```asm6502
label: type value
```

With type

* ``.ascii``: string converted to ascii
* ``.asciz``: same but add a `\0` at the end
* ``.word``: a int

```asm6502
val: .word 4
```

or to create an array

```asm6502
tab: .word 1,5,7,46,89
taille: .
```

The ``dot`` means the number of numbers we wrote
**right before** so 5 here. Do it right after your
tab declaration or it won't work.