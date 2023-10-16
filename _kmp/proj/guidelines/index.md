# Code guidelines

**Separation of concerns (SOC)**: simply separate your code according to what part of the program they are dealing with. This may also us to reuse some parts in another application. For instance, you should not have a class called "UndoAndRedo" or "UndoRedo".

**The Rule of One or Curly’s Law**: a part of your code must do only one thing.

**Rubber duck debugging**: when you got a problem with your code, try explaining it to a rubber duck (`canard en plastique` in French). Sometimes, simply explaining your problem to "someone", helps in solving it. Talk to your rubber duck :)

**Murphy's Law**: "Anything that can go wrong will go wrong.". Don't think "xxx won't do that" and skip some code, because "xxx" will (calling a method using the wrongs parameters, ...).

**Do The Simplest Thing That Could Possibly Work**: Simply write as little as possible, or think about the easiest solution for your problem and code it. You may improve your code later through.

<hr class="sl">

## SOLID

SOLID is an acronym for

* **S (Single)**: Do one thing
* **O (Open/Closed)**: use inheritance to modify a class like
  * if you want to modify, you can
  * but if you want to add a public member, then inherit the class
  * "Open for extension, closed for modification"
* **L (Liskov substitution)**: variables having the type A can store inheritors of A
* **I (Interfaces segregation)**: split big interfaces into a bunch of small ones
* **D (Dependencies inversion)**: create layers using interfaces and abstract classes

This is a bit more complicated and will require knowledge in Oriented-object. You should check [SOLID principles on Wikipedia](https://en.wikipedia.org/wiki/SOLID).

<hr class="sep-both">

## Sources

* <https://en.wikipedia.org/wiki/SOLID>
* <https://www.baeldung.com/solid-principles>
* <https://medium.com/@cramirez92/s-o-l-i-d-the-first-5-priciples-of-object-oriented-design-with-javascript-790f6ac9b9fa>