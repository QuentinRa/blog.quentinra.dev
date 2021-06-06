# MCQ about Introduction part

[Go back](..)

Protected members can be accessed

<blockquote class="spoiler">
By the class inheriting of this class (children)
and the classes in the same package.
</blockquote>

When the garbage collector will destroy a variable

<blockquote class="spoiler">
When a variable isn't referenced anymore.
</blockquote>

An instance method can use instance/class attributes ?
instance/class methods ?

<blockquote class="spoiler">
Yes for all.
</blockquote>

A class member can
* be used in a class/instance member?
* use a class/instance member?

<blockquote class="spoiler">
Class member can be used by class/instance members. But they
can only use class members.
</blockquote>

What's the difference between a primitive type variable
and a object variable ?

<blockquote class="spoiler">
primitive type variable = a value. object variable = a reference.
</blockquote>

What's ``package`` mode in Java?

<blockquote class="spoiler">
Any class in the same package=folder can access this class/method/
attribute/... Any members of this class can also access ...
</blockquote>

If I only have a valued constructor in my class,
how many constructor do I have? And If I don't have
any constructors in my class?

<blockquote class="spoiler">
In both case you will have <b>one</b> constructor. In the first
case that's the valued one. In the second case, that's the 
default, empty, one.
</blockquote>

When calling ``MyMethod(int arg)``, what's passed
to ``MyMethod``?. Same question for ``MyMethod(Object obj)``.

<blockquote class="spoiler">
<code>int</code> is a primitive type so that's the value that will be passed.
But <code>obj</code> is an object so that's the reference that will be passed.
</blockquote>