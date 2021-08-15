# Design patterns

Most of the time when coding, you will some code
code that a lot of developers have written before
you. Design patterns are the result of their reflection
on how you write this code.

There are 4 great categories of design patterns

* **creation**: how to create objects
* **structure**: how to structure your code
* **behavior**: how to make the interactions between objects
* **architectural**: how to think your code
* and **anti-patterns**: what you **mustn't** do

Notes

* the authors of this initiative, the Gang of four,
  made a [tutorial here](https://www.gofpatterns.com/design-patterns/module1/intro-design-patterns.php).
* **edit 24/06/2021**: I recently found this website
  [this website](https://java-design-patterns.com/)
  and [this GitHub](https://github.com/iluwatar/java-design-patterns)
  which are really good materials to start learning design-pattern.
  They are **different** from what I learned in school but
  I may improve this course later using them.
* **edit 21/07/2021**: Again, I found this
  [great website](https://sourcemaking.com/design_patterns)
  explaining both design patterns and anti-patterns with
  examples in a lot of languages.

<hr class="sl">

## Creation

* [Factory](creation/factory.md):
  delegate construction to a factory class (`Something s = Factory.createSomething()`)
* [AbstractFactory](creation/abstract-factory.md):
  a factory of factories
* [Singleton](creation/singleton.md):
  only one instance of a class
* [Multiton](creation/multiton.md):
  only n instances of a class
* [Prototype](creation/prototype.md):
  use cloning instead of creating (again) complex objects
* [Builder](creation/builder.md):
  break object creation into modules
* [Object Pool](creation/object-pool.md):
  create a finite pool of objects, allow others
  classes to use them, then handles the cleaning afterwards.

<hr class="sr">

## Structure

* [Adaptor](structure/adaptor.md):
  interface linking what the client wanted with our code
* [Facade](structure/facade.md):
  simplified API to use our code
* [Composite](structure/composite.md):
  abstract class implemented by children
* [Bridge](structure/bridge.md):
  interact with interfaces rather than concrete implementations
* [Decorator](structure/decorator.md):
  wrapper of a class to change a part of it,
  alternative to inheritance.
* [Flyweight](structure/flyweight.md):
  if you got a lot of objects (like bullets in a game)
  then you may use the flyweight.
* [Proxy](structure/proxy.md):
  call a remote object or use an attribute of
  a subclass to prevent yourself from coding some methods.

<hr class="sl">

## Behavior

* [Chain of Responsibility](behaviour/chain-of-responsibility.md):
  ask a list of classes if they will deal with a task
* [Iterator](behaviour/iterator.md):
  iterates a list of Unknowns items
* [Observable](behaviour/observable.md):
  watch objects' changes and trigger events
* [Memento](behaviour/memento.md):
  save and load objects
* [NullObject](behaviour/null-object.md):
  use an empty object instead of null
* [Command](behaviour/command.md):
  break into classes the one using the command and the command itself
* [Interpreter](behaviour/interpreter.md):
  simple language parser
* [Template](behaviour/template.md):
  define classes properties
* [State](behaviour/state.md):
  change objects' behavior according to their state
* [Strategy](behaviour/strategy.md):
  family of objects
* [Visitor](behaviour/visitor.md):
  an object is changing according who visit it
* [Mediator](behaviour/mediator.md):
  handles the relations between classes

<hr class="sr">

## Architectural

* [MVC](architectural/mvc.md):
  Model - View - Controller
* DAO

<hr class="sl">

## What's the design pattern?

1. I'm using a listener (a class listening to events like input...)
``ListChangeListener`` with `onChanged` in Java.

<blockquote class="spoiler">
That's the <code>Observer/Observable</code> pattern since
we <code>watch object changes and trigger events</code>.
</blockquote>

2. A class ``Group`` extending `Figures` containing
a lot of ``Figures``.

<blockquote class="spoiler">
That's the <code>Composite</code> pattern with
<code>Figures</code> abstract implemented by
<code>Group</code> and others <code>Figures</code>.
</blockquote>

3. An alternative to inheritance

<blockquote class="spoiler">
That's <code>Decorator</code> pattern.
</blockquote>

4. A concrete class calling abstract methods implemented in sub-classes

<blockquote class="spoiler">
That's <code>Template (method)</code> pattern. You will define some properties
in an abstract class that will be used by concrete classes.
</blockquote>

5. A private attribute having the type of the class and a class method
to get the attribute value.

<blockquote class="spoiler">
That's <code>Singleton</code> pattern.
</blockquote>

6. In ``Java``, `Collection<E>` defines a method `Iterator<E> iterator()`
allowing to iterates concrete collections.

<blockquote class="spoiler">
That's <code>Iterator</code> pattern if we are using it otherwise it would be
a <code>Factory</code> pattern (since we are creating concrete
iterators that are hiding using Iterator class).
</blockquote>

<hr class="sr">

## Anti-Patterns

An anti-pattern is something that programmers often do
**yet they shouldn't**. 
[This website](https://sourcemaking.com/antipatterns/software-development-antipatterns)
is a great reference and they are providing
better explanations (if you got the time to read
them).

* Spaghetti Code 🍝

Little to no modularity. In Java, writing a lot
of methods in one class, adding on top of that
inner/locale/nested classes make the code almost
unreadable for me. Same for people who are putting
everything in one python script.

* Magic Numbers and Strings ✨

One of the most used anti-pattern. Programmers tend to write
a lot of numbers/strings inside the code but they
are unnamed and should be stored inside a named
constant so we understand what this
value is supposed to be. In some languages, you may
be able to use named parameters which are convenient
when you are only using a value once.

* Golden Hammer 🔨

You are using things you are confident in because
that's easier even though you know that this may not
be the right thing to do. I did that a lot, like writing
code in Java taking hundred of lines because I know
how to do a lot of things in Java even though I know I could
use other languages like Python for what I wanted to do.

* Boat Anchor ⚓

You coded something for later but didn't need it yet,
**YAGNI principle**, You Ain't Gonna Need It.

* God Object/Class or "The Blob" ⛪

If you are using an object in too many parts of your code,
then maybe his class is doing too much. If you got
a class having a lot of dependencies then that may
be the case.

* Premature Optimization 🐣

Focusing too much on optimization without having
a proper understanding of what you are trying
to optimize. This may increase a lot the complexity
of the code for almost nothing.

* Cut-and-Paste Programming 📝

**Do not copy/paste code** from one part of your
code to another part.
Factorizing your code, using a function,
will help to patch all the bugs for this code at once,
and make things more readable.

<hr class="sl">

## Sources

* <https://fr.wikibooks.org/wiki/Patrons_de_conception>
* <https://www.javatpoint.com/design-patterns-in-java>
* <https://www.geeksforgeeks.org/the-decorator-pattern-set-2-introduction-and-design/>
* <https://www.gofpatterns.com/>
* <https://www.journaldev.com/1827/java-design-patterns-example-tutorial>
* <https://www.geeksforgeeks.org/null-object-design-pattern/>
* <https://www.tutorialspoint.com/design_pattern/null_object_pattern.htm>
* <https://www.tutorialspoint.com/design_pattern/chain_of_responsibility_pattern.htm>
* <https://www.baeldung.com/java-observer-pattern>
* <https://www.geeksforgeeks.org/interpreter-design-pattern/>
* <https://www.tutorialspoint.com/design_pattern/data_access_object_pattern.htm>
* <https://www.tutorialspoint.com/design_pattern/composite_entity_pattern.htm>
* <https://www.freecodecamp.org/news/antipatterns-to-avoid-in-code/>
* <https://sahandsaba.com/nine-anti-patterns-every-programmer-should-be-aware-of-with-examples.html>
* <https://sourcemaking.com/antipatterns/software-development-antipatterns>
* <https://sourcemaking.com/antipatterns/software-architecture-antipatterns>