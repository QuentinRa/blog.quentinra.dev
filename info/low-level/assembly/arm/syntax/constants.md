# Constants

[Go back](../index.md#syntax)

Constant are called immediate constants because they are not constants. We are not talking about `.equ` but when in the program you are writing `#0` for the value 0 (for instance).

In the rest of the course, `Operand2` may be a constant.

The problem is that this immediate constant is not a 32 bits number (int) but a **12 bits** variable so you can't use some values.

The first 4 bits are the rotation. And the 8 bits are the value.

Place the 8bits at the end of a 32bits variable like you got 32 zeros but replace the 8 last ones with the last 8 bits of the constant. Then, you must move your bits, clockwise by $2^{rotation}$.

<hr class="sr">

## Example: from constant to decimal

Taking an example, we would have

* $0001\ 00000001$
* on 32 bits $00000000\ 00000000\ 00000000\ 00000001$
* 0001 in base 2 = 1 in base 10
* so the rotation is $2^1 = 2$
* $1/2$
* $(10000000\ 00000000\ 00000000\ 00000000)_2$
* $2/2$
* $01000000\ 00000000\ 00000000\ 00000000$
* and our number is ...
* $1073741824 = 2^{30}$

<hr class="sl">

## Example 2.1: from decimal to constant

**Test with 748 326**

* write on 32 bits $00000000\ 00001011\ 01101011\ 00100110$
* oh no... 19 bits can't fit a 8bits value
* fail

<hr class="sr">

## Example 2.2: from decimal to constant

**Test with 32000**

* write on 32 bits $00000000\ 00000000\ 01111101\ 00000000$
* 7 bits fit on 8 bits so we are good
* value (8bits): $01111101$
* trying to guess the rotation
* $00000000\ 00000000\ 00000000\ 01111101$
* I need to rotate by 24 to have back my 32 bits number
* but... I can't write $2^n = 24$
* fail

<hr class="sl">

## Example 2.3: from decimal to constant

Test with $-58$

* write on 32 bits $10000000\ 00000000\ 00000000\ 00111010$
* 7 bits fit...
* value (8bits): $11101010$
* we have $00000000 00000000 00000000 11101010$
* this time, I only need to rotate 2 times
* so I have $2^n = 2$ for $n=1$
* rotation (4 bits): $0001$ (equals to n=1)
* so I will store $0001\ 11101010$
* done