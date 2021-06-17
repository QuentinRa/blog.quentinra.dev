# Presentation of the course

In this course, you will find

* an introduction to `JAVA`
* a presentation of advanced concepts such as `Networking`, `Threads` or `Databases`.
* graphical interfaces with `AWT` or `Swing`
* modern interfaces with `JavaFX`
* some secrets things about `Java`
* how to package and create a `.exe`/`installer` for your applications

<div class="sr"></div>

## Introduction

Java is an oriented-object language, excluding 8 primitives types,
all other types are classes and their instances are objects.

Java is compiled using a JDK with the ``javac`` command and
is run using a JDK/JRE with the ``java`` command. JAVA is run
on a virtual machine so your code will work on any OS, though
there may be some changes.

You got a lot of tutorials on the web as to how you can install java
but these links to download a JDK might help. Still, IDEs like
IntelliJ are downloading any version of Java you want when creating
a project so no install required. **We are currently in Java16
or Java1.16**

* [Oracle JDK](https://www.oracle.com/java/technologies/javase-downloads.html)
* [Oracle JDK (no login)](https://jdk.java.net/archive/)
* [Open JDK](https://openjdk.java.net/projects/jdk/)
* [Windows JDK8 / 11](https://github.com/ojdkbuild/ojdkbuild)

Then the last thing you need to know (besides looking on StackOverflow)
if you don't know something is to look at the documentation, 

* [Java 8](https://docs.oracle.com/javase/8/docs/api/overview-summary.html)
* [Java 11](https://docs.oracle.com/en/java/javase/11/docs/api/index.html)
* [Java 14](https://docs.oracle.com/en/java/javase/14/docs/api/index.html)
* latest as of June 2021: [Java 16](https://docs.oracle.com/en/java/javase/16/docs/api/index.html)

<div class="sl"></div>

## Vocabulary

First of all, **a class** is a container representing something
like a Computer, an Animal, a Person... A class can have properties
called **attributes** like a name, a size, ... and **methods**
like ``buy(xxxxxx)``, `remove(xxxx)` that are basically functions
applied on a class.

Note that in java, we print with ``System.out.println("text");``
or with ``System.err.println("text")``.

* [First java file](structure/main.md)
* [Creating a class](structure/class.md)
* [Visibility](structure/visiblity.md)
* [Attributes](structure/attributes.md)
* [Class and instance](structure/class-instance.md)
* [Methods](structure/methods.md)
* [Constructors](structure/constructors.md)
* [Creating objects](structure/creation.md)
* [Destroying objects](structure/destroy.md)

And now you should be able

* to create a file with a class
* with some attributes and some methods
* and creating some objects using constructors

Still, a lot to learn but that's the most you need to know to understand 
everything else.
**You should practice by yourself but [here](structure/mcq.md) some MCQ**.

<div class="sr"></div>

## Beginner

Now our goal would be to write some code. But for that we
need to take a look at all of these

* [Types](beginner/types.md)
* [Structures](beginner/structures.md)
* [Operators](beginner/operators.md)
* [Packages and import](beginner/packages.md)
* [Object class](beginner/object.md)
* [Arrays](beginner/arrays.md)
* [Exceptions](beginner/exceptions.md)

Then you can read theses

* [Overload](beginner/overload.md) (Surcharge in French)
* [Inheritance](beginner/inheritance.md)
* [Override](beginner/override.md)
* [Abstract classes](beginner/abstract.md)
* [Interfaces](beginner/interfaces.md)

If we summarize abstract class and interfaces

<table class="table-striped table table-bordered">
    <tr>
        <th></th>
        <th>abstract</th>
        <th>Interface</th>
    </tr>
    <tr>
        <td>Constructors</td>
        <td>Can have constructors, but you can't write 
            <code>new AbstractClass()</code></td>
        <td>Can't have constructors.</td>
    </tr>
    <tr>
        <td>Attributes</td>
        <td>It's like in a normal class.</td>
        <td>only public class constants.</td>
    </tr>
    <tr>
        <td>methods (instance)</td>
        <td>It's like in a normal class but some methods
        can be abstract.</td>
        <td>abstract or concrete methods, public only.</td>
    </tr>
    <tr>
        <td>methods (class)</td>
        <td>concrete, all visibilities modes.</td>
        <td>concrete, public only.</td>
    </tr>
</table>

**Practice**

* check you remember and understand the [theory](beginner/mcq.md)
* but you must practice!

<div class="sl"></div>

## Advanced

Here some advanced concepts that you might use
after mastering the beginner one. Please do try
to make some exercises beforehand since I won't go
a lot into details.

Some new syntax-related stuffs

* Javadoc
* [Iceberg paradigm](advanced/icerberg.md)
* Annotations
* [Enumerations](advanced/enumerations.md)
* Genericity
* [Variadic methods](advanced/variadic.md)

And things you might use

* Dynamic structures
* Threads
* Databases
* Networking
* Files
* Recursively
* Sorting

<div class="sr"></div>

## Expert

* Modules
* Gradle
* Generating a .exe or an installer
* Protect a jar

<div class="sl"></div>

## Tests with JUnit

The test logic is presented in the project/tests course.
You should know the logic beforehand, like what's an
assertion.

* [Defensive programming](tests/dp.md)
* [assert in Java](tests/asserts.md)

And finally, JUnit-specific knowledge. Note that
should use JUnit5 or higher.

* [Installation](tests/setup.md)
* [Run test in JUnit4](tests/junit4.md)
* [Write some tests](tests/code.md)
* [Tests suite](tests/suite.md)
* [Parametric tests](tests/par.md)

<div class="sr"></div>

## Graphical interfaces

...