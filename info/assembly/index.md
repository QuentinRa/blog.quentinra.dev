# Assembly (ARM)

You will usually run some programs on your computer.
These programs are written in the machine language,
so many 0 and 1. The level higher than binary
code is assembly. That's an human-readable language
of the machine code. You may use that a lot of you
do what we call "reverse-engineering" like exploring
the code of a program.

You can learn about Intel assembly but here we will
learn about ARM processor assembly language. The reason
of that choice is because the RISC family of processors
whose ARM belong to is still quite used.

<div class="sl"></div>

## Introduction

First you need a RISC kind of processor. If you got
a raspberry (cost is around 30$) then you should use it.
You can also use this 
[great online tool](https://azm.azerialabs.com/) to write some code
but you won't be able to compile it.

The commands that we will use are

* ``as``: assemble, create a `.o` file
* ``ld``: link, create a `.out` file

If you got good eyes, you should have notice that this
is the same that in C, with ``gcc -c``(.o) and `gcc` (.out).
That's really is the case, in fact you can fix assembly
code with ``C`` code and doing that helped me quite a
lot to learn assembly, like writing the code in ``C`` then
removing the function in C and writing it in ``ARM``.