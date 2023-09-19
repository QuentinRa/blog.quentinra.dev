# Class Diagrams

<div class="row row-cols-md-2"><div>

A class diagram is used to represent the structure of a system. It's mostly used for [object-oriented](/programming-languages/_paradigm/oo.md) modeling.

<div class="text-center">

![class.pu](_uml/class.svg)
</div>

It's abstract and the concrete version is called an [object diagram](../object/index.md). Creating an object from a class is called **instantiation**.
</div><div>

A **class** 🏡 is an abstract representation of a concept, such as a Book or a Person. Each class has:

* **attributes** 🎫: these are the data properties of a class. For instance, a title.
* **operations** 🏭: these are the behaviors that concepts can perform. For instance, from a book, we can get its details <small>(using getDetails)</small>.

There are also **associations** 🛣️ which represent the relationships between concepts (e.g., classes). There are none in the example.
</div></div>

<hr class="sep-both">

## Basics syntax

<div class="row row-cols-md-2"><div>

We use "member" to refer to both attributes and operations.

#### Modifiers

Each member can have a [modifier](/programming-languages/_paradigm/oo.md#access-control) <small>(explicit or not)</small> which is something to limit who can access an attribute or an operation.

* `+` is for public
* `-` is for private
* `~` is for package
* `#` is for protected

<br>

#### Class Members

Class members <small>(a.k.a. `static` members)</small> are attributes and methods that are shared across every instance.

They are commonly used for constants attributes, utilities...

In UML, such members are **underlined** 🌵.
</div><div>

...
</div></div>

<hr class="sep-both">

## Overview

<div class="row row-cols-md-2"><div>

#### Attributes

Each attribute must have at least a name and a type. It may have a modifier and a default value.

You can have OCL constraints such as `{final}` right-after the attribute.

<div class="text-center">

![attribute](_uml/attribute.svg)
</div>
</div><div>

#### Operation

Each attribute must have at least a name followed by parenthesis. It may have a modifier, parameters <small>(comma-separated)</small>, and a return type.

⚠️ No return type is NOT the same as `void`.

📝 Methods can be annotated: `<<constructor>>` or `<<destroy>>`.

<div class="text-center">

![constructor](_uml/constructor.svg)
</div>
</div></div>

<hr class="sep-both">

## 👻 To-do 👻

Stuff that I found, but never read/used yet.

<div class="row row-cols-md-2"><div>

* [_old](_old/index.md)
</div><div>


</div></div>