# Database diagram

[Go back](../index.md)

A database diagram is a simplified **class diagram** with some minor changes. If you are looking for a way to create a SQL database or a NoSQL database from the diagram, please refer to the SQL (resp. NoSQL) course.

If you don't understand this diagram (aside from the underlined attribute)

![person-job](images/SoWkIImgAStDuKhEIImkLWX8BIhEprEevbAmARNBJB5IoCmhuLB8IynDjL88BYdAp4ldgkM2Ab8oqDFJKb1IqDE3CxtoanIi5ChpYxAv75BpKe3c0W00.png)

Then you will have to learn about these before starting

* what's are classes and attributes
* what's are associations and multiplicity
* what's a generalization (~=inheritance)

<hr class="sl">

## The differences with the class diagram

There are some things you should note before we continue

* everything is public, so we don't care about visibility
* you will rarely use operations, even if they are allowed
* you may use abstract classes / interfaces / constraints etc.
* an **underlined** attribute **isn't static**, it means that the attribute is a **key** (explained later)
* a ``#`` before an attribute **does not mean protected**  (visibility), it means that the attribute is a **key** (explained later)

<hr class="sl">

## Keys

Each class MUST have a **key** (don't forget to add one). This is an attribute which is taking **unique**, and **non-null** values. This is usually used to reference an object.

* **Key** (``Identifiant/discriminant``)

You will write **#** and/or **underline** the attribute that is the key. You may have more than one attribute, and if that's the case, then the unique constraint is not applied to each attribute of the key, but the key as a whole.

Usually, we should not use the word "key" (`clef`) and use the word "identifier" (``identifiant``) instead, because a key is the implementation of an identifier.

* **Candidate key** (``Identifiant candidat``)

A candidate that could be the key or a part of it, this attribute will have unique and non-null values. A candidate key is preceded by a star `*`.

* **Artificial key** (`Identifiant artificiel`)

The most used kind of key. The key is generated automatically when you add a new element. It's represented by a star inside a circle ``⊛``.

![artificial key](images/SoWkIImgAStDuKhEIImkLWX8BIhEprEevb9ur3LR8JF5IY4phuHB8IynDzLA8RYaA3CldQkM2wfAoK1FJqj1IK5F3yxqoazIi58epo_Avd98pKi16Wm0.png)

<hr class="sl">

## Constraints and OCL

You can also do that in "class diagrams", but it's more used in database diagrams, though it's rarely used.

We call integrity constraints, the constraints applied on an attribute like

* the type
* the cardinality (ex: the size for an array)
* properties like an interval of values allowed (=domain), a format, ...
* properties like "unique" etc.

It's quite simple, right after your attribute declaration, write ``{...}`` with ``...`` a condition using OCL language like ``>=60``.

**Notes**

* If the condition is applied on multiple attributes, then you will add the condition using ``{}`` on the class.
* You can also add conditions on associations.
* check [OCL on Wikipedia](https://en.wikipedia.org/wiki/Object_Constraint_Language)
* use [this CheatSheet](https://scribetools.readthedocs.io/en/latest/_downloads/UMLOCL-CheatSheet-18.pdf).