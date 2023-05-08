# Java

<div class="row row-cols-md-2"><div>

Java is a well-known [object-oriented](/programming-languages/_paradigm/oo.md) programming language. It's maintained and owned by Oracle 🍵.

Java was designed as a cross-platform language. We write code once, and on any operating system, we would have the same output. This is done by executing the code on a virtual machine called **JVM**.

➡️ The current version is **Java 20** (2023). The [LTS](files/download.md#lts-jdk) is **Java 17**.

🗺️ Java developers heavily rely on reading/writing the [Javadoc](../javadoc/index.md).

```java
public class HelloWorld {
  public static void main(String[] args) {
    System.out.println("Hello, World");
  }
}
```
</div><div>

Java files have the extension `.java`. To compile it, you need a **JDK** <small>(Java development kit)</small>. The output is a `.class`. [Download JDK](files/download.md).

```shell!
$ javac HelloWorld.java # output: HelloWorld.class
```

To execute your compiled program, you need a **JRE** <small>(Java runtime environment)</small>. It's included in the JDK.

```shell!
$ java HelloWorld # name of the class with the main
Hello, World!
```
</div></div>

<hr class="sep-both">

## Core knowledge

<div class="row row-cols-md-2"><div>

#### Declare a variable

```java
int i = 5; // primitive type
Object o = new Object(); // object
```

<br>

#### Types

Java has **8** non-object types called **primitive types**. Aside from these, every other variable <small>(object)</small> has the type of a **class** 🤖.

*Each primitive type also have a class, as listed below:*

```java
boolean xxx = true || false; // Boolean 🤖 | 1 bit 
byte xxx = 127;              // Byte 🤖 | 8 bits
short xxx = 32767;           // Short 🤖 | 16 bits
char xxx = 'c';              // Char 🤖 | 16 bits ⚠️
int xxx = 42;                // Integer 🤖 | 32 bits
float xxx = 42.0f;           // Float 🤖 | 32 bits
double xxx = 21.0d + 21.0;   // Double 🤖 | 64 bits
long xxx = 42L;              // Long 🤖 | 64 bits
```

<br>

#### Conversions

Conversions are done using casting or parsing:

```java
// cast float to int
int xxx = (int) 13.0f;

// To parse into an "int", you use Integer 🤖
int xxx = Integer.parseInt("13");

// From primitive to object (☠️)
Float a = Float.valueOf(5);
float b = a.floatValue();
```
</div><div>

#### Print some text in the terminal

```cpp
System.out.println("Hello, World!");
System.out.println("Hello, " + variable + "!");
System.err.println("Hello, Exception."); // errors
```

<br>

#### Operators

Here is a list of most operators.

```java
// arithmetic
int sum = 5 + 5;          // 10
int substraction = 5 - 5; // 0
int product = 5 * 5;      // 25
int division = 6 / 5;     // 1
x += 1;                   // same as x = x + 1
x++;                      // same as x = x + 1
                          // see also: --, -=, *=, and /= 
// logical
if (5 == 5) {}         // true
if (5 != 5) {}         // false
                       // see also: >, >=, <, <=
if (!false) {}         // logicial NOT => true
if (true || false) {}  // logical OR => true
if (true && false) {}  // logical AND => false
if (true ^ false) {}   // logical XOR => true
````

<br>

#### Final keyword

This keyword is mainly used to create "constants", while it can also be used to limit inheritance.

```java
final int xxx = 5; // constant variable
```

➡️ A constant is a variable/attribute that cannot be reassigned again. For objects, we can STILL change their attributes <small>(e.g. setters still work)</small>.

```java
final Person person = new Person("xxx");
person.setName("yyy"); // ✅ works, named changed
person = null; // ❌ doesn't work
```
</div></div>

<hr class="sep-both">

## Control-flow structures

<div class="row row-cols-md-2"><div>

#### Branching

Usual if/else.

```java
if (true) { }
if (true) { } else {}
if (true) { } else if (false) {} else {}
```

Ternary operator: `condition ? value_if_true : value_if_value`.

```java
String value = true ? "true" : "false";
```

Switch-case <small>(without break, more than one case may be executed)</small>

```c
int variable = 1;
switch(variable){
    case 1: /* if variable==1 */; break;
    case 2: /* if variable==2 */; break;
    default:
        /* else */
        break;
}
```

#### Branching - enhanced switch

Using the enhanced switch, you can use blocks syntax, or inline statements syntax to avoid the traditional `break` syntax.

```java
switch (x){
    case v1 -> { /* ... */ }
    case v2, v3, v4 -> /* ... */;
    default -> /* ... */;
}

// switch-value with yield
String result = switch (s) {
    case "John", "Jane" -> "yes"; // inline
    default -> { // block
        int length = s.length();
        yield length % 2 == 0 ? "yes" : "no";
    }
};
```
</div><div>

#### Loops

In every loop, you can use `break` to exit the loop, and you can use `continue` to end the current iteration, and process to the next one.

```java
// usual loop - i in [0, 10[
for (int i = 0; i < 10; ++i) {}
// reverse loop - i in ]0, 10]
for (int i = 10; i > 0; i--) {}
// nested loop
for (int i = 0; i < 5; ++i) {
    for (int j = 0; j < 5; ++j) {}
}
```

```java
while(true) {}; // repeat while true
do {} while(true); // executed at least once
```

#### Loops - for each

The for each is a new loop to iter **Iterables**. Iterables can be arrays or collections <small>(ArrayList/...)</small>.

```java
for (int e: new int[]{ 5, 6, 7 }) {
    // e=5 then e=6 then e=7
}
```

#### Branching - Instanceof

Due to [Polymorphism](/programming-languages/_paradigm/oo.md#polymorphism), two objects may be stored in a variable of the same type, but have a different classes. You can check the class using:

```java
Object value = Integer.valueOf(5);
// Before JDK 14
if (value instanceof Integer) {
    Integer n = (Integer) value;
    System.out.println("this is a number:"+n);
}
// Since JDK 14
if (value instanceof Integer n){
    System.out.println("this is a number:"+n);
}
```

🔥 `instanceof` returns true is the class is the same as the given one, or a child class of the given one. A stricter approach only allowing the same class would be:

```java
if (a.getClass() == b.getClass()) { /* ... */ }
```
</div></div>

<hr class="sep-both">

## Classes

<div class="row row-cols-md-2"><div>

Java [classes](/programming-languages/_paradigm/oo.md#classes-and-objects) usually have their own file. It's named after the class. A class name is in **upper camel case** by convention.

```java
public class ClassNameHere {}
```

<br>

#### Packages

To make things cleaner, we usually use packages to group classes. A package is roughly equal to a folder.

```java
package com.lgs.memorize; // ./com/lgs/memorize/Test.java

public class Test {}
```

Aside from bundled classes, every other must imported:

```java
import java.io.File;
import java.io.*; // all classes in "java/io"
import static java.io.File.createTempFile; // a static method
```
<br>

#### Visibility

Each class/attribute/method/... has a visibility modifier determining [who](/programming-languages/_paradigm/oo.md#access-control) can use a method/access an attribute/...

For instance, if something is private, only methods/attributes in the same classes can access it.

| modifier | same class | same package | inheritors | anyone else |
|-----------|------------|--------------|-----|-----|
| public    | +          | +            |  +  |  +  |
| protected | +          | +            |  +  |     |
| package (**default**)   | +          | +            |     |     |
| private   | +          |              |     |     |

</div><div>

#### Attributes

As a reminder, [attributes](/programming-languages/_paradigm/oo.md) are used to store data.

```java
// Class
public static final float PI = 3.14f;
// Instance
public String name;
private final String country = "France";
```

<br>

#### Methods

From an instance method, you can access any class/instance member. For instance members, you can use `this` to explicitly reference the object calling a method <small>(i.g. for `a.b()`, inside `b()`, `this == a`)</small>

```java
// Instance
public void setName(String newName) {
    this.name = newName;
}

public void resetName() {
    setName("John Doe"); // "this." implicit
}
    
// Class
public static float xxx(float f) { return f; }
```

➡️ Methods to access an attribute are usually starting with `get` such as `getName`. They are called **getters**. Methods to set an attribute are usually starting with `set` and are called **setters**.
</div></div>

<hr class="sep-both">

## Instantiation

<div class="row row-cols-md-2"><div>

Classes are instantiated using the `new` keyword.

```java
Person johnDoe = new Person();
Person janeDoe = new Person("Jane Doe", 25);
Person janeDoeCopy = new Person(janeDoe);
```

This calls a special method in the class called **Constructor**. They have the name of the class, and no return type. You can have multiple of them. There is a **default parameterless constructor**, but it's removed when explicitly declaring a constructor.

```java
public class Person {
    ...

    // parameterless constructor
    public Person() {
        this("John Doe", 0); // call another
    }
    // valuated constructor
    public Person(String name, int age) {
        this.name = name;
        this.age = age;
    }
    // copy constructor
    public Person(Person p) { this(p.name, p.age); }
}
```
</div><div>

#### Dot operator

From an object, you can  call methods or access attributes <small>(according to the visibility of the member)</small> using the operator `.` (dot).

```java
johnDoe.setName("Jane Doe");
johnDoe.resetName();
```

For class members, this is the same, but with the name of the class:

```java
double pi = Math.PI;
```

<br>

#### Garbage collector

The **Garbage collector** is a process looking for unused variables <small>(meaning no more references)</small>, and destroying them, freeing up memory.

There is no way to know when the garbage collector will destroy a variable, but setting a variable to `null` may speed up the process.

```java
johnDoe = null;
```
</div></div>

<hr class="sep-both">

## Well-known types

<div class="row row-cols-md-2"><div>

#### Object

Every class inherit from the class Object implicitly.

```java
class Object {
    // compare two object
    public boolean equals(Object obj);
    
    // equals => same hashcode
    public int hashCode();
    
    // clone an object, not accessible by default
    protected Object clone();
    
    // returns the object as a string
    public String toString();
    
    // called before destroying object
    protected void finalize();
}
```

👉 `a.equals(b)` is the same as `a == b` by default, but subclasses can override equals. Use `==` with `null`, NOT `equals` <small>(null.equals(...) will fails)</small>.

➡️ An IDE [can generate such methods](files/gen.md).

💎 Use `Objects.equals(a, b)` to call `a.equals(b)` on a nullable object.
</div><div>

#### String

```java
String s = "some text";
int xxx = s.length();           // number of characters
String xxx = s.toLowerCase();   // s.toUpperCase()
String xxx = s.trim();          // remove leading/trailing \s
boolean xxx = s.isEmpty();      // s.equals("")
boolean xxx = s.isBlank();      // since JDK 11
boolean xxx = s.equals(xxx);    // same as ==
// Printf-like formatting
System.out.println("%s: %d".formatted("string", 0));
System.out.printf(("%s: %d") + "%n", "string", 0); // same
```

➡️ Since JDK 13, you can use `""" """` for multilines strings.

🔥 Concatenation is done using `+` (plus): `"a" + "b"` gives us `"ab"`.

<br>

#### Arrays

An array is a fixed-size list of values. Empty cells are filled with the default value for primitive types <small>(false, 0...)</small> or `null` for objects.

```java
int[] tab = {1,2,3,4};
tab = new int[4];
tab = new int[]{1,2,3,4};

int one = tab[0];
int length = tab.length;
```

If you try to use an index that does not exist, you will get an Exception: `IndexOutOfBoundsException`.
</div></div>

<hr class="sep-both">

## 👻 To-do 👻

Stuff that I found, but never read/used yet.

<div class="row row-cols-md-2"><div>

* [old](../_old/index.md)
* java shell
* const
* object vs primitive
  * objects can be null

<details class="details-n">
<summary>Address 📬</summary>

In Java, the notion of address doesn't exist. You are calling a method using a parameter

* if it's a primitive type: then the value is passed
* if it's an object: a reference is passed

A reference is simply something that's referencing your object meaning that you can change the attributes/call methods on it, and the real object will be modified, but you can't "destroy"your object because that's simply a reference.
</details>

* control-flow methods
* streams
* concatenation operator
</div><div>

* final method/class
* overloading constructors

<details class="details-n">
<summary>static constructors</summary>

You have a constructor for instances, but you also have a class constructor! They are not taking parameters since they are more like static blocs but could be used to init static attributes (even though we mainly use inline initialization).

Syntax is

```java
public class Math {
    private static final float PI;

    static {
        PI = 3.14f;
    }
}
```

According to some tests, the static constructor seems to be called when the class is loaded in memory, which is not necessarily at the start of the program.
</details>
</div></div>