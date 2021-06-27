# Introduction

You may have read in other courses about

* test-driven, model-driven, ...
* design patterns (and anti-patterns)
* frameworks

Using these, you will use the knowledge, 
experience and the code
improved by a lot of developers before you.
This course is a gathering of programmers principles
that may help you writing your code.

<hr class="sr">

## Me

Here some of my troughs before starting 

* I think your code should be enough **documented**
  so that the programmer don't take hours trying
  to understand what you tried to do, and not too much
  otherwise they may not read it.
* you shouldn't copy-paste code from another part
  of your code
* you should use frameworks or other programmer works
  (if they are still maintained) rather than rewriting
  everything from scratch and increase
    * your workload
    * the complexity of your code
    * the workload of the futures maintainers

<hr class="sl">

## Principles

**Don’t repeat yourself (DRY)**: Do not copy-paste code,
make a function. Otherwise you need to remember that you
will have ``n`` places to patch if you found a bug,
not worth. You should also use constants rather than
writing again and again a value like ``"toto"`` (for
instance) in the code.

**you ain't gonna need it (YAGNI)**: don't write code
unless you need it.

**Keep it simple, stupid (KISS)**: simple code means
less code, easier to debug, easier to modify so don't
make things complicated.

**Code For The Maintainer**: write your code like you
will be the one to maintain it. It's hard to maintain
some unreadable code, isn't it?

<hr class="sr">

## Practices

**Separation of concerns (SOC)**: simply separate your
code according to what part of the program they are
dealing with. This may also us to reuse some parts
in another application.

**The Rule of One or Curly’s Law**: a part of your
code must do only one thing.

**Rubber duck debugging**: when you got a problem with
your code, try explaining it to a rubber duck (
``canard en plastique`` in French). Sometimes, simply
explaining your problem to "someone" helps you solving it.

<hr class="sl">

## SOLID

SOLID is an acronym for

* **S (Single)** : Do one thing
* **O (Open/Closed)** : use inheritance to modify a class
* **L (Liskov substitution)**: variables of type A can be replaced by inheritors A
* **I (Interfaces segregation)**: split big interface into a bunch of small ones
* **D (Dependencies inversion)**: create layers using interfaces and abstract classes

This is a bit more complicated and will require knowledge
in Oriented-object. You should check [Wikipedia](https://en.wikipedia.org/wiki/SOLID).

<hr class="sr">

## Sources

* <https://en.wikipedia.org/wiki/SOLID>
* <https://en.wikipedia.org/wiki/Code_reuse>
* <https://en.wikipedia.org/wiki/GRASP_(object-oriented_design)>
* <https://en.wikipedia.org/wiki/KISS_principle>
* <https://www.baeldung.com/solid-principles>
* <https://medium.com/@cramirez92/s-o-l-i-d-the-first-5-priciples-of-object-oriented-design-with-javascript-790f6ac9b9fa>
* <https://suckless.org/>
* <https://en.wikipedia.org/wiki/Rubber_duck_debugging>
* <http://principles-wiki.net/principles:start>
* <http://principles-wiki.net/start>
* <https://java-design-patterns.com/principles/#keep-things-dry>