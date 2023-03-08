# Assembly (ARM)

Comments are made with `@` or `#` or  `;`.

<hr class="sr">

## Instructions

The main idea is that you will move values into the registers. The first register is the first argument of a function, ...

And the result will be stored in `r0`.

We will need instructions to set a value into a register. You may also need instructions to do arithmetic operations like +, -, ...

* [Move-related instructions](syntax/move.md)
* [Arithmetic-related instructions](syntax/arithmetic.md)

<hr class="sl">

## Functions

For the latter, you should remember that you don't have a lot of registers. And what if a function calls another one? You may want to know how you should manage your registers for that (like pc and lr registers might become messed up after a function call).

* [Stack](functions/stack.md)

<hr class="sr">

## Conditions

You can add a condition for an instruction to be executed only if the condition is true. These conditions are checking the 4 flags

* N: is the result Negative?
* Z: is the result zero?
* C: is the last carry value one?
* V: do we have an overflow?

Usually, the flags are only changed after calling a test function but you may add a `s` at the end of the previous instruction to change the flags like `add` can become `adds` or `addnes` where ne if the condition that we will learn right now.

* [Table of conditions](cond/table.md)
* [Tests](cond/tests.md)
* [Examples](cond/examples.md)

<hr class="sl">

## Loops

Also, note that we have a new instruction `b`, to move to a label like that

```arm
loop:
    ; r0 - 0
    ; Z = ???, N = ???, ...
    cmp r0, #0
    ; if Z is true, then move to exit label
    beq exit

    ; update r0, r0--
    sub r0, r0, #1

    ; loop again
    b loop
exit:
    ; ...
```

<hr class="sr">

## Barrel Shifter

You can modify what we called `Operand2` easily using some operators like `>>` or `<<` in C.

* [Instructions](bs/instructions.md)
* [Usage](bs/usage.md)

You will use a lot the Barrel Shifter when manipulating arrays since you need to move from an index to another without needing to do complex operations.

* [Complex shifts](bs/indexed.md)