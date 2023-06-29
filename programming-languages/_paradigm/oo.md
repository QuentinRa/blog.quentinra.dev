# Oriented-Object programming

<div class="row row-cols-md-2"><div>

Object-Oriented programming (**OOP**) 🧸 is a paradigm emphasizing the use of **objects** to encapsulate both data and code.

It often means a lot more code to write, but it's supposed to improve reusability and modularity. OOP is not applicable to all problems. 

At the very least, it can make the code easier to implement and maintain, especially in teams, as we can break the code into small junks and code them, roughly one at a time.
</div><div>

Some common concepts are:

* Encapsulation
* Inheritance
* Polymorphism
* Abstraction
* Open recursion
</div></div>

<hr class="sep-both">

## Classes and objects

<div class="row row-cols-md-2"><div>

A **class** can be seen as a **template**/blueprint 🖨️ to create objects. It defines an **abstract** concept, such as a person, a computer, a animal... while an **object** is **concrete** such as the person "John Doe" 🪆.

![Class and object](_images/class_and_object.png)

🗺️ The process of creating an object from a class is called **Instantiation**. Object are commonly called instances.

#### Attributes

A class has properties called **attributes** that are used to store data. For instance, each person has a name.

```java
class Person {
    public String name;
}
```

#### Methods

A class also has **methods** which are functions that can access attributes or other methods usually by using `this`/`self`/....

```java
class Person {
    [...]
    
    public void changeName(String name) {
        this.name = name; // set the attribute "name" to...
    }
}
```

➡️ In some languages, `this`/... is optional when implicit.
</div><div>

#### Constructors

We are usually constructors to instantiate a new object, which usually means initializing the attributes. A constructor is a [method](#methods).

```java
class Person {
    public String name;
    
    public Person(String name) {
        this.name = name; // init attribute "name"
    }
}
```

Instantiation is done by calling the constructor. Some languages are using the `new` keyword, some don't.

```java
Person johnDoe = new Person("John Doe");
// johnDoe.name is equals to "John Doe"
```

#### Members

Attributes and methods are usually called members. There are two categories of members: **instance members** and **class members**.

The former is the usual members. The latter are members belonging to the class, meaning that 

* every instance has the same value for an attribute

```java
public static final String DEFAULT_NAME = "John DOE"; // java
```

* we don't need a instance to access a member

```java
String defaultName = Person.DEFAULT_NAME;
```
</div></div>

<hr class="sep-both">

## Access control

<div class="row row-cols-md-2"><div>

Classes, methods, attributes, and many other concepts have some form of access control commonly done using a visibility modifier.

For instance, **C#** has a modifier called `internal` only allowing some classes in the same "output file" <small>(assembly file)</small> to use this class. 

```cs!
internal class XXX {} // same assembly only
```
</div><div>

Common modifiers are:

* **Java**: `private`, `protected`, `public`, `<none>` <small>(package-private)</small>
* **C++**: `private`, `protected`, `public`
* **PHP**: `private`, `protected`, `public`
* **C#**: `private`, `protected`, `public`, `internal`
* ...

➡️ Python devs are using naming conventions to determine the visibility, while in Ruby, modifiers are present but not enforced...
</div></div>

<hr class="sep-both">

## 👻 To-do 👻

Stuff that I found, but never read/used yet.

<div class="row row-cols-md-2"><div>

* parent, superclass, baseclass
* child/heir, subclass, derived class
</div><div>
</div></div>