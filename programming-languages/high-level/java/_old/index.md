# Java programming

Java is an oriented-object language, excluding 8 primitives types, all other types are classes and their instances are objects.

Then the last thing you need to know (besides looking on Stack Overflow) if you don't know something is to look at the documentation (namely **Javadoc**) 

* [Java 8](https://docs.oracle.com/javase/8/docs/api/overview-summary.html) / [Java 11](https://docs.oracle.com/en/java/javase/11/docs/api/index.html)
* [Java 17](https://docs.oracle.com/en/java/javase/17/docs/api/index.html) (not available yet - [current link](https://download.java.net/java/early_access/jdk17/docs/api/))
* [history](beginner/history.md)

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