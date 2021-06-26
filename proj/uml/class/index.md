# Class diagram

[Go back](../index.md)

![](http://www.plantuml.com/plantuml/png/NS-n2i903CRn_PxYuoP572gu59NY8YxYAyGQsugNEtAfuDjRgKDrpEzF8AcoaLeV7kxCcgEWn08Dspwg76Ks7-PER1gfuNzSujPfDg709PwaTKiwhR_1nSkTQuFVzBi3XK0Ub94AvrA14abPOi0M_jI7rBxyo5yR5qRwN3BGQkrTnN8TddW3)

A **Class** is an abstract representation of a concept,
like a person here. We have what we call

* field / attributes (age, name, ...)
* operations (age)

Then when we are giving values to the attributes,
we are creating an instance of the class called
an **object**.

Notes

* Classes start with an uppercase, using CamelCase
  syntax
* Object name is underlined, you can think of this
name as the variable name of the instance of the class
  
<hr class="sr">

## Attributes

Attributes got 

* a visibility
    * **public** (+, read/write for all)
    * **private** (-, read/write only inside the class)
    * **package** (~, read/write for all inside the folder)
    * **protected** (#, same as package, but read/write
      for all classes inheriting this class)
* a name
* a [type](types.md)
* a value (not required)

**Notes**

* if an attributes have a ``/`` before the visibility, 
  that's means it's a **derived attribute** so the value
  is calculated using other attributes.
* an attribute **underlined** is static meaning the
  value and the attribute is shared by all instances
  like the number of persons.