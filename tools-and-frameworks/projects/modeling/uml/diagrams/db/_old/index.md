# Constraints and OCL

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