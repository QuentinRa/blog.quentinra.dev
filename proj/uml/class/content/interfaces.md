# interfaces

[Go back](../index.md)

As you noted, you can't generalize more than one class.
But if you want to make sure a class have some operations,
then you should use interfaces since a class may implement
many interfaces.

An interface can only have

* ``public static final`` attributes
* ``public methods``
* ``public static methods``
* constructors not allowed

Note that an interface if usually used

* to create an abstract type

```java
Machine machine;
```

Let's say Machine is an interface, it can't be instanced
but we could store inside this variable any object
implementing Machine. We can also call on this object
any methods defined in Machine.

* methods do not have code

Most of the times, methods are empty and it's up to
the class implementing the interface to write the
method code.

You can add a ``<<default>>`` before the method
name is this method can be coded inside the interface
but since the interface do not have attributes, it shouldn't
be something you will do often.

<hr class="sr">

**lollipop interface**

If your interface is empty, you can use
the lollipop interface

![a](../images/lollipop.png)

* class1 is implementing interface1
* class2 is using interface1

<hr class="sl">

**common design**

![](../images/SoWkIImgAStDuKhEIImkLd0CyLN8p2t8ISrDpIifLl1DJCx8p4lbukI4I3ldP0B5WLm8Gq5Fpmv9ZKDgNWhGA000.png)

* ATM is implementing Machine
* Client is using (a) Machine