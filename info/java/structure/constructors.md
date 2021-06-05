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
        this.name = "John doe";
        this.age = 0;
    }

    // valuated constructor
    public Person(String name, int age) {
        this.name = name;
        this.age = age;
    }

    // copy
    public Person(Person p) { this(p.name, p.age); }
}
```