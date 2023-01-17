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

## 👻 To-do 👻

Stuff that I found, but never read/used yet.

<div class="row row-cols-md-2"><div>

* [cpp-cheatsheet](https://github.com/mortennobel/cpp-cheatsheet)
</div><div>

* [old.md](_old.md)
</div></div>