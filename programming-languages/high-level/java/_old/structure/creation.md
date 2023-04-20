# Creating objects

[Go back](../../index.md#vocabulary)

We will use the `new` keyword to create objects. Simply write `new ClassName(constructor argument, ...)` to create an object.

<hr class="sl">

## Example

Using the previous constructor we created, we can write

```java
Person johnDoe = new Person();
Person marieLei = new Person("Marie Lei", 25);
Person marieLeiCopy = new Person(marieLei);
```