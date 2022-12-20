# Java programming

Java is an oriented-object language, maintained and owned by Oracle. We are currently in Java 17. Java programs are running on a virtual machine, which is supposedly allowing us to run any runnable on any machine. This is a good language to learn more about design patterns, acronyms such as SOLID or GRASP, and to learn more about oriented-object programming. As of Java 15, we are now how to write Java in a Shell, as we could in Python.

* An introduction to Java programming language
* Advanced concepts such as **Networking** and **Threads**
* Graphical interfaces with **AWT** and **Swing**
* Modern interfaces with **JavaFX**
* Some **secrets** about Java (ex: private members in interfaces since Java9)
* How to package and create a **.exe**/**installer** for your applications
* How to write tests using **Junit5** (with notes about Junit4)

Note: I know the JDK17 will be released in two weeks, but since we know what's inside, I'm adapting the course earlier (as I have time now).

<hr class="sr">

## Introduction

Java is an oriented-object language, excluding 8 primitives types, all other types are classes and their instances are objects.

* **JDK** (Java development kit): used to compile java, include the JRE, create a `.class` from a `.java` with the command `javac File.java`
* **JRE** (Java runtime environment): used to run `.class`, with the command `java File` (for File.class)

You got a lot of tutorials on the web as to how you can install Java. Still, IDEs like IntelliJ are downloading any version of Java you want when creating a project, so no install required.

* [Oracle JDK](https://www.oracle.com/java/technologies/javase-downloads.html)
* [OpenJDK](https://jdk.java.net/archive/) / [Notes about each OpenJDK](https://openjdk.java.net/projects/jdk/)
* [Windows JDK8 / 11](https://github.com/ojdkbuild/ojdkbuild) (note: switch to Java17, the new LTS)
* [AdoptOpenJdk](https://adoptopenjdk.net/) (this is mine 😁)

Then the last thing you need to know (besides looking on Stack Overflow) if you don't know something is to look at the documentation (namely **Javadoc**) 

* [Java 8](https://docs.oracle.com/javase/8/docs/api/overview-summary.html) / [Java 11](https://docs.oracle.com/en/java/javase/11/docs/api/index.html)
* [Java 17](https://docs.oracle.com/en/java/javase/17/docs/api/index.html) (not available yet - [current link](https://download.java.net/java/early_access/jdk17/docs/api/))
* [history](beginner/history.md)

> A JDK labeled as LTS for "Long-term support" means that it will continue to receive security updates for **5 years** after the release (**8 years** for ETS=extended). Java 8, 11 and Java 17 are [LTS releases](https://www.oracle.com/java/technologies/java-se-support-roadmap.html).

<hr class="sl">

## Vocabulary

First, **a class** is a container representing something abstract like a Computer, an Animal, a Person... A class can have properties called **attributes** like a name, a size, ... and **methods** like ``buy(xxxxxx)``, `remove(xxxx)` that are basically functions applied on a class.

When you're giving values to the properties (ex: "Marley" for a Dog), then you're creating an **instance** of the class, which is also called an **object** of the class.

Note that in java, we print with ``System.out.println("text");`` or with ``System.err.println("text")``.

* [First java file](structure/main.md)
* [Creating a class](structure/class.md)
* [Visibility](structure/visiblity.md)
* [Attributes](structure/attributes.md)
* [Methods](structure/methods.md)
* [Constructors](structure/constructors.md)
* [Creating objects](structure/creation.md)
* [Destroying objects](structure/destroy.md)

Note that we are calling

* **instance members** (`membres d'instance`): methods/attributes for instances (=non static)
* **class members** (`membres de classe)`: methods/attributes of the class (=static)

**Practice**

* check you remember and understand the [theory](structure/mcq.md)
* but you must write some code!

<hr class="sr">

## Beginner

Now our goal would be to write some code. But for that, we need to take a learn all of these

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

| | abstract | Interface |
| --- | --- | --- |
| Constructors | Can have constructors, but you can't write `new AbstractClass()` | Can't have constructors. |
| Attributes | It's like in a normal class. | Only public class constants. |
| methods (instance) | It's like in a normal class, but some methods can be abstract. | abstract or concrete (JDK8) methods, public only <small>(private allowed since JDK9)</small>. |
| methods (class) | concrete, all visibilities modifiers. | concrete, public only <small>(private allowed since JDK9)</small>. |

**Practice**

* check you remember and understand the [theory](beginner/mcq.md)
* but you must write some code! (again 🙄)

<hr class="sl">

## Advanced

Here are some advanced concepts that you might use after mastering the beginner one. Please do try to make some exercises beforehand, since I won't go a lot into details.

Some new syntax-related stuff

* [Javadoc](advanced/javadoc.md)
* [Iceberg paradigm](advanced/icerberg.md)
* [Annotations](advanced/annotations.md)
* [Enumerations](advanced/enumerations.md)
* [Genericity](advanced/genericity.md)
* [Variadic methods](advanced/variadic.md)
* [Iterable/Iterator](advanced/iterable.md)
* [Dynamic structures](advanced/dynamic.md)
* [Streams](advanced/streams.md)

And things you might use

* [Threads](advanced/threads.md)
* [Networking](advanced/networking.md)
* [Files](advanced/files.md)
* [Databases / API](advanced/database.md)
* [Recursive functions](advanced/recursive.md)
* [Sorting](advanced/sort.md)

Special notes

* [Special classes](expert/special-classes.md)
* [UTF-8](expert/utf-8.md)
* [Preferences / Properties](expert/saving-data.md)

<hr class="sr">

## Expert

**Note**: note that I'm not an expert, so this section is about some notes about the things that I'm discovering while practicing.

* [Modules](expert/modules.md)
* Gradle
* [Generating a .exe or an installer](expert/exe.md)
* [Protect a jar](expert/jar.md)

New things added by Oracle

* [Records](expert/records.md) (since Java16)

<hr class="sl">

## Tests with JUnit

The test logic is presented in the project/tests course. You should know the logic beforehand, like what's an assertion.

* [Defensive programming](tests/dp.md)
* [assert in Java](tests/asserts.md)

And finally, JUnit-specific knowledge. Note that should use JUnit5 or higher.

* [Installation](tests/setup.md)
* [Run test in JUnit4](tests/junit4.md)
* [Write some tests](tests/code.md)
* [Tests suite](tests/suite.md)
* [Parametric tests](tests/par.md)

<hr class="sr">

## Graphical interfaces

The reason why I hated Java was that making graphical interfaces what boring, tiring, and hard (if you want something that is not using the default style). But now, with JavaFX, I'm better.

* [Swing and AWT](graphic/swing-awt.md)
* [JavaFX](graphic/javafx.md)
* libgdx
* litiengine

<hr class="sl">

## Sources

[References](_files/ref.md)