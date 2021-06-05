# Constructors

[Go back](..)

Now you need to create some object, meaning an instance/representation
of your class where you gave values to the attributes.

A constructor is a method, without a return type, having the
name of the class. You can have multiple constructor with different
arguments.

* **by default**, all classes have a constructor taking no arguments
* if you create a constructor, the default one **is removed**

We are distinguishing 3 types of constructors

* empty constructor
* valued constructors (have parameters)
* constructor of copy (take an object of the class class in argument)

And note that you can call another constructor with ``this(
other constructor parameters)`` but this line **must** be the
first line of your constructor.

> **Advanced Note**: a constructor can be private/package/...
> according to your need. Trough in most case you will see public
> constructors.

## Example

```java
public class Person {
    private final String name;
    private int age;

    // constructors

    // no parameters
    public Person() {
        // calling Person(String name, int age)
        this("John doe", 0);
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

<div class="sr"></div>

**Static (class) constructor**

You have constructor for instances, but
you also have a class constructors! They are not taking parameters
since they are more like static blocs but could be used to init
static attributes (even trough we mainly use inline initialisation).

Syntax is

```java
import java.util.ArrayList;

public class Test {
    private static final ArrayList<Integer> list = new ArrayList<>();

    static {
        list.add(5);
        list.add(7);
        list.add(3);
    }
}
```

According to some tests, the static constructor seems to be called
when the class is loaded in memory, which is not necessarily 
at the start of the program.