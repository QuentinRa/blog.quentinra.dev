# Constructors

[Go back](../index.md#vocabulary)

A constructor is a method, without a return type, having the name of the class. You can have multiple constructors with different arguments. They are used to create objects.

* **by default**, all classes have a constructor taking no arguments
* if you create a constructor, the default one **is removed**

We are distinguishing 3 types of constructors

* empty constructor 🗑️
* valued constructors (have parameters) 😎
* constructor of copy (take an object of the class in argument) 🖨️

And note that you can call another constructor with `this(other constructor parameters)`, but this line **must** be the first line of your constructor.

> **Advanced Note**: a constructor can be private/package/... according to your need. Though in most cases you will see public constructors.

<hr class="sl">

## Example

```java
public class Person {
    private final String name;
    private int age;

    // constructors

    // no parameters
    public Person() {
        // calling Person(String name, int age)
        this("John Doe", 0);
    }

    // valuated constructor
    public Person(String name, int age) {
        this.name = name;
        this.age = age;
    }

    // copy, calling Person(String name, int age)
    public Person(Person p) { this(p.name, p.age); }
}
```

<hr class="sr">

## Static (class) constructor

You have a constructor for instances, but you also have a class constructor! They are not taking parameters since they are more like static blocs but could be used to init static attributes (even though we mainly use inline initialization).

Syntax is

```java
public class Math {
    private static final float PI;

    static {
        PI = 3.14f;
    }
}
```

According to some tests, the static constructor seems to be called when the class is loaded in memory, which is not necessarily at the start of the program.