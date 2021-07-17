# Use case diagram

[Go back](../index.md)

<p>
The "Use case diagram" 
<span class="tms">
(or "Diagramme de cas d'utilisation / usage" = DCU)
</span>
is a diagram representing the interactions between
</p>

* users
* a system (basically your application)

**Note** that this diagram is not taking into
account the timeline, like you **can't** represent
the fact that an action will be done after another one.
If you think you can then you are doing it wrong. Check
the sequence diagram if you want to take into account
the timeline.

<hr class="sr">

## Introduction

A DCU looks like this

![](images/LOyn2iCm34LdznGYUuQcUmcOpeL23o1irJ5nxIBBK-ZTgq02pI3ulFVv86F6AiZItkbaJAANW1JW62O17vcSn9BLe9F2O5EaB80LWh8FkXa3mODqeZ6gMHIRLibX9UZkx8cxjVwqvuEn4xcvDDdaS90ttFb5-LSlGDzVjv4z3tzvxOsKlNxn0m00.png)

with

* **the system**: the Restaurant
* **an actors**: the Client here, basically those
  that interact with the system. Note that they are
  not persons but roles.
* **use cases**: Order, Eat, Checkout. What your actors
  can do in/with the system.
* **association**: link the actors with the use cases.

A system can be an actor in another system. Let's says
a shop is interacting with a factory. Then if the factory
is the system, then the shop is an actor. Using that
you can split a big use case diagram into a bunch
of smaller ones.