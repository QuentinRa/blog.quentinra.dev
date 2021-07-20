# Database diagram

[Go back](../index.md)

A database diagram is a simplified **class diagram**
with some minor changes. If you don't
understand this diagram (aside
from the underlined attribute)

![](images/SoWkIImgAStDuKhEIImkLWX8BIhEprEevbAmARNBJB5IoCmhuLB8IynDjL88BYdAp4ldgkM2Ab8oqDFJKb1IqDE3CxtoanIi5ChpYxAv75BpKe3c0W00.png)

Then read/learn about

* what's a class/attribute
* what's an association and multiplicity
* and read about generalization (~=inheritance)

<hr class="sl">

## Differences with class diagrams

There are some things you should note before
we continue

* everything is public so we don't care about visibility
* you will rarely use operations, but if that's allowed
* you may use abstract classes / interfaces / constraints etc.
* an **underlined** attributes in a **Database diagram**
  if not a static attribute (like in a class diagram),
  that's a **key** (explained later)
* a ``#`` before an attribute **do not means protected**
  (visibility) but that means that the attribute is
  a **key**