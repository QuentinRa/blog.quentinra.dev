# Declaring a class in Java

[Go back](..)

**Note**

* the name of a class start with an **UpperCase**
* the name of a file like ``Name.java`` means that the (public)
class inside is named ``Name``.
* you **must** use the ``CamelCase`` notation 
  (no spaces, use an upper case: Accounting table becomes
  the class AccountingTable)

<div class="sl"></div>
  
Then in a file **Person.java**

```java
public class Person {
    // attributes
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

    // setters

    void increaseAge(){ this.age++; }
    public void setAge(int age) { this.age = age; }

    // getters

    public int getAge() { return this.age; }
    public String getName() { return name; }
}
```

<div class="sl"></div>

**Constructors**

Here you have what we call **constructors**. They
are what we will use to create objects. An **object** "is created"
when we are giving values to the attributes, meaning that's an
**instance** or a realisation of the class.

We will create an object like this, with some methods calls.

```java
Person johnDoe = new Person();
Person marieLei = new Person("Marie Lei", 25);
Person marieLeiCopy = new Person(marieLei);
```

The keyword **this** is used to refer to the object created. Meaning
in a class you can use ``this.myMethod`` or `this.anAttribute`
but the keyword may be omitted.

<div class="sl"></div>

**Methods**

We created some methods. Some methods are particular, they are
called **getters** and **setters**.

A getter returns a value and a setter set a value in the class.
In Person class, you only have getters and setters. Note
that a getter usually starts with ``get...`` and a setter
usually starts with ``set...``.

```java
// calling methods
System.out.println("Name is "+johnDoe.getName()); // John doe
System.out.println("Name is "+marieLei.getName()); // Marie Lei
System.out.println("Name is "+marieLeiCopy.getName()); // Marie Lei

marieLei.increaseAge();
System.out.println("Marie Lei age is "+marieLei.getAge()); // 26
System.out.println("Marie Lei age is "+marieLeiCopy.getAge()); // 25
```

<div class="sl"></div>

Now try it yourself, you must try

* add others attributes
* add others getters
* add others setters
* add a least one constructors