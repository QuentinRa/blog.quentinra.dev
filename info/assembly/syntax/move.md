# Move instructions

[Go back](..)

* ``Rd`` : destination register, for instance ``r0``
* ``Operand2`` : a value like `#0` for 0
* ``address``: it's an address like 0x...
or a ``=label`` where label is the name of a variable
  in ``.data``.
  
If you want to add a number in a register or move
a value in a register to another, then use ``mov``.

```asm6502
mov Rd, Operand2
```

If you want to load the value at an address into a register
then use ``ldr``

```asm6502
ldr Rd, =label
```

And you can move (store) a value inside a Register
Rd into an address using ``str``

```asm6502
str Rd, =label
```

<hr class="sr">

**Advanced**

You can add a 

* ``b``: load/store the first byte
* ``h``: load/store the first two bytes.

at the end of ldr/str (after options that we will
see later).