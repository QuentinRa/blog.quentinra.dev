# C++ programming

<div class="row row-cols-md-2"><div>

The C++ programming language is a middle-level language which is build on top of the [C](/programming/code/c/index.md), with additional features.

You will create a file with the `.cpp` extension, for instance, `main.cpp`

```cpp
#include <iostream>

int main() {
    std::cout << "Hello World" << std::endl;
}
```

➡️ You can use `.cc` too. For headers, use `.hpp` (see [.h or .hpp](https://stackoverflow.com/questions/152555/h-or-hpp-for-your-class-definitions)).
</div><div>

Then, use `g++` to generate an executable of your program.

```powershell
$ g++ main.cpp -o a.out
```

Then, run your executable with

```powershell
$ ./a.out
Hello World
```

➡️ The current standard of C++ is C++20, C++23 will be released soon, and some famous versions are C++17, C++11, and C++98.
</div></div>

<hr class="sep-both">

## Basics

*This assume that you're already familiar with the language C.*

<div class="row row-cols-md-2 mt-4"><div>

#### Declare a variable

C++ added constructors on top of what you can do in C.

```cpp
int a(0); // implicit constructor
int a = 0; // implicit constructor + '=' operator
int a = int(0); // explicit constructor + '=' operator
```

#### Types

There is a new type called `bool`.

```cpp
bool xxx = false;
bool yyy = true;
```

#### Conversions

Instead of using casting, we usually use:

```cpp
int xxx = int('c'); // the constructor
```
</div><div>

#### References

**Reminder**: in C, parameters of a function are passed by value. We could use pointers to allow a function to edit a variable from the outer scope. In C++, we could use references instead of pointers.

<div class="row row-cols-md-2"><div>

**C** (using a pointer)

```c
void inc(int* v){ (*v)++; }

int a = 0;
int* b = &a;
inc(b); // a == *b == 1
```
</div><div>

**C++** (using a reference)

```cpp
void inc(int& x){ x++; }

int a = 0;
int& b = a;
inc(b); // a == b == 1
```
</div></div>

Constant references cannot be reassigned again, but they work the same as non-constant references.

```cpp
const int& c = a; // a++ => c++ | c++ => a++
const int& xxx = 42; // created from a value
```

#### Print some text in the terminal

```cpp
#include <iostream>
std::cout << "Hello, World" << std::endl;
// you can use variables
std::string name = "World";
std::cout << "Hello " << name << std::endl;
```

➡️ Use `std::cerr` to print errors. We use `std::endl` to add a newline, and flush the buffer (print immediately).

</div></div>

<hr class="sep-both">

## Control-flow structures

<div class="row row-cols-md-2 mt-3"><div>

...
</div><div>

#### Exceptions

Exception* are signals that are sent when something unexpected happened, such as an error (ex: `1/0`).

```cpp
try {
    // 👉 std::exception or a subclass
    throw std::exception();
    throw std::runtime_error("some message");
    // 👉 avoid using a string
    throw "xxx";
}
// 👉 you can chain "catch" for each type of exception
catch ( std::exception &e ) { std::cerr << e.what(); }
catch ( const char* msg ) { std::cerr << msg; }
// 👉 catch every kind of exception
catch (...) { std::cerr << "Error: xxx"; }
```

➡️ The signal is propagated upwards until someone catches it. If no one does, then the program crash.
</div></div>

<hr class="sep-both">

## Functions

<div class="row row-cols-md-2"><div>

#### Default values for parameters

If you give one parameter a default value, any following parameter must have a default value.

```cpp
int& abc(int& a, int b=1, float c=2.0f) {
    /* ... */
    return a;
}
```

➡️ Default values are only if the declaration (if any), but not in both the implementation and the declaration.

```cpp
// prototype with default values
int& abc(int& a, int b=1, float c=2.0f);
// 👉 no default value
int& abc(int& a, int b, float c) {}
```
</div><div>

#### Overloading

Overloading (`surchage`) mean having multiple function with the same name, but a different signature.

* ❌ The return type DOES NOT matter
* ❌ The name of the arguments DOES NOT matter

```cpp
int sum(int a, int b); // ✅ (names are optional)
float sum(float, float); // ✅
double sum(double, double); // ✅
int sum(int b, int a); // ❌ - same as 1
int sum(float, float); // ❌ - same as 2
int sum(int, int, int); // ✅
```

* ✅ The attribute `const` attached to a function DOES matter, but it's only available for classes or structures.

```cpp
struct XXX {
    int xxx();
    int xxx() const; // ✅
};
```
</div></div>

<hr class="sep-both">

## Namespaces

<div class="row row-cols-md-2 mt-3"><div>

**Namespaces** (`espaces de noms`) are the same as packages in other languages. For instance, all functions of the STD are in the namespace `std::`. This allows us to declare functions/classes/... with the same name as one of the STD without causing conflicts.

```cpp
namespace xxx {
    // declare functions, types, global variables, 
    // classes, structures...
    float yyy = 6;
	
    // nested namespaces
    namespace zzz {
        float ttt();
    }
}
```
</div><div>

```
int main() {
    float v1 = xxx::yyy;
    float v2 = xxx::zzz::ttt();
}
```

You can import a namespace, it's a [bad](https://stackoverflow.com/questions/1265039/using-std-Namespace) practice with `std::` through.

```
using xxx::yyy; // import one ✨
using namespace xxx::zzz; // import all 🚀

int main() {
    float v1 = yyy;
    float v2 = ttt();
}
```

`::` is called **scope operator** (`opérateur de résolution de portée`).
</div></div>

<hr class="sep-both">

## Structures and Classes

<div class="row row-cols-md-2"><div>

In C++, structures were enhanced, and are the same as the newly introduced classes, aside from one exception 🎯: members <small>(attributes/methods)</small> are public <small>(by default)</small> in a structure, while in a class, they are private <small>(by default)</small>.

➡️ We usually use structures for "data classes" <small>(ex: Person)</small>, and classes for everything else <small>(ex: XXXManager, XXXParser...)</small>.

```cpp
struct XXX {
private: // a bloc of private members
    int xxx;
public: // a bloc of public members
    XXX() = default; // default constructor
    explicit XXX(int xxx) : xxx(xxx) {} // another
public: // another bloc of public members
    int yyy() { return xxx++; };
    int zzz() const { return xxx; };
};

int main() {
    XXX x = XXX(); // see #Basics
    std::cout << x.yyy() << "\n"; // 0
    std::cout << x.zzz() << "\n"; // 1
    const XXX y(10); // see #Basics
    std::cout << y.zzz() << "\n"; // 10
}
```

#### Attributes

```cpp
struct XXX {
private: // usually private
    float x;
    float y = 1.0; // 👉 default value
    static int ZZZ; // 👉 class attribute
    static const int TTT = 200; // 👉 class constant
};
// 🎯 to initialize a class attribute
// you must do it right-after the declaration
int XXX::ZZZ = 0;
```

➡️ Attributes without a default values must be initialized in a constructor, unless they have a default constructor.
</div><div>

</div></div>

<hr class="sep-both">

## XXX

<div class="row row-cols-md-2"><div>

#### Attributes and constructors

Attributes are variable that are associated with one instance of an object. You can create instance using constructor.

* ✅ They are named after the name of the class
* ✅ They don't have a return type
* ➡️ You **must** initialize the attributes inside the initialization list provided to the constructor, unless they have a default value or a default constructor (`XXX() {}` or `XXX() = default`).
* 👉 Every class a default, public, parameterless constructor, that is destroyed if you add your own constructors.
* 👉 The body of the constructor is used for more refined initialization of parameters, but note that at this point that the parameters were already initialized once as per the point above.
</div><div>

```cpp
struct XXX {
    XXX(float x) : x(x) {} // 👉 empty body
    XXX(float x, float y) : x(x), y(y) {}
private:
    float x;
    float y = 1.0; // 👉 default value
};

int main() {
    XXX zero_one(0);
    XXX one_zero(1, 0);
}
```

* ✨ You should use `explicit XXX(...)` for constructors with one argument, otherwise we can do this:

```cpp
XXX zero_one = 0; // call XXX(float)
```
</div></div>

<hr class="sep-both">

## 👻 To-do 👻

Stuff that I found, but never read/used yet.

<div class="row row-cols-md-2"><div>

* [cpp-cheatsheet](https://github.com/mortennobel/cpp-cheatsheet)
</div><div>

* [old.md](_old.md)
</div></div>