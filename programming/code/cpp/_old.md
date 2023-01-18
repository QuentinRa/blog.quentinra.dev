# Structures and Classes

Now, we can declare both fields (**attributes**) and functions (**methods**) in a **structure**. When we are creating a new instance, we are creating what we call an **object** or **instance**.

```cpp
struct my_structure {
    int attribute;
    void my_method() {};
    void my_method2() {};
};

my_structure object;
object.attribute = 5;
object.my_method();
```

* [Visibility](class/visibility.md)
* Members
  * [Attributes](class/attributes.md)
  * [Methods](class/methods.md)
* [Static](class/static.md)
* 6 methods available in every structure/class
  * [Constructors](class/constructors.md): Constructor, Copy Constructor, and Move Constructor (C++11)
  * [Destructor](class/destructor.md)
  * move assignment operator (`opérateur de mouvement`, C++11)
  * copy assignment operator (`opérateur =`)
* [Inheritance](class/inheritance.md)
* [Abstract classes](class/abstract.md)
* [Operators](class/operators.md)

> **A class is a structure, but its members are private by default**. **Simply replace struct with class**. There is no other difference, so you may use whichever you want. I will follow what some folks are doing. If my structure is complex, then I will use a class, otherwise if it's like a record in Java, something with some methods, but mainly used to store data, then I will use a structure. **Structures are mainly here for backward compatibility with C** after all.