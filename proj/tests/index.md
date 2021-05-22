# Tests

You must do some tests in order to check
if your code, or a project is working correctly.
In futures versions, they might help you find
some bugs.

But in order to write tests, you need to find the
part of your code needing some tests, which ones and
that can be hard.

So in this courses you will see

* the theory behind tests
* contact-programming methodology
* defensive-programming
* test-driven and behaviour-driven development
* how to find tests
* What are assertions

After learning theses, you should try writing some
tests by checking the ``tests`` part in others
languages courses such as ``Java``, `C`, `PHP`
or ``JS``. If you are aiming to learn by practicing
then language specific courses might be more of a help.

## Tests

You can be in one of those situations

* White-box testing : you know about the underlying code
* Black-box testing : you only know about things code from the documentation, meaning in and out
* Grey-box testing : we got a mix of both

More than situations, you usually choose one of theses
and write tests accordingly. Most of the time, tests
are **unit tests** : you test a part of the code.

Here some good practices before starting.

## Design by contract

You are literally writing some code while making the contract
with the caller that ``if the program (arguments, ...)
is in a correct state then after running this code it will
still be in a correct state``.

