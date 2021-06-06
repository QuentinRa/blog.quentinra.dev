# MCQ about Beginner part

[Go back](..)

## Normal

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

What's this statement ``public interface Human implements Living {}``
(Living is another interface) ?

<blockquote class="spoiler">
The keyword is <b>wrong</b>, we should use <b>extends</b>. If extends
was used, then implementing Human would requires to also implements
Living methods.
</blockquote>

...

<blockquote class="spoiler">
</blockquote>