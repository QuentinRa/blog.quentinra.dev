# Structure

* [Bridge](structure/bridge.md): interact with interfaces rather than concrete implementations
* [Decorator](structure/decorator.md): wrap a class, alternative to inheritance.
* [Flyweight](structure/flyweight.md): if you got a lot of objects (like bullets in a game) then you may use the flyweight.
* [Proxy](structure/proxy.md): call a remote object or use an attribute of a subclass to prevent yourself from coding some methods.

<hr class="sl">

## Behavior

* [Chain of Responsibility](behavior/chain-of-responsibility.md): ask a list of classes if they will deal with a task
* [Iterator](behavior/iterator.md): iterates a list of Unknowns items
* [Observable](behavior/observable.md): watch objects' changes and dispatch events
* [Memento](behavior/memento.md): save and load objects
* [NullObject](behavior/null-object.md): use an empty object instead of null
* [Command](behavior/command.md): separate the one using the command and the command itself
* [Interpreter](behavior/interpreter.md): simple language parser
* [Template method](behavior/template.md): define classes properties
* [State](behavior/state.md): change objects' behavior according to their state
* [Strategy](behavior/strategy.md): family of objects
* [Visitor](behavior/visitor.md): an object is changing according to who visit it
* [Mediator](behavior/mediator.md): handles the relations between classes

<hr class="sr">

## Architectural

* [MVC](architectural/mvc.md): Model - View - Controller
* DAO

<hr class="sl">

## What's the design pattern?

1. I'm using a listener (a class listening to events like input...) `ListChangeListener` with `onChanged` in Java.

<blockquote class="spoiler">
That's the <code>Observer/Observable</code> pattern since we <code>watch objects' changes and dispatch events</code>.
</blockquote>

2. A class `Group` extending `Figure`, and containing a lot of `Figure`. `Group` is also a `Figure`.

<blockquote class="spoiler">
That's the <code>Composite</code> pattern.
</blockquote>

3. An alternative to inheritance

<blockquote class="spoiler">
That's <code>Decorator</code> pattern.
</blockquote>

4. A concrete class calling abstract methods implemented in sub-classes

<blockquote class="spoiler">
That's <code>Template (method)</code> pattern. You will define some properties in an abstract class that will be used by concrete classes.
</blockquote>

5. A private attribute having the type of the class and a class method to get the attribute value.

<blockquote class="spoiler">
That's <code>Singleton</code> pattern.
</blockquote>

6. In `Java`, `Collection<E>` defines a method `Iterator<E> iterator()` allowing to iterate concrete collections.

<blockquote class="spoiler">
That's the <code>Iterator</code> pattern. But I have some doubts because, for me, this may also be the

* <code>Factory</code> pattern (since we are creating concrete iterators that are hidden using Iterator class).
* <code>Template method</code> pattern (Collection is an interface)
</blockquote>

<hr class="sr">

## Anti-Patterns

An anti-pattern is something that programmers often do
**yet they shouldn't**. [This website](https://sourcemaking.com/antipatterns/software-development-antipatterns) is a great reference, and they are providing better explanations (if you got the time to read them).

* **Spaghetti Code** 🍝

Little to no modularity. In Java, writing a lot of methods in one class, adding on top of that inner/locale/nested classes make the code almost unreadable for me. Same for people who are putting everything in one python script.

* **Magic Numbers and Strings** ✨

One of the most used anti-pattern. Programmers tend to write a lot of numbers/strings inside the code, but they are unnamed and should be stored inside a named constant, so we understand what this value is supposed to be. In some languages, you may be able to use named parameters that are convenient when you are only using a value once.

* **Golden Hammer** 🔨

You are using things you are confident in because that's easier, even though you know that this may not be the right thing to do. I did that a lot, like writing code in Java taking hundred of lines because I know how to do a lot of things in Java even though I know I could use other languages like Python for what I wanted to do.

* **Boat Anchor** ⚓

You coded something for later but didn't need it yet, YAGNI principle, You Ain't Gonna Need It.

* **God Object/Class or "The Blob"** ⛪

If you are using an object in too many parts of your code, then maybe his class is doing too much. If you got a class having a lot of dependencies, then that may be the case. This is also the case when a class is dealing with every process while the others are only storing data. **SOLUTION**: you should use an object-oriented architecture, methods related to an object must be inside his class.

* **Premature Optimization** 🐣

Focusing too much on optimization without having a proper understanding of what you are trying to optimize. This may increase a lot the complexity of the code for almost nothing.

* **Cut-and-Paste Programming** 📝

Do not copy/paste code from one part of your code to another part. Factorizing your code, using a function, will help to patch all the bugs for this code at once, and make things more readable.

* **Lava Flow/Dead code** 🔥

Someone coded something, without any documentation/clear architecture/..., and left. Now, the new maintainer doesn't dare to change the code since he's scared to break something. This might prevent you from updating to new versions... **SOLUTION**: document your code. Set up rules/guidelines/clear architecture/etc. before starting and stick to them.

<hr class="sl">

## GRASP

GRASP is an acronym for the General Responsibility Assignment Software Patterns.

* **Polymorphism**: if you're checking the type of a class before calling a method, then you should check if this method should not be in an abstract class/interface that you should extend.
* **Creator**: you should look for who should create an object.
  * if there is no Wheel without Car, then Car is creating Wheel
* **Information expert**: which class should we ask if we want to know something about an object?
  * if you have a list of something in the class A, then A should be the class you'll ask if you want information about elements of the list
* **Pure Fabrication**: Sometimes, you don't know where to put a functionality. Simply create a new class+interface.
* **Controller**: deal with the UI and delegates the request to other classes.
* **Low Coupling**: Your classes are isolated. 
  * The coupling is low when you can change a class without impacting other classes.
* **High Cohesion**: how much related are our classes?
  * if they have the same goal/logic/inheriting/extending the same classes, then there is high cohesion
  * if they are related, then you should handle them together (use interfaces, abstract classes, ...)
* **Indirection**: use a mediator, an intermediary class, to decrease the coupling between classes
* **Protected Variations**: you should look for potentials changes and make things easier if this change were to happen.