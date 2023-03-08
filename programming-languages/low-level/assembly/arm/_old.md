# Assembly (ARM)

Comments are made with `@` or `#` or  `;`.

For the latter, you should remember that you don't have a lot of registers. And what if a function calls another one? You may want to know how you should manage your registers for that (like pc and lr registers might become messed up after a function call).

* [Stack](functions/stack.md)

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