# C++ programming

<div class="row row-cols-md-2"><div>

The C++ programming language is a middle-level language that is built on top of the [C](/programming-languages/low-level/c/general/index.md) ([compatibility](https://en.wikipedia.org/wiki/Compatibility_of_C_and_C%2B%2B;)), with additional features.

You will create a file with the `.cpp` extension, for instance, `main.cpp`

```cpp
#include <iostream>

int main() {
    std::cout << "Hello World" << std::endl;
}
```

➡️ You can use `.cc` too and `.hpp` for headers <small>(see [.h or .hpp](https://stackoverflow.com/questions/152555/h-or-hpp-for-your-class-definitions), [.ii, .tpp...](https://includestdio.com/6422.html))</small>.
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

*This assumes that you're already familiar with the C language.*

<div class="row row-cols-md-2 mt-4"><div>

#### Declare a variable

C++ added constructors on top of what you can do in C.

```cpp
int a; // implicit default constructor
int a(); // explicit default constructor
int a(0); // explicit constructor
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

**Reminder**: in C, the parameters of a function are passed by value. We could use pointers to allow a function to edit a variable from the outer scope. In C++, we could use references instead of pointers.

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

Exceptions are signals that are sent when something unexpected happens, such as an error (ex: `1/0`).

```cpp
try {
    // ✅ std::exception or a subclass
    throw std::exception();
    throw std::runtime_error("some message");
    // ❌ avoid using a string
    throw "xxx";
}
// 👉 you can add a "catch" for each type of exception
catch ( std::exception &e ) { std::cerr << e.what(); }
catch ( const char* msg ) { std::cerr << msg; }
// 👉 catch every kind of exception
catch (...) { std::cerr << "Error: xxx"; }
```

➡️ The signal is propagated upwards until someone catches it. If no one does, then the program crashes.
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

➡️ Default values are only in the declaration (if any), but not in both the implementation and the declaration.

```cpp
// prototype with default values
int& abc(int& a, int b=1, float c=2.0f);
// 👉 no default value
int& abc(int& a, int b, float c) {}
```
</div><div>

#### Overloading

[Overloading](/programming-languages/_paradigm/stuff/overloading.md) (`surchage`) means having multiple functions with the same name, but a different signature.

* ❌ The return type DOES NOT matter
* ❌ The name of the arguments DOES NOT matter

```cpp
int sum(int a, int b);      // ✅ - names are optional
float sum(float, float);    // ✅
double sum(double, double); // ✅
int sum(int b, int a);      // ❌ - same as 1
int sum(float, float);      // ❌ - conflict with 2
int sum(int, int, int);     // ✅
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

`::` is called the **scope operator** (`opérateur de résolution de portée`).
</div></div>

<hr class="sep-both">

## Structures and Classes: Basics

<div class="row row-cols-md-2"><div>

In C++, structures were enhanced and are now similar to the newly introduced [classes](/programming-languages/_paradigm/oo.md#classes-and-objects), with one exception 🎯: members <small>(attributes and methods)</small> of a structure are public by default, whereas in a class, they are private by default.

We usually use structures for "data classes" <small>(ex: Person)</small>, and classes for everything else <small>(ex: XXXManager, XXXParser...)</small>.

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

We can create public, private, and protected groups in which we will declare attributes and methods.

➡️ You can use the same modifier multiple times to make your declaration clean and tidy.
</div></div>

#### Attributes

See also: [attributes](/programming-languages/_paradigm/oo.md#attributes).

```cpp
struct XXX {
private: // usually private
    float x;
    float y = 1.0; // 👉 default value
    static int ZZZ; // 👉 class attribute
    static const int TTT = 200; // 👉 class constants
};
// 🎯 to initialize a class attribute,
// you must add after the declaration:
int XXX::ZZZ = 0;
```

➡️ Attributes without a default value must be initialized in a constructor, unless they have a default constructor.
</div><div>

#### Methods

See also: [methods](/programming-languages/_paradigm/oo.md#methods).

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

Every class has a public, parameterless [constructor](/programming-languages/_paradigm/oo.md#constructors). called the **default constructor**. Explicitly adding a constructor will delete it.

```cpp
struct XXX {
public:
    XXX() : x(0) {} // explicit default constructor
    XXX(float x, float y) : x(x), y(y) {}
};
```

➡️ Note that when entering the body of the constructor, parameters were already initialized once.

🧼 For an empty constructor with no initialization list, use `XXX() = default;` instead of an empty body.

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

6 methods are available by default in every structure/class

* Default, Copy, and Move Constructor<sup>1</sup>
* Move assignment operator (`opérateur de mouvement`)<sup>1</sup>
* Copy assignment operator (`opérateur =`)

<sup>1</sup> both of them were introduced in C++11.

#### Copy constructor

The default copy constructor copies every attribute using its copy constructor. You should use `= default;` instead of `{}`.

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

#### Operator overload

Every operator is a function, and we can overload them, aside from: `::` <small>(scope resolution)</small>, `.` <small>(dot operator)</small>, `.*`/`->*` <small>(pointer to member)</small>, `:` <small>(ternary operator)</small>, `sizeof`, `typeid`, and every casting operator.

👉 An ideology is to separate operators between

* Internal: modify and returns `*this`
* External: generate a new instance

To use an operator, such as `+=`, you can do `x+=?` or `x.operator+=(?)`...

🎯 Note that the **return value** and the **type** of the operands is **up to you**! Only the number of operands is fixed.

<details class="details-n">
<summary>Internal operators: <code>++</code>, <code>--</code>, <code>+=</code>, <code>-=</code>, <code>*=</code>, <code>/=</code>, <code>=</code>, <code>-</code>, <code>()</code>, <code>[]</code>...</summary>

```cpp
struct XXX {
    int x;
    explicit XXX(int x = 0) : x(x) {}
public:
    // usually returns a value
    int operator++(int v) { return x += v; }
    int operator--(int v) { return x -= v; }
    // ex: XXX yyy = -xxx;
    XXX& operator-() {
        x = -x; 
        return *this;
    }
    // For every other operator
    XXX& operator+=( const XXX& other ) {
        x += other.x; // code specific to +=
        return *this;
    }
};
```
</details>

<details class="details-n">
<summary>External operators: <code>+</code>, <code>-</code>, <code>*</code>, <code>/</code>, <code>&gt;</code>, <code>&gt;=</code>, <code>&lt;</code>, <code>&lt;=</code>, <code>==</code>, <code>!=</code>...</summary>

```cpp
// same code for '-', '*' '/'
XXX operator+( const XXX &a, const XXX &b ) {
    return XXX(a.x + b.x);
}
// same code for '>', '>=', '<', '<='
// '||', '&&', '==', '!='
bool operator>( const XXX &a, const XXX &b ) {
    return a.x > b.x;
}
```

➡️ If you declared operators inside a namespace in a header file, you must use `ns::operator>` to reference `operator>` inside the namespace `ns`.

➡️ Note that by default, `||` has a higher priority than `&&`, but if you overload the operator, it will lose this priority.
</details>

<details class="details-n">
<summary>Stream operators: <code>&lt;&lt;</code>, <code>&gt;&gt;</code></summary>

```cpp
#include <ostream>
std::ostream& operator<<(std::ostream& os, const XXX& xxx);
std::ostream& operator<<(std::ostream& os, const XXX& xxx) {
    os << "XXX{ ";
    os << "x=" << xxx.x;
    os << " }\n";
    return os;
}
```

```cpp
std::cout << XXX(5); // XXX{ x=5 }
```
</details>
</div></div>

<hr class="sep-both">

## Abstraction and inheritance

<div class="row row-cols-md-2 mt-4"><div>

Inheritance (`héritage`) is allowing us to extend another class/struct.

* ➡️ Multiple inheritance is possible, but conflicts must be handled
* ➡️ The inheritance modifier determines how child classes behave

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

➡️ Inside a method, to explicitly access something from the parent such as `xxx` in the example above, use `XXX::xxx` <small>("super" in Java/...)</small>.

➡️ If a class is used in multiple inheritances, you may use `YYY : virtual public XXX` if the class extends two classes with the same parent `XXX`, to avoid problems with duplicates.

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

If the parent calls a `virtual` method, and the child `override` this method, then the method in the child will be called.

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

As a child class inherits everything from its parent, if a method requires the parent class, then we can pass a child class.

```cpp
Parent xxx = Child(); // we can store Child inside Parent
```

⚠️ But **there is a major problem**. Calling any function on `xxx` will always call the function inside the parent! To avoid this, the only trick that I know is to use pointers. 🐛

#### Abstract classes

A class is abstract if there are still abstract methods in it.

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
* [seleborg](http://carl.seleborg.free.fr/cpp/cours/index_cours.html) (sort of online book, french)
* [cppreference](https://en.cppreference.com/w/cpp/language/operators)
* [learncpp](https://www.learncpp.com/)
* [cppbestpractices](https://github.com/cpp-best-practices/cppbestpractices)
* [Cpp-Learning-Materials](https://github.com/JadeMatrix/Cpp-Learning-Materials/blob/master/C%2B%2B%20Learning%20Materials.md)
* [w3schools](https://www.w3schools.com/cpp/default.asp)
* [fluentcpp](https://www.fluentcpp.com/)
* [onlinegdb](https://learn.onlinegdb.com/)
* [microsoft](https://learn.microsoft.com/en-us/cpp/cpp/)
</div><div>

* `(variable.*(&Classe::methode))()` (see [SO](https://stackoverflow.com/questions/6586205/what-are-the-pointer-to-member-operators-and-in-c))
* `[]` and `()` (examples)
* cmath
* nullptr, new, delete
* `getline(cin, string_variable)`/`std::cin`/`std::cerr`
* [placement new](https://stackoverflow.com/questions/222557/what-uses-are-there-for-placement-new/222578#222578)
* ENS course
* [awesome-cpp](https://github.com/fffaraz/awesome-cpp)
* [googlemock](https://github.com/google/googletest/tree/main/googlemock)
* [boost](https://theboostcpplibraries.com)
* `-I/path/to/header -L lib -Z ...`
</div></div>