# C++ (cplusplus)

The **C++** (**cplusplus**) appeared around 1985, inspired from ADA, CLU. It inspired many languages such as C#, Java, Lua, PHP, and Python. It's a **low-level language**, **fast** and **platform-independent**, **that have object-oriented features** such as constructors, inheritance, methods, objects, polymorphism, and overloading.

* overloading methods
* namespaces
* improved structures, classes

<hr class="sr">

## Functions

A function is a block of code.

<details class="details-e">
<summary>Default values</summary>

We can give **default values** to parameters. If a parameter got a default value, then every following parameter must have a default value

```cpp
void abc(int a, int b=1, float c=2.0f) { /* ... */ }
```

> **Default values** are only given in the declaration (header), and **not** in the implementation (source). <br>
> This is do not take into account functions that are not in a header.

</details>

<details class="details-e">
<summary>Overload</summary>

We can **overload** (`surcharger`) a function, meaning that we can write functions with the same name but ...

* **Taking into account that**
  * The return type does not matter
  * The names of the arguments do no matters
* **You can create functions with the same name**
  * with more/fewer arguments
  * with arguments having different types
  * const or not const (see structures and classes)

```cpp
void f(int a, int b) { /* ... */ }
void f(int a, int b, int c) { /* ... */ }
void f(int a, float b) { /* ... */ }
// f(int,int,int) is included in this one
// => "problem" (declaration ok, but we can't call f with with 3 integers)
void f(int a, int b, int c, int d = 0) { /* ... */ }
```
</details>

<details class="details-e">
<summary>References</summary>

Just for the "syntax", but this is the same as for any other type.

```cpp
void f(int& f) {}
void f(const int& f) {}
int& f(int& f) {}
const int& f(int& f) {}
const int& f(const int& f) {}
```

</details>

<hr class="sl">

## Namespaces

**Namespaces** (`espaces de noms`) are a great way of **sorting functions, types, global variables, ...** We are usually declaring functions, ... in our header file, inside a namespace. This is allowing us, for instance, to have functions/classes/structures/... with the same name/signature, but because they got a different namespace, then there is no problem.

```cpp
namespace algebra {
	// declare functions, types, global variables, classes, structures
	float truncate = 6;
	
	// or even nested (`espaces de noms imbriqués`) namespaces
	namespace complex_numbers { float truncate = 6; }
}
```

You will use the **scope operator** `::` (`opérateur de résolution de portée`)

```cpp
float v1 = algebra::truncate;
float v2 = algebra::complex_numbers::truncate;
// import one ✨
using algebra::truncate;
// import the whole namespace 🚀
using namespace algebra;
```

<hr class="sl">

## Structures and Classes

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