# Design Patterns

<div class="row row-cols-lg-2"><div>

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

<div class="row row-cols-lg-2"><div>

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
* [State](behavioral/state.md): change objects' behavior according to their state
* `Strategy`: create a family of interchangeable objects
* [Mediator](behavioral/mediator.md): encapsulate the access to objects behind a mediator
* [Visitor](behavioral/visitor.md): execute different code according to the visitor

<br>

#### Architectural 🏘️

Architectural design patterns aren't official patterns. 

* `Model–view–controller` (MVC)
* `Data access object` (DAO)
</div></div>

<hr class="sep-both">

## Anti-Patterns

<div class="row row-cols-lg-2"><div>

Anti-Patterns are well-known bad practices used by programmers  and that should be avoided 💀.

#### Spaghetti Code 🍝

The lack of proper reflection before writing code is leading to poorly organized and unstructured code. It may be due to the overuse or misuse of some coding patterns, or the lack of knowledge. 

<br>

#### Magic Numbers and Strings ✨

It's quite common to use hard-coded numbers and strings such as `do(42)`, but it's often obscure as to what such values mean. Try to use named arguments or intermediary variable, add documentation, etc.

<br>

#### Golden Hammer 🔨

The solution to one problem is not the solution to all problems. Always try to look for the most appropriate solution, do not blindly use or reuse something <small>(ex: Python each time you need a tool)</small>. 

<br>

#### Premature Optimization 🐣

Don't try to focus on optimization without having a proper understanding of what you are trying to achieve. This increases the complexity of the code for almost no gain.
</div><div>


#### Boat Anchor ⚓

Don't code something "for later". Only code what you need now. See also: YAGNI <small>(You Ain't Gonna Need It)</small> ☠️.

<br>

#### God Object/Class or "The Blob" ⛪

An object is used in way to many classes, e.g. the object in question can't be easily updated as many classes depend on it.

<br>

#### Cut-and-Paste Programming 📝

Do not copy-paste code between files. Factorize your code. It reduces the code to maintain. For instance, we don't have to patch something in multiple files.

<br>

#### Lava Flow/Dead code 🔥

A developer wrote some code and didn't provide any documentation. The maintainers do not know why or its impact on the tool, so they don't dare to edit it or remove it.
</div></div>

<hr class="sep-both">

## 👻 To-do 👻

Stuff that I found, but never read/used yet.

<div class="row row-cols-lg-2"><div>

Creational

* Dependency Injection
* Lazy initialization

Structual

* Delegation
* Flyweight
</div><div>

Behavioral

* Template method
</div></div>