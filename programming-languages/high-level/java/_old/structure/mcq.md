# MCQ about the Introduction section

[Go back](../../index.md#vocabulary)

This is a list of technical questions about the introduction section, feel free to add question or explanation if needed. Hope you will have fun 😁.

<hr class="sl">

## Question 1

Protected members can be accessed

<blockquote class="spoiler">
By the class inheriting of this class (children) and the classes in the same package.
</blockquote>

<hr class="sr">

## Question 2

When will the garbage collector will destroy a variable?

<blockquote class="spoiler">
This is up to him, but it's usually when a variable isn't referenced anymore.
</blockquote>

<hr class="sl">

## Question 3

Can an instance method use instance/class attributes? What about instance/class methods?

<blockquote class="spoiler">
Yes for all.
</blockquote>

<hr class="sr">

## Question 4

Can a class member

* be used in a class/instance member?
* use a class/instance member?

<blockquote class="spoiler">
A class member can be used by class/instance members. But they can only use class members.
</blockquote>

<hr class="sl">

## Question 5

What's the difference between a primitive type variable and an object variable?

<blockquote class="spoiler">
A primitive type variable is a value, while an object variable is a reference. You may also note that a reference can be null, while a value can't.
</blockquote>

<hr class="sr">

## Question 6

What's the use of the modifier `package` in Java?

<blockquote class="spoiler">
Any class in the same package=folder can access this class/method/attribute/... Any members of this class can also access ...
</blockquote>

<hr class="sl">

## Question 7

If I only have a valued constructor in my class, how many constructors do I have? And If I don't have any constructors in my class?

<blockquote class="spoiler">
In both case you will have <b>one</b> constructor. In the first case that's the valued one. In the second case, that's the default one.
</blockquote>

<hr class="sr">

## Question 8

When calling `MyMethod(int arg)`, what's passed to `MyMethod`? Same question for `MyMethod(Object obj)`.

<blockquote class="spoiler">
<code>int</code> is a primitive type so that's the value that will be passed. But <code>obj</code> is an object so that's the reference that will be passed.
</blockquote>