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

#### Types

Natively, there are not many UML types so most are adding their own types based on what types are defined in the language they target.

* `void` is used for "nothing"
* `int` is used for "a number"
* `float/real/double` is used for "a real"
* `boolean` is used for "a boolean" (true/false)
* `string` is used for "a text"
* ...
</div></div>

<hr class="sep-both">

## Overview

<div class="row row-cols-md-2"><div>

#### Classes

Classes are made both of attributes and methods separated by a line. The name of the class must always start with an uppercase.

#### Attributes

Each attribute must have at least a name and a type. It may have a modifier and a default value.

You can have OCL constraints such as `{final}` right-after the attribute.

<div class="text-center">

![attribute](_uml/attribute.svg)
</div>

* Derived attributes

Derived attributes are attributes whose values is calculated using other attributes. They are usually created for convenience.

<div class="text-center">

![derived attribute UML](_uml/derived.svg)
</div>

* Composite attributes

Composite attributes are attributes composed of multiple attributes. 

<div class="text-center">

![composite attribute UML](_uml/composite.svg)
</div>
</div><div>

#### Operations

Each attribute must have at least a name followed by parenthesis. It may have a modifier, parameters <small>(comma-separated)</small>, and a return type.

⚠️ No return type is NOT the same as `void`.

📝 Methods can be annotated: `<<constructor>>` or `<<destroy>>`.

<div class="text-center">

![constructor](_uml/constructor.svg)
</div>
</div></div>

<hr class="sep-both">

## Associations and multiplicity

<div class="row row-cols-md-2"><div>

Associations represent which classes are linked to which other classes.

<div class="text-center">

![association_1](_uml/association_1.svg)&nbsp;&nbsp;&nbsp;
![association_2](_uml/association_2.svg)
</div>

Associations are not necessarily representing attributes while most do.

* There could be multiple associations between two classes
* You can add arrows if the association is unidirectional. By default, there is no associations meaning it's bidirectional.
* An association from the class to itself is called self association

<br>

#### Multiplicity

The multiplicity indicates how many instances of a class are associated with instances of another class.

* There are **a..b** instances of **B** associated with **A**.
* There are **c..d** instances of **A** associated with **B**.

<div class="text-center">

![association](_uml/association.svg)
</div>

<details class="details-e">
<summary>List of possible values</summary>

* <kbd>n</kbd>: same as <kbd>n..n</kbd>
* <kbd>*</kbd>: same as <kbd>0..\*</kbd>
* <kbd>0..1</kbd>: 0 or 1
* <kbd>0..*</kbd>: same as <kbd>\*</kbd>
* <kbd>1..*</kbd>: 1 or more
* <kbd>n..*</kbd>: <kbd>n</kbd> or more
* <kbd>n..m</kbd>: at least <kbd>n</kbd>, and up to <kbd>m</kbd>
* <kbd>n..n</kbd>: exactly <kbd>n</kbd>

For instance, we could replace <kbd>a..b</kbd> with <kbd>0..1</kbd> <small>(meaning 0 or 1)</small> or with <kbd>*</kbd> (0 or more).
</details>
</div><div>

#### Association classes

Association classes are used to represent a relationship with additional attributes. The name of the class is the same of the relationship.

![assos_class](_uml/assos_class.svg)

For instance, `Class1` could be a Student, `Class2` a course, and we could have an association class `Enrollment` linking the two.

<br>

#### Constraints on associations

It's possible to add constraints on associations, such as two associations being mutually exclusive <small>(e.g. can't have both)</small>.

Link two associations or more with a dotted line and add constraints on it that will be applied on all linked associations.

* **Inclusion** `{IN}/{SUBSET}/{I}`: either all associations exist or none
* **Exclusion** `{X}`: only one may exist
* **Equality/Simultaneity** ``{=}, {AND}, {S}``: all associations must exist
* **Total/Coverage/Inclusive** ``{T}, {OR}``: at least 1 association exist
* **Partition/Exclusive** ``{XT}, {P}, {+}``: only 1 association exist

For the inclusion constraint, we use an arrow instead of a dotted line. If the arrow goes from X to Y, it means that X can only exist if Y exists.

💡 You can also use this syntax to write dynamic constraints, such as `{we can't buy before ordering}`.
</div></div>

<hr class="sep-both">

## Inheritance

<div class="row row-cols-md-2"><div>

#### Generalization

Generalization is quite used to factorize attributes and methods in a "parent" class. Given a class B generalizing A, the class B will have:

* `public` members in A
* `protected` members in A
* members declared in B


<div class="text-center">

![generalization](_uml/generalization.svg)
</div>

⚠️ Commonly, a child/class can only have **one** parent/super class.

<br>

#### Abstract classes

An abstract class is a normal class aside from the fact that we are allowed to have `<<abstract>>` methods. It means that such class won't write the code for the method and declaring that its subclass will.

<div class="text-center">

![abstract](_uml/abstract.svg)
</div>

💡 Classes generalizing an abstract class are abstract too unless they implement the abstract methods.

💡 Use italic and/or `<<abstract>>` to mark abstract methods/classes.

🛣️ It's quite used for generic code. We would create a method: `eat(food: Food)` with `Food` an abstract class. Any instance of a class implementing food can be used with `eat`.
</div><div>

#### Interfaces

There is a limit to abstract classes as we can only inherit from one class <small>(in most languages)</small>. Interfaces are classes only with abstract public methods. You can realize <small>("inherit")</small> multiple interfaces.

➡️ Interfaces can actually have more than methods, such as `class members`, `concrete methods` <small>(`<<default>>` keyword)</small> and `private methods`.

<div class="text-center">

![interface](_uml/interface.svg)

Machine is an interface implemented by `ATM` and used by `Client`.
</div>

There is an alternative design called lollipop representation. `Interface1` is implemented by `Class1` and used by `Class2`.

![interface lollipop](_uml/lollipop.png)
</div></div>

<hr class="sep-both">

## Packages

<div class="row row-cols-md-2"><div>

Packages are used to group and sort classes.
</div><div>

![system](_uml/system.svg)
</div></div>

<hr class="sep-both">

## Special associations

<div class="row row-cols-md-2"><div>

#### Compositions

Composition is a special association for a `1` to `n..m` relationship where a "**part**" class from `n..m` side is managed <small>(created, used, destroyed)</small> by the other "**composite**" class. The part can't exist without the composite.

<div class="text-center">

![composite class UML](_uml/ccomposite.svg)
</div>
</div><div>

#### Aggregations

An aggregation is a special association for a `1` to `n..m` relationship where a "**aggregator**" class from `n..m` side has a superior relationship over "**aggregated**"  classes.

<div class="text-center">

![composite class UML](_uml/aggregate.svg)
</div>
</div></div>

<hr class="sep-both">

## 👻 To-do 👻

Stuff that I found, but never read/used yet.

<div class="row row-cols-md-2"><div>

* [_old](_old/index.md)
</div><div>


</div></div>