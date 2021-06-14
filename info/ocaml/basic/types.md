# Types

[Go back](..)

* ``int`` : number like 5 or hexadecimal value such as0x29a
* ``float`` : real like 0.5
* ``bool``: false, true
* ``char``: 'a'
* ``string``: "Hello"

And ``unit``. You should not see this one unless you are
doing something wrong like using a **non-pure** method
but you can't do otherwise if you want to print some values
(printf don't returns something and can fails so that's
not a functional methods and that's a unpredictable function).

You may create new types, but that will be explained later,
along with coupling some variables.

But you **need** to know that when ocaml don't know a type,
he will use ``'a`` or `'b` or ...