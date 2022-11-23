# Stack

[Go back](../..)

Do you remember that `pc` is the current instruction and `lr` the next one?

Then, if you are calling a function, at the end of the code, the function must know what will be the next instruction but we only know that at the first line of our function like which line in the main should have been the next one so you need to store it.

Let's say you have in your main

```asm6502
4: mov r1, #13
5: bl max;
6: cmp r0, #13
```

and in max

```asm6502
max:
    ; pc = 10, lr=6
    10: mov r5, r0
    ; pc = 11, lr=6
    ; ...

    15: bl sprintfd ; another function
    16: ; pc = 16, lr = ???
.end
```

The value of lr may have been removed by the call of the printf function so we don't know how to go back to the main, save it using the stack rather than the register that can only be modified.

<hr class="sl">

The stack functions are taking the registers to save, you need to give them in an increasing order like r0 before r1.

You can use `-` to store an interval like `r0-r2` for r0, r1, r2.

```asm6502
push {lr}
pop {pc}

push {r0, r1, r2}
push {r0-r2}
```

Notice the `push lr - pop pc`, that's what you will have to do, push at the beginning et pop at the end for your function to work properly.