# Special classes

[Go back](../index.md#advanced)

Here we will summarize code related to class declaration.

<hr class="sr">

## Inner classes

It means a class inside another class, the class **is not static**.

```java
// outer class
public class OuterClass {
    // inner class
    public class InnerClass {}
}
```

And you can write

```java
OuterClass o = new OuterClass();
OuterClass.InnerClass i = o.new InnerClass();
```

Usually the `InnerClass` is private so you are not doing that and only using it inside the OuterClass like you would do normally (`new InnerClass()`), but the inner class can access the current instance attribute.

## Nested classes

It means a class inside another class. If the class is the class **is static**.

```java
// outer class
public class OuterClass {
    // inner class
    public static class NestedClass {}
}
```

And you can write

```java
OuterClass.NestedClass n = new OuterClass.NestedClass();
```

If a nested class is `public`, then you should really ask yourself if you shouldn't move it to another file.

This time you can use the instance attribute since you don't have an instance but you can use the class attributes inside the `NestedClass` since it's a class member.

<hr class="sl">

## Anonymous class

In French, it's called `classe anonyme / locale`. This is a class that's not properly declared in the code but created when the program is executed.

```java
Runnable r = new Runnable(){
    @Override
    public void run() {
        // ...
    }
};
```

Runnable is an interface and I created a class and implemented the run method "on the fly".

<hr class="sr">

## Multiple classes in one file

You may see this a lot, but don't use it okay? You may use it for some tests but that's it. Be great and use anything aside from that.

```java
public class Main {
    // ...
}

class ClassA {}
class ClassB {}
```

You can only have one public class per file, but you may have a lot of `package`-level classes.