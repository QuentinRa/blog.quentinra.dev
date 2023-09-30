# Sequence diagram

[Go back](../index.md)

This diagram is a representation of the program's lifetime. You will have the timelines of your objects and add the methods called and their arguments.

<hr class="sr">

## Synopsis

This is a short story about what the diagram will represent. It's

* **short**: 3 to 5 sentences
* **instanced**: do not write "An User ..." but "Mickael ..."
* **easy to understand**:
    * only 3 to 5 use cases*
    * can be understood by a non-computer scientist

(*) If you don't know what are "use cases" then you MUST check the UML diagram "use case diagram" since you will select some use cases and show how they are called inside the sequence diagram.

<hr class="sl">

## System sequence diagram

A system sequence diagram is a sequence diagram considered to be a black box. You don't know the methods called or the arguments, so you won't be able to add them.

You will write a diagram having a lot of actors with a lifeline, and at the end of it, the actor may die. An actor is an object of your program, but it may be a person if needed. For instance, you can add an actor "Mickael" calling the "main" method to start the program. Anyway, it looks like this

![SSD](images/utGeBaaiAYdDpU7YL7BAJrAmKWX8BIhEprDIq8rMBafDYRLJK7BCoKnEHPAnKiX8pSd91-f0bm7gCG02DxTONQ0-LFEi5FApkJWTKlDIWBO10000.png)

You read this diagram as

* an object of the class Person is stored inside a variable **Bob** 
* an object of the class Person is stored inside a variable **Alice**
* bob is calling the method "hello" on Alice
* the method is returning "ok"

Usually, we are drawing a little rectangle to show the duration of the method call, and we add a number representing the order of the program execution

![Call](images/seq2.png)

<hr class="sr">

## Sequence diagram

The idea will be the same as above but instead of simply writing "hello" or "ok", we are going to use the program methods, the argument, and the correct return type.

For instance, if the method hello is taking an argument "from" which is the one greeting, we would write ``hello(Bob)`` instead of ``hello``.

We will also add a call when we are asking for an object to be created / destroyed like "&lt;&lt;create&gt;&gt;" or you may add arguments like "&lt;&lt;create("Bob")&gt;&gt;". A constructor is returning the object created. You may add a cross at the end of the timeline of an object to show that it got destroyed.

<hr class="sl">

## Messages

* **asynchronous messages**

That's a message that does not return something (void is considered as something). In such a case, the caller won't wait for the return, it will continue the execution, so we will have code running in parallel of ours.

* **self messages**

This is a message where the arrow is starting and ending in the same lifeline. Nothing special.

* **notes**

There is no "return" if there is no "call".

"A" can only call a function on "B" if the function exists in "B".

If an object "a" is calling a method on "b", then in the class diagram (if you got one), their classes MUST be linked.

<hr class="sr">

## Sequence Fragments

In French, we call those ``Cadres d’interactions``. They are allowing us to use loops, if, ... in our diagram.

* [alt/opt](frag/alt.md)
* [loop](frag/loop.md)
* [sd/ref](frag/sd.md)
* [par/seq/critical](frag/par.md)
* [break](frag/break.md)