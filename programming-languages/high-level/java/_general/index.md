# Java

<div class="row row-cols-md-2"><div>

Java is a well-known [object-oriented](/programming-languages/_paradigm/oo.md) programming language. It's maintained and owned by Oracle 🍵.

Java was designed as a cross-platform language. We write code once, and on any operating system, we would have the same output. This is done by executing the code on a virtual machine called **JVM**.

➡️ The current version is **Java 21** (2023). The last [LTS](files/download.md#lts-jdk) is **Java 21**.

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

// From primitive to object (☠️, implicit now)
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

Here is a list of most [operators](/programming-languages/_paradigm/stuff/operators.md).

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
if (5 == 5) {}         // true ⚠️ see also "Object#equals"
if (5 != 5) {}         // false
                       // see also: >, >=, <, <=
if (!false) {}         // logical NOT => true
if (true || false) {}  // logical OR => true
if (true && false) {}  // logical AND => false
if (true ^ false) {}   // logical XOR => true

String x = ""+5;       // concatenation (+cast), see String
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
int[] numbers = {5, 6, 7};
for (int e: numbers) {
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

Aside from default classes, every other class must be imported:

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

🔥 You can have multiple package-private classes in one Java file.
</div><div>

#### Attributes

As a reminder, [attributes](/programming-languages/_paradigm/oo.md) are used to store data.

```java
// Class
public static int xxx;
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

✨ You can write [recursive methods](/programming-languages/_paradigm/stuff/recursivity.md).

✨ You can [overload](/programming-languages/_paradigm/stuff/overloading.md) methods and constructors.

🔥 You can create a variadic method e.g., taking a variable number of arguments as follows: `public void myMethod(Integer ... numbers)`. Here, `numbers` has the type `Integer[]`, and  may be empty. This can only be used for the last argument. Call: `myMethod(), myMethod(a, b)`...
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

For class members, it's the same, but with the name of the class:

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

## Exceptions

<div class="row row-cols-md-2"><div>

An **exception** is a signal fired when something unexpected occurs. This is most of the time an error 🔥. If no one handles the signal, then the program crashes. It prints a **stacktrace** with the trace of methods the signal went through. There are **two** categories of exceptions.

<br>

#### Verified exceptions

Verified/Checked exceptions are exceptions that **must** be caught. These are usually raised by methods that may fail for a reason that the developer can't do anything about it <small>(opening a file failed...)</small>.

➡️ `IOException`, `Exception`...

<br>

#### Runtime exceptions

Runtime exceptions are exceptions that usually occur due to a problem in the code that can be patched.

🔥 The most famous one is the NPE: `NullPointerException`, when calling a method on a `null` object.

➡️ `RuntimeException`, `ArrayIndexOutOfBoundsException`,  `IllegalArgumentException`, `IllegalStateException`...

<br>

#### Raise an exception

To raise an exception, use `throw`:

```java
throw new SomeException(args);
```
</div><div>

#### Catch and handle an exception

A `try-catch-finally` block is used to catch and handle exceptions. You can have multiple `catch`, the first one compatible with the exception is used <small>([polymorphism](/programming-languages/_paradigm/oo.md#polymorphism) applies, a parent will catch its subclasses)</small>.

```java
try {
  // code raising an exception
} catch(TypeException e) { // TypeException and subclasses
  // print the stack trace
  e.printStackStace();
  // print error message
  System.err.println(e.getMessage());
  // it's common to wrap exceptions
  throw new RuntimeException(e);
} // both share the same block
catch(TypeException1|TypeException2 type1) {}
// optional, called after try or catch
// even if there is a "return/throw" in either
finally {
    // ...
}
```

<br>

#### Explicitly declare raising an exception

If a method does not handle an exception, you can explicitly specify it:

```java
public void error() throws IllegalArgumentException {
    // code that may raise an IllegalArgumentException
    // and that won't be handled by this method
}
```
</div></div>

<hr class="sep-both">

## Inheritance

<div class="row row-cols-md-2"><div>

Java implements [inheritance](/programming-languages/_paradigm/oo.md#inheritance) with the keyword `extends`. All classes inherit from [Object](#object) <small>(implicitly)</small>, and classes can only extend **one** class.

👉 Classes inherit any public or protected members <small>(instance, ~static)</small>.

👉 Final classes (`final class XXX {}`) can't be inherited from.

```java
public class Person {           // implicit extends Object
    private final String name;

    protected Person(String name) {
        this.name = name;
    }

    // can only be used by inheritor
    protected String getName() { return name; }
}
```

#### Subclass

We can create a subclass `King` inheriting from `Person`. The latter has a constructor with need to call, this is done using `super(args)`.

```java
public class King extends Person {
    protected King(String name) {
        super(name);
    }
}
// Polymorphism: can be stored in a "Person" ✨
Person p = new King("John DOE");
```

✍️ Child classes' constructors must call `super(args)` before anything else. If the constructor is trivial, it can be omitted <small>(implicit `super()`)</small>.

</div><div>

#### Override

Child classes can override a method, e.g., change the inner code of a method that was declared within their parent.

The child class uses `super` to reference the parent class.

Below, we call the parent `getName()` but prepend "`King `" to it.

```java
public class King extends Person {
    @Override                 // see advanced override
    public String getName() { // to override the signature
        return "King " + super.getName();
    }
}

p.getName(); // King John DOE
```

✍️ `@Override` is optional, and used to explicitly declare an override.

🔥 `final` methods cannot be overridden.

<br>

#### Advanced override

You can change, to some extent, the parent class signature when overriding a method.

* **Visibility** 👓: you can increase the visibility of a method from `protected` to `public`

* **Parameters** 🪙: you can change any argument name, or replace any argument type with a subclass of the same type 

* **Return Type** 🔫: you can use a child class of the return type

You can also add [annotations](../advanced/index.md#annotations) or [throws](#explicitly-declare-raising-an-exception).
</div></div>

<hr class="sep-both">

## Abstraction

<div class="row row-cols-md-2"><div>

Abstraction in Java can be achieved using **abstract classes** or **interfaces**. Both are used to write more generic methods using [polymorphism](/programming-languages/_paradigm/oo.md#polymorphism) and [liskov principle](/programming-languages/_paradigm/oo.md#polymorphism), but they are **not** instantiable.

An **abstract method** is a method that wasn't implemented yet.

#### Abstract classes

Abstract classes are the only classes that can have abstract methods, while they may not have any. Aside from that, they are normal classes:

```java
public abstract class AbstractXXX { // ✍️ abstract class
    // can have attributes
    private final SomeType someAttribute;

    // ✍️ can have constructor, but they can't be called
    protected AbstractXXX(...) {
        // ...
    }

    // can have concrete methods
    public void xxx() { /* ... */ }
    // ✍️ can have abstract methods
    public abstract int yyy();
}
```

👉 Unless they implement abstract methods, inheritors must be abstract too. Also, you can have `static` and `abstract`.

<br>

#### Interfaces

An interface is a level above an abstract class. We can only inherit one class, but we can **"inherit" (`implement`) multiple interfaces**.

* Interfaces can have `public` methods, `static` or not
* Interfaces can have `public static final` attributes
* Everything is `public` by default <small>(keyword can be omitted)</small>
* Everything is `abstract` by default <small>(keyword can be omitted)</small>

```java
public interface SomeInterface {
    // can have final attributes
    public static final int XXX = 0;
    // can have public abstract instance method
    public abstract SomeType xxx();
    // can have public static method
    public static boolean zzz(...) { /* ... */ }
}
```
</div><div>

Use `implement` to inherit from one or many interfaces. You'll have to implement methods, or use an [abstract class](#abstract-classes):

```java
public class XXX implements SomeInterface, AnotherInterface {
  @Override
  public SomeType xxx() { /* ... */ } 
}
```

An interface can [inherit](#inheritance) from another interface using `extends`:

```java
public interface SomeInterface extends AnotherInterface {
  // ...
}
```

Since **Java 8**, interfaces can have methods with a body using `default`:

```java
public interface XXX {
    default String XXX() { /* ... */ }
}
```

Since **Java 9**, interfaces can have private concrete methods:

```java
public interface XXX {
    // instance
    private void myPrivateMethod () {}
    // static
    private static void myPrivateMethod2 () {}
}
```

<br>

#### Functional interfaces

Functional interfaces are [interfaces](#interfaces) with only **one** abstract method.

```java
@FunctionalInterface // optional, enforce "one abstract"
public interface XXX {
    String getName(boolean upper); // only one abstract
    default YYY yyy() { /* ... */ }
}
```

They are convenient because they can be implemented dynamically using **lambda expressions** <small>(~= a function stored in a variable)</small>.

```java
String r = "xxx";
XXX xxx = (u) -> { // can access out-of-scope variables
    return u ? r.toUpperCase() : r.toLowerCase();
};
```

👉 If there is only one arg/line, braces and parenthesis are optional.

</div></div>

<hr class="sep-both">

## Special classes

<div class="row row-cols-md-2"><div>

#### Enumerations

An enumeration is a class providing static objects. They are already instantiated and can have methods/attributes.

They are commonly used for classes with limited known objects.

```java
public enum RPGClass {
  SORCERER, WARRIOR, ARCHER, TANK
}
// example
RPGClass sorcerer = RPGClass.SORCERER;
```

🔥 Useful: `RPGClass.values()`, `XXX.name()`, `XXX.ordinal()`.

🚸 Enums can't extend classes, but can implement interfaces.

👉 You can add attributes and methods as follows:

```java
public enum RPGClass {
  SORCERER(10)
  ; // don't forget the ";" at the end

  private final int baseHP;
  RPGClass(int baseHP) { // package-private
    this.baseHP = baseHP;
  }

  // some method
  public int getBaseHP() { return baseHP; }
}
// example
int sorcererBaseHP = RPGClass.SORCERER.getBaseHP();
```

#### Records

Records were introduced in Java 16. They are used to store data.

```
// automatically generate getters, #equals, #toString...
public record MyRecord(int xxx, int yyy) {}
public record MyRecord(int xxx, int yyy) {
  public MyRecord {}                 // canonical constructor
  public MyRecord() { this(0,0,0); } // additional constructor
}
```

</div><div>

#### Inner class

Each instance has a class. It's rarely seen/used. The main advantage is that `BBB` can implicitly access attributes declared in `AAA`.

```java
public class AAA {       // outer class
    public class BBB {}  // inner class
}
// Usage
AAA aaa = new AAA();
AAA.BBB bbb = aaa.new BBB();
```

➡️ You may use `AAA.this.attribute` for explicit usage.

#### Nested class

A class inside another class. It's commonly used to wrap classes related to the internal implementation <small>(they are usually private)</small>.

````java
public class AAA {              // outer class
    private static class BBB {} // nested class, private
}
// Usage
AAA.BBB aaa = new AAA.BBB();
````

#### Anonymous classes

These are classes dynamically created during compilation.

```java
// Runnable is an interface
Runnable r = new Runnable() {
    @Override
    public void run() {}
};
```

#### Local class

A local class is declared in a method and only exists within its scope.
</div></div>

<hr class="sep-both">

## Well-known types

<div class="row row-cols-md-2"><div>

#### Object

Every class inherited from the class Object implicitly.

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

➡️ An IDE can generate implementations for [these methods](files/gen.md).

<br>

#### Objects 💎

As variables can be null, `a.somMethod()` can raise a [NPE](#runtime-exceptions). Some helpers:

* `Objects.requireNonNull(obj)`: raise an exception if `obj` is null
* `Objects.toString(obj)`: print `null` or call `obj.toString()`
* `Objects.equals(a, b)`: check if `a == b`, then if it's false, check that `a != null` and call `a.equals(b)`, else return `false`
* ...

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

## Annotations

<div class="row row-cols-md-2"><div>

Annotations such as `@Override` or `@Deprecated` allow us to enforce some compiler checks to a method <small>(ex: deprecated trigger a warning)</small>.

For instance, [org.jetbrains:annotations](https://www.jetbrains.com/help/idea/annotating-source-code.html) provides: `@Nullable`, `@NotNull`, or `@Contract` which are helpful for [contract programming](/tools-and-frameworks/others/testing/methodology/index.md#contract-programming).

<br>

#### SuppressWarnings

You can use `@SuppressWarnings` to suppress compiler warnings:

* `@SuppressWarnings("deprecation")`: deprecation
* `@SuppressWarnings("unchecked")`: unchecked casting
* `@SuppressWarnings("SameParameterValue")`: a non-public method is always given the same parameters
* `@SuppressWarnings("MethodDoesntCallSuperMethod")`: missing `super.xxx(...)` when overriding a method
* ...
</div><div>

#### Create annotations

You can create annotations.

```java
@Retention(...) // RetentionPolicy: CLASS = compiler, RUNTIME = runtime too
@Target(...) // ElementType: TYPE, METHOD, FIELD, PARAMETER,  LOCAL_VARIABLE, TYPE_USE... 
public @interface AnnotationName {
	// optional, args
	String field1() default "";
	int[] field2() default {};
	float field3();
}
```

Which can be used as follows:

```java
@AnnotationName(field1 = "", field2 = {}, field3 = 1)
@AnnotationName(field2 = {}, field3 = 1)
@AnnotationName(field3 = 1)
```
</div></div>

<hr class="sep-both">

## Input/output streams

<div class="row row-cols-md-2"><div>


Files, and sockets <small>(networking)</small> are two examples of streams. We read in an `InputStream` 📖, and we write in an `OutputStream` ✍️. There is also:

* `System.in`: standard input stream <small>(terminal input, stdin)</small>
* `System.out`: standard output stream <small>(terminal output, stdout)</small>
* `System.err`: error output stream  <small>(terminal output, stderr)</small>

```java
// import java.io.*;
InputStream is = System.in;
OutputStream os = System.out;
```

☠️ With in input/output stream, we can only read/write integers:

```java
int read = is.read();         // read one
os.write(5);                  // write one
```

⚠️ ️ Both raise a [verified `IOException`](../_general/index.md#verified-exceptions) that must be caught. Whether you have one or multiple `try-catch` is up to your needs.

If you open a stream <small>(not stdin/...)</small>, you have to close it. A new alternative is the `try-ressource` which automatically close a resource.

```java
// try-with-resources
try (InputStream is = ...) {
    // ...
}
```

🔥 When closing a buffer, any nested stream is automatically closed.
</div><div>

#### Buffers

We usually wrap streams within **buffers** to read more characters in one go. Each read/write still raise a [verified `IOException`](../_general/index.md#verified-exceptions) to catch.

```java
// for character streams:
BufferedReader reader = new BufferedReader(new InputStreamReader(is));
BufferedWriter writer = new BufferedWriter(new OutputStreamWriter(os));
String line;
while((line = reader.readLine()) != null) {
    // read line by line
}
writer.write("....");             // write a line
writer.newLine();                 // write a \n or \r\n
// for binary streams:
BufferedInputStream reader = new BufferedInputStream(is);
BufferedOutputStream writer = new BufferedOutputStream(os);
```

#### Files

For **binary** files, you can use:

```java
InputStream is = new FileInputStream("file");
OutputStream os = new FileOutputStream("file");
```

Otherwise, for **text** files, you can use:

```java
FileReader fileReader = new FileReader("file");
BufferedReader reader = new BufferedReader(fileReader);
```

⚠️ ️ Both raise a [verified `FileNotFoundException`](../_general/index.md#verified-exceptions) that must be caught.

💡 See also: `FileWriter` <small>(write into text files)</small>, and `File` <small>(file operations)</small>.
</div></div>

<hr class="sep-both">

## Java Generics

<div class="row row-cols-md-2"><div>

It's possible to write generic code using [Polymorphism](/programming-languages/_paradigm/oo.md#polymorphism). For instance, this functions takes instance of AAA or [subclasses](../_general/index.md#inheritance) of AAA.

```java
public static AAA xxx(AAA aaa){
    return /* ... */;
}
```

But, it's limited to subclasses. Java Generics allow us to factorize methods with the same code but no useful polymorphism usable:

```java
public static Integer firstElement(Integer[] array){
    return array.length == 0 ? null : array[0];
}

public static Float firstElement(Float[] array){
    return array.length == 0 ? null : array[0];
}
```
</div><div>

We could declare a type `<T>` and use it as follow:

```java
public static <T> T firstElement(T[] array){
    return array.length == 0 ? null : array[0];
}

// Usage:
Integer[] xxx = {0, 1, 2};
Integer first = firstElement(xxx); // 0
```

A generic type can be declared in a method, or in a class. For the latter, you must provide the type when calling the constructor:

```java
public class XXX<T> {}
// examples
XXX<Integer[]> xxx = new XXX<Integer[]>();
XXX<Integer[]> xxx = new XXX<>(); // omitted (inferred)
```

👉 You can also add constraints (`<XXX extends ...>`) or declare multiple types (`<K, V>`).

👉 You can use the "`?`" wildcard such as `XXX<?> xxx = ...` when you don't want to declare a generic type or don't need to enforce a type.
</div></div>

<hr class="sep-both">

## Common Java classes

<div class="row row-cols-md-2"><div>

Java has way too many classes, even if we only keep the most commonly used ones, and I will only put some here.

#### Comparator<T>, Comparable<T>: sort

Comparator/Comparable are [interfaces](#interfaces) implemented by classes whose values can be compared. The only difference is that `Comparator` is usually implemented in a separate class, while `Comparable` is not.

```java
public class MyComparator implements Comparator<XXX> {
  @Override
  public int compare(XXX o1, XXX o2) {
    // 0 for o1 == o2 | 1 for o1 > o2 | -1 for o1 < o2
    return /* return 0, 1, or -1 */;
  }
}
public class XXX implements Comparable<XXX> {
  @Override
  public int compareTo(XXX o) {
    return /* o1 == this, o2 == o */;
  }
}
```

See also: `Integer::compareTo`, ...
</div><div>

#### Iterator<T>, Iterable<T>: iterate an object

Both classes were made to uniformize a way of iterating an object. Classes implementing `Iterable<T>` can be iterated using [foreach](#loops---for-each).

`Iterable<T>` creates an `Iterator<T>`, which is something with a cursor returning the next value to read when prompted.

<details class="details-n">
<summary>Common implementation</summary>

The class below is a simplified example. It has an attribute `numbers` which represent the data it has, and that we will iterate.

```java
public class YYY implements Iterable<Integer> {
  private final int[] numbers = {5, 6, 7};

  @Override
  public Iterator<Integer> iterator() {
    return new YYYIterator();
  }

  private class YYYIterator implements Iterator<Integer> {
    private int cursorIndex = -1;

    @Override
    public boolean hasNext() {
      return cursorIndex < numbers.length;
    }

    @Override
    public Integer next() {
      if (!hasNext()) throw new NoSuchElementException("Invalid call of next.");
      // return and move cursor
      return numbers[cursorIndex++];
    }
  }
}
```
</details>

<details class="details-n">
<summary>🔥 Manually iterating an iterator 🧯</summary>

Some iterators need to be used manually, especially when we need to use `remove`:

```java
Iterator<Integer> iterator = new YYY().iterator();
while (iterator.hasNext()) { // ✅ check if we can load "next"
  Integer next = iterator.next(); // ⚠️ load "next"
  // next is "5" then "6" then "7"
  iterator.remove(); // 🔥 if supported
}
```
</details>
</div></div>

<hr class="sep-both">

## Threads

<div class="row row-cols-md-2"><div>

Threads allow us to run tasks in parallel 🔥. We will create a `Runnable` with the code executed by the thread.

```java
// version 1 - lambda expression
Runnable r = () -> {
    System.out.println("Hello, World!");
};
// version 2 - CodeRunByTheThread.java
public class CodeRunByTheThread implements Runnable {
	@Override
	public void run() {
		System.out.println("Hello, World!");
	}
}
Runnable r = new CodeRunByTheThread();
```

To create and execute a thread:

```java
Thread thread = new Thread(r);
thread.start();
```

👉 Use `Thread.sleep(duration);` to wait for a duration.
</div><div>

When multiple threads try to access a variable, there may be concurrency problems 💥. You can prevent them by only allowing one thread at a time to call a method using `synchronized`:

```java
[...]
    public synchronized void myMethod() { [...] }
[...]
```

Otherwise, you can use a `mutex` and `synchronized` to only allow the one that could lock the mutex to run some code:

```java
private Object lock = new Object();

public void myMethod() {
    synchronized (lock) { /* ... */ }
}
```

⚠️ If you're using threads to update a variable, you need to mark it as `volatile`, to ensure other threads will notice the variable changed.
</div></div>

<hr class="sep-both">

## Await an async function

<div class="row row-cols-md-2"><div>

Async functions are functions executed in another [thread](#threads). For instance, to query a database/an API. Sometimes, we want to wait for the result resuming the execution.

```java
// import java.util.concurrent.CountDownLatch;
// import java.util.concurrent.atomic.AtomicReference;
public class APIHelper {
    public static int getResult() throws InterruptedException {
        CountDownLatch latch = new CountDownLatch(1);
        AtomicReference<Integer> ref = new AtomicReference<>();
        // Do an async call here, update ref, and latch
        latch.await();
        return ref.get();
    }
}
```
</div><div>

To simulate an API call, we can create a thread as follows:

```java
Thread thread = new Thread(() -> {
    ref.set(10);       // AtomicReference<Integer>
    latch.countDown(); // decrease the latch by 1
});
thread.start();
```

When the latch is empty, `latch.await()` will stop waiting.

If you've multiple async functions to call, you can simply increase `CountDownLatch` starting value.

</div></div>

<hr class="sep-both">

## Networking

<div class="row row-cols-md-2"><div>

You can create a server from which **local** clients can connect to 🏠. As a client, you can connect to any server <small>(local or not)</small> 🌍.

#### Server

```
try (ServerSocket serverSocket = new ServerSocket(port)) {
    while (true) {
        Socket clientSocket = serverSocket.accept();
        // handle client, usually in a new thread
    }
} catch (IOException e) {
    throw new RuntimeException(e);
}
```
</div><div>

#### Client

```java
// "host" could be "localhost" or an IP
Socket clientSocket = new Socket(host, port);
```

#### Sockets

Assuming `s` is a `Socket`, you can get [streams](#inputoutput-streams) using:

```java
InputStream i = s.getInputStream();
OutputStream o = s.getOutputStream();
```

Unlike common streams, you will have to flush them after using them:

```java
i.flush();
o.flush();
```
</div></div>

<hr class="sep-both">

## Properties and Preferences

<div class="row row-cols-md-2"><div>

Properties and preferences are two common ways of storing user settings, such as the user language, the theme...

#### Preferences

Preferences are available at two scopes: user and system. Each preference is associated with a class.

* Static <small>(replace `XXX.class` with any class)</small>

```java
final Preferences preferences = Preferences.userNodeForPackage(XXX.class);
```

* Instance

```java
final Preferences preferences = Preferences.userNodeForPackage(getClass());
```

Preferences are dictionaries of key-values.

```java
preferences.put("key", "value");                 // save
String stored = preferences.get("key", default); // load
preferences.remove("key");                       // delete
```
</div><div>

#### Properties

Properties are `.properties` files such as `gradle.properties`. See [INI](/programming-languages/others/data/ini.md).

```java
try (FileReader reader = new FileReader("xxx.properties")) {
    final Properties p = new Properties();
    p.load(reader);
    // read values
    String value = p.getProperty("key", "default");
} catch (IOException e) {
    throw new RuntimeException(e);
}
```

```java
try (FileWriter writer = new FileWriter("xxx.properties")) {
    final Properties p = new Properties();
    // add/set properties
    p.put("key", "value");
    p.store(writer, null);
} catch (IOException e) {
    throw new RuntimeException(e);
}
```
</div></div>

<hr class="sep-both">

## Web requests

<div class="row row-cols-md-2"><div>

You can do an HTTP request using native code as follows:

```java
try {
    URL url = new URL("https://example.com");
    HttpURLConnection req = (HttpURLConnection) url.openConnection();
    try (InputStream is = req.getInputStream()) {
        // refer to the streams section
    }
    req.disconnect();
} catch (IOException e) {
    throw new RuntimeException(e);
}
```
</div><div>
</div></div>

<hr class="sep-both">

## Modules

<div class="row row-cols-md-2"><div>

Modules were introduced in Java 9. They encapsulate projects and require developers to explicitly import SDK packages in their projects. Create a `module-info.java`, with a unique module name:

```java
module com.example.project {
}
```

To import a module, use `requires some_module;`:

```java
  requires java.base;      // Base packages
  requires java.desktop;   // AWT + SWING
  requires jdk.crypto.cryptoki; // HTTP SSL
```
</div><div>

You can `export` a package to allow other projects to `requires` it.

```java
  // one per package, not recursive
  exports com.example.project.package;
```

You can give full access to a package to other projects using `open`. Otherwise, they can't do things like introspecting private members.

```java
    opens com.example.project.package;
```

Compile with: `javac -d mods /path/to/module-info.java /path/to/com/example/project/Main.java`

</div></div>

<hr class="sep-both">

## Random notes

<div class="row row-cols-md-2"><div>

#### UTF-8

Non-ASCII characters are incorrectly displayed on some machines. You can use [unicode](https://unicode-table.com/en/) to ensure it won't be the case.

```java
System.out.println("\u00E9"); // print é
```

Otherwise, you can also use: `java -Dfile.encoding=UTF-8 [...]`.

<br>

#### JAR files

[JAR](https://docs.oracle.com/javase/tutorial/deployment/jar/index.html) files are used to bundle JAVA code. Some are executable, while others are libraries that can be used in other projects. It can contain files <small>(images...)</small>, libraries, and other stuff needed by your program. 🗃️

```shell!
$ java -jar some_jar.jar # execute
```

⚠️ Once bundled, files inside the JAR cannot be modified.

🔥 With [Gradle](/tools-and-frameworks/others/build/gradle/index.md), you can use this to build a JAR:

```gradle
task makeJar(type: Jar) {
    manifest {
        attributes(
            'Main-Class': 'com.xxx.yyy.Main'
        )
    }
    from {
        configurations.runtimeClasspath.collect {
            it.isDirectory() ? it : zipTree(it)
        }
    }
    destinationDirectory.set(file("$buildDir/../out/"))
    with jar
}
```

<br>

#### Assertions

Assertions can be used for [testing](/tools-and-frameworks/others/testing/methodology/index.md), for since they are not enabled by default, there are almost never used. Run `java` with `-ea` or `-enableassertions` to see assertions. See also: `-da:package`.

```java
assert(condition);              // raises "AssertionError"
assert(condition) : "message";  // custom message
```
</div><div>

#### JPackage

JPackage <small>(JDK 14+)</small> was introduced to package Java applications <small>(.deb, .exe, .zip...)</small>. To build a `.exe` on Windows:

```ps
# "out" has a jar "xxx.jar"
# "out" has .class files
# "out/dist" will have the .exe
$ jpackage --name eden --type exe --input out --dest "out\dist" --main-jar "xxx.jar" --icon "path\to\icon.ico" --vendor "XXX" --app-version "X.Y.Z" --description "xxx"
# Useful options:
#   --win-shortcut  | create a shortcut
#   --win-menu      | add in menu
#   --runtime-image | path to bundled jre
#   --java-options  | options, such as "-Dfile.encoding=UTF-8"
```

See also: [install4j](https://www.ej-technologies.com/products/install4j/overview.html) and [launch4j](https://launch4j.sourceforge.net/).

<br>

#### JLink

JLink can be used to create a minimal JRE that can be bundled with your application <small>(e.g., there is no need to install Java to run it)</small>. With [Gradle](/tools-and-frameworks/others/build/gradle/index.md):

```gradle
plugins {
    id 'org.beryx.jlink' version '2.24.0'
}
jlink {
    addOptions('--strip-debug', '--compress', '2', '--no-header-files', '--no-man-pages')
    launcher {
        name = 'eden'
    }
    imageDir.set(file("$buildDir/../out/myjre"))
}
```

The JRE can be found in `out/myjre/`. See also [EasyJRE](https://justinmahar.github.io/easyjre/?path=/story/tools--easy-jre-story).
</div></div>

<hr class="sep-both">

## Libraries

<div class="row row-cols-md-2"><div>

#### JSON

You can use [JSON-java](https://github.com/stleary/JSON-java) to parse JSON.

```java
JSONObject o = new JSONObject("some JSON");
String string = o.getString("...");
```
</div><div>
</div></div>

<hr class="sep-both">

## 👻 To-do 👻

Stuff that I found, but never read/used yet.

<div class="row row-cols-md-2"><div>

* [old](../_old/index.md)
* java shell (JShell)
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
* sealed and hidden classes
* method references (A::b)
</div><div>

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

* Complete JAR notes (common functions/asset handling...)
* native keyword
* [baeldung](https://www.baeldung.com/)
* [Java](https://en.wikibooks.org/wiki/Java_Programming)
* [yguard](https://www.yworks.com/products/yguard) (Obfuscator, Shrink), [proguard](https://www.guardsquare.com/proguard) (Shrink)
* [30 Seconds of Java](https://java-design-patterns.com/snippets/#algorithm).
* var

```java
StringBuilder str = new StringBuilder();

EnumMap<EnumClass, ValueClass> map;
map = new EnumMap<>(EnumClass.class);
```
</div></div> 