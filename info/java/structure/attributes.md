# Attributes

[Go back](../index.md#vocabulary)

An attribute has

* **a visibility**: public, private, ...
* **a special property**: final, static, volatile, ...
* **a type**: int, String, Float, float, ...
* **a name**
* may have a **default value** (but you should use what we call constructors instead).

You already know about visibility. You need to know these properties

* `final`: means that the attribute is a constant
* `static`: see next part

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