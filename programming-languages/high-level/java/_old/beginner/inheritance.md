# Inheritance

* subclasses can use superclass static members (protected or public) but you can't write `@Override`, the only thing you can do in a subclass is writing a method with the same name.
* if a static method is not found in a subclass, then the superclass will be checked.

<hr class="sl">

## super

In an instance, you could use `this` to refer to the current instance. Here we have a new keyword `super` referring to the superclass.

* `super(...)`: call superclass constructor
* `super.method(...)`: call superclass method

<hr class="sl">

## Example

We will create an ancestor class `Person` (or superclass)

And some **Liskov substitution principle** example

but you can only call `Person` methods and not `CEO` methods since you got a person, not a `CEO` for Java. You can try to cast `person` to CEO if you want to use `CEO` methods.

<hr class="sl">

## final

A class may be declared final, meaning that this class can't be inherited.

```java
public final class Main { }
```