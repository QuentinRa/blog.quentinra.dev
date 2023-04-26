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

There are usually constructors to instantiate new object, which usually mean filling the attributes. Refer to [methods](#methods).

```java
class Person {
    public String name;
    
    public Person(String name) {
        this.name = name;
    }
}
```

Instantiation is done by calling the constructor. Some languages are using the `new` keyword, some don't.

```java
Person johnDoe = new Person("John Doe");
// johnDoe.name is equals to "John Doe"
```

</div><div>

#### Methods

A class also has **methods** which are functions that can access attributes and other methods of the class usually using `this`/`self`/....

```java
class Person {
    ...
    
    public void changeName(String name) {
        this.name = name;
    }
}
```

➡️ In some languages, `this`/... is optional when implicit.

#### Members

Attributes and methods are usually called members. 

</div></div>

<hr class="sep-both">

## 👻 To-do 👻

Stuff that I found, but never read/used yet.

<div class="row row-cols-md-2"><div>

* visibility
</div><div>

</div></div>