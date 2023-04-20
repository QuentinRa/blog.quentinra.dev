# Visibility

[Go back](../../index.md#vocabulary)

In java, you got 4 modifiers: `public`, `protected`, `private` and `<none>`. None, which is called **package**, is the default modifier. These are basically used to tell Java which classes can use an attribute or a method.

* **public** means that **everyone** can see, use/call this property (method/attribute).

* **private** means that **only your class** can see, use/call this property (method/attribute).

* **protected** means that **only your class, only the children of your class, and those in the same package=folder** can see, use/call this property (method/attribute).

* **package** means that **your class and the ones is the same folder=package** can see, use/call this property (method/attribute).

<hr class="sl">

## In a nutshell

Here a recap for each visibility, who can see elements declared with this visibility.

| modifier | your class | same package=folder | inheritors | anyone else |
|-----------|-----|-----|-----|-----|
| public    |  +  |  +  |  +  |  +  |
| protected |  +  |  +  |  +  |     |
| package (default)   |  +  |  +  |     |     |
| private   |  +  |     |     |     |

For instance, something declared protected can be accessed by

* your class, the one declaring a property protected
* the classes in the same folder (=package)
* and the classes inheriting your class (=inheritors)