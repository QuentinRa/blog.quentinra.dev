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
int a; // implicit default constructor
int a(); // explicit default constructor
int a(0); // implicit constructor
int a = 0; // implicit constructor
int a = int(0); // explicit constructor
```

#### Types

<p></p>

```cpp
bool xxx = false; // new type for booleans
bool yyy = true;
std::string str = "xxx"; // new type for strings
```

#### Conversions

Instead of using casting, we usually use:

```cpp
int xxx = int('c'); // the constructor (if any)
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

## Structures and Classes: Basics

<div class="row row-cols-md-2"><div>

In C++, structures were enhanced, and are the same as the newly introduced classes, aside from one exception 🎯: members <small>(attributes/methods)</small> are public <small>(by default)</small> in a structure, while in a class, they are private <small>(by default)</small>.

➡️ We usually use structures for "data classes" <small>(ex: Person)</small>, and classes for everything else <small>(ex: XXXManager, XXXParser...)</small>.

```cpp
struct XXX {
private:
    int xxx;
public:
    XXX() = default;
    explicit XXX(int xxx) : xxx(xxx) {}
public:
    int yyy() { return xxx++; };
    int zzz() const { return xxx; };
};

int main() {
    XXX x; // implicit XXX()
    std::cout << x.yyy() << "\n"; // 0
    std::cout << x.zzz() << "\n"; // 1
    const XXX y(10); // explicit XXX(int)
    std::cout << y.zzz() << "\n"; // 10
}
```

#### Visibility

<div class="row row-cols-md-2"><div>

```
struct XXX {
public:
    /* ... */
public:
    /* ... */
private:
    /* ... */
}
```
</div><div>

We can create public, private, and protected groups in which we will declare attribute and methods.

➡️ You can use multiple times the same modifier to make your declaration clean and tidy.
</div></div>

#### Attributes

```cpp
struct XXX {
private: // usually private
    float x;
    float y = 1.0; // 👉 default value
    static int ZZZ; // 👉 class attribute
    static const int TTT = 200; // 👉 class constant
};
// 🎯 to initialize a class attribute,
// you must add after the declaration:
int XXX::ZZZ = 0;
```

➡️ Attributes without a default values must be initialized in a constructor, unless they have a default constructor.
</div><div>

#### Methods

```cpp
struct XXX {
public:
    void aaa(float x_) { x = x_; } // inline getter
    float bbb() const { return x; } // inline setter
    void ccc(); // external method
    inline void ddd(); // inline method
    static void eee() { std::cout << XXX::TTT; } // static
};

// implementations
void XXX::ccc() { std::cout << x; }
void XXX::ddd() { std::cout << x; }
```

➡️ `this->x` or `x` are the same: both reference the attribute `x`.

➡️ Methods must be marked as `const` to be called from `const` variables. Normal variables can call `const` methods too.

➡️ Methods with a body inside the class are implicitly `inline`. Inline methods increase the size of the structure, but they are faster.

#### Constructors

Every class has a public, parameterless constructor called **default constructor**. Explicitely adding a constructor will delete it.

```cpp
struct XXX {
public:
    XXX() : x(0) {} // explicit default constructor
    XXX(float x, float y) : x(x), y(y) {}
};
```

➡️ Note that when entering the body of the constructor, parameters were already initialized once.

🧼 For an empty constructors with no initialization list, use `XXX() = default;` instead of an empty body.

🧼 Use `explicit` for constructors with one argument, to avoid implicit casting such as:

<div class="row row-cols-md-2"><div>

```cpp
struct XXX {
    XXX(float x) : x(x) {}
};
```
</div><div>

```cpp
// implicit XXX(float)
XXX xxx = 1.0;
```
</div></div>

#### Destructors

A destructor is automatically called when the object is destroyed. They are used to free/... resources allocated by the constructor.

<div class="row row-cols-md-2"><div>

```cpp
struct XXX {
    ~XXX() {}
};
```
</div><div>

```cpp
XXX* xxx = new XXX();
delete xxx;
```
</div></div>

➡️ For an empty destructor, use `~XXX() = default;`.

</div></div>

<hr class="sep-both">

## Structures and Classes: Advanced

<div class="row row-cols-md-2"><div>

6 methods available by default in every structure/class

* Default, Copy, and Move Constructor<sup>1</sup>
* Move assignment operator (`opérateur de mouvement`)<sup>1</sup>
* Copy assignment operator (`opérateur =`)

<sup>1</sup> both of them were introduced in C++11.

#### Copy constructor

The default copy constructor is copying every attribute using their copy constructor. You should use `= default;` instead of `{}`.

<div class="row row-cols-md-2"><div>

```cpp
struct XXX {
public:
    XXX() {}
    XXX(const XXX& xxx) {}
};
```
</div><div>

```cpp
void f(XXX xxx) {}
XXX xxx; // default
XXX yyy = xxx; // copy
XXX zzz(xxx); // copy
XXX ttt = XXX(xxx); // copy
f(xxx); // copy
```
</div></div>
</div><div>

...
</div></div>


<hr class="sep-both">

## Abstraction and inheritance

<div class="row row-cols-md-2 mt-4"><div>

Inheritance (`héritage`) is allowing us to extend another class/struct.

* ➡️ Multiple inheritance is possible, but conflicts must be handled
* ➡️ The inheritance modifier determine how child class behave

#### Inheritance modifier

* **public**: no changes
* **protected**: `public->protected`
* **private**: `public->private`, `protected->private`

```
struct XXX { public: int xxx; };
struct YYY : public XXX {}; // xxx is public
struct ZZZ : protected XXX {}; // xxx is protected
struct TTT : private XXX {}; // xxx is private
```

➡️ Inheritance (by default): `public` for structs and `private` for classes.

➡️ Inside a method, to explicitely access something from the parent such as `xxx` in the example above, use `XXX::xxx` <small>("super" in Java/...)</small>.

➡️ If a class is used in multiple inheritance, you may use `YYY : virtual public XXX` if the class extends two classes with the same parent `XXX`, to avoid problems with duplicates.

#### Constructors and Destructors

First, parent constructors are called, then the child one is called.

```cpp
struct XXX {};
struct YYY {};
struct ZZZ : XXX, YYY { // public inheritance
    ZZZ() : XXX(), YYY() {}
};
```

Destructors are called in the reverse order, from child to parent 🔄.
</div><div>

#### Virtual methods

Use `virtual` to allow the child class to `override` the code of a method declared in the parent class. 

If the parent call a `virtual` method, and the child `override` this method, then the method in the child will be called.

```cpp
struct Parent {
    int x() { return y(); } 
    virtual int y() { return 0; }
};
struct Child : Parent { int y() override { return 1; } };

// Example
Child xxx;
std::cout << xxx.x(); // 1
std::cout << xxx.Parent::x(); // 1
```

⚠️ If there is a non-trivial destructor, you must make it virtual!

#### Liskov Substitution Principle

As a child class inherit everything from it's parent, if a method requires the parent class, then we can pass a child class.

```cpp
Parent xxx = Child(); // we can store Child inside Parent
```

⚠️ But **there is a major problem**. Calling any function on `xxx` will always call the function inside the parent! To avoid this, the only trick that I know is to use pointers. 🐛

#### Abstract classes

A class is abstract is there are still abstract methods in it.

```cpp
struct Parent {
    virtual int x() = 0; // abstract method
};
struct Child : Parent {
    int x() override { return 0; }
};
```
</div></div>

<hr class="sep-both">

## 👻 To-do 👻

Stuff that I found, but never read/used yet.

<div class="row row-cols-md-2"><div>

* [cpp-cheatsheet](https://github.com/mortennobel/cpp-cheatsheet)
* [clang](https://clang.llvm.org/extra/index.html)
</div><div>

* [old.md](_old.md)
</div></div>