# Attributes

[Go back](../../index.md#vocabulary)

An attribute is the a property of a class used to store something. This is a variable, that belongs to each object (=instance attribute), or the class (=class attribute, static). An instance attribute could be the name for a person, as each object may have a different value for this property. A class attribute would be the number of persons, as this value is the same in every object.

An attribute has

* **a visibility**: public, private, ...
* **a special property**: final, static, volatile, ...
* **a type**: int, String, Float, float, ...
* **a name**
* may have a **default value** (but you should use what we call constructors instead).

**Notes**

* **final**: means that the attribute is a constant
* **static**: means the attribute is shared between every object

<hr class="sl">

## Example

```java
public class Person {
    // attributes
    public final String name;
    private int age;
    // example of default value without constructor
    private String country = "France";

   // ...
}
```

Note that you need to initialize a constant either using the default value, or inside every constructor (=a method creating objects).

<hr class="sr">

## Example (static)

We will use the keyword `static` to create an attribute owned by the class.

```java
public class Math {
    public static final float PI = 3.14f;
}
```

and we will call it using the name of the class

```java
System.out.println("PI:"+Math.PI);
```