# Override

[Go back](../index.md#beginner)

You must have seen this annotation `@Override` a lot until now. In java, you can rewrite the code of a method declared in a parent class. Each time you are replacing the code of a method declared in an ancestor class, then you should (not mandatory) use `@Override`.

Ex:

* `finalize` is declared in Object class
* I want to change the behavior of `finalize` in my class
* All class are inheriting of Object so I can
* but I should `@Override` before `finalize` to explicitly tell that I'm overriding a method on purpose

Please take note of some constraints

* same name
* same return type
* same arguments

but not necessarily the same definition,

* you can add/remove `throws` (explained later)
* you can change the visibility : from protected to public (not from public to protected or from protected to private!)
* you can add annotations (explained later)