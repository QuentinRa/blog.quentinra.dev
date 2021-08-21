# NullObject

[Go back](..)

In a NullObject, methods are coded using the default behavior

* throws exception (ex: unsupported operation)
* returns false
* return 0, null, undefined, 0.0, etc.
* returns another NullObject

They are used to let the programmer choose **when** or **how** he will handle the NullPointerException, because in some cases, he might not want to handle it at all, and use the default value.

* ✅ : some flexibility
* 🚫 : one more class to maintain