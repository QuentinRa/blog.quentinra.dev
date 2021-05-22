# NullObject

[Go back](..)

In a NullObject, methods are coded using
default behaviour

* throws exception
* returns false
* return 0, ...
* returns another NullObject

They are used to let the programmer choose when or how
he will handles the NullPointerException, because
in some cases he might not want to handle it
at all an use the default value.

* ✅ : some flexibility
* 🚫 : one more class to maintain