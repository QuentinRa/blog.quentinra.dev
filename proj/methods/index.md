# Introduction

You may already have ready about

* SOLID, KISS, DRY, ... are in [Code guidelines](../guidelines/index.md)
* Test-driven, Behaviour-driven are in [Tests](../tests/index.md)
* Design patterns are in [Design patterns](../design-patterns/index.md)

and in this course, we will introduce other methods
like the Pair-programming or Model-driven programming
that we couldn't introduce somewhere else.

<hr class="sr">

## Pair-programming

Quite a simple method. It's usually used in
agile-projects, one of the extreme programming
methods. 

> Two persons and one computer, one code, while the
> other
> 
> * gives advice (help, improvements)
> * ask for explications about what's this part
>   of code is supposed to do (hint to add comments)
> * think about problems that may arise (like a wrong
>   argument or an invalid usage)

The two should switch roles at least once in a while. This
will help writing better code, maybe faster since "4
eyes are better than two". It's quite useful to train
a new developer so I'm practicing that a lot when
starting a project with a less experienced developer
to make sure that they don't waste time on useless
stuff and increase their skills faster.

You got tools like VSC / IntelliJ allowing you to
work on your friend's computer and code with him. This
may help for debugging the code too, aside from remotely working
in pairs.

<hr class="sl">

## Model-driven development (MDD)

You will create a model during the conception
phase. Then your code will be the exact representation
of the model (same attributes, classes, ...),
at least the public part. If you need to add something,
then first change the model.

This method is quite powerful but will ask you to do
quite a lot of job during the conception
(since the development will be quite easy and fast).

* [User stories](mdd/user-stories.md)
* [Class diagram](mdd/class.md)
* [Sequence diagram](mdd/seq.md)
* And now code the application. Using StarUML
  you can generate Java code from UML.

Since I don't like wasting my time to fit a method pattern, I think
you should

* do a mockup of your application
  (with events... maybe in Boostrap/JS or using
  an app)
* then do the **MDD** method

By doing so, you will most likely find more 
things than doing, again and again, loops
using the sequence diagram to find missing
classes/attributes/relations... 
Using Boostrap/an app makes it easy to create
a mockup at least I'm doing this for all my
apps and I feel like it's worth it
(check [HMI](../hmi/index.md) course to get 
some tips/apps).

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

This is a sort of "design by contract" kind of methods
but it sure helps to have a clear (and not too long)
description about what one should code.

**Writing documentation is tiring through** so don't 
forget **YAGNI**: don't code things
that are not needing right now ("I will need this later")
because that also means here more documentation.

<hr class="sl">

## Data-driven programming

*note*: beware that data-driven is also used BigData
but that's not the same, we even added "programming".

For this one, you don't need a course, you are most likely
using it. Simply make a program that will adapt itself
according to the data provided.

Something like making a file for the configuration
and parsing it, making files for the view and render
them, making files for your data like the NPC/Quests/...
in an RPG instead of writing everything in the code.

When you do that, someone can easily change the
data without changing the code (or someone should
be able to). If that's the case, then your program
is "data-driven".

<hr class="sr">

## Sources

Documentation-driven development

* <https://gist.github.com/zsup/9434452>
* <https://medium.com/swlh/documentation-driven-development-f9a6d3258e5>
* <https://regisfreyd.com/documentation-driven-development>

Data-driven programming

* <https://en.wikipedia.org/wiki/Data-driven_programming>
* <https://cs.stanford.edu/people/eroberts/courses/cs106a/handouts/56-data-driven-programs.pdf>
* <https://simplicable.com/new/data-driven>