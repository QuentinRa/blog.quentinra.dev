# Sequence Diagram

<div class="row row-cols-md-2"><div>

There are two categories of sequence diagrams. They serve a different purpose and have a different scope 🗺️.

The first ones are **System Sequence Diagrams** (SSDs) 🪛. They are used during the early stage of the design. They represent the high-level interactions between actors <small>(ex: a person)</small> and systems <small>(ex: a shop)</small>.

<div class="text-center">

![System Sequence Diagram](_uml/ssd.svg)
</div>
</div><div>

On the other hand, a **Detailed Sequence Diagram** (DSD)is a visual representation of [a use case](../use_case/index.md) with all detailed interactions.

For instance, "Player engages in combat with an enemy character."

<div class="text-center">

![Detailed Sequence Diagram](_uml/dsd.svg)
</div>

💡 When we refer to a "Sequence Diagram", we usually refer to a Detailed Sequence Diagram which may 
</div></div>

<hr class="sep-both">

## Basic Overview

<div class="row row-cols-md-2"><div>

Sequence Diagrams focus on the chronological order interactions among system or actors. They illustrate the **lifetime** of each entity ⏳.

The diagram is read from the top to the bottom, representing time progressing from top to bottom ⌛.

Each **participant** in the sequence can be:

* An actor <small>(refer to [Use Case Diagrams](../use_case/index.md))</small>
* A class <small>(refer to [Class Diagrams](../class/index.md))</small>
* An object <small>(refer to [Object Diagrams](../object/index.md))</small>
* ...

This is determined by the level of abstraction needed. Below, we have an object diagram with two instances of `Person`.

<div class="text-center">

![Sequence Diagram Object Participants](_uml/obj.svg)
</div>

The vertical dotted line is what we call a **lifetime**.
</div><div>

The interactions between participants are called **messages** 📮. You can view as the same as `function` calls.

The arrow represents a message <small>(ex: a function call)</small> 📤. The rectangle is called **activation bar** and means tha participant is active <small>(ex: executing our function)</small>. The arrow with a dotted line is the reply 📩 <small>(ex: return xxx)</small>.

<div class="text-center">

![Sequence Diagram Message](_uml/msg.svg)
</div>
</div></div>

<hr class="sep-both">

## 👻 To-do 👻

Stuff that I found, but never read/used yet.

<div class="row row-cols-md-2"><div>

* [_old](_old.md)
</div><div>
</div></div>