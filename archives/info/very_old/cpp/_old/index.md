# C++ (cplusplus)

The **C++** (**cplusplus**) appeared around 1985, inspired from ADA, CLU, it's an **extension of the C language** (as the name implies 😂). It inspired many languages such as C#, Java, Lua, PHP, and Python. It's a **low-level language**, **fast** and **platform-independent**, **that have object-oriented features** such as constructors, inheritance, methods, objects, polymorphism, and overloading.

It may look complex at one glance, but if you are friendly with C, then C++ is quite easy to learn, at least from my point of view.

> The current standard of C++ is **C++20**, while `C++23` is coming. The previous major versions are `C++98`, `C++11`, and `C++17`.

<hr class="sl">

## Introduction

C++ is an extension of the C language. Everything that you could do in C, is still working in C++, but you got a whole new bunch of features.

<table class="table border-dark table-striped table-bordered">
<thead><tr><th><b>Source</b><br>.cpp 👍 or .cc</th><th><b>Headers</b><br>.hpp 👍 or .h</th></tr></thead>
<tbody>
<tr>
<td>

You will write your code, meaning the **implementation** of what you declared in your headers.

```cpp
// main.cpp
#include "main.hpp"

int main()
{
	// ...
}
```
</td>
<td>

You will write declarations, meaning the signatures of things <small>(functions, classes, structures, ...)</small>. You may write some code too. It seems to be a good idea to use `.hpp` instead of `.h`, [to differentiate C++ headers with C headers](https://stackoverflow.com/questions/152555/h-or-hpp-for-your-class-definitions).

```cpp
// main.hpp
#ifndef MAIN_HPP
#define MAIN_HPP

// ...

#endif //MAIN_HPP
```
</td>
</tr>
</tbody>
</table>

> To compile your files, you may use `g++` to compile your files, which is working like `gcc` in C.

<hr class="sr">

## What's new in C++

* Comments with `//` (added in C99+ later)
* Cast with `type(value)` (ex: `int(5.0)`)
* Type `bool`
* `for(int i = ...; ... ; ...)` (added in C99+ later)
* references
* overloading methods
* namespaces
* improved structures, classes

<hr class="sl">

## References

A reference is a sort of pointer to a variable. You can modify the reference, which will modify the reference variable, but deleting a reference (ex: `ref = null`) won't destroy the referenced variable. **References** are better than pointer because their size is **constant** (either 32 or 64 bits), so you can save memory 🚀.

```cpp
float my_float = 5.0f;
float& ref_my_float = my_float;
ref_my_float = 6.0;
// both are 6.0
```

If needed, you can declare constant reference, which means you do not need another variable that you will reference

```cpp
const float& ref_my_float = 5.0f;
```

A reference can be converted to const, and both can be dereferenced.

```cpp
int x = 5;
int& y = x; // value to reference
const int& z = y; // ref to const ref
int a = y; // ref to int
int b = z; // const ref to int
y++; // x=y=6 and a=b=5
```

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

<hr class="sr">

## Exceptions

**Exceptions** are **signals** that are **sent when something unexpected happened**. It could be when an error such as `1/0`, or it could be when you want to stop a function (mainly used by functional programmers).

> In C, we were usually, either using the return type <small>(returning -1 if an int)</small>, or using global variables in which an error code was stored.

* **raise an exception**

```cpp
throw "test"; // working but poor pratice (clang rule 15.1)
throw std::runtime_error("some message");
throw std::exception();
throw custom_exception(); // see inheritance, with std::exception
```

* **catch an exception**: the signal is propagated upwards until someone catches it <small>(if none, the program is stopped and the error is shown to the user)</small>.

```cpp
try {
	// some code
	throw std::runtime_error("some message");
	// some code if the exception isn't thrown
} catch ( std::runtime_error &runtime_error ) {
	const char* msg = runtime_error.what();
	// ... print? ...
}
```

You can use a **fallback catch** `catch(...) {}` to catch any exceptions that were not caught in one of the previous catches.

```cpp
try {}
catch (type& n) {} catch (type2& n2) {}
catch(...) {} // fallback
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