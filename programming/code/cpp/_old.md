# Structures and Classes

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

<hr>

## Static

* **You can use static members inside static functions** 🧐
* **You can use static members inside non-static functions** (methods)
* **You can't use instance members ("this") inside static functions** (=not "this" inside a function)

> You can call static members from an instance like `obj.static_member`, but this is **not** advised. **We are using the class with `::`**.

```cpp
struct manager {
public:
    // use static in non-static method ok
    manager() { number_of_instances++; }
    ~manager() { number_of_instances--; }
    static int get_number_of_instances() { return number_of_instances; };
};
```