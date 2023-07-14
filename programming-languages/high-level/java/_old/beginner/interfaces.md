# Interfaces

[Go back](../index.md#beginner)

An **interface** is a new type of class, mainly used to ensure that a class will have some methods (as we did using abstract classes, but this time you can "implement" many interfaces)

* instance methods usually don't have a body (since Java8 they can using `default` keyword)
* static methods must have a body

We are using interfaces because a class can inherit one class, but many interfaces. With that, we can use the **Liskov substitution principle** with each interface `implemented` (that the keyword for inheriting interfaces).

<hr class="sr">

## Interface declaration

```java
public interface Human {
    // constants
    public static final int MAJORITY = 18;

    // some methods without a body
    public abstract String getName();
    public abstract int getAge();

    // a static method
    public static boolean areBothAdults(Human h1, Human h2) {
        return h1.getAge() >= MAJORITY && h2.getAge() >= MAJORITY;
    }
}
```

but we can remove a lot of keywords since they can be inferred

```java
public interface Human {
    int MAJORITY = 18;

    String getName();
    int getAge();

    static boolean areBothAdults(Human h1, Human h2){
        return h1.getAge() >= MAJORITY && h2.getAge() >= MAJORITY;
    }
}
```

<hr class="sl">

## Using an interface

Example of implementing one interface.

```java
public class Person implements Human {
    // Human
    @Override
    public String getName() { return ""; }
    @Override
    public int getAge() { return 0; }
}
```

Adding another interface, we could implement two interfaces like this

```java
public interface Living {
    int getHP();
    int getMaxHP();
}
```

```java
public class Person implements Human, Living {
    // Human
    // ...
    // Living
    @Override
    public int getHP() { return 0; }
    @Override
    public int getMaxHP() { return 0; }
}
```

<hr class="sl">

## Interface: extends

An interface can extends another interface

```java
public interface Human extends Living {
    default String getName() {
        return "John doe";
    }
}
```

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

<hr class="sl">

## This is a secret

Okay, this is something that almost no one know of. Interface can have **private methods** since Java 9.

```java
public interface Test {
    private void myPrivateMethod () {}

    private static void myPrivateMethod2 () {}
}
```