# Instructions

[Go back](../..)

Our news instructions are

* **LSL (Logical Shift Left)**

Move xxx bits to the left, new bits are set to 0. Not fitting bits are lost (left).

Example: `111111111111...` LSL by `4` will becomes `11111111...0000`.

* **LSR (Logical Shift Right)**

Same as LSL but to the right.

Example: `111111111111...` LSR by `4` will becomes `0000111111111111...`.

* **ASR (Arithmetic shift right)**

We are writing xxx times the sign bit, then Rb. Not fitting bits are lost (right).

Example: `001110001000...` ASR by `4` will becomes `0000001110001000...` (xxx=4 zeros since the first
was a zero).

* **ROR (rotate right)**

The last xxx bits of Rb register then Rb. Not fitting bits are lost (right).

Example: `001110001000...0010` ROR by `4` then we add the xxx first and then your register `0010001110001000...`

* **RRX (rotate right Extended)**

RRX is a bit more complicated

* the old carry bit becomes the first bit
* the old last one bit becomes the new carry bit
* then add Rb

`001110001000...0010` with a carry of `1` RRX by `4` becomes

* carry: ``0``
* value: ``1001110001000...``