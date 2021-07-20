# Class diagram

[Go back](../index.md)

![](images/NS-n2i903CRn_PxYuoP572gu59NY8YxYAyGQsugNEtAfuDjRgKDrpEzF8AcoaLeV7kxCcgEWn08Dspwg76Ks7-PER1gfuNzSujPfDg709PwaTKiwhR_1nSkTQuFVzBi3XK0Ub94AvrA14abPOi0M_jI7rBxyo5yR5qRwN3BGQkrTnN8TddW3.png)

A **Class** is an abstract representation of a concept,
like a person here. We have what we call

* field / attributes (age, name, ...)
* operations (age)

When we are giving values to our attributes,
we are creating an **instance** of the class called
an **object**.

Notes

* Classes start with an uppercase, using CamelCase
  syntax <span class="tms">(upperCamelCase)</span>
* Object name is <u>underlined</u>, you can think of this
name as the **variable name** storing this object
  
<hr class="sr">

## Attributes

Attributes got 

* a visibility
    * **public** (+, read/write for all, default)
    * **private** (-, read/write only inside the class)
    * **package** (~, read/write for all inside the folder)
    * **protected** (#, same as package, but read/write
      for all classes inheriting this class)
* a name
* a [type](types.md)
* a value (not required)

**Notes**

* if attributes have a ``/`` before the visibility, 
  that means it's a **derived attribute** so the value
  is calculated using other attributes.
* an attribute **underlined** is static meaning the
  value and the attribute is shared by all instances
  and belongs to the class
* a constant is usually static, I'm doing that
  by adding a ``{final}`` after the type in StarUML

![](images/SoWkIImgAStDuUBaTCv9B2wsKiZCAr5mZ7VszmiESVGBKR1Li5IeJilCIyof1QfnICrB0Qe60000.png)

* **composite attributes** are attributes made of more
  attributes. I have only seen that used in JavaScript since
  you can create object that do not have a class
  
![](images/u-HqA2v9B2efpStXukHCpaaiBbPm1f6f2jL00SxgjCpKd9HQXUJyt8ByuioIL8N4afAYpAHI8CiAMO4kMCBGIg6aiY0LKy88Ag70oLaBb7L8pKi1MWa0.png)

<hr class="sl">

## Operations

An operation is the UML name for a method/function. You
will have

* a visibility
* a function name (usually in lowerCamelCase)
* some arguments
  * separated by a comma
  * name:type
* a return type <span class="tms">(none isn't the same as void, like
  for a Java constructor)</span>

**Ex**: ``+ getName() : String`` is
a public operation getName taking no arguments
and returning a String.

**Notes**

* If your method is creating / destroying objects,
  then you should add `<<constructor>>`/``<<create>>``
  and ``<<destroy>>`` after the visibility
* an operation **underlined** is static

<hr class="sr">

## Associations and multiplicity

Now that you can write a class and add some
attributes / operations, then we will look at relationships 
defined by what we call associations.
An association is a representation of a link between
two classes. We usually write a multiplicity n..m characterizing how many instances of the classes
are linked with how many of the other classes and a name
to remember what kind of links it is.

![](images/Syv9B2vsL53AKr1IqDLLKCe5qiuWCIS5Ao0pBp4tLGa0.png)

* [Multiplicity](content/multiplicity.md)
* [association classes](content/association-classes.md)
* an association from A to A is called
  self association or ``association réflexive``
  in French
* you can add a direction
* name isn't required
* you can have multiples associations between 2 classes

And sometimes you may declare an attribute having the type
of another class inside your diagram. Some programmers
are adding the attribute on the association rather than
inside the class but not everyone do this.

<hr class="sl">

## Advanced associations

You are gonna use the generalization a lot to factorize
your code logic, but aggregation/compositions are not really
helpful.

* [generalization](content/generalization.md)
* [generalization - interfaces](content/interfaces.md)
* [generalization - abstract classes](content/abstract-classes.md)
* [aggregations](content/aggregations.md)
* [compositions](content/compositions.md)
* [multi-classes associations](content/multi-classes.md)

<hr class="sr">

## Packages

You can group classes by packages (=folders) to make something
cleaner. Usually a package name is a path name
starting from the project folder package name
using ``.`` as folder separator. You will usually
see names like ``net.sourceforge.plantuml`` for
``net/sourceforge/plantuml/`` folder.

![](images/u-HoA2v9B2efpStXuYf8JCvEJ4zLK7BEIImkpanMSCxFoKbDBidCpojMKb1s0GE5QYu51V-aBA2uWasDhgw2Or5HOgLFPd49Lot2YBpK4htY_DAYvDIq_ABqLBs2dCGya2KOkbrIS_CDWM9WMa4B8c04CieXDIy5g0C0.png)