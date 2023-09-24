# Use Case Diagram

<div class="row row-cols-md-2"><div>

An Use Case Diagram is used to visualize the functionality of a **system** 🏠 <small>(ex: a restaurant)</small> from the perspective of its **actors** <small>(ex: a client)</small> 🧑.

<div class="text-center">

![DCU example](_uml/example.svg)
</div>
</div><div>

Each of `Order`, `Checkout` and `Eat` are called **use cases** 🎫 and represent what the **actors** 🧑 can do within the **system** 🏠. The arrows between both are called **associations** 🌿.

An actor can be another system. For instance, the restaurant is interacting with providers, so we will another another diagram with "restaurant" as an actor and "Provider" as a system.

It's not a temporal diagram, e.g., it doesn't represent actions that can be performed after performing another action first.
</div></div>

<hr class="sep-both">

## Associations

<div class="row row-cols-md-2"><div>

Associations are complex. They are only present between the actors and the use cases that the actor "**intends**" to do 📚.

For instance, if a client is trying to withdraw some money but they forgot how to, they will read the help. But, they won't come, read the help, and leave, so there is no association between client and help.

![ATM example](_uml/associations.svg)
</div><div>
</div></div>

<hr class="sep-both">

## 👻 To-do 👻

Stuff that I found, but never read/used yet.

<div class="row row-cols-md-2"><div>

* [_old](_old.md)
</div><div>
</div></div>