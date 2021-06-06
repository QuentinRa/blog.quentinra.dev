# MCQ about Beginner part

[Go back](..)

How many primitives types there are in Java?

<blockquote class="spoiler">
<b>8</b>! Don't you dare forget this :(
</blockquote>

On how many bits char primitive type is defined?

<blockquote class="spoiler">
It's 16 bits and not 8.
</blockquote>

Could you guess what's this code doing ?

```java
class Math {
    private static final float value = 2.0;

    public static float increaseN(float n){ return n + value; }
}
```

<blockquote class="spoiler">
It's not working! <b>2.0</b> is a double not a float! But increase
n is working properly and return n plus the value 2.
</blockquote>

Which instruction are we using in java to goto the next
turn of a loop? (next, pass, continue, skip, do, goto)

<blockquote class="spoiler">
It's <b>continue</b> keyword!
</blockquote>

What's the difference between ``==`` and `equals`.

<blockquote class="spoiler">
None by default, they both check if two object have the same address.
But object can override <b>equals</b> and check the value
rather than the address. For primitives types, <b>==</b> is checking
the value.
</blockquote>

What's this code is doing ``object.equals(null)`` ?

<blockquote class="spoiler">
This code is returning false if object is not null, but if object
is null, we have <b>null.method(...)</b> meaning that we will
trigger a <b>NullPointerException</b>.
</blockquote>

What are we doing in this statement: ``public interface Human implements Living {}``
with Living another interface ?

<blockquote class="spoiler">
The keyword is <b>wrong</b>, we should use <b>extends</b>. If extends
was used, then implementing Human would requires to also implements
Living methods.
</blockquote>

How many methods a ``FunctionalInterface`` can have ?

<blockquote class="spoiler">
One abstract method, no other restrictions. 
</blockquote>

With A a superclass, and B a subclass, using **Liskov substitution principe**
(polymorphisme d'héritage), what statement are valid ?

- ``B v1 = new A()``
- ``A v2 = new B()``
- subclass instance can be considered as superclass instances
- superclass instance can be considered as subclass instances
- call a method on of `v2` only defined in class `B`
- call a method on of `v2` defined in class `A`

<blockquote class="spoiler">
Only the statements 2,3,6 are valid. In 5, v2 is of type A so
you can't call B methods (even if the real instance is of type B).
In statement 1, A don't have the new methods declared in B so that
won't work. Same answer for statement 4.
</blockquote>

In java >= 8, an interface can have

* constant class attributes ?
* non constant class attributes ?
* constant instance attributes ?
* non constant instance attributes ?
* concrete instance methods ?
* abstract instance methods ?
* class methods ?

<blockquote class="spoiler">
Concrete (since java>=8) or abstract methods. constant class attributes
and class methods.
</blockquote>

How do we call what we are doing when we are declaring a lot
of methods with the same name in a class?

<blockquote class="spoiler">
It's called <b>Overloading</b> (=overload=surcharge in French) a method.
</blockquote>