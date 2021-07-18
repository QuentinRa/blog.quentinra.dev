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
* **actors**: only one here, the Client, 
  those that interact with the system.
  Note that they are not persons but roles.
* **use cases**: "Order", "Eat", "Checkout". 
  What your actors can do in/with the system.
* **association**: link the actors with the use cases.

A system can be an actor in another system. Let's say
a shop is interacting with a factory. If the factory
is the system, then the shop is an actor. Using that
you can split a big use case diagram into a bunch
of smaller ones.

<hr class="sr">

## Generalisation between actors

Let's says you got a regular user and a logged user
for the system "website". A logged user may be able to
do all of the regular user use cases and even more. You
can factorize this with inheritance.

![](images/u-HqA2v9B2efpStXukIqyibFJqzDKGWjJYsoKaWiLd1CoStC0qa4fQQNvYGMGMLiQdHruN8EgNafGEq0.png)

This is called Generalisation and not inheritance (
or ``Héritage`` in French) since inheritance isn't
a UML concept but an implementation one.

<hr class="sr">

## Use case associations

You can link use cases between themselves but DO REMEMBER
that you are not allowed to link use cases if it's
temporal like

* if the user is connected (=login)
* then he can see his/her profile (=seeProfile)

``login`` and ``seeProfile`` won't be linked together.
``login`` will be directly linked to an actor "RegularUser"
and ``seeProfile`` will also be directly linked to another
actor called "LoggedUser".

Aside from that, a use case can be linked with another
one by

* **a generalization**: if a use case generalize another
  then that means that we could use the use case
  OR any other generalizing this use case.
* **inclusion**: if an use case is **always**
  calling another one (like a method **always** calling another one)
* **extension**: a use case may call another one

![](images/NOyn3eCm34Ndz1H_X84UWA6Y1-ZKNi1AN8W82Gf655MzUqsHEZ1OilzxbcLZcaaeopo4ap61dm99oBxj.png)

A custom interacting with an ATM

* **may** ask for help (extension)
* **must** input his/her code