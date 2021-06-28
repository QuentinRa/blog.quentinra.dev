# Special classes

[Go back](..)

Here we will summarize code related to class
declaration.

<hr class="sr">

## Inner class

In French, it's ``classe interne / imbriquée``. It means
a class inside another class.

```java
public class AClass {
    private static class AnotherClass {}
}
```

If an inner class is not ``private``, then you should
really ask yourself if you shouldn't move it to
another file.

```java
public class AClass {
    public static class AnotherClass {}
}
```

means that you will write ``AClass.AnotherClass``
so something like ``AClass.AnotherClass v = new AClass.AnotherClass();``.