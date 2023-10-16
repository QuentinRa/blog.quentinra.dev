# Code guidelines

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