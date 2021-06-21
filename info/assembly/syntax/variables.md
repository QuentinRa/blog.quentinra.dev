# Variables

[Go back](..)

The syntax was

```asm
label: type value
```

With type

* ``.ascii``: string converted to ascii
* ``.asciz``: same but add a `\0` at the end
* ``.word``: a int

```asm
val: .word 4
```

or to create an array

```asm
tab: .word 1,5,7,46,89
taille: .
```

The ``dot`` means the number of numbers we wrote
**right before** so 5 here. Do it right after your
tab declaration or it won't work.