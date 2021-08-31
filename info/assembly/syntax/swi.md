# Make a system call

[Go back](../index.md#instructions)

To make a system call, you need to set the parameters so the values into the registers but you also need to put in `r7` the system call value like `1` for exit (check system call section).

Then simply write

```asm6502
swi #0
```

for software interaction, that will process the system call.

> Some are using `svc` instead of `swi`