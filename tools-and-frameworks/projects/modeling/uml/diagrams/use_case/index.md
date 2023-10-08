# Use Case Diagram

<div class="row row-cols-md-2"><div>

A Use Case Diagram is used to visualize the functionality of a **system** 🏠 <small>(ex: a restaurant)</small> from the perspective of its **actors** <small>(ex: a client)</small> 🧑.

<div class="text-center">

![DCU example](_uml/example.svg)
</div>
</div><div>

Each of `Order`, `Checkout` and `Eat` are called **use cases** 🎫 and represent what the **actors** 🧑 can do within the **system** 🏠. The arrows between both are called **associations** 🌿.

An actor can be another system. For instance, the restaurant is interacting with providers, so we will have another diagram with "restaurant" as an actor and "Provider" as a system.

It's not a temporal diagram, e.g., it doesn't represent actions that can be performed after performing another action first.
</div></div>

<hr class="sep-both">

## Associations

<div class="row row-cols-md-2"><div>

Associations are complex. They are only present between the actors and the use cases that the actor "**intends**" to do 📚.

For instance, if a client is trying to withdraw some money but forgets how to so, they will read the help. But, they won't come, read the help, and leave, so there is no association between the client and "help".

![ATM example](_uml/associations.svg)
</div><div>

Associations can be connected to other associations.

* A **extend/extension** B: it means that B may call A

* A **include/inclusion** B: it means that A will call B

Finally, it could be a **generalization**. It means that the user interacts either with the use case or one of the use cases that generalize it.

![Association Generalization](_uml/uc_gen.svg)
</div></div>

<hr class="sep-both">

## Actors

<div class="row row-cols-md-2"><div>

You can create a generalization between actors. It means that the actors inherit all use cases linked to their parents.

<div class="text-center">

![Generalization actors](_uml/actor_gen.svg)
</div>
</div><div>
</div></div>