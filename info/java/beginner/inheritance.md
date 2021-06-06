# Inheritance

[Go back](..)

Unless a class is declared final ``final class Name``, you can
inherit of a class, but **only one** class. By default, a class
is inheriting of ``Object``. We are using the syntax
``extends ClassName`` to inherit of a class.

We will call the parent class : ancestor class or superclass.
And the children classes: subclasses.

Some notes

* subclasses inherit protected instance members
* subclasses inherit public instance members
* subclasses can use superclass static members (protected or public)
but you can't write ``@Override``, then only thing you can do
in a subclasses is writing a method with the same name.
* if a static method in not found in a subclass, then the superclass
will be checked.

<div class="sl"></div>

**super**

In an instance, you could use ``this`` to refer to the current
instance. Here we have a new keyword ``super`` referring to the
superclass.
* ``super(...)`` : call superclass constructor
* ``super.method(...)`` : call superclass method

<div class="sr"></div>

**Liskov substitution**

And finally, we have the **Liskov substitution principle**. When
you are creating a subclass, all properties of the parent are
inherited by the children and you may had new one. So the children
can be used in methods/... where the parent was used!

* when a method returns a superclass, you can return a subclass
* when a method take a superclass, you can give a subclass

but once you tell to Java that a subclass "is" a superclass,
**you can't use subclass-specific methods** until you cast it
to your subclass.

<div class="sl"></div>

## Example

We will create an ancestor class ``Person`` (or superclass)

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

And one inheritor, CEO.

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

but you can only call ``Person`` methods and not `CEO` methods
since you got a person, not a ``CEO``
for Java. You can try to cast ``person`` to CEO if you want to use
``CEO`` methods.