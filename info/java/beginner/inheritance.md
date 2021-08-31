# Inheritance

[Go back](../index.md#beginner)

Unless a class is declared final `final class Name`, you can inherit a class, but **only one** class. By default, a class is inheriting of `Object`. We are using the syntax `extends ClassName` to inherit a class.

We will call the parent class: ancestor class or superclass. And the children classes: subclasses.

Some notes

* subclasses inherit protected instance members
* subclasses inherit public instance members
* subclasses can use superclass static members (protected or public) but you can't write `@Override`, the only thing you can do in a subclass is writing a method with the same name.
* if a static method is not found in a subclass, then the superclass will be checked.

<hr class="sl">

## super

In an instance, you could use `this` to refer to the current instance. Here we have a new keyword `super` referring to the superclass.

* `super(...)`: call superclass constructor
* `super.method(...)`: call superclass method

<hr class="sr">

## Liskov substitution

And finally, we have the **Liskov substitution principle**. When you are creating a subclass, all properties of the parent are inherited by the children and you may add new ones. So the children can be used in methods/... where the parent was used!

* when a method returns a superclass, you can return a subclass
* when a method takes a superclass, you can give a subclass

but once you tell Java that a subclass "is" a superclass, **you can't use subclass-specific methods** until you cast it to your subclass.

<hr class="sl">

## Example

We will create an ancestor class `Person` (or superclass)

```java
// implicit extends to Object
public class Person {

    private final String name;

    protected Person(String name){
        this.name = name;
    }

    // can only be used by inheritor
    protected String getName() { return name; }
}
```

And one inheritor, the CEO class.

```java
public class CEO extends Person {
    private final String company;

    public CEO(String name, String company) {
        super(name); // call to parent constructor
        this.company = company;
    }

    // set to public
    @Override
    public String getName() { return super.getName(); }
    public String getCompany() { return company; }
}
```

And some **Liskov substitution principle** example

```java
Person person = new CEO("name", "company");
```

but you can only call `Person` methods and not `CEO` methods since you got a person, not a `CEO` for Java. You can try to cast `person` to CEO if you want to use `CEO` methods.

<hr class="sl">

## final

A class may be declared final, meaning that this class can't be inherited.

```java
public final class Main { }
```