# Methods

[Go back](../index.md#vocabulary)

A method is the same as a similar to a function in C. You are declaring methods inside a class, taking attributes and maybe returning a value. Each method have an implicit parameter **this**, that is the object calling the function.

A method can have

* **a visibility**: public, private, ...
* **a special property**: final, static, ...
* **a return type**: Object, int, ...
* **a name**
* some arguments

<hr class="sl">

## Example (instance)

```java
public class Person {
    private String name = "John Doe";

    public void setName(String newName) {
        this.name = newName;
    }

    public void resetName() {
        this.setName("John Doe");
    }
}
```

Then, we can call an instance method like this


```java
// explained later, constructor, creating an instance
Person p = new Person();
// setter
p.setName("Jane Doe");
p.resetName();
```

<hr class="sr">

## Terminology

* **Getters and setters** 🤲

Some methods are particular, they are called **getters** and **setters**. A getter returns a value and a setter sets a value in the class. A getter usually starts with **get...** and a setter usually starts with **set...**.

* **final method** 🔒

Declaring a method **final** means that no one can override it (explained later).

* **this keyword** 👈

You can use the keyword **this** to call an attribute/method of/on the current object. The keyword is **optional** but that's a good practice to use it.

* **class/instance** 📦

In a class method, you can't use instance attributes/methods since you need an instance. But in instance methods, since you got the class, you can call class attributes/methods.

* **Address** 📬

In Java, the notion of address doesn't exist. You are calling a method using a parameter

* if it's a primitive type: then the value is passed
* if it's an object: a reference is passed

A reference is simply something that's referencing your object meaning that you can change the attributes/call methods on it, and the real object will be modified, but you can't "destroy"your object because that's simply a reference.

<hr class="sl">

## Example (class)

We will write a method that does not use "this", so this is a static method (owned by the class).

```java
public class Math {
    private static final float PI = 3.14f;

    // some stupid method
    public static int simpleRound(float f){ return (int) f; }
    
    // getter
    public static float getPI() { return Math.PI; }
}
```

Then you can call a class method like this

```java
// 3
System.out.println("PI:"+Math.simpleRound(Math.getPI()));
```