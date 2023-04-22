# Defensive programming

[Go back](../../../../../../programming-languages/high-level/java/_old/index.md#tests-with-junit)

In Java, you might use [Objects](https://docs.oracle.com/javase/8/docs/api/java/util/Objects.html) methods to do safe operations

* `Objects.requireNonNull(obj)`
* `Objects.equals(obj, another)`
* `ObjectstoString(obj)`

And if an argument is invalid, raise

* `IllegalStateException`: the program can't continue like some attributes/... are not valid or some preconditions are not respected.
* `IllegalArgumentException`: if an argument is invalid like null given etc...