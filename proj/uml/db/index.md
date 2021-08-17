# Database diagram

[Go back](../index.md)

A database diagram is a simplified **class diagram**
with some minor changes. If you don't
understand this diagram (aside
from the underlined attribute)

![person-job](images/SoWkIImgAStDuKhEIImkLWX8BIhEprEevbAmARNBJB5IoCmhuLB8IynDjL88BYdAp4ldgkM2Ab8oqDFJKb1IqDE3CxtoanIi5ChpYxAv75BpKe3c0W00.png)

Then you will have to learn about these before starting

* what's are classes and attributes
* what's are associations and multiplicity
* what's generalization (~=inheritance)

<hr class="sl">

## The differences with the class diagram

There are some things you should note before
we continue

* everything is public so we don't care about visibility
* you will rarely use operations, even if they are allowed
* you may use abstract classes / interfaces / constraints etc.
* an **underlined** attribute
  **do not means static**
  but that means that the attribute is
  a **key** (explained later)
* a ``#`` before an attribute **do not means protected**
  (visibility) but that means that the attribute is
  a **key** (explained later)

<hr class="sl">

## Keys

Each class MUST have a **key** (don't forget to add one).
This is an attribute which is taking **unique**, and
**non-null** values. This is usually used to reference
an object.

* **Key** (``Identifiant/discriminant``)

You will write **#** and/or **underline** 
the attribute that is the key.
You may have more than one attribute, and if that's the
case then the unique constraint is not applied to
each attribute of the key but all of them.

Usually, we are not using key (`clef`)
but identifier (``identifiant``),
because a key is the implementation of an identifier.

* **Candidate key** (``Identifiant candidat``)

A candidate to be the key, this attribute will also
have unique values but won't be used as the key or
as a part of it. A candidate key is preceded by a star `*`.

* **Artificial key** (`Identifiant artificiel`)

The most used kind of key. The key is generated
automatically when you add a new element. It's
represented by a star inside a circle ``⊛``.

![artificial key](images/SoWkIImgAStDuKhEIImkLWX8BIhEprEevb9ur3LR8JF5IY4phuHB8IynDzLA8RYaA3CldQkM2wfAoK1FJqj1IK5F3yxqoazIi58epo_Avd98pKi16Wm0.png)

<hr class="sl">

## Constraints and OCL

You can also do that in "class diagrams" but it's more
used in database diagrams through it's almost never used.

We call integrity constraints the constraints applied
on an attribute like

* the type
* the multiplicity (if it's an array otherwise it's 1)
* properties like an interval of values allowed=Domain,
  a format, ...
* properties like unique etc.

It's quite simple, right after your attribute
declaration, write ``{...}`` with ``...`` a condition using
OCL language like ``>=60``. If the condition
is applied on multiple attributes then you will
add the condition using ``{}`` on the class.

You can also add conditions on associations.

You may

* check [OCL on Wikipedia](https://en.wikipedia.org/wiki/Object_Constraint_Language)
* use [this CheatSheet](https://scribetools.readthedocs.io/en/latest/_downloads/UMLOCL-CheatSheet-18.pdf).