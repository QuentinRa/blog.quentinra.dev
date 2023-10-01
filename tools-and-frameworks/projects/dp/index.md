# Design Patterns

<div class="row row-cols-md-2"><div>

Design patterns are typical solutions used to solve recurring problems in software design 🌺. The initiative was started by the **Gang Of Four**. It was completed [GRASP patterns](https://en.wikipedia.org/wiki/GRASP_(object-oriented_design)) and [Anti-Patterns](https://en.wikipedia.org/wiki/Anti-pattern).

There are 4 great categories of design patterns:

* **Creational** 📚: how to create objects
* **Structural** 🗃️: how to structure your code
* **Behavioral** 📮: how to make the interactions between objects
* **Architectural** 🏘️: how to think your code
</div><div>

**Where to learn?** 🎓

* [GofPattern](https://www.gofpattern.com/index.php) <small>(⛪)</small>
* [SourceMaking](https://sourcemaking.com/design_patterns) <small>(🐲)</small>
* [RefactoringGuru](https://refactoring.guru/design-patterns) <small>(👻)</small>
* [WikiBooks](https://en.wikibooks.org/wiki/Introduction_to_Software_Engineering/Architecture/Design_Patterns) <small>(👻)</small>
* ...

Others: [Java Design Patterns](https://java-design-patterns.com/) + [GitHub Code](https://github.com/iluwatar/java-design-patterns).
</div></div>

<hr class="sep-both">

## Common Design Patterns

<div class="row row-cols-md-2"><div>

#### Creational 📚

Creational patterns focus on object creation mechanisms. It's assumed you already know about [objects and classes](/programming-languages/_paradigm/oo.md#classes-and-objects).

* [Factory](creational/factory.md): control how/which instances are created
* [AbstractFactory](creational/abstract.md): control how/which factories are created
* [Singleton](creational/singleton.md): only allow one instance of a class <small>(at a time)</small>
* [Multiton](creational/multiton.md): only allow n instances of a class at a time
* [Prototype](creational/prototype.md): reuse an object by cloning it when calling the constructor is costly
* [Builder](creational/builder.md): create complex objects step-by-step
* [Object Pool](creational/pool.md): shared reusable instances

<br>

#### Structural 🗃️

Structural patterns focus on how objects are composed and how to manage relationships between objects.

* [Adapter](structural/adapter.md): 'adapt' a class to fit the client needs
* [Facade](structural/facade.md): create a simplified interface to complex codebase
* [Composite](structural/composite.md): uniformize the code for individual objects and composition of objects <small>(e.g., a group of individual objects)</small>
* [Bridge](structural/bridge.md): separate object abstraction and its implementation
* [Decorator](structural/decorator.md): add a custom behavior to an existing class
* `Proxy`: access another object from an intermediary
</div><div>

#### Behavioral 📮

Behavioral patterns focus on how objects communicate and interact with other objects.

* `Chain of Responsibility`: a client requests something. We create a chain of classes to ask if they can do it.
* [Iterator](behavioral/iterator.md): iterate an unknown group of objects
* [Observable](behavioral/observable.md): monitor objects changes and dispatch events
* [Memento](behavioral/memento.md): save and restore object states
* [NullObject](behavioral/nullobject.md): handle "null" objects nicely
* [Command](behavioral/command.md): encapsulate commands/requests/actions as an object
* [Interpreter](behavioral/interpreter.md): write an interpreter for a language

<br>

#### Architectural 🏘️

XXX

* MVC
* DAO
</div></div>


<hr class="sep-both">

## 👻 To-do 👻

Stuff that I found, but never read/used yet.

<div class="row row-cols-md-2"><div>

* [_old](_old/index.md)

Creational

* Dependency Injection
* Lazy initialization

Structual

* Delegation
* Flyweight
</div><div>
</div></div>