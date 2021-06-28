# Introduction

There a quite a lot of extremes programming methods, but
not all we be in this course

* SOLID, KISS, DRY, ... are in [Code guidelines](../guidelines/index.md)
* Test-driven, Behaviour-driven are in [Tests](../tests/index.md)
* Design patterns are in [Design patterns](../design-patterns/index.md)
but they may not be considered a part of extremes programming

In this course, we will introduce other extremes programming methods
like the Pair-programming or Model-driven programming.

<hr class="sr">

## Pair-programming

The simplest extreme method. It's usually used in
agile-projects. 

> Two persons and one computer, one code, while the
> other
> 
> * gives advices (help, improvements)
> * ask for explications about what's this part
>   of code is supposed to do (hint to add comments)
> * think about problems that may arise (like wrong
>   arguments or usages, ....)

The two should switch-roles at least once in a while. This
will help writing better code, maybe faster since "4
eyes are better than two". It quite useful to train
a new developers so I'm practicing that a lot when
starting a project with a less experienced developer
to make sure that they don't waste time on useless
stuff and increase their skills faster.

You got tools like VSC / IntelliJ allowing you to
work on your friend computer and code with him. This
may help debugging too, aside from remotely working
in pairs.

<hr class="sl">

## Model-driven development (MDD)

...

<hr class="sr">

## Documentation-driven development

That's something I came up with... or
[not](https://gist.github.com/zsup/9434452).

I trough according to the agile method, that It's
better when a programmer know what we are asking him
to code. So using this method, you should write the 
documentation and the programmer must code according
to the documentation. If something needs to be changed,
then changing the documentation comes first.

This is a sort of "design by contact" kind of methods
but it sure helps having a clear (and not too long)
description about what one should code.

**Writing documentation is tiring through** so don't 
forget **YAGNI** : don't code things
that are not needing right now ("I will need this later")
because that also means here more documentation.

<hr class="sl">

## Sources

* <https://medium.com/swlh/documentation-driven-development-f9a6d3258e5>
* <https://regisfreyd.com/documentation-driven-development>