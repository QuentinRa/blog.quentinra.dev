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

Java is a oriented-object language, excluding 8 primitives types,
all other types are classes and their instances are objects.

Java is compiled using a JDK with the ``javac`` command and
is run using a JDK/JRE with the ``java`` command. JAVA is run
on a virtual machine so your code will work on any OS, trough
there may be some changes.

You got a lot of tutorials on the web as how you can install java
but theses links to download a JDK might help. Still IDE like
IntelliJ are downloading any version of Java you want when creating
a project so no install required. **We are currently in Java16
or Java1.16**

* [Oracle JDK](https://www.oracle.com/java/technologies/javase-downloads.html)
* [Oracle JDK (no login)](https://jdk.java.net/archive/)
* [Open JDK](https://openjdk.java.net/projects/jdk/)
* [Windows JDK8 / 11](https://github.com/ojdkbuild/ojdkbuild)

Then the last thing you need to know (beside looking on stackoverflow)
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

Still a lot to learn but that's the must you need to know in order
to understand everything else. **You should practice by yourself
but [here](structure/mcq.md) some MCQ**.

<div class="sr"></div>

## Beginner

Now our aim would be to write some code. But for that we
need to take a look at all of theses

* [Types](beginner/types.md)
* [Structures](beginner/structures.md)
* [Operators](beginner/operators.md)
* [Packages and import](beginner/packages.md)
* [Object class](beginner/object.md)
* Arrays
* [Exceptions](beginner/exceptions.md)

Then you can read theses

* [Polymorphism](beginner/polymorphism.md) (Surcharge in French)
* [Inheritance](beginner/inheritance.md)
* [Override](beginner/override.md)
* [Abstract classes](beginner/abstract.md)
* [Interfaces](beginner/interfaces.md)
* Javadoc
* Modules

And here some MCQ to test the [theory](beginner/mcq.md) but you
must practice!

<div class="sl"></div>

## Advanced

Here some advanced concepts that you might use
after mastering the beginner one. Please do try
to make some exercises beforehand since I won't go
a lot into details.

* [Iceberg paradigm](advanced/icerberg.md)

<div class="sr"></div>

## Professional

...

<div class="sl"></div>

## Graphical interfaces

...