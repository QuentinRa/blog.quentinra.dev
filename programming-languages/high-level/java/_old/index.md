# Java programming

* [Modules](expert/modules.md)
* [Generating a .exe or an installer](expert/exe.md)
* [Protect a jar](expert/jar.md)
* [Records](expert/records.md) (since Java16)
* [Databases / API](advanced/database.md)

<hr>

* [history](beginner/history.md)
* [Exceptions](beginner/exceptions.md)
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

* [Iceberg paradigm](advanced/icerberg.md)
* [Annotations](advanced/annotations.md)
* [Enumerations](advanced/enumerations.md)
* [Genericity](advanced/genericity.md)
* [Variadic methods](advanced/variadic.md)
* [Iterable/Iterator](advanced/iterable.md)
* [Dynamic structures](advanced/dynamic.md)
* [Streams](advanced/streams.md)

And things you might use

* [Recursive functions](advanced/recursive.md)
* [Sorting](advanced/sort.md)

Special notes

* [Special classes](expert/special-classes.md)
* [UTF-8](expert/utf-8.md)