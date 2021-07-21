# Special classes

[Go back](..)

Here we will summarize code related to class
declaration.

<hr class="sr">

## Inner and nested classes

It means a class inside another class. If the class is

* static: nested class /  ``classe imbriquée``
* not static: inner class /  ``classe interne``

```java
// outer class
public class AClass {
    // nested class
    private static class AnotherClass {}
    // inner class
    private class AnotherClass2 {}
}
```

If a nested class is not ``private``, then you should
really ask yourself if you shouldn't move it to
another file.

```java
public class AClass {
    public static class AnotherClass {}
}
```

means that you will write ``AClass.AnotherClass``
so something like ``AClass.AnotherClass v = new AClass.AnotherClass();``.

<hr class="sl">

## Anonymous class

In French, it's called ``classe anonyme / locale``.
This is a class that's not properly declared in the code
but created when the program is executed.

```java
Runnable r = new Runnable(){
    @Override
    public void run() {
        // ...
    }
};
```

Runnable is an interface and I created a class and
implemented the run method "on the fly".

<hr class="sr">

## Multiple classes in one file

You may see this a lot, but don't use it okay? You
may use for some tests but that's it. Be great and
use anything aside that.

```java
public class Main {
    // ...
}

class ClassA {}
class ClassB {}
```

You can only have one public class per file, but you
may have a lot of ``package``-level classes.