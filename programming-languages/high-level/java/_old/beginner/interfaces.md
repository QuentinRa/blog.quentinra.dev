# Interfaces

<hr class="sr">

## Functional interfaces

We are calling like that interface with only **one method without a body** (=one abstract method).

```java
@FunctionalInterface
public interface Human {
    String getName();
    default int getAge() { return 0; }
}
```

These are used in what we call **lambda expressions**. Since they only have one method, then we can write

```java
Human h = () -> "John Doe";
```

Here we are writing that

* the method getName (without argument so `()` is empty, otherwise, we would write the name without the type of the argument)
* is returning `"John Doe"`

A lot of people are using that for events-related classes, in graphical interfaces.

Here another example

```java
@FunctionalInterface
interface Human {
    String getName(boolean uppercase);
}
```

and 

```java
// no type before u, and even the name can be changed
// like u, everything will be inferred
Human h = (u) -> {
    String r = "John Doe";
    return u ? r.toUpperCase() : r.toLowerCase();
};
// ok: JOHN DOE
h.getName(true);
```